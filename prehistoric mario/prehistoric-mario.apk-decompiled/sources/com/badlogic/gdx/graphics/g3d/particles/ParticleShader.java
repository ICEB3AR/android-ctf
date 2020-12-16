package com.badlogic.gdx.graphics.g3d.particles;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.Attributes;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DepthTestAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.IntAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.shaders.BaseShader;
import com.badlogic.gdx.graphics.g3d.shaders.DefaultShader;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class ParticleShader extends BaseShader {
    static final Vector3 TMP_VECTOR3 = new Vector3();
    private static String defaultFragmentShader;
    private static String defaultVertexShader;
    protected static long implementedFlags = (BlendingAttribute.Type | TextureAttribute.Diffuse);
    private static final long optionalAttributes = (IntAttribute.CullFace | DepthTestAttribute.Type);
    protected final Config config;
    Material currentMaterial;
    private long materialMask;
    private Renderable renderable;
    private long vertexMask;

    public enum AlignMode {
        Screen,
        ViewPoint
    }

    public static class Inputs {
        public static final BaseShader.Uniform cameraInvDirection = new BaseShader.Uniform("u_cameraInvDirection");
        public static final BaseShader.Uniform cameraRight = new BaseShader.Uniform("u_cameraRight");
        public static final BaseShader.Uniform regionSize = new BaseShader.Uniform("u_regionSize");
        public static final BaseShader.Uniform screenWidth = new BaseShader.Uniform("u_screenWidth");
    }

    public enum ParticleType {
        Billboard,
        Point
    }

    public static class Setters {
        public static final BaseShader.Setter cameraInvDirection = new BaseShader.Setter() {
            /* class com.badlogic.gdx.graphics.g3d.particles.ParticleShader.Setters.AnonymousClass3 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public boolean isGlobal(BaseShader baseShader, int i) {
                return true;
            }

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, ParticleShader.TMP_VECTOR3.set(-baseShader.camera.direction.x, -baseShader.camera.direction.y, -baseShader.camera.direction.z).nor());
            }
        };
        public static final BaseShader.Setter cameraPosition = new BaseShader.Setter() {
            /* class com.badlogic.gdx.graphics.g3d.particles.ParticleShader.Setters.AnonymousClass4 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public boolean isGlobal(BaseShader baseShader, int i) {
                return true;
            }

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, baseShader.camera.position);
            }
        };
        public static final BaseShader.Setter cameraRight = new BaseShader.Setter() {
            /* class com.badlogic.gdx.graphics.g3d.particles.ParticleShader.Setters.AnonymousClass1 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public boolean isGlobal(BaseShader baseShader, int i) {
                return true;
            }

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, ParticleShader.TMP_VECTOR3.set(baseShader.camera.direction).crs(baseShader.camera.up).nor());
            }
        };
        public static final BaseShader.Setter cameraUp = new BaseShader.Setter() {
            /* class com.badlogic.gdx.graphics.g3d.particles.ParticleShader.Setters.AnonymousClass2 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public boolean isGlobal(BaseShader baseShader, int i) {
                return true;
            }

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, ParticleShader.TMP_VECTOR3.set(baseShader.camera.up).nor());
            }
        };
        public static final BaseShader.Setter screenWidth = new BaseShader.Setter() {
            /* class com.badlogic.gdx.graphics.g3d.particles.ParticleShader.Setters.AnonymousClass5 */

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public boolean isGlobal(BaseShader baseShader, int i) {
                return true;
            }

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, (float) Gdx.graphics.getWidth());
            }
        };
        public static final BaseShader.Setter worldViewTrans = new BaseShader.Setter() {
            /* class com.badlogic.gdx.graphics.g3d.particles.ParticleShader.Setters.AnonymousClass6 */
            final Matrix4 temp = new Matrix4();

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public boolean isGlobal(BaseShader baseShader, int i) {
                return false;
            }

            @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader.Setter
            public void set(BaseShader baseShader, int i, Renderable renderable, Attributes attributes) {
                baseShader.set(i, this.temp.set(baseShader.camera.view).mul(renderable.worldTransform));
            }
        };
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

    public boolean equals(ParticleShader particleShader) {
        return particleShader == this;
    }

    public static class Config {
        public AlignMode align = AlignMode.Screen;
        public int defaultCullFace = -1;
        public int defaultDepthFunc = -1;
        public String fragmentShader = null;
        public boolean ignoreUnimplemented = true;
        public ParticleType type = ParticleType.Billboard;
        public String vertexShader = null;

        public Config() {
        }

        public Config(AlignMode alignMode, ParticleType particleType) {
            this.align = alignMode;
            this.type = particleType;
        }

        public Config(AlignMode alignMode) {
            this.align = alignMode;
        }

        public Config(ParticleType particleType) {
            this.type = particleType;
        }

        public Config(String str, String str2) {
            this.vertexShader = str;
            this.fragmentShader = str2;
        }
    }

    public static String getDefaultVertexShader() {
        if (defaultVertexShader == null) {
            defaultVertexShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/particles/particles.vertex.glsl").readString();
        }
        return defaultVertexShader;
    }

    public static String getDefaultFragmentShader() {
        if (defaultFragmentShader == null) {
            defaultFragmentShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/particles/particles.fragment.glsl").readString();
        }
        return defaultFragmentShader;
    }

    public ParticleShader(Renderable renderable2) {
        this(renderable2, new Config());
    }

    public ParticleShader(Renderable renderable2, Config config2) {
        this(renderable2, config2, createPrefix(renderable2, config2));
    }

    /* JADX WARNING: Illegal instructions before constructor call */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public ParticleShader(com.badlogic.gdx.graphics.g3d.Renderable r8, com.badlogic.gdx.graphics.g3d.particles.ParticleShader.Config r9, java.lang.String r10) {
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
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g3d.particles.ParticleShader.<init>(com.badlogic.gdx.graphics.g3d.Renderable, com.badlogic.gdx.graphics.g3d.particles.ParticleShader$Config, java.lang.String):void");
    }

    public ParticleShader(Renderable renderable2, Config config2, String str, String str2, String str3) {
        this(renderable2, config2, new ShaderProgram(str + str2, str + str3));
    }

    public ParticleShader(Renderable renderable2, Config config2, ShaderProgram shaderProgram) {
        this.config = config2;
        this.program = shaderProgram;
        this.renderable = renderable2;
        this.materialMask = renderable2.material.getMask() | optionalAttributes;
        this.vertexMask = renderable2.meshPart.mesh.getVertexAttributes().getMask();
        if (!config2.ignoreUnimplemented) {
            long j = implementedFlags;
            long j2 = this.materialMask;
            if ((j & j2) != j2) {
                throw new GdxRuntimeException("Some attributes not implemented yet (" + this.materialMask + ")");
            }
        }
        register(DefaultShader.Inputs.viewTrans, DefaultShader.Setters.viewTrans);
        register(DefaultShader.Inputs.projViewTrans, DefaultShader.Setters.projViewTrans);
        register(DefaultShader.Inputs.projTrans, DefaultShader.Setters.projTrans);
        register(Inputs.screenWidth, Setters.screenWidth);
        register(DefaultShader.Inputs.cameraUp, Setters.cameraUp);
        register(Inputs.cameraRight, Setters.cameraRight);
        register(Inputs.cameraInvDirection, Setters.cameraInvDirection);
        register(DefaultShader.Inputs.cameraPosition, Setters.cameraPosition);
        register(DefaultShader.Inputs.diffuseTexture, DefaultShader.Setters.diffuseTexture);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Shader
    public void init() {
        ShaderProgram shaderProgram = this.program;
        this.program = null;
        init(shaderProgram, this.renderable);
        this.renderable = null;
    }

    public static String createPrefix(Renderable renderable2, Config config2) {
        String str;
        if (Gdx.app.getType() == Application.ApplicationType.Desktop) {
            str = BuildConfig.FLAVOR + "#version 120\n";
        } else {
            str = BuildConfig.FLAVOR + "#version 100\n";
        }
        if (config2.type != ParticleType.Billboard) {
            return str;
        }
        String str2 = str + "#define billboard\n";
        if (config2.align == AlignMode.Screen) {
            return str2 + "#define screenFacing\n";
        } else if (config2.align != AlignMode.ViewPoint) {
            return str2;
        } else {
            return str2 + "#define viewPointFacing\n";
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.Shader
    public boolean canRender(Renderable renderable2) {
        return this.materialMask == (renderable2.material.getMask() | optionalAttributes) && this.vertexMask == renderable2.meshPart.mesh.getVertexAttributes().getMask();
    }

    public boolean equals(Object obj) {
        return (obj instanceof ParticleShader) && equals((ParticleShader) obj);
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.graphics.g3d.Shader
    public void begin(Camera camera, RenderContext renderContext) {
        super.begin(camera, renderContext);
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.graphics.g3d.Shader
    public void render(Renderable renderable2) {
        if (!renderable2.material.has(BlendingAttribute.Type)) {
            this.context.setBlending(false, GL20.GL_SRC_ALPHA, GL20.GL_ONE_MINUS_SRC_ALPHA);
        }
        bindMaterial(renderable2);
        super.render(renderable2);
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.graphics.g3d.Shader
    public void end() {
        this.currentMaterial = null;
        super.end();
    }

    /* access modifiers changed from: protected */
    public void bindMaterial(Renderable renderable2) {
        if (this.currentMaterial != renderable2.material) {
            int i = this.config.defaultCullFace == -1 ? GL20.GL_BACK : this.config.defaultCullFace;
            int i2 = this.config.defaultDepthFunc == -1 ? GL20.GL_LEQUAL : this.config.defaultDepthFunc;
            float f = 0.0f;
            float f2 = 1.0f;
            this.currentMaterial = renderable2.material;
            Iterator<Attribute> it = this.currentMaterial.iterator();
            boolean z = true;
            while (it.hasNext()) {
                Attribute next = it.next();
                long j = next.type;
                if (BlendingAttribute.is(j)) {
                    BlendingAttribute blendingAttribute = (BlendingAttribute) next;
                    this.context.setBlending(true, blendingAttribute.sourceFunction, blendingAttribute.destFunction);
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
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.program.dispose();
        super.dispose();
    }

    public int getDefaultCullFace() {
        return this.config.defaultCullFace == -1 ? GL20.GL_BACK : this.config.defaultCullFace;
    }

    public void setDefaultCullFace(int i) {
        this.config.defaultCullFace = i;
    }

    public int getDefaultDepthFunc() {
        return this.config.defaultDepthFunc == -1 ? GL20.GL_LEQUAL : this.config.defaultDepthFunc;
    }

    public void setDefaultDepthFunc(int i) {
        this.config.defaultDepthFunc = i;
    }
}
