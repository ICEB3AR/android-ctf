package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.ModelLoader.ModelParameters;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.model.data.ModelData;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMaterial;
import com.badlogic.gdx.graphics.g3d.model.data.ModelTexture;
import com.badlogic.gdx.graphics.g3d.utils.TextureProvider;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.ObjectMap;
import java.util.Iterator;

public abstract class ModelLoader<P extends ModelParameters> extends AsynchronousAssetLoader<Model, P> {
    protected ModelParameters defaultParameters = new ModelParameters();
    protected Array<ObjectMap.Entry<String, ModelData>> items = new Array<>();

    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, P p) {
    }

    public abstract ModelData loadModelData(FileHandle fileHandle, P p);

    public ModelLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public ModelData loadModelData(FileHandle fileHandle) {
        return loadModelData(fileHandle, null);
    }

    public Model loadModel(FileHandle fileHandle, TextureProvider textureProvider, P p) {
        ModelData loadModelData = loadModelData(fileHandle, p);
        if (loadModelData == null) {
            return null;
        }
        return new Model(loadModelData, textureProvider);
    }

    public Model loadModel(FileHandle fileHandle, P p) {
        return loadModel(fileHandle, new TextureProvider.FileTextureProvider(), p);
    }

    public Model loadModel(FileHandle fileHandle, TextureProvider textureProvider) {
        return loadModel(fileHandle, textureProvider, null);
    }

    public Model loadModel(FileHandle fileHandle) {
        return loadModel(fileHandle, new TextureProvider.FileTextureProvider(), null);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r5v0, resolved type: java.lang.String */
    /* JADX WARN: Multi-variable type inference failed */
    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, P p) {
        Array<AssetDescriptor> array = new Array<>();
        V v = (V) loadModelData(fileHandle, p);
        if (v == null) {
            return array;
        }
        ObjectMap.Entry<String, ModelData> entry = new ObjectMap.Entry<>();
        entry.key = str;
        entry.value = v;
        synchronized (this.items) {
            this.items.add(entry);
        }
        TextureLoader.TextureParameter textureParameter = p != null ? p.textureParameter : this.defaultParameters.textureParameter;
        Iterator<ModelMaterial> it = v.materials.iterator();
        while (it.hasNext()) {
            ModelMaterial next = it.next();
            if (next.textures != null) {
                Iterator<ModelTexture> it2 = next.textures.iterator();
                while (it2.hasNext()) {
                    array.add(new AssetDescriptor(it2.next().fileName, Texture.class, textureParameter));
                }
            }
        }
        return array;
    }

    public Model loadSync(AssetManager assetManager, String str, FileHandle fileHandle, P p) {
        V v;
        synchronized (this.items) {
            v = null;
            for (int i = 0; i < this.items.size; i++) {
                if (this.items.get(i).key.equals(str)) {
                    v = this.items.get(i).value;
                    this.items.removeIndex(i);
                }
            }
        }
        if (v == null) {
            return null;
        }
        Model model = new Model(v, new TextureProvider.AssetTextureProvider(assetManager));
        Iterator<Disposable> it = model.getManagedDisposables().iterator();
        while (it.hasNext()) {
            if (it.next() instanceof Texture) {
                it.remove();
            }
        }
        return model;
    }

    public static class ModelParameters extends AssetLoaderParameters<Model> {
        public TextureLoader.TextureParameter textureParameter = new TextureLoader.TextureParameter();

        public ModelParameters() {
            TextureLoader.TextureParameter textureParameter2 = this.textureParameter;
            Texture.TextureFilter textureFilter = Texture.TextureFilter.Linear;
            textureParameter2.magFilter = textureFilter;
            textureParameter2.minFilter = textureFilter;
            TextureLoader.TextureParameter textureParameter3 = this.textureParameter;
            Texture.TextureWrap textureWrap = Texture.TextureWrap.Repeat;
            textureParameter3.wrapV = textureWrap;
            textureParameter3.wrapU = textureWrap;
        }
    }
}
