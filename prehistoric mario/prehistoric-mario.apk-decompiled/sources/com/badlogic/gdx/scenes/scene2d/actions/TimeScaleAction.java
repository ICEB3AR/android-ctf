package com.badlogic.gdx.scenes.scene2d.actions;

public class TimeScaleAction extends DelegateAction {
    private float scale;

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.DelegateAction
    public boolean delegate(float f) {
        if (this.action == null) {
            return true;
        }
        return this.action.act(f * this.scale);
    }

    public float getScale() {
        return this.scale;
    }

    public void setScale(float f) {
        this.scale = f;
    }
}
