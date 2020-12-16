package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.graphics.g3d.environment.PointLight;
import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public class PointLightsAttribute extends Attribute {
    public static final String Alias = "pointLights";
    public static final long Type = register(Alias);
    public final Array<PointLight> lights;

    public static final boolean is(long j) {
        return (Type & j) == j;
    }

    public PointLightsAttribute() {
        super(Type);
        this.lights = new Array<>(1);
    }

    public PointLightsAttribute(PointLightsAttribute pointLightsAttribute) {
        this();
        this.lights.addAll(pointLightsAttribute.lights);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public PointLightsAttribute copy() {
        return new PointLightsAttribute(this);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public int hashCode() {
        int i;
        int hashCode = super.hashCode();
        Iterator<PointLight> it = this.lights.iterator();
        while (it.hasNext()) {
            PointLight next = it.next();
            int i2 = hashCode * 1231;
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
