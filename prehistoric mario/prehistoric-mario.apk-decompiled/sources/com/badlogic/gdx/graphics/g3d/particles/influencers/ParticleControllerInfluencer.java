package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleController;
import com.badlogic.gdx.graphics.g3d.particles.ParticleEffect;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public abstract class ParticleControllerInfluencer extends Influencer {
    ParallelArray.ObjectChannel<ParticleController> particleControllerChannel;
    public Array<ParticleController> templates;

    public static class Single extends ParticleControllerInfluencer {
        public Single(ParticleController... particleControllerArr) {
            super(particleControllerArr);
        }

        public Single() {
        }

        public Single(Single single) {
            super(single);
        }

        /* JADX DEBUG: Multi-variable search result rejected for r4v2, resolved type: T[] */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void init() {
            ParticleController particleController = (ParticleController) this.templates.first();
            int i = this.controller.particles.capacity;
            for (int i2 = 0; i2 < i; i2++) {
                ParticleController copy = particleController.copy();
                copy.init();
                this.particleControllerChannel.data[i2] = copy;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void activateParticles(int i, int i2) {
            int i3 = i2 + i;
            while (i < i3) {
                this.particleControllerChannel.data[i].start();
                i++;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void killParticles(int i, int i2) {
            int i3 = i2 + i;
            while (i < i3) {
                this.particleControllerChannel.data[i].end();
                i++;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Single copy() {
            return new Single(this);
        }
    }

    public static class Random extends ParticleControllerInfluencer {
        ParticleControllerPool pool = new ParticleControllerPool();

        private class ParticleControllerPool extends Pool<ParticleController> {
            public ParticleControllerPool() {
            }

            @Override // com.badlogic.gdx.utils.Pool
            public ParticleController newObject() {
                ParticleController copy = ((ParticleController) Random.this.templates.random()).copy();
                copy.init();
                return copy;
            }

            @Override // com.badlogic.gdx.utils.Pool
            public void clear() {
                int free = Random.this.pool.getFree();
                for (int i = 0; i < free; i++) {
                    ((ParticleController) Random.this.pool.obtain()).dispose();
                }
                super.clear();
            }
        }

        public Random() {
        }

        public Random(ParticleController... particleControllerArr) {
            super(particleControllerArr);
        }

        public Random(Random random) {
            super(random);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void init() {
            this.pool.clear();
            for (int i = 0; i < this.controller.emitter.maxParticleCount; i++) {
                ParticleControllerPool particleControllerPool = this.pool;
                particleControllerPool.free(particleControllerPool.newObject());
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Disposable, com.badlogic.gdx.graphics.g3d.particles.influencers.ParticleControllerInfluencer
        public void dispose() {
            this.pool.clear();
            ParticleControllerInfluencer.super.dispose();
        }

        /* JADX DEBUG: Multi-variable search result rejected for r1v2, resolved type: T[] */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void activateParticles(int i, int i2) {
            int i3 = i2 + i;
            while (i < i3) {
                ParticleController particleController = (ParticleController) this.pool.obtain();
                particleController.start();
                this.particleControllerChannel.data[i] = particleController;
                i++;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void killParticles(int i, int i2) {
            int i3 = i2 + i;
            while (i < i3) {
                T t = this.particleControllerChannel.data[i];
                t.end();
                this.pool.free(t);
                this.particleControllerChannel.data[i] = null;
                i++;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Random copy() {
            return new Random(this);
        }
    }

    public ParticleControllerInfluencer() {
        this.templates = new Array<>(true, 1, ParticleController.class);
    }

    public ParticleControllerInfluencer(ParticleController... particleControllerArr) {
        this.templates = new Array<>(particleControllerArr);
    }

    public ParticleControllerInfluencer(ParticleControllerInfluencer particleControllerInfluencer) {
        this(particleControllerInfluencer.templates.items);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void allocateChannels() {
        this.particleControllerChannel = (ParallelArray.ObjectChannel) this.controller.particles.addChannel(ParticleChannels.ParticleController);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void end() {
        for (int i = 0; i < this.controller.particles.size; i++) {
            this.particleControllerChannel.data[i].end();
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Disposable
    public void dispose() {
        if (this.controller != null) {
            for (int i = 0; i < this.controller.particles.size; i++) {
                T t = this.particleControllerChannel.data[i];
                if (t != null) {
                    t.dispose();
                    this.particleControllerChannel.data[i] = null;
                }
            }
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void save(AssetManager assetManager, ResourceData resourceData) {
        ResourceData.SaveData createSaveData = resourceData.createSaveData();
        Array all = assetManager.getAll(ParticleEffect.class, new Array());
        Array array = new Array(this.templates);
        Array array2 = new Array();
        for (int i = 0; i < all.size && array.size > 0; i++) {
            ParticleEffect particleEffect = (ParticleEffect) all.get(i);
            Array<ParticleController> controllers = particleEffect.getControllers();
            Iterator it = array.iterator();
            IntArray intArray = null;
            while (it.hasNext()) {
                int indexOf = controllers.indexOf((ParticleController) it.next(), true);
                if (indexOf > -1) {
                    if (intArray == null) {
                        intArray = new IntArray();
                    }
                    it.remove();
                    intArray.add(indexOf);
                }
            }
            if (intArray != null) {
                createSaveData.saveAsset(assetManager.getAssetFileName(particleEffect), ParticleEffect.class);
                array2.add(intArray);
            }
        }
        createSaveData.save("indices", array2);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void load(AssetManager assetManager, ResourceData resourceData) {
        ResourceData.SaveData saveData = resourceData.getSaveData();
        Iterator it = ((Array) saveData.load("indices")).iterator();
        while (true) {
            AssetDescriptor loadAsset = saveData.loadAsset();
            if (loadAsset != null) {
                ParticleEffect particleEffect = (ParticleEffect) assetManager.get(loadAsset);
                if (particleEffect != null) {
                    Array<ParticleController> controllers = particleEffect.getControllers();
                    IntArray intArray = (IntArray) it.next();
                    int i = intArray.size;
                    for (int i2 = 0; i2 < i; i2++) {
                        this.templates.add(controllers.get(intArray.get(i2)));
                    }
                } else {
                    throw new RuntimeException("Template is null");
                }
            } else {
                return;
            }
        }
    }
}
