package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.ObjectSet;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Comparator;
import java.util.Iterator;

public class TextureAtlas implements Disposable {
    static final Comparator<TextureAtlasData.Region> indexComparator = new Comparator<TextureAtlasData.Region>() {
        /* class com.badlogic.gdx.graphics.g2d.TextureAtlas.AnonymousClass1 */

        public int compare(TextureAtlasData.Region region, TextureAtlasData.Region region2) {
            int i = region.index;
            if (i == -1) {
                i = Integer.MAX_VALUE;
            }
            int i2 = region2.index;
            if (i2 == -1) {
                i2 = Integer.MAX_VALUE;
            }
            return i - i2;
        }
    };
    static final String[] tuple = new String[4];
    private final Array<AtlasRegion> regions;
    private final ObjectSet<Texture> textures;

    public static class TextureAtlasData {
        final Array<Page> pages = new Array<>();
        final Array<Region> regions = new Array<>();

        public static class Region {
            public int degrees;
            public boolean flip;
            public int height;
            public int index;
            public int left;
            public String name;
            public float offsetX;
            public float offsetY;
            public int originalHeight;
            public int originalWidth;
            public int[] pads;
            public Page page;
            public boolean rotate;
            public int[] splits;
            public int top;
            public int width;
        }

        public static class Page {
            public final Pixmap.Format format;
            public final float height;
            public final Texture.TextureFilter magFilter;
            public final Texture.TextureFilter minFilter;
            public Texture texture;
            public final FileHandle textureFile;
            public final Texture.TextureWrap uWrap;
            public final boolean useMipMaps;
            public final Texture.TextureWrap vWrap;
            public final float width;

            public Page(FileHandle fileHandle, float f, float f2, boolean z, Pixmap.Format format2, Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, Texture.TextureWrap textureWrap, Texture.TextureWrap textureWrap2) {
                this.width = f;
                this.height = f2;
                this.textureFile = fileHandle;
                this.useMipMaps = z;
                this.format = format2;
                this.minFilter = textureFilter;
                this.magFilter = textureFilter2;
                this.uWrap = textureWrap;
                this.vWrap = textureWrap2;
            }
        }

