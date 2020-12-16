package box2dLight;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.glutils.FrameBuffer;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.physics.box2d.World;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import java.util.Iterator;
import shaders.LightShader;

public class RayHandler implements Disposable {
    static final float GAMMA_COR = 0.625f;
    static boolean gammaCorrection = false;
    static float gammaCorrectionParameter = 1.0f;
    public static boolean isDiffuse = false;
    final Color ambientLight;
    boolean blur;
    int blurNum;
    final Matrix4 combined;
    boolean culling;
    ShaderProgram customLightShader;
    boolean customViewport;
    public final BlendFunc diffuseBlendFunc;
    final Array<Light> disabledLights;
    final Array<Light> lightList;
    LightMap lightMap;
    int lightRenderedLastFrame;
    final ShaderProgram lightShader;
    public final BlendFunc shadowBlendFunc;
    boolean shadows;
    public final BlendFunc simpleBlendFunc;
    int viewportHeight;
    int viewportWidth;
    int viewportX;
    int viewportY;
    World world;
    float x1;
    float x2;
    float y1;
    float y2;

    /* access modifiers changed from: protected */
    public void updateLightShader() {
    }

    /* access modifiers changed from: protected */
    public void updateLightShaderPerLight(Light light) {
    }

    public RayHandler(World world2) {
        this(world2, Gdx.graphics.getWidth() / 4, Gdx.graphics.getHeight() / 4);
    }

    public RayHandler(World world2, int i, int i2) {
        this.diffuseBlendFunc = new BlendFunc(GL20.GL_DST_COLOR, 0);
        this.shadowBlendFunc = new BlendFunc(1, GL20.GL_ONE_MINUS_SRC_ALPHA);
        this.simpleBlendFunc = new BlendFunc(GL20.GL_SRC_ALPHA, 1);
        this.combined = new Matrix4();
        this.ambientLight = new Color();
        this.lightList = new Array<>(false, 16);
        this.disabledLights = new Array<>(false, 16);
        this.customLightShader = null;
        this.culling = true;
        this.shadows = true;
        this.blur = true;
        this.blurNum = 1;
        this.customViewport = false;
        this.viewportX = 0;
        this.viewportY = 0;
        this.viewportWidth = Gdx.graphics.getWidth();
        this.viewportHeight = Gdx.graphics.getHeight();
        this.lightRenderedLastFrame = 0;
        this.world = world2;
        resizeFBO(i, i2);
        this.lightShader = LightShader.createLightShader();
    }

    public void resizeFBO(int i, int i2) {
        LightMap lightMap2 = this.lightMap;
        if (lightMap2 != null) {
            lightMap2.dispose();
        }
        this.lightMap = new LightMap(this, i, i2);
    }

    public void setCombinedMatrix(OrthographicCamera orthographicCamera) {
        setCombinedMatrix(orthographicCamera.combined, orthographicCamera.position.x, orthographicCamera.position.y, orthographicCamera.zoom * orthographicCamera.viewportWidth, orthographicCamera.viewportHeight * orthographicCamera.zoom);
    }

    @Deprecated
    public void setCombinedMatrix(Matrix4 matrix4) {
        System.arraycopy(matrix4.val, 0, this.combined.val, 0, 16);
        float f = 1.0f / matrix4.val[0];
        float f2 = (-f) * matrix4.val[12];
        this.x1 = f2 - f;
        this.x2 = f2 + f;
        float f3 = 1.0f / matrix4.val[5];
        float f4 = (-f3) * matrix4.val[13];
        this.y1 = f4 - f3;
        this.y2 = f4 + f3;
    }

    public void setCombinedMatrix(Matrix4 matrix4, float f, float f2, float f3, float f4) {
        System.arraycopy(matrix4.val, 0, this.combined.val, 0, 16);
        float f5 = f3 * 0.5f;
        this.x1 = f - f5;
        this.x2 = f + f5;
        float f6 = f4 * 0.5f;
        this.y1 = f2 - f6;
        this.y2 = f2 + f6;
    }

    /* access modifiers changed from: package-private */
    public boolean intersect(float f, float f2, float f3) {
        return this.x1 < f + f3 && this.x2 > f - f3 && this.y1 < f2 + f3 && this.y2 > f2 - f3;
    }

    public void updateAndRender() {
        update();
        render();
    }

