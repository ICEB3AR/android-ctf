package com.uwsoft.editor.renderer.data;

public class PhysicsPropertiesVO {
    public boolean enabled;
    public float gravityX;
    public float gravityY;
    public float sleepVelocity;

    public PhysicsPropertiesVO() {
        this.gravityX = 0.0f;
        this.gravityY = 0.0f;
        this.sleepVelocity = 0.0f;
        this.enabled = false;
    }

    public PhysicsPropertiesVO(PhysicsPropertiesVO physicsPropertiesVO) {
        this.gravityX = physicsPropertiesVO.gravityX;
        this.gravityY = physicsPropertiesVO.gravityY;
        this.sleepVelocity = physicsPropertiesVO.sleepVelocity;
        this.enabled = physicsPropertiesVO.enabled;
    }
}
