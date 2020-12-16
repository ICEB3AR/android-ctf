package com.badlogic.gdx.graphics.g3d.shaders;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.Attributes;
import com.badlogic.gdx.graphics.g3d.Environment;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.ColorAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.CubemapAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DepthTestAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DirectionalLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.FloatAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.IntAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.PointLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.SpotLightsAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.environment.AmbientCubemap;
import com.badlogic.gdx.graphics.g3d.environment.DirectionalLight;
import com.badlogic.gdx.graphics.g3d.environment.PointLight;
import com.badlogic.gdx.graphics.g3d.environment.SpotLight;
import com.badlogic.gdx.graphics.g3d.shaders.BaseShader;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class DefaultShader extends BaseShader {
    @Deprecated
    public static int defaultCullFace = GL20.GL_BACK;
    @Deprecated
    public static int defaultDepthFunc = GL20.GL_LEQUAL;
    private static String defaultFragmentShader;
    private static String defaultVertexShader;
    protected static long implementedFlags = ((((BlendingAttribute.Type | TextureAttribute.Diffuse) | ColorAttribute.Diffuse) | ColorAttribute.Specular) | FloatAttribute.Shininess);
    private static final long optionalAttributes = (IntAttribute.CullFace | DepthTestAttribute.Type);
    private static final Attributes tmpAttributes = new Attributes();
    protected final AmbientCubemap ambientCubemap;
    protected final long attributesMask;
    protected final Config config;
    protected int dirLightsColorOffset;
    protected int dirLightsDirectionOffset;
    protected int dirLightsLoc;
    protected int dirLightsSize;
    protected final DirectionalLight[] directionalLights;
    protected final boolean environmentCubemap;
    protected final boolean lighting;
    private boolean lightsSet;
    private final Matrix3 normalMatrix;
    protected final PointLight[] pointLights;
    protected int pointLightsColorOffset;
    protected int pointLightsIntensityOffset;
    protected int pointLightsLoc;
    protected int pointLightsPositionOffset;
    protected int pointLightsSize;
    private Renderable renderable;
    protected final boolean shadowMap;
    protected final SpotLight[] spotLights;
    protected int spotLightsColorOffset;
    protected int spotLightsCutoffAngleOffset;
    protected int spotLightsDirectionOffset;
    protected int spotLightsExponentOffset;
    protected int spotLightsIntensityOffset;
    protected int spotLightsLoc;
    protected int spotLightsPositionOffset;
    protected int spotLightsSize;
    private float time;
    private final Vector3 tmpV1;
    public final int u_alphaTest;
    protected final int u_ambientCubemap;
    public final int u_ambientTexture;
    public final int u_ambientUVTransform;
    public final int u_bones;
    public final int u_cameraDirection;
    public final int u_cameraNearFar;
    public final int u_cameraPosition;
    public final int u_cameraUp;
    public final int u_diffuseColor;
    public final int u_diffuseTexture;
    public final int u_diffuseUVTransform;
    protected final int u_dirLights0color;
    protected final int u_dirLights0direction;
    protected final int u_dirLights1color;
    public final int u_emissiveColor;
    public final int u_emissiveTexture;
    public final int u_emissiveUVTransform;
    protected final int u_environmentCubemap;
    protected final int u_fogColor;
    public final int u_normalMatrix;
    public final int u_normalTexture;
    public final int u_normalUVTransform;
    public final int u_opacity;
    protected final int u_pointLights0color;
    protected final int u_pointLights0intensity;
    protected final int u_pointLights0position;
    protected final int u_pointLights1color;
    public final int u_projTrans;
    public final int u_projViewTrans;
    public final int u_projViewWorldTrans;
    public final int u_reflectionColor;
    public final int u_reflectionTexture;
    public final int u_reflectionUVTransform;
    protected final int u_shadowMapProjViewTrans;
    protected final int u_shadowPCFOffset;
    protected final int u_shadowTexture;
    public final int u_shininess;
    public final int u_specularColor;
    public final int u_specularTexture;
    public final int u_specularUVTransform;
    protected final int u_spotLights0color;
    protected final int u_spotLights0cutoffAngle;
    protected final int u_spotLights0direction;
    protected final int u_spotLights0exponent;
    protected final int u_spotLights0intensity;
    protected final int u_spotLights0position;
    protected final int u_spotLights1color;
    public final int u_time;
    public final int u_viewTrans;
    public final int u_viewWorldTrans;
    public final int u_worldTrans;
    private final long vertexMask;

    public static class Inputs {
        public static final BaseShader.Uniform alphaTest = new BaseShader.Uniform("u_alphaTest");
        public static final BaseShader.Uniform ambientCube = new BaseShader.Uniform("u_ambientCubemap");
        public static final BaseShader.Uniform ambientTexture = new BaseShader.Uniform("u_ambientTexture", TextureAttribute.Ambient);
        public static final BaseShader.Uniform ambientUVTransform = new BaseShader.Uniform("u_ambientUVTransform", TextureAttribute.Ambient);
        public static final BaseShader.Uniform bones = new BaseShader.Uniform("u_bones");
        public static final BaseShader.Uniform cameraDirection = new BaseShader.Uniform("u_cameraDirection");
        public static final BaseShader.Uniform cameraNearFar = new BaseShader.Uniform("u_cameraNearFar");
        public static final BaseShader.Uniform cameraPosition = new BaseShader.Uniform("u_cameraPosition");
        public static final BaseShader.Uniform cameraUp = new BaseShader.Uniform("u_cameraUp");
        public static final BaseShader.Uniform diffuseColor = new BaseShader.Uniform("u_diffuseColor", ColorAttribute.Diffuse);
        public static final BaseShader.Uniform diffuseTexture = new BaseShader.Uniform("u_diffuseTexture", TextureAttribute.Diffuse);
        public static final BaseShader.Uniform diffuseUVTransform = new BaseShader.Uniform("u_diffuseUVTransform", TextureAttribute.Diffuse);
        public static final BaseShader.Uniform dirLights = new BaseShader.Uniform("u_dirLights");
        public static final BaseShader.Uniform emissiveColor = new BaseShader.Uniform("u_emissiveColor", ColorAttribute.Emissive);
        public static final BaseShader.Uniform emissiveTexture = new BaseShader.Uniform("u_emissiveTexture", TextureAttribute.Emissive);
        public static final BaseShader.Uniform emissiveUVTransform = new BaseShader.Uniform("u_emissiveUVTransform", TextureAttribute.Emissive);
        public static final BaseShader.Uniform environmentCubemap = new BaseShader.Uniform("u_environmentCubemap");
        public static final BaseShader.Uniform normalMatrix = new BaseShader.Uniform("u_normalMatrix");
        public static final BaseShader.Uniform normalTexture = new BaseShader.Uniform("u_normalTexture", TextureAttribute.Normal);
        public static final BaseShader.Uniform normalUVTransform = new BaseShader.Uniform("u_normalUVTransform", TextureAttribute.Normal);
        public static final BaseShader.Uniform opacity = new BaseShader.Uniform("u_opacity", BlendingAttribute.Type);
        public static final BaseShader.Uniform pointLights = new BaseShader.Uniform("u_pointLights");
        public static final BaseShader.Uniform projTrans = new BaseShader.Uniform("u_projTrans");
        public static final BaseShader.Uniform projViewTrans = new BaseShader.Uniform("u_projViewTrans");
        public static final BaseShader.Uniform projViewWorldTrans = new BaseShader.Uniform("u_projViewWorldTrans");
        public static final BaseShader.Uniform reflectionColor = new BaseShader.Uniform("u_reflectionColor", ColorAttribute.Reflection);
        public static final BaseShader.Uniform reflectionTexture = new BaseShader.Uniform("u_reflectionTexture", TextureAttribute.Reflection);
        public static final BaseShader.Uniform reflectionUVTransform = new BaseShader.Uniform("u_reflectionUVTransform", TextureAttribute.Reflection);
        public static final BaseShader.Uniform shininess = new BaseShader.Uniform("u_shininess", FloatAttribute.Shininess);
        public static final BaseShader.Uniform specularColor = new BaseShader.Uniform("u_specularColor", ColorAttribute.Specular);
        public static final BaseShader.Uniform specularTexture = new BaseShader.Uniform("u_specularTexture", TextureAttribute.Specular);
        public static final BaseShader.Uniform specularUVTransform = new BaseShader.Uniform("u_specularUVTransform", TextureAttribute.Specular);
        public static final BaseShader.Uniform spotLights = new BaseShader.Uniform("u_spotLights");
        public static final BaseShader.Uniform viewTrans = new BaseShader.Uniform("u_viewTrans");
        public static final BaseShader.Uniform viewWorldTrans = new BaseShader.Uniform("u_viewWorldTrans");
        public static final BaseShader.Uniform worldTrans = new BaseShader.Uniform("u_worldTrans");
    }

    private static final boolean and(long j, long j2) {
        return (j & j2) == j2;
    }

    private static final boolean or(long j, long j2) {
        return (j & j2) != 0;
    }

    @Override // com.badlogic.gdx.graphics.g3d.Shader
    public int compareTo(Shader shader) {
        if (shader == null) {
            return -1;
        }
        if (shader == this) {
        }
        return 0;
    }

    public boolean equals(DefaultShader defaultShader) {
        return defaultShader == this;
    }

    public static class Config {
        public int defaultCullFace = -1;
        public int defaultDepthFunc = -1;
        public String fragmentShader = null;
        public boolean ignoreUnimplemented = true;
        public int numBones = 12;
        public int numDirectionalLights = 2;
        public int numPointLights = 5;
        public int numSpotLights = 0;
        public String vertexShader = null;

        public Config() {
        }

        public Config(String str, String str2) {
            this.vertexShader = str;
            this.fragmentShader = str2;
        }
    }

    public static class Setters {
        public static final BaseShader.Setter ambientTexture = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass27 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.context.textureBinder.bind(((TextureAttribute) attributes.get(TextureAttribute.Ambient)).textureDescription));
            }
        };
        public static final BaseShader.Setter ambientUVTransform = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass28 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                TextureAttribute textureAttribute = (TextureAttribute) attributes.get(TextureAttribute.Ambient);
                baseShader.set(i, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
            }
        };
        public static final BaseShader.Setter cameraDirection = new BaseShader.GlobalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass5 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.camera.direction);
            }
        };
        public static final BaseShader.Setter cameraNearFar = new BaseShader.GlobalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass7 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.camera.near, baseShader.camera.far);
            }
        };
        public static final BaseShader.Setter cameraPosition = new BaseShader.GlobalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass4 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.camera.position.x, baseShader.camera.position.y, baseShader.camera.position.z, 1.1881f / (baseShader.camera.far * baseShader.camera.far));
            }
        };
        public static final BaseShader.Setter cameraUp = new BaseShader.GlobalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass6 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.camera.up);
            }
        };
        public static final BaseShader.Setter diffuseColor = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass13 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, ((ColorAttribute) attributes.get(ColorAttribute.Diffuse)).color);
            }
        };
        public static final BaseShader.Setter diffuseTexture = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass14 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.context.textureBinder.bind(((TextureAttribute) attributes.get(TextureAttribute.Diffuse)).textureDescription));
            }
        };
        public static final BaseShader.Setter diffuseUVTransform = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass15 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                TextureAttribute textureAttribute = (TextureAttribute) attributes.get(TextureAttribute.Diffuse);
                baseShader.set(i, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
            }
        };
        public static final BaseShader.Setter emissiveColor = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass19 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, ((ColorAttribute) attributes.get(ColorAttribute.Emissive)).color);
            }
        };
        public static final BaseShader.Setter emissiveTexture = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass20 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.context.textureBinder.bind(((TextureAttribute) attributes.get(TextureAttribute.Emissive)).textureDescription));
            }
        };
        public static final BaseShader.Setter emissiveUVTransform = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass21 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                TextureAttribute textureAttribute = (TextureAttribute) attributes.get(TextureAttribute.Emissive);
                baseShader.set(i, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
            }
        };
        public static final BaseShader.Setter environmentCubemap = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass29 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                if (attributes.has(CubemapAttribute.EnvironmentMap)) {
                    baseShader.set(i, baseShader.context.textureBinder.bind(((CubemapAttribute) attributes.get(CubemapAttribute.EnvironmentMap)).textureDescription));
                }
            }
        };
        public static final BaseShader.Setter normalMatrix = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass11 */
            private final Matrix3 tmpM = new Matrix3();

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, this.tmpM.set(renderable.worldTransform).inv().transpose());
            }
        };
        public static final BaseShader.Setter normalTexture = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass25 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.context.textureBinder.bind(((TextureAttribute) attributes.get(TextureAttribute.Normal)).textureDescription));
            }
        };
        public static final BaseShader.Setter normalUVTransform = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass26 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                TextureAttribute textureAttribute = (TextureAttribute) attributes.get(TextureAttribute.Normal);
                baseShader.set(i, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
            }
        };
        public static final BaseShader.Setter projTrans = new BaseShader.GlobalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass1 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.camera.projection);
            }
        };
        public static final BaseShader.Setter projViewTrans = new BaseShader.GlobalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass3 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.camera.combined);
            }
        };
        public static final BaseShader.Setter projViewWorldTrans = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass10 */
            final Matrix4 temp = new Matrix4();

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, this.temp.set(baseShader.camera.combined).mul(renderable.worldTransform));
            }
        };
        public static final BaseShader.Setter reflectionColor = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass22 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, ((ColorAttribute) attributes.get(ColorAttribute.Reflection)).color);
            }
        };
        public static final BaseShader.Setter reflectionTexture = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass23 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.context.textureBinder.bind(((TextureAttribute) attributes.get(TextureAttribute.Reflection)).textureDescription));
            }
        };
        public static final BaseShader.Setter reflectionUVTransform = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass24 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                TextureAttribute textureAttribute = (TextureAttribute) attributes.get(TextureAttribute.Reflection);
                baseShader.set(i, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
            }
        };
        public static final BaseShader.Setter shininess = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass12 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, ((FloatAttribute) attributes.get(FloatAttribute.Shininess)).value);
            }
        };
        public static final BaseShader.Setter specularColor = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass16 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, ((ColorAttribute) attributes.get(ColorAttribute.Specular)).color);
            }
        };
        public static final BaseShader.Setter specularTexture = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass17 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.context.textureBinder.bind(((TextureAttribute) attributes.get(TextureAttribute.Specular)).textureDescription));
            }
        };
        public static final BaseShader.Setter specularUVTransform = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass18 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                TextureAttribute textureAttribute = (TextureAttribute) attributes.get(TextureAttribute.Specular);
                baseShader.set(i, textureAttribute.offsetU, textureAttribute.offsetV, textureAttribute.scaleU, textureAttribute.scaleV);
            }
        };
        public static final BaseShader.Setter viewTrans = new BaseShader.GlobalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass2 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.camera.view);
            }
        };
        public static final BaseShader.Setter viewWorldTrans = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass9 */
            final Matrix4 temp = new Matrix4();

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, this.temp.set(baseShader.camera.view).mul(renderable.worldTransform));
            }
        };
        public static final BaseShader.Setter worldTrans = new BaseShader.LocalSetter() {
            /* class com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Setters.AnonymousClass8 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, renderable.worldTransform);
            }
        };

        public static class Bones extends BaseShader.LocalSetter {
            private static final Matrix4 idtMatrix = new Matrix4();
            public final float[] bones;

            public Bones(int i) {
                this.bones = new float[(i * 16)];
            }

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                int i2 = 0;
                while (true) {
                    float[] fArr = this.bones;
                    if (i2 < fArr.length) {
                        int i3 = i2 / 16;
                        fArr[i2] = (renderable.bones == null || i3 >= renderable.bones.length || renderable.bones[i3] == null) ? idtMatrix.val[i2 % 16] : renderable.bones[i3].val[i2 % 16];
                        i2++;
                    } else {
                        ShaderProgram shaderProgram = baseShader.program;
                        int loc = baseShader.loc(i);
                        float[] fArr2 = this.bones;
                        shaderProgram.setUniformMatrix4fv(loc, fArr2, 0, fArr2.length);
                        return;
                    }
                }
            }
        }

        public static class ACubemap extends BaseShader.LocalSetter {
            private static final float[] ones = {1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f};
            private static final Vector3 tmpV1 = new Vector3();
            private final AmbientCubemap cacheAmbientCubemap = new AmbientCubemap();
            public final int dirLightsOffset;
            public final int pointLightsOffset;

            public ACubemap(int i, int i2) {
                this.dirLightsOffset = i;
                this.pointLightsOffset = i2;
            }

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                if (renderable.environment == null) {
                    ShaderProgram shaderProgram = baseShader.program;
                    int loc = baseShader.loc(i);
                    float[] fArr = ones;
                    shaderProgram.setUniform3fv(loc, fArr, 0, fArr.length);
                    return;
                }
                renderable.worldTransform.getTranslation(tmpV1);
                if (attributes.has(ColorAttribute.AmbientLight)) {
                    this.cacheAmbientCubemap.set(((ColorAttribute) attributes.get(ColorAttribute.AmbientLight)).color);
                }
                if (attributes.has(DirectionalLightsAttribute.Type)) {
                    Array<DirectionalLight> array = ((DirectionalLightsAttribute) attributes.get(DirectionalLightsAttribute.Type)).lights;
                    for (int i2 = this.dirLightsOffset; i2 < array.size; i2++) {
                        this.cacheAmbientCubemap.add(array.get(i2).color, array.get(i2).direction);
                    }
                }
                if (attributes.has(PointLightsAttribute.Type)) {
                    Array<PointLight> array2 = ((PointLightsAttribute) attributes.get(PointLightsAttribute.Type)).lights;
                    for (int i3 = this.pointLightsOffset; i3 < array2.size; i3++) {
                        this.cacheAmbientCubemap.add(array2.get(i3).color, array2.get(i3).position, tmpV1, array2.get(i3).intensity);
                    }
                }
                this.cacheAmbientCubemap.clamp();
                baseShader.program.setUniform3fv(baseShader.loc(i), this.cacheAmbientCubemap.data, 0, this.cacheAmbientCubemap.data.length);
            }
        }
    }

    public static String getDefaultVertexShader() {
        if (defaultVertexShader == null) {
            defaultVertexShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/shaders/default.vertex.glsl").readString();
        }
        return defaultVertexShader;
    }

    public static String getDefaultFragmentShader() {
        if (defaultFragmentShader == null) {
            defaultFragmentShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/shaders/default.fragment.glsl").readString();
        }
        return defaultFragmentShader;
    }

    public DefaultShader(Renderable renderable2) {
        this(renderable2, new Config());
    }

    public DefaultShader(Renderable renderable2, Config config2) {
        this(renderable2, config2, createPrefix(renderable2, config2));
    }

    /* JADX WARNING: Illegal instructions before constructor call */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public DefaultShader(com.badlogic.gdx.graphics.g3d.Renderable r8, com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.Config r9, java.lang.String r10) {
        /*
            r7 = this;
            java.lang.String r0 = r9.vertexShader
            if (r0 == 0) goto L_0x0007
            java.lang.String r0 = r9.vertexShader
            goto L_0x000b
        L_0x0007:
            java.lang.String r0 = getDefaultVertexShader()
        L_0x000b:
            r5 = r0
            java.lang.String r0 = r9.fragmentShader
            if (r0 == 0) goto L_0x0013
            java.lang.String r0 = r9.fragmentShader
            goto L_0x0017
        L_0x0013:
            java.lang.String r0 = getDefaultFragmentShader()
        L_0x0017:
            r6 = r0
            r1 = r7
            r2 = r8
            r3 = r9
            r4 = r10
            r1.<init>(r2, r3, r4, r5, r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g3d.shaders.DefaultShader.<init>(com.badlogic.gdx.graphics.g3d.Renderable, com.badlogic.gdx.graphics.g3d.shaders.DefaultShader$Config, java.lang.String):void");
    }

    public DefaultShader(Renderable renderable2, Config config2, String str, String str2, String str3) {
        this(renderable2, config2, new ShaderProgram(str + str2, str + str3));
    }

    public DefaultShader(Renderable renderable2, Config config2, ShaderProgram shaderProgram) {
        this.u_dirLights0color = register(new BaseShader.Uniform("u_dirLights[0].color"));
        this.u_dirLights0direction = register(new BaseShader.Uniform("u_dirLights[0].direction"));
        this.u_dirLights1color = register(new BaseShader.Uniform("u_dirLights[1].color"));
        this.u_pointLights0color = register(new BaseShader.Uniform("u_pointLights[0].color"));
        this.u_pointLights0position = register(new BaseShader.Uniform("u_pointLights[0].position"));
        this.u_pointLights0intensity = register(new BaseShader.Uniform("u_pointLights[0].intensity"));
        this.u_pointLights1color = register(new BaseShader.Uniform("u_pointLights[1].color"));
        this.u_spotLights0color = register(new BaseShader.Uniform("u_spotLights[0].color"));
        this.u_spotLights0position = register(new BaseShader.Uniform("u_spotLights[0].position"));
        this.u_spotLights0intensity = register(new BaseShader.Uniform("u_spotLights[0].intensity"));
        this.u_spotLights0direction = register(new BaseShader.Uniform("u_spotLights[0].direction"));
        this.u_spotLights0cutoffAngle = register(new BaseShader.Uniform("u_spotLights[0].cutoffAngle"));
        this.u_spotLights0exponent = register(new BaseShader.Uniform("u_spotLights[0].exponent"));
        this.u_spotLights1color = register(new BaseShader.Uniform("u_spotLights[1].color"));
        this.u_fogColor = register(new BaseShader.Uniform("u_fogColor"));
        this.u_shadowMapProjViewTrans = register(new BaseShader.Uniform("u_shadowMapProjViewTrans"));
        this.u_shadowTexture = register(new BaseShader.Uniform("u_shadowTexture"));
        this.u_shadowPCFOffset = register(new BaseShader.Uniform("u_shadowPCFOffset"));
        this.ambientCubemap = new AmbientCubemap();
        this.normalMatrix = new Matrix3();
        this.tmpV1 = new Vector3();
        Attributes combineAttributes = combineAttributes(renderable2);
        this.config = config2;
        this.program = shaderProgram;
        boolean z = true;
        int i = 0;
        this.lighting = renderable2.environment != null;
        this.environmentCubemap = combineAttributes.has(CubemapAttribute.EnvironmentMap) || (this.lighting && combineAttributes.has(CubemapAttribute.EnvironmentMap));
        this.shadowMap = (!this.lighting || renderable2.environment.shadowMap == null) ? false : z;
        this.renderable = renderable2;
        this.attributesMask = combineAttributes.getMask() | optionalAttributes;
        this.vertexMask = renderable2.meshPart.mesh.getVertexAttributes().getMaskWithSizePacked();
        this.directionalLights = new DirectionalLight[((!this.lighting || config2.numDirectionalLights <= 0) ? 0 : config2.numDirectionalLights)];
        int i2 = 0;
        while (true) {
            DirectionalLight[] directionalLightArr = this.directionalLights;
            if (i2 >= directionalLightArr.length) {
                break;
            }
            directionalLightArr[i2] = new DirectionalLight();
            i2++;
        }
        this.pointLights = new PointLight[((!this.lighting || config2.numPointLights <= 0) ? 0 : config2.numPointLights)];
        int i3 = 0;
        while (true) {
            PointLight[] pointLightArr = this.pointLights;
            if (i3 >= pointLightArr.length) {
                break;
            }
            pointLightArr[i3] = new PointLight();
            i3++;
        }
        this.spotLights = new SpotLight[((!this.lighting || config2.numSpotLights <= 0) ? 0 : config2.numSpotLights)];
        while (true) {
            SpotLight[] spotLightArr = this.spotLights;
            if (i >= spotLightArr.length) {
                break;
            }
            spotLightArr[i] = new SpotLight();
            i++;
        }
        if (!config2.ignoreUnimplemented) {
            long j = implementedFlags;
            long j2 = this.attributesMask;
            if ((j & j2) != j2) {
                throw new GdxRuntimeException("Some attributes not implemented yet (" + this.attributesMask + ")");
            }
        }
        this.u_projTrans = register(Inputs.projTrans, Setters.projTrans);
        this.u_viewTrans = register(Inputs.viewTrans, Setters.viewTrans);
        this.u_projViewTrans = register(Inputs.projViewTrans, Setters.projViewTrans);
        this.u_cameraPosition = register(Inputs.cameraPosition, Setters.cameraPosition);
        this.u_cameraDirection = register(Inputs.cameraDirection, Setters.cameraDirection);
        this.u_cameraUp = register(Inputs.cameraUp, Setters.cameraUp);
        this.u_cameraNearFar = register(Inputs.cameraNearFar, Setters.cameraNearFar);
        this.u_time = register(new BaseShader.Uniform("u_time"));
        this.u_worldTrans = register(Inputs.worldTrans, Setters.worldTrans);
        this.u_viewWorldTrans = register(Inputs.viewWorldTrans, Setters.viewWorldTrans);
        this.u_projViewWorldTrans = register(Inputs.projViewWorldTrans, Setters.projViewWorldTrans);
        this.u_normalMatrix = register(Inputs.normalMatrix, Setters.normalMatrix);
        int i4 = -1;
        this.u_bones = (renderable2.bones == null || config2.numBones <= 0) ? -1 : register(Inputs.bones, new Setters.Bones(config2.numBones));
        this.u_shininess = register(Inputs.shininess, Setters.shininess);
        this.u_opacity = register(Inputs.opacity);
        this.u_diffuseColor = register(Inputs.diffuseColor, Setters.diffuseColor);
        this.u_diffuseTexture = register(Inputs.diffuseTexture, Setters.diffuseTexture);
        this.u_diffuseUVTransform = register(Inputs.diffuseUVTransform, Setters.diffuseUVTransform);
        this.u_specularColor = register(Inputs.specularColor, Setters.specularColor);
        this.u_specularTexture = register(Inputs.specularTexture, Setters.specularTexture);
        this.u_specularUVTransform = register(Inputs.specularUVTransform, Setters.specularUVTransform);
        this.u_emissiveColor = register(Inputs.emissiveColor, Setters.emissiveColor);
        this.u_emissiveTexture = register(Inputs.emissiveTexture, Setters.emissiveTexture);
        this.u_emissiveUVTransform = register(Inputs.emissiveUVTransform, Setters.emissiveUVTransform);
        this.u_reflectionColor = register(Inputs.reflectionColor, Setters.reflectionColor);
        this.u_reflectionTexture = register(Inputs.reflectionTexture, Setters.reflectionTexture);
        this.u_reflectionUVTransform = register(Inputs.reflectionUVTransform, Setters.reflectionUVTransform);
        this.u_normalTexture = register(Inputs.normalTexture, Setters.normalTexture);
        this.u_normalUVTransform = register(Inputs.normalUVTransform, Setters.normalUVTransform);
        this.u_ambientTexture = register(Inputs.ambientTexture, Setters.ambientTexture);
        this.u_ambientUVTransform = register(Inputs.ambientUVTransform, Setters.ambientUVTransform);
        this.u_alphaTest = register(Inputs.alphaTest);
        this.u_ambientCubemap = this.lighting ? register(Inputs.ambientCube, new Setters.ACubemap(config2.numDirectionalLights, config2.numPointLights)) : -1;
        this.u_environmentCubemap = this.environmentCubemap ? register(Inputs.environmentCubemap, Setters.environmentCubemap) : i4;
    }

    @Override // com.badlogic.gdx.graphics.g3d.Shader
    public void init() {
        ShaderProgram shaderProgram = this.program;
        this.program = null;
        init(shaderProgram, this.renderable);
        this.renderable = null;
        this.dirLightsLoc = loc(this.u_dirLights0color);
        this.dirLightsColorOffset = loc(this.u_dirLights0color) - this.dirLightsLoc;
        this.dirLightsDirectionOffset = loc(this.u_dirLights0direction) - this.dirLightsLoc;
        this.dirLightsSize = loc(this.u_dirLights1color) - this.dirLightsLoc;
        if (this.dirLightsSize < 0) {
            this.dirLightsSize = 0;
        }
        this.pointLightsLoc = loc(this.u_pointLights0color);
        this.pointLightsColorOffset = loc(this.u_pointLights0color) - this.pointLightsLoc;
        this.pointLightsPositionOffset = loc(this.u_pointLights0position) - this.pointLightsLoc;
        int i = -1;
        this.pointLightsIntensityOffset = has(this.u_pointLights0intensity) ? loc(this.u_pointLights0intensity) - this.pointLightsLoc : -1;
        this.pointLightsSize = loc(this.u_pointLights1color) - this.pointLightsLoc;
        if (this.pointLightsSize < 0) {
            this.pointLightsSize = 0;
        }
        this.spotLightsLoc = loc(this.u_spotLights0color);
        this.spotLightsColorOffset = loc(this.u_spotLights0color) - this.spotLightsLoc;
        this.spotLightsPositionOffset = loc(this.u_spotLights0position) - this.spotLightsLoc;
        this.spotLightsDirectionOffset = loc(this.u_spotLights0direction) - this.spotLightsLoc;
        if (has(this.u_spotLights0intensity)) {
            i = loc(this.u_spotLights0intensity) - this.spotLightsLoc;
        }
        this.spotLightsIntensityOffset = i;
        this.spotLightsCutoffAngleOffset = loc(this.u_spotLights0cutoffAngle) - this.spotLightsLoc;
        this.spotLightsExponentOffset = loc(this.u_spotLights0exponent) - this.spotLightsLoc;
        this.spotLightsSize = loc(this.u_spotLights1color) - this.spotLightsLoc;
        if (this.spotLightsSize < 0) {
            this.spotLightsSize = 0;
        }
    }

    private static final Attributes combineAttributes(Renderable renderable2) {
        tmpAttributes.clear();
        if (renderable2.environment != null) {
            tmpAttributes.set(renderable2.environment);
        }
        if (renderable2.material != null) {
            tmpAttributes.set(renderable2.material);
        }
        return tmpAttributes;
    }

    private static final long combineAttributeMasks(Renderable renderable2) {
        long j = 0;
        if (renderable2.environment != null) {
            j = 0 | renderable2.environment.getMask();
        }
        return renderable2.material != null ? j | renderable2.material.getMask() : j;
    }

    public static String createPrefix(Renderable renderable2, Config config2) {
        String str;
        Attributes combineAttributes = combineAttributes(renderable2);
        long mask = combineAttributes.getMask();
        long mask2 = renderable2.meshPart.mesh.getVertexAttributes().getMask();
        boolean and = and(mask2, 1);
        String str2 = BuildConfig.FLAVOR;
        if (and) {
            str2 = str2 + "#define positionFlag\n";
        }
        if (or(mask2, 6)) {
            str2 = str2 + "#define colorFlag\n";
        }
        if (and(mask2, 256)) {
            str2 = str2 + "#define binormalFlag\n";
        }
        if (and(mask2, 128)) {
            str2 = str2 + "#define tangentFlag\n";
        }
        if (and(mask2, 8)) {
            str2 = str2 + "#define normalFlag\n";
        }
        if ((and(mask2, 8) || and(mask2, 384)) && renderable2.environment != null) {
            String str3 = ((((str2 + "#define lightingFlag\n") + "#define ambientCubemapFlag\n") + "#define numDirectionalLights " + config2.numDirectionalLights + "\n") + "#define numPointLights " + config2.numPointLights + "\n") + "#define numSpotLights " + config2.numSpotLights + "\n";
            if (combineAttributes.has(ColorAttribute.Fog)) {
                str3 = str3 + "#define fogFlag\n";
            }
            if (renderable2.environment.shadowMap != null) {
                str3 = str3 + "#define shadowMapFlag\n";
            }
            str2 = str3;
            if (combineAttributes.has(CubemapAttribute.EnvironmentMap)) {
                str2 = str2 + "#define environmentCubemapFlag\n";
            }
        }
        int size = renderable2.meshPart.mesh.getVertexAttributes().size();
        for (int i = 0; i < size; i++) {
            VertexAttribute vertexAttribute = renderable2.meshPart.mesh.getVertexAttributes().get(i);
            if (vertexAttribute.usage == 64) {
                str = str2 + "#define boneWeight" + vertexAttribute.unit + "Flag\n";
            } else if (vertexAttribute.usage == 16) {
                str = str2 + "#define texCoord" + vertexAttribute.unit + "Flag\n";
            }
            str2 = str;
        }
        if ((BlendingAttribute.Type & mask) == BlendingAttribute.Type) {
            str2 = str2 + "#define blendedFlag\n";
        }
        if ((TextureAttribute.Diffuse & mask) == TextureAttribute.Diffuse) {
            str2 = (str2 + "#define diffuseTextureFlag\n") + "#define diffuseTextureCoord texCoord0\n";
        }
        if ((TextureAttribute.Specular & mask) == TextureAttribute.Specular) {
            str2 = (str2 + "#define specularTextureFlag\n") + "#define specularTextureCoord texCoord0\n";
        }
        if ((TextureAttribute.Normal & mask) == TextureAttribute.Normal) {
            str2 = (str2 + "#define normalTextureFlag\n") + "#define normalTextureCoord texCoord0\n";
        }
        if ((TextureAttribute.Emissive & mask) == TextureAttribute.Emissive) {
            str2 = (str2 + "#define emissiveTextureFlag\n") + "#define emissiveTextureCoord texCoord0\n";
        }
        if ((TextureAttribute.Reflection & mask) == TextureAttribute.Reflection) {
            str2 = (str2 + "#define reflectionTextureFlag\n") + "#define reflectionTextureCoord texCoord0\n";
        }
        if ((TextureAttribute.Ambient & mask) == TextureAttribute.Ambient) {
            str2 = (str2 + "#define ambientTextureFlag\n") + "#define ambientTextureCoord texCoord0\n";
        }
        if ((ColorAttribute.Diffuse & mask) == ColorAttribute.Diffuse) {
            str2 = str2 + "#define diffuseColorFlag\n";
        }
        if ((ColorAttribute.Specular & mask) == ColorAttribute.Specular) {
            str2 = str2 + "#define specularColorFlag\n";
        }
        if ((ColorAttribute.Emissive & mask) == ColorAttribute.Emissive) {
            str2 = str2 + "#define emissiveColorFlag\n";
        }
        if ((ColorAttribute.Reflection & mask) == ColorAttribute.Reflection) {
            str2 = str2 + "#define reflectionColorFlag\n";
        }
        if ((FloatAttribute.Shininess & mask) == FloatAttribute.Shininess) {
            str2 = str2 + "#define shininessFlag\n";
        }
        if ((mask & FloatAttribute.AlphaTest) == FloatAttribute.AlphaTest) {
            str2 = str2 + "#define alphaTestFlag\n";
        }
        if (renderable2.bones == null || config2.numBones <= 0) {
            return str2;
        }
        return str2 + "#define numBones " + config2.numBones + "\n";
    }

    @Override // com.badlogic.gdx.graphics.g3d.Shader
    public boolean canRender(Renderable renderable2) {
        if (this.attributesMask == (combineAttributeMasks(renderable2) | optionalAttributes) && this.vertexMask == renderable2.meshPart.mesh.getVertexAttributes().getMaskWithSizePacked()) {
            if ((renderable2.environment != null) == this.lighting) {
                return true;
            }
        }
        return false;
    }

    public boolean equals(Object obj) {
        return (obj instanceof DefaultShader) && equals((DefaultShader) obj);
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.graphics.g3d.Shader
    public void begin(Camera camera, RenderContext renderContext) {
        super.begin(camera, renderContext);
        for (DirectionalLight directionalLight : this.directionalLights) {
            directionalLight.set(0.0f, 0.0f, 0.0f, 0.0f, -1.0f, 0.0f);
        }
        for (PointLight pointLight : this.pointLights) {
            pointLight.set(0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f);
        }
        for (SpotLight spotLight : this.spotLights) {
            spotLight.set(0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, -1.0f, 0.0f, 0.0f, 1.0f, 0.0f);
        }
        this.lightsSet = false;
        if (has(this.u_time)) {
            int i = this.u_time;
            float deltaTime = this.time + Gdx.graphics.getDeltaTime();
            this.time = deltaTime;
            set(i, deltaTime);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader
    public void render(Renderable renderable2, Attributes attributes) {
        if (!attributes.has(BlendingAttribute.Type)) {
            this.context.setBlending(false, GL20.GL_SRC_ALPHA, GL20.GL_ONE_MINUS_SRC_ALPHA);
        }
        bindMaterial(attributes);
        if (this.lighting) {
            bindLights(renderable2, attributes);
        }
        super.render(renderable2, attributes);
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.graphics.g3d.Shader
    public void end() {
        super.end();
    }

    /* access modifiers changed from: protected */
    public void bindMaterial(Attributes attributes) {
        int i = this.config.defaultCullFace == -1 ? defaultCullFace : this.config.defaultCullFace;
        int i2 = this.config.defaultDepthFunc == -1 ? defaultDepthFunc : this.config.defaultDepthFunc;
        float f = 0.0f;
        float f2 = 1.0f;
        Iterator<Attribute> it = attributes.iterator();
        boolean z = true;
        while (it.hasNext()) {
            Attribute next = it.next();
            long j = next.type;
            if (BlendingAttribute.is(j)) {
                BlendingAttribute blendingAttribute = (BlendingAttribute) next;
                this.context.setBlending(true, blendingAttribute.sourceFunction, blendingAttribute.destFunction);
                set(this.u_opacity, blendingAttribute.opacity);
            } else if ((IntAttribute.CullFace & j) == IntAttribute.CullFace) {
                i = ((IntAttribute) next).value;
            } else if ((FloatAttribute.AlphaTest & j) == FloatAttribute.AlphaTest) {
                set(this.u_alphaTest, ((FloatAttribute) next).value);
            } else if ((j & DepthTestAttribute.Type) == DepthTestAttribute.Type) {
                DepthTestAttribute depthTestAttribute = (DepthTestAttribute) next;
                i2 = depthTestAttribute.depthFunc;
                f = depthTestAttribute.depthRangeNear;
                f2 = depthTestAttribute.depthRangeFar;
                z = depthTestAttribute.depthMask;
            } else if (!this.config.ignoreUnimplemented) {
                throw new GdxRuntimeException("Unknown material attribute: " + next.toString());
            }
        }
        this.context.setCullFace(i);
        this.context.setDepthTest(i2, f, f2);
        this.context.setDepthMask(z);
    }

    /* access modifiers changed from: protected */
    public void bindLights(Renderable renderable2, Attributes attributes) {
        Environment environment = renderable2.environment;
        DirectionalLightsAttribute directionalLightsAttribute = (DirectionalLightsAttribute) attributes.get(DirectionalLightsAttribute.class, DirectionalLightsAttribute.Type);
        Array<SpotLight> array = null;
        Array<DirectionalLight> array2 = directionalLightsAttribute == null ? null : directionalLightsAttribute.lights;
        PointLightsAttribute pointLightsAttribute = (PointLightsAttribute) attributes.get(PointLightsAttribute.class, PointLightsAttribute.Type);
        Array<PointLight> array3 = pointLightsAttribute == null ? null : pointLightsAttribute.lights;
        SpotLightsAttribute spotLightsAttribute = (SpotLightsAttribute) attributes.get(SpotLightsAttribute.class, SpotLightsAttribute.Type);
        if (spotLightsAttribute != null) {
            array = spotLightsAttribute.lights;
        }
        if (this.dirLightsLoc >= 0) {
            for (int i = 0; i < this.directionalLights.length; i++) {
                if (array2 == null || i >= array2.size) {
                    if (!this.lightsSet || this.directionalLights[i].color.r != 0.0f || this.directionalLights[i].color.g != 0.0f || this.directionalLights[i].color.b != 0.0f) {
                        this.directionalLights[i].color.set(0.0f, 0.0f, 0.0f, 1.0f);
                    }
                } else if (!this.lightsSet || !this.directionalLights[i].equals(array2.get(i))) {
                    this.directionalLights[i].set(array2.get(i));
                }
                int i2 = this.dirLightsLoc + (this.dirLightsSize * i);
                this.program.setUniformf(this.dirLightsColorOffset + i2, this.directionalLights[i].color.r, this.directionalLights[i].color.g, this.directionalLights[i].color.b);
                this.program.setUniformf(i2 + this.dirLightsDirectionOffset, this.directionalLights[i].direction.x, this.directionalLights[i].direction.y, this.directionalLights[i].direction.z);
                if (this.dirLightsSize <= 0) {
                    break;
                }
            }
        }
        if (this.pointLightsLoc >= 0) {
            for (int i3 = 0; i3 < this.pointLights.length; i3++) {
                if (array3 == null || i3 >= array3.size) {
                    if (!this.lightsSet || this.pointLights[i3].intensity != 0.0f) {
                        this.pointLights[i3].intensity = 0.0f;
                    }
                } else if (!this.lightsSet || !this.pointLights[i3].equals(array3.get(i3))) {
                    this.pointLights[i3].set(array3.get(i3));
                }
                int i4 = this.pointLightsLoc + (this.pointLightsSize * i3);
                this.program.setUniformf(this.pointLightsColorOffset + i4, this.pointLights[i3].color.r * this.pointLights[i3].intensity, this.pointLights[i3].color.g * this.pointLights[i3].intensity, this.pointLights[i3].color.b * this.pointLights[i3].intensity);
                this.program.setUniformf(this.pointLightsPositionOffset + i4, this.pointLights[i3].position.x, this.pointLights[i3].position.y, this.pointLights[i3].position.z);
                if (this.pointLightsIntensityOffset >= 0) {
                    this.program.setUniformf(i4 + this.pointLightsIntensityOffset, this.pointLights[i3].intensity);
                }
                if (this.pointLightsSize <= 0) {
                    break;
                }
            }
        }
        if (this.spotLightsLoc >= 0) {
            for (int i5 = 0; i5 < this.spotLights.length; i5++) {
                if (array == null || i5 >= array.size) {
                    if (!this.lightsSet || this.spotLights[i5].intensity != 0.0f) {
                        this.spotLights[i5].intensity = 0.0f;
                    }
                } else if (!this.lightsSet || !this.spotLights[i5].equals(array.get(i5))) {
                    this.spotLights[i5].set(array.get(i5));
                }
                int i6 = this.spotLightsLoc + (this.spotLightsSize * i5);
                this.program.setUniformf(this.spotLightsColorOffset + i6, this.spotLights[i5].color.r * this.spotLights[i5].intensity, this.spotLights[i5].color.g * this.spotLights[i5].intensity, this.spotLights[i5].color.b * this.spotLights[i5].intensity);
                this.program.setUniformf(this.spotLightsPositionOffset + i6, this.spotLights[i5].position);
                this.program.setUniformf(this.spotLightsDirectionOffset + i6, this.spotLights[i5].direction);
                this.program.setUniformf(this.spotLightsCutoffAngleOffset + i6, this.spotLights[i5].cutoffAngle);
                this.program.setUniformf(this.spotLightsExponentOffset + i6, this.spotLights[i5].exponent);
                if (this.spotLightsIntensityOffset >= 0) {
                    this.program.setUniformf(i6 + this.spotLightsIntensityOffset, this.spotLights[i5].intensity);
                }
                if (this.spotLightsSize <= 0) {
                    break;
                }
            }
        }
        if (attributes.has(ColorAttribute.Fog)) {
            set(this.u_fogColor, ((ColorAttribute) attributes.get(ColorAttribute.Fog)).color);
        }
        if (!(environment == null || environment.shadowMap == null)) {
            set(this.u_shadowMapProjViewTrans, environment.shadowMap.getProjViewTrans());
            set(this.u_shadowTexture, environment.shadowMap.getDepthMap());
            set(this.u_shadowPCFOffset, 1.0f / (((float) environment.shadowMap.getDepthMap().texture.getWidth()) * 2.0f));
        }
        this.lightsSet = true;
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.program.dispose();
        super.dispose();
    }

    public int getDefaultCullFace() {
        return this.config.defaultCullFace == -1 ? defaultCullFace : this.config.defaultCullFace;
    }

    public void setDefaultCullFace(int i) {
        this.config.defaultCullFace = i;
    }

    public int getDefaultDepthFunc() {
        return this.config.defaultDepthFunc == -1 ? defaultDepthFunc : this.config.defaultDepthFunc;
    }

    public void setDefaultDepthFunc(int i) {
        this.config.defaultDepthFunc = i;
    }
}
