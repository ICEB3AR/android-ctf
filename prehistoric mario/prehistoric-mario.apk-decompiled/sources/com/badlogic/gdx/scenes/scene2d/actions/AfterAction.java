package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Array;

public class AfterAction extends DelegateAction {
    private Array<Action> waitForActions = new Array<>(false, 4);

    @Override // com.badlogic.gdx.scenes.scene2d.actions.DelegateAction, com.badlogic.gdx.scenes.scene2d.Action
    public void setTarget(Actor actor) {
        if (actor != null) {
            this.waitForActions.addAll(actor.getActions());
        }
        super.setTarget(actor);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.actions.DelegateAction, com.badlogic.gdx.scenes.scene2d.Action
    public void restart() {
        super.restart();
        this.waitForActions.clear();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.actions.DelegateAction
    public boolean delegate(float f) {
        Array<Action> actions = this.target.getActions();
        if (actions.size == 1) {
            this.waitForActions.clear();
        }
        for (int i = this.waitForActions.size - 1; i >= 0; i--) {
            if (actions.indexOf(this.waitForActions.get(i), true) == -1) {
                this.waitForActions.removeIndex(i);
            }
        }
        if (this.waitForActions.size > 0) {
            return false;
        }
        return this.action.act(f);
    }
}
