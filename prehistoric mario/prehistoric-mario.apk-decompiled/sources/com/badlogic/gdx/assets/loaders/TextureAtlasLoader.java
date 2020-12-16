package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public class TextureAtlasLoader extends SynchronousAssetLoader<TextureAtlas, TextureAtlasParameter> {
    TextureAtlas.TextureAtlasData data;

    public TextureAtlasLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public TextureAtlas load(AssetManager assetManager, String str, FileHandle fileHandle, TextureAtlasParameter textureAtlasParameter) {
        Iterator<TextureAtlas.TextureAtlasData.Page> it = this.data.getPages().iterator();
        while (it.hasNext()) {
            TextureAtlas.TextureAtlasData.Page next = it.next();
            next.texture = (Texture) assetManager.get(next.textureFile.path().replaceAll("\\\\", "/"), Texture.class);
        }
        TextureAtlas textureAtlas = new TextureAtlas(this.data);
        this.data = null;
        return textureAtlas;
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, TextureAtlasParameter textureAtlasParameter) {
        FileHandle parent = fileHandle.parent();
        if (textureAtlasParameter != null) {
            this.data = new TextureAtlas.TextureAtlasData(fileHandle, parent, textureAtlasParameter.flip);
        } else {
            this.data = new TextureAtlas.TextureAtlasData(fileHandle, parent, false);
        }
        Array<AssetDescriptor> array = new Array<>();
        Iterator<TextureAtlas.TextureAtlasData.Page> it = this.data.getPages().iterator();
        while (it.hasNext()) {
            TextureAtlas.TextureAtlasData.Page next = it.next();
            TextureLoader.TextureParameter textureParameter = new TextureLoader.TextureParameter();
            textureParameter.format = next.format;
            textureParameter.genMipMaps = next.useMipMaps;
            textureParameter.minFilter = next.minFilter;
            textureParameter.magFilter = next.magFilter;
            array.add(new AssetDescriptor(next.textureFile, Texture.class, textureParameter));
        }
        return array;
    }

    public static class TextureAtlasParameter extends AssetLoaderParameters<TextureAtlas> {
        public boolean flip = false;

        public TextureAtlasParameter() {
        }

        public TextureAtlasParameter(boolean z) {
            this.flip = z;
        }
    }
}
