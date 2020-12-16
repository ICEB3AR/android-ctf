package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.glutils.PixmapTextureData;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.OrderedMap;
import java.io.PrintStream;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PixmapPacker implements Disposable {
    static Pattern indexPattern = Pattern.compile("(.+)_(\\d+)$");
    int alphaThreshold;
    private Color c;
    boolean disposed;
    boolean duplicateBorder;
    PackStrategy packStrategy;
    boolean packToTexture;
    int padding;
    Pixmap.Format pageFormat;
    int pageHeight;
    int pageWidth;
    final Array<Page> pages;
    boolean stripWhitespaceX;
    boolean stripWhitespaceY;
    Color transparentColor;

    public interface PackStrategy {
        Page pack(PixmapPacker pixmapPacker, String str, Rectangle rectangle);

        void sort(Array<Pixmap> array);
    }

    public PixmapPacker(int i, int i2, Pixmap.Format format, int i3, boolean z) {
        this(i, i2, format, i3, z, false, false, new GuillotineStrategy());
    }

    public PixmapPacker(int i, int i2, Pixmap.Format format, int i3, boolean z, PackStrategy packStrategy2) {
        this(i, i2, format, i3, z, false, false, packStrategy2);
    }

    public PixmapPacker(int i, int i2, Pixmap.Format format, int i3, boolean z, boolean z2, boolean z3, PackStrategy packStrategy2) {
        this.transparentColor = new Color(0.0f, 0.0f, 0.0f, 0.0f);
        this.pages = new Array<>();
        this.c = new Color();
        this.pageWidth = i;
        this.pageHeight = i2;
        this.pageFormat = format;
        this.padding = i3;
        this.duplicateBorder = z;
        this.stripWhitespaceX = z2;
        this.stripWhitespaceY = z3;
        this.packStrategy = packStrategy2;
    }

    public void sort(Array<Pixmap> array) {
        this.packStrategy.sort(array);
    }

    public synchronized Rectangle pack(Pixmap pixmap) {
        return pack(null, pixmap);
    }

    public synchronized Rectangle pack(String str, Pixmap pixmap) {
        PixmapPackerRectangle pixmapPackerRectangle;
        int i;
        int i2;
        String str2 = str;
        Pixmap pixmap2 = pixmap;
        synchronized (this) {
            Pixmap pixmap3 = null;
            if (this.disposed) {
                return null;
            }
            if (str2 == null || getRect(str) == null) {
                if (str2 != null && str2.endsWith(".9")) {
                    pixmapPackerRectangle = new PixmapPackerRectangle(0, 0, pixmap.getWidth() - 2, pixmap.getHeight() - 2);
                    Pixmap pixmap4 = new Pixmap(pixmap.getWidth() - 2, pixmap.getHeight() - 2, pixmap.getFormat());
                    pixmap4.setBlending(Pixmap.Blending.None);
                    pixmapPackerRectangle.splits = getSplits(pixmap2);
                    pixmapPackerRectangle.pads = getPads(pixmap2, pixmapPackerRectangle.splits);
                    pixmap4.drawPixmap(pixmap, 0, 0, 1, 1, pixmap.getWidth() - 1, pixmap.getHeight() - 1);
                    str2 = str2.split("\\.")[0];
                    pixmap2 = pixmap4;
                    pixmap3 = pixmap2;
                } else if (this.stripWhitespaceX || this.stripWhitespaceY) {
                    int width = pixmap.getWidth();
                    int height = pixmap.getHeight();
                    int height2 = pixmap.getHeight();
                    if (this.stripWhitespaceY) {
                        int i3 = 0;
                        loop0:
                        for (int i4 = 0; i4 < pixmap.getHeight(); i4++) {
                            for (int i5 = 0; i5 < pixmap.getWidth(); i5++) {
                                if ((pixmap2.getPixel(i5, i4) & 255) > this.alphaThreshold) {
                                    break loop0;
                                }
                            }
                            i3++;
                        }
                        int height3 = pixmap.getHeight();
                        loop2:
                        while (true) {
                            height3--;
                            if (height3 < i3) {
                                break;
                            }
                            for (int i6 = 0; i6 < pixmap.getWidth(); i6++) {
                                if ((pixmap2.getPixel(i6, height3) & 255) > this.alphaThreshold) {
                                    break loop2;
                                }
                            }
                            height2--;
                        }
                        i = i3;
                    } else {
                        i = 0;
                    }
                    int width2 = pixmap.getWidth();
                    if (this.stripWhitespaceX) {
                        int i7 = 0;
                        loop4:
                        for (int i8 = 0; i8 < pixmap.getWidth(); i8++) {
                            for (int i9 = i; i9 < height2; i9++) {
                                if ((pixmap2.getPixel(i8, i9) & 255) > this.alphaThreshold) {
                                    break loop4;
                                }
                            }
                            i7++;
                        }
                        int width3 = pixmap.getWidth();
                        loop6:
                        while (true) {
                            width3--;
                            if (width3 < i7) {
                                break;
                            }
                            for (int i10 = i; i10 < height2; i10++) {
                                if ((pixmap2.getPixel(width3, i10) & 255) > this.alphaThreshold) {
                                    break loop6;
                                }
                            }
                            width2--;
                        }
                        i2 = i7;
                    } else {
                        i2 = 0;
                    }
                    int i11 = width2 - i2;
                    int i12 = height2 - i;
                    Pixmap pixmap5 = new Pixmap(i11, i12, pixmap.getFormat());
                    pixmap5.setBlending(Pixmap.Blending.None);
                    pixmap5.drawPixmap(pixmap, 0, 0, i2, i, i11, i12);
                    pixmap3 = pixmap5;
                    pixmapPackerRectangle = new PixmapPackerRectangle(0, 0, i11, i12, i2, i, width, height);
                    pixmap2 = pixmap3;
                } else {
                    pixmapPackerRectangle = new PixmapPackerRectangle(0, 0, pixmap.getWidth(), pixmap.getHeight());
                }
                if (pixmapPackerRectangle.getWidth() <= ((float) this.pageWidth) && pixmapPackerRectangle.getHeight() <= ((float) this.pageHeight)) {
                    Page pack = this.packStrategy.pack(this, str2, pixmapPackerRectangle);
                    if (str2 != null) {
                        pack.rects.put(str2, pixmapPackerRectangle);
                        pack.addedRects.add(str2);
                    }
                    int i13 = (int) pixmapPackerRectangle.x;
                    int i14 = (int) pixmapPackerRectangle.y;
                    int i15 = (int) pixmapPackerRectangle.width;
                    int i16 = (int) pixmapPackerRectangle.height;
                    if (!this.packToTexture || this.duplicateBorder || pack.texture == null || pack.dirty) {
                        pack.dirty = true;
                    } else {
                        pack.texture.bind();
                        Gdx.gl.glTexSubImage2D(pack.texture.glTarget, 0, i13, i14, i15, i16, pixmap2.getGLFormat(), pixmap2.getGLType(), pixmap2.getPixels());
                    }
                    pack.image.drawPixmap(pixmap2, i13, i14);
                    if (this.duplicateBorder) {
                        int width4 = pixmap2.getWidth();
                        int height4 = pixmap2.getHeight();
                        int i17 = i13 - 1;
                        int i18 = i14 - 1;
                        pack.image.drawPixmap(pixmap2, 0, 0, 1, 1, i17, i18, 1, 1);
                        int i19 = width4 - 1;
                        int i20 = i13 + i15;
                        pack.image.drawPixmap(pixmap2, i19, 0, 1, 1, i20, i18, 1, 1);
                        int i21 = height4 - 1;
                        int i22 = i14 + i16;
                        pack.image.drawPixmap(pixmap2, 0, i21, 1, 1, i17, i22, 1, 1);
                        pack.image.drawPixmap(pixmap2, i19, i21, 1, 1, i20, i22, 1, 1);
                        pack.image.drawPixmap(pixmap2, 0, 0, width4, 1, i13, i18, i15, 1);
                        pack.image.drawPixmap(pixmap2, 0, i21, width4, 1, i13, i22, i15, 1);
                        pack.image.drawPixmap(pixmap2, 0, 0, 1, height4, i17, i14, 1, i16);
                        pack.image.drawPixmap(pixmap2, i19, 0, 1, height4, i20, i14, 1, i16);
                    }
                    if (pixmap3 != null) {
                        pixmap3.dispose();
                    }
                    return pixmapPackerRectangle;
                } else if (str2 == null) {
                    throw new GdxRuntimeException("Page size too small for pixmap.");
                } else {
                    throw new GdxRuntimeException("Page size too small for pixmap: " + str2);
                }
            } else {
                throw new GdxRuntimeException("Pixmap has already been packed with name: " + str2);
            }
        }
    }

    public Array<Page> getPages() {
        return this.pages;
    }

    public synchronized Rectangle getRect(String str) {
        Iterator<Page> it = this.pages.iterator();
        while (it.hasNext()) {
            PixmapPackerRectangle pixmapPackerRectangle = it.next().rects.get(str);
            if (pixmapPackerRectangle != null) {
                return pixmapPackerRectangle;
            }
        }
        return null;
    }

    public synchronized Page getPage(String str) {
        Iterator<Page> it = this.pages.iterator();
        while (it.hasNext()) {
            Page next = it.next();
            if (next.rects.get(str) != null) {
                return next;
            }
        }
        return null;
    }

    public synchronized int getPageIndex(String str) {
        for (int i = 0; i < this.pages.size; i++) {
            if (this.pages.get(i).rects.get(str) != null) {
                return i;
            }
        }
        return -1;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public synchronized void dispose() {
        Iterator<Page> it = this.pages.iterator();
        while (it.hasNext()) {
            Page next = it.next();
            if (next.texture == null) {
                next.image.dispose();
            }
        }
        this.disposed = true;
    }

    public synchronized TextureAtlas generateTextureAtlas(Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, boolean z) {
        TextureAtlas textureAtlas;
        textureAtlas = new TextureAtlas();
        updateTextureAtlas(textureAtlas, textureFilter, textureFilter2, z);
        return textureAtlas;
    }

    public synchronized void updateTextureAtlas(TextureAtlas textureAtlas, Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, boolean z) {
        updateTextureAtlas(textureAtlas, textureFilter, textureFilter2, z, true);
    }

    public synchronized void updateTextureAtlas(TextureAtlas textureAtlas, Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, boolean z, boolean z2) {
        updatePageTextures(textureFilter, textureFilter2, z);
        Iterator<Page> it = this.pages.iterator();
        while (it.hasNext()) {
            Page next = it.next();
            if (next.addedRects.size > 0) {
                Iterator<String> it2 = next.addedRects.iterator();
                while (it2.hasNext()) {
                    String next2 = it2.next();
                    PixmapPackerRectangle pixmapPackerRectangle = next.rects.get(next2);
                    TextureAtlas.AtlasRegion atlasRegion = new TextureAtlas.AtlasRegion(next.texture, (int) pixmapPackerRectangle.x, (int) pixmapPackerRectangle.y, (int) pixmapPackerRectangle.width, (int) pixmapPackerRectangle.height);
                    if (pixmapPackerRectangle.splits != null) {
                        atlasRegion.splits = pixmapPackerRectangle.splits;
                        atlasRegion.pads = pixmapPackerRectangle.pads;
                    }
                    int i = -1;
                    if (z2) {
                        Matcher matcher = indexPattern.matcher(next2);
                        if (matcher.matches()) {
                            next2 = matcher.group(1);
                            i = Integer.parseInt(matcher.group(2));
                        }
                    }
                    atlasRegion.name = next2;
                    atlasRegion.index = i;
                    atlasRegion.offsetX = (float) pixmapPackerRectangle.offsetX;
                    atlasRegion.offsetY = (float) ((int) ((((float) pixmapPackerRectangle.originalHeight) - pixmapPackerRectangle.height) - ((float) pixmapPackerRectangle.offsetY)));
                    atlasRegion.originalWidth = pixmapPackerRectangle.originalWidth;
                    atlasRegion.originalHeight = pixmapPackerRectangle.originalHeight;
                    textureAtlas.getRegions().add(atlasRegion);
                }
                next.addedRects.clear();
                textureAtlas.getTextures().add(next.texture);
            }
        }
    }

    public synchronized void updateTextureRegions(Array<TextureRegion> array, Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, boolean z) {
        updatePageTextures(textureFilter, textureFilter2, z);
        while (array.size < this.pages.size) {
            array.add(new TextureRegion(this.pages.get(array.size).texture));
        }
    }

    public synchronized void updatePageTextures(Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, boolean z) {
        Iterator<Page> it = this.pages.iterator();
        while (it.hasNext()) {
            it.next().updateTexture(textureFilter, textureFilter2, z);
        }
    }

    public int getPageWidth() {
        return this.pageWidth;
    }

    public void setPageWidth(int i) {
        this.pageWidth = i;
    }

    public int getPageHeight() {
        return this.pageHeight;
    }

    public void setPageHeight(int i) {
        this.pageHeight = i;
    }

    public Pixmap.Format getPageFormat() {
        return this.pageFormat;
    }

    public void setPageFormat(Pixmap.Format format) {
        this.pageFormat = format;
    }

    public int getPadding() {
        return this.padding;
    }

    public void setPadding(int i) {
        this.padding = i;
    }

    public boolean getDuplicateBorder() {
        return this.duplicateBorder;
    }

    public void setDuplicateBorder(boolean z) {
        this.duplicateBorder = z;
    }

    public boolean getPackToTexture() {
        return this.packToTexture;
    }

    public void setPackToTexture(boolean z) {
        this.packToTexture = z;
    }

    public static class Page {
        final Array<String> addedRects = new Array<>();
        boolean dirty;
        Pixmap image;
        OrderedMap<String, PixmapPackerRectangle> rects = new OrderedMap<>();
        Texture texture;

        public Page(PixmapPacker pixmapPacker) {
            this.image = new Pixmap(pixmapPacker.pageWidth, pixmapPacker.pageHeight, pixmapPacker.pageFormat);
            this.image.setBlending(Pixmap.Blending.None);
            this.image.setColor(pixmapPacker.getTransparentColor());
            this.image.fill();
        }

        public Pixmap getPixmap() {
            return this.image;
        }

        public OrderedMap<String, PixmapPackerRectangle> getRects() {
            return this.rects;
        }

        public Texture getTexture() {
            return this.texture;
        }

        public boolean updateTexture(Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, boolean z) {
            Texture texture2 = this.texture;
            if (texture2 == null) {
                Pixmap pixmap = this.image;
                this.texture = new Texture(new PixmapTextureData(pixmap, pixmap.getFormat(), z, false, true)) {
                    /* class com.badlogic.gdx.graphics.g2d.PixmapPacker.Page.AnonymousClass1 */

                    @Override // com.badlogic.gdx.graphics.GLTexture, com.badlogic.gdx.utils.Disposable, com.badlogic.gdx.graphics.Texture
                    public void dispose() {
                        super.dispose();
                        Page.this.image.dispose();
                    }
                };
                this.texture.setFilter(textureFilter, textureFilter2);
            } else if (!this.dirty) {
                return false;
            } else {
                texture2.load(texture2.getTextureData());
            }
            this.dirty = false;
            return true;
        }
    }

    public static class GuillotineStrategy implements PackStrategy {
        Comparator<Pixmap> comparator;

        @Override // com.badlogic.gdx.graphics.g2d.PixmapPacker.PackStrategy
        public void sort(Array<Pixmap> array) {
            if (this.comparator == null) {
                this.comparator = new Comparator<Pixmap>() {
                    /* class com.badlogic.gdx.graphics.g2d.PixmapPacker.GuillotineStrategy.AnonymousClass1 */

                    public int compare(Pixmap pixmap, Pixmap pixmap2) {
                        return Math.max(pixmap.getWidth(), pixmap.getHeight()) - Math.max(pixmap2.getWidth(), pixmap2.getHeight());
                    }
                };
            }
            array.sort(this.comparator);
        }

        @Override // com.badlogic.gdx.graphics.g2d.PixmapPacker.PackStrategy
        public Page pack(PixmapPacker pixmapPacker, String str, Rectangle rectangle) {
            GuillotinePage guillotinePage;
            if (pixmapPacker.pages.size == 0) {
                guillotinePage = new GuillotinePage(pixmapPacker);
                pixmapPacker.pages.add(guillotinePage);
            } else {
                guillotinePage = (GuillotinePage) pixmapPacker.pages.peek();
            }
            float f = (float) pixmapPacker.padding;
            rectangle.width += f;
            rectangle.height += f;
            Node insert = insert(guillotinePage.root, rectangle);
            if (insert == null) {
                guillotinePage = new GuillotinePage(pixmapPacker);
                pixmapPacker.pages.add(guillotinePage);
                insert = insert(guillotinePage.root, rectangle);
            }
            insert.full = true;
            rectangle.set(insert.rect.x, insert.rect.y, insert.rect.width - f, insert.rect.height - f);
            return guillotinePage;
        }

        private Node insert(Node node, Rectangle rectangle) {
            if (!node.full && node.leftChild != null && node.rightChild != null) {
                Node insert = insert(node.leftChild, rectangle);
                return insert == null ? insert(node.rightChild, rectangle) : insert;
            } else if (node.full) {
                return null;
            } else {
                if (node.rect.width == rectangle.width && node.rect.height == rectangle.height) {
                    return node;
                }
                if (node.rect.width < rectangle.width || node.rect.height < rectangle.height) {
                    return null;
                }
                node.leftChild = new Node();
                node.rightChild = new Node();
                if (((int) node.rect.width) - ((int) rectangle.width) > ((int) node.rect.height) - ((int) rectangle.height)) {
                    node.leftChild.rect.x = node.rect.x;
                    node.leftChild.rect.y = node.rect.y;
                    node.leftChild.rect.width = rectangle.width;
                    node.leftChild.rect.height = node.rect.height;
                    node.rightChild.rect.x = node.rect.x + rectangle.width;
                    node.rightChild.rect.y = node.rect.y;
                    node.rightChild.rect.width = node.rect.width - rectangle.width;
                    node.rightChild.rect.height = node.rect.height;
                } else {
                    node.leftChild.rect.x = node.rect.x;
                    node.leftChild.rect.y = node.rect.y;
                    node.leftChild.rect.width = node.rect.width;
                    node.leftChild.rect.height = rectangle.height;
                    node.rightChild.rect.x = node.rect.x;
                    node.rightChild.rect.y = node.rect.y + rectangle.height;
                    node.rightChild.rect.width = node.rect.width;
                    node.rightChild.rect.height = node.rect.height - rectangle.height;
                }
                return insert(node.leftChild, rectangle);
            }
        }

        /* access modifiers changed from: package-private */
        public static final class Node {
            public boolean full;
            public Node leftChild;
            public final Rectangle rect = new Rectangle();
            public Node rightChild;

            Node() {
            }
        }

        static class GuillotinePage extends Page {
            Node root = new Node();

            public GuillotinePage(PixmapPacker pixmapPacker) {
                super(pixmapPacker);
                this.root.rect.x = (float) pixmapPacker.padding;
                this.root.rect.y = (float) pixmapPacker.padding;
                this.root.rect.width = (float) (pixmapPacker.pageWidth - (pixmapPacker.padding * 2));
                this.root.rect.height = (float) (pixmapPacker.pageHeight - (pixmapPacker.padding * 2));
            }
        }
    }

    public static class SkylineStrategy implements PackStrategy {
        Comparator<Pixmap> comparator;

        @Override // com.badlogic.gdx.graphics.g2d.PixmapPacker.PackStrategy
        public void sort(Array<Pixmap> array) {
            if (this.comparator == null) {
                this.comparator = new Comparator<Pixmap>() {
                    /* class com.badlogic.gdx.graphics.g2d.PixmapPacker.SkylineStrategy.AnonymousClass1 */

                    public int compare(Pixmap pixmap, Pixmap pixmap2) {
                        return pixmap.getHeight() - pixmap2.getHeight();
                    }
                };
            }
            array.sort(this.comparator);
        }

        @Override // com.badlogic.gdx.graphics.g2d.PixmapPacker.PackStrategy
        public Page pack(PixmapPacker pixmapPacker, String str, Rectangle rectangle) {
            int i = pixmapPacker.padding;
            int i2 = i * 2;
            int i3 = pixmapPacker.pageWidth - i2;
            int i4 = pixmapPacker.pageHeight - i2;
            int i5 = ((int) rectangle.width) + i;
            int i6 = ((int) rectangle.height) + i;
            int i7 = pixmapPacker.pages.size;
            for (int i8 = 0; i8 < i7; i8++) {
                SkylinePage skylinePage = (SkylinePage) pixmapPacker.pages.get(i8);
                int i9 = skylinePage.rows.size - 1;
                SkylinePage.Row row = null;
                for (int i10 = 0; i10 < i9; i10++) {
                    SkylinePage.Row row2 = skylinePage.rows.get(i10);
                    if (row2.x + i5 < i3 && row2.y + i6 < i4 && i6 <= row2.height && (row == null || row2.height < row.height)) {
                        row = row2;
                    }
                }
                if (row == null) {
                    SkylinePage.Row peek = skylinePage.rows.peek();
                    if (peek.y + i6 >= i4) {
                        continue;
                    } else if (peek.x + i5 < i3) {
                        peek.height = Math.max(peek.height, i6);
                        row = peek;
                    } else if (peek.y + peek.height + i6 < i4) {
                        row = new SkylinePage.Row();
                        row.y = peek.y + peek.height;
                        row.height = i6;
                        skylinePage.rows.add(row);
                    }
                }
                if (row != null) {
                    rectangle.x = (float) row.x;
                    rectangle.y = (float) row.y;
                    row.x += i5;
                    return skylinePage;
                }
            }
            SkylinePage skylinePage2 = new SkylinePage(pixmapPacker);
            pixmapPacker.pages.add(skylinePage2);
            SkylinePage.Row row3 = new SkylinePage.Row();
            row3.x = i5 + i;
            row3.y = i;
            row3.height = i6;
            skylinePage2.rows.add(row3);
            float f = (float) i;
            rectangle.x = f;
            rectangle.y = f;
            return skylinePage2;
        }

        static class SkylinePage extends Page {
            Array<Row> rows = new Array<>();

            public SkylinePage(PixmapPacker pixmapPacker) {
                super(pixmapPacker);
            }

            static class Row {
                int height;
                int x;
                int y;

                Row() {
                }
            }
        }
    }

    public Color getTransparentColor() {
        return this.transparentColor;
    }

    public void setTransparentColor(Color color) {
        this.transparentColor.set(color);
    }

    private int[] getSplits(Pixmap pixmap) {
        int i;
        int i2;
        int splitPoint = getSplitPoint(pixmap, 1, 0, true, true);
        int splitPoint2 = getSplitPoint(pixmap, splitPoint, 0, false, true);
        int splitPoint3 = getSplitPoint(pixmap, 0, 1, true, false);
        int splitPoint4 = getSplitPoint(pixmap, 0, splitPoint3, false, false);
        getSplitPoint(pixmap, splitPoint2 + 1, 0, true, true);
        getSplitPoint(pixmap, 0, splitPoint4 + 1, true, false);
        if (splitPoint == 0 && splitPoint2 == 0 && splitPoint3 == 0 && splitPoint4 == 0) {
            return null;
        }
        if (splitPoint != 0) {
            splitPoint--;
            i = (pixmap.getWidth() - 2) - (splitPoint2 - 1);
        } else {
            i = pixmap.getWidth() - 2;
        }
        if (splitPoint3 != 0) {
            splitPoint3--;
            i2 = (pixmap.getHeight() - 2) - (splitPoint4 - 1);
        } else {
            i2 = pixmap.getHeight() - 2;
        }
        return new int[]{splitPoint, i, splitPoint3, i2};
    }

    private int[] getPads(Pixmap pixmap, int[] iArr) {
        int i;
        int height = pixmap.getHeight() - 1;
        int width = pixmap.getWidth() - 1;
        int splitPoint = getSplitPoint(pixmap, 1, height, true, true);
        int splitPoint2 = getSplitPoint(pixmap, width, 1, true, false);
        int splitPoint3 = splitPoint != 0 ? getSplitPoint(pixmap, splitPoint + 1, height, false, true) : 0;
        int splitPoint4 = splitPoint2 != 0 ? getSplitPoint(pixmap, width, splitPoint2 + 1, false, false) : 0;
        getSplitPoint(pixmap, splitPoint3 + 1, height, true, true);
        getSplitPoint(pixmap, width, splitPoint4 + 1, true, false);
        if (splitPoint == 0 && splitPoint3 == 0 && splitPoint2 == 0 && splitPoint4 == 0) {
            return null;
        }
        int i2 = -1;
        if (splitPoint == 0 && splitPoint3 == 0) {
            i = -1;
            splitPoint = -1;
        } else if (splitPoint > 0) {
            splitPoint--;
            i = (pixmap.getWidth() - 2) - (splitPoint3 - 1);
        } else {
            i = pixmap.getWidth() - 2;
        }
        if (splitPoint2 == 0 && splitPoint4 == 0) {
            splitPoint2 = -1;
        } else if (splitPoint2 > 0) {
            splitPoint2--;
            i2 = (pixmap.getHeight() - 2) - (splitPoint4 - 1);
        } else {
            i2 = pixmap.getHeight() - 2;
        }
        int[] iArr2 = {splitPoint, i, splitPoint2, i2};
        if (iArr == null || !Arrays.equals(iArr2, iArr)) {
            return iArr2;
        }
        return null;
    }

    private int getSplitPoint(Pixmap pixmap, int i, int i2, boolean z, boolean z2) {
        int i3;
        int[] iArr = new int[4];
        if (z2) {
            i3 = pixmap.getWidth();
        } else {
            i3 = pixmap.getHeight();
        }
        int i4 = z ? 255 : 0;
        for (int i5 = z2 ? i : i2; i5 != i3; i5++) {
            if (z2) {
                i = i5;
            } else {
                i2 = i5;
            }
            this.c.set(pixmap.getPixel(i, i2));
            iArr[0] = (int) (this.c.r * 255.0f);
            iArr[1] = (int) (this.c.g * 255.0f);
            iArr[2] = (int) (this.c.b * 255.0f);
            iArr[3] = (int) (this.c.a * 255.0f);
            if (iArr[3] == i4) {
                return i5;
            }
            if (!z && !(iArr[0] == 0 && iArr[1] == 0 && iArr[2] == 0 && iArr[3] == 255)) {
                PrintStream printStream = System.out;
                printStream.println(i + "  " + i2 + " " + iArr + " ");
            }
        }
        return 0;
    }

    public static class PixmapPackerRectangle extends Rectangle {
        int offsetX;
        int offsetY;
        int originalHeight;
        int originalWidth;
        int[] pads;
        int[] splits;

        PixmapPackerRectangle(int i, int i2, int i3, int i4) {
            super((float) i, (float) i2, (float) i3, (float) i4);
            this.offsetX = 0;
            this.offsetY = 0;
            this.originalWidth = i3;
            this.originalHeight = i4;
        }

        PixmapPackerRectangle(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
            super((float) i, (float) i2, (float) i3, (float) i4);
            this.offsetX = i5;
            this.offsetY = i6;
            this.originalWidth = i7;
            this.originalHeight = i8;
        }
    }
}
