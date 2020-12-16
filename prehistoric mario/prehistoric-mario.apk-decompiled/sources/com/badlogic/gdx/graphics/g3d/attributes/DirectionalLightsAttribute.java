package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.environment.DirectionalLight;
import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public class DirectionalLightsAttribute extends Attribute {
    public static final String Alias = "directionalLights";
    public static final long Type = register(Alias);
    public final Array<DirectionalLight> lights;

    public static final boolean is(long j) {
        return (Type & j) == j;
    }

    public DirectionalLightsAttribute() {
        super(Type);
        this.lights = new Array<>(1);
    }

    public DirectionalLightsAttribute(DirectionalLightsAttribute directionalLightsAttribute) {
        this();
        this.lights.addAll(directionalLightsAttribute.lights);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public DirectionalLightsAttribute copy() {
        return new DirectionalLightsAttribute(this);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public int hashCode() {
        int i;
        int hashCode = super.hashCode();
        Iterator<DirectionalLight> it = this.lights.iterator();
        while (it.hasNext()) {
            DirectionalLight next = it.next();
            int i2 = hashCode * 1229;
            if (next == null) {
                i = 0;
            } else {
                i = next.hashCode();
            }
            hashCode = i2 + i;
        }
        return hashCode;
    }

    public int compareTo(Attribute attribute) {
        if (this.type != attribute.type) {
            return this.type < attribute.type ? -1 : 1;
        }
        return 0;
    }
}
