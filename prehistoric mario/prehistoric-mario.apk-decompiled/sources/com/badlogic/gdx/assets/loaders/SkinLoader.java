package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ObjectMap;

public class SkinLoader extends AsynchronousAssetLoader<Skin, SkinParameter> {
    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, SkinParameter skinParameter) {
    }

    public SkinLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, SkinParameter skinParameter) {
        Array<AssetDescriptor> array = new Array<>();
        if (skinParameter == null || skinParameter.textureAtlasPath == null) {
            array.add(new AssetDescriptor(fileHandle.pathWithoutExtension() + ".atlas", TextureAtlas.class));
        } else if (skinParameter.textureAtlasPath != null) {
            array.add(new AssetDescriptor(skinParameter.textureAtlasPath, TextureAtlas.class));
        }
        return array;
    }

    public Skin loadSync(AssetManager assetManager, String str, FileHandle fileHandle, SkinParameter skinParameter) {
        String str2 = fileHandle.pathWithoutExtension() + ".atlas";
        ObjectMap<String, Object> objectMap = null;
        if (skinParameter != null) {
            if (skinParameter.textureAtlasPath != null) {
                str2 = skinParameter.textureAtlasPath;
            }
            if (skinParameter.resources != null) {
                objectMap = skinParameter.resources;
            }
        }
        Skin newSkin = newSkin((TextureAtlas) assetManager.get(str2, TextureAtlas.class));
        if (objectMap != null) {
            ObjectMap.Entries<String, Object> it = objectMap.entries().iterator();
            while (it.hasNext()) {
                ObjectMap.Entry entry = (ObjectMap.Entry) it.next();
                newSkin.add(entry.key, entry.value);
            }
        }
        newSkin.load(fileHandle);
        return newSkin;
    }

    /* access modifiers changed from: protected */
    public Skin newSkin(TextureAtlas textureAtlas) {
        return new Skin(textureAtlas);
    }

    public static class SkinParameter extends AssetLoaderParameters<Skin> {
        public final ObjectMap<String, Object> resources;
        public final String textureAtlasPath;

        public SkinParameter() {
            this(null, null);
        }

        public SkinParameter(ObjectMap<String, Object> objectMap) {
            this(null, objectMap);
        }

        public SkinParameter(String str) {
            this(str, null);
        }

        public SkinParameter(String str, ObjectMap<String, Object> objectMap) {
            this.textureAtlasPath = str;
            this.resources = objectMap;
        }
    }
}
