package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Shape;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class Fixture {
    protected long addr;
    private Body body;
    private final Filter filter = new Filter();
    protected Shape shape;
    private final short[] tmp = new short[3];
    protected Object userData;

    private native float jniGetDensity(long j);

    private native void jniGetFilterData(long j, short[] sArr);

    private native float jniGetFriction(long j);

    private native float jniGetRestitution(long j);

    private native long jniGetShape(long j);

    private native int jniGetType(long j);

    private native boolean jniIsSensor(long j);

    private native void jniRefilter(long j);

    private native void jniSetDensity(long j, float f);

    private native void jniSetFilterData(long j, short s, short s2, short s3);

    private native void jniSetFriction(long j, float f);

    private native void jniSetRestitution(long j, float f);

    private native void jniSetSensor(long j, boolean z);

    private native boolean jniTestPoint(long j, float f, float f2);

    protected Fixture(Body body2, long j) {
        this.body = body2;
        this.addr = j;
    }

    /* access modifiers changed from: protected */
    public void reset(Body body2, long j) {
        this.body = body2;
        this.addr = j;
        this.shape = null;
        this.userData = null;
    }

    public Shape.Type getType() {
        int jniGetType = jniGetType(this.addr);
        if (jniGetType == 0) {
            return Shape.Type.Circle;
        }
        if (jniGetType == 1) {
            return Shape.Type.Edge;
        }
        if (jniGetType == 2) {
            return Shape.Type.Polygon;
        }
        if (jniGetType == 3) {
            return Shape.Type.Chain;
        }
        throw new GdxRuntimeException("Unknown shape type!");
    }

    public Shape getShape() {
        if (this.shape == null) {
            long jniGetShape = jniGetShape(this.addr);
            if (jniGetShape != 0) {
                int jniGetType = Shape.jniGetType(jniGetShape);
                if (jniGetType == 0) {
                    this.shape = new CircleShape(jniGetShape);
                } else if (jniGetType == 1) {
                    this.shape = new EdgeShape(jniGetShape);
                } else if (jniGetType == 2) {
                    this.shape = new PolygonShape(jniGetShape);
                } else if (jniGetType == 3) {
                    this.shape = new ChainShape(jniGetShape);
                } else {
                    throw new GdxRuntimeException("Unknown shape type!");
                }
            } else {
                throw new GdxRuntimeException("Null shape address!");
            }
        }
        return this.shape;
    }

    public void setSensor(boolean z) {
        jniSetSensor(this.addr, z);
    }

    public boolean isSensor() {
        return jniIsSensor(this.addr);
    }

    public void setFilterData(Filter filter2) {
        jniSetFilterData(this.addr, filter2.categoryBits, filter2.maskBits, filter2.groupIndex);
    }

    public Filter getFilterData() {
        jniGetFilterData(this.addr, this.tmp);
        Filter filter2 = this.filter;
        short[] sArr = this.tmp;
        filter2.maskBits = sArr[0];
        filter2.categoryBits = sArr[1];
        filter2.groupIndex = sArr[2];
        return filter2;
    }

    public void refilter() {
        jniRefilter(this.addr);
    }

    public Body getBody() {
        return this.body;
    }

    public boolean testPoint(Vector2 vector2) {
        return jniTestPoint(this.addr, vector2.x, vector2.y);
    }

    public boolean testPoint(float f, float f2) {
        return jniTestPoint(this.addr, f, f2);
    }

    public void setDensity(float f) {
        jniSetDensity(this.addr, f);
    }

    public float getDensity() {
        return jniGetDensity(this.addr);
    }

    public float getFriction() {
        return jniGetFriction(this.addr);
    }

    public void setFriction(float f) {
        jniSetFriction(this.addr, f);
    }

    public float getRestitution() {
        return jniGetRestitution(this.addr);
    }

    public void setRestitution(float f) {
        jniSetRestitution(this.addr, f);
    }

    public void setUserData(Object obj) {
        this.userData = obj;
    }

    public Object getUserData() {
        return this.userData;
    }
}
