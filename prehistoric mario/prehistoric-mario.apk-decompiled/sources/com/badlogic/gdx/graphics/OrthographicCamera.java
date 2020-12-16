package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;

public class OrthographicCamera extends Camera {
    private final Vector3 tmp = new Vector3();
    public float zoom = 1.0f;

    public OrthographicCamera() {
        this.near = 0.0f;
    }

    public OrthographicCamera(float f, float f2) {
        this.viewportWidth = f;
        this.viewportHeight = f2;
        this.near = 0.0f;
        update();
    }

    @Override // com.badlogic.gdx.graphics.Camera
    public void update() {
        update(true);
    }

    @Override // com.badlogic.gdx.graphics.Camera
    public void update(boolean z) {
        this.projection.setToOrtho((this.zoom * (-this.viewportWidth)) / 2.0f, this.zoom * (this.viewportWidth / 2.0f), this.zoom * (-(this.viewportHeight / 2.0f)), (this.zoom * this.viewportHeight) / 2.0f, this.near, this.far);
        this.view.setToLookAt(this.position, this.tmp.set(this.position).add(this.direction), this.up);
        this.combined.set(this.projection);
        Matrix4.mul(this.combined.val, this.view.val);
        if (z) {
            this.invProjectionView.set(this.combined);
            Matrix4.inv(this.invProjectionView.val);
            this.frustum.update(this.invProjectionView);
        }
    }

    public void setToOrtho(boolean z) {
        setToOrtho(z, (float) Gdx.graphics.getWidth(), (float) Gdx.graphics.getHeight());
    }

    public void setToOrtho(boolean z, float f, float f2) {
        if (z) {
            this.up.set(0.0f, -1.0f, 0.0f);
            this.direction.set(0.0f, 0.0f, 1.0f);
        } else {
            this.up.set(0.0f, 1.0f, 0.0f);
            this.direction.set(0.0f, 0.0f, -1.0f);
        }
        Vector3 vector3 = this.position;
        float f3 = this.zoom;
        vector3.set((f3 * f) / 2.0f, (f3 * f2) / 2.0f, 0.0f);
        this.viewportWidth = f;
        this.viewportHeight = f2;
        update();
    }

    public void rotate(float f) {
        rotate(this.direction, f);
    }

    public void translate(float f, float f2) {
        translate(f, f2, 0.0f);
    }

    public void translate(Vector2 vector2) {
        translate(vector2.x, vector2.y, 0.0f);
    }
}
