package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Texture;

public class TextureDescriptor<T extends GLTexture> implements Comparable<TextureDescriptor<T>> {
    public Texture.TextureFilter magFilter;
    public Texture.TextureFilter minFilter;
    public T texture;
    public Texture.TextureWrap uWrap;
    public Texture.TextureWrap vWrap;

    @Override // java.lang.Comparable
    public /* bridge */ /* synthetic */ int compareTo(Object obj) {
        return compareTo((TextureDescriptor) ((TextureDescriptor) obj));
    }

    public TextureDescriptor(T t, Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, Texture.TextureWrap textureWrap, Texture.TextureWrap textureWrap2) {
        this.texture = null;
        set(t, textureFilter, textureFilter2, textureWrap, textureWrap2);
    }

    public TextureDescriptor(T t) {
        this(t, null, null, null, null);
    }

    public TextureDescriptor() {
        this.texture = null;
    }

    public void set(T t, Texture.TextureFilter textureFilter, Texture.TextureFilter textureFilter2, Texture.TextureWrap textureWrap, Texture.TextureWrap textureWrap2) {
        this.texture = t;
        this.minFilter = textureFilter;
        this.magFilter = textureFilter2;
        this.uWrap = textureWrap;
        this.vWrap = textureWrap2;
    }

    public <V extends T> void set(TextureDescriptor<V> textureDescriptor) {
        this.texture = textureDescriptor.texture;
        this.minFilter = textureDescriptor.minFilter;
        this.magFilter = textureDescriptor.magFilter;
        this.uWrap = textureDescriptor.uWrap;
        this.vWrap = textureDescriptor.vWrap;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof TextureDescriptor)) {
            return false;
        }
        TextureDescriptor textureDescriptor = (TextureDescriptor) obj;
        if (textureDescriptor.texture == this.texture && textureDescriptor.minFilter == this.minFilter && textureDescriptor.magFilter == this.magFilter && textureDescriptor.uWrap == this.uWrap && textureDescriptor.vWrap == this.vWrap) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        T t = this.texture;
        int i = 0;
        long j = ((long) (t == null ? 0 : t.glTarget)) * 811;
        T t2 = this.texture;
        long textureObjectHandle = (j + ((long) (t2 == null ? 0 : t2.getTextureObjectHandle()))) * 811;
        Texture.TextureFilter textureFilter = this.minFilter;
        long gLEnum = (textureObjectHandle + ((long) (textureFilter == null ? 0 : textureFilter.getGLEnum()))) * 811;
        Texture.TextureFilter textureFilter2 = this.magFilter;
        long gLEnum2 = (gLEnum + ((long) (textureFilter2 == null ? 0 : textureFilter2.getGLEnum()))) * 811;
        Texture.TextureWrap textureWrap = this.uWrap;
        long gLEnum3 = (gLEnum2 + ((long) (textureWrap == null ? 0 : textureWrap.getGLEnum()))) * 811;
        Texture.TextureWrap textureWrap2 = this.vWrap;
        if (textureWrap2 != null) {
            i = textureWrap2.getGLEnum();
        }
        long j2 = gLEnum3 + ((long) i);
        return (int) ((j2 >> 32) ^ j2);
    }

    public int compareTo(TextureDescriptor<T> textureDescriptor) {
        int i;
        int i2;
        int i3 = 0;
        if (textureDescriptor == this) {
            return 0;
        }
        T t = this.texture;
        int i4 = t == null ? 0 : t.glTarget;
        T t2 = textureDescriptor.texture;
        int i5 = t2 == null ? 0 : t2.glTarget;
        if (i4 != i5) {
            return i4 - i5;
        }
        T t3 = this.texture;
        int textureObjectHandle = t3 == null ? 0 : t3.getTextureObjectHandle();
        T t4 = textureDescriptor.texture;
        int textureObjectHandle2 = t4 == null ? 0 : t4.getTextureObjectHandle();
        if (textureObjectHandle != textureObjectHandle2) {
            return textureObjectHandle - textureObjectHandle2;
        }
        Texture.TextureFilter textureFilter = this.minFilter;
        if (textureFilter != textureDescriptor.minFilter) {
            if (textureFilter == null) {
                i2 = 0;
            } else {
                i2 = textureFilter.getGLEnum();
            }
            Texture.TextureFilter textureFilter2 = textureDescriptor.minFilter;
            if (textureFilter2 != null) {
                i3 = textureFilter2.getGLEnum();
            }
            return i2 - i3;
        }
        Texture.TextureFilter textureFilter3 = this.magFilter;
        if (textureFilter3 != textureDescriptor.magFilter) {
            if (textureFilter3 == null) {
                i = 0;
            } else {
                i = textureFilter3.getGLEnum();
            }
            Texture.TextureFilter textureFilter4 = textureDescriptor.magFilter;
            if (textureFilter4 != null) {
                i3 = textureFilter4.getGLEnum();
            }
            return i - i3;
        }
        Texture.TextureWrap textureWrap = this.uWrap;
        if (textureWrap != textureDescriptor.uWrap) {
            int gLEnum = textureWrap == null ? 0 : textureWrap.getGLEnum();
            Texture.TextureWrap textureWrap2 = textureDescriptor.uWrap;
            if (textureWrap2 != null) {
                i3 = textureWrap2.getGLEnum();
            }
            return gLEnum - i3;
        }
        Texture.TextureWrap textureWrap3 = this.vWrap;
        if (textureWrap3 == textureDescriptor.vWrap) {
            return 0;
        }
        int gLEnum2 = textureWrap3 == null ? 0 : textureWrap3.getGLEnum();
        Texture.TextureWrap textureWrap4 = textureDescriptor.vWrap;
        if (textureWrap4 != null) {
            i3 = textureWrap4.getGLEnum();
        }
        return gLEnum2 - i3;
    }
}
