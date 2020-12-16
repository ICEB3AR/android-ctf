package com.badlogic.gdx.graphics.g3d.attributes;

import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.g3d.Attribute;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.NumberUtils;

public class DepthTestAttribute extends Attribute {
    public static final String Alias = "depthStencil";
    protected static long Mask = Type;
    public static final long Type = register(Alias);
    public int depthFunc;
    public boolean depthMask;
    public float depthRangeFar;
    public float depthRangeNear;

    public static final boolean is(long j) {
        return (j & Mask) != 0;
    }

    public DepthTestAttribute() {
        this((int) GL20.GL_LEQUAL);
    }

    public DepthTestAttribute(boolean z) {
        this(GL20.GL_LEQUAL, z);
    }

    public DepthTestAttribute(int i) {
        this(i, true);
    }

    public DepthTestAttribute(int i, boolean z) {
        this(i, 0.0f, 1.0f, z);
    }

    public DepthTestAttribute(int i, float f, float f2) {
        this(i, f, f2, true);
    }

    public DepthTestAttribute(int i, float f, float f2, boolean z) {
        this(Type, i, f, f2, z);
    }

    public DepthTestAttribute(long j, int i, float f, float f2, boolean z) {
        super(j);
        if (is(j)) {
            this.depthFunc = i;
            this.depthRangeNear = f;
            this.depthRangeFar = f2;
            this.depthMask = z;
            return;
        }
        throw new GdxRuntimeException("Invalid type specified");
    }

    public DepthTestAttribute(DepthTestAttribute depthTestAttribute) {
        this(depthTestAttribute.type, depthTestAttribute.depthFunc, depthTestAttribute.depthRangeNear, depthTestAttribute.depthRangeFar, depthTestAttribute.depthMask);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public Attribute copy() {
        return new DepthTestAttribute(this);
    }

    @Override // com.badlogic.gdx.graphics.g3d.Attribute
    public int hashCode() {
        return (((((((super.hashCode() * 971) + this.depthFunc) * 971) + NumberUtils.floatToRawIntBits(this.depthRangeNear)) * 971) + NumberUtils.floatToRawIntBits(this.depthRangeFar)) * 971) + (this.depthMask ? 1 : 0);
    }

    public int compareTo(Attribute attribute) {
        if (this.type != attribute.type) {
            return (int) (this.type - attribute.type);
        }
        DepthTestAttribute depthTestAttribute = (DepthTestAttribute) attribute;
        int i = this.depthFunc;
        int i2 = depthTestAttribute.depthFunc;
        if (i != i2) {
            return i - i2;
        }
        boolean z = this.depthMask;
        if (z != depthTestAttribute.depthMask) {
            return z ? -1 : 1;
        }
        if (!MathUtils.isEqual(this.depthRangeNear, depthTestAttribute.depthRangeNear)) {
            if (this.depthRangeNear < depthTestAttribute.depthRangeNear) {
                return -1;
            }
            return 1;
        } else if (MathUtils.isEqual(this.depthRangeFar, depthTestAttribute.depthRangeFar)) {
            return 0;
        } else {
            if (this.depthRangeFar < depthTestAttribute.depthRangeFar) {
                return -1;
            }
            return 1;
        }
    }
}
