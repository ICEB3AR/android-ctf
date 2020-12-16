package com.badlogic.gdx.graphics.g2d.freetype;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.AsynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.freetype.FreeTypeFontGenerator;
import com.badlogic.gdx.utils.Array;

public class FreetypeFontLoader extends AsynchronousAssetLoader<BitmapFont, FreeTypeFontLoaderParameter> {

    public static class FreeTypeFontLoaderParameter extends AssetLoaderParameters<BitmapFont> {
        public String fontFileName;
        public FreeTypeFontGenerator.FreeTypeFontParameter fontParameters = new FreeTypeFontGenerator.FreeTypeFontParameter();
    }

    public FreetypeFontLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, FreeTypeFontLoaderParameter freeTypeFontLoaderParameter) {
        if (freeTypeFontLoaderParameter == null) {
            throw new RuntimeException("FreetypeFontParameter must be set in AssetManager#load to point at a TTF file!");
        }
    }

    public BitmapFont loadSync(AssetManager assetManager, String str, FileHandle fileHandle, FreeTypeFontLoaderParameter freeTypeFontLoaderParameter) {
        if (freeTypeFontLoaderParameter != null) {
            return ((FreeTypeFontGenerator) assetManager.get(freeTypeFontLoaderParameter.fontFileName + ".gen", FreeTypeFontGenerator.class)).generateFont(freeTypeFontLoaderParameter.fontParameters);
        }
        throw new RuntimeException("FreetypeFontParameter must be set in AssetManager#load to point at a TTF file!");
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, FreeTypeFontLoaderParameter freeTypeFontLoaderParameter) {
        Array<AssetDescriptor> array = new Array<>();
        array.add(new AssetDescriptor(freeTypeFontLoaderParameter.fontFileName + ".gen", FreeTypeFontGenerator.class));
        return array;
    }
}
