package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.CubemapData;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.glutils.KTXTextureData;
import com.badlogic.gdx.utils.Array;

public class CubemapLoader extends AsynchronousAssetLoader<Cubemap, CubemapParameter> {
    CubemapLoaderInfo info = new CubemapLoaderInfo();

    public static class CubemapLoaderInfo {
        Cubemap cubemap;
        CubemapData data;
        String filename;
    }

    public static class CubemapParameter extends AssetLoaderParameters<Cubemap> {
        public Cubemap cubemap = null;
        public CubemapData cubemapData = null;
        public Pixmap.Format format = null;
        public Texture.TextureFilter magFilter = Texture.TextureFilter.Nearest;
        public Texture.TextureFilter minFilter = Texture.TextureFilter.Nearest;
        public Texture.TextureWrap wrapU = Texture.TextureWrap.ClampToEdge;
        public Texture.TextureWrap wrapV = Texture.TextureWrap.ClampToEdge;
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, CubemapParameter cubemapParameter) {
        return null;
    }

    public CubemapLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, CubemapParameter cubemapParameter) {
        this.info.filename = str;
        if (cubemapParameter == null || cubemapParameter.cubemapData == null) {
            this.info.cubemap = null;
            if (cubemapParameter != null) {
                Pixmap.Format format = cubemapParameter.format;
                this.info.cubemap = cubemapParameter.cubemap;
            }
            if (str.contains(".ktx") || str.contains(".zktx")) {
                this.info.data = new KTXTextureData(fileHandle, false);
            }
        } else {
            this.info.data = cubemapParameter.cubemapData;
            this.info.cubemap = cubemapParameter.cubemap;
        }
        if (!this.info.data.isPrepared()) {
            this.info.data.prepare();
        }
    }

    public Cubemap loadSync(AssetManager assetManager, String str, FileHandle fileHandle, CubemapParameter cubemapParameter) {
        CubemapLoaderInfo cubemapLoaderInfo = this.info;
        if (cubemapLoaderInfo == null) {
            return null;
        }
        Cubemap cubemap = cubemapLoaderInfo.cubemap;
        if (cubemap != null) {
            cubemap.load(this.info.data);
        } else {
            cubemap = new Cubemap(this.info.data);
        }
        if (cubemapParameter != null) {
            cubemap.setFilter(cubemapParameter.minFilter, cubemapParameter.magFilter);
            cubemap.setWrap(cubemapParameter.wrapU, cubemapParameter.wrapV);
        }
        return cubemap;
    }
}
