package com.uwsoft.editor.renderer.data;

import com.badlogic.gdx.math.Vector2;

public class PhysicsBodyDataVO {
    public boolean allowSleep;
    public boolean awake;
    public int bodyType;
    public boolean bullet;
    public Vector2 centerOfMass;
    public float damping;
    public float density;
    public float friction;
    public float gravityScale;
    public float mass;
    public float restitution;
    public float rotationalInertia;

    public PhysicsBodyDataVO() {
        this.bodyType = 0;
        this.centerOfMass = new Vector2();
    }

    public PhysicsBodyDataVO(PhysicsBodyDataVO physicsBodyDataVO) {
        this.bodyType = 0;
        this.bodyType = physicsBodyDataVO.bodyType;
        this.mass = physicsBodyDataVO.mass;
        this.centerOfMass = physicsBodyDataVO.centerOfMass.cpy();
        this.rotationalInertia = physicsBodyDataVO.rotationalInertia;
        this.damping = physicsBodyDataVO.damping;
        this.gravityScale = physicsBodyDataVO.gravityScale;
        this.allowSleep = physicsBodyDataVO.allowSleep;
        this.awake = physicsBodyDataVO.awake;
        this.bullet = physicsBodyDataVO.bullet;
        this.density = physicsBodyDataVO.density;
        this.friction = physicsBodyDataVO.friction;
        this.restitution = physicsBodyDataVO.restitution;
    }
}
