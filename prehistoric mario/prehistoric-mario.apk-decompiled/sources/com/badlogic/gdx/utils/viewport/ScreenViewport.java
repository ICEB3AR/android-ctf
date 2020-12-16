package com.badlogic.gdx.utils.viewport;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.OrthographicCamera;

public class ScreenViewport extends Viewport {
    private float unitsPerPixel;

    public ScreenViewport() {
        this(new OrthographicCamera());
    }

    public ScreenViewport(Camera camera) {
        this.unitsPerPixel = 1.0f;
        setCamera(camera);
    }

    @Override // com.badlogic.gdx.utils.viewport.Viewport
    public void update(int i, int i2, boolean z) {
        setScreenBounds(0, 0, i, i2);
        float f = this.unitsPerPixel;
        setWorldSize(((float) i) * f, ((float) i2) * f);
        apply(z);
    }

    public float getUnitsPerPixel() {
        return this.unitsPerPixel;
    }

    public void setUnitsPerPixel(float f) {
        this.unitsPerPixel = f;
    }
}