        public TextureAtlasData(FileHandle fileHandle, FileHandle fileHandle2, boolean z) {
            int i;
            float f;
            float f2;
            Texture.TextureWrap textureWrap;
            Texture.TextureWrap textureWrap2;
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileHandle.read()), 64);
            while (true) {
                Page page = null;
                while (true) {
                    try {
                        String readLine = bufferedReader.readLine();
                        if (readLine == null) {
                            StreamUtils.closeQuietly(bufferedReader);
                            this.regions.sort(TextureAtlas.indexComparator);
                            return;
                        } else if (readLine.trim().length() == 0) {
                            break;
                        } else if (page == null) {
                            FileHandle child = fileHandle2.child(readLine);
                            if (TextureAtlas.readTuple(bufferedReader) == 2) {
                                TextureAtlas.readTuple(bufferedReader);
                                f2 = (float) Integer.parseInt(TextureAtlas.tuple[0]);
                                f = (float) Integer.parseInt(TextureAtlas.tuple[1]);
                            } else {
                                f2 = 0.0f;
                                f = 0.0f;
                            }
                            Pixmap.Format valueOf = Pixmap.Format.valueOf(TextureAtlas.tuple[0]);
                            TextureAtlas.readTuple(bufferedReader);
                            Texture.TextureFilter valueOf2 = Texture.TextureFilter.valueOf(TextureAtlas.tuple[0]);
                            Texture.TextureFilter valueOf3 = Texture.TextureFilter.valueOf(TextureAtlas.tuple[1]);
                            String readValue = TextureAtlas.readValue(bufferedReader);
                            Texture.TextureWrap textureWrap3 = Texture.TextureWrap.ClampToEdge;
                            Texture.TextureWrap textureWrap4 = Texture.TextureWrap.ClampToEdge;
                            if (readValue.equals("x")) {
                                textureWrap2 = Texture.TextureWrap.Repeat;
                            } else {
                                if (readValue.equals("y")) {
                                    textureWrap = Texture.TextureWrap.Repeat;
                                    textureWrap2 = textureWrap3;
                                } else if (readValue.equals("xy")) {
                                    textureWrap2 = Texture.TextureWrap.Repeat;
                                    textureWrap = Texture.TextureWrap.Repeat;
                                } else {
                                    textureWrap2 = textureWrap3;
                                }
                                page = new Page(child, f2, f, valueOf2.isMipMap(), valueOf, valueOf2, valueOf3, textureWrap2, textureWrap);
                                this.pages.add(page);
                            }
                            textureWrap = textureWrap4;
                            page = new Page(child, f2, f, valueOf2.isMipMap(), valueOf, valueOf2, valueOf3, textureWrap2, textureWrap);
                            this.pages.add(page);
                        } else {
                            String readValue2 = TextureAtlas.readValue(bufferedReader);
                            if (readValue2.equalsIgnoreCase("true")) {
                                i = 90;
                            } else if (readValue2.equalsIgnoreCase("false")) {
                                i = 0;
                            } else {
                                i = Integer.valueOf(readValue2).intValue();
                            }
                            TextureAtlas.readTuple(bufferedReader);
                            int parseInt = Integer.parseInt(TextureAtlas.tuple[0]);
                            int parseInt2 = Integer.parseInt(TextureAtlas.tuple[1]);
                            TextureAtlas.readTuple(bufferedReader);
                            int parseInt3 = Integer.parseInt(TextureAtlas.tuple[0]);
                            int parseInt4 = Integer.parseInt(TextureAtlas.tuple[1]);
                            Region region = new Region();
                            region.page = page;
                            region.left = parseInt;
                            region.top = parseInt2;
                            region.width = parseInt3;
                            region.height = parseInt4;
                            region.name = readLine;
                            region.rotate = i == 90;
                            region.degrees = i;
                            if (TextureAtlas.readTuple(bufferedReader) == 4) {
                                region.splits = new int[]{Integer.parseInt(TextureAtlas.tuple[0]), Integer.parseInt(TextureAtlas.tuple[1]), Integer.parseInt(TextureAtlas.tuple[2]), Integer.parseInt(TextureAtlas.tuple[3])};
                                if (TextureAtlas.readTuple(bufferedReader) == 4) {
                                    region.pads = new int[]{Integer.parseInt(TextureAtlas.tuple[0]), Integer.parseInt(TextureAtlas.tuple[1]), Integer.parseInt(TextureAtlas.tuple[2]), Integer.parseInt(TextureAtlas.tuple[3])};
                                    TextureAtlas.readTuple(bufferedReader);
                                }
                            }
                            region.originalWidth = Integer.parseInt(TextureAtlas.tuple[0]);
                            region.originalHeight = Integer.parseInt(TextureAtlas.tuple[1]);
                            TextureAtlas.readTuple(bufferedReader);
                            region.offsetX = (float) Integer.parseInt(TextureAtlas.tuple[0]);
                            region.offsetY = (float) Integer.parseInt(TextureAtlas.tuple[1]);
                            region.index = Integer.parseInt(TextureAtlas.readValue(bufferedReader));
                            if (z) {
                                region.flip = true;
                            }
                            this.regions.add(region);
                        }
                    } catch (Exception e) {
                        throw new GdxRuntimeException("Error reading pack file: " + fileHandle, e);
                    } catch (Throwable th) {
                        StreamUtils.closeQuietly(bufferedReader);
                        throw th;
                    }
                }
            }
        }

        public Array<Page> getPages() {
            return this.pages;
        }

        public Array<Region> getRegions() {
            return this.regions;
        }
    }

    public TextureAtlas() {
        this.textures = new ObjectSet<>(4);
        this.regions = new Array<>();
    }

    public TextureAtlas(String str) {
        this(Gdx.files.internal(str));
    }

    public TextureAtlas(FileHandle fileHandle) {
        this(fileHandle, fileHandle.parent());
    }

    public TextureAtlas(FileHandle fileHandle, boolean z) {
        this(fileHandle, fileHandle.parent(), z);
    }

    public TextureAtlas(FileHandle fileHandle, FileHandle fileHandle2) {
        this(fileHandle, fileHandle2, false);
    }

    public TextureAtlas(FileHandle fileHandle, FileHandle fileHandle2, boolean z) {
        this(new TextureAtlasData(fileHandle, fileHandle2, z));
    }

    public TextureAtlas(TextureAtlasData textureAtlasData) {
        this.textures = new ObjectSet<>(4);
        this.regions = new Array<>();
        if (textureAtlasData != null) {
            load(textureAtlasData);
        }
    }

    private void load(TextureAtlasData textureAtlasData) {
        Texture texture;
        ObjectMap objectMap = new ObjectMap();
        Iterator<TextureAtlasData.Page> it = textureAtlasData.pages.iterator();
        while (it.hasNext()) {
            TextureAtlasData.Page next = it.next();
            if (next.texture == null) {
                texture = new Texture(next.textureFile, next.format, next.useMipMaps);
                texture.setFilter(next.minFilter, next.magFilter);
                texture.setWrap(next.uWrap, next.vWrap);
            } else {
                texture = next.texture;
                texture.setFilter(next.minFilter, next.magFilter);
                texture.setWrap(next.uWrap, next.vWrap);
            }
            this.textures.add(texture);
            objectMap.put(next, texture);
        }
        Iterator<TextureAtlasData.Region> it2 = textureAtlasData.regions.iterator();
        while (it2.hasNext()) {
            TextureAtlasData.Region next2 = it2.next();
            int i = next2.width;
            int i2 = next2.height;
            AtlasRegion atlasRegion = new AtlasRegion((Texture) objectMap.get(next2.page), next2.left, next2.top, next2.rotate ? i2 : i, next2.rotate ? i : i2);
            atlasRegion.index = next2.index;
            atlasRegion.name = next2.name;
            atlasRegion.offsetX = next2.offsetX;
            atlasRegion.offsetY = next2.offsetY;
            atlasRegion.originalHeight = next2.originalHeight;
            atlasRegion.originalWidth = next2.originalWidth;
            atlasRegion.rotate = next2.rotate;
            atlasRegion.degrees = next2.degrees;
            atlasRegion.splits = next2.splits;
            atlasRegion.pads = next2.pads;
            if (next2.flip) {
                atlasRegion.flip(false, true);
            }
            this.regions.add(atlasRegion);
        }
    }

    public AtlasRegion addRegion(String str, Texture texture, int i, int i2, int i3, int i4) {
        this.textures.add(texture);
        AtlasRegion atlasRegion = new AtlasRegion(texture, i, i2, i3, i4);
        atlasRegion.name = str;
        atlasRegion.index = -1;
        this.regions.add(atlasRegion);
        return atlasRegion;
    }

    public AtlasRegion addRegion(String str, TextureRegion textureRegion) {
        this.textures.add(textureRegion.texture);
        AtlasRegion atlasRegion = new AtlasRegion(textureRegion);
        atlasRegion.name = str;
        atlasRegion.index = -1;
        this.regions.add(atlasRegion);
        return atlasRegion;
    }

    public Array<AtlasRegion> getRegions() {
        return this.regions;
    }

    public AtlasRegion findRegion(String str) {
        int i = this.regions.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (this.regions.get(i2).name.equals(str)) {
                return this.regions.get(i2);
            }
        }
        return null;
    }

    public AtlasRegion findRegion(String str, int i) {
        int i2 = this.regions.size;
        for (int i3 = 0; i3 < i2; i3++) {
            AtlasRegion atlasRegion = this.regions.get(i3);
            if (atlasRegion.name.equals(str) && atlasRegion.index == i) {
                return atlasRegion;
            }
        }
        return null;
    }

    public Array<AtlasRegion> findRegions(String str) {
        Array<AtlasRegion> array = new Array<>(AtlasRegion.class);
        int i = this.regions.size;
        for (int i2 = 0; i2 < i; i2++) {
            AtlasRegion atlasRegion = this.regions.get(i2);
            if (atlasRegion.name.equals(str)) {
                array.add(new AtlasRegion(atlasRegion));
            }
        }
        return array;
    }

    public Array<Sprite> createSprites() {
        Array<Sprite> array = new Array<>(true, this.regions.size, Sprite.class);
        int i = this.regions.size;
        for (int i2 = 0; i2 < i; i2++) {
            array.add(newSprite(this.regions.get(i2)));
        }
        return array;
    }

    public Sprite createSprite(String str) {
        int i = this.regions.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (this.regions.get(i2).name.equals(str)) {
                return newSprite(this.regions.get(i2));
            }
        }
        return null;
    }

    public Sprite createSprite(String str, int i) {
        int i2 = this.regions.size;
        for (int i3 = 0; i3 < i2; i3++) {
            AtlasRegion atlasRegion = this.regions.get(i3);
            if (atlasRegion.name.equals(str) && atlasRegion.index == i) {
                return newSprite(this.regions.get(i3));
            }
        }
        return null;
    }

    public Array<Sprite> createSprites(String str) {
        Array<Sprite> array = new Array<>(Sprite.class);
        int i = this.regions.size;
        for (int i2 = 0; i2 < i; i2++) {
            AtlasRegion atlasRegion = this.regions.get(i2);
            if (atlasRegion.name.equals(str)) {
                array.add(newSprite(atlasRegion));
            }
        }
        return array;
    }

    private Sprite newSprite(AtlasRegion atlasRegion) {
        if (atlasRegion.packedWidth != atlasRegion.originalWidth || atlasRegion.packedHeight != atlasRegion.originalHeight) {
            return new AtlasSprite(atlasRegion);
        }
        if (!atlasRegion.rotate) {
            return new Sprite(atlasRegion);
        }
        Sprite sprite = new Sprite(atlasRegion);
        sprite.setBounds(0.0f, 0.0f, (float) atlasRegion.getRegionHeight(), (float) atlasRegion.getRegionWidth());
        sprite.rotate90(true);
        return sprite;
    }

    public NinePatch createPatch(String str) {
        int i = this.regions.size;
        for (int i2 = 0; i2 < i; i2++) {
            AtlasRegion atlasRegion = this.regions.get(i2);
            if (atlasRegion.name.equals(str)) {
                int[] iArr = atlasRegion.splits;
                if (iArr != null) {
                    NinePatch ninePatch = new NinePatch(atlasRegion, iArr[0], iArr[1], iArr[2], iArr[3]);
                    if (atlasRegion.pads != null) {
                        ninePatch.setPadding((float) atlasRegion.pads[0], (float) atlasRegion.pads[1], (float) atlasRegion.pads[2], (float) atlasRegion.pads[3]);
                    }
                    return ninePatch;
                }
                throw new IllegalArgumentException("Region does not have ninepatch splits: " + str);
            }
        }
        return null;
    }

    public ObjectSet<Texture> getTextures() {
        return this.textures;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        ObjectSet.ObjectSetIterator<Texture> it = this.textures.iterator();
        while (it.hasNext()) {
            ((Texture) it.next()).dispose();
        }
        this.textures.clear(0);
    }

    static String readValue(BufferedReader bufferedReader) throws IOException {
        String readLine = bufferedReader.readLine();
        int indexOf = readLine.indexOf(58);
        if (indexOf != -1) {
            return readLine.substring(indexOf + 1).trim();
        }
        throw new GdxRuntimeException("Invalid line: " + readLine);
    }

    static int readTuple(BufferedReader bufferedReader) throws IOException {
        int indexOf;
        String readLine = bufferedReader.readLine();
        int indexOf2 = readLine.indexOf(58);
        if (indexOf2 != -1) {
            int i = indexOf2 + 1;
            int i2 = 0;
            while (i2 < 3 && (indexOf = readLine.indexOf(44, i)) != -1) {
                tuple[i2] = readLine.substring(i, indexOf).trim();
                i = indexOf + 1;
                i2++;
            }
            tuple[i2] = readLine.substring(i).trim();
            return i2 + 1;
        }
        throw new GdxRuntimeException("Invalid line: " + readLine);
    }

    public static class AtlasRegion extends TextureRegion {
        public int degrees;
        public int index;
        public String name;
        public float offsetX;
        public float offsetY;
        public int originalHeight;
        public int originalWidth;
        public int packedHeight;
        public int packedWidth;
        public int[] pads;
        public boolean rotate;
        public int[] splits;

        public AtlasRegion(Texture texture, int i, int i2, int i3, int i4) {
            super(texture, i, i2, i3, i4);
            this.originalWidth = i3;
            this.originalHeight = i4;
            this.packedWidth = i3;
            this.packedHeight = i4;
        }

        public AtlasRegion(AtlasRegion atlasRegion) {
            setRegion(atlasRegion);
            this.index = atlasRegion.index;
            this.name = atlasRegion.name;
            this.offsetX = atlasRegion.offsetX;
            this.offsetY = atlasRegion.offsetY;
            this.packedWidth = atlasRegion.packedWidth;
            this.packedHeight = atlasRegion.packedHeight;
            this.originalWidth = atlasRegion.originalWidth;
            this.originalHeight = atlasRegion.originalHeight;
            this.rotate = atlasRegion.rotate;
            this.degrees = atlasRegion.degrees;
            this.splits = atlasRegion.splits;
        }

        public AtlasRegion(TextureRegion textureRegion) {
            setRegion(textureRegion);
            this.packedWidth = textureRegion.getRegionWidth();
            this.packedHeight = textureRegion.getRegionHeight();
            this.originalWidth = this.packedWidth;
            this.originalHeight = this.packedHeight;
        }

        @Override // com.badlogic.gdx.graphics.g2d.TextureRegion
        public void flip(boolean z, boolean z2) {
            super.flip(z, z2);
            if (z) {
                this.offsetX = (((float) this.originalWidth) - this.offsetX) - getRotatedPackedWidth();
            }
            if (z2) {
                this.offsetY = (((float) this.originalHeight) - this.offsetY) - getRotatedPackedHeight();
            }
        }

        public float getRotatedPackedWidth() {
            return (float) (this.rotate ? this.packedHeight : this.packedWidth);
        }

        public float getRotatedPackedHeight() {
            return (float) (this.rotate ? this.packedWidth : this.packedHeight);
        }

        public String toString() {
            return this.name;
        }
    }

    public static class AtlasSprite extends Sprite {
        float originalOffsetX;
        float originalOffsetY;
        final AtlasRegion region;

        public AtlasSprite(AtlasRegion atlasRegion) {
            this.region = new AtlasRegion(atlasRegion);
            this.originalOffsetX = atlasRegion.offsetX;
            this.originalOffsetY = atlasRegion.offsetY;
            setRegion(atlasRegion);
            setOrigin(((float) atlasRegion.originalWidth) / 2.0f, ((float) atlasRegion.originalHeight) / 2.0f);
            int regionWidth = atlasRegion.getRegionWidth();
            int regionHeight = atlasRegion.getRegionHeight();
            if (atlasRegion.rotate) {
                super.rotate90(true);
                super.setBounds(atlasRegion.offsetX, atlasRegion.offsetY, (float) regionHeight, (float) regionWidth);
            } else {
                super.setBounds(atlasRegion.offsetX, atlasRegion.offsetY, (float) regionWidth, (float) regionHeight);
            }
            setColor(1.0f, 1.0f, 1.0f, 1.0f);
        }

        public AtlasSprite(AtlasSprite atlasSprite) {
            this.region = atlasSprite.region;
            this.originalOffsetX = atlasSprite.originalOffsetX;
            this.originalOffsetY = atlasSprite.originalOffsetY;
            set(atlasSprite);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public void setPosition(float f, float f2) {
            super.setPosition(f + this.region.offsetX, f2 + this.region.offsetY);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public void setX(float f) {
            super.setX(f + this.region.offsetX);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public void setY(float f) {
            super.setY(f + this.region.offsetY);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public void setBounds(float f, float f2, float f3, float f4) {
            float f5 = f3 / ((float) this.region.originalWidth);
            float f6 = f4 / ((float) this.region.originalHeight);
            AtlasRegion atlasRegion = this.region;
            atlasRegion.offsetX = this.originalOffsetX * f5;
            atlasRegion.offsetY = this.originalOffsetY * f6;
            super.setBounds(f + this.region.offsetX, f2 + this.region.offsetY, ((float) (atlasRegion.rotate ? this.region.packedHeight : this.region.packedWidth)) * f5, ((float) (this.region.rotate ? this.region.packedWidth : this.region.packedHeight)) * f6);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public void setSize(float f, float f2) {
            setBounds(getX(), getY(), f, f2);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public void setOrigin(float f, float f2) {
            super.setOrigin(f - this.region.offsetX, f2 - this.region.offsetY);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public void setOriginCenter() {
            super.setOrigin((this.width / 2.0f) - this.region.offsetX, (this.height / 2.0f) - this.region.offsetY);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite, com.badlogic.gdx.graphics.g2d.TextureRegion
        public void flip(boolean z, boolean z2) {
            if (this.region.rotate) {
                super.flip(z2, z);
            } else {
                super.flip(z, z2);
            }
            float originX = getOriginX();
            float originY = getOriginY();
            float f = this.region.offsetX;
            float f2 = this.region.offsetY;
            float widthRatio = getWidthRatio();
            float heightRatio = getHeightRatio();
            AtlasRegion atlasRegion = this.region;
            atlasRegion.offsetX = this.originalOffsetX;
            atlasRegion.offsetY = this.originalOffsetY;
            atlasRegion.flip(z, z2);
            this.originalOffsetX = this.region.offsetX;
            this.originalOffsetY = this.region.offsetY;
            this.region.offsetX *= widthRatio;
            this.region.offsetY *= heightRatio;
            translate(this.region.offsetX - f, this.region.offsetY - f2);
            setOrigin(originX, originY);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public void rotate90(boolean z) {
            super.rotate90(z);
            float originX = getOriginX();
            float originY = getOriginY();
            float f = this.region.offsetX;
            float f2 = this.region.offsetY;
            float widthRatio = getWidthRatio();
            float heightRatio = getHeightRatio();
            if (z) {
                AtlasRegion atlasRegion = this.region;
                atlasRegion.offsetX = f2;
                atlasRegion.offsetY = ((((float) atlasRegion.originalHeight) * heightRatio) - f) - (((float) this.region.packedWidth) * widthRatio);
            } else {
                AtlasRegion atlasRegion2 = this.region;
                atlasRegion2.offsetX = ((((float) atlasRegion2.originalWidth) * widthRatio) - f2) - (((float) this.region.packedHeight) * heightRatio);
                this.region.offsetY = f;
            }
            translate(this.region.offsetX - f, this.region.offsetY - f2);
            setOrigin(originX, originY);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public float getX() {
            return super.getX() - this.region.offsetX;
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public float getY() {
            return super.getY() - this.region.offsetY;
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public float getOriginX() {
            return super.getOriginX() + this.region.offsetX;
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public float getOriginY() {
            return super.getOriginY() + this.region.offsetY;
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public float getWidth() {
            return (super.getWidth() / this.region.getRotatedPackedWidth()) * ((float) this.region.originalWidth);
        }

        @Override // com.badlogic.gdx.graphics.g2d.Sprite
        public float getHeight() {
            return (super.getHeight() / this.region.getRotatedPackedHeight()) * ((float) this.region.originalHeight);
        }

        public float getWidthRatio() {
            return super.getWidth() / this.region.getRotatedPackedWidth();
        }

        public float getHeightRatio() {
            return super.getHeight() / this.region.getRotatedPackedHeight();
        }

        public AtlasRegion getAtlasRegion() {
            return this.region;
        }

        public String toString() {
            return this.region.toString();
        }
    }
}
