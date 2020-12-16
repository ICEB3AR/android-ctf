package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.audio.Music;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;

public class MusicLoader extends AsynchronousAssetLoader<Music, MusicParameter> {
    private Music music;

    public static class MusicParameter extends AssetLoaderParameters<Music> {
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, MusicParameter musicParameter) {
        return null;
    }

    public MusicLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    /* access modifiers changed from: protected */
    public Music getLoadedMusic() {
        return this.music;
    }

    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, MusicParameter musicParameter) {
        this.music = Gdx.audio.newMusic(fileHandle);
    }

    public Music loadSync(AssetManager assetManager, String str, FileHandle fileHandle, MusicParameter musicParameter) {
        Music music2 = this.music;
        this.music = null;
        return music2;
    }
}
