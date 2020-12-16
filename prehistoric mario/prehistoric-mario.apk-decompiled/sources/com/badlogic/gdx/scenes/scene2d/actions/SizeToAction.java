package com.badlogic.gdx.scenes.scene2d.actions;

public class SizeToAction extends TemporalAction {
    private float endHeight;
    private float endWidth;
    private float startHeight;
    private float startWidth;

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void begin() {
        this.startWidth = this.target.getWidth();
        this.startHeight = this.target.getHeight();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void update(float f) {
        float f2;
        float f3;
        if (f == 0.0f) {
            f2 = this.startWidth;
            f3 = this.startHeight;
        } else if (f == 1.0f) {
            f2 = this.endWidth;
            f3 = this.endHeight;
        } else {
            float f4 = this.startWidth;
            float f5 = f4 + ((this.endWidth - f4) * f);
            float f6 = this.startHeight;
            f3 = f6 + ((this.endHeight - f6) * f);
            f2 = f5;
        }
        this.target.setSize(f2, f3);
    }

    public void setSize(float f, float f2) {
        this.endWidth = f;
        this.endHeight = f2;
    }

    public float getWidth() {
        return this.endWidth;
    }

    public void setWidth(float f) {
        this.endWidth = f;
    }

    public float getHeight() {
        return this.endHeight;
    }

    public void setHeight(float f) {
        this.endHeight = f;
    }
}
