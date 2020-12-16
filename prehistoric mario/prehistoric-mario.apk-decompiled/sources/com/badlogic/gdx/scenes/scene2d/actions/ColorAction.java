package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.graphics.Color;

public class ColorAction extends TemporalAction {
    private Color color;
    private final Color end = new Color();
    private float startA;
    private float startB;
    private float startG;
    private float startR;

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void begin() {
        if (this.color == null) {
            this.color = this.target.getColor();
        }
        this.startR = this.color.r;
        this.startG = this.color.g;
        this.startB = this.color.b;
        this.startA = this.color.a;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void update(float f) {
        if (f == 0.0f) {
            this.color.set(this.startR, this.startG, this.startB, this.startA);
        } else if (f == 1.0f) {
            this.color.set(this.end);
        } else {
            this.color.set(this.startR + ((this.end.r - this.startR) * f), this.startG + ((this.end.g - this.startG) * f), this.startB + ((this.end.b - this.startB) * f), this.startA + ((this.end.a - this.startA) * f));
        }
    }

    @Override // com.badlogic.gdx.utils.Pool.Poolable, com.badlogic.gdx.scenes.scene2d.Action, com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void reset() {
        super.reset();
        this.color = null;
    }

    public Color getColor() {
        return this.color;
    }

    public void setColor(Color color2) {
        this.color = color2;
    }

    public Color getEndColor() {
        return this.end;
    }

    public void setEndColor(Color color2) {
        this.end.set(color2);
    }
}
