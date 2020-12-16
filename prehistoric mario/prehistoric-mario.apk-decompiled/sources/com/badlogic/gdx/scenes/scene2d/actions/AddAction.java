package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;

public class AddAction extends Action {
    private Action action;

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public boolean act(float f) {
        this.target.addAction(this.action);
        return true;
    }

    public Action getAction() {
        return this.action;
    }

    public void setAction(Action action2) {
        this.action = action2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public void restart() {
        Action action2 = this.action;
        if (action2 != null) {
            action2.restart();
        }
    }

    @Override // com.badlogic.gdx.utils.Pool.Poolable, com.badlogic.gdx.scenes.scene2d.Action
    public void reset() {
        super.reset();
        this.action = null;
    }
}
