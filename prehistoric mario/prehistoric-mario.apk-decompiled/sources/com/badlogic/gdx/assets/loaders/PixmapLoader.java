package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.utils.Array;

public class PixmapLoader extends AsynchronousAssetLoader<Pixmap, PixmapParameter> {
    Pixmap pixmap;

    public static class PixmapParameter extends AssetLoaderParameters<Pixmap> {
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, PixmapParameter pixmapParameter) {
        return null;
    }

    public PixmapLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, PixmapParameter pixmapParameter) {
        this.pixmap = null;
        this.pixmap = new Pixmap(fileHandle);
    }

    public Pixmap loadSync(AssetManager assetManager, String str, FileHandle fileHandle, PixmapParameter pixmapParameter) {
        Pixmap pixmap2 = this.pixmap;
        this.pixmap = null;
        return pixmap2;
    }
}
