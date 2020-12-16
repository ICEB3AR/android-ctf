package com.badlogic.gdx.maps.tiled;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.loaders.AsynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.ImageResolver;
import com.badlogic.gdx.maps.MapGroupLayer;
import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.MapLayers;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.maps.tiled.BaseTmxMapLoader.Parameters;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.tiles.AnimatedTiledMapTile;
import com.badlogic.gdx.maps.tiled.tiles.StaticTiledMapTile;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Base64Coder;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.SerializationException;
import com.badlogic.gdx.utils.StreamUtils;
import com.badlogic.gdx.utils.XmlReader;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.StringTokenizer;
import java.util.zip.GZIPInputStream;
import java.util.zip.InflaterInputStream;

public abstract class BaseTmxMapLoader<P extends Parameters> extends AsynchronousAssetLoader<TiledMap, P> {
    protected static final int FLAG_FLIP_DIAGONALLY = 536870912;
    protected static final int FLAG_FLIP_HORIZONTALLY = Integer.MIN_VALUE;
    protected static final int FLAG_FLIP_VERTICALLY = 1073741824;
    protected static final int MASK_CLEAR = -536870912;
    protected boolean convertObjectToTileSpace;
    protected boolean flipY = true;
    protected TiledMap map;
    protected int mapHeightInPixels;
    protected int mapTileHeight;
    protected int mapTileWidth;
    protected int mapWidthInPixels;
    protected XmlReader.Element root;
    protected XmlReader xml = new XmlReader();

    public static class Parameters extends AssetLoaderParameters<TiledMap> {
        public boolean convertObjectToTileSpace = false;
        public boolean flipY = true;
        public boolean generateMipMaps = false;
        public Texture.TextureFilter textureMagFilter = Texture.TextureFilter.Nearest;
        public Texture.TextureFilter textureMinFilter = Texture.TextureFilter.Nearest;
    }

    protected static int unsignedByteToInt(byte b) {
        return b & 255;
    }

    /* access modifiers changed from: protected */
    public abstract void addStaticTiles(FileHandle fileHandle, ImageResolver imageResolver, TiledMapTileSet tiledMapTileSet, XmlReader.Element element, Array<XmlReader.Element> array, String str, int i, int i2, int i3, int i4, int i5, String str2, int i6, int i7, String str3, int i8, int i9, FileHandle fileHandle2);

    /* access modifiers changed from: protected */
    public abstract Array<AssetDescriptor> getDependencyAssetDescriptors(FileHandle fileHandle, TextureLoader.TextureParameter textureParameter);

