package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.utils.BufferUtils;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;

public class VertexArray implements VertexData {
    final VertexAttributes attributes;
    final FloatBuffer buffer;
    final ByteBuffer byteBuffer;
    boolean isBound;

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public void invalidate() {
    }

    public VertexArray(int i, VertexAttribute... vertexAttributeArr) {
        this(i, new VertexAttributes(vertexAttributeArr));
    }

    public VertexArray(int i, VertexAttributes vertexAttributes) {
        this.isBound = false;
        this.attributes = vertexAttributes;
        this.byteBuffer = BufferUtils.newUnsafeByteBuffer(this.attributes.vertexSize * i);
        this.buffer = this.byteBuffer.asFloatBuffer();
        this.buffer.flip();
        this.byteBuffer.flip();
    }

    @Override // com.badlogic.gdx.utils.Disposable, com.badlogic.gdx.graphics.glutils.VertexData
    public void dispose() {
        BufferUtils.disposeUnsafeByteBuffer(this.byteBuffer);
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public FloatBuffer getBuffer() {
        return this.buffer;
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public int getNumVertices() {
        return (this.buffer.limit() * 4) / this.attributes.vertexSize;
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public int getNumMaxVertices() {
        return this.byteBuffer.capacity() / this.attributes.vertexSize;
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public void setVertices(float[] fArr, int i, int i2) {
        BufferUtils.copy(fArr, this.byteBuffer, i2, i);
        this.buffer.position(0);
        this.buffer.limit(i2);
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public void updateVertices(int i, float[] fArr, int i2, int i3) {
        int position = this.byteBuffer.position();
        this.byteBuffer.position(i * 4);
        BufferUtils.copy(fArr, i2, i3, (Buffer) this.byteBuffer);
        this.byteBuffer.position(position);
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public void bind(ShaderProgram shaderProgram) {
        bind(shaderProgram, null);
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public void bind(ShaderProgram shaderProgram, int[] iArr) {
        int size = this.attributes.size();
        this.byteBuffer.limit(this.buffer.limit() * 4);
        int i = 0;
        if (iArr == null) {
            while (i < size) {
                VertexAttribute vertexAttribute = this.attributes.get(i);
                int attributeLocation = shaderProgram.getAttributeLocation(vertexAttribute.alias);
                if (attributeLocation >= 0) {
                    shaderProgram.enableVertexAttribute(attributeLocation);
                    if (vertexAttribute.type == 5126) {
                        this.buffer.position(vertexAttribute.offset / 4);
                        shaderProgram.setVertexAttribute(attributeLocation, vertexAttribute.numComponents, vertexAttribute.type, vertexAttribute.normalized, this.attributes.vertexSize, this.buffer);
                    } else {
                        this.byteBuffer.position(vertexAttribute.offset);
                        shaderProgram.setVertexAttribute(attributeLocation, vertexAttribute.numComponents, vertexAttribute.type, vertexAttribute.normalized, this.attributes.vertexSize, this.byteBuffer);
                    }
                }
                i++;
            }
        } else {
            while (i < size) {
                VertexAttribute vertexAttribute2 = this.attributes.get(i);
                int i2 = iArr[i];
                if (i2 >= 0) {
                    shaderProgram.enableVertexAttribute(i2);
                    if (vertexAttribute2.type == 5126) {
                        this.buffer.position(vertexAttribute2.offset / 4);
                        shaderProgram.setVertexAttribute(i2, vertexAttribute2.numComponents, vertexAttribute2.type, vertexAttribute2.normalized, this.attributes.vertexSize, this.buffer);
                    } else {
                        this.byteBuffer.position(vertexAttribute2.offset);
                        shaderProgram.setVertexAttribute(i2, vertexAttribute2.numComponents, vertexAttribute2.type, vertexAttribute2.normalized, this.attributes.vertexSize, this.byteBuffer);
                    }
                }
                i++;
            }
        }
        this.isBound = true;
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public void unbind(ShaderProgram shaderProgram) {
        unbind(shaderProgram, null);
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public void unbind(ShaderProgram shaderProgram, int[] iArr) {
        int size = this.attributes.size();
        if (iArr == null) {
            for (int i = 0; i < size; i++) {
                shaderProgram.disableVertexAttribute(this.attributes.get(i).alias);
            }
        } else {
            for (int i2 = 0; i2 < size; i2++) {
                int i3 = iArr[i2];
                if (i3 >= 0) {
                    shaderProgram.disableVertexAttribute(i3);
                }
            }
        }
        this.isBound = false;
    }

    @Override // com.badlogic.gdx.graphics.glutils.VertexData
    public VertexAttributes getAttributes() {
        return this.attributes;
    }
}
