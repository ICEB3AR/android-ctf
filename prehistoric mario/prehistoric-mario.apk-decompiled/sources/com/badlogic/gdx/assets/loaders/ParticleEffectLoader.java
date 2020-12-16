package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.ParticleEffect;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.utils.Array;

public class ParticleEffectLoader extends SynchronousAssetLoader<ParticleEffect, ParticleEffectParameter> {

    public static class ParticleEffectParameter extends AssetLoaderParameters<ParticleEffect> {
        public String atlasFile;
        public String atlasPrefix;
        public FileHandle imagesDir;
    }

    public ParticleEffectLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public ParticleEffect load(AssetManager assetManager, String str, FileHandle fileHandle, ParticleEffectParameter particleEffectParameter) {
        ParticleEffect particleEffect = new ParticleEffect();
        if (particleEffectParameter != null && particleEffectParameter.atlasFile != null) {
            particleEffect.load(fileHandle, (TextureAtlas) assetManager.get(particleEffectParameter.atlasFile, TextureAtlas.class), particleEffectParameter.atlasPrefix);
        } else if (particleEffectParameter == null || particleEffectParameter.imagesDir == null) {
            particleEffect.load(fileHandle, fileHandle.parent());
        } else {
            particleEffect.load(fileHandle, particleEffectParameter.imagesDir);
        }
        return particleEffect;
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, ParticleEffectParameter particleEffectParameter) {
        if (particleEffectParameter == null || particleEffectParameter.atlasFile == null) {
            return null;
        }
        Array<AssetDescriptor> array = new Array<>();
        array.add(new AssetDescriptor(particleEffectParameter.atlasFile, TextureAtlas.class));
        return array;
    }
}
