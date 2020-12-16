package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.environment.SpotLight;
import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public class SpotLightsAttribute extends Attribute {
    public static final String Alias = "spotLights";
    public static final long Type = register(Alias);
    public final Array<SpotLight> lights;

    public static final boolean is(long j) {
        return (Type & j) == j;
    }

    public SpotLightsAttribute() {
        super(Type);
        this.lights = new Array<>(1);
    }

    public SpotLightsAttribute(SpotLightsAttribute spotLightsAttribute) {
        this();
        this.lights.addAll(spotLightsAttribute.lights);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public SpotLightsAttribute copy() {
        return new SpotLightsAttribute(this);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public int hashCode() {
        int i;
        int hashCode = super.hashCode();
        Iterator<SpotLight> it = this.lights.iterator();
        while (it.hasNext()) {
            SpotLight next = it.next();
            int i2 = hashCode * 1237;
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
