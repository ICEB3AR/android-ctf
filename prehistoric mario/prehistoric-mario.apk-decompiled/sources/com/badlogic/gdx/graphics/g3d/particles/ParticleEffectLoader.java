package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.AsynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import java.io.IOException;
import java.util.Iterator;

public class ParticleEffectLoader extends AsynchronousAssetLoader<ParticleEffect, ParticleEffectLoadParameter> {
    protected Array<ObjectMap.Entry<String, ResourceData<ParticleEffect>>> items = new Array<>();

    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, ParticleEffectLoadParameter particleEffectLoadParameter) {
    }

    public ParticleEffectLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r6v0, resolved type: java.lang.String */
    /* JADX WARN: Multi-variable type inference failed */
    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, ParticleEffectLoadParameter particleEffectLoadParameter) {
        Array<ResourceData.AssetData> assets;
        V v = (V) ((ResourceData) new Json().fromJson(ResourceData.class, fileHandle));
        synchronized (this.items) {
            ObjectMap.Entry<String, ResourceData<ParticleEffect>> entry = new ObjectMap.Entry<>();
            entry.key = str;
            entry.value = v;
            this.items.add(entry);
            assets = v.getAssets();
        }
        Array<AssetDescriptor> array = new Array<>();
        Iterator<ResourceData.AssetData> it = assets.iterator();
        while (it.hasNext()) {
            ResourceData.AssetData next = it.next();
            if (!resolve(next.filename).exists()) {
                next.filename = fileHandle.parent().child(Gdx.files.internal(next.filename).name()).path();
            }
            if (next.type == ParticleEffect.class) {
                array.add(new AssetDescriptor(next.filename, next.type, particleEffectLoadParameter));
            } else {
                array.add(new AssetDescriptor(next.filename, next.type));
            }
        }
        return array;
    }

    public void save(ParticleEffect particleEffect, ParticleEffectSaveParameter particleEffectSaveParameter) throws IOException {
        ResourceData resourceData = new ResourceData(particleEffect);
        particleEffect.save(particleEffectSaveParameter.manager, resourceData);
        if (particleEffectSaveParameter.batches != null) {
            Iterator<ParticleBatch<?>> it = particleEffectSaveParameter.batches.iterator();
            while (it.hasNext()) {
                ParticleBatch<?> next = it.next();
                boolean z = false;
                Iterator<ParticleController> it2 = particleEffect.getControllers().iterator();
                while (true) {
                    if (it2.hasNext()) {
                        if (it2.next().renderer.isCompatible(next)) {
                            z = true;
                            break;
                        }
                    } else {
                        break;
                    }
                }
                if (z) {
                    next.save(particleEffectSaveParameter.manager, resourceData);
                }
            }
        }
        new Json().toJson(resourceData, particleEffectSaveParameter.file);
    }

    public ParticleEffect loadSync(AssetManager assetManager, String str, FileHandle fileHandle, ParticleEffectLoadParameter particleEffectLoadParameter) {
        V v;
        synchronized (this.items) {
            int i = 0;
            while (true) {
                if (i >= this.items.size) {
                    v = null;
                    break;
                }
                ObjectMap.Entry<String, ResourceData<ParticleEffect>> entry = this.items.get(i);
                if (entry.key.equals(str)) {
                    v = entry.value;
                    this.items.removeIndex(i);
                    break;
                }
                i++;
            }
        }
        v.resource.load(assetManager, v);
        if (particleEffectLoadParameter != null) {
            if (particleEffectLoadParameter.batches != null) {
                Iterator<ParticleBatch<?>> it = particleEffectLoadParameter.batches.iterator();
                while (it.hasNext()) {
                    it.next().load(assetManager, v);
                }
            }
            v.resource.setBatch(particleEffectLoadParameter.batches);
        }
        return v.resource;
    }

    private <T> T find(Array<?> array, Class<T> cls) {
        Iterator<?> it = array.iterator();
        while (it.hasNext()) {
            T t = (T) it.next();
            if (ClassReflection.isAssignableFrom(cls, t.getClass())) {
                return t;
            }
        }
        return null;
    }

    public static class ParticleEffectLoadParameter extends AssetLoaderParameters<ParticleEffect> {
        Array<ParticleBatch<?>> batches;

        public ParticleEffectLoadParameter(Array<ParticleBatch<?>> array) {
            this.batches = array;
        }
    }

    public static class ParticleEffectSaveParameter extends AssetLoaderParameters<ParticleEffect> {
        Array<ParticleBatch<?>> batches;
        FileHandle file;
        AssetManager manager;

        public ParticleEffectSaveParameter(FileHandle fileHandle, AssetManager assetManager, Array<ParticleBatch<?>> array) {
            this.batches = array;
            this.file = fileHandle;
            this.manager = assetManager;
        }
    }
}
