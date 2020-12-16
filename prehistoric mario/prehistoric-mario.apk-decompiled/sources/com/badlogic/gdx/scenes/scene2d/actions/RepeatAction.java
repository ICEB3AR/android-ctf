package com.badlogic.gdx.scenes.scene2d.actions;

public class RepeatAction extends DelegateAction {
    public static final int FOREVER = -1;
    private int executedCount;
    private boolean finished;
    private int repeatCount;

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.DelegateAction
    public boolean delegate(float f) {
        if (this.executedCount == this.repeatCount) {
            return true;
        }
        if (!this.action.act(f)) {
            return false;
        }
        if (this.finished) {
            return true;
        }
        if (this.repeatCount > 0) {
            this.executedCount++;
        }
        if (this.executedCount == this.repeatCount) {
            return true;
        }
        if (this.action == null) {
            return false;
        }
        this.action.restart();
        return false;
    }

    public void finish() {
        this.finished = true;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.actions.DelegateAction, com.badlogic.gdx.scenes.scene2d.Action
    public void restart() {
        super.restart();
        this.executedCount = 0;
        this.finished = false;
    }

    public void setCount(int i) {
        this.repeatCount = i;
    }

    public int getCount() {
        return this.repeatCount;
    }
}
