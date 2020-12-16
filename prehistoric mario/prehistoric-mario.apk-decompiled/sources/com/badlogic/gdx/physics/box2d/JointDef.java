package com.badlogic.gdx.physics.box2d;

public class JointDef {
    public Body bodyA = null;
    public Body bodyB = null;
    public boolean collideConnected = false;
    public JointType type = JointType.Unknown;

    public enum JointType {
        Unknown(0),
        RevoluteJoint(1),
        PrismaticJoint(2),
        DistanceJoint(3),
        PulleyJoint(4),
        MouseJoint(5),
        GearJoint(6),
        WheelJoint(7),
        WeldJoint(8),
        FrictionJoint(9),
        RopeJoint(10),
        MotorJoint(11);
        
        public static JointType[] valueTypes = {Unknown, RevoluteJoint, PrismaticJoint, DistanceJoint, PulleyJoint, MouseJoint, GearJoint, WheelJoint, WeldJoint, FrictionJoint, RopeJoint, MotorJoint};
        private int value;

        private JointType(int i) {
            this.value = i;
        }

        public int getValue() {
            return this.value;
        }
    }
}
