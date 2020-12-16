package com.badlogic.gdx.graphics;

import com.badlogic.gdx.graphics.glutils.ShaderProgram;

public final class VertexAttribute {
    public String alias;
    public final boolean normalized;
    public final int numComponents;
    public int offset;
    public final int type;
    public int unit;
    public final int usage;
    private final int usageIndex;

    public VertexAttribute(int i, int i2, String str) {
        this(i, i2, str, 0);
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public VertexAttribute(int i, int i2, String str, int i3) {
        this(i, i2, i == 4 ? GL20.GL_UNSIGNED_BYTE : GL20.GL_FLOAT, i == 4, str, i3);
    }

    public VertexAttribute(int i, int i2, int i3, boolean z, String str) {
        this(i, i2, i3, z, str, 0);
    }

    public VertexAttribute(int i, int i2, int i3, boolean z, String str, int i4) {
        this.usage = i;
        this.numComponents = i2;
        this.type = i3;
        this.normalized = z;
        this.alias = str;
        this.unit = i4;
        this.usageIndex = Integer.numberOfTrailingZeros(i);
    }

    public VertexAttribute copy() {
        return new VertexAttribute(this.usage, this.numComponents, this.type, this.normalized, this.alias, this.unit);
    }

    public static VertexAttribute Position() {
        return new VertexAttribute(1, 3, ShaderProgram.POSITION_ATTRIBUTE);
    }

    public static VertexAttribute TexCoords(int i) {
        return new VertexAttribute(16, 2, ShaderProgram.TEXCOORD_ATTRIBUTE + i, i);
    }

    public static VertexAttribute Normal() {
        return new VertexAttribute(8, 3, ShaderProgram.NORMAL_ATTRIBUTE);
    }

    public static VertexAttribute ColorPacked() {
        return new VertexAttribute(4, 4, GL20.GL_UNSIGNED_BYTE, true, ShaderProgram.COLOR_ATTRIBUTE);
    }

    public static VertexAttribute ColorUnpacked() {
        return new VertexAttribute(2, 4, GL20.GL_FLOAT, false, ShaderProgram.COLOR_ATTRIBUTE);
    }

    public static VertexAttribute Tangent() {
        return new VertexAttribute(128, 3, ShaderProgram.TANGENT_ATTRIBUTE);
    }

    public static VertexAttribute Binormal() {
        return new VertexAttribute(256, 3, ShaderProgram.BINORMAL_ATTRIBUTE);
    }

    public static VertexAttribute BoneWeight(int i) {
        return new VertexAttribute(64, 2, ShaderProgram.BONEWEIGHT_ATTRIBUTE + i, i);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof VertexAttribute)) {
            return false;
        }
        return equals((VertexAttribute) obj);
    }

    public boolean equals(VertexAttribute vertexAttribute) {
        return vertexAttribute != null && this.usage == vertexAttribute.usage && this.numComponents == vertexAttribute.numComponents && this.type == vertexAttribute.type && this.normalized == vertexAttribute.normalized && this.alias.equals(vertexAttribute.alias) && this.unit == vertexAttribute.unit;
    }

    public int getKey() {
        return (this.usageIndex << 8) + (this.unit & 255);
    }

    public int getSizeInBytes() {
        int i = this.type;
        if (i == 5126 || i == 5132) {
            return this.numComponents * 4;
        }
        switch (i) {
            case GL20.GL_BYTE:
            case GL20.GL_UNSIGNED_BYTE:
                return this.numComponents;
            case GL20.GL_SHORT:
            case GL20.GL_UNSIGNED_SHORT:
                return this.numComponents * 2;
            default:
                return 0;
        }
    }

    public int hashCode() {
        return (((getKey() * 541) + this.numComponents) * 541) + this.alias.hashCode();
    }
}
