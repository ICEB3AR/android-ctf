package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;

public class IndexBufferObjectSubData implements IndexData {
    final ShortBuffer buffer;
    int bufferHandle;
    final ByteBuffer byteBuffer;
    boolean isBound = false;
    final boolean isDirect;
    boolean isDirty = true;
    final int usage;

    public IndexBufferObjectSubData(boolean z, int i) {
        this.byteBuffer = BufferUtils.newByteBuffer(i * 2);
        this.isDirect = true;
        this.usage = z ? GL20.GL_STATIC_DRAW : GL20.GL_DYNAMIC_DRAW;
        this.buffer = this.byteBuffer.asShortBuffer();
        this.buffer.flip();
        this.byteBuffer.flip();
        this.bufferHandle = createBufferObject();
    }

    public IndexBufferObjectSubData(int i) {
        this.byteBuffer = BufferUtils.newByteBuffer(i * 2);
        this.isDirect = true;
        this.usage = GL20.GL_STATIC_DRAW;
        this.buffer = this.byteBuffer.asShortBuffer();
        this.buffer.flip();
        this.byteBuffer.flip();
        this.bufferHandle = createBufferObject();
    }

    private int createBufferObject() {
        int glGenBuffer = Gdx.gl20.glGenBuffer();
        Gdx.gl20.glBindBuffer(GL20.GL_ELEMENT_ARRAY_BUFFER, glGenBuffer);
        Gdx.gl20.glBufferData(GL20.GL_ELEMENT_ARRAY_BUFFER, this.byteBuffer.capacity(), null, this.usage);
        Gdx.gl20.glBindBuffer(GL20.GL_ELEMENT_ARRAY_BUFFER, 0);
        return glGenBuffer;
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public int getNumIndices() {
        return this.buffer.limit();
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public int getNumMaxIndices() {
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
            Gdx.gl20.glBufferSubData(GL20.GL_ELEMENT_ARRAY_BUFFER, 0, this.byteBuffer.limit(), this.byteBuffer);
            this.isDirty = false;
        }
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public void setIndices(ShortBuffer shortBuffer) {
        int position = shortBuffer.position();
        this.isDirty = true;
        this.buffer.clear();
        this.buffer.put(shortBuffer);
        this.buffer.flip();
        shortBuffer.position(position);
        this.byteBuffer.position(0);
        this.byteBuffer.limit(this.buffer.limit() << 1);
        if (this.isBound) {
            Gdx.gl20.glBufferSubData(GL20.GL_ELEMENT_ARRAY_BUFFER, 0, this.byteBuffer.limit(), this.byteBuffer);
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
            Gdx.gl20.glBufferSubData(GL20.GL_ELEMENT_ARRAY_BUFFER, 0, this.byteBuffer.limit(), this.byteBuffer);
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
                Gdx.gl20.glBufferSubData(GL20.GL_ELEMENT_ARRAY_BUFFER, 0, this.byteBuffer.limit(), this.byteBuffer);
                this.isDirty = false;
            }
            this.isBound = true;
            return;
        }
        throw new GdxRuntimeException("IndexBufferObject cannot be used after it has been disposed.");
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public void unbind() {
        Gdx.gl20.glBindBuffer(GL20.GL_ELEMENT_ARRAY_BUFFER, 0);
        this.isBound = false;
    }

    @Override // com.badlogic.gdx.graphics.glutils.IndexData
    public void invalidate() {
        this.bufferHandle = createBufferObject();
        this.isDirty = true;
    }

    @Override // com.badlogic.gdx.utils.Disposable, com.badlogic.gdx.graphics.glutils.IndexData
    public void dispose() {
        GL20 gl20 = Gdx.gl20;
        gl20.glBindBuffer(GL20.GL_ELEMENT_ARRAY_BUFFER, 0);
        gl20.glDeleteBuffer(this.bufferHandle);
        this.bufferHandle = 0;
    }
}
