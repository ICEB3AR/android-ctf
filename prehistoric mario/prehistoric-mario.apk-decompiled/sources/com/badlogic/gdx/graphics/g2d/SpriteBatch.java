package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Affine2;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix4;

public class SpriteBatch implements Batch {
    @Deprecated
    public static Mesh.VertexDataType defaultVertexDataType = Mesh.VertexDataType.VertexArray;
    private int blendDstFunc;
    private int blendDstFuncAlpha;
    private int blendSrcFunc;
    private int blendSrcFuncAlpha;
    private boolean blendingDisabled;
    private final Color color;
    float colorPacked;
    private final Matrix4 combinedMatrix;
    private ShaderProgram customShader;
    boolean drawing;
    int idx;
    float invTexHeight;
    float invTexWidth;
    Texture lastTexture;
    public int maxSpritesInBatch;
    private Mesh mesh;
    private boolean ownsShader;
    private final Matrix4 projectionMatrix;
    public int renderCalls;
    private final ShaderProgram shader;
    public int totalRenderCalls;
    private final Matrix4 transformMatrix;
    final float[] vertices;

    public SpriteBatch() {
        this(1000, null);
    }

    public SpriteBatch(int i) {
        this(i, null);
    }

    public SpriteBatch(int i, ShaderProgram shaderProgram) {
        this.idx = 0;
        this.lastTexture = null;
        this.invTexWidth = 0.0f;
        this.invTexHeight = 0.0f;
        this.drawing = false;
        this.transformMatrix = new Matrix4();
        this.projectionMatrix = new Matrix4();
        this.combinedMatrix = new Matrix4();
        this.blendingDisabled = false;
        this.blendSrcFunc = GL20.GL_SRC_ALPHA;
        this.blendDstFunc = GL20.GL_ONE_MINUS_SRC_ALPHA;
        this.blendSrcFuncAlpha = GL20.GL_SRC_ALPHA;
        this.blendDstFuncAlpha = GL20.GL_ONE_MINUS_SRC_ALPHA;
        this.customShader = null;
        this.color = new Color(1.0f, 1.0f, 1.0f, 1.0f);
        this.colorPacked = Color.WHITE_FLOAT_BITS;
        this.renderCalls = 0;
        this.totalRenderCalls = 0;
        this.maxSpritesInBatch = 0;
        if (i <= 8191) {
            int i2 = i * 6;
            this.mesh = new Mesh(Gdx.gl30 != null ? Mesh.VertexDataType.VertexBufferObjectWithVAO : defaultVertexDataType, false, i * 4, i2, new VertexAttribute(1, 2, ShaderProgram.POSITION_ATTRIBUTE), new VertexAttribute(4, 4, ShaderProgram.COLOR_ATTRIBUTE), new VertexAttribute(16, 2, "a_texCoord0"));
            this.projectionMatrix.setToOrtho2D(0.0f, 0.0f, (float) Gdx.graphics.getWidth(), (float) Gdx.graphics.getHeight());
            this.vertices = new float[(i * 20)];
            short[] sArr = new short[i2];
            int i3 = 0;
            short s = 0;
            while (i3 < i2) {
                sArr[i3] = s;
                sArr[i3 + 1] = (short) (s + 1);
                short s2 = (short) (s + 2);
                sArr[i3 + 2] = s2;
                sArr[i3 + 3] = s2;
                sArr[i3 + 4] = (short) (s + 3);
                sArr[i3 + 5] = s;
                i3 += 6;
                s = (short) (s + 4);
            }
            this.mesh.setIndices(sArr);
            if (shaderProgram == null) {
                this.shader = createDefaultShader();
                this.ownsShader = true;
                return;
            }
            this.shader = shaderProgram;
            return;
        }
        throw new IllegalArgumentException("Can't have more than 8191 sprites per batch: " + i);
    }

