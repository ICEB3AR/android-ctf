package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class GLOnlyTextureData implements TextureData {
    int format;
    int height = 0;
    int internalFormat;
    boolean isPrepared = false;
    int mipLevel = 0;
    int type;
    int width = 0;

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean isManaged() {
        return false;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean useMipMaps() {
        return false;
    }

    public GLOnlyTextureData(int i, int i2, int i3, int i4, int i5, int i6) {
        this.width = i;
        this.height = i2;
        this.mipLevel = i3;
        this.internalFormat = i4;
        this.format = i5;
        this.type = i6;
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
        if (!this.isPrepared) {
            this.isPrepared = true;
            return;
        }
        throw new GdxRuntimeException("Already prepared");
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public void consumeCustomData(int i) {
        Gdx.gl.glTexImage2D(i, this.mipLevel, this.internalFormat, this.width, this.height, 0, this.format, this.type, null);
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
        return Pixmap.Format.RGBA8888;
    }
}
