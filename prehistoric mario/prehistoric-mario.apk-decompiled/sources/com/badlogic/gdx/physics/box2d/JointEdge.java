package com.badlogic.gdx.physics.box2d;

public class JointEdge {
    public final Joint joint;
    public final Body other;

    protected JointEdge(Body body, Joint joint2) {
        this.other = body;
        this.joint = joint2;
    }
}
