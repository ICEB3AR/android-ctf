package com.badlogic.gdx.scenes.scene2d.actions;

public class ScaleToAction extends TemporalAction {
    private float endX;
    private float endY;
    private float startX;
    private float startY;

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void begin() {
        this.startX = this.target.getScaleX();
        this.startY = this.target.getScaleY();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void update(float f) {
        float f2;
        float f3;
        if (f == 0.0f) {
            f2 = this.startX;
            f3 = this.startY;
        } else if (f == 1.0f) {
            f2 = this.endX;
            f3 = this.endY;
        } else {
            float f4 = this.startX;
            float f5 = f4 + ((this.endX - f4) * f);
            float f6 = this.startY;
            f3 = f6 + ((this.endY - f6) * f);
            f2 = f5;
        }
        this.target.setScale(f2, f3);
    }

    public void setScale(float f, float f2) {
        this.endX = f;
        this.endY = f2;
    }

    public void setScale(float f) {
        this.endX = f;
        this.endY = f;
    }

    public float getX() {
        return this.endX;
    }

    public void setX(float f) {
        this.endX = f;
    }

    public float getY() {
        return this.endY;
    }

    public void setY(float f) {
        this.endY = f;
    }
}
