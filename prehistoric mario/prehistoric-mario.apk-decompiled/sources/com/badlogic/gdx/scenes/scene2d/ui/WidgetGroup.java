package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.SnapshotArray;

public class WidgetGroup extends Group implements Layout {
    private boolean fillParent;
    private boolean layoutEnabled = true;
    private boolean needsLayout = true;

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public float getMaxHeight() {
        return 0.0f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public float getMaxWidth() {
        return 0.0f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public float getPrefHeight() {
        return 0.0f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public float getPrefWidth() {
        return 0.0f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public void layout() {
    }

    public WidgetGroup() {
    }

    public WidgetGroup(Actor... actorArr) {
        for (Actor actor : actorArr) {
            addActor(actor);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public float getMinWidth() {
        return getPrefWidth();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public float getMinHeight() {
        return getPrefHeight();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public void setLayoutEnabled(boolean z) {
        this.layoutEnabled = z;
        setLayoutEnabled(this, z);
    }

    private void setLayoutEnabled(Group group, boolean z) {
        SnapshotArray<Actor> children = group.getChildren();
        int i = children.size;
        for (int i2 = 0; i2 < i; i2++) {
            Actor actor = children.get(i2);
            if (actor instanceof Layout) {
                ((Layout) actor).setLayoutEnabled(z);
            } else if (actor instanceof Group) {
                setLayoutEnabled((Group) actor, z);
            }
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public void validate() {
        float f;
        float f2;
        if (this.layoutEnabled) {
            Group parent = getParent();
            if (this.fillParent && parent != null) {
                Stage stage = getStage();
                if (stage == null || parent != stage.getRoot()) {
                    f = parent.getWidth();
                    f2 = parent.getHeight();
                } else {
                    f = stage.getWidth();
                    f2 = stage.getHeight();
                }
                if (!(getWidth() == f && getHeight() == f2)) {
                    setWidth(f);
                    setHeight(f2);
                    invalidate();
                }
            }
            if (this.needsLayout) {
                this.needsLayout = false;
                layout();
                if (this.needsLayout && !(parent instanceof WidgetGroup)) {
                    for (int i = 0; i < 5; i++) {
                        this.needsLayout = false;
                        layout();
                        if (!this.needsLayout) {
                            return;
                        }
                    }
                }
            }
        }
    }

    public boolean needsLayout() {
        return this.needsLayout;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public void invalidate() {
        this.needsLayout = true;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public void invalidateHierarchy() {
        invalidate();
        Group parent = getParent();
        if (parent instanceof Layout) {
            ((Layout) parent).invalidateHierarchy();
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void childrenChanged() {
        invalidateHierarchy();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void sizeChanged() {
        invalidate();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public void pack() {
        setSize(getPrefWidth(), getPrefHeight());
        validate();
        setSize(getPrefWidth(), getPrefHeight());
        validate();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public void setFillParent(boolean z) {
        this.fillParent = z;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        validate();
        super.draw(batch, f);
    }
}