    public static ShaderProgram createDefaultShader() {
        ShaderProgram shaderProgram = new ShaderProgram("attribute vec4 a_position;\nattribute vec4 a_color;\nattribute vec2 a_texCoord0;\nuniform mat4 u_projTrans;\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_color = a_color;\n   v_color.a = v_color.a * (255.0/254.0);\n   v_texCoords = a_texCoord0;\n   gl_Position =  u_projTrans * a_position;\n}\n", "#ifdef GL_ES\n#define LOWP lowp\nprecision mediump float;\n#else\n#define LOWP \n#endif\nvarying LOWP vec4 v_color;\nvarying vec2 v_texCoords;\nuniform sampler2D u_texture;\nvoid main()\n{\n  gl_FragColor = v_color * texture2D(u_texture, v_texCoords);\n}");
        if (shaderProgram.isCompiled()) {
            return shaderProgram;
        }
        throw new IllegalArgumentException("Error compiling shader: " + shaderProgram.getLog());
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void begin() {
        if (!this.drawing) {
            this.renderCalls = 0;
            Gdx.gl.glDepthMask(false);
            ShaderProgram shaderProgram = this.customShader;
            if (shaderProgram != null) {
                shaderProgram.begin();
            } else {
                this.shader.begin();
            }
            setupMatrices();
            this.drawing = true;
            return;
        }
        throw new IllegalStateException("SpriteBatch.end must be called before begin.");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void end() {
        if (this.drawing) {
            if (this.idx > 0) {
                flush();
            }
            this.lastTexture = null;
            this.drawing = false;
            GL20 gl20 = Gdx.gl;
            gl20.glDepthMask(true);
            if (isBlendingEnabled()) {
                gl20.glDisable(GL20.GL_BLEND);
            }
            ShaderProgram shaderProgram = this.customShader;
            if (shaderProgram != null) {
                shaderProgram.end();
            } else {
                this.shader.end();
            }
        } else {
            throw new IllegalStateException("SpriteBatch.begin must be called before end.");
        }
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void setColor(Color color2) {
        this.color.set(color2);
        this.colorPacked = color2.toFloatBits();
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void setColor(float f, float f2, float f3, float f4) {
        this.color.set(f, f2, f3, f4);
        this.colorPacked = this.color.toFloatBits();
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public Color getColor() {
        return this.color;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void setPackedColor(float f) {
        Color.abgr8888ToColor(this.color, f);
        this.colorPacked = f;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public float getPackedColor() {
        return this.colorPacked;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(Texture texture, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, int i, int i2, int i3, int i4, boolean z, boolean z2) {
        float f10;
        float f11;
        float f12;
        float f13;
        if (this.drawing) {
            float[] fArr = this.vertices;
            if (texture != this.lastTexture) {
                switchTexture(texture);
            } else if (this.idx == fArr.length) {
                flush();
            }
            float f14 = f + f3;
            float f15 = f2 + f4;
            float f16 = -f3;
            float f17 = -f4;
            float f18 = f5 - f3;
            float f19 = f6 - f4;
            if (!(f7 == 1.0f && f8 == 1.0f)) {
                f16 *= f7;
                f17 *= f8;
                f18 *= f7;
                f19 *= f8;
            }
            if (f9 != 0.0f) {
                float cosDeg = MathUtils.cosDeg(f9);
                float sinDeg = MathUtils.sinDeg(f9);
                float f20 = cosDeg * f16;
                float f21 = f20 - (sinDeg * f17);
                float f22 = f16 * sinDeg;
                f17 = (f17 * cosDeg) + f22;
                float f23 = sinDeg * f19;
                f11 = f20 - f23;
                float f24 = f19 * cosDeg;
                float f25 = f22 + f24;
                float f26 = (cosDeg * f18) - f23;
                float f27 = f24 + (sinDeg * f18);
                float f28 = f27 - (f25 - f17);
                f12 = (f26 - f11) + f21;
                f18 = f26;
                f13 = f27;
                f19 = f25;
                f16 = f21;
                f10 = f28;
            } else {
                f12 = f18;
                f13 = f19;
                f11 = f16;
                f10 = f17;
            }
            float f29 = f16 + f14;
            float f30 = f17 + f15;
            float f31 = f11 + f14;
            float f32 = f19 + f15;
            float f33 = f18 + f14;
            float f34 = f13 + f15;
            float f35 = f12 + f14;
            float f36 = f10 + f15;
            float f37 = this.invTexWidth;
            float f38 = ((float) i) * f37;
            float f39 = this.invTexHeight;
            float f40 = ((float) (i2 + i4)) * f39;
            float f41 = ((float) (i + i3)) * f37;
            float f42 = ((float) i2) * f39;
            if (!z) {
                f38 = f41;
                f41 = f38;
            }
            if (!z2) {
                f40 = f42;
                f42 = f40;
            }
            float f43 = this.colorPacked;
            int i5 = this.idx;
            fArr[i5] = f29;
            fArr[i5 + 1] = f30;
            fArr[i5 + 2] = f43;
            fArr[i5 + 3] = f41;
            fArr[i5 + 4] = f42;
            fArr[i5 + 5] = f31;
            fArr[i5 + 6] = f32;
            fArr[i5 + 7] = f43;
            fArr[i5 + 8] = f41;
            fArr[i5 + 9] = f40;
            fArr[i5 + 10] = f33;
            fArr[i5 + 11] = f34;
            fArr[i5 + 12] = f43;
            fArr[i5 + 13] = f38;
            fArr[i5 + 14] = f40;
            fArr[i5 + 15] = f35;
            fArr[i5 + 16] = f36;
            fArr[i5 + 17] = f43;
            fArr[i5 + 18] = f38;
            fArr[i5 + 19] = f42;
            this.idx = i5 + 20;
            return;
        }
        throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(Texture texture, float f, float f2, float f3, float f4, int i, int i2, int i3, int i4, boolean z, boolean z2) {
        if (this.drawing) {
            float[] fArr = this.vertices;
            if (texture != this.lastTexture) {
                switchTexture(texture);
            } else if (this.idx == fArr.length) {
                flush();
            }
            float f5 = this.invTexWidth;
            float f6 = ((float) i) * f5;
            float f7 = this.invTexHeight;
            float f8 = ((float) (i4 + i2)) * f7;
            float f9 = ((float) (i + i3)) * f5;
            float f10 = ((float) i2) * f7;
            float f11 = f3 + f;
            float f12 = f4 + f2;
            if (z) {
                f9 = f6;
                f6 = f9;
            }
            if (!z2) {
                f8 = f10;
                f10 = f8;
            }
            float f13 = this.colorPacked;
            int i5 = this.idx;
            fArr[i5] = f;
            fArr[i5 + 1] = f2;
            fArr[i5 + 2] = f13;
            fArr[i5 + 3] = f6;
            fArr[i5 + 4] = f10;
            fArr[i5 + 5] = f;
            fArr[i5 + 6] = f12;
            fArr[i5 + 7] = f13;
            fArr[i5 + 8] = f6;
            fArr[i5 + 9] = f8;
            fArr[i5 + 10] = f11;
            fArr[i5 + 11] = f12;
            fArr[i5 + 12] = f13;
            fArr[i5 + 13] = f9;
            fArr[i5 + 14] = f8;
            fArr[i5 + 15] = f11;
            fArr[i5 + 16] = f2;
            fArr[i5 + 17] = f13;
            fArr[i5 + 18] = f9;
            fArr[i5 + 19] = f10;
            this.idx = i5 + 20;
            return;
        }
        throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(Texture texture, float f, float f2, int i, int i2, int i3, int i4) {
        if (this.drawing) {
            float[] fArr = this.vertices;
            if (texture != this.lastTexture) {
                switchTexture(texture);
            } else if (this.idx == fArr.length) {
                flush();
            }
            float f3 = this.invTexWidth;
            float f4 = ((float) i) * f3;
            float f5 = this.invTexHeight;
            float f6 = ((float) (i2 + i4)) * f5;
            float f7 = ((float) (i + i3)) * f3;
            float f8 = ((float) i2) * f5;
            float f9 = ((float) i3) + f;
            float f10 = ((float) i4) + f2;
            float f11 = this.colorPacked;
            int i5 = this.idx;
            fArr[i5] = f;
            fArr[i5 + 1] = f2;
            fArr[i5 + 2] = f11;
            fArr[i5 + 3] = f4;
            fArr[i5 + 4] = f6;
            fArr[i5 + 5] = f;
            fArr[i5 + 6] = f10;
            fArr[i5 + 7] = f11;
            fArr[i5 + 8] = f4;
            fArr[i5 + 9] = f8;
            fArr[i5 + 10] = f9;
            fArr[i5 + 11] = f10;
            fArr[i5 + 12] = f11;
            fArr[i5 + 13] = f7;
            fArr[i5 + 14] = f8;
            fArr[i5 + 15] = f9;
            fArr[i5 + 16] = f2;
            fArr[i5 + 17] = f11;
            fArr[i5 + 18] = f7;
            fArr[i5 + 19] = f6;
            this.idx = i5 + 20;
            return;
        }
        throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(Texture texture, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        if (this.drawing) {
            float[] fArr = this.vertices;
            if (texture != this.lastTexture) {
                switchTexture(texture);
            } else if (this.idx == fArr.length) {
                flush();
            }
            float f9 = f3 + f;
            float f10 = f4 + f2;
            float f11 = this.colorPacked;
            int i = this.idx;
            fArr[i] = f;
            fArr[i + 1] = f2;
            fArr[i + 2] = f11;
            fArr[i + 3] = f5;
            fArr[i + 4] = f6;
            fArr[i + 5] = f;
            fArr[i + 6] = f10;
            fArr[i + 7] = f11;
            fArr[i + 8] = f5;
            fArr[i + 9] = f8;
            fArr[i + 10] = f9;
            fArr[i + 11] = f10;
            fArr[i + 12] = f11;
            fArr[i + 13] = f7;
            fArr[i + 14] = f8;
            fArr[i + 15] = f9;
            fArr[i + 16] = f2;
            fArr[i + 17] = f11;
            fArr[i + 18] = f7;
            fArr[i + 19] = f6;
            this.idx = i + 20;
            return;
        }
        throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(Texture texture, float f, float f2) {
        draw(texture, f, f2, (float) texture.getWidth(), (float) texture.getHeight());
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(Texture texture, float f, float f2, float f3, float f4) {
        if (this.drawing) {
            float[] fArr = this.vertices;
            if (texture != this.lastTexture) {
                switchTexture(texture);
            } else if (this.idx == fArr.length) {
                flush();
            }
            float f5 = f3 + f;
            float f6 = f4 + f2;
            float f7 = this.colorPacked;
            int i = this.idx;
            fArr[i] = f;
            fArr[i + 1] = f2;
            fArr[i + 2] = f7;
            fArr[i + 3] = 0.0f;
            fArr[i + 4] = 1.0f;
            fArr[i + 5] = f;
            fArr[i + 6] = f6;
            fArr[i + 7] = f7;
            fArr[i + 8] = 0.0f;
            fArr[i + 9] = 0.0f;
            fArr[i + 10] = f5;
            fArr[i + 11] = f6;
            fArr[i + 12] = f7;
            fArr[i + 13] = 1.0f;
            fArr[i + 14] = 0.0f;
            fArr[i + 15] = f5;
            fArr[i + 16] = f2;
            fArr[i + 17] = f7;
            fArr[i + 18] = 1.0f;
            fArr[i + 19] = 1.0f;
            this.idx = i + 20;
            return;
        }
        throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002c A[LOOP:0: B:10:0x0029->B:12:0x002c, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0040 A[SYNTHETIC] */
    @Override // com.badlogic.gdx.graphics.g2d.Batch
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void draw(com.badlogic.gdx.graphics.Texture r4, float[] r5, int r6, int r7) {
        /*
            r3 = this;
            boolean r0 = r3.drawing
            if (r0 == 0) goto L_0x0041
            float[] r0 = r3.vertices
            int r0 = r0.length
            com.badlogic.gdx.graphics.Texture r1 = r3.lastTexture
            if (r4 == r1) goto L_0x000f
            r3.switchTexture(r4)
            goto L_0x0018
        L_0x000f:
            int r4 = r3.idx
            int r4 = r0 - r4
            if (r4 != 0) goto L_0x0019
            r3.flush()
        L_0x0018:
            r4 = r0
        L_0x0019:
            int r4 = java.lang.Math.min(r4, r7)
            float[] r1 = r3.vertices
            int r2 = r3.idx
            java.lang.System.arraycopy(r5, r6, r1, r2, r4)
            int r1 = r3.idx
            int r1 = r1 + r4
            r3.idx = r1
        L_0x0029:
            int r7 = r7 - r4
            if (r7 <= 0) goto L_0x0040
            int r6 = r6 + r4
            r3.flush()
            int r4 = java.lang.Math.min(r0, r7)
            float[] r1 = r3.vertices
            r2 = 0
            java.lang.System.arraycopy(r5, r6, r1, r2, r4)
            int r1 = r3.idx
            int r1 = r1 + r4
            r3.idx = r1
            goto L_0x0029
        L_0x0040:
            return
        L_0x0041:
            java.lang.IllegalStateException r4 = new java.lang.IllegalStateException
            java.lang.String r5 = "SpriteBatch.begin must be called before draw."
            r4.<init>(r5)
            goto L_0x004a
        L_0x0049:
            throw r4
        L_0x004a:
            goto L_0x0049
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g2d.SpriteBatch.draw(com.badlogic.gdx.graphics.Texture, float[], int, int):void");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(TextureRegion textureRegion, float f, float f2) {
        draw(textureRegion, f, f2, (float) textureRegion.getRegionWidth(), (float) textureRegion.getRegionHeight());
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(TextureRegion textureRegion, float f, float f2, float f3, float f4) {
        if (this.drawing) {
            float[] fArr = this.vertices;
            Texture texture = textureRegion.texture;
            if (texture != this.lastTexture) {
                switchTexture(texture);
            } else if (this.idx == fArr.length) {
                flush();
            }
            float f5 = f3 + f;
            float f6 = f4 + f2;
            float f7 = textureRegion.u;
            float f8 = textureRegion.v2;
            float f9 = textureRegion.u2;
            float f10 = textureRegion.v;
            float f11 = this.colorPacked;
            int i = this.idx;
            fArr[i] = f;
            fArr[i + 1] = f2;
            fArr[i + 2] = f11;
            fArr[i + 3] = f7;
            fArr[i + 4] = f8;
            fArr[i + 5] = f;
            fArr[i + 6] = f6;
            fArr[i + 7] = f11;
            fArr[i + 8] = f7;
            fArr[i + 9] = f10;
            fArr[i + 10] = f5;
            fArr[i + 11] = f6;
            fArr[i + 12] = f11;
            fArr[i + 13] = f9;
            fArr[i + 14] = f10;
            fArr[i + 15] = f5;
            fArr[i + 16] = f2;
            fArr[i + 17] = f11;
            fArr[i + 18] = f9;
            fArr[i + 19] = f8;
            this.idx = i + 20;
            return;
        }
        throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(TextureRegion textureRegion, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9) {
        float f10;
        float f11;
        float f12;
        float f13;
        float f14;
        if (this.drawing) {
            float[] fArr = this.vertices;
            Texture texture = textureRegion.texture;
            if (texture != this.lastTexture) {
                switchTexture(texture);
            } else if (this.idx == fArr.length) {
                flush();
            }
            float f15 = f + f3;
            float f16 = f2 + f4;
            float f17 = -f3;
            float f18 = -f4;
            float f19 = f5 - f3;
            float f20 = f6 - f4;
            if (!(f7 == 1.0f && f8 == 1.0f)) {
                f17 *= f7;
                f18 *= f8;
                f19 *= f7;
                f20 *= f8;
            }
            if (f9 != 0.0f) {
                float cosDeg = MathUtils.cosDeg(f9);
                float sinDeg = MathUtils.sinDeg(f9);
                float f21 = cosDeg * f17;
                f11 = f21 - (sinDeg * f18);
                float f22 = f17 * sinDeg;
                f18 = (f18 * cosDeg) + f22;
                float f23 = sinDeg * f20;
                f12 = f21 - f23;
                float f24 = f20 * cosDeg;
                float f25 = f22 + f24;
                f14 = (cosDeg * f19) - f23;
                float f26 = f24 + (sinDeg * f19);
                f19 = f11 + (f14 - f12);
                f10 = f26 - (f25 - f18);
                f13 = f26;
                f20 = f25;
            } else {
                f14 = f19;
                f13 = f20;
                f12 = f17;
                f11 = f12;
                f10 = f18;
            }
            float f27 = f11 + f15;
            float f28 = f18 + f16;
            float f29 = f12 + f15;
            float f30 = f20 + f16;
            float f31 = f14 + f15;
            float f32 = f13 + f16;
            float f33 = f19 + f15;
            float f34 = f10 + f16;
            float f35 = textureRegion.u;
            float f36 = textureRegion.v2;
            float f37 = textureRegion.u2;
            float f38 = textureRegion.v;
            float f39 = this.colorPacked;
            int i = this.idx;
            fArr[i] = f27;
            fArr[i + 1] = f28;
            fArr[i + 2] = f39;
            fArr[i + 3] = f35;
            fArr[i + 4] = f36;
            fArr[i + 5] = f29;
            fArr[i + 6] = f30;
            fArr[i + 7] = f39;
            fArr[i + 8] = f35;
            fArr[i + 9] = f38;
            fArr[i + 10] = f31;
            fArr[i + 11] = f32;
            fArr[i + 12] = f39;
            fArr[i + 13] = f37;
            fArr[i + 14] = f38;
            fArr[i + 15] = f33;
            fArr[i + 16] = f34;
            fArr[i + 17] = f39;
            fArr[i + 18] = f37;
            fArr[i + 19] = f36;
            this.idx = i + 20;
            return;
        }
        throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(TextureRegion textureRegion, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, boolean z) {
        float f10;
        float f11;
        float f12;
        float f13;
        float f14;
        float f15;
        float f16;
        float f17;
        float f18;
        float f19;
        float f20;
        float f21;
        float f22;
        if (this.drawing) {
            float[] fArr = this.vertices;
            Texture texture = textureRegion.texture;
            if (texture != this.lastTexture) {
                switchTexture(texture);
            } else if (this.idx == fArr.length) {
                flush();
            }
            float f23 = f + f3;
            float f24 = f2 + f4;
            float f25 = -f3;
            float f26 = -f4;
            float f27 = f5 - f3;
            float f28 = f6 - f4;
            if (!(f7 == 1.0f && f8 == 1.0f)) {
                f25 *= f7;
                f26 *= f8;
                f27 *= f7;
                f28 *= f8;
            }
            if (f9 != 0.0f) {
                float cosDeg = MathUtils.cosDeg(f9);
                float sinDeg = MathUtils.sinDeg(f9);
                float f29 = cosDeg * f25;
                float f30 = f29 - (sinDeg * f26);
                float f31 = f25 * sinDeg;
                f26 = (f26 * cosDeg) + f31;
                float f32 = sinDeg * f28;
                f11 = f29 - f32;
                float f33 = f28 * cosDeg;
                float f34 = f31 + f33;
                f13 = (cosDeg * f27) - f32;
                float f35 = f33 + (sinDeg * f27);
                float f36 = f35 - (f34 - f26);
                f12 = (f13 - f11) + f30;
                f14 = f35;
                f28 = f34;
                f25 = f30;
                f10 = f36;
            } else {
                f13 = f27;
                f12 = f13;
                f14 = f28;
                f11 = f25;
                f10 = f26;
            }
            float f37 = f25 + f23;
            float f38 = f26 + f24;
            float f39 = f11 + f23;
            float f40 = f28 + f24;
            float f41 = f13 + f23;
            float f42 = f14 + f24;
            float f43 = f12 + f23;
            float f44 = f10 + f24;
            if (z) {
                float f45 = textureRegion.u2;
                f20 = textureRegion.v2;
                f19 = textureRegion.u;
                f18 = textureRegion.v2;
                f17 = textureRegion.u;
                f16 = f45;
                f15 = textureRegion.v;
                f21 = textureRegion.u2;
                f22 = textureRegion.v;
            } else {
                float f46 = textureRegion.u;
                f20 = textureRegion.v;
                f19 = textureRegion.u2;
                f18 = textureRegion.v;
                f17 = textureRegion.u2;
                f16 = f46;
                f15 = textureRegion.v2;
                f21 = textureRegion.u;
                f22 = textureRegion.v2;
            }
            float f47 = this.colorPacked;
            int i = this.idx;
            fArr[i] = f37;
            fArr[i + 1] = f38;
            fArr[i + 2] = f47;
            fArr[i + 3] = f16;
            fArr[i + 4] = f20;
            fArr[i + 5] = f39;
            fArr[i + 6] = f40;
            fArr[i + 7] = f47;
            fArr[i + 8] = f19;
            fArr[i + 9] = f18;
            fArr[i + 10] = f41;
            fArr[i + 11] = f42;
            fArr[i + 12] = f47;
            fArr[i + 13] = f17;
            fArr[i + 14] = f15;
            fArr[i + 15] = f43;
            fArr[i + 16] = f44;
            fArr[i + 17] = f47;
            fArr[i + 18] = f21;
            fArr[i + 19] = f22;
            this.idx = i + 20;
            return;
        }
        throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void draw(TextureRegion textureRegion, float f, float f2, Affine2 affine2) {
        if (this.drawing) {
            float[] fArr = this.vertices;
            Texture texture = textureRegion.texture;
            if (texture != this.lastTexture) {
                switchTexture(texture);
            } else if (this.idx == fArr.length) {
                flush();
            }
            float f3 = affine2.m02;
            float f4 = affine2.m12;
            float f5 = (affine2.m01 * f2) + affine2.m02;
            float f6 = (affine2.m11 * f2) + affine2.m12;
            float f7 = (affine2.m00 * f) + (affine2.m01 * f2) + affine2.m02;
            float f8 = (affine2.m10 * f) + (affine2.m11 * f2) + affine2.m12;
            float f9 = (affine2.m00 * f) + affine2.m02;
            float f10 = (affine2.m10 * f) + affine2.m12;
            float f11 = textureRegion.u;
            float f12 = textureRegion.v2;
            float f13 = textureRegion.u2;
            float f14 = textureRegion.v;
            float f15 = this.colorPacked;
            int i = this.idx;
            fArr[i] = f3;
            fArr[i + 1] = f4;
            fArr[i + 2] = f15;
            fArr[i + 3] = f11;
            fArr[i + 4] = f12;
            fArr[i + 5] = f5;
            fArr[i + 6] = f6;
            fArr[i + 7] = f15;
            fArr[i + 8] = f11;
            fArr[i + 9] = f14;
            fArr[i + 10] = f7;
            fArr[i + 11] = f8;
            fArr[i + 12] = f15;
            fArr[i + 13] = f13;
            fArr[i + 14] = f14;
            fArr[i + 15] = f9;
            fArr[i + 16] = f10;
            fArr[i + 17] = f15;
            fArr[i + 18] = f13;
            fArr[i + 19] = f12;
            this.idx = i + 20;
            return;
        }
        throw new IllegalStateException("SpriteBatch.begin must be called before draw.");
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void flush() {
        int i = this.idx;
        if (i != 0) {
            this.renderCalls++;
            this.totalRenderCalls++;
            int i2 = i / 20;
            if (i2 > this.maxSpritesInBatch) {
                this.maxSpritesInBatch = i2;
            }
            int i3 = i2 * 6;
            this.lastTexture.bind();
            Mesh mesh2 = this.mesh;
            mesh2.setVertices(this.vertices, 0, this.idx);
            mesh2.getIndicesBuffer().position(0);
            mesh2.getIndicesBuffer().limit(i3);
            if (this.blendingDisabled) {
                Gdx.gl.glDisable(GL20.GL_BLEND);
            } else {
                Gdx.gl.glEnable(GL20.GL_BLEND);
                if (this.blendSrcFunc != -1) {
                    Gdx.gl.glBlendFuncSeparate(this.blendSrcFunc, this.blendDstFunc, this.blendSrcFuncAlpha, this.blendDstFuncAlpha);
                }
            }
            ShaderProgram shaderProgram = this.customShader;
            if (shaderProgram == null) {
                shaderProgram = this.shader;
            }
            mesh2.render(shaderProgram, 4, 0, i3);
            this.idx = 0;
        }
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void disableBlending() {
        if (!this.blendingDisabled) {
            flush();
            this.blendingDisabled = true;
        }
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void enableBlending() {
        if (this.blendingDisabled) {
            flush();
            this.blendingDisabled = false;
        }
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void setBlendFunction(int i, int i2) {
        setBlendFunctionSeparate(i, i2, i, i2);
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void setBlendFunctionSeparate(int i, int i2, int i3, int i4) {
        if (this.blendSrcFunc != i || this.blendDstFunc != i2 || this.blendSrcFuncAlpha != i3 || this.blendDstFuncAlpha != i4) {
            flush();
            this.blendSrcFunc = i;
            this.blendDstFunc = i2;
            this.blendSrcFuncAlpha = i3;
            this.blendDstFuncAlpha = i4;
        }
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public int getBlendSrcFunc() {
        return this.blendSrcFunc;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public int getBlendDstFunc() {
        return this.blendDstFunc;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public int getBlendSrcFuncAlpha() {
        return this.blendSrcFuncAlpha;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public int getBlendDstFuncAlpha() {
        return this.blendDstFuncAlpha;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        ShaderProgram shaderProgram;
        this.mesh.dispose();
        if (this.ownsShader && (shaderProgram = this.shader) != null) {
            shaderProgram.dispose();
        }
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public Matrix4 getProjectionMatrix() {
        return this.projectionMatrix;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public Matrix4 getTransformMatrix() {
        return this.transformMatrix;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void setProjectionMatrix(Matrix4 matrix4) {
        if (this.drawing) {
            flush();
        }
        this.projectionMatrix.set(matrix4);
        if (this.drawing) {
            setupMatrices();
        }
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void setTransformMatrix(Matrix4 matrix4) {
        if (this.drawing) {
            flush();
        }
        this.transformMatrix.set(matrix4);
        if (this.drawing) {
            setupMatrices();
        }
    }

    private void setupMatrices() {
        this.combinedMatrix.set(this.projectionMatrix).mul(this.transformMatrix);
        ShaderProgram shaderProgram = this.customShader;
        if (shaderProgram != null) {
            shaderProgram.setUniformMatrix("u_projTrans", this.combinedMatrix);
            this.customShader.setUniformi("u_texture", 0);
            return;
        }
        this.shader.setUniformMatrix("u_projTrans", this.combinedMatrix);
        this.shader.setUniformi("u_texture", 0);
    }

    /* access modifiers changed from: protected */
    public void switchTexture(Texture texture) {
        flush();
        this.lastTexture = texture;
        this.invTexWidth = 1.0f / ((float) texture.getWidth());
        this.invTexHeight = 1.0f / ((float) texture.getHeight());
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public void setShader(ShaderProgram shaderProgram) {
        if (this.drawing) {
            flush();
            ShaderProgram shaderProgram2 = this.customShader;
            if (shaderProgram2 != null) {
                shaderProgram2.end();
            } else {
                this.shader.end();
            }
        }
        this.customShader = shaderProgram;
        if (this.drawing) {
            ShaderProgram shaderProgram3 = this.customShader;
            if (shaderProgram3 != null) {
                shaderProgram3.begin();
            } else {
                this.shader.begin();
            }
            setupMatrices();
        }
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public ShaderProgram getShader() {
        ShaderProgram shaderProgram = this.customShader;
        return shaderProgram == null ? this.shader : shaderProgram;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public boolean isBlendingEnabled() {
        return !this.blendingDisabled;
    }

    @Override // com.badlogic.gdx.graphics.g2d.Batch
    public boolean isDrawing() {
        return this.drawing;
    }
}
