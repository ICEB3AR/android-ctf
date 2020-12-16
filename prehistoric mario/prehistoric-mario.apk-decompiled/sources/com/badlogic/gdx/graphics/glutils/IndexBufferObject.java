package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;

public class IndexBufferObject implements IndexData {
    final ShortBuffer buffer;
    int bufferHandle;
    final ByteBuffer byteBuffer;
    private final boolean empty;
    boolean isBound;
    final boolean isDirect;
    boolean isDirty;
    final boolean ownsBuffer;
    final int usage;

    public IndexBufferObject(int i) {
        this(true, i);
    }

    public IndexBufferObject(boolean z, int i) {
        this.isDirty = true;
        boolean z2 = false;
        this.isBound = false;
        this.empty = i == 0 ? true : z2;
        this.byteBuffer = BufferUtils.newUnsafeByteBuffer((this.empty ? 1 : i) * 2);
        this.isDirect = true;
        this.buffer = this.byteBuffer.asShortBuffer();
        this.ownsBuffer = true;
        this.buffer.flip();
        this.byteBuffer.flip();
        this.bufferHandle = Gdx.gl20.glGenBuffer();
        this.usage = z ? GL20.GL_STATIC_DRAW : GL20.GL_DYNAMIC_DRAW;
    }

    public IndexBufferObject(boolean z, ByteBuffer byteBuffer2) {
        this.isDirty = true;
        this.isBound = false;
        this.empty = byteBuffer2.limit() == 0;
        this.byteBuffer = byteBuffer2;
        this.isDirect = true;
        this.buffer = this.byteBuffer.asShortBuffer();
        this.ownsBuffer = false;
        this.bufferHandle = Gdx.gl20.glGenBuffer();
        this.usage = z ? GL20.GL_STATIC_DRAW : GL20.GL_DYNAMIC_DRAW;
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public int getNumIndices() {
        if (this.empty) {
            return 0;
        }
        return this.buffer.limit();
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public int getNumMaxIndices() {
        if (this.empty) {
            return 0;
        }
        return this.buffer.capacity();
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public void setIndices(short[] sArr, int i, int i2) {
        this.isDirty = true;
        this.buffer.clear();
        this.buffer.put(sArr, i, i2);
        this.buffer.flip();
        this.byteBuffer.position(0);
        this.byteBuffer.limit(i2 << 1);
        if (this.isBound) {
            Gdx.gl20.glBufferData(GL20.GL_ELEMENT_ARRAY_BUFFER, this.byteBuffer.limit(), this.byteBuffer, this.usage);
            this.isDirty = false;
        }
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public void setIndices(ShortBuffer shortBuffer) {
        this.isDirty = true;
        int position = shortBuffer.position();
        this.buffer.clear();
        this.buffer.put(shortBuffer);
        this.buffer.flip();
        shortBuffer.position(position);
        this.byteBuffer.position(0);
        this.byteBuffer.limit(this.buffer.limit() << 1);
        if (this.isBound) {
            Gdx.gl20.glBufferData(GL20.GL_ELEMENT_ARRAY_BUFFER, this.byteBuffer.limit(), this.byteBuffer, this.usage);
            this.isDirty = false;
        }
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public void updateIndices(int i, short[] sArr, int i2, int i3) {
        this.isDirty = true;
        int position = this.byteBuffer.position();
        this.byteBuffer.position(i * 2);
        BufferUtils.copy(sArr, i2, (Buffer) this.byteBuffer, i3);
        this.byteBuffer.position(position);
        this.buffer.position(0);
        if (this.isBound) {
            Gdx.gl20.glBufferData(GL20.GL_ELEMENT_ARRAY_BUFFER, this.byteBuffer.limit(), this.byteBuffer, this.usage);
            this.isDirty = false;
        }
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public ShortBuffer getBuffer() {
        this.isDirty = true;
        return this.buffer;
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public void bind() {
        if (this.bufferHandle != 0) {
            Gdx.gl20.glBindBuffer(GL20.GL_ELEMENT_ARRAY_BUFFER, this.bufferHandle);
            if (this.isDirty) {
                this.byteBuffer.limit(this.buffer.limit() * 2);
                Gdx.gl20.glBufferData(GL20.GL_ELEMENT_ARRAY_BUFFER, this.byteBuffer.limit(), this.byteBuffer, this.usage);
                this.isDirty = false;
            }
            this.isBound = true;
            return;
        }
        throw new GdxRuntimeException("No buffer allocated!");
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public void unbind() {
        Gdx.gl20.glBindBuffer(GL20.GL_ELEMENT_ARRAY_BUFFER, 0);
        this.isBound = false;
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public void invalidate() {
        this.bufferHandle = Gdx.gl20.glGenBuffer();
        this.isDirty = true;
    }

    @Override // com.badlogic.gdx.utils.Disposable, com.badlogic.gdx.graphics.glutils.IndexData
    public void dispose() {
        Gdx.gl20.glBindBuffer(GL20.GL_ELEMENT_ARRAY_BUFFER, 0);
        Gdx.gl20.glDeleteBuffer(this.bufferHandle);
        this.bufferHandle = 0;
        if (this.ownsBuffer) {
            BufferUtils.disposeUnsafeByteBuffer(this.byteBuffer);
        }
    }
}
