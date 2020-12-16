package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.utils.Pool;

public abstract class Action implements Pool.Poolable {
    protected Actor actor;
    private Pool pool;
    protected Actor target;

    public abstract boolean act(float f);

    public void restart() {
    }

    public void setActor(Actor actor2) {
        Pool pool2;
        this.actor = actor2;
        if (this.target == null) {
            setTarget(actor2);
        }
        if (actor2 == null && (pool2 = this.pool) != null) {
            pool2.free(this);
            this.pool = null;
        }
    }

    public Actor getActor() {
        return this.actor;
    }

    public void setTarget(Actor actor2) {
        this.target = actor2;
    }

    public Actor getTarget() {
        return this.target;
    }

    @Override // com.badlogic.gdx.utils.Pool.Poolable
    public void reset() {
        this.actor = null;
        this.target = null;
        this.pool = null;
        restart();
    }

    public Pool getPool() {
        return this.pool;
    }

    public void setPool(Pool pool2) {
        this.pool = pool2;
    }

    public String toString() {
        String name = getClass().getName();
        int lastIndexOf = name.lastIndexOf(46);
        if (lastIndexOf != -1) {
            name = name.substring(lastIndexOf + 1);
        }
        return name.endsWith("Action") ? name.substring(0, name.length() - 6) : name;
    }
}
