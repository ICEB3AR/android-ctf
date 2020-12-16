package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.SynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.ImageResolver;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.tiles.AnimatedTiledMapTile;
import com.badlogic.gdx.maps.tiled.tiles.StaticTiledMapTile;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.XmlReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.StringTokenizer;

public class TideMapLoader extends SynchronousAssetLoader<TiledMap, Parameters> {
    private XmlReader.Element root;
    private XmlReader xml = new XmlReader();

    public static class Parameters extends AssetLoaderParameters<TiledMap> {
    }

    public TideMapLoader() {
        super(new InternalFileHandleResolver());
    }

    public TideMapLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public TiledMap load(String str) {
        try {
            FileHandle resolve = resolve(str);
            this.root = this.xml.parse(resolve);
            ObjectMap objectMap = new ObjectMap();
            Iterator<FileHandle> it = loadTileSheets(this.root, resolve).iterator();
            while (it.hasNext()) {
                FileHandle next = it.next();
                objectMap.put(next.path(), new Texture(next));
            }
            TiledMap loadMap = loadMap(this.root, resolve, new ImageResolver.DirectImageResolver(objectMap));
            loadMap.setOwnedResources(objectMap.values().toArray());
            return loadMap;
        } catch (IOException e) {
            throw new GdxRuntimeException("Couldn't load tilemap '" + str + "'", e);
        }
    }

    public TiledMap load(AssetManager assetManager, String str, FileHandle fileHandle, Parameters parameters) {
        try {
            return loadMap(this.root, fileHandle, new ImageResolver.AssetManagerImageResolver(assetManager));
        } catch (Exception e) {
            throw new GdxRuntimeException("Couldn't load tilemap '" + str + "'", e);
        }
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, Parameters parameters) {
        Array<AssetDescriptor> array = new Array<>();
        try {
            this.root = this.xml.parse(fileHandle);
            Iterator<FileHandle> it = loadTileSheets(this.root, fileHandle).iterator();
            while (it.hasNext()) {
                array.add(new AssetDescriptor(it.next().path(), Texture.class));
            }
            return array;
        } catch (IOException e) {
            throw new GdxRuntimeException("Couldn't load tilemap '" + str + "'", e);
        }
    }

    private TiledMap loadMap(XmlReader.Element element, FileHandle fileHandle, ImageResolver imageResolver) {
        TiledMap tiledMap = new TiledMap();
        XmlReader.Element childByName = element.getChildByName("Properties");
        if (childByName != null) {
            loadProperties(tiledMap.getProperties(), childByName);
        }
        Iterator<XmlReader.Element> it = element.getChildByName("TileSheets").getChildrenByName("TileSheet").iterator();
        while (it.hasNext()) {
            loadTileSheet(tiledMap, it.next(), fileHandle, imageResolver);
        }
        Iterator<XmlReader.Element> it2 = element.getChildByName("Layers").getChildrenByName("Layer").iterator();
        while (it2.hasNext()) {
            loadLayer(tiledMap, it2.next());
        }
        return tiledMap;
    }

    private Array<FileHandle> loadTileSheets(XmlReader.Element element, FileHandle fileHandle) throws IOException {
        Array<FileHandle> array = new Array<>();
        Iterator<XmlReader.Element> it = element.getChildByName("TileSheets").getChildrenByName("TileSheet").iterator();
        while (it.hasNext()) {
            array.add(getRelativeFileHandle(fileHandle, it.next().getChildByName("ImageSource").getText()));
        }
        return array;
    }

