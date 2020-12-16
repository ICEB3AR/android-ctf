package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.graphics.glutils.ETC1;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class ETC1TextureData implements TextureData {
    ETC1.ETC1Data data;
    FileHandle file;
    int height;
    boolean isPrepared;
    boolean useMipMaps;
    int width;

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean isManaged() {
        return true;
    }

    public ETC1TextureData(FileHandle fileHandle) {
        this(fileHandle, false);
    }

    public ETC1TextureData(FileHandle fileHandle, boolean z) {
        this.width = 0;
        this.height = 0;
        this.isPrepared = false;
        this.file = fileHandle;
        this.useMipMaps = z;
    }

    public ETC1TextureData(ETC1.ETC1Data eTC1Data, boolean z) {
        this.width = 0;
        this.height = 0;
        this.isPrepared = false;
        this.data = eTC1Data;
        this.useMipMaps = z;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public TextureData.TextureDataType getType() {
        return TextureData.TextureDataType.Custom;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean isPrepared() {
        return this.isPrepared;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public void prepare() {
        if (this.isPrepared) {
            throw new GdxRuntimeException("Already prepared");
        } else if (this.file == null && this.data == null) {
            throw new GdxRuntimeException("Can only load once from ETC1Data");
        } else {
            FileHandle fileHandle = this.file;
            if (fileHandle != null) {
                this.data = new ETC1.ETC1Data(fileHandle);
            }
            this.width = this.data.width;
            this.height = this.data.height;
            this.isPrepared = true;
        }
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public void consumeCustomData(int i) {
        if (this.isPrepared) {
            if (!Gdx.graphics.supportsExtension("GL_OES_compressed_ETC1_RGB8_texture")) {
                Pixmap decodeImage = ETC1.decodeImage(this.data, Pixmap.Format.RGB565);
                Gdx.gl.glTexImage2D(i, 0, decodeImage.getGLInternalFormat(), decodeImage.getWidth(), decodeImage.getHeight(), 0, decodeImage.getGLFormat(), decodeImage.getGLType(), decodeImage.getPixels());
                if (this.useMipMaps) {
                    MipMapGenerator.generateMipMap(i, decodeImage, decodeImage.getWidth(), decodeImage.getHeight());
                }
                decodeImage.dispose();
                this.useMipMaps = false;
            } else {
                Gdx.gl.glCompressedTexImage2D(i, 0, ETC1.ETC1_RGB8_OES, this.width, this.height, 0, this.data.compressedData.capacity() - this.data.dataOffset, this.data.compressedData);
                if (useMipMaps()) {
                    Gdx.gl20.glGenerateMipmap(GL20.GL_TEXTURE_2D);
                }
            }
            this.data.dispose();
            this.data = null;
            this.isPrepared = false;
            return;
        }
        throw new GdxRuntimeException("Call prepare() before calling consumeCompressedData()");
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public Pixmap consumePixmap() {
        throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap");
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean disposePixmap() {
        throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap");
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
        return Pixmap.Format.RGB565;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean useMipMaps() {
        return this.useMipMaps;
    }
}
