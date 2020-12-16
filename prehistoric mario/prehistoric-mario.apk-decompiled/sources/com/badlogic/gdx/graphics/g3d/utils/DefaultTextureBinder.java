package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.IntBuffer;

public final class DefaultTextureBinder implements TextureBinder {
    public static final int MAX_GLES_UNITS = 32;
    public static final int ROUNDROBIN = 0;
    public static final int WEIGHTED = 1;
    private int bindCount;
    private final int count;
    private int currentTexture;
    private final int method;
    private final int offset;
    private int reuseCount;
    private final int reuseWeight;
    private boolean reused;
    private final TextureDescriptor tempDesc;
    private final GLTexture[] textures;
    private final int[] weights;

    public DefaultTextureBinder(int i) {
        this(i, 0);
    }

    public DefaultTextureBinder(int i, int i2) {
        this(i, i2, -1);
    }

    public DefaultTextureBinder(int i, int i2, int i3) {
        this(i, i2, i3, 10);
    }

    public DefaultTextureBinder(int i, int i2, int i3, int i4) {
        int[] iArr;
        this.reuseCount = 0;
        this.bindCount = 0;
        this.tempDesc = new TextureDescriptor();
        this.currentTexture = 0;
        int min = Math.min(getMaxTextureUnits(), 32);
        i3 = i3 < 0 ? min - i2 : i3;
        if (i2 < 0 || i3 < 0 || i2 + i3 > min || i4 < 1) {
            throw new GdxRuntimeException("Illegal arguments");
        }
        this.method = i;
        this.offset = i2;
        this.count = i3;
        this.textures = new GLTexture[i3];
        this.reuseWeight = i4;
        if (i == 1) {
            iArr = new int[i3];
        } else {
            iArr = null;
        }
        this.weights = iArr;
    }

    private static int getMaxTextureUnits() {
        IntBuffer newIntBuffer = BufferUtils.newIntBuffer(16);
        Gdx.gl.glGetIntegerv(GL20.GL_MAX_TEXTURE_IMAGE_UNITS, newIntBuffer);
        return newIntBuffer.get(0);
    }

    @Override // com.badlogic.gdx.graphics.g3d.utils.TextureBinder
    public void begin() {
        for (int i = 0; i < this.count; i++) {
            this.textures[i] = null;
            int[] iArr = this.weights;
            if (iArr != null) {
                iArr[i] = 0;
            }
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.utils.TextureBinder
    public void end() {
        Gdx.gl.glActiveTexture(GL20.GL_TEXTURE0);
    }

    @Override // com.badlogic.gdx.graphics.g3d.utils.TextureBinder
    public final int bind(TextureDescriptor textureDescriptor) {
        return bindTexture(textureDescriptor, false);
    }

    @Override // com.badlogic.gdx.graphics.g3d.utils.TextureBinder
    public final int bind(GLTexture gLTexture) {
        this.tempDesc.set(gLTexture, null, null, null, null);
        return bindTexture(this.tempDesc, false);
    }

    private final int bindTexture(TextureDescriptor textureDescriptor, boolean z) {
        int i;
        int i2;
        T t = textureDescriptor.texture;
        this.reused = false;
        int i3 = this.method;
        if (i3 == 0) {
            i2 = this.offset;
            i = bindTextureRoundRobin(t);
        } else if (i3 != 1) {
            return -1;
        } else {
            i2 = this.offset;
            i = bindTextureWeighted(t);
        }
        int i4 = i2 + i;
        if (this.reused) {
            this.reuseCount++;
            if (z) {
                t.bind(i4);
            } else {
                Gdx.gl.glActiveTexture(GL20.GL_TEXTURE0 + i4);
            }
        } else {
            this.bindCount++;
        }
        t.unsafeSetWrap(textureDescriptor.uWrap, textureDescriptor.vWrap);
        t.unsafeSetFilter(textureDescriptor.minFilter, textureDescriptor.magFilter);
        return i4;
    }

    private final int bindTextureRoundRobin(GLTexture gLTexture) {
        int i = 0;
        while (true) {
            int i2 = this.count;
            if (i < i2) {
                int i3 = (this.currentTexture + i) % i2;
                if (this.textures[i3] == gLTexture) {
                    this.reused = true;
                    return i3;
                }
                i++;
            } else {
                this.currentTexture = (this.currentTexture + 1) % i2;
                GLTexture[] gLTextureArr = this.textures;
                int i4 = this.currentTexture;
                gLTextureArr[i4] = gLTexture;
                gLTexture.bind(this.offset + i4);
                return this.currentTexture;
            }
        }
    }

    private final int bindTextureWeighted(GLTexture gLTexture) {
        int i = -1;
        int i2 = this.weights[0];
        int i3 = 0;
        for (int i4 = 0; i4 < this.count; i4++) {
            if (this.textures[i4] == gLTexture) {
                int[] iArr = this.weights;
                iArr[i4] = iArr[i4] + this.reuseWeight;
                i = i4;
            } else {
                int[] iArr2 = this.weights;
                if (iArr2[i4] >= 0) {
                    int i5 = iArr2[i4] - 1;
                    iArr2[i4] = i5;
                    if (i5 >= i2) {
                    }
                }
                i2 = this.weights[i4];
                i3 = i4;
            }
        }
        if (i < 0) {
            this.textures[i3] = gLTexture;
            this.weights[i3] = 100;
            gLTexture.bind(this.offset + i3);
            return i3;
        }
        this.reused = true;
        return i;
    }

    @Override // com.badlogic.gdx.graphics.g3d.utils.TextureBinder
    public final int getBindCount() {
        return this.bindCount;
    }

    @Override // com.badlogic.gdx.graphics.g3d.utils.TextureBinder
    public final int getReuseCount() {
        return this.reuseCount;
    }

    @Override // com.badlogic.gdx.graphics.g3d.utils.TextureBinder
    public final void resetCounts() {
        this.reuseCount = 0;
        this.bindCount = 0;
    }
}