    private void loadTileSheet(TiledMap tiledMap, XmlReader.Element element, FileHandle fileHandle, ImageResolver imageResolver) {
        if (element.getName().equals("TileSheet")) {
            String attribute = element.getAttribute("Id");
            element.getChildByName("Description").getText();
            String text = element.getChildByName("ImageSource").getText();
            XmlReader.Element childByName = element.getChildByName("Alignment");
            String attribute2 = childByName.getAttribute("SheetSize");
            String attribute3 = childByName.getAttribute("TileSize");
            String attribute4 = childByName.getAttribute("Margin");
            childByName.getAttribute("Spacing");
            String[] split = attribute2.split(" x ");
            Integer.parseInt(split[0]);
            int i = 1;
            Integer.parseInt(split[1]);
            String[] split2 = attribute3.split(" x ");
            int parseInt = Integer.parseInt(split2[0]);
            int parseInt2 = Integer.parseInt(split2[1]);
            String[] split3 = attribute4.split(" x ");
            int parseInt3 = Integer.parseInt(split3[0]);
            int parseInt4 = Integer.parseInt(split3[1]);
            String[] split4 = attribute4.split(" x ");
            int parseInt5 = Integer.parseInt(split4[0]);
            int parseInt6 = Integer.parseInt(split4[1]);
            TextureRegion image = imageResolver.getImage(getRelativeFileHandle(fileHandle, text).path());
            TiledMapTileSets tileSets = tiledMap.getTileSets();
            Iterator<TiledMapTileSet> it = tileSets.iterator();
            while (it.hasNext()) {
                i += it.next().size();
            }
            TiledMapTileSet tiledMapTileSet = new TiledMapTileSet();
            tiledMapTileSet.setName(attribute);
            tiledMapTileSet.getProperties().put("firstgid", Integer.valueOf(i));
            int regionWidth = image.getRegionWidth() - parseInt;
            int regionHeight = image.getRegionHeight() - parseInt2;
            int i2 = i;
            int i3 = parseInt4;
            while (i3 <= regionHeight) {
                int i4 = i2;
                int i5 = parseInt3;
                while (i5 <= regionWidth) {
                    StaticTiledMapTile staticTiledMapTile = new StaticTiledMapTile(new TextureRegion(image, i5, i3, parseInt, parseInt2));
                    staticTiledMapTile.setId(i4);
                    i4++;
                    tiledMapTileSet.putTile(i4, staticTiledMapTile);
                    i5 += parseInt + parseInt5;
                    regionWidth = regionWidth;
                    image = image;
                    tiledMapTileSet = tiledMapTileSet;
                    regionHeight = regionHeight;
                    parseInt3 = parseInt3;
                }
                i3 += parseInt2 + parseInt6;
                regionWidth = regionWidth;
                i2 = i4;
                parseInt3 = parseInt3;
                image = image;
            }
            XmlReader.Element childByName2 = element.getChildByName("Properties");
            if (childByName2 != null) {
                loadProperties(tiledMapTileSet.getProperties(), childByName2);
            }
            tileSets.addTileSet(tiledMapTileSet);
        }
    }

