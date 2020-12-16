package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputAdapter;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.IntIntMap;

public class FirstPersonCameraController extends InputAdapter {
    private int BACKWARD = 47;
    private int DOWN = 33;
    private int FORWARD = 51;
    private int STRAFE_LEFT = 29;
    private int STRAFE_RIGHT = 32;
    private int UP = 45;
    private final Camera camera;
    private float degreesPerPixel = 0.5f;
    private final IntIntMap keys = new IntIntMap();
    private final Vector3 tmp = new Vector3();
    private float velocity = 5.0f;

    public FirstPersonCameraController(Camera camera2) {
        this.camera = camera2;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean keyDown(int i) {
        this.keys.put(i, i);
        return true;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean keyUp(int i) {
        this.keys.remove(i, 0);
        return true;
    }

    public void setVelocity(float f) {
        this.velocity = f;
    }

    public void setDegreesPerPixel(float f) {
        this.degreesPerPixel = f;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean touchDragged(int i, int i2, int i3) {
        float f = ((float) (-Gdx.input.getDeltaX())) * this.degreesPerPixel;
        float f2 = ((float) (-Gdx.input.getDeltaY())) * this.degreesPerPixel;
        this.camera.direction.rotate(this.camera.up, f);
        this.tmp.set(this.camera.direction).crs(this.camera.up).nor();
        this.camera.direction.rotate(this.tmp, f2);
        return true;
    }

    public void update() {
        update(Gdx.graphics.getDeltaTime());
    }

    public void update(float f) {
        if (this.keys.containsKey(this.FORWARD)) {
            this.tmp.set(this.camera.direction).nor().scl(this.velocity * f);
            this.camera.position.add(this.tmp);
        }
        if (this.keys.containsKey(this.BACKWARD)) {
            this.tmp.set(this.camera.direction).nor().scl((-f) * this.velocity);
            this.camera.position.add(this.tmp);
        }
        if (this.keys.containsKey(this.STRAFE_LEFT)) {
            this.tmp.set(this.camera.direction).crs(this.camera.up).nor().scl((-f) * this.velocity);
            this.camera.position.add(this.tmp);
        }
        if (this.keys.containsKey(this.STRAFE_RIGHT)) {
            this.tmp.set(this.camera.direction).crs(this.camera.up).nor().scl(this.velocity * f);
            this.camera.position.add(this.tmp);
        }
        if (this.keys.containsKey(this.UP)) {
            this.tmp.set(this.camera.up).nor().scl(this.velocity * f);
            this.camera.position.add(this.tmp);
        }
        if (this.keys.containsKey(this.DOWN)) {
            this.tmp.set(this.camera.up).nor().scl((-f) * this.velocity);
            this.camera.position.add(this.tmp);
        }
        this.camera.update(true);
    }
}
