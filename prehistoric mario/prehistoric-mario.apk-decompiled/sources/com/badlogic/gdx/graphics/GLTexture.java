package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.graphics.glutils.MipMapGenerator;
import com.badlogic.gdx.utils.Disposable;

public abstract class GLTexture implements Disposable {
    protected int glHandle;
    public final int glTarget;
    protected Texture.TextureFilter magFilter;
    protected Texture.TextureFilter minFilter;
    protected Texture.TextureWrap uWrap;
    protected Texture.TextureWrap vWrap;

    public abstract int getDepth();

    public abstract int getHeight();

    public abstract int getWidth();

    public abstract boolean isManaged();

    /* access modifiers changed from: protected */
    public abstract void reload();

    public GLTexture(int i) {
        this(i, Gdx.gl.glGenTexture());
    }

    public GLTexture(int i, int i2) {
        this.minFilter = Texture.TextureFilter.Nearest;
        this.magFilter = Texture.TextureFilter.Nearest;
        this.uWrap = Texture.TextureWrap.ClampToEdge;
        this.vWrap = Texture.TextureWrap.ClampToEdge;
        this.glTarget = i;
        this.glHandle = i2;
    }

    public void bind() {
        Gdx.gl.glBindTexture(this.glTarget, this.glHandle);
    }

    public void bind(int i) {
        Gdx.gl.glActiveTexture(i + GL20.GL_TEXTURE0);
        Gdx.gl.glBindTexture(this.glTarget, this.glHandle);
    }

    public Texture.TextureFilter getMinFilter() {
        return this.minFilter;
    }

    public Texture.TextureFilter getMagFilter() {
        return this.magFilter;
    }

    public Texture.TextureWrap getUWrap() {
        return this.uWrap;
    }

    public Texture.TextureWrap getVWrap() {
        return this.vWrap;
    }

    public int getTextureObjectHandle() {
        return this.glHandle;
    }

    public void unsafeSetWrap(Texture.TextureWrap textureWrap, Texture.TextureWrap textureWrap2) {
        unsafeSetWrap(textureWrap, textureWrap2, false);
    }

    public void unsafeSetWrap(Texture.TextureWrap textureWrap, Texture.TextureWrap textureWrap2, boolean z) {
        if (textureWrap != null && (z || this.uWrap != textureWrap)) {
            Gdx.gl.glTexParameteri(this.glTarget, GL20.GL_TEXTURE_WRAP_S, textureWrap.getGLEnum());
            this.uWrap = textureWrap;
        }
        if (textureWrap2 == null) {
            return;
        }
        if (z || this.vWrap != textureWrap2) {
            Gdx.gl.glTexParameteri(this.glTarget, GL20.GL_TEXTURE_WRAP_T, textureWrap2.getGLEnum());
            this.vWrap = textureWrap2;
        }
    }

    public void setWrap(Texture.TextureWrap textureWrap, Texture.TextureWrap textureWrap2) {
        this.uWrap = textureWrap;
        this.vWrap = textureWrap2;
        bind();
        Gdx.gl.glTexParameteri(this.glTarget, GL20.GL_TEXTURE_WRAP_S, textureWrap.getGLEnum());
        Gdx.gl.glTexParameteri(this.glTarget, GL20.GL_TEXTURE_WRAP_T, textureWrap2.getGLEnum());
    }

    public void unsafeSetFilter(Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2) {
        unsafeSetFilter(textureFilter, textureFilter2, false);
    }

    public void unsafeSetFilter(Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, boolean z) {
        if (textureFilter != null && (z || this.minFilter != textureFilter)) {
            Gdx.gl.glTexParameteri(this.glTarget, GL20.GL_TEXTURE_MIN_FILTER, textureFilter.getGLEnum());
            this.minFilter = textureFilter;
        }
        if (textureFilter2 == null) {
            return;
        }
        if (z || this.magFilter != textureFilter2) {
            Gdx.gl.glTexParameteri(this.glTarget, GL20.GL_TEXTURE_MAG_FILTER, textureFilter2.getGLEnum());
            this.magFilter = textureFilter2;
        }
    }

    public void setFilter(Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2) {
        this.minFilter = textureFilter;
        this.magFilter = textureFilter2;
        bind();
        Gdx.gl.glTexParameteri(this.glTarget, GL20.GL_TEXTURE_MIN_FILTER, textureFilter.getGLEnum());
        Gdx.gl.glTexParameteri(this.glTarget, GL20.GL_TEXTURE_MAG_FILTER, textureFilter2.getGLEnum());
    }

    /* access modifiers changed from: protected */
    public void delete() {
        if (this.glHandle != 0) {
            Gdx.gl.glDeleteTexture(this.glHandle);
            this.glHandle = 0;
        }
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        delete();
    }

    protected static void uploadImageData(int i, TextureData textureData) {
        uploadImageData(i, textureData, 0);
    }

    public static void uploadImageData(int i, TextureData textureData, int i2) {
        if (textureData != null) {
            if (!textureData.isPrepared()) {
                textureData.prepare();
            }
            if (textureData.getType() == TextureData.TextureDataType.Custom) {
                textureData.consumeCustomData(i);
                return;
            }
            Pixmap consumePixmap = textureData.consumePixmap();
            boolean disposePixmap = textureData.disposePixmap();
            if (textureData.getFormat() != consumePixmap.getFormat()) {
                Pixmap pixmap = new Pixmap(consumePixmap.getWidth(), consumePixmap.getHeight(), textureData.getFormat());
                pixmap.setBlending(Pixmap.Blending.None);
                pixmap.drawPixmap(consumePixmap, 0, 0, 0, 0, consumePixmap.getWidth(), consumePixmap.getHeight());
                if (textureData.disposePixmap()) {
                    consumePixmap.dispose();
                }
                consumePixmap = pixmap;
                disposePixmap = true;
            }
            Gdx.gl.glPixelStorei(GL20.GL_UNPACK_ALIGNMENT, 1);
            if (textureData.useMipMaps()) {
                MipMapGenerator.generateMipMap(i, consumePixmap, consumePixmap.getWidth(), consumePixmap.getHeight());
            } else {
                Gdx.gl.glTexImage2D(i, i2, consumePixmap.getGLInternalFormat(), consumePixmap.getWidth(), consumePixmap.getHeight(), 0, consumePixmap.getGLFormat(), consumePixmap.getGLType(), consumePixmap.getPixels());
            }
            if (disposePixmap) {
                consumePixmap.dispose();
            }
        }
    }
}
