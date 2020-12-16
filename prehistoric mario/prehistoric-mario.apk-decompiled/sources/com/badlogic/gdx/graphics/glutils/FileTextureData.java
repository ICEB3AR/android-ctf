package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.PixmapIO;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class FileTextureData implements TextureData {
    final FileHandle file;
    Pixmap.Format format;
    int height = 0;
    boolean isPrepared = false;
    Pixmap pixmap;
    boolean useMipMaps;
    int width = 0;

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean disposePixmap() {
        return true;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean isManaged() {
        return true;
    }

    public FileTextureData(FileHandle fileHandle, Pixmap pixmap2, Pixmap.Format format2, boolean z) {
        this.file = fileHandle;
        this.pixmap = pixmap2;
        this.format = format2;
        this.useMipMaps = z;
        Pixmap pixmap3 = this.pixmap;
        if (pixmap3 != null) {
            this.width = pixmap3.getWidth();
            this.height = this.pixmap.getHeight();
            if (format2 == null) {
                this.format = this.pixmap.getFormat();
            }
        }
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean isPrepared() {
        return this.isPrepared;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public void prepare() {
        if (!this.isPrepared) {
            if (this.pixmap == null) {
                if (this.file.extension().equals("cim")) {
                    this.pixmap = PixmapIO.readCIM(this.file);
                } else {
                    this.pixmap = new Pixmap(this.file);
                }
                this.width = this.pixmap.getWidth();
                this.height = this.pixmap.getHeight();
                if (this.format == null) {
                    this.format = this.pixmap.getFormat();
                }
            }
            this.isPrepared = true;
            return;
        }
        throw new GdxRuntimeException("Already prepared");
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public Pixmap consumePixmap() {
        if (this.isPrepared) {
            this.isPrepared = false;
            Pixmap pixmap2 = this.pixmap;
            this.pixmap = null;
            return pixmap2;
        }
        throw new GdxRuntimeException("Call prepare() before calling getPixmap()");
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public int getWidth() {
        return this.width;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public int getHeight() {
        return this.height;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public Pixmap.Format getFormat() {
        return this.format;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean useMipMaps() {
        return this.useMipMaps;
    }

    public FileHandle getFileHandle() {
        return this.file;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public TextureData.TextureDataType getType() {
        return TextureData.TextureDataType.Pixmap;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public void consumeCustomData(int i) {
        throw new GdxRuntimeException("This TextureData implementation does not upload data itself");
    }

    public String toString() {
        return this.file.toString();
    }
}
