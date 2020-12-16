package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.utils.Pool;

public abstract class TemporalAction extends Action {
    private boolean began;
    private boolean complete;
    private float duration;
    private Interpolation interpolation;
    private boolean reverse;
    private float time;

    /* access modifiers changed from: protected */
    public void begin() {
    }

    /* access modifiers changed from: protected */
    public void end() {
    }

    /* access modifiers changed from: protected */
    public abstract void update(float f);

    public TemporalAction() {
    }

    public TemporalAction(float f) {
        this.duration = f;
    }

    public TemporalAction(float f, Interpolation interpolation2) {
        this.duration = f;
        this.interpolation = interpolation2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public boolean act(float f) {
        boolean z = true;
        if (this.complete) {
            return true;
        }
        Pool pool = getPool();
        setPool(null);
        try {
            if (!this.began) {
                begin();
                this.began = true;
            }
            this.time += f;
            if (this.time < this.duration) {
                z = false;
            }
            this.complete = z;
            float f2 = this.complete ? 1.0f : this.time / this.duration;
            if (this.interpolation != null) {
                f2 = this.interpolation.apply(f2);
            }
            if (this.reverse) {
                f2 = 1.0f - f2;
            }
            update(f2);
            if (this.complete) {
                end();
            }
            return this.complete;
        } finally {
            setPool(pool);
        }
    }

    public void finish() {
        this.time = this.duration;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public void restart() {
        this.time = 0.0f;
        this.began = false;
        this.complete = false;
    }

    @Override // com.badlogic.gdx.utils.Pool.Poolable, com.badlogic.gdx.scenes.scene2d.Action
    public void reset() {
        super.reset();
        this.reverse = false;
        this.interpolation = null;
    }

    public float getTime() {
        return this.time;
    }

    public void setTime(float f) {
        this.time = f;
    }

    public float getDuration() {
        return this.duration;
    }

    public void setDuration(float f) {
        this.duration = f;
    }

    public Interpolation getInterpolation() {
        return this.interpolation;
    }

    public void setInterpolation(Interpolation interpolation2) {
        this.interpolation = interpolation2;
    }

    public boolean isReverse() {
        return this.reverse;
    }

    public void setReverse(boolean z) {
        this.reverse = z;
    }

    public boolean isComplete() {
        return this.complete;
    }
}
