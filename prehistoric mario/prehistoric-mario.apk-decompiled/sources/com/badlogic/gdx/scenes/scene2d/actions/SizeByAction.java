package com.badlogic.gdx.scenes.scene2d.actions;

public class SizeByAction extends RelativeTemporalAction {
    private float amountHeight;
    private float amountWidth;

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.RelativeTemporalAction
    public void updateRelative(float f) {
        this.target.sizeBy(this.amountWidth * f, this.amountHeight * f);
    }

    public void setAmount(float f, float f2) {
        this.amountWidth = f;
        this.amountHeight = f2;
    }

    public float getAmountWidth() {
        return this.amountWidth;
    }

    public void setAmountWidth(float f) {
        this.amountWidth = f;
    }

    public float getAmountHeight() {
        return this.amountHeight;
    }

    public void setAmountHeight(float f) {
        this.amountHeight = f;
    }
}
