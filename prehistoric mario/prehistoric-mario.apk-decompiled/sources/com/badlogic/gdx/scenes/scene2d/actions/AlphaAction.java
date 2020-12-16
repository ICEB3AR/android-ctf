package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.graphics.Color;

public class AlphaAction extends TemporalAction {
    private Color color;
    private float end;
    private float start;

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void begin() {
        if (this.color == null) {
            this.color = this.target.getColor();
        }
        this.start = this.color.a;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.TemporalAction
    public void update(float f) {
        if (f == 0.0f) {
            this.color.a = this.start;
        } else if (f == 1.0f) {
            this.color.a = this.end;
        } else {
            Color color2 = this.color;
            float f2 = this.start;
            color2.a = f2 + ((this.end - f2) * f);
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

    public float getAlpha() {
        return this.end;
    }

    public void setAlpha(float f) {
        this.end = f;
    }
}