    public BaseTmxMapLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, P p) {
        this.root = this.xml.parse(fileHandle);
        TextureLoader.TextureParameter textureParameter = new TextureLoader.TextureParameter();
        if (p != null) {
            textureParameter.genMipMaps = p.generateMipMaps;
            textureParameter.minFilter = p.textureMinFilter;
            textureParameter.magFilter = p.textureMagFilter;
        }
        return getDependencyAssetDescriptors(fileHandle, textureParameter);
    }

    /* access modifiers changed from: protected */
    public TiledMap loadTiledMap(FileHandle fileHandle, P p, ImageResolver imageResolver) {
        this.map = new TiledMap();
        if (p != null) {
            this.convertObjectToTileSpace = p.convertObjectToTileSpace;
            this.flipY = p.flipY;
        } else {
            this.convertObjectToTileSpace = false;
            this.flipY = true;
        }
        String attribute = this.root.getAttribute("orientation", null);
        int intAttribute = this.root.getIntAttribute("width", 0);
        int intAttribute2 = this.root.getIntAttribute("height", 0);
        int intAttribute3 = this.root.getIntAttribute("tilewidth", 0);
        int intAttribute4 = this.root.getIntAttribute("tileheight", 0);
        int intAttribute5 = this.root.getIntAttribute("hexsidelength", 0);
        String attribute2 = this.root.getAttribute("staggeraxis", null);
        String attribute3 = this.root.getAttribute("staggerindex", null);
        String attribute4 = this.root.getAttribute("backgroundcolor", null);
        MapProperties properties = this.map.getProperties();
        if (attribute != null) {
            properties.put("orientation", attribute);
        }
        properties.put("width", Integer.valueOf(intAttribute));
        properties.put("height", Integer.valueOf(intAttribute2));
        properties.put("tilewidth", Integer.valueOf(intAttribute3));
        properties.put("tileheight", Integer.valueOf(intAttribute4));
        properties.put("hexsidelength", Integer.valueOf(intAttribute5));
        if (attribute2 != null) {
            properties.put("staggeraxis", attribute2);
        }
        if (attribute3 != null) {
            properties.put("staggerindex", attribute3);
        }
        if (attribute4 != null) {
            properties.put("backgroundcolor", attribute4);
        }
        this.mapTileWidth = intAttribute3;
        this.mapTileHeight = intAttribute4;
        this.mapWidthInPixels = intAttribute * intAttribute3;
        this.mapHeightInPixels = intAttribute2 * intAttribute4;
        if (attribute != null && "staggered".equals(attribute) && intAttribute2 > 1) {
            this.mapWidthInPixels += intAttribute3 / 2;
            this.mapHeightInPixels = (this.mapHeightInPixels / 2) + (intAttribute4 / 2);
        }
        XmlReader.Element childByName = this.root.getChildByName("properties");
        if (childByName != null) {
            loadProperties(this.map.getProperties(), childByName);
        }
        Iterator<XmlReader.Element> it = this.root.getChildrenByName("tileset").iterator();
        while (it.hasNext()) {
            XmlReader.Element next = it.next();
            loadTileSet(next, fileHandle, imageResolver);
            this.root.removeChild(next);
        }
        int childCount = this.root.getChildCount();
        for (int i = 0; i < childCount; i++) {
            XmlReader.Element child = this.root.getChild(i);
            TiledMap tiledMap = this.map;
            loadLayer(tiledMap, tiledMap.getLayers(), child, fileHandle, imageResolver);
        }
        return this.map;
    }

    /* access modifiers changed from: protected */
    public void loadLayer(TiledMap tiledMap, MapLayers mapLayers, XmlReader.Element element, FileHandle fileHandle, ImageResolver imageResolver) {
        String name = element.getName();
        if (name.equals("group")) {
            loadLayerGroup(tiledMap, mapLayers, element, fileHandle, imageResolver);
        } else if (name.equals("layer")) {
            loadTileLayer(tiledMap, mapLayers, element);
        } else if (name.equals("objectgroup")) {
            loadObjectGroup(tiledMap, mapLayers, element);
        } else if (name.equals("imagelayer")) {
            loadImageLayer(tiledMap, mapLayers, element, fileHandle, imageResolver);
        }
    }

    /* access modifiers changed from: protected */
    public void loadLayerGroup(TiledMap tiledMap, MapLayers mapLayers, XmlReader.Element element, FileHandle fileHandle, ImageResolver imageResolver) {
        if (element.getName().equals("group")) {
            MapGroupLayer mapGroupLayer = new MapGroupLayer();
            loadBasicLayerInfo(mapGroupLayer, element);
            XmlReader.Element childByName = element.getChildByName("properties");
            if (childByName != null) {
                loadProperties(mapGroupLayer.getProperties(), childByName);
            }
            int childCount = element.getChildCount();
            for (int i = 0; i < childCount; i++) {
                loadLayer(tiledMap, mapGroupLayer.getLayers(), element.getChild(i), fileHandle, imageResolver);
            }
            Iterator<MapLayer> it = mapGroupLayer.getLayers().iterator();
            while (it.hasNext()) {
                it.next().setParent(mapGroupLayer);
            }
            mapLayers.add(mapGroupLayer);
        }
    }

    /* access modifiers changed from: protected */
    public void loadTileLayer(TiledMap tiledMap, MapLayers mapLayers, XmlReader.Element element) {
        if (element.getName().equals("layer")) {
            int intAttribute = element.getIntAttribute("width", 0);
            int intAttribute2 = element.getIntAttribute("height", 0);
            TiledMapTileLayer tiledMapTileLayer = new TiledMapTileLayer(intAttribute, intAttribute2, ((Integer) tiledMap.getProperties().get("tilewidth", Integer.class)).intValue(), ((Integer) tiledMap.getProperties().get("tileheight", Integer.class)).intValue());
            loadBasicLayerInfo(tiledMapTileLayer, element);
            int[] tileIds = getTileIds(element, intAttribute, intAttribute2);
            TiledMapTileSets tileSets = tiledMap.getTileSets();
            for (int i = 0; i < intAttribute2; i++) {
                for (int i2 = 0; i2 < intAttribute; i2++) {
                    int i3 = tileIds[(i * intAttribute) + i2];
                    boolean z = true;
                    boolean z2 = (FLAG_FLIP_HORIZONTALLY & i3) != 0;
                    boolean z3 = (FLAG_FLIP_VERTICALLY & i3) != 0;
                    if ((FLAG_FLIP_DIAGONALLY & i3) == 0) {
                        z = false;
                    }
                    TiledMapTile tile = tileSets.getTile(i3 & 536870911);
                    if (tile != null) {
                        TiledMapTileLayer.Cell createTileLayerCell = createTileLayerCell(z2, z3, z);
                        createTileLayerCell.setTile(tile);
                        tiledMapTileLayer.setCell(i2, this.flipY ? (intAttribute2 - 1) - i : i, createTileLayerCell);
                    }
                }
            }
            XmlReader.Element childByName = element.getChildByName("properties");
            if (childByName != null) {
                loadProperties(tiledMapTileLayer.getProperties(), childByName);
            }
            mapLayers.add(tiledMapTileLayer);
        }
    }

    /* access modifiers changed from: protected */
    public void loadObjectGroup(TiledMap tiledMap, MapLayers mapLayers, XmlReader.Element element) {
        if (element.getName().equals("objectgroup")) {
            MapLayer mapLayer = new MapLayer();
            loadBasicLayerInfo(mapLayer, element);
            XmlReader.Element childByName = element.getChildByName("properties");
            if (childByName != null) {
                loadProperties(mapLayer.getProperties(), childByName);
            }
            Iterator<XmlReader.Element> it = element.getChildrenByName("object").iterator();
            while (it.hasNext()) {
                loadObject(tiledMap, mapLayer, it.next());
            }
            mapLayers.add(mapLayer);
        }
    }

    /* access modifiers changed from: protected */
    public void loadImageLayer(TiledMap tiledMap, MapLayers mapLayers, XmlReader.Element element, FileHandle fileHandle, ImageResolver imageResolver) {
        float f;
        float f2;
        if (element.getName().equals("imagelayer")) {
            if (element.hasAttribute("offsetx")) {
                f = Float.parseFloat(element.getAttribute("offsetx", "0"));
            } else {
                f = Float.parseFloat(element.getAttribute("x", "0"));
            }
            if (element.hasAttribute("offsety")) {
                f2 = Float.parseFloat(element.getAttribute("offsety", "0"));
            } else {
                f2 = Float.parseFloat(element.getAttribute("y", "0"));
            }
            if (this.flipY) {
                f2 = ((float) this.mapHeightInPixels) - f2;
            }
            TextureRegion textureRegion = null;
            XmlReader.Element childByName = element.getChildByName("image");
            if (childByName != null) {
                textureRegion = imageResolver.getImage(getRelativeFileHandle(fileHandle, childByName.getAttribute("source")).path());
                f2 -= (float) textureRegion.getRegionHeight();
            }
            TiledMapImageLayer tiledMapImageLayer = new TiledMapImageLayer(textureRegion, f, f2);
            loadBasicLayerInfo(tiledMapImageLayer, element);
            XmlReader.Element childByName2 = element.getChildByName("properties");
            if (childByName2 != null) {
                loadProperties(tiledMapImageLayer.getProperties(), childByName2);
            }
            mapLayers.add(tiledMapImageLayer);
        }
    }

    /* access modifiers changed from: protected */
    public void loadBasicLayerInfo(MapLayer mapLayer, XmlReader.Element element) {
        String attribute = element.getAttribute("name", null);
        float parseFloat = Float.parseFloat(element.getAttribute("opacity", BuildConfig.VERSION_NAME));
        boolean z = true;
        if (element.getIntAttribute("visible", 1) != 1) {
            z = false;
        }
        float floatAttribute = element.getFloatAttribute("offsetx", 0.0f);
        float floatAttribute2 = element.getFloatAttribute("offsety", 0.0f);
        mapLayer.setName(attribute);
        mapLayer.setOpacity(parseFloat);
        mapLayer.setVisible(z);
        mapLayer.setOffsetX(floatAttribute);
        mapLayer.setOffsetY(floatAttribute2);
    }

    /* access modifiers changed from: protected */
    public void loadObject(TiledMap tiledMap, MapLayer mapLayer, XmlReader.Element element) {
        loadObject(tiledMap, mapLayer.getObjects(), element, (float) this.mapHeightInPixels);
    }

    /* access modifiers changed from: protected */
    public void loadObject(TiledMap tiledMap, TiledMapTile tiledMapTile, XmlReader.Element element) {
        loadObject(tiledMap, tiledMapTile.getObjects(), element, (float) tiledMapTile.getTextureRegion().getRegionHeight());
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x013a  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x01d5  */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x01e7  */
    /* JADX WARNING: Removed duplicated region for block: B:74:0x01fe  */
    /* JADX WARNING: Removed duplicated region for block: B:77:0x020e  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x022c  */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x023a  */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x026b  */
    /* JADX WARNING: Removed duplicated region for block: B:90:0x0277  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void loadObject(com.badlogic.gdx.maps.tiled.TiledMap r23, com.badlogic.gdx.maps.MapObjects r24, com.badlogic.gdx.utils.XmlReader.Element r25, float r26) {
        /*
        // Method dump skipped, instructions count: 644
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.maps.tiled.BaseTmxMapLoader.loadObject(com.badlogic.gdx.maps.tiled.TiledMap, com.badlogic.gdx.maps.MapObjects, com.badlogic.gdx.utils.XmlReader$Element, float):void");
    }

    /* access modifiers changed from: protected */
    public void loadProperties(MapProperties mapProperties, XmlReader.Element element) {
        if (element != null && element.getName().equals("properties")) {
            Iterator<XmlReader.Element> it = element.getChildrenByName("property").iterator();
            while (it.hasNext()) {
                XmlReader.Element next = it.next();
                String attribute = next.getAttribute("name", null);
                String attribute2 = next.getAttribute("value", null);
                String attribute3 = next.getAttribute("type", null);
                if (attribute2 == null) {
                    attribute2 = next.getText();
                }
                mapProperties.put(attribute, castProperty(attribute, attribute2, attribute3));
            }
        }
    }

    private Object castProperty(String str, String str2, String str3) {
        if (str3 == null) {
            return str2;
        }
        if (str3.equals("int")) {
            return Integer.valueOf(str2);
        }
        if (str3.equals("float")) {
            return Float.valueOf(str2);
        }
        if (str3.equals("bool")) {
            return Boolean.valueOf(str2);
        }
        if (str3.equals("color")) {
            String substring = str2.substring(3);
            String substring2 = str2.substring(1, 3);
            return Color.valueOf(substring + substring2);
        }
        throw new GdxRuntimeException("Wrong type given for property " + str + ", given : " + str3 + ", supported : string, bool, int, float, color");
    }

    /* access modifiers changed from: protected */
    public TiledMapTileLayer.Cell createTileLayerCell(boolean z, boolean z2, boolean z3) {
        TiledMapTileLayer.Cell cell = new TiledMapTileLayer.Cell();
        if (!z3) {
            cell.setFlipHorizontally(z);
            cell.setFlipVertically(z2);
        } else if (z && z2) {
            cell.setFlipHorizontally(true);
            cell.setRotation(3);
        } else if (z) {
            cell.setRotation(3);
        } else if (z2) {
            cell.setRotation(1);
        } else {
            cell.setFlipVertically(true);
            cell.setRotation(3);
        }
        return cell;
    }

    public static int[] getTileIds(XmlReader.Element element, int i, int i2) {
        InputStream bufferedInputStream;
        XmlReader.Element childByName = element.getChildByName("data");
        String attribute = childByName.getAttribute("encoding", null);
        if (attribute != null) {
            int[] iArr = new int[(i * i2)];
            if (attribute.equals("csv")) {
                String[] split = childByName.getText().split(",");
                for (int i3 = 0; i3 < split.length; i3++) {
                    iArr[i3] = (int) Long.parseLong(split[i3].trim());
                }
            } else if (attribute.equals("base64")) {
                try {
                    String attribute2 = childByName.getAttribute("compression", null);
                    byte[] decode = Base64Coder.decode(childByName.getText());
                    if (attribute2 == null) {
                        bufferedInputStream = new ByteArrayInputStream(decode);
                    } else if (attribute2.equals("gzip")) {
                        bufferedInputStream = new BufferedInputStream(new GZIPInputStream(new ByteArrayInputStream(decode), decode.length));
                    } else if (attribute2.equals("zlib")) {
                        bufferedInputStream = new BufferedInputStream(new InflaterInputStream(new ByteArrayInputStream(decode)));
                    } else {
                        throw new GdxRuntimeException("Unrecognised compression (" + attribute2 + ") for TMX Layer Data");
                    }
                    byte[] bArr = new byte[4];
                    for (int i4 = 0; i4 < i2; i4++) {
                        for (int i5 = 0; i5 < i; i5++) {
                            int read = bufferedInputStream.read(bArr);
                            while (true) {
                                if (read >= bArr.length) {
                                    break;
                                }
                                int read2 = bufferedInputStream.read(bArr, read, bArr.length - read);
                                if (read2 == -1) {
                                    break;
                                }
                                read += read2;
                            }
                            if (read == bArr.length) {
                                iArr[(i4 * i) + i5] = unsignedByteToInt(bArr[0]) | (unsignedByteToInt(bArr[1]) << 8) | (unsignedByteToInt(bArr[2]) << 16) | (unsignedByteToInt(bArr[3]) << 24);
                            } else {
                                throw new GdxRuntimeException("Error Reading TMX Layer Data: Premature end of tile data");
                            }
                        }
                    }
                    StreamUtils.closeQuietly(bufferedInputStream);
                } catch (IOException e) {
                    throw new GdxRuntimeException("Error Reading TMX Layer Data - IOException: " + e.getMessage());
                } catch (Throwable th) {
                    StreamUtils.closeQuietly(null);
                    throw th;
                }
            } else {
                throw new GdxRuntimeException("Unrecognised encoding (" + attribute + ") for TMX Layer Data");
            }
            return iArr;
        }
        throw new GdxRuntimeException("Unsupported encoding (XML) for TMX Layer Data");
    }

    protected static FileHandle getRelativeFileHandle(FileHandle fileHandle, String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, "\\/");
        FileHandle parent = fileHandle.parent();
        while (stringTokenizer.hasMoreElements()) {
            String nextToken = stringTokenizer.nextToken();
            if (nextToken.equals("..")) {
                parent = parent.parent();
            } else {
                parent = parent.child(nextToken);
            }
        }
        return parent;
    }

    /* access modifiers changed from: protected */
    public void loadTileSet(XmlReader.Element element, FileHandle fileHandle, ImageResolver imageResolver) {
        int i;
        FileHandle fileHandle2;
        int i2;
        String str;
        XmlReader.Element element2;
        int i3;
        int i4;
        int i5;
        int i6;
        FileHandle fileHandle3;
        if (element.getName().equals("tileset")) {
            String str2 = BuildConfig.FLAVOR;
            String attribute = element.getAttribute("source", null);
            if (attribute != null) {
                FileHandle relativeFileHandle = getRelativeFileHandle(fileHandle, attribute);
                try {
                    element2 = this.xml.parse(relativeFileHandle);
                    XmlReader.Element childByName = element2.getChildByName("image");
                    if (childByName != null) {
                        str2 = childByName.getAttribute("source");
                        i6 = childByName.getIntAttribute("width", 0);
                        i5 = childByName.getIntAttribute("height", 0);
                        fileHandle3 = getRelativeFileHandle(relativeFileHandle, str2);
                    } else {
                        fileHandle3 = null;
                        i6 = 0;
                        i5 = 0;
                    }
                    fileHandle2 = fileHandle3;
                    str = str2;
                    i = i6;
                    i2 = i5;
                } catch (SerializationException unused) {
                    throw new GdxRuntimeException("Error parsing external tileset.");
                }
            } else {
                XmlReader.Element childByName2 = element.getChildByName("image");
                if (childByName2 != null) {
                    String attribute2 = childByName2.getAttribute("source");
                    element2 = element;
                    str = attribute2;
                    i = childByName2.getIntAttribute("width", 0);
                    i2 = childByName2.getIntAttribute("height", 0);
                    fileHandle2 = getRelativeFileHandle(fileHandle, attribute2);
                } else {
                    element2 = element;
                    str = str2;
                    fileHandle2 = null;
                    i2 = 0;
                    i = 0;
                }
            }
            String str3 = element2.get("name", null);
            int intAttribute = element2.getIntAttribute("firstgid", 1);
            int intAttribute2 = element2.getIntAttribute("tilewidth", 0);
            int intAttribute3 = element2.getIntAttribute("tileheight", 0);
            int intAttribute4 = element2.getIntAttribute("spacing", 0);
            int intAttribute5 = element2.getIntAttribute("margin", 0);
            XmlReader.Element childByName3 = element2.getChildByName("tileoffset");
            if (childByName3 != null) {
                int intAttribute6 = childByName3.getIntAttribute("x", 0);
                i3 = childByName3.getIntAttribute("y", 0);
                i4 = intAttribute6;
            } else {
                i4 = 0;
                i3 = 0;
            }
            TiledMapTileSet tiledMapTileSet = new TiledMapTileSet();
            tiledMapTileSet.setName(str3);
            MapProperties properties = tiledMapTileSet.getProperties();
            XmlReader.Element childByName4 = element2.getChildByName("properties");
            if (childByName4 != null) {
                loadProperties(properties, childByName4);
            }
            properties.put("firstgid", Integer.valueOf(intAttribute));
            Array<XmlReader.Element> childrenByName = element2.getChildrenByName("tile");
            TiledMapTileSet tiledMapTileSet2 = tiledMapTileSet;
            int i7 = intAttribute;
            addStaticTiles(fileHandle, imageResolver, tiledMapTileSet, element2, childrenByName, str3, intAttribute, intAttribute2, intAttribute3, intAttribute4, intAttribute5, attribute, i4, i3, str, i, i2, fileHandle2);
            Iterator<XmlReader.Element> it = childrenByName.iterator();
            while (it.hasNext()) {
                XmlReader.Element next = it.next();
                TiledMapTile tile = tiledMapTileSet2.getTile(i7 + next.getIntAttribute("id", 0));
                if (tile != null) {
                    addTileProperties(tile, next);
                    addTileObjectGroup(tile, next);
                    addAnimatedTile(tiledMapTileSet2, tile, next, i7);
                }
                tiledMapTileSet2 = tiledMapTileSet2;
                i7 = i7;
            }
            this.map.getTileSets().addTileSet(tiledMapTileSet2);
        }
    }

    /* access modifiers changed from: protected */
    public void addTileProperties(TiledMapTile tiledMapTile, XmlReader.Element element) {
        String attribute = element.getAttribute("terrain", null);
        if (attribute != null) {
            tiledMapTile.getProperties().put("terrain", attribute);
        }
        String attribute2 = element.getAttribute("probability", null);
        if (attribute2 != null) {
            tiledMapTile.getProperties().put("probability", attribute2);
        }
        XmlReader.Element childByName = element.getChildByName("properties");
        if (childByName != null) {
            loadProperties(tiledMapTile.getProperties(), childByName);
        }
    }

    /* access modifiers changed from: protected */
    public void addTileObjectGroup(TiledMapTile tiledMapTile, XmlReader.Element element) {
        XmlReader.Element childByName = element.getChildByName("objectgroup");
        if (childByName != null) {
            Iterator<XmlReader.Element> it = childByName.getChildrenByName("object").iterator();
            while (it.hasNext()) {
                loadObject(this.map, tiledMapTile, it.next());
            }
        }
    }

    /* access modifiers changed from: protected */
    public void addAnimatedTile(TiledMapTileSet tiledMapTileSet, TiledMapTile tiledMapTile, XmlReader.Element element, int i) {
        XmlReader.Element childByName = element.getChildByName("animation");
        if (childByName != null) {
            Array array = new Array();
            IntArray intArray = new IntArray();
            Iterator<XmlReader.Element> it = childByName.getChildrenByName("frame").iterator();
            while (it.hasNext()) {
                XmlReader.Element next = it.next();
                array.add((StaticTiledMapTile) tiledMapTileSet.getTile(next.getIntAttribute("tileid") + i));
                intArray.add(next.getIntAttribute("duration"));
            }
            AnimatedTiledMapTile animatedTiledMapTile = new AnimatedTiledMapTile(intArray, array);
            animatedTiledMapTile.setId(tiledMapTile.getId());
            tiledMapTileSet.putTile(tiledMapTile.getId(), animatedTiledMapTile);
        }
    }

    /* access modifiers changed from: protected */
    public void addStaticTiledMapTile(TiledMapTileSet tiledMapTileSet, TextureRegion textureRegion, int i, float f, float f2) {
        StaticTiledMapTile staticTiledMapTile = new StaticTiledMapTile(textureRegion);
        staticTiledMapTile.setId(i);
        staticTiledMapTile.setOffsetX(f);
        if (this.flipY) {
            f2 = -f2;
        }
        staticTiledMapTile.setOffsetY(f2);
        tiledMapTileSet.putTile(i, staticTiledMapTile);
    }
}
