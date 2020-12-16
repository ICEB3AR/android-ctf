package box2dLight;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.FrameBuffer;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import shaders.DiffuseShader;
import shaders.Gaussian;
import shaders.ShadowShader;
import shaders.WithoutShadowShader;

/* access modifiers changed from: package-private */
public class LightMap {
    public static final int U1 = 2;
    public static final int U2 = 6;
    public static final int U3 = 10;
    public static final int U4 = 14;
    public static final int V1 = 3;
    public static final int V2 = 7;
    public static final int V3 = 11;
    public static final int V4 = 15;
    public static final int VERT_SIZE = 16;
    public static final int X1 = 0;
    public static final int X2 = 4;
    public static final int X3 = 8;
    public static final int X4 = 12;
    public static final int Y1 = 1;
    public static final int Y2 = 5;
    public static final int Y3 = 9;
    public static final int Y4 = 13;
    private ShaderProgram blurShader;
    private ShaderProgram diffuseShader;
    FrameBuffer frameBuffer;
    boolean lightMapDrawingDisabled;
    private Mesh lightMapMesh;
    private FrameBuffer pingPongBuffer;
    private RayHandler rayHandler;
    private ShaderProgram shadowShader;
    private ShaderProgram withoutShadowShader;

    public void render() {
        boolean z = this.rayHandler.lightRenderedLastFrame > 0;
        if (z && this.rayHandler.blur) {
            gaussianBlur();
        }
        if (!this.lightMapDrawingDisabled) {
            ((Texture) this.frameBuffer.getColorBufferTexture()).bind(0);
            if (this.rayHandler.shadows) {
                Color color = this.rayHandler.ambientLight;
                ShaderProgram shaderProgram = this.shadowShader;
                if (RayHandler.isDiffuse) {
                    shaderProgram = this.diffuseShader;
                    shaderProgram.begin();
                    this.rayHandler.diffuseBlendFunc.apply();
                    shaderProgram.setUniformf("ambient", color.r, color.g, color.b, color.a);
                } else {
                    shaderProgram.begin();
                    this.rayHandler.shadowBlendFunc.apply();
                    shaderProgram.setUniformf("ambient", color.r * color.a, color.g * color.a, color.b * color.a, 1.0f - color.a);
                }
                this.lightMapMesh.render(shaderProgram, 6);
                shaderProgram.end();
            } else if (z) {
                this.rayHandler.simpleBlendFunc.apply();
                this.withoutShadowShader.begin();
                this.lightMapMesh.render(this.withoutShadowShader, 6);
                this.withoutShadowShader.end();
            }
            Gdx.gl20.glDisable(GL20.GL_BLEND);
        }
    }

    public void gaussianBlur() {
        Gdx.gl20.glDisable(GL20.GL_BLEND);
        for (int i = 0; i < this.rayHandler.blurNum; i++) {
            ((Texture) this.frameBuffer.getColorBufferTexture()).bind(0);
            this.pingPongBuffer.begin();
            this.blurShader.begin();
            this.blurShader.setUniformf("dir", 1.0f, 0.0f);
            this.lightMapMesh.render(this.blurShader, 6, 0, 4);
            this.blurShader.end();
            this.pingPongBuffer.end();
            ((Texture) this.pingPongBuffer.getColorBufferTexture()).bind(0);
            this.frameBuffer.begin();
            this.blurShader.begin();
            this.blurShader.setUniformf("dir", 0.0f, 1.0f);
            this.lightMapMesh.render(this.blurShader, 6, 0, 4);
            this.blurShader.end();
            if (this.rayHandler.customViewport) {
                this.frameBuffer.end(this.rayHandler.viewportX, this.rayHandler.viewportY, this.rayHandler.viewportWidth, this.rayHandler.viewportHeight);
            } else {
                this.frameBuffer.end();
            }
        }
        Gdx.gl20.glEnable(GL20.GL_BLEND);
    }

    public LightMap(RayHandler rayHandler2, int i, int i2) {
        this.rayHandler = rayHandler2;
        int i3 = 1;
        i = i <= 0 ? 1 : i;
        i3 = i2 > 0 ? i2 : i3;
        this.frameBuffer = new FrameBuffer(Pixmap.Format.RGBA8888, i, i3, false);
        this.pingPongBuffer = new FrameBuffer(Pixmap.Format.RGBA8888, i, i3, false);
        this.lightMapMesh = createLightMapMesh();
        this.shadowShader = ShadowShader.createShadowShader();
        this.diffuseShader = DiffuseShader.createShadowShader();
        this.withoutShadowShader = WithoutShadowShader.createShadowShader();
        this.blurShader = Gaussian.createBlurShader(i, i3);
    }

    /* access modifiers changed from: package-private */
    public void dispose() {
        this.shadowShader.dispose();
        this.blurShader.dispose();
        this.lightMapMesh.dispose();
        this.frameBuffer.dispose();
        this.pingPongBuffer.dispose();
    }

    private Mesh createLightMapMesh() {
        Mesh mesh = new Mesh(true, 4, 0, new VertexAttribute(1, 2, ShaderProgram.POSITION_ATTRIBUTE), new VertexAttribute(16, 2, ShaderProgram.TEXCOORD_ATTRIBUTE));
        mesh.setVertices(new float[]{-1.0f, -1.0f, 0.0f, 0.0f, 1.0f, -1.0f, 1.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, -1.0f, 1.0f, 0.0f, 1.0f});
        return mesh;
    }
}