    private void loadLayer(TiledMap tiledMap, XmlReader.Element element) {
        int i;
        int i2;
        XmlReader.Element element2;
        if (element.getName().equals("Layer")) {
            String attribute = element.getAttribute("Id");
            String attribute2 = element.getAttribute("Visible");
            XmlReader.Element childByName = element.getChildByName("Dimensions");
            String attribute3 = childByName.getAttribute("LayerSize");
            String attribute4 = childByName.getAttribute("TileSize");
            String[] split = attribute3.split(" x ");
            int parseInt = Integer.parseInt(split[0]);
            int parseInt2 = Integer.parseInt(split[1]);
            String[] split2 = attribute4.split(" x ");
            TiledMapTileLayer tiledMapTileLayer = new TiledMapTileLayer(parseInt, parseInt2, Integer.parseInt(split2[0]), Integer.parseInt(split2[1]));
            tiledMapTileLayer.setName(attribute);
            tiledMapTileLayer.setVisible(attribute2.equalsIgnoreCase("True"));
            Array<XmlReader.Element> childrenByName = element.getChildByName("TileArray").getChildrenByName("Row");
            TiledMapTileSets tileSets = tiledMap.getTileSets();
            int i3 = childrenByName.size;
            TiledMapTileSet tiledMapTileSet = null;
            int i4 = 0;
            int i5 = 0;
            while (i4 < i3) {
                XmlReader.Element element3 = childrenByName.get(i4);
                int i6 = (i3 - 1) - i4;
                int childCount = element3.getChildCount();
                TiledMapTileSet tiledMapTileSet2 = tiledMapTileSet;
                int i7 = i5;
                int i8 = 0;
                int i9 = 0;
                while (i8 < childCount) {
                    XmlReader.Element child = element3.getChild(i8);
                    String name = child.getName();
                    if (name.equals("TileSheet")) {
                        tiledMapTileSet2 = tileSets.getTileSet(child.getAttribute("Ref"));
                        i7 = ((Integer) tiledMapTileSet2.getProperties().get("firstgid", Integer.class)).intValue();
                        i = i4;
                        element2 = element3;
                    } else {
                        element2 = element3;
                        if (name.equals("Null")) {
                            i9 += child.getIntAttribute("Count");
                            i = i4;
                        } else {
                            i2 = childCount;
                            if (name.equals("Static")) {
                                TiledMapTileLayer.Cell cell = new TiledMapTileLayer.Cell();
                                cell.setTile(tiledMapTileSet2.getTile(child.getIntAttribute("Index") + i7));
                                tiledMapTileLayer.setCell(i9, i6, cell);
                                i = i4;
                                i9++;
                            } else if (name.equals("Animated")) {
                                int i10 = child.getInt("Interval");
                                XmlReader.Element childByName2 = child.getChildByName("Frames");
                                Array array = new Array();
                                int i11 = i7;
                                int childCount2 = childByName2.getChildCount();
                                i = i4;
                                TiledMapTileSet tiledMapTileSet3 = tiledMapTileSet2;
                                int i12 = 0;
                                while (i12 < childCount2) {
                                    XmlReader.Element child2 = childByName2.getChild(i12);
                                    String name2 = child2.getName();
                                    if (name2.equals("TileSheet")) {
                                        tiledMapTileSet3 = tileSets.getTileSet(child2.getAttribute("Ref"));
                                        i11 = ((Integer) tiledMapTileSet3.getProperties().get("firstgid", Integer.class)).intValue();
                                    } else if (name2.equals("Static")) {
                                        array.add((StaticTiledMapTile) tiledMapTileSet3.getTile(i11 + child2.getIntAttribute("Index")));
                                    }
                                    i12++;
                                    childCount2 = childCount2;
                                    childByName2 = childByName2;
                                }
                                TiledMapTileLayer.Cell cell2 = new TiledMapTileLayer.Cell();
                                cell2.setTile(new AnimatedTiledMapTile(((float) i10) / 1000.0f, array));
                                tiledMapTileLayer.setCell(i9, i6, cell2);
                                i9++;
                                tiledMapTileSet2 = tiledMapTileSet3;
                                i7 = i11;
                            } else {
                                i = i4;
                                tiledMapTileSet2 = tiledMapTileSet2;
                            }
                            i8++;
                            element3 = element2;
                            childrenByName = childrenByName;
                            i3 = i3;
                            childCount = i2;
                            i4 = i;
                        }
                    }
                    i2 = childCount;
                    i8++;
                    element3 = element2;
                    childrenByName = childrenByName;
                    i3 = i3;
                    childCount = i2;
                    i4 = i;
                }
                i4++;
                tiledMapTileSet = tiledMapTileSet2;
                i5 = i7;
            }
            XmlReader.Element childByName3 = element.getChildByName("Properties");
            if (childByName3 != null) {
                loadProperties(tiledMapTileLayer.getProperties(), childByName3);
            }
            tiledMap.getLayers().add(tiledMapTileLayer);
        }
    }

    private void loadProperties(MapProperties mapProperties, XmlReader.Element element) {
        if (element.getName().equals("Properties")) {
            Iterator<XmlReader.Element> it = element.getChildrenByName("Property").iterator();
            while (it.hasNext()) {
                XmlReader.Element next = it.next();
                String attribute = next.getAttribute("Key", null);
                String attribute2 = next.getAttribute("Type", null);
                String text = next.getText();
                if (attribute2.equals("Int32")) {
                    mapProperties.put(attribute, Integer.valueOf(Integer.parseInt(text)));
                } else if (attribute2.equals("String")) {
                    mapProperties.put(attribute, text);
                } else if (attribute2.equals("Boolean")) {
                    mapProperties.put(attribute, Boolean.valueOf(text.equalsIgnoreCase("true")));
                } else {
                    mapProperties.put(attribute, text);
                }
            }
        }
    }

    private static FileHandle getRelativeFileHandle(FileHandle fileHandle, String str) {
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
}
