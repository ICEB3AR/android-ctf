package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.GLTexture;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public abstract class GLFrameBuffer<T extends GLTexture> implements Disposable {
    protected static final int GL_DEPTH24_STENCIL8_OES = 35056;
    protected static final Map<Application, Array<GLFrameBuffer>> buffers = new HashMap();
    protected static int defaultFramebufferHandle;
    protected static boolean defaultFramebufferHandleInitialized = false;
    protected GLFrameBufferBuilder<? extends GLFrameBuffer<T>> bufferBuilder;
    protected int depthStencilPackedBufferHandle;
    protected int depthbufferHandle;
    protected int framebufferHandle;
    protected boolean hasDepthStencilPackedBuffer;
    protected boolean isMRT;
    protected int stencilbufferHandle;
    protected Array<T> textureAttachments = new Array<>();

    /* access modifiers changed from: protected */
    public abstract void attachFrameBufferColorTexture(T t);

    /* access modifiers changed from: protected */
    public abstract T createTexture(FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec);

    /* access modifiers changed from: protected */
    public abstract void disposeColorTexture(T t);

    GLFrameBuffer() {
    }

    protected GLFrameBuffer(GLFrameBufferBuilder<? extends GLFrameBuffer<T>> gLFrameBufferBuilder) {
        this.bufferBuilder = gLFrameBufferBuilder;
        build();
    }

    public T getColorBufferTexture() {
        return this.textureAttachments.first();
    }

    public Array<T> getTextureAttachments() {
        return this.textureAttachments;
    }

    /* access modifiers changed from: protected */
    public void build() {
        int i;
        GL20 gl20 = Gdx.gl20;
        checkValidBuilder();
        if (!defaultFramebufferHandleInitialized) {
            defaultFramebufferHandleInitialized = true;
            if (Gdx.app.getType() == Application.ApplicationType.iOS) {
                IntBuffer asIntBuffer = ByteBuffer.allocateDirect(64).order(ByteOrder.nativeOrder()).asIntBuffer();
                gl20.glGetIntegerv(36006, asIntBuffer);
                defaultFramebufferHandle = asIntBuffer.get(0);
            } else {
                defaultFramebufferHandle = 0;
            }
        }
        this.framebufferHandle = gl20.glGenFramebuffer();
        gl20.glBindFramebuffer(GL20.GL_FRAMEBUFFER, this.framebufferHandle);
        int i2 = this.bufferBuilder.width;
        int i3 = this.bufferBuilder.height;
        if (this.bufferBuilder.hasDepthRenderBuffer) {
            this.depthbufferHandle = gl20.glGenRenderbuffer();
            gl20.glBindRenderbuffer(GL20.GL_RENDERBUFFER, this.depthbufferHandle);
            gl20.glRenderbufferStorage(GL20.GL_RENDERBUFFER, this.bufferBuilder.depthRenderBufferSpec.internalFormat, i2, i3);
        }
        if (this.bufferBuilder.hasStencilRenderBuffer) {
            this.stencilbufferHandle = gl20.glGenRenderbuffer();
            gl20.glBindRenderbuffer(GL20.GL_RENDERBUFFER, this.stencilbufferHandle);
            gl20.glRenderbufferStorage(GL20.GL_RENDERBUFFER, this.bufferBuilder.stencilRenderBufferSpec.internalFormat, i2, i3);
        }
        if (this.bufferBuilder.hasPackedStencilDepthRenderBuffer) {
            this.depthStencilPackedBufferHandle = gl20.glGenRenderbuffer();
            gl20.glBindRenderbuffer(GL20.GL_RENDERBUFFER, this.depthStencilPackedBufferHandle);
            gl20.glRenderbufferStorage(GL20.GL_RENDERBUFFER, this.bufferBuilder.packedStencilDepthRenderBufferSpec.internalFormat, i2, i3);
        }
        this.isMRT = this.bufferBuilder.textureAttachmentSpecs.size > 1;
        if (this.isMRT) {
            Iterator<FrameBufferTextureAttachmentSpec> it = this.bufferBuilder.textureAttachmentSpecs.iterator();
            int i4 = 0;
            while (it.hasNext()) {
                FrameBufferTextureAttachmentSpec next = it.next();
                T createTexture = createTexture(next);
                this.textureAttachments.add(createTexture);
                if (next.isColorTexture()) {
                    gl20.glFramebufferTexture2D(GL20.GL_FRAMEBUFFER, i4 + GL20.GL_COLOR_ATTACHMENT0, GL20.GL_TEXTURE_2D, createTexture.getTextureObjectHandle(), 0);
                    i4++;
                } else if (next.isDepth) {
                    gl20.glFramebufferTexture2D(GL20.GL_FRAMEBUFFER, GL20.GL_DEPTH_ATTACHMENT, GL20.GL_TEXTURE_2D, createTexture.getTextureObjectHandle(), 0);
                } else if (next.isStencil) {
                    gl20.glFramebufferTexture2D(GL20.GL_FRAMEBUFFER, GL20.GL_STENCIL_ATTACHMENT, GL20.GL_TEXTURE_2D, createTexture.getTextureObjectHandle(), 0);
                }
            }
            i = i4;
        } else {
            T createTexture2 = createTexture(this.bufferBuilder.textureAttachmentSpecs.first());
            this.textureAttachments.add(createTexture2);
            gl20.glBindTexture(createTexture2.glTarget, createTexture2.getTextureObjectHandle());
            i = 0;
        }
        if (this.isMRT) {
            IntBuffer newIntBuffer = BufferUtils.newIntBuffer(i);
            for (int i5 = 0; i5 < i; i5++) {
                newIntBuffer.put(i5 + GL20.GL_COLOR_ATTACHMENT0);
            }
            newIntBuffer.position(0);
            Gdx.gl30.glDrawBuffers(i, newIntBuffer);
        } else {
            attachFrameBufferColorTexture(this.textureAttachments.first());
        }
        if (this.bufferBuilder.hasDepthRenderBuffer) {
            gl20.glFramebufferRenderbuffer(GL20.GL_FRAMEBUFFER, GL20.GL_DEPTH_ATTACHMENT, GL20.GL_RENDERBUFFER, this.depthbufferHandle);
        }
        if (this.bufferBuilder.hasStencilRenderBuffer) {
            gl20.glFramebufferRenderbuffer(GL20.GL_FRAMEBUFFER, GL20.GL_STENCIL_ATTACHMENT, GL20.GL_RENDERBUFFER, this.stencilbufferHandle);
        }
        if (this.bufferBuilder.hasPackedStencilDepthRenderBuffer) {
            gl20.glFramebufferRenderbuffer(GL20.GL_FRAMEBUFFER, GL30.GL_DEPTH_STENCIL_ATTACHMENT, GL20.GL_RENDERBUFFER, this.depthStencilPackedBufferHandle);
        }
        gl20.glBindRenderbuffer(GL20.GL_RENDERBUFFER, 0);
        Iterator<T> it2 = this.textureAttachments.iterator();
        while (it2.hasNext()) {
            gl20.glBindTexture(it2.next().glTarget, 0);
        }
        int glCheckFramebufferStatus = gl20.glCheckFramebufferStatus(GL20.GL_FRAMEBUFFER);
        if (glCheckFramebufferStatus == 36061 && this.bufferBuilder.hasDepthRenderBuffer && this.bufferBuilder.hasStencilRenderBuffer && (Gdx.graphics.supportsExtension("GL_OES_packed_depth_stencil") || Gdx.graphics.supportsExtension("GL_EXT_packed_depth_stencil"))) {
            if (this.bufferBuilder.hasDepthRenderBuffer) {
                gl20.glDeleteRenderbuffer(this.depthbufferHandle);
                this.depthbufferHandle = 0;
            }
            if (this.bufferBuilder.hasStencilRenderBuffer) {
                gl20.glDeleteRenderbuffer(this.stencilbufferHandle);
                this.stencilbufferHandle = 0;
            }
            if (this.bufferBuilder.hasPackedStencilDepthRenderBuffer) {
                gl20.glDeleteRenderbuffer(this.depthStencilPackedBufferHandle);
                this.depthStencilPackedBufferHandle = 0;
            }
            this.depthStencilPackedBufferHandle = gl20.glGenRenderbuffer();
            this.hasDepthStencilPackedBuffer = true;
            gl20.glBindRenderbuffer(GL20.GL_RENDERBUFFER, this.depthStencilPackedBufferHandle);
            gl20.glRenderbufferStorage(GL20.GL_RENDERBUFFER, 35056, i2, i3);
            gl20.glBindRenderbuffer(GL20.GL_RENDERBUFFER, 0);
            gl20.glFramebufferRenderbuffer(GL20.GL_FRAMEBUFFER, GL20.GL_DEPTH_ATTACHMENT, GL20.GL_RENDERBUFFER, this.depthStencilPackedBufferHandle);
            gl20.glFramebufferRenderbuffer(GL20.GL_FRAMEBUFFER, GL20.GL_STENCIL_ATTACHMENT, GL20.GL_RENDERBUFFER, this.depthStencilPackedBufferHandle);
            glCheckFramebufferStatus = gl20.glCheckFramebufferStatus(GL20.GL_FRAMEBUFFER);
        }
        gl20.glBindFramebuffer(GL20.GL_FRAMEBUFFER, defaultFramebufferHandle);
        if (glCheckFramebufferStatus != 36053) {
            Iterator<T> it3 = this.textureAttachments.iterator();
            while (it3.hasNext()) {
                disposeColorTexture(it3.next());
            }
            if (this.hasDepthStencilPackedBuffer) {
                gl20.glDeleteBuffer(this.depthStencilPackedBufferHandle);
            } else {
                if (this.bufferBuilder.hasDepthRenderBuffer) {
                    gl20.glDeleteRenderbuffer(this.depthbufferHandle);
                }
                if (this.bufferBuilder.hasStencilRenderBuffer) {
                    gl20.glDeleteRenderbuffer(this.stencilbufferHandle);
                }
            }
            gl20.glDeleteFramebuffer(this.framebufferHandle);
            if (glCheckFramebufferStatus == 36054) {
                throw new IllegalStateException("Frame buffer couldn't be constructed: incomplete attachment");
            } else if (glCheckFramebufferStatus == 36057) {
                throw new IllegalStateException("Frame buffer couldn't be constructed: incomplete dimensions");
            } else if (glCheckFramebufferStatus == 36055) {
                throw new IllegalStateException("Frame buffer couldn't be constructed: missing attachment");
            } else if (glCheckFramebufferStatus == 36061) {
                throw new IllegalStateException("Frame buffer couldn't be constructed: unsupported combination of formats");
            } else {
                throw new IllegalStateException("Frame buffer couldn't be constructed: unknown error " + glCheckFramebufferStatus);
            }
        } else {
            addManagedFrameBuffer(Gdx.app, this);
        }
    }

    private void checkValidBuilder() {
        if (Gdx.graphics.isGL30Available()) {
            return;
        }
        if (this.bufferBuilder.hasPackedStencilDepthRenderBuffer) {
            throw new GdxRuntimeException("Packed Stencil/Render render buffers are not available on GLES 2.0");
        } else if (this.bufferBuilder.textureAttachmentSpecs.size <= 1) {
            Iterator<FrameBufferTextureAttachmentSpec> it = this.bufferBuilder.textureAttachmentSpecs.iterator();
            while (it.hasNext()) {
                FrameBufferTextureAttachmentSpec next = it.next();
                if (next.isDepth) {
                    throw new GdxRuntimeException("Depth texture FrameBuffer Attachment not available on GLES 2.0");
                } else if (next.isStencil) {
                    throw new GdxRuntimeException("Stencil texture FrameBuffer Attachment not available on GLES 2.0");
                } else if (next.isFloat && !Gdx.graphics.supportsExtension("OES_texture_float")) {
                    throw new GdxRuntimeException("Float texture FrameBuffer Attachment not available on GLES 2.0");
                }
            }
        } else {
            throw new GdxRuntimeException("Multiple render targets not available on GLES 2.0");
        }
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        GL20 gl20 = Gdx.gl20;
        Iterator<T> it = this.textureAttachments.iterator();
        while (it.hasNext()) {
            disposeColorTexture(it.next());
        }
        if (this.hasDepthStencilPackedBuffer) {
            gl20.glDeleteRenderbuffer(this.depthStencilPackedBufferHandle);
        } else {
            if (this.bufferBuilder.hasDepthRenderBuffer) {
                gl20.glDeleteRenderbuffer(this.depthbufferHandle);
            }
            if (this.bufferBuilder.hasStencilRenderBuffer) {
                gl20.glDeleteRenderbuffer(this.stencilbufferHandle);
            }
        }
        gl20.glDeleteFramebuffer(this.framebufferHandle);
        if (buffers.get(Gdx.app) != null) {
            buffers.get(Gdx.app).removeValue(this, true);
        }
    }

    public void bind() {
        Gdx.gl20.glBindFramebuffer(GL20.GL_FRAMEBUFFER, this.framebufferHandle);
    }

    public static void unbind() {
        Gdx.gl20.glBindFramebuffer(GL20.GL_FRAMEBUFFER, defaultFramebufferHandle);
    }

    public void begin() {
        bind();
        setFrameBufferViewport();
    }

    /* access modifiers changed from: protected */
    public void setFrameBufferViewport() {
        Gdx.gl20.glViewport(0, 0, this.bufferBuilder.width, this.bufferBuilder.height);
    }

    public void end() {
        end(0, 0, Gdx.graphics.getBackBufferWidth(), Gdx.graphics.getBackBufferHeight());
    }

    public void end(int i, int i2, int i3, int i4) {
        unbind();
        Gdx.gl20.glViewport(i, i2, i3, i4);
    }

    public int getFramebufferHandle() {
        return this.framebufferHandle;
    }

    public int getDepthBufferHandle() {
        return this.depthbufferHandle;
    }

    public int getStencilBufferHandle() {
        return this.stencilbufferHandle;
    }

    /* access modifiers changed from: protected */
    public int getDepthStencilPackedBuffer() {
        return this.depthStencilPackedBufferHandle;
    }

    public int getHeight() {
        return this.bufferBuilder.height;
    }

    public int getWidth() {
        return this.bufferBuilder.width;
    }

    private static void addManagedFrameBuffer(Application application, GLFrameBuffer gLFrameBuffer) {
        Array<GLFrameBuffer> array = buffers.get(application);
        if (array == null) {
            array = new Array<>();
        }
        array.add(gLFrameBuffer);
        buffers.put(application, array);
    }

    public static void invalidateAllFrameBuffers(Application application) {
        Array<GLFrameBuffer> array;
        if (!(Gdx.gl20 == null || (array = buffers.get(application)) == null)) {
            for (int i = 0; i < array.size; i++) {
                array.get(i).build();
            }
        }
    }

    public static void clearAllFrameBuffers(Application application) {
        buffers.remove(application);
    }

    public static StringBuilder getManagedStatus(StringBuilder sb) {
        sb.append("Managed buffers/app: { ");
        for (Application application : buffers.keySet()) {
            sb.append(buffers.get(application).size);
            sb.append(" ");
        }
        sb.append("}");
        return sb;
    }

    public static String getManagedStatus() {
        return getManagedStatus(new StringBuilder()).toString();
    }

    /* access modifiers changed from: protected */
    public static class FrameBufferTextureAttachmentSpec {
        int format;
        int internalFormat;
        boolean isDepth;
        boolean isFloat;
        boolean isGpuOnly;
        boolean isStencil;
        int type;

        public FrameBufferTextureAttachmentSpec(int i, int i2, int i3) {
            this.internalFormat = i;
            this.format = i2;
            this.type = i3;
        }

        public boolean isColorTexture() {
            return !this.isDepth && !this.isStencil;
        }
    }

    /* access modifiers changed from: protected */
    public static class FrameBufferRenderBufferAttachmentSpec {
        int internalFormat;

        public FrameBufferRenderBufferAttachmentSpec(int i) {
            this.internalFormat = i;
        }
    }

    /* access modifiers changed from: protected */
    public static abstract class GLFrameBufferBuilder<U extends GLFrameBuffer<? extends GLTexture>> {
        protected FrameBufferRenderBufferAttachmentSpec depthRenderBufferSpec;
        protected boolean hasDepthRenderBuffer;
        protected boolean hasPackedStencilDepthRenderBuffer;
        protected boolean hasStencilRenderBuffer;
        protected int height;
        protected FrameBufferRenderBufferAttachmentSpec packedStencilDepthRenderBufferSpec;
        protected FrameBufferRenderBufferAttachmentSpec stencilRenderBufferSpec;
        protected Array<FrameBufferTextureAttachmentSpec> textureAttachmentSpecs = new Array<>();
        protected int width;

        public abstract U build();

        public GLFrameBufferBuilder(int i, int i2) {
            this.width = i;
            this.height = i2;
        }

        public GLFrameBufferBuilder<U> addColorTextureAttachment(int i, int i2, int i3) {
            this.textureAttachmentSpecs.add(new FrameBufferTextureAttachmentSpec(i, i2, i3));
            return this;
        }

        public GLFrameBufferBuilder<U> addBasicColorTextureAttachment(Pixmap.Format format) {
            int glFormat = Pixmap.Format.toGlFormat(format);
            return addColorTextureAttachment(glFormat, glFormat, Pixmap.Format.toGlType(format));
        }

        public GLFrameBufferBuilder<U> addFloatAttachment(int i, int i2, int i3, boolean z) {
            FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec = new FrameBufferTextureAttachmentSpec(i, i2, i3);
            frameBufferTextureAttachmentSpec.isFloat = true;
            frameBufferTextureAttachmentSpec.isGpuOnly = z;
            this.textureAttachmentSpecs.add(frameBufferTextureAttachmentSpec);
            return this;
        }

        public GLFrameBufferBuilder<U> addDepthTextureAttachment(int i, int i2) {
            FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec = new FrameBufferTextureAttachmentSpec(i, GL20.GL_DEPTH_COMPONENT, i2);
            frameBufferTextureAttachmentSpec.isDepth = true;
            this.textureAttachmentSpecs.add(frameBufferTextureAttachmentSpec);
            return this;
        }

        public GLFrameBufferBuilder<U> addStencilTextureAttachment(int i, int i2) {
            FrameBufferTextureAttachmentSpec frameBufferTextureAttachmentSpec = new FrameBufferTextureAttachmentSpec(i, GL20.GL_STENCIL_ATTACHMENT, i2);
            frameBufferTextureAttachmentSpec.isStencil = true;
            this.textureAttachmentSpecs.add(frameBufferTextureAttachmentSpec);
            return this;
        }

        public GLFrameBufferBuilder<U> addDepthRenderBuffer(int i) {
            this.depthRenderBufferSpec = new FrameBufferRenderBufferAttachmentSpec(i);
            this.hasDepthRenderBuffer = true;
            return this;
        }

        public GLFrameBufferBuilder<U> addStencilRenderBuffer(int i) {
            this.stencilRenderBufferSpec = new FrameBufferRenderBufferAttachmentSpec(i);
            this.hasStencilRenderBuffer = true;
            return this;
        }

        public GLFrameBufferBuilder<U> addStencilDepthPackedRenderBuffer(int i) {
            this.packedStencilDepthRenderBufferSpec = new FrameBufferRenderBufferAttachmentSpec(i);
            this.hasPackedStencilDepthRenderBuffer = true;
            return this;
        }

        public GLFrameBufferBuilder<U> addBasicDepthRenderBuffer() {
            return addDepthRenderBuffer(GL20.GL_DEPTH_COMPONENT16);
        }

        public GLFrameBufferBuilder<U> addBasicStencilRenderBuffer() {
            return addStencilRenderBuffer(GL20.GL_STENCIL_INDEX8);
        }

        public GLFrameBufferBuilder<U> addBasicStencilDepthPackedRenderBuffer() {
            return addStencilDepthPackedRenderBuffer(35056);
        }
    }

    public static class FrameBufferBuilder extends GLFrameBufferBuilder<FrameBuffer> {
        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addBasicColorTextureAttachment(Pixmap.Format format) {
            return super.addBasicColorTextureAttachment(format);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addBasicDepthRenderBuffer() {
            return super.addBasicDepthRenderBuffer();
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addBasicStencilDepthPackedRenderBuffer() {
            return super.addBasicStencilDepthPackedRenderBuffer();
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addBasicStencilRenderBuffer() {
            return super.addBasicStencilRenderBuffer();
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addColorTextureAttachment(int i, int i2, int i3) {
            return super.addColorTextureAttachment(i, i2, i3);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addDepthRenderBuffer(int i) {
            return super.addDepthRenderBuffer(i);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addDepthTextureAttachment(int i, int i2) {
            return super.addDepthTextureAttachment(i, i2);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addFloatAttachment(int i, int i2, int i3, boolean z) {
            return super.addFloatAttachment(i, i2, i3, z);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addStencilDepthPackedRenderBuffer(int i) {
            return super.addStencilDepthPackedRenderBuffer(i);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addStencilRenderBuffer(int i) {
            return super.addStencilRenderBuffer(i);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBuffer> addStencilTextureAttachment(int i, int i2) {
            return super.addStencilTextureAttachment(i, i2);
        }

        public FrameBufferBuilder(int i, int i2) {
            super(i, i2);
        }

        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public FrameBuffer build() {
            return new FrameBuffer(this);
        }
    }

    public static class FloatFrameBufferBuilder extends GLFrameBufferBuilder<FloatFrameBuffer> {
        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addBasicColorTextureAttachment(Pixmap.Format format) {
            return super.addBasicColorTextureAttachment(format);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addBasicDepthRenderBuffer() {
            return super.addBasicDepthRenderBuffer();
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addBasicStencilDepthPackedRenderBuffer() {
            return super.addBasicStencilDepthPackedRenderBuffer();
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addBasicStencilRenderBuffer() {
            return super.addBasicStencilRenderBuffer();
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addColorTextureAttachment(int i, int i2, int i3) {
            return super.addColorTextureAttachment(i, i2, i3);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addDepthRenderBuffer(int i) {
            return super.addDepthRenderBuffer(i);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addDepthTextureAttachment(int i, int i2) {
            return super.addDepthTextureAttachment(i, i2);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addFloatAttachment(int i, int i2, int i3, boolean z) {
            return super.addFloatAttachment(i, i2, i3, z);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addStencilDepthPackedRenderBuffer(int i) {
            return super.addStencilDepthPackedRenderBuffer(i);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addStencilRenderBuffer(int i) {
            return super.addStencilRenderBuffer(i);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FloatFrameBuffer> addStencilTextureAttachment(int i, int i2) {
            return super.addStencilTextureAttachment(i, i2);
        }

        public FloatFrameBufferBuilder(int i, int i2) {
            super(i, i2);
        }

        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public FloatFrameBuffer build() {
            return new FloatFrameBuffer(this);
        }
    }

    public static class FrameBufferCubemapBuilder extends GLFrameBufferBuilder<FrameBufferCubemap> {
        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addBasicColorTextureAttachment(Pixmap.Format format) {
            return super.addBasicColorTextureAttachment(format);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addBasicDepthRenderBuffer() {
            return super.addBasicDepthRenderBuffer();
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addBasicStencilDepthPackedRenderBuffer() {
            return super.addBasicStencilDepthPackedRenderBuffer();
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addBasicStencilRenderBuffer() {
            return super.addBasicStencilRenderBuffer();
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addColorTextureAttachment(int i, int i2, int i3) {
            return super.addColorTextureAttachment(i, i2, i3);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addDepthRenderBuffer(int i) {
            return super.addDepthRenderBuffer(i);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addDepthTextureAttachment(int i, int i2) {
            return super.addDepthTextureAttachment(i, i2);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addFloatAttachment(int i, int i2, int i3, boolean z) {
            return super.addFloatAttachment(i, i2, i3, z);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addStencilDepthPackedRenderBuffer(int i) {
            return super.addStencilDepthPackedRenderBuffer(i);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addStencilRenderBuffer(int i) {
            return super.addStencilRenderBuffer(i);
        }

        /* Return type fixed from 'com.badlogic.gdx.graphics.glutils.GLFrameBuffer$GLFrameBufferBuilder' to match base method */
        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public /* bridge */ /* synthetic */ GLFrameBufferBuilder<FrameBufferCubemap> addStencilTextureAttachment(int i, int i2) {
            return super.addStencilTextureAttachment(i, i2);
        }

        public FrameBufferCubemapBuilder(int i, int i2) {
            super(i, i2);
        }

        @Override // com.badlogic.gdx.graphics.glutils.GLFrameBuffer.GLFrameBufferBuilder
        public FrameBufferCubemap build() {
            return new FrameBufferCubemap(this);
        }
    }
}
