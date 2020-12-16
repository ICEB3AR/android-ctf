package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.utils.TextureDescriptor;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class CubemapAttribute extends Attribute {
    public static final long EnvironmentMap = register(EnvironmentMapAlias);
    public static final String EnvironmentMapAlias = "environmentCubemap";
    protected static long Mask = EnvironmentMap;
    public final TextureDescriptor<Cubemap> textureDescription;

    public static final boolean is(long j) {
        return (j & Mask) != 0;
    }

    public CubemapAttribute(long j) {
        super(j);
        if (is(j)) {
            this.textureDescription = new TextureDescriptor<>();
            return;
        }
        throw new GdxRuntimeException("Invalid type specified");
    }

    public <T extends Cubemap> CubemapAttribute(long j, TextureDescriptor<T> textureDescriptor) {
        this(j);
        this.textureDescription.set(textureDescriptor);
    }

    public CubemapAttribute(long j, Cubemap cubemap) {
        this(j);
        this.textureDescription.texture = cubemap;
    }

    public CubemapAttribute(CubemapAttribute cubemapAttribute) {
        this(cubemapAttribute.type, cubemapAttribute.textureDescription);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public Attribute copy() {
        return new CubemapAttribute(this);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public int hashCode() {
        return (super.hashCode() * 967) + this.textureDescription.hashCode();
    }

    public int compareTo(Attribute attribute) {
        if (this.type != attribute.type) {
            return (int) (this.type - attribute.type);
        }
        return this.textureDescription.compareTo(((CubemapAttribute) attribute).textureDescription);
    }
}
