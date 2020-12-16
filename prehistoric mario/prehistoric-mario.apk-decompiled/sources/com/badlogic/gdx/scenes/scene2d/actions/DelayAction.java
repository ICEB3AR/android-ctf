package com.badlogic.gdx.scenes.scene2d.actions;

public class DelayAction extends DelegateAction {
    private float duration;
    private float time;

    public DelayAction() {
    }

    public DelayAction(float f) {
        this.duration = f;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.DelegateAction
    public boolean delegate(float f) {
        float f2 = this.time;
        float f3 = this.duration;
        if (f2 < f3) {
            this.time = f2 + f;
            float f4 = this.time;
            if (f4 < f3) {
                return false;
            }
            f = f4 - f3;
        }
        if (this.action == null) {
            return true;
        }
        return this.action.act(f);
    }

    public void finish() {
        this.time = this.duration;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.actions.DelegateAction, com.badlogic.gdx.scenes.scene2d.Action
    public void restart() {
        super.restart();
        this.time = 0.0f;
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
}
