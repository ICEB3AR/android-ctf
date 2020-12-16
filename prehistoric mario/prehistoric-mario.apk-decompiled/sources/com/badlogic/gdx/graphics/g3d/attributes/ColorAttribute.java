package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class ColorAttribute extends Attribute {
    public static final long Ambient = register(AmbientAlias);
    public static final String AmbientAlias = "ambientColor";
    public static final long AmbientLight = register(AmbientLightAlias);
    public static final String AmbientLightAlias = "ambientLightColor";
    public static final long Diffuse = register(DiffuseAlias);
    public static final String DiffuseAlias = "diffuseColor";
    public static final long Emissive = register(EmissiveAlias);
    public static final String EmissiveAlias = "emissiveColor";
    public static final long Fog = register(FogAlias);
    public static final String FogAlias = "fogColor";
    protected static long Mask = ((((((Ambient | Diffuse) | Specular) | Emissive) | Reflection) | AmbientLight) | Fog);
    public static final long Reflection = register(ReflectionAlias);
    public static final String ReflectionAlias = "reflectionColor";
    public static final long Specular = register(SpecularAlias);
    public static final String SpecularAlias = "specularColor";
    public final Color color;

    public static final boolean is(long j) {
        return (j & Mask) != 0;
    }

    public static final ColorAttribute createAmbient(Color color2) {
        return new ColorAttribute(Ambient, color2);
    }

    public static final ColorAttribute createAmbient(float f, float f2, float f3, float f4) {
        return new ColorAttribute(Ambient, f, f2, f3, f4);
    }

    public static final ColorAttribute createDiffuse(Color color2) {
        return new ColorAttribute(Diffuse, color2);
    }

    public static final ColorAttribute createDiffuse(float f, float f2, float f3, float f4) {
        return new ColorAttribute(Diffuse, f, f2, f3, f4);
    }

    public static final ColorAttribute createSpecular(Color color2) {
        return new ColorAttribute(Specular, color2);
    }

    public static final ColorAttribute createSpecular(float f, float f2, float f3, float f4) {
        return new ColorAttribute(Specular, f, f2, f3, f4);
    }

    public static final ColorAttribute createReflection(Color color2) {
        return new ColorAttribute(Reflection, color2);
    }

    public static final ColorAttribute createReflection(float f, float f2, float f3, float f4) {
        return new ColorAttribute(Reflection, f, f2, f3, f4);
    }

    public ColorAttribute(long j) {
        super(j);
        this.color = new Color();
        if (!is(j)) {
            throw new GdxRuntimeException("Invalid type specified");
        }
    }

    public ColorAttribute(long j, Color color2) {
        this(j);
        if (color2 != null) {
            this.color.set(color2);
        }
    }

    public ColorAttribute(long j, float f, float f2, float f3, float f4) {
        this(j);
        this.color.set(f, f2, f3, f4);
    }

    public ColorAttribute(ColorAttribute colorAttribute) {
        this(colorAttribute.type, colorAttribute.color);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public Attribute copy() {
        return new ColorAttribute(this);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public int hashCode() {
        return (super.hashCode() * 953) + this.color.toIntBits();
    }

    public int compareTo(Attribute attribute) {
        if (this.type != attribute.type) {
            return (int) (this.type - attribute.type);
        }
        return ((ColorAttribute) attribute).color.toIntBits() - this.color.toIntBits();
    }
}
