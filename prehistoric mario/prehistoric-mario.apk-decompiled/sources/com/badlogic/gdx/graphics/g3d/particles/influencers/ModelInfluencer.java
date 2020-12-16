package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public abstract class ModelInfluencer extends Influencer {
    ParallelArray.ObjectChannel<ModelInstance> modelChannel;
    public Array<Model> models;

    public static class Single extends ModelInfluencer {
        public Single() {
        }

        public Single(Single single) {
            super(single);
        }

        public Single(Model... modelArr) {
            super(modelArr);
        }

        /* JADX DEBUG: Multi-variable search result rejected for r3v2, resolved type: T[] */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void init() {
            Model model = (Model) this.models.first();
            int i = this.controller.emitter.maxParticleCount;
            for (int i2 = 0; i2 < i; i2++) {
                this.modelChannel.data[i2] = new ModelInstance(model);
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Single copy() {
            return new Single(this);
        }
    }

    public static class Random extends ModelInfluencer {
        ModelInstancePool pool = new ModelInstancePool();

        private class ModelInstancePool extends Pool<ModelInstance> {
            public ModelInstancePool() {
            }

            @Override // com.badlogic.gdx.utils.Pool
            public ModelInstance newObject() {
                return new ModelInstance((Model) Random.this.models.random());
            }
        }

        public Random() {
        }

        public Random(Random random) {
            super(random);
        }

        public Random(Model... modelArr) {
            super(modelArr);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void init() {
            this.pool.clear();
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v2, resolved type: T[] */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void activateParticles(int i, int i2) {
            int i3 = i2 + i;
            while (i < i3) {
                this.modelChannel.data[i] = (ModelInstance) this.pool.obtain();
                i++;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void killParticles(int i, int i2) {
            int i3 = i2 + i;
            while (i < i3) {
                this.pool.free(this.modelChannel.data[i]);
                this.modelChannel.data[i] = null;
                i++;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Random copy() {
            return new Random(this);
        }
    }

    public ModelInfluencer() {
        this.models = new Array<>(true, 1, Model.class);
    }

    public ModelInfluencer(Model... modelArr) {
        this.models = new Array<>(modelArr);
    }

    public ModelInfluencer(ModelInfluencer modelInfluencer) {
        this((Model[]) modelInfluencer.models.toArray(Model.class));
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void allocateChannels() {
        this.modelChannel = (ParallelArray.ObjectChannel) this.controller.particles.addChannel(ParticleChannels.ModelInstance);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void save(AssetManager assetManager, ResourceData resourceData) {
        ResourceData.SaveData createSaveData = resourceData.createSaveData();
        Iterator<Model> it = this.models.iterator();
        while (it.hasNext()) {
            createSaveData.saveAsset(assetManager.getAssetFileName(it.next()), Model.class);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void load(AssetManager assetManager, ResourceData resourceData) {
        ResourceData.SaveData saveData = resourceData.getSaveData();
        while (true) {
            AssetDescriptor loadAsset = saveData.loadAsset();
            if (loadAsset != null) {
                Model model = (Model) assetManager.get(loadAsset);
                if (model != null) {
                    this.models.add(model);
                } else {
                    throw new RuntimeException("Model is null");
                }
            } else {
                return;
            }
        }
    }
}
