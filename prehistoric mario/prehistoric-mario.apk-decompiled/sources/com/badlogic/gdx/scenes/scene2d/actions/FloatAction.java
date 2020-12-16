package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.math.Interpolation;

public class FloatAction extends TemporalAction {
    private float end;
    private float start;
    private float value;

    public FloatAction() {
        this.start = 0.0f;
        this.end = 1.0f;
    }

    public FloatAction(float f, float f2) {
        this.start = f;
        this.end = f2;
    }

    public FloatAction(float f, float f2, float f3) {
        super(f3);
        this.start = f;
        this.end = f2;
    }

    public FloatAction(float f, float f2, float f3, Interpolation interpolation) {
        super(f3, interpolation);
        this.start = f;
        this.end = f2;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void begin() {
        this.value = this.start;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void update(float f) {
        if (f == 0.0f) {
            this.value = this.start;
        } else if (f == 1.0f) {
            this.value = this.end;
        } else {
            float f2 = this.start;
            this.value = f2 + ((this.end - f2) * f);
        }
    }

    public float getValue() {
        return this.value;
    }

    public void setValue(float f) {
        this.value = f;
    }

    public float getStart() {
        return this.start;
    }

    public void setStart(float f) {
        this.start = f;
    }

    public float getEnd() {
        return this.end;
    }

    public void setEnd(float f) {
        this.end = f;
    }
}
