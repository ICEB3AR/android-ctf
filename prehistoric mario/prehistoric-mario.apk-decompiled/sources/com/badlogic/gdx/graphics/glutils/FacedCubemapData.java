package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.CubemapData;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class FacedCubemapData implements CubemapData {
    protected final TextureData[] data;

    @Override // com.badlogic.gdx.graphics.CubemapData
    public boolean isPrepared() {
        return false;
    }

    /* JADX WARNING: Illegal instructions before constructor call */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public FacedCubemapData() {
        /*
            r8 = this;
            r0 = 0
            r7 = r0
            com.badlogic.gdx.graphics.TextureData r7 = (com.badlogic.gdx.graphics.TextureData) r7
            r1 = r8
            r2 = r7
            r3 = r7
            r4 = r7
            r5 = r7
            r6 = r7
            r1.<init>(r2, r3, r4, r5, r6, r7)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.glutils.FacedCubemapData.<init>():void");
    }

    public FacedCubemapData(FileHandle fileHandle, FileHandle fileHandle2, FileHandle fileHandle3, FileHandle fileHandle4, FileHandle fileHandle5, FileHandle fileHandle6) {
        this(TextureData.Factory.loadFromFile(fileHandle, false), TextureData.Factory.loadFromFile(fileHandle2, false), TextureData.Factory.loadFromFile(fileHandle3, false), TextureData.Factory.loadFromFile(fileHandle4, false), TextureData.Factory.loadFromFile(fileHandle5, false), TextureData.Factory.loadFromFile(fileHandle6, false));
    }

    public FacedCubemapData(FileHandle fileHandle, FileHandle fileHandle2, FileHandle fileHandle3, FileHandle fileHandle4, FileHandle fileHandle5, FileHandle fileHandle6, boolean z) {
        this(TextureData.Factory.loadFromFile(fileHandle, z), TextureData.Factory.loadFromFile(fileHandle2, z), TextureData.Factory.loadFromFile(fileHandle3, z), TextureData.Factory.loadFromFile(fileHandle4, z), TextureData.Factory.loadFromFile(fileHandle5, z), TextureData.Factory.loadFromFile(fileHandle6, z));
    }

    public FacedCubemapData(Pixmap pixmap, Pixmap pixmap2, Pixmap pixmap3, Pixmap pixmap4, Pixmap pixmap5, Pixmap pixmap6) {
        this(pixmap, pixmap2, pixmap3, pixmap4, pixmap5, pixmap6, false);
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public FacedCubemapData(Pixmap pixmap, Pixmap pixmap2, Pixmap pixmap3, Pixmap pixmap4, Pixmap pixmap5, Pixmap pixmap6, boolean z) {
        this(pixmap == null ? null : new PixmapTextureData(pixmap, null, z, false), pixmap2 == null ? null : new PixmapTextureData(pixmap2, null, z, false), pixmap3 == null ? null : new PixmapTextureData(pixmap3, null, z, false), pixmap4 == null ? null : new PixmapTextureData(pixmap4, null, z, false), pixmap5 == null ? null : new PixmapTextureData(pixmap5, null, z, false), pixmap6 == null ? null : new PixmapTextureData(pixmap6, null, z, false));
    }

    public FacedCubemapData(int i, int i2, int i3, Pixmap.Format format) {
        this(new PixmapTextureData(new Pixmap(i3, i2, format), null, false, true), new PixmapTextureData(new Pixmap(i3, i2, format), null, false, true), new PixmapTextureData(new Pixmap(i, i3, format), null, false, true), new PixmapTextureData(new Pixmap(i, i3, format), null, false, true), new PixmapTextureData(new Pixmap(i, i2, format), null, false, true), new PixmapTextureData(new Pixmap(i, i2, format), null, false, true));
    }

    public FacedCubemapData(TextureData textureData, TextureData textureData2, TextureData textureData3, TextureData textureData4, TextureData textureData5, TextureData textureData6) {
        this.data = new TextureData[6];
        TextureData[] textureDataArr = this.data;
        textureDataArr[0] = textureData;
        textureDataArr[1] = textureData2;
        textureDataArr[2] = textureData3;
        textureDataArr[3] = textureData4;
        textureDataArr[4] = textureData5;
        textureDataArr[5] = textureData6;
    }

    @Override // com.badlogic.gdx.graphics.CubemapData
    public boolean isManaged() {
        for (TextureData textureData : this.data) {
            if (!textureData.isManaged()) {
                return false;
            }
        }
        return true;
    }

    public void load(Cubemap.CubemapSide cubemapSide, FileHandle fileHandle) {
        this.data[cubemapSide.index] = TextureData.Factory.loadFromFile(fileHandle, false);
    }

    public void load(Cubemap.CubemapSide cubemapSide, Pixmap pixmap) {
        TextureData[] textureDataArr = this.data;
        int i = cubemapSide.index;
        PixmapTextureData pixmapTextureData = null;
        if (pixmap != null) {
            pixmapTextureData = new PixmapTextureData(pixmap, null, false, false);
        }
        textureDataArr[i] = pixmapTextureData;
    }

    public boolean isComplete() {
        int i = 0;
        while (true) {
            TextureData[] textureDataArr = this.data;
            if (i >= textureDataArr.length) {
                return true;
            }
            if (textureDataArr[i] == null) {
                return false;
            }
            i++;
        }
    }

    public TextureData getTextureData(Cubemap.CubemapSide cubemapSide) {
        return this.data[cubemapSide.index];
    }

    @Override // com.badlogic.gdx.graphics.CubemapData
    public int getWidth() {
        int i;
        int width;
        int width2;
        int width3;
        if (this.data[Cubemap.CubemapSide.PositiveZ.index] == null || (i = this.data[Cubemap.CubemapSide.PositiveZ.index].getWidth()) <= 0) {
            i = 0;
        }
        if (this.data[Cubemap.CubemapSide.NegativeZ.index] != null && (width3 = this.data[Cubemap.CubemapSide.NegativeZ.index].getWidth()) > i) {
            i = width3;
        }
        if (this.data[Cubemap.CubemapSide.PositiveY.index] != null && (width2 = this.data[Cubemap.CubemapSide.PositiveY.index].getWidth()) > i) {
            i = width2;
        }
        return (this.data[Cubemap.CubemapSide.NegativeY.index] == null || (width = this.data[Cubemap.CubemapSide.NegativeY.index].getWidth()) <= i) ? i : width;
    }

    @Override // com.badlogic.gdx.graphics.CubemapData
    public int getHeight() {
        int i;
        int height;
        int height2;
        int height3;
        if (this.data[Cubemap.CubemapSide.PositiveZ.index] == null || (i = this.data[Cubemap.CubemapSide.PositiveZ.index].getHeight()) <= 0) {
            i = 0;
        }
        if (this.data[Cubemap.CubemapSide.NegativeZ.index] != null && (height3 = this.data[Cubemap.CubemapSide.NegativeZ.index].getHeight()) > i) {
            i = height3;
        }
        if (this.data[Cubemap.CubemapSide.PositiveX.index] != null && (height2 = this.data[Cubemap.CubemapSide.PositiveX.index].getHeight()) > i) {
            i = height2;
        }
        return (this.data[Cubemap.CubemapSide.NegativeX.index] == null || (height = this.data[Cubemap.CubemapSide.NegativeX.index].getHeight()) <= i) ? i : height;
    }

    @Override // com.badlogic.gdx.graphics.CubemapData
    public void prepare() {
        if (isComplete()) {
            int i = 0;
            while (true) {
                TextureData[] textureDataArr = this.data;
                if (i < textureDataArr.length) {
                    if (!textureDataArr[i].isPrepared()) {
                        this.data[i].prepare();
                    }
                    i++;
                } else {
                    return;
                }
            }
        } else {
            throw new GdxRuntimeException("You need to complete your cubemap data before using it");
        }
    }

    @Override // com.badlogic.gdx.graphics.CubemapData
    public void consumeCubemapData() {
        int i = 0;
        while (true) {
            TextureData[] textureDataArr = this.data;
            if (i < textureDataArr.length) {
                if (textureDataArr[i].getType() == TextureData.TextureDataType.Custom) {
                    this.data[i].consumeCustomData(GL20.GL_TEXTURE_CUBE_MAP_POSITIVE_X + i);
                } else {
                    Pixmap consumePixmap = this.data[i].consumePixmap();
                    boolean disposePixmap = this.data[i].disposePixmap();
                    if (this.data[i].getFormat() != consumePixmap.getFormat()) {
                        Pixmap pixmap = new Pixmap(consumePixmap.getWidth(), consumePixmap.getHeight(), this.data[i].getFormat());
                        pixmap.setBlending(Pixmap.Blending.None);
                        pixmap.drawPixmap(consumePixmap, 0, 0, 0, 0, consumePixmap.getWidth(), consumePixmap.getHeight());
                        if (this.data[i].disposePixmap()) {
                            consumePixmap.dispose();
                        }
                        consumePixmap = pixmap;
                        disposePixmap = true;
                    }
                    Gdx.gl.glPixelStorei(GL20.GL_UNPACK_ALIGNMENT, 1);
                    Gdx.gl.glTexImage2D(i + GL20.GL_TEXTURE_CUBE_MAP_POSITIVE_X, 0, consumePixmap.getGLInternalFormat(), consumePixmap.getWidth(), consumePixmap.getHeight(), 0, consumePixmap.getGLFormat(), consumePixmap.getGLType(), consumePixmap.getPixels());
                    if (disposePixmap) {
                        consumePixmap.dispose();
                    }
                }
                i++;
            } else {
                return;
            }
        }
    }
}
