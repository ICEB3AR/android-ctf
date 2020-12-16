package com.badlogic.gdx.graphics.g3d.particles.batches;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.renderers.ModelInstanceControllerRenderData;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public class ModelInstanceParticleBatch implements ParticleBatch<ModelInstanceControllerRenderData> {
    int bufferedParticlesCount;
    Array<ModelInstanceControllerRenderData> controllersRenderData = new Array<>(false, 5);

    @Override // com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch
    public void end() {
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch
    public void load(AssetManager assetManager, ResourceData resourceData) {
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch
    public void save(AssetManager assetManager, ResourceData resourceData) {
    }

    @Override // com.badlogic.gdx.graphics.g3d.RenderableProvider
    public void getRenderables(Array<Renderable> array, Pool<Renderable> pool) {
        Iterator<ModelInstanceControllerRenderData> it = this.controllersRenderData.iterator();
        while (it.hasNext()) {
            ModelInstanceControllerRenderData next = it.next();
            int i = next.controller.particles.size;
            for (int i2 = 0; i2 < i; i2++) {
                next.modelInstanceChannel.data[i2].getRenderables(array, pool);
            }
        }
    }

    public int getBufferedCount() {
        return this.bufferedParticlesCount;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch
    public void begin() {
        this.controllersRenderData.clear();
        this.bufferedParticlesCount = 0;
    }

    public void draw(ModelInstanceControllerRenderData modelInstanceControllerRenderData) {
        this.controllersRenderData.add(modelInstanceControllerRenderData);
        this.bufferedParticlesCount += modelInstanceControllerRenderData.controller.particles.size;
    }
}
