package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;

public class Contact {
    protected long addr;
    private final float[] tmp = new float[8];
    protected World world;
    protected final WorldManifold worldManifold = new WorldManifold();

    private native int jniGetChildIndexA(long j);

    private native int jniGetChildIndexB(long j);

    private native long jniGetFixtureA(long j);

    private native long jniGetFixtureB(long j);

    private native float jniGetFriction(long j);

    private native float jniGetRestitution(long j);

    private native float jniGetTangentSpeed(long j);

    private native int jniGetWorldManifold(long j, float[] fArr);

    private native boolean jniIsEnabled(long j);

    private native boolean jniIsTouching(long j);

    private native void jniResetFriction(long j);

    private native void jniResetRestitution(long j);

    private native void jniSetEnabled(long j, boolean z);

    private native void jniSetFriction(long j, float f);

    private native void jniSetRestitution(long j, float f);

    private native void jniSetTangentSpeed(long j, float f);

    protected Contact(World world2, long j) {
        this.addr = j;
        this.world = world2;
    }

    public WorldManifold getWorldManifold() {
        int jniGetWorldManifold = jniGetWorldManifold(this.addr, this.tmp);
        WorldManifold worldManifold2 = this.worldManifold;
        worldManifold2.numContactPoints = jniGetWorldManifold;
        Vector2 vector2 = worldManifold2.normal;
        float[] fArr = this.tmp;
        vector2.set(fArr[0], fArr[1]);
        for (int i = 0; i < jniGetWorldManifold; i++) {
            Vector2 vector22 = this.worldManifold.points[i];
            float[] fArr2 = this.tmp;
            int i2 = (i * 2) + 2;
            vector22.x = fArr2[i2];
            vector22.y = fArr2[i2 + 1];
        }
        this.worldManifold.separations[0] = this.tmp[6];
        this.worldManifold.separations[1] = this.tmp[7];
        return this.worldManifold;
    }

    public boolean isTouching() {
        return jniIsTouching(this.addr);
    }

    public void setEnabled(boolean z) {
        jniSetEnabled(this.addr, z);
    }

    public boolean isEnabled() {
        return jniIsEnabled(this.addr);
    }

    public Fixture getFixtureA() {
        return this.world.fixtures.get(jniGetFixtureA(this.addr));
    }

    public Fixture getFixtureB() {
        return this.world.fixtures.get(jniGetFixtureB(this.addr));
    }

    public int getChildIndexA() {
        return jniGetChildIndexA(this.addr);
    }

    public int getChildIndexB() {
        return jniGetChildIndexB(this.addr);
    }

    public void setFriction(float f) {
        jniSetFriction(this.addr, f);
    }

    public float getFriction() {
        return jniGetFriction(this.addr);
    }

    public void resetFriction() {
        jniResetFriction(this.addr);
    }

    public void setRestitution(float f) {
        jniSetRestitution(this.addr, f);
    }

    public float getRestitution() {
        return jniGetRestitution(this.addr);
    }

    public void ResetRestitution() {
        jniResetRestitution(this.addr);
    }

    public float getTangentSpeed() {
        return jniGetTangentSpeed(this.addr);
    }

    public void setTangentSpeed(float f) {
        jniSetTangentSpeed(this.addr, f);
    }
}
