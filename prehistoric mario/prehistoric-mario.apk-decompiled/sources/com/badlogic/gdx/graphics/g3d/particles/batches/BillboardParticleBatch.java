package com.badlogic.gdx.graphics.g3d.particles.batches;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DepthTestAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleShader;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.renderers.BillboardControllerRenderData;
import com.badlogic.gdx.graphics.g3d.shaders.DefaultShader;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public class BillboardParticleBatch extends BufferedParticleBatch<BillboardControllerRenderData> {
    private static final VertexAttributes CPU_ATTRIBUTES = new VertexAttributes(new VertexAttribute(1, 3, ShaderProgram.POSITION_ATTRIBUTE), new VertexAttribute(16, 2, "a_texCoord0"), new VertexAttribute(2, 4, ShaderProgram.COLOR_ATTRIBUTE));
    private static final int CPU_COLOR_OFFSET = ((short) (CPU_ATTRIBUTES.findByUsage(2).offset / 4));
    private static final int CPU_POSITION_OFFSET = ((short) (CPU_ATTRIBUTES.findByUsage(1).offset / 4));
    private static final int CPU_UV_OFFSET = ((short) (CPU_ATTRIBUTES.findByUsage(16).offset / 4));
    private static final int CPU_VERTEX_SIZE = (CPU_ATTRIBUTES.vertexSize / 4);
    private static final VertexAttributes GPU_ATTRIBUTES = new VertexAttributes(new VertexAttribute(1, 3, ShaderProgram.POSITION_ATTRIBUTE), new VertexAttribute(16, 2, "a_texCoord0"), new VertexAttribute(2, 4, ShaderProgram.COLOR_ATTRIBUTE), new VertexAttribute(512, 4, "a_sizeAndRotation"));
    private static final int GPU_COLOR_OFFSET = ((short) (GPU_ATTRIBUTES.findByUsage(2).offset / 4));
    private static final int GPU_POSITION_OFFSET = ((short) (GPU_ATTRIBUTES.findByUsage(1).offset / 4));
    private static final int GPU_SIZE_ROTATION_OFFSET = ((short) (GPU_ATTRIBUTES.findByUsage(512).offset / 4));
    private static final int GPU_UV_OFFSET = ((short) (GPU_ATTRIBUTES.findByUsage(16).offset / 4));
    private static final int GPU_VERTEX_SIZE = (GPU_ATTRIBUTES.vertexSize / 4);
    private static final int MAX_PARTICLES_PER_MESH = 8191;
    private static final int MAX_VERTICES_PER_MESH = 32764;
    protected static final Matrix3 TMP_M3 = new Matrix3();
    protected static final Vector3 TMP_V1 = new Vector3();
    protected static final Vector3 TMP_V2 = new Vector3();
    protected static final Vector3 TMP_V3 = new Vector3();
    protected static final Vector3 TMP_V4 = new Vector3();
    protected static final Vector3 TMP_V5 = new Vector3();
    protected static final Vector3 TMP_V6 = new Vector3();
    protected static final int directionUsage = 1024;
    protected static final int sizeAndRotationUsage = 512;
    protected BlendingAttribute blendingAttribute;
    private VertexAttributes currentAttributes;
    private int currentVertexSize;
    protected DepthTestAttribute depthTestAttribute;
    private short[] indices;
    protected ParticleShader.AlignMode mode;
    private RenderablePool renderablePool;
    private Array<Renderable> renderables;
    Shader shader;
    protected Texture texture;
    protected boolean useGPU;
    private float[] vertices;

    /* access modifiers changed from: private */
    public class RenderablePool extends Pool<Renderable> {
        public RenderablePool() {
        }

        @Override // com.badlogic.gdx.utils.Pool
        public Renderable newObject() {
            return BillboardParticleBatch.this.allocRenderable();
        }
    }

    public static class Config {
        ParticleShader.AlignMode mode;
        boolean useGPU;

        public Config() {
        }

        public Config(boolean z, ParticleShader.AlignMode alignMode) {
            this.useGPU = z;
            this.mode = alignMode;
        }
    }

    public BillboardParticleBatch(ParticleShader.AlignMode alignMode, boolean z, int i, BlendingAttribute blendingAttribute2, DepthTestAttribute depthTestAttribute2) {
        super(BillboardControllerRenderData.class);
        this.currentVertexSize = 0;
        this.useGPU = false;
        this.mode = ParticleShader.AlignMode.Screen;
        this.renderables = new Array<>();
        this.renderablePool = new RenderablePool();
        this.blendingAttribute = blendingAttribute2;
        this.depthTestAttribute = depthTestAttribute2;
        if (this.blendingAttribute == null) {
            this.blendingAttribute = new BlendingAttribute(1, GL20.GL_ONE_MINUS_SRC_ALPHA, 1.0f);
        }
        if (this.depthTestAttribute == null) {
            this.depthTestAttribute = new DepthTestAttribute(GL20.GL_LEQUAL, false);
        }
        allocIndices();
        initRenderData();
        ensureCapacity(i);
        setUseGpu(z);
        setAlignMode(alignMode);
    }

    public BillboardParticleBatch(ParticleShader.AlignMode alignMode, boolean z, int i) {
        this(alignMode, z, i, null, null);
    }

    public BillboardParticleBatch() {
        this(ParticleShader.AlignMode.Screen, false, 100);
    }

    public BillboardParticleBatch(int i) {
        this(ParticleShader.AlignMode.Screen, false, i);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.batches.BufferedParticleBatch
    public void allocParticlesData(int i) {
        this.vertices = new float[(this.currentVertexSize * 4 * i)];
        allocRenderables(i);
    }

    /* access modifiers changed from: protected */
    public Renderable allocRenderable() {
        Renderable renderable = new Renderable();
        renderable.meshPart.primitiveType = 4;
        renderable.meshPart.offset = 0;
        renderable.material = new Material(this.blendingAttribute, this.depthTestAttribute, TextureAttribute.createDiffuse(this.texture));
        renderable.meshPart.mesh = new Mesh(false, (int) MAX_VERTICES_PER_MESH, 49146, this.currentAttributes);
        renderable.meshPart.mesh.setIndices(this.indices);
        renderable.shader = this.shader;
        return renderable;
    }

    private void allocIndices() {
        this.indices = new short[49146];
        int i = 0;
        int i2 = 0;
        while (i < 49146) {
            short[] sArr = this.indices;
            short s = (short) i2;
            sArr[i] = s;
            sArr[i + 1] = (short) (i2 + 1);
            short s2 = (short) (i2 + 2);
            sArr[i + 2] = s2;
            sArr[i + 3] = s2;
            sArr[i + 4] = (short) (i2 + 3);
            sArr[i + 5] = s;
            i += 6;
            i2 += 4;
        }
    }

    private void allocRenderables(int i) {
        int ceil = MathUtils.ceil((float) (i / MAX_PARTICLES_PER_MESH));
        int free = this.renderablePool.getFree();
        if (free < ceil) {
            int i2 = ceil - free;
            for (int i3 = 0; i3 < i2; i3++) {
                RenderablePool renderablePool2 = this.renderablePool;
                renderablePool2.free(renderablePool2.newObject());
            }
        }
    }

    /* access modifiers changed from: protected */
    public Shader getShader(Renderable renderable) {
        Shader particleShader = this.useGPU ? new ParticleShader(renderable, new ParticleShader.Config(this.mode)) : new DefaultShader(renderable);
        particleShader.init();
        return particleShader;
    }

    private void allocShader() {
        Renderable allocRenderable = allocRenderable();
        Shader shader2 = getShader(allocRenderable);
        allocRenderable.shader = shader2;
        this.shader = shader2;
        this.renderablePool.free(allocRenderable);
    }

    private void clearRenderablesPool() {
        this.renderablePool.freeAll(this.renderables);
        int free = this.renderablePool.getFree();
        for (int i = 0; i < free; i++) {
            ((Renderable) this.renderablePool.obtain()).meshPart.mesh.dispose();
        }
        this.renderables.clear();
    }

    public void setVertexData() {
        if (this.useGPU) {
            this.currentAttributes = GPU_ATTRIBUTES;
            this.currentVertexSize = GPU_VERTEX_SIZE;
            return;
        }
        this.currentAttributes = CPU_ATTRIBUTES;
        this.currentVertexSize = CPU_VERTEX_SIZE;
    }

    private void initRenderData() {
        setVertexData();
        clearRenderablesPool();
        allocShader();
        resetCapacity();
    }

    public void setAlignMode(ParticleShader.AlignMode alignMode) {
        if (alignMode != this.mode) {
            this.mode = alignMode;
            if (this.useGPU) {
                initRenderData();
                allocRenderables(this.bufferedParticlesCount);
            }
        }
    }

    public ParticleShader.AlignMode getAlignMode() {
        return this.mode;
    }

    public void setUseGpu(boolean z) {
        if (this.useGPU != z) {
            this.useGPU = z;
            initRenderData();
            allocRenderables(this.bufferedParticlesCount);
        }
    }

    public boolean isUseGPU() {
        return this.useGPU;
    }

    public void setTexture(Texture texture2) {
        this.renderablePool.freeAll(this.renderables);
        this.renderables.clear();
        int free = this.renderablePool.getFree();
        for (int i = 0; i < free; i++) {
            ((TextureAttribute) ((Renderable) this.renderablePool.obtain()).material.get(TextureAttribute.Diffuse)).textureDescription.texture = texture2;
        }
        this.texture = texture2;
    }

    public Texture getTexture() {
        return this.texture;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.batches.BufferedParticleBatch, com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch
    public void begin() {
        super.begin();
        this.renderablePool.freeAll(this.renderables);
        this.renderables.clear();
    }

    private static void putVertex(float[] fArr, int i, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12, float f13) {
        int i2 = GPU_POSITION_OFFSET;
        fArr[i + i2] = f;
        fArr[i + i2 + 1] = f2;
        fArr[i2 + i + 2] = f3;
        int i3 = GPU_UV_OFFSET;
        fArr[i + i3] = f4;
        fArr[i3 + i + 1] = f5;
        int i4 = GPU_SIZE_ROTATION_OFFSET;
        fArr[i + i4] = f6;
        fArr[i + i4 + 1] = f7;
        fArr[i + i4 + 2] = f8;
        fArr[i4 + i + 3] = f9;
        int i5 = GPU_COLOR_OFFSET;
        fArr[i + i5] = f10;
        fArr[i + i5 + 1] = f11;
        fArr[i + i5 + 2] = f12;
        fArr[i5 + i + 3] = f13;
    }

    private static void putVertex(float[] fArr, int i, Vector3 vector3, float f, float f2, float f3, float f4, float f5, float f6) {
        fArr[CPU_POSITION_OFFSET + i] = vector3.x;
        fArr[CPU_POSITION_OFFSET + i + 1] = vector3.y;
        fArr[CPU_POSITION_OFFSET + i + 2] = vector3.z;
        int i2 = CPU_UV_OFFSET;
        fArr[i + i2] = f;
        fArr[i2 + i + 1] = f2;
        int i3 = CPU_COLOR_OFFSET;
        fArr[i + i3] = f3;
        fArr[i + i3 + 1] = f4;
        fArr[i + i3 + 2] = f5;
        fArr[i + i3 + 3] = f6;
    }

    private void fillVerticesGPU(int[] iArr) {
        Iterator it = this.renderData.iterator();
        int i = 0;
        while (it.hasNext()) {
            BillboardControllerRenderData billboardControllerRenderData = (BillboardControllerRenderData) it.next();
            ParallelArray.FloatChannel floatChannel = billboardControllerRenderData.scaleChannel;
            ParallelArray.FloatChannel floatChannel2 = billboardControllerRenderData.regionChannel;
            ParallelArray.FloatChannel floatChannel3 = billboardControllerRenderData.positionChannel;
            ParallelArray.FloatChannel floatChannel4 = billboardControllerRenderData.colorChannel;
            ParallelArray.FloatChannel floatChannel5 = billboardControllerRenderData.rotationChannel;
            int i2 = billboardControllerRenderData.controller.particles.size;
            int i3 = i;
            int i4 = 0;
            while (i4 < i2) {
                int i5 = iArr[i3] * this.currentVertexSize * 4;
                float f = floatChannel.data[floatChannel.strideSize * i4];
                int i6 = floatChannel2.strideSize * i4;
                int i7 = floatChannel3.strideSize * i4;
                int i8 = floatChannel4.strideSize * i4;
                int i9 = floatChannel5.strideSize * i4;
                float f2 = floatChannel3.data[i7 + 0];
                float f3 = floatChannel3.data[i7 + 1];
                float f4 = floatChannel3.data[i7 + 2];
                float f5 = floatChannel2.data[i6 + 0];
                float f6 = floatChannel2.data[i6 + 1];
                float f7 = floatChannel2.data[i6 + 2];
                float f8 = floatChannel2.data[i6 + 3];
                float f9 = floatChannel2.data[i6 + 4] * f;
                float f10 = floatChannel2.data[i6 + 5] * f;
                float f11 = floatChannel4.data[i8 + 0];
                float f12 = floatChannel4.data[i8 + 1];
                float f13 = floatChannel4.data[i8 + 2];
                float f14 = floatChannel4.data[i8 + 3];
                float f15 = floatChannel5.data[i9 + 0];
                float f16 = floatChannel5.data[i9 + 1];
                float f17 = -f9;
                float f18 = -f10;
                putVertex(this.vertices, i5, f2, f3, f4, f5, f8, f17, f18, f15, f16, f11, f12, f13, f14);
                int i10 = i5 + this.currentVertexSize;
                putVertex(this.vertices, i10, f2, f3, f4, f7, f8, f9, f18, f15, f16, f11, f12, f13, f14);
                int i11 = i10 + this.currentVertexSize;
                putVertex(this.vertices, i11, f2, f3, f4, f7, f6, f9, f10, f15, f16, f11, f12, f13, f14);
                putVertex(this.vertices, i11 + this.currentVertexSize, f2, f3, f4, f5, f6, f17, f10, f15, f16, f11, f12, f13, f14);
                int i12 = this.currentVertexSize;
                i4++;
                i3++;
                it = it;
                i2 = i2;
                floatChannel = floatChannel;
                floatChannel3 = floatChannel3;
            }
            i = i3;
        }
    }

    private void fillVerticesToViewPointCPU(int[] iArr) {
        Iterator it = this.renderData.iterator();
        int i = 0;
        while (it.hasNext()) {
            BillboardControllerRenderData billboardControllerRenderData = (BillboardControllerRenderData) it.next();
            ParallelArray.FloatChannel floatChannel = billboardControllerRenderData.scaleChannel;
            ParallelArray.FloatChannel floatChannel2 = billboardControllerRenderData.regionChannel;
            ParallelArray.FloatChannel floatChannel3 = billboardControllerRenderData.positionChannel;
            ParallelArray.FloatChannel floatChannel4 = billboardControllerRenderData.colorChannel;
            ParallelArray.FloatChannel floatChannel5 = billboardControllerRenderData.rotationChannel;
            int i2 = billboardControllerRenderData.controller.particles.size;
            int i3 = i;
            int i4 = 0;
            while (i4 < i2) {
                int i5 = iArr[i3] * this.currentVertexSize * 4;
                float f = floatChannel.data[floatChannel.strideSize * i4];
                int i6 = floatChannel2.strideSize * i4;
                int i7 = floatChannel3.strideSize * i4;
                int i8 = floatChannel4.strideSize * i4;
                int i9 = floatChannel5.strideSize * i4;
                float f2 = floatChannel3.data[i7 + 0];
                float f3 = floatChannel3.data[i7 + 1];
                float f4 = floatChannel3.data[i7 + 2];
                float f5 = floatChannel2.data[i6 + 0];
                float f6 = floatChannel2.data[i6 + 1];
                float f7 = floatChannel2.data[i6 + 2];
                float f8 = floatChannel2.data[i6 + 3];
                float f9 = floatChannel2.data[i6 + 4] * f;
                float f10 = floatChannel2.data[i6 + 5] * f;
                float f11 = floatChannel4.data[i8 + 0];
                float f12 = floatChannel4.data[i8 + 1];
                float f13 = floatChannel4.data[i8 + 2];
                float f14 = floatChannel4.data[i8 + 3];
                float f15 = floatChannel5.data[i9 + 0];
                float f16 = floatChannel5.data[i9 + 1];
                Vector3 nor = TMP_V3.set(this.camera.position).sub(f2, f3, f4).nor();
                Vector3 nor2 = TMP_V1.set(this.camera.up).crs(nor).nor();
                Vector3 crs = TMP_V2.set(nor).crs(nor2);
                nor2.scl(f9);
                crs.scl(f10);
                if (f15 != 1.0f) {
                    TMP_M3.setToRotation(nor, f15, f16);
                    putVertex(this.vertices, i5, TMP_V6.set((-TMP_V1.x) - TMP_V2.x, (-TMP_V1.y) - TMP_V2.y, (-TMP_V1.z) - TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f5, f8, f11, f12, f13, f14);
                    int i10 = this.currentVertexSize + i5;
                    putVertex(this.vertices, i10, TMP_V6.set(TMP_V1.x - TMP_V2.x, TMP_V1.y - TMP_V2.y, TMP_V1.z - TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f7, f8, f11, f12, f13, f14);
                    int i11 = i10 + this.currentVertexSize;
                    putVertex(this.vertices, i11, TMP_V6.set(TMP_V1.x + TMP_V2.x, TMP_V1.y + TMP_V2.y, TMP_V1.z + TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f7, f6, f11, f12, f13, f14);
                    putVertex(this.vertices, i11 + this.currentVertexSize, TMP_V6.set((-TMP_V1.x) + TMP_V2.x, (-TMP_V1.y) + TMP_V2.y, (-TMP_V1.z) + TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f5, f6, f11, f12, f13, f14);
                } else {
                    putVertex(this.vertices, i5, TMP_V6.set(((-TMP_V1.x) - TMP_V2.x) + f2, ((-TMP_V1.y) - TMP_V2.y) + f3, ((-TMP_V1.z) - TMP_V2.z) + f4), f5, f8, f11, f12, f13, f14);
                    int i12 = this.currentVertexSize + i5;
                    putVertex(this.vertices, i12, TMP_V6.set((TMP_V1.x - TMP_V2.x) + f2, (TMP_V1.y - TMP_V2.y) + f3, (TMP_V1.z - TMP_V2.z) + f4), f7, f8, f11, f12, f13, f14);
                    int i13 = i12 + this.currentVertexSize;
                    putVertex(this.vertices, i13, TMP_V6.set(TMP_V1.x + TMP_V2.x + f2, TMP_V1.y + TMP_V2.y + f3, TMP_V1.z + TMP_V2.z + f4), f7, f6, f11, f12, f13, f14);
                    putVertex(this.vertices, i13 + this.currentVertexSize, TMP_V6.set((-TMP_V1.x) + TMP_V2.x + f2, (-TMP_V1.y) + TMP_V2.y + f3, (-TMP_V1.z) + TMP_V2.z + f4), f5, f6, f11, f12, f13, f14);
                }
                i4++;
                i3++;
                it = it;
                i2 = i2;
                floatChannel = floatChannel;
                floatChannel3 = floatChannel3;
                floatChannel2 = floatChannel2;
            }
            i = i3;
        }
    }

    private void fillVerticesToScreenCPU(int[] iArr) {
        Vector3 vector3;
        Vector3 vector32;
        Vector3 scl = TMP_V3.set(this.camera.direction).scl(-1.0f);
        Vector3 nor = TMP_V4.set(this.camera.up).crs(scl).nor();
        Vector3 vector33 = this.camera.up;
        Iterator it = this.renderData.iterator();
        int i = 0;
        while (it.hasNext()) {
            BillboardControllerRenderData billboardControllerRenderData = (BillboardControllerRenderData) it.next();
            ParallelArray.FloatChannel floatChannel = billboardControllerRenderData.scaleChannel;
            ParallelArray.FloatChannel floatChannel2 = billboardControllerRenderData.regionChannel;
            ParallelArray.FloatChannel floatChannel3 = billboardControllerRenderData.positionChannel;
            ParallelArray.FloatChannel floatChannel4 = billboardControllerRenderData.colorChannel;
            ParallelArray.FloatChannel floatChannel5 = billboardControllerRenderData.rotationChannel;
            int i2 = billboardControllerRenderData.controller.particles.size;
            int i3 = i;
            int i4 = 0;
            while (i4 < i2) {
                int i5 = iArr[i3] * this.currentVertexSize * 4;
                float f = floatChannel.data[floatChannel.strideSize * i4];
                int i6 = floatChannel2.strideSize * i4;
                int i7 = floatChannel3.strideSize * i4;
                int i8 = floatChannel4.strideSize * i4;
                int i9 = floatChannel5.strideSize * i4;
                float f2 = floatChannel3.data[i7 + 0];
                float f3 = floatChannel3.data[i7 + 1];
                float f4 = floatChannel3.data[i7 + 2];
                float f5 = floatChannel2.data[i6 + 0];
                float f6 = floatChannel2.data[i6 + 1];
                float f7 = floatChannel2.data[i6 + 2];
                float f8 = floatChannel2.data[i6 + 3];
                float f9 = floatChannel2.data[i6 + 4] * f;
                float f10 = floatChannel2.data[i6 + 5] * f;
                float f11 = floatChannel4.data[i8 + 0];
                float f12 = floatChannel4.data[i8 + 1];
                float f13 = floatChannel4.data[i8 + 2];
                float f14 = floatChannel4.data[i8 + 3];
                float f15 = floatChannel5.data[i9 + 0];
                float f16 = floatChannel5.data[i9 + 1];
                TMP_V1.set(nor).scl(f9);
                TMP_V2.set(vector33).scl(f10);
                if (f15 != 1.0f) {
                    TMP_M3.setToRotation(scl, f15, f16);
                    vector32 = scl;
                    putVertex(this.vertices, i5, TMP_V6.set((-TMP_V1.x) - TMP_V2.x, (-TMP_V1.y) - TMP_V2.y, (-TMP_V1.z) - TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f5, f8, f11, f12, f13, f14);
                    int i10 = i5 + this.currentVertexSize;
                    vector3 = nor;
                    putVertex(this.vertices, i10, TMP_V6.set(TMP_V1.x - TMP_V2.x, TMP_V1.y - TMP_V2.y, TMP_V1.z - TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f7, f8, f11, f12, f13, f14);
                    int i11 = i10 + this.currentVertexSize;
                    putVertex(this.vertices, i11, TMP_V6.set(TMP_V1.x + TMP_V2.x, TMP_V1.y + TMP_V2.y, TMP_V1.z + TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f7, f6, f11, f12, f13, f14);
                    putVertex(this.vertices, i11 + this.currentVertexSize, TMP_V6.set((-TMP_V1.x) + TMP_V2.x, (-TMP_V1.y) + TMP_V2.y, (-TMP_V1.z) + TMP_V2.z).mul(TMP_M3).add(f2, f3, f4), f5, f6, f11, f12, f13, f14);
                } else {
                    vector32 = scl;
                    vector3 = nor;
                    putVertex(this.vertices, i5, TMP_V6.set(((-TMP_V1.x) - TMP_V2.x) + f2, ((-TMP_V1.y) - TMP_V2.y) + f3, ((-TMP_V1.z) - TMP_V2.z) + f4), f5, f8, f11, f12, f13, f14);
                    int i12 = i5 + this.currentVertexSize;
                    putVertex(this.vertices, i12, TMP_V6.set((TMP_V1.x - TMP_V2.x) + f2, (TMP_V1.y - TMP_V2.y) + f3, (TMP_V1.z - TMP_V2.z) + f4), f7, f8, f11, f12, f13, f14);
                    int i13 = i12 + this.currentVertexSize;
                    putVertex(this.vertices, i13, TMP_V6.set(TMP_V1.x + TMP_V2.x + f2, TMP_V1.y + TMP_V2.y + f3, TMP_V1.z + TMP_V2.z + f4), f7, f6, f11, f12, f13, f14);
                    putVertex(this.vertices, i13 + this.currentVertexSize, TMP_V6.set((-TMP_V1.x) + TMP_V2.x + f2, (-TMP_V1.y) + TMP_V2.y + f3, (-TMP_V1.z) + TMP_V2.z + f4), f5, f6, f11, f12, f13, f14);
                }
                i4++;
                i3++;
                it = it;
                i2 = i2;
                floatChannel = floatChannel;
                floatChannel3 = floatChannel3;
                floatChannel2 = floatChannel2;
                scl = vector32;
                nor = vector3;
            }
            i = i3;
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.graphics.g3d.particles.batches.BufferedParticleBatch
    public void flush(int[] iArr) {
        if (this.useGPU) {
            fillVerticesGPU(iArr);
        } else if (this.mode == ParticleShader.AlignMode.Screen) {
            fillVerticesToScreenCPU(iArr);
        } else if (this.mode == ParticleShader.AlignMode.ViewPoint) {
            fillVerticesToViewPointCPU(iArr);
        }
        int i = this.bufferedParticlesCount * 4;
        int i2 = 0;
        while (i2 < i) {
            int min = Math.min(i - i2, (int) MAX_VERTICES_PER_MESH);
            Renderable renderable = (Renderable) this.renderablePool.obtain();
            renderable.meshPart.size = (min / 4) * 6;
            Mesh mesh = renderable.meshPart.mesh;
            float[] fArr = this.vertices;
            int i3 = this.currentVertexSize;
            mesh.setVertices(fArr, i3 * i2, i3 * min);
            renderable.meshPart.update();
            this.renderables.add(renderable);
            i2 += min;
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.RenderableProvider
    public void getRenderables(Array<Renderable> array, Pool<Renderable> pool) {
        Iterator<Renderable> it = this.renderables.iterator();
        while (it.hasNext()) {
            array.add(pool.obtain().set(it.next()));
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch
    public void save(AssetManager assetManager, ResourceData resourceData) {
        ResourceData.SaveData createSaveData = resourceData.createSaveData("billboardBatch");
        createSaveData.save("cfg", new Config(this.useGPU, this.mode));
        createSaveData.saveAsset(assetManager.getAssetFileName(this.texture), Texture.class);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch
    public void load(AssetManager assetManager, ResourceData resourceData) {
        ResourceData.SaveData saveData = resourceData.getSaveData("billboardBatch");
        if (saveData != null) {
            setTexture((Texture) assetManager.get(saveData.loadAsset()));
            Config config = (Config) saveData.load("cfg");
            setUseGpu(config.useGPU);
            setAlignMode(config.mode);
        }
    }
}
