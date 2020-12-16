package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class FrictionJoint extends Joint {
    private final Vector2 localAnchorA = new Vector2();
    private final Vector2 localAnchorB = new Vector2();
    private final float[] tmp = new float[2];

    private native void jniGetLocalAnchorA(long j, float[] fArr);

    private native void jniGetLocalAnchorB(long j, float[] fArr);

    private native float jniGetMaxForce(long j);

    private native float jniGetMaxTorque(long j);

    private native void jniSetMaxForce(long j, float f);

    private native void jniSetMaxTorque(long j, float f);

    public FrictionJoint(World world, long j) {
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

    public void setMaxForce(float f) {
        jniSetMaxForce(this.addr, f);
    }

    public float getMaxForce() {
        return jniGetMaxForce(this.addr);
    }

    public void setMaxTorque(float f) {
        jniSetMaxTorque(this.addr, f);
    }

    public float getMaxTorque() {
        return jniGetMaxTorque(this.addr);
    }
}
