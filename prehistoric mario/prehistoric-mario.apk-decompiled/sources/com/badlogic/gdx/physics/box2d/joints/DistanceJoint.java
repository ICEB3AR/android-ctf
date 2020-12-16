package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class DistanceJoint extends Joint {
    private final Vector2 localAnchorA = new Vector2();
    private final Vector2 localAnchorB = new Vector2();
    private final float[] tmp = new float[2];

    private native float jniGetDampingRatio(long j);

    private native float jniGetFrequency(long j);

    private native float jniGetLength(long j);

    private native void jniGetLocalAnchorA(long j, float[] fArr);

    private native void jniGetLocalAnchorB(long j, float[] fArr);

    private native void jniSetDampingRatio(long j, float f);

    private native void jniSetFrequency(long j, float f);

    private native void jniSetLength(long j, float f);

    public DistanceJoint(World world, long j) {
        super(world, j);
    }

    public Vector2 getLocalAnchorA() {
        jniGetLocalAnchorA(this.addr, this.tmp);
        Vector2 vector2 = this.localAnchorA;
        float[] fArr = this.tmp;
        vector2.set(fArr[0], fArr[1]);
        return this.localAnchorA;
    }

    public Vector2 getLocalAnchorB() {
        jniGetLocalAnchorB(this.addr, this.tmp);
        Vector2 vector2 = this.localAnchorB;
        float[] fArr = this.tmp;
        vector2.set(fArr[0], fArr[1]);
        return this.localAnchorB;
    }

    public void setLength(float f) {
        jniSetLength(this.addr, f);
    }

    public float getLength() {
        return jniGetLength(this.addr);
    }

    public void setFrequency(float f) {
        jniSetFrequency(this.addr, f);
    }

    public float getFrequency() {
        return jniGetFrequency(this.addr);
    }

    public void setDampingRatio(float f) {
        jniSetDampingRatio(this.addr, f);
    }

    public float getDampingRatio() {
        return jniGetDampingRatio(this.addr);
    }
}
