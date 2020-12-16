package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.MathUtils;

public class ConeLight extends PositionalLight {
    float coneDegree;

    public ConeLight(RayHandler rayHandler, int i, Color color, float f, float f2, float f3, float f4, float f5) {
        super(rayHandler, i, color, f, f2, f3, f4);
        setConeDegree(f5);
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
    public void setDirection(float f) {
        this.direction = f;
        this.dirty = true;
    }

    public float getConeDegree() {
        return this.coneDegree;
    }

    public void setConeDegree(float f) {
        this.coneDegree = MathUtils.clamp(f, 0.0f, 180.0f);
        this.dirty = true;
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

    /* access modifiers changed from: protected */
    public void setEndPoints() {
        for (int i = 0; i < this.rayNum; i++) {
            float f = this.direction;
            float f2 = this.coneDegree;
            float f3 = (f + f2) - (((f2 * 2.0f) * ((float) i)) / (((float) this.rayNum) - 1.0f));
            float[] fArr = this.sin;
            float sinDeg = MathUtils.sinDeg(f3);
            fArr[i] = sinDeg;
            float[] fArr2 = this.cos;
            float cosDeg = MathUtils.cosDeg(f3);
            fArr2[i] = cosDeg;
            this.endX[i] = this.distance * cosDeg;
            this.endY[i] = this.distance * sinDeg;
        }
    }
}
