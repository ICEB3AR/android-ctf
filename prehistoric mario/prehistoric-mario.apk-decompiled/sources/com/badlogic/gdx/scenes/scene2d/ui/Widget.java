package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;

public class Widget extends Actor implements Layout {
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
        if (z) {
            invalidateHierarchy();
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
                    float width = parent.getWidth();
                    f = parent.getHeight();
                    f2 = width;
                } else {
                    f2 = stage.getWidth();
                    f = stage.getHeight();
                }
                setSize(f2, f);
            }
            if (this.needsLayout) {
                this.needsLayout = false;
                layout();
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
        if (this.layoutEnabled) {
            invalidate();
            Group parent = getParent();
            if (parent instanceof Layout) {
                ((Layout) parent).invalidateHierarchy();
            }
        }
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
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout
    public void setFillParent(boolean z) {
        this.fillParent = z;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        validate();
    }
}
