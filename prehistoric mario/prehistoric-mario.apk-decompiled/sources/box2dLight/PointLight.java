package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.MathUtils;

public class PointLight extends PositionalLight {
    @Override // box2dLight.Light
    @Deprecated
    public void setDirection(float f) {
    }

    public PointLight(RayHandler rayHandler, int i) {
        this(rayHandler, i, Light.DefaultColor, 15.0f, 0.0f, 0.0f);
    }

    public PointLight(RayHandler rayHandler, int i, Color color, float f, float f2, float f3) {
        super(rayHandler, i, color, f, f2, f3, 0.0f);
    }

    @Override // box2dLight.PositionalLight, box2dLight.Light
    public void update() {
        updateBody();
        if (this.dirty) {
            setEndPoints();
        }
        if (!cull()) {
            if (!this.staticLight || this.dirty) {
                this.dirty = false;
                updateMesh();
            }
        }
    }

    @Override // box2dLight.Light
    public void setDistance(float f) {
        float f2 = f * RayHandler.gammaCorrectionParameter;
        if (f2 < 0.01f) {
            f2 = 0.01f;
        }
        this.distance = f2;
        this.dirty = true;
    }

    /* access modifiers changed from: package-private */
    public void setEndPoints() {
        float f = 360.0f / ((float) (this.rayNum - 1));
        for (int i = 0; i < this.rayNum; i++) {
            float f2 = ((float) i) * f;
            this.sin[i] = MathUtils.sinDeg(f2);
            this.cos[i] = MathUtils.cosDeg(f2);
            this.endX[i] = this.distance * this.cos[i];
            this.endY[i] = this.distance * this.sin[i];
        }
    }
}
