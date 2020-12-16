package com.badlogic.gdx.utils.viewport;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.Scaling;

public class ExtendViewport extends Viewport {
    private float maxWorldHeight;
    private float maxWorldWidth;
    private float minWorldHeight;
    private float minWorldWidth;

    public ExtendViewport(float f, float f2) {
        this(f, f2, 0.0f, 0.0f, new OrthographicCamera());
    }

    public ExtendViewport(float f, float f2, Camera camera) {
        this(f, f2, 0.0f, 0.0f, camera);
    }

    public ExtendViewport(float f, float f2, float f3, float f4) {
        this(f, f2, f3, f4, new OrthographicCamera());
    }

    public ExtendViewport(float f, float f2, float f3, float f4, Camera camera) {
        this.minWorldWidth = f;
        this.minWorldHeight = f2;
        this.maxWorldWidth = f3;
        this.maxWorldHeight = f4;
        setCamera(camera);
    }

    @Override // com.badlogic.gdx.utils.viewport.Viewport
    public void update(int i, int i2, boolean z) {
        float f = this.minWorldWidth;
        float f2 = this.minWorldHeight;
        Vector2 apply = Scaling.fit.apply(f, f2, (float) i, (float) i2);
        int round = Math.round(apply.x);
        int round2 = Math.round(apply.y);
        if (round < i) {
            float f3 = (float) round2;
            float f4 = f3 / f2;
            float f5 = ((float) (i - round)) * (f2 / f3);
            float f6 = this.maxWorldWidth;
            if (f6 > 0.0f) {
                f5 = Math.min(f5, f6 - this.minWorldWidth);
            }
            f += f5;
            round += Math.round(f5 * f4);
        } else if (round2 < i2) {
            float f7 = (float) round;
            float f8 = f7 / f;
            float f9 = ((float) (i2 - round2)) * (f / f7);
            float f10 = this.maxWorldHeight;
            if (f10 > 0.0f) {
                f9 = Math.min(f9, f10 - this.minWorldHeight);
            }
            f2 += f9;
            round2 += Math.round(f9 * f8);
        }
        setWorldSize(f, f2);
        setScreenBounds((i - round) / 2, (i2 - round2) / 2, round, round2);
        apply(z);
    }

    public float getMinWorldWidth() {
        return this.minWorldWidth;
    }

    public void setMinWorldWidth(float f) {
        this.minWorldWidth = f;
    }

    public float getMinWorldHeight() {
        return this.minWorldHeight;
    }

    public void setMinWorldHeight(float f) {
        this.minWorldHeight = f;
    }

    public float getMaxWorldWidth() {
        return this.maxWorldWidth;
    }

    public void setMaxWorldWidth(float f) {
        this.maxWorldWidth = f;
    }

    public float getMaxWorldHeight() {
        return this.maxWorldHeight;
    }

    public void setMaxWorldHeight(float f) {
        this.maxWorldHeight = f;
    }
}
