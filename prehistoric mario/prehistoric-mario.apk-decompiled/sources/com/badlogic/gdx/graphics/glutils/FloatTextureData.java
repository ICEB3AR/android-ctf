package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.graphics.glutils.GLVersion;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.FloatBuffer;

public class FloatTextureData implements TextureData {
    FloatBuffer buffer;
    int format;
    int height = 0;
    int internalFormat;
    boolean isGpuOnly;
    boolean isPrepared = false;
    int type;
    int width = 0;

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean isManaged() {
        return true;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean useMipMaps() {
        return false;
    }

    public FloatTextureData(int i, int i2, int i3, int i4, int i5, boolean z) {
        this.width = i;
        this.height = i2;
        this.internalFormat = i3;
        this.format = i4;
        this.type = i5;
        this.isGpuOnly = z;
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
        int i;
        if (!this.isPrepared) {
            if (!this.isGpuOnly) {
                int i2 = 4;
                if (Gdx.graphics.getGLVersion().getType().equals(GLVersion.Type.OpenGL)) {
                    if (this.internalFormat != 34842) {
                    }
                    int i3 = this.internalFormat;
                    if (i3 == 34843 || i3 == 34837) {
                        i2 = 3;
                    }
                    int i4 = this.internalFormat;
                    i = (i4 == 33327 || i4 == 33328) ? 2 : i2;
                    int i5 = this.internalFormat;
                    if (i5 == 33325 || i5 == 33326) {
                        i = 1;
                    }
                } else {
                    i = 4;
                }
                this.buffer = BufferUtils.newFloatBuffer(this.width * this.height * i);
            }
            this.isPrepared = true;
            return;
        }
        throw new GdxRuntimeException("Already prepared");
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public void consumeCustomData(int i) {
        if (Gdx.app.getType() == Application.ApplicationType.Android || Gdx.app.getType() == Application.ApplicationType.iOS || Gdx.app.getType() == Application.ApplicationType.WebGL) {
            if (Gdx.graphics.supportsExtension("OES_texture_float")) {
                Gdx.gl.glTexImage2D(i, 0, GL20.GL_RGBA, this.width, this.height, 0, GL20.GL_RGBA, GL20.GL_FLOAT, this.buffer);
                return;
            }
            throw new GdxRuntimeException("Extension OES_texture_float not supported!");
        } else if (Gdx.graphics.isGL30Available() || Gdx.graphics.supportsExtension("GL_ARB_texture_float")) {
            Gdx.gl.glTexImage2D(i, 0, this.internalFormat, this.width, this.height, 0, this.format, GL20.GL_FLOAT, this.buffer);
        } else {
            throw new GdxRuntimeException("Extension GL_ARB_texture_float not supported!");
        }
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

    public FloatBuffer getBuffer() {
        return this.buffer;
    }
}
