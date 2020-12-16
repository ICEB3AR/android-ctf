package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.CubemapLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.graphics.glutils.FacedCubemapData;
import com.badlogic.gdx.graphics.glutils.PixmapTextureData;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Cubemap extends GLTexture {
    private static AssetManager assetManager;
    static final Map<Application, Array<Cubemap>> managedCubemaps = new HashMap();
    protected CubemapData data;

    @Override // com.badlogic.gdx.graphics.GLTexture
    public int getDepth() {
        return 0;
    }

    public enum CubemapSide {
        PositiveX(0, GL20.GL_TEXTURE_CUBE_MAP_POSITIVE_X, 0.0f, -1.0f, 0.0f, 1.0f, 0.0f, 0.0f),
        NegativeX(1, GL20.GL_TEXTURE_CUBE_MAP_NEGATIVE_X, 0.0f, -1.0f, 0.0f, -1.0f, 0.0f, 0.0f),
        PositiveY(2, GL20.GL_TEXTURE_CUBE_MAP_POSITIVE_Y, 0.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f),
        NegativeY(3, GL20.GL_TEXTURE_CUBE_MAP_NEGATIVE_Y, 0.0f, 0.0f, -1.0f, 0.0f, -1.0f, 0.0f),
        PositiveZ(4, GL20.GL_TEXTURE_CUBE_MAP_POSITIVE_Z, 0.0f, -1.0f, 0.0f, 0.0f, 0.0f, 1.0f),
        NegativeZ(5, GL20.GL_TEXTURE_CUBE_MAP_NEGATIVE_Z, 0.0f, -1.0f, 0.0f, 0.0f, 0.0f, -1.0f);
        
        public final Vector3 direction;
        public final int glEnum;
        public final int index;
        public final Vector3 up;

        private CubemapSide(int i, int i2, float f, float f2, float f3, float f4, float f5, float f6) {
            this.index = i;
            this.glEnum = i2;
            this.up = new Vector3(f, f2, f3);
            this.direction = new Vector3(f4, f5, f6);
        }

        public int getGLEnum() {
            return this.glEnum;
        }

        public Vector3 getUp(Vector3 vector3) {
            return vector3.set(this.up);
        }

        public Vector3 getDirection(Vector3 vector3) {
            return vector3.set(this.direction);
        }
    }

    public Cubemap(CubemapData cubemapData) {
        super(GL20.GL_TEXTURE_CUBE_MAP);
        this.data = cubemapData;
        load(cubemapData);
    }

    public Cubemap(FileHandle fileHandle, FileHandle fileHandle2, FileHandle fileHandle3, FileHandle fileHandle4, FileHandle fileHandle5, FileHandle fileHandle6) {
        this(fileHandle, fileHandle2, fileHandle3, fileHandle4, fileHandle5, fileHandle6, false);
    }

    public Cubemap(FileHandle fileHandle, FileHandle fileHandle2, FileHandle fileHandle3, FileHandle fileHandle4, FileHandle fileHandle5, FileHandle fileHandle6, boolean z) {
        this(TextureData.Factory.loadFromFile(fileHandle, z), TextureData.Factory.loadFromFile(fileHandle2, z), TextureData.Factory.loadFromFile(fileHandle3, z), TextureData.Factory.loadFromFile(fileHandle4, z), TextureData.Factory.loadFromFile(fileHandle5, z), TextureData.Factory.loadFromFile(fileHandle6, z));
    }

    public Cubemap(Pixmap pixmap, Pixmap pixmap2, Pixmap pixmap3, Pixmap pixmap4, Pixmap pixmap5, Pixmap pixmap6) {
        this(pixmap, pixmap2, pixmap3, pixmap4, pixmap5, pixmap6, false);
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public Cubemap(Pixmap pixmap, Pixmap pixmap2, Pixmap pixmap3, Pixmap pixmap4, Pixmap pixmap5, Pixmap pixmap6, boolean z) {
        this(pixmap == null ? null : new PixmapTextureData(pixmap, null, z, false), pixmap2 == null ? null : new PixmapTextureData(pixmap2, null, z, false), pixmap3 == null ? null : new PixmapTextureData(pixmap3, null, z, false), pixmap4 == null ? null : new PixmapTextureData(pixmap4, null, z, false), pixmap5 == null ? null : new PixmapTextureData(pixmap5, null, z, false), pixmap6 == null ? null : new PixmapTextureData(pixmap6, null, z, false));
    }

    public Cubemap(int i, int i2, int i3, Pixmap.Format format) {
        this(new PixmapTextureData(new Pixmap(i3, i2, format), null, false, true), new PixmapTextureData(new Pixmap(i3, i2, format), null, false, true), new PixmapTextureData(new Pixmap(i, i3, format), null, false, true), new PixmapTextureData(new Pixmap(i, i3, format), null, false, true), new PixmapTextureData(new Pixmap(i, i2, format), null, false, true), new PixmapTextureData(new Pixmap(i, i2, format), null, false, true));
    }

    public Cubemap(TextureData textureData, TextureData textureData2, TextureData textureData3, TextureData textureData4, TextureData textureData5, TextureData textureData6) {
        super(GL20.GL_TEXTURE_CUBE_MAP);
        this.minFilter = Texture.TextureFilter.Nearest;
        this.magFilter = Texture.TextureFilter.Nearest;
        this.uWrap = Texture.TextureWrap.ClampToEdge;
        this.vWrap = Texture.TextureWrap.ClampToEdge;
        this.data = new FacedCubemapData(textureData, textureData2, textureData3, textureData4, textureData5, textureData6);
        load(this.data);
    }

    public void load(CubemapData cubemapData) {
        if (!cubemapData.isPrepared()) {
            cubemapData.prepare();
        }
        bind();
        unsafeSetFilter(this.minFilter, this.magFilter, true);
        unsafeSetWrap(this.uWrap, this.vWrap, true);
        cubemapData.consumeCubemapData();
        Gdx.gl.glBindTexture(this.glTarget, 0);
    }

    public CubemapData getCubemapData() {
        return this.data;
    }

    @Override // com.badlogic.gdx.graphics.GLTexture
    public boolean isManaged() {
        return this.data.isManaged();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.graphics.GLTexture
    public void reload() {
        if (isManaged()) {
            this.glHandle = Gdx.gl.glGenTexture();
            load(this.data);
            return;
        }
        throw new GdxRuntimeException("Tried to reload an unmanaged Cubemap");
    }

    @Override // com.badlogic.gdx.graphics.GLTexture
    public int getWidth() {
        return this.data.getWidth();
    }

    @Override // com.badlogic.gdx.graphics.GLTexture
    public int getHeight() {
        return this.data.getHeight();
    }

    @Override // com.badlogic.gdx.graphics.GLTexture, com.badlogic.gdx.utils.Disposable
    public void dispose() {
        if (this.glHandle != 0) {
            delete();
            if (this.data.isManaged() && managedCubemaps.get(Gdx.app) != null) {
                managedCubemaps.get(Gdx.app).removeValue(this, true);
            }
        }
    }

    private static void addManagedCubemap(Application application, Cubemap cubemap) {
        Array<Cubemap> array = managedCubemaps.get(application);
        if (array == null) {
            array = new Array<>();
        }
        array.add(cubemap);
        managedCubemaps.put(application, array);
    }

    public static void clearAllCubemaps(Application application) {
        managedCubemaps.remove(application);
    }

    public static void invalidateAllCubemaps(Application application) {
        Array<Cubemap> array = managedCubemaps.get(application);
        if (array != null) {
            AssetManager assetManager2 = assetManager;
            if (assetManager2 == null) {
                for (int i = 0; i < array.size; i++) {
                    array.get(i).reload();
                }
                return;
            }
            assetManager2.finishLoading();
            Array<? extends Cubemap> array2 = new Array<>(array);
            Iterator<? extends Cubemap> it = array2.iterator();
            while (it.hasNext()) {
                Cubemap cubemap = (Cubemap) it.next();
                String assetFileName = assetManager.getAssetFileName(cubemap);
                if (assetFileName == null) {
                    cubemap.reload();
                } else {
                    final int referenceCount = assetManager.getReferenceCount(assetFileName);
                    assetManager.setReferenceCount(assetFileName, 0);
                    cubemap.glHandle = 0;
                    CubemapLoader.CubemapParameter cubemapParameter = new CubemapLoader.CubemapParameter();
                    cubemapParameter.cubemapData = cubemap.getCubemapData();
                    cubemapParameter.minFilter = cubemap.getMinFilter();
                    cubemapParameter.magFilter = cubemap.getMagFilter();
                    cubemapParameter.wrapU = cubemap.getUWrap();
                    cubemapParameter.wrapV = cubemap.getVWrap();
                    cubemapParameter.cubemap = cubemap;
                    cubemapParameter.loadedCallback = new AssetLoaderParameters.LoadedCallback() {
                        /* class com.badlogic.gdx.graphics.Cubemap.AnonymousClass1 */

                        @Override // com.badlogic.gdx.assets.AssetLoaderParameters.LoadedCallback
                        public void finishedLoading(AssetManager assetManager, String str, Class cls) {
                            assetManager.setReferenceCount(str, referenceCount);
                        }
                    };
                    assetManager.unload(assetFileName);
                    cubemap.glHandle = Gdx.gl.glGenTexture();
                    assetManager.load(assetFileName, Cubemap.class, cubemapParameter);
                }
            }
            array.clear();
            array.addAll(array2);
        }
    }

    public static void setAssetManager(AssetManager assetManager2) {
        assetManager = assetManager2;
    }

    public static String getManagedStatus() {
        StringBuilder sb = new StringBuilder();
        sb.append("Managed cubemap/app: { ");
        for (Application application : managedCubemaps.keySet()) {
            sb.append(managedCubemaps.get(application).size);
            sb.append(" ");
        }
        sb.append("}");
        return sb.toString();
    }

    public static int getNumManagedCubemaps() {
        return managedCubemaps.get(Gdx.app).size;
    }
}
