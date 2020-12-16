package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;

public class IntAttribute extends Attribute {
    public static final long CullFace = register(CullFaceAlias);
    public static final String CullFaceAlias = "cullface";
    public int value;

    public static IntAttribute createCullFace(int i) {
        return new IntAttribute(CullFace, i);
    }

    public IntAttribute(long j) {
        super(j);
    }

    public IntAttribute(long j, int i) {
        super(j);
        this.value = i;
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public Attribute copy() {
        return new IntAttribute(this.type, this.value);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public int hashCode() {
        return (super.hashCode() * 983) + this.value;
    }

    public int compareTo(Attribute attribute) {
        if (this.type != attribute.type) {
            return (int) (this.type - attribute.type);
        }
        return this.value - ((IntAttribute) attribute).value;
    }
}
