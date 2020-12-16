package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.glutils.GLFrameBuffer;

public class FloatFrameBuffer extends FrameBuffer {
    FloatFrameBuffer() {
    }

    protected FloatFrameBuffer(GLFrameBuffer.GLFrameBufferBuilder<? extends GLFrameBuffer<Texture>> gLFrameBufferBuilder) {
        super(gLFrameBufferBuilder);
    }

    public FloatFrameBuffer(int i, int i2, boolean z) {
        GLFrameBuffer.FloatFrameBufferBuilder floatFrameBufferBuilder = new GLFrameBuffer.FloatFrameBufferBuilder(i, i2);
        floatFrameBufferBuilder.addFloatAttachment(GL30.GL_RGBA32F, GL20.GL_RGBA, GL20.GL_FLOAT, false);
        if (z) {
            floatFrameBufferBuilder.addBasicDepthRenderBuffer();
        }
        this.bufferBuilder = floatFrameBufferBuilder;
        build();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer, com.badlogic.gdx.graphics.glutils.FrameBuffer, com.badlogic.gdx.graphics.glutils.FrameBuffer
    public Texture createTexture(GLFrameBuffer.FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec) {
        Texture texture = new Texture(new FloatTextureData(this.bufferBuilder.width, this.bufferBuilder.height, frameBufferTextureAttachmentSpec.internalFormat, frameBufferTextureAttachmentSpec.format, frameBufferTextureAttachmentSpec.type, frameBufferTextureAttachmentSpec.isGpuOnly));
        if (Gdx.app.getType() == Application.ApplicationType.Desktop || Gdx.app.getType() == Application.ApplicationType.Applet) {
            texture.setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear);
        } else {
            texture.setFilter(Texture.TextureFilter.Nearest, Texture.TextureFilter.Nearest);
        }
        texture.setWrap(Texture.TextureWrap.ClampToEdge, Texture.TextureWrap.ClampToEdge);
        return texture;
    }
}
