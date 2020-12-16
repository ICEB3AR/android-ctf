package com.badlogic.gdx.graphics.g3d.particles.batches;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.DepthTestAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleShader;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.renderers.PointSpriteControllerRenderData;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public class PointSpriteParticleBatch extends BufferedParticleBatch<PointSpriteControllerRenderData> {
    protected static final VertexAttributes CPU_ATTRIBUTES = new VertexAttributes(new VertexAttribute(1, 3, ShaderProgram.POSITION_ATTRIBUTE), new VertexAttribute(2, 4, ShaderProgram.COLOR_ATTRIBUTE), new VertexAttribute(16, 4, "a_region"), new VertexAttribute(512, 3, "a_sizeAndRotation"));
    protected static final int CPU_COLOR_OFFSET = ((short) (CPU_ATTRIBUTES.findByUsage(2).offset / 4));
    protected static final int CPU_POSITION_OFFSET = ((short) (CPU_ATTRIBUTES.findByUsage(1).offset / 4));
    protected static final int CPU_REGION_OFFSET = ((short) (CPU_ATTRIBUTES.findByUsage(16).offset / 4));
    protected static final int CPU_SIZE_AND_ROTATION_OFFSET = ((short) (CPU_ATTRIBUTES.findByUsage(512).offset / 4));
    protected static final int CPU_VERTEX_SIZE = ((short) (CPU_ATTRIBUTES.vertexSize / 4));
    protected static final Vector3 TMP_V1 = new Vector3();
    private static boolean pointSpritesEnabled = false;
    protected static final int sizeAndRotationUsage = 512;
    Renderable renderable;
    private float[] vertices;

    private static void enablePointSprites() {
        Gdx.gl.glEnable(GL20.GL_VERTEX_PROGRAM_POINT_SIZE);
        if (Gdx.app.getType() == Application.ApplicationType.Desktop) {
            Gdx.gl.glEnable(34913);
        }
        pointSpritesEnabled = true;
    }

    public PointSpriteParticleBatch() {
        this(1000);
    }

    public PointSpriteParticleBatch(int i) {
        this(i, new ParticleShader.Config(ParticleShader.ParticleType.Point));
    }

    public PointSpriteParticleBatch(int i, ParticleShader.Config config) {
        super(PointSpriteControllerRenderData.class);
        if (!pointSpritesEnabled) {
            enablePointSprites();
        }
        allocRenderable();
        ensureCapacity(i);
        Renderable renderable2 = this.renderable;
        renderable2.shader = new ParticleShader(renderable2, config);
        this.renderable.shader.init();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.graphics.g3d.particles.batches.BufferedParticleBatch
    public void allocParticlesData(int i) {
        this.vertices = new float[(CPU_VERTEX_SIZE * i)];
        if (this.renderable.meshPart.mesh != null) {
            this.renderable.meshPart.mesh.dispose();
        }
        this.renderable.meshPart.mesh = new Mesh(false, i, 0, CPU_ATTRIBUTES);
    }

    /* access modifiers changed from: protected */
    public void allocRenderable() {
        this.renderable = new Renderable();
        this.renderable.meshPart.primitiveType = 0;
        this.renderable.meshPart.offset = 0;
        this.renderable.material = new Material(new BlendingAttribute(1, GL20.GL_ONE_MINUS_SRC_ALPHA, 1.0f), new DepthTestAttribute(GL20.GL_LEQUAL, false), TextureAttribute.createDiffuse((Texture) null));
    }

    public void setTexture(Texture texture) {
        ((TextureAttribute) this.renderable.material.get(TextureAttribute.Diffuse)).textureDescription.texture = texture;
    }

    public Texture getTexture() {
        return (Texture) ((TextureAttribute) this.renderable.material.get(TextureAttribute.Diffuse)).textureDescription.texture;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.graphics.g3d.particles.batches.BufferedParticleBatch
    public void flush(int[] iArr) {
        Iterator it = this.renderData.iterator();
        int i = 0;
        while (it.hasNext()) {
            PointSpriteControllerRenderData pointSpriteControllerRenderData = (PointSpriteControllerRenderData) it.next();
            ParallelArray.FloatChannel floatChannel = pointSpriteControllerRenderData.scaleChannel;
            ParallelArray.FloatChannel floatChannel2 = pointSpriteControllerRenderData.regionChannel;
            ParallelArray.FloatChannel floatChannel3 = pointSpriteControllerRenderData.positionChannel;
            ParallelArray.FloatChannel floatChannel4 = pointSpriteControllerRenderData.colorChannel;
            ParallelArray.FloatChannel floatChannel5 = pointSpriteControllerRenderData.rotationChannel;
            int i2 = i;
            int i3 = 0;
            while (i3 < pointSpriteControllerRenderData.controller.particles.size) {
                int i4 = iArr[i2] * CPU_VERTEX_SIZE;
                int i5 = floatChannel2.strideSize * i3;
                int i6 = floatChannel3.strideSize * i3;
                int i7 = floatChannel4.strideSize * i3;
                int i8 = floatChannel5.strideSize * i3;
                this.vertices[i4 + CPU_POSITION_OFFSET] = floatChannel3.data[i6 + 0];
                this.vertices[CPU_POSITION_OFFSET + i4 + 1] = floatChannel3.data[i6 + 1];
                this.vertices[CPU_POSITION_OFFSET + i4 + 2] = floatChannel3.data[i6 + 2];
                this.vertices[CPU_COLOR_OFFSET + i4] = floatChannel4.data[i7 + 0];
                this.vertices[CPU_COLOR_OFFSET + i4 + 1] = floatChannel4.data[i7 + 1];
                this.vertices[CPU_COLOR_OFFSET + i4 + 2] = floatChannel4.data[i7 + 2];
                this.vertices[CPU_COLOR_OFFSET + i4 + 3] = floatChannel4.data[i7 + 3];
                this.vertices[CPU_SIZE_AND_ROTATION_OFFSET + i4] = floatChannel.data[floatChannel.strideSize * i3];
                this.vertices[CPU_SIZE_AND_ROTATION_OFFSET + i4 + 1] = floatChannel5.data[i8 + 0];
                this.vertices[CPU_SIZE_AND_ROTATION_OFFSET + i4 + 2] = floatChannel5.data[i8 + 1];
                this.vertices[CPU_REGION_OFFSET + i4] = floatChannel2.data[i5 + 0];
                this.vertices[CPU_REGION_OFFSET + i4 + 1] = floatChannel2.data[i5 + 1];
                this.vertices[CPU_REGION_OFFSET + i4 + 2] = floatChannel2.data[i5 + 2];
                this.vertices[i4 + CPU_REGION_OFFSET + 3] = floatChannel2.data[i5 + 3];
                i3++;
                i2++;
                pointSpriteControllerRenderData = pointSpriteControllerRenderData;
                it = it;
            }
            i = i2;
        }
        this.renderable.meshPart.size = this.bufferedParticlesCount;
        this.renderable.meshPart.mesh.setVertices(this.vertices, 0, this.bufferedParticlesCount * CPU_VERTEX_SIZE);
        this.renderable.meshPart.update();
    }

    @Override // com.badlogic.gdx.graphics.g3d.RenderableProvider
    public void getRenderables(Array<Renderable> array, Pool<Renderable> pool) {
        if (this.bufferedParticlesCount > 0) {
            array.add(pool.obtain().set(this.renderable));
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch
    public void save(AssetManager assetManager, ResourceData resourceData) {
        resourceData.createSaveData("pointSpriteBatch").saveAsset(assetManager.getAssetFileName(getTexture()), Texture.class);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch
    public void load(AssetManager assetManager, ResourceData resourceData) {
        ResourceData.SaveData saveData = resourceData.getSaveData("pointSpriteBatch");
        if (saveData != null) {
            setTexture((Texture) assetManager.get(saveData.loadAsset()));
        }
    }
}