    public void update() {
        Iterator<Light> it = this.lightList.iterator();
        while (it.hasNext()) {
            it.next().update();
        }
    }

    public void render() {
        boolean z = false;
        this.lightRenderedLastFrame = 0;
        Gdx.gl.glDepthMask(false);
        Gdx.gl.glEnable(GL20.GL_BLEND);
        this.simpleBlendFunc.apply();
        if (this.shadows || this.blur) {
            z = true;
        }
        if (z) {
            this.lightMap.frameBuffer.begin();
            Gdx.gl.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
            Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
        }
        ShaderProgram shaderProgram = this.customLightShader;
        if (shaderProgram == null) {
            shaderProgram = this.lightShader;
        }
        shaderProgram.begin();
        shaderProgram.setUniformMatrix("u_projTrans", this.combined);
        if (this.customLightShader != null) {
            updateLightShader();
        }
        Iterator<Light> it = this.lightList.iterator();
        while (it.hasNext()) {
            Light next = it.next();
            if (this.customLightShader != null) {
                updateLightShaderPerLight(next);
            }
            next.render();
        }
        shaderProgram.end();
        if (z) {
            if (this.customViewport) {
                this.lightMap.frameBuffer.end(this.viewportX, this.viewportY, this.viewportWidth, this.viewportHeight);
            } else {
                this.lightMap.frameBuffer.end();
            }
            this.lightMap.render();
        }
    }

    public boolean pointAtLight(float f, float f2) {
        Iterator<Light> it = this.lightList.iterator();
        while (it.hasNext()) {
            if (it.next().contains(f, f2)) {
                return true;
            }
        }
        return false;
    }

    public boolean pointAtShadow(float f, float f2) {
        Iterator<Light> it = this.lightList.iterator();
        while (it.hasNext()) {
            if (it.next().contains(f, f2)) {
                return false;
            }
        }
        return true;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        removeAll();
        LightMap lightMap2 = this.lightMap;
        if (lightMap2 != null) {
            lightMap2.dispose();
        }
        ShaderProgram shaderProgram = this.lightShader;
        if (shaderProgram != null) {
            shaderProgram.dispose();
        }
    }

    public void removeAll() {
        Iterator<Light> it = this.lightList.iterator();
        while (it.hasNext()) {
            it.next().dispose();
        }
        this.lightList.clear();
        Iterator<Light> it2 = this.disabledLights.iterator();
        while (it2.hasNext()) {
            it2.next().dispose();
        }
        this.disabledLights.clear();
    }

    public void setLightShader(ShaderProgram shaderProgram) {
        this.customLightShader = shaderProgram;
    }

    public void setCulling(boolean z) {
        this.culling = z;
    }

    public void setBlur(boolean z) {
        this.blur = z;
    }

    public void setBlurNum(int i) {
        this.blurNum = i;
    }

    public void setShadows(boolean z) {
        this.shadows = z;
    }

    public void setAmbientLight(float f) {
        this.ambientLight.a = MathUtils.clamp(f, 0.0f, 1.0f);
    }

    public void setAmbientLight(float f, float f2, float f3, float f4) {
        this.ambientLight.set(f, f2, f3, f4);
    }

    public void setAmbientLight(Color color) {
        this.ambientLight.set(color);
    }

    public void setWorld(World world2) {
        this.world = world2;
    }

    public static boolean getGammaCorrection() {
        return gammaCorrection;
    }

    public static void setGammaCorrection(boolean z) {
        gammaCorrection = z;
        gammaCorrectionParameter = gammaCorrection ? GAMMA_COR : 1.0f;
    }

    public static void useDiffuseLight(boolean z) {
        isDiffuse = z;
    }

    public void useCustomViewport(int i, int i2, int i3, int i4) {
        this.customViewport = true;
        this.viewportX = i;
        this.viewportY = i2;
        this.viewportWidth = i3;
        this.viewportHeight = i4;
    }

    public void useDefaultViewport() {
        this.customViewport = false;
    }

    public void setLightMapRendering(boolean z) {
        this.lightMap.lightMapDrawingDisabled = !z;
    }

    public Texture getLightMapTexture() {
        return (Texture) this.lightMap.frameBuffer.getColorBufferTexture();
    }

    public FrameBuffer getLightMapBuffer() {
        return this.lightMap.frameBuffer;
    }
}
