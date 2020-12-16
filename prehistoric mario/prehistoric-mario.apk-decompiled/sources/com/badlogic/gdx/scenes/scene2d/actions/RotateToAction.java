package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.math.MathUtils;

public class RotateToAction extends TemporalAction {
    private float end;
    private float start;
    private boolean useShortestDirection = false;

    public RotateToAction() {
    }

    public RotateToAction(boolean z) {
        this.useShortestDirection = z;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void begin() {
        this.start = this.target.getRotation();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void update(float f) {
        float f2;
        if (f == 0.0f) {
            f2 = this.start;
        } else if (f == 1.0f) {
            f2 = this.end;
        } else if (this.useShortestDirection) {
            f2 = MathUtils.lerpAngleDeg(this.start, this.end, f);
        } else {
            float f3 = this.start;
            f2 = f3 + ((this.end - f3) * f);
        }
        this.target.setRotation(f2);
    }

    public float getRotation() {
        return this.end;
    }

    public void setRotation(float f) {
        this.end = f;
    }

    public boolean isUseShortestDirection() {
        return this.useShortestDirection;
    }

    public void setUseShortestDirection(boolean z) {
        this.useShortestDirection = z;
    }
}
