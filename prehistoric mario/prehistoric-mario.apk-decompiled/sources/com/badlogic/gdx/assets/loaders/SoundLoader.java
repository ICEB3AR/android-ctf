package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.audio.Sound;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;

public class SoundLoader extends AsynchronousAssetLoader<Sound, SoundParameter> {
    private Sound sound;

    public static class SoundParameter extends AssetLoaderParameters<Sound> {
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, SoundParameter soundParameter) {
        return null;
    }

    public SoundLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    /* access modifiers changed from: protected */
    public Sound getLoadedSound() {
        return this.sound;
    }

    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, SoundParameter soundParameter) {
        this.sound = Gdx.audio.newSound(fileHandle);
    }

    public Sound loadSync(AssetManager assetManager, String str, FileHandle fileHandle, SoundParameter soundParameter) {
        Sound sound2 = this.sound;
        this.sound = null;
        return sound2;
    }
}
