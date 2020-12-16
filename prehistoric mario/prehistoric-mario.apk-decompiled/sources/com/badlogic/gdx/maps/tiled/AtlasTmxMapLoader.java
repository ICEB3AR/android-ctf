package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.ImageResolver;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.maps.tiled.BaseTmxMapLoader;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectSet;
import com.badlogic.gdx.utils.XmlReader;
import java.util.Iterator;

public class AtlasTmxMapLoader extends BaseTmxMapLoader<AtlasTiledMapLoaderParameters> {
    protected AtlasResolver atlasResolver;
    protected Array<Texture> trackedTextures = new Array<>();

    public static class AtlasTiledMapLoaderParameters extends BaseTmxMapLoader.Parameters {
        public boolean forceTextureFilters = false;
    }

    /* access modifiers changed from: private */
    public interface AtlasResolver extends ImageResolver {
        TextureAtlas getAtlas();

        public static class DirectAtlasResolver implements AtlasResolver {
            private final TextureAtlas atlas;

            public DirectAtlasResolver(TextureAtlas textureAtlas) {
                this.atlas = textureAtlas;
            }

            @Override // com.badlogic.gdx.maps.tiled.AtlasTmxMapLoader.AtlasResolver
            public TextureAtlas getAtlas() {
                return this.atlas;
            }

            @Override // com.badlogic.gdx.maps.ImageResolver
            public TextureRegion getImage(String str) {
                return this.atlas.findRegion(str);
            }
        }

        public static class AssetManagerAtlasResolver implements AtlasResolver {
            private final AssetManager assetManager;
            private final String atlasName;

            public AssetManagerAtlasResolver(AssetManager assetManager2, String str) {
                this.assetManager = assetManager2;
                this.atlasName = str;
            }

            @Override // com.badlogic.gdx.maps.tiled.AtlasTmxMapLoader.AtlasResolver
            public TextureAtlas getAtlas() {
                return (TextureAtlas) this.assetManager.get(this.atlasName, TextureAtlas.class);
            }

            @Override // com.badlogic.gdx.maps.ImageResolver
            public TextureRegion getImage(String str) {
                return getAtlas().findRegion(str);
            }
        }
    }

    public AtlasTmxMapLoader() {
        super(new InternalFileHandleResolver());
    }

    public AtlasTmxMapLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public TiledMap load(String str) {
        return load(str, new AtlasTiledMapLoaderParameters());
    }

    public TiledMap load(String str, AtlasTiledMapLoaderParameters atlasTiledMapLoaderParameters) {
        FileHandle resolve = resolve(str);
        this.root = this.xml.parse(resolve);
        TextureAtlas textureAtlas = new TextureAtlas(getAtlasFileHandle(resolve));
        this.atlasResolver = new AtlasResolver.DirectAtlasResolver(textureAtlas);
        TiledMap loadTiledMap = loadTiledMap(resolve, atlasTiledMapLoaderParameters, this.atlasResolver);
        loadTiledMap.setOwnedResources(new Array<>(new TextureAtlas[]{textureAtlas}));
        setTextureFilters(atlasTiledMapLoaderParameters.textureMinFilter, atlasTiledMapLoaderParameters.textureMagFilter);
        return loadTiledMap;
    }

    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, AtlasTiledMapLoaderParameters atlasTiledMapLoaderParameters) {
        this.atlasResolver = new AtlasResolver.AssetManagerAtlasResolver(assetManager, getAtlasFileHandle(fileHandle).path());
        this.map = loadTiledMap(fileHandle, atlasTiledMapLoaderParameters, this.atlasResolver);
    }

    public TiledMap loadSync(AssetManager assetManager, String str, FileHandle fileHandle, AtlasTiledMapLoaderParameters atlasTiledMapLoaderParameters) {
        if (atlasTiledMapLoaderParameters != null) {
            setTextureFilters(atlasTiledMapLoaderParameters.textureMinFilter, atlasTiledMapLoaderParameters.textureMagFilter);
        }
        return this.map;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.maps.tiled.BaseTmxMapLoader
    public Array<AssetDescriptor> getDependencyAssetDescriptors(FileHandle fileHandle, TextureLoader.TextureParameter textureParameter) {
        Array<AssetDescriptor> array = new Array<>();
        FileHandle atlasFileHandle = getAtlasFileHandle(fileHandle);
        if (atlasFileHandle != null) {
            array.add(new AssetDescriptor(atlasFileHandle, TextureAtlas.class));
        }
        return array;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.maps.tiled.BaseTmxMapLoader
    public void addStaticTiles(FileHandle fileHandle, ImageResolver imageResolver, TiledMapTileSet tiledMapTileSet, XmlReader.Element element, Array<XmlReader.Element> array, String str, int i, int i2, int i3, int i4, int i5, String str2, int i6, int i7, String str3, int i8, int i9, FileHandle fileHandle2) {
        XmlReader.Element childByName;
        int i10;
        TextureAtlas atlas = this.atlasResolver.getAtlas();
        ObjectSet.ObjectSetIterator<Texture> it = atlas.getTextures().iterator();
        while (it.hasNext()) {
            this.trackedTextures.add((Texture) it.next());
        }
        MapProperties properties = tiledMapTileSet.getProperties();
        properties.put("imagesource", str3);
        properties.put("imagewidth", Integer.valueOf(i8));
        properties.put("imageheight", Integer.valueOf(i9));
        properties.put("tilewidth", Integer.valueOf(i2));
        properties.put("tileheight", Integer.valueOf(i3));
        properties.put("margin", Integer.valueOf(i5));
        properties.put("spacing", Integer.valueOf(i4));
        if (str3 != null && str3.length() > 0) {
            int i11 = (((i8 / i2) * (i9 / i3)) + i) - 1;
            Iterator<TextureAtlas.AtlasRegion> it2 = atlas.findRegions(str).iterator();
            while (it2.hasNext()) {
                TextureAtlas.AtlasRegion next = it2.next();
                if (next != null && (i10 = i + next.index) >= i && i10 <= i11) {
                    addStaticTiledMapTile(tiledMapTileSet, next, i10, (float) i6, (float) i7);
                }
            }
        }
        Iterator<XmlReader.Element> it3 = array.iterator();
        while (it3.hasNext()) {
            XmlReader.Element next2 = it3.next();
            int intAttribute = i + next2.getIntAttribute("id", 0);
            if (tiledMapTileSet.getTile(intAttribute) == null && (childByName = next2.getChildByName("image")) != null) {
                String attribute = childByName.getAttribute("source");
                String substring = attribute.substring(0, attribute.lastIndexOf(46));
                TextureRegion findRegion = atlas.findRegion(substring);
                if (findRegion != null) {
                    addStaticTiledMapTile(tiledMapTileSet, findRegion, intAttribute, (float) i6, (float) i7);
                } else {
                    throw new GdxRuntimeException("Tileset atlasRegion not found: " + substring);
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:10:0x0038  */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x005f  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private com.badlogic.gdx.files.FileHandle getAtlasFileHandle(com.badlogic.gdx.files.FileHandle r5) {
        /*
        // Method dump skipped, instructions count: 105
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.maps.tiled.AtlasTmxMapLoader.getAtlasFileHandle(com.badlogic.gdx.files.FileHandle):com.badlogic.gdx.files.FileHandle");
    }

    private void setTextureFilters(Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2) {
        Iterator<Texture> it = this.trackedTextures.iterator();
        while (it.hasNext()) {
            it.next().setFilter(textureFilter, textureFilter2);
        }
        this.trackedTextures.clear();
    }
}
