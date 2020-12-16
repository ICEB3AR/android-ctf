package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.glutils.GLFrameBuffer;

public class FrameBuffer extends GLFrameBuffer<Texture> {
    FrameBuffer() {
    }

    protected FrameBuffer(GLFrameBuffer.GLFrameBufferBuilder<? extends GLFrameBuffer<Texture>> gLFrameBufferBuilder) {
        super(gLFrameBufferBuilder);
    }

    public FrameBuffer(Pixmap.Format format, int i, int i2, boolean z) {
        this(format, i, i2, z, false);
    }

    public FrameBuffer(Pixmap.Format format, int i, int i2, boolean z, boolean z2) {
        GLFrameBuffer.FrameBufferBuilder frameBufferBuilder = new GLFrameBuffer.FrameBufferBuilder(i, i2);
        frameBufferBuilder.addBasicColorTextureAttachment(format);
        if (z) {
            frameBufferBuilder.addBasicDepthRenderBuffer();
        }
        if (z2) {
            frameBufferBuilder.addBasicStencilRenderBuffer();
        }
        this.bufferBuilder = frameBufferBuilder;
        build();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer
    public Texture createTexture(GLFrameBuffer.FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec) {
        Texture texture = new Texture(new GLOnlyTextureData(this.bufferBuilder.width, this.bufferBuilder.height, 0, frameBufferTextureAttachmentSpec.internalFormat, frameBufferTextureAttachmentSpec.format, frameBufferTextureAttachmentSpec.type));
        texture.setFilter(Texture.TextureFilter.Linear, Texture.TextureFilter.Linear);
        texture.setWrap(Texture.TextureWrap.ClampToEdge, Texture.TextureWrap.ClampToEdge);
        return texture;
    }

    /* access modifiers changed from: protected */
    public void disposeColorTexture(Texture texture) {
        texture.dispose();
    }

    /* access modifiers changed from: protected */
    public void attachFrameBufferColorTexture(Texture texture) {
        Gdx.gl20.glFramebufferTexture2D(GL20.GL_FRAMEBUFFER, GL20.GL_COLOR_ATTACHMENT0, GL20.GL_TEXTURE_2D, texture.getTextureObjectHandle(), 0);
    }

    public static void unbind() {
        GLFrameBuffer.unbind();
    }
}
