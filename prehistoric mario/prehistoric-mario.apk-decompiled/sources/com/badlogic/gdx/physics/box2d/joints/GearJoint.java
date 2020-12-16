package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.World;

public class GearJoint extends Joint {
    private Joint joint1;
    private Joint joint2;

    private native long jniGetJoint1(long j);

    private native long jniGetJoint2(long j);

    private native float jniGetRatio(long j);

    private native void jniSetRatio(long j, float f);

    public GearJoint(World world, long j, Joint joint, Joint joint3) {
        super(world, j);
        this.joint1 = joint;
        this.joint2 = joint3;
    }

    public Joint getJoint1() {
        return this.joint1;
    }

    public Joint getJoint2() {
        return this.joint2;
    }

    public void setRatio(float f) {
        jniSetRatio(this.addr, f);
    }

    public float getRatio() {
        return jniGetRatio(this.addr);
    }
}
