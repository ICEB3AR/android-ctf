package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class PrismaticJoint extends Joint {
    private final Vector2 localAnchorA = new Vector2();
    private final Vector2 localAnchorB = new Vector2();
    private final Vector2 localAxisA = new Vector2();
    private final float[] tmp = new float[2];

    private native void jniEnableLimit(long j, boolean z);

    private native void jniEnableMotor(long j, boolean z);

    private native float jniGetJointSpeed(long j);

    private native float jniGetJointTranslation(long j);

    private native void jniGetLocalAnchorA(long j, float[] fArr);

    private native void jniGetLocalAnchorB(long j, float[] fArr);

    private native void jniGetLocalAxisA(long j, float[] fArr);

    private native float jniGetLowerLimit(long j);

    private native float jniGetMaxMotorForce(long j);

    private native float jniGetMotorForce(long j, float f);

    private native float jniGetMotorSpeed(long j);

    private native float jniGetReferenceAngle(long j);

    private native float jniGetUpperLimit(long j);

    private native boolean jniIsLimitEnabled(long j);

    private native boolean jniIsMotorEnabled(long j);

    private native void jniSetLimits(long j, float f, float f2);

    private native void jniSetMaxMotorForce(long j, float f);

    private native void jniSetMotorSpeed(long j, float f);

    public PrismaticJoint(World world, long j) {
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

    public Vector2 getLocalAxisA() {
        jniGetLocalAxisA(this.addr, this.tmp);
        Vector2 vector2 = this.localAxisA;
        float[] fArr = this.tmp;
        vector2.set(fArr[0], fArr[1]);
        return this.localAxisA;
    }

    public float getJointTranslation() {
        return jniGetJointTranslation(this.addr);
    }

    public float getJointSpeed() {
        return jniGetJointSpeed(this.addr);
    }

    public boolean isLimitEnabled() {
        return jniIsLimitEnabled(this.addr);
    }

    public void enableLimit(boolean z) {
        jniEnableLimit(this.addr, z);
    }

    public float getLowerLimit() {
        return jniGetLowerLimit(this.addr);
    }

    public float getUpperLimit() {
        return jniGetUpperLimit(this.addr);
    }

    public void setLimits(float f, float f2) {
        jniSetLimits(this.addr, f, f2);
    }

    public boolean isMotorEnabled() {
        return jniIsMotorEnabled(this.addr);
    }

    public void enableMotor(boolean z) {
        jniEnableMotor(this.addr, z);
    }

    public void setMotorSpeed(float f) {
        jniSetMotorSpeed(this.addr, f);
    }

    public float getMotorSpeed() {
        return jniGetMotorSpeed(this.addr);
    }

    public void setMaxMotorForce(float f) {
        jniSetMaxMotorForce(this.addr, f);
    }

    public float getMotorForce(float f) {
        return jniGetMotorForce(this.addr, f);
    }

    public float getMaxMotorForce() {
        return jniGetMaxMotorForce(this.addr);
    }

    public float getReferenceAngle() {
        return jniGetReferenceAngle(this.addr);
    }
}
