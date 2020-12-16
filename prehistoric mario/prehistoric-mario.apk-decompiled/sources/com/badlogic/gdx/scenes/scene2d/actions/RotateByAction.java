package com.badlogic.gdx.scenes.scene2d.actions;

public class RotateByAction extends RelativeTemporalAction {
    private float amount;

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.RelativeTemporalAction
    public void updateRelative(float f) {
        this.target.rotateBy(this.amount * f);
    }

    public float getAmount() {
        return this.amount;
    }

    public void setAmount(float f) {
        this.amount = f;
    }
}
