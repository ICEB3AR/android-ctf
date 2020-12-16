package com.badlogic.gdx.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.math.MathUtils;
import java.nio.ByteBuffer;

public final class ScreenUtils {
    public static TextureRegion getFrameBufferTexture() {
        return getFrameBufferTexture(0, 0, Gdx.graphics.getBackBufferWidth(), Gdx.graphics.getBackBufferHeight());
    }

    public static TextureRegion getFrameBufferTexture(int i, int i2, int i3, int i4) {
        int nextPowerOfTwo = MathUtils.nextPowerOfTwo(i3);
        int nextPowerOfTwo2 = MathUtils.nextPowerOfTwo(i4);
        Pixmap frameBufferPixmap = getFrameBufferPixmap(i, i2, i3, i4);
        Pixmap pixmap = new Pixmap(nextPowerOfTwo, nextPowerOfTwo2, Pixmap.Format.RGBA8888);
        pixmap.setBlending(Pixmap.Blending.None);
        pixmap.drawPixmap(frameBufferPixmap, 0, 0);
        TextureRegion textureRegion = new TextureRegion(new Texture(pixmap), 0, i4, i3, -i4);
        pixmap.dispose();
        frameBufferPixmap.dispose();
        return textureRegion;
    }

    public static Pixmap getFrameBufferPixmap(int i, int i2, int i3, int i4) {
        Gdx.gl.glPixelStorei(GL20.GL_PACK_ALIGNMENT, 1);
        Pixmap pixmap = new Pixmap(i3, i4, Pixmap.Format.RGBA8888);
        Gdx.gl.glReadPixels(i, i2, i3, i4, GL20.GL_RGBA, GL20.GL_UNSIGNED_BYTE, pixmap.getPixels());
        return pixmap;
    }

    public static byte[] getFrameBufferPixels(boolean z) {
        return getFrameBufferPixels(0, 0, Gdx.graphics.getBackBufferWidth(), Gdx.graphics.getBackBufferHeight(), z);
    }

    public static byte[] getFrameBufferPixels(int i, int i2, int i3, int i4, boolean z) {
        Gdx.gl.glPixelStorei(GL20.GL_PACK_ALIGNMENT, 1);
        int i5 = i3 * i4 * 4;
        ByteBuffer newByteBuffer = BufferUtils.newByteBuffer(i5);
        Gdx.gl.glReadPixels(i, i2, i3, i4, GL20.GL_RGBA, GL20.GL_UNSIGNED_BYTE, newByteBuffer);
        byte[] bArr = new byte[i5];
        if (z) {
            int i6 = i3 * 4;
            for (int i7 = 0; i7 < i4; i7++) {
                newByteBuffer.position(((i4 - i7) - 1) * i6);
                newByteBuffer.get(bArr, i7 * i6, i6);
            }
        } else {
            newByteBuffer.clear();
            newByteBuffer.get(bArr);
        }
        return bArr;
    }
}
