package com.badlogic.gdx.scenes.scene2d.actions;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Pool;

public abstract class DelegateAction extends Action {
    protected Action action;

    /* access modifiers changed from: protected */
    public abstract boolean delegate(float f);

    public void setAction(Action action2) {
        this.action = action2;
    }

    public Action getAction() {
        return this.action;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public final boolean act(float f) {
        Pool pool = getPool();
        setPool(null);
        try {
            return delegate(f);
        } finally {
            setPool(pool);
        }
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

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public void setActor(Actor actor) {
        Action action2 = this.action;
        if (action2 != null) {
            action2.setActor(actor);
        }
        super.setActor(actor);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public void setTarget(Actor actor) {
        Action action2 = this.action;
        if (action2 != null) {
            action2.setTarget(actor);
        }
        super.setTarget(actor);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public String toString() {
        String str;
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        if (this.action == null) {
            str = BuildConfig.FLAVOR;
        } else {
            str = "(" + this.action + ")";
        }
        sb.append(str);
        return sb.toString();
    }
}
