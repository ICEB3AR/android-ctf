package com.badlogic.gdx.graphics.g3d.shaders;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.g3d.Attributes;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.FloatAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.shaders.DefaultShader;
import com.badlogic.gdx.graphics.g3d.utils.RenderContext;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;

public class DepthShader extends DefaultShader {
    private static String defaultFragmentShader;
    private static String defaultVertexShader;
    private static final Attributes tmpAttributes = new Attributes();
    private final FloatAttribute alphaTestAttribute;
    public final int numBones;
    public final int weights;

    public static class Config extends DefaultShader.Config {
        public float defaultAlphaTest = 0.5f;
        public boolean depthBufferOnly = false;

        public Config() {
            this.defaultCullFace = GL20.GL_FRONT;
        }

        public Config(String str, String str2) {
            super(str, str2);
        }
    }

    public static final String getDefaultVertexShader() {
        if (defaultVertexShader == null) {
            defaultVertexShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/shaders/depth.vertex.glsl").readString();
        }
        return defaultVertexShader;
    }

    public static final String getDefaultFragmentShader() {
        if (defaultFragmentShader == null) {
            defaultFragmentShader = Gdx.files.classpath("com/badlogic/gdx/graphics/g3d/shaders/depth.fragment.glsl").readString();
        }
        return defaultFragmentShader;
    }

    public static String createPrefix(Renderable renderable, Config config) {
        String createPrefix = DefaultShader.createPrefix(renderable, config);
        if (config.depthBufferOnly) {
            return createPrefix;
        }
        return createPrefix + "#define PackedDepthFlag\n";
    }

    public DepthShader(Renderable renderable) {
        this(renderable, new Config());
    }

    public DepthShader(Renderable renderable, Config config) {
        this(renderable, config, createPrefix(renderable, config));
    }

    /* JADX WARNING: Illegal instructions before constructor call */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public DepthShader(com.badlogic.gdx.graphics.g3d.Renderable r8, com.badlogic.gdx.graphics.g3d.shaders.DepthShader.Config r9, java.lang.String r10) {
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
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g3d.shaders.DepthShader.<init>(com.badlogic.gdx.graphics.g3d.Renderable, com.badlogic.gdx.graphics.g3d.shaders.DepthShader$Config, java.lang.String):void");
    }

    public DepthShader(Renderable renderable, Config config, String str, String str2, String str3) {
        this(renderable, config, new ShaderProgram(str + str2, str + str3));
    }

    public DepthShader(Renderable renderable, Config config, ShaderProgram shaderProgram) {
        super(renderable, config, shaderProgram);
        combineAttributes(renderable);
        this.numBones = renderable.bones == null ? 0 : config.numBones;
        int size = renderable.meshPart.mesh.getVertexAttributes().size();
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            VertexAttribute vertexAttribute = renderable.meshPart.mesh.getVertexAttributes().get(i2);
            if (vertexAttribute.usage == 64) {
                i |= 1 << vertexAttribute.unit;
            }
        }
        this.weights = i;
        this.alphaTestAttribute = new FloatAttribute(FloatAttribute.AlphaTest, config.defaultAlphaTest);
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.graphics.g3d.Shader, com.badlogic.gdx.graphics.g3d.shaders.DefaultShader
    public void begin(Camera camera, RenderContext renderContext) {
        super.begin(camera, renderContext);
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.graphics.g3d.Shader, com.badlogic.gdx.graphics.g3d.shaders.DefaultShader
    public void end() {
        super.end();
    }

    @Override // com.badlogic.gdx.graphics.g3d.Shader, com.badlogic.gdx.graphics.g3d.shaders.DefaultShader
    public boolean canRender(Renderable renderable) {
        Attributes combineAttributes = combineAttributes(renderable);
        if (combineAttributes.has(BlendingAttribute.Type)) {
            if ((this.attributesMask & BlendingAttribute.Type) != BlendingAttribute.Type) {
                return false;
            }
            if (combineAttributes.has(TextureAttribute.Diffuse) != ((this.attributesMask & TextureAttribute.Diffuse) == TextureAttribute.Diffuse)) {
                return false;
            }
        }
        boolean z = (renderable.meshPart.mesh.getVertexAttributes().getMask() & 64) == 64;
        if (z != (this.numBones > 0)) {
            return false;
        }
        if (!z) {
            return true;
        }
        int size = renderable.meshPart.mesh.getVertexAttributes().size();
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            VertexAttribute vertexAttribute = renderable.meshPart.mesh.getVertexAttributes().get(i2);
            if (vertexAttribute.usage == 64) {
                i |= 1 << vertexAttribute.unit;
            }
        }
        if (i == this.weights) {
            return true;
        }
        return false;
    }

    @Override // com.badlogic.gdx.graphics.g3d.shaders.BaseShader, com.badlogic.gdx.graphics.g3d.shaders.DefaultShader
    public void render(Renderable renderable, Attributes attributes) {
        if (attributes.has(BlendingAttribute.Type)) {
            BlendingAttribute blendingAttribute = (BlendingAttribute) attributes.get(BlendingAttribute.Type);
            attributes.remove(BlendingAttribute.Type);
            boolean has = attributes.has(FloatAttribute.AlphaTest);
            if (!has) {
                attributes.set(this.alphaTestAttribute);
            }
            if (blendingAttribute.opacity >= ((FloatAttribute) attributes.get(FloatAttribute.AlphaTest)).value) {
                super.render(renderable, attributes);
            }
            if (!has) {
                attributes.remove(FloatAttribute.AlphaTest);
            }
            attributes.set(blendingAttribute);
            return;
        }
        super.render(renderable, attributes);
    }

    private static final Attributes combineAttributes(Renderable renderable) {
        tmpAttributes.clear();
        if (renderable.environment != null) {
            tmpAttributes.set(renderable.environment);
        }
        if (renderable.material != null) {
            tmpAttributes.set(renderable.material);
        }
        return tmpAttributes;
    }
}
