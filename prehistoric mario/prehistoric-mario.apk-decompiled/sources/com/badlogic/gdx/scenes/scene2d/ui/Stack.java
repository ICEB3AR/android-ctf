package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.SnapshotArray;

public class Stack extends WidgetGroup {
    private float maxHeight;
    private float maxWidth;
    private float minHeight;
    private float minWidth;
    private float prefHeight;
    private float prefWidth;
    private boolean sizeInvalid;

    public Stack() {
        this.sizeInvalid = true;
        setTransform(false);
        setWidth(150.0f);
        setHeight(150.0f);
        setTouchable(Touchable.childrenOnly);
    }

    public Stack(Actor... actorArr) {
        this();
        for (Actor actor : actorArr) {
            addActor(actor);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void invalidate() {
        super.invalidate();
        this.sizeInvalid = true;
    }

    private void computeSize() {
        float f;
        float f2;
        this.sizeInvalid = false;
        this.prefWidth = 0.0f;
        this.prefHeight = 0.0f;
        this.minWidth = 0.0f;
        this.minHeight = 0.0f;
        this.maxWidth = 0.0f;
        this.maxHeight = 0.0f;
        SnapshotArray<Actor> children = getChildren();
        int i = children.size;
        for (int i2 = 0; i2 < i; i2++) {
            Actor actor = children.get(i2);
            if (actor instanceof Layout) {
                Layout layout = (Layout) actor;
                this.prefWidth = Math.max(this.prefWidth, layout.getPrefWidth());
                this.prefHeight = Math.max(this.prefHeight, layout.getPrefHeight());
                this.minWidth = Math.max(this.minWidth, layout.getMinWidth());
                this.minHeight = Math.max(this.minHeight, layout.getMinHeight());
                f = layout.getMaxWidth();
                f2 = layout.getMaxHeight();
            } else {
                this.prefWidth = Math.max(this.prefWidth, actor.getWidth());
                this.prefHeight = Math.max(this.prefHeight, actor.getHeight());
                this.minWidth = Math.max(this.minWidth, actor.getWidth());
                this.minHeight = Math.max(this.minHeight, actor.getHeight());
                f2 = 0.0f;
                f = 0.0f;
            }
            if (f > 0.0f) {
                float f3 = this.maxWidth;
                if (f3 != 0.0f) {
                    f = Math.min(f3, f);
                }
                this.maxWidth = f;
            }
            if (f2 > 0.0f) {
                float f4 = this.maxHeight;
                if (f4 != 0.0f) {
                    f2 = Math.min(f4, f2);
                }
                this.maxHeight = f2;
            }
        }
    }

    public void add(Actor actor) {
        addActor(actor);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void layout() {
        if (this.sizeInvalid) {
            computeSize();
        }
        float width = getWidth();
        float height = getHeight();
        SnapshotArray<Actor> children = getChildren();
        int i = children.size;
        for (int i2 = 0; i2 < i; i2++) {
            Actor actor = children.get(i2);
            actor.setBounds(0.0f, 0.0f, width, height);
            if (actor instanceof Layout) {
                ((Layout) actor).validate();
            }
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefWidth() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.prefWidth;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefHeight() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.prefHeight;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinWidth() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.minWidth;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinHeight() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.minHeight;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMaxWidth() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.maxWidth;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMaxHeight() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.maxHeight;
    }
}
