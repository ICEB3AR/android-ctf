package com.badlogic.gdx.utils.viewport;

import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.Scaling;

public class ScalingViewport extends Viewport {
    private Scaling scaling;

    public ScalingViewport(Scaling scaling2, float f, float f2) {
        this(scaling2, f, f2, new OrthographicCamera());
    }

    public ScalingViewport(Scaling scaling2, float f, float f2, Camera camera) {
        this.scaling = scaling2;
        setWorldSize(f, f2);
        setCamera(camera);
    }

    @Override // com.badlogic.gdx.utils.viewport.Viewport
    public void update(int i, int i2, boolean z) {
        Vector2 apply = this.scaling.apply(getWorldWidth(), getWorldHeight(), (float) i, (float) i2);
        int round = Math.round(apply.x);
        int round2 = Math.round(apply.y);
        setScreenBounds((i - round) / 2, (i2 - round2) / 2, round, round2);
        apply(z);
    }

    public Scaling getScaling() {
        return this.scaling;
    }

    public void setScaling(Scaling scaling2) {
        this.scaling = scaling2;
    }
}
