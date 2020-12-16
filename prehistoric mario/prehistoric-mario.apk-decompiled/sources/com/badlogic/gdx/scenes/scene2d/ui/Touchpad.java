package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Circle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Pools;

public class Touchpad extends Widget {
    private final Circle deadzoneBounds;
    private float deadzoneRadius;
    private final Circle knobBounds;
    private final Vector2 knobPercent;
    private final Vector2 knobPosition;
    boolean resetOnTouchUp;
    private TouchpadStyle style;
    private final Circle touchBounds;
    boolean touched;

    public Touchpad(float f, Skin skin) {
        this(f, (TouchpadStyle) skin.get(TouchpadStyle.class));
    }

    public Touchpad(float f, Skin skin, String str) {
        this(f, (TouchpadStyle) skin.get(str, TouchpadStyle.class));
    }

    public Touchpad(float f, TouchpadStyle touchpadStyle) {
        this.resetOnTouchUp = true;
        this.knobBounds = new Circle(0.0f, 0.0f, 0.0f);
        this.touchBounds = new Circle(0.0f, 0.0f, 0.0f);
        this.deadzoneBounds = new Circle(0.0f, 0.0f, 0.0f);
        this.knobPosition = new Vector2();
        this.knobPercent = new Vector2();
        if (f >= 0.0f) {
            this.deadzoneRadius = f;
            this.knobPosition.set(getWidth() / 2.0f, getHeight() / 2.0f);
            setStyle(touchpadStyle);
            setSize(getPrefWidth(), getPrefHeight());
            addListener(new InputListener() {
                /* class com.badlogic.gdx.scenes.scene2d.ui.Touchpad.AnonymousClass1 */

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                    if (Touchpad.this.touched) {
                        return false;
                    }
                    Touchpad touchpad = Touchpad.this;
                    touchpad.touched = true;
                    touchpad.calculatePositionAndValue(f, f2, false);
                    return true;
                }

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public void touchDragged(InputEvent inputEvent, float f, float f2, int i) {
                    Touchpad.this.calculatePositionAndValue(f, f2, false);
                }

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                    Touchpad touchpad = Touchpad.this;
                    touchpad.touched = false;
                    touchpad.calculatePositionAndValue(f, f2, touchpad.resetOnTouchUp);
                }
            });
            return;
        }
        throw new IllegalArgumentException("deadzoneRadius must be > 0");
    }

    /* access modifiers changed from: package-private */
    public void calculatePositionAndValue(float f, float f2, boolean z) {
        float f3 = this.knobPosition.x;
        float f4 = this.knobPosition.y;
        float f5 = this.knobPercent.x;
        float f6 = this.knobPercent.y;
        float f7 = this.knobBounds.x;
        float f8 = this.knobBounds.y;
        this.knobPosition.set(f7, f8);
        this.knobPercent.set(0.0f, 0.0f);
        if (!z && !this.deadzoneBounds.contains(f, f2)) {
            this.knobPercent.set((f - f7) / this.knobBounds.radius, (f2 - f8) / this.knobBounds.radius);
            float len = this.knobPercent.len();
            if (len > 1.0f) {
                this.knobPercent.scl(1.0f / len);
            }
            if (this.knobBounds.contains(f, f2)) {
                this.knobPosition.set(f, f2);
            } else {
                this.knobPosition.set(this.knobPercent).nor().scl(this.knobBounds.radius).add(this.knobBounds.x, this.knobBounds.y);
            }
        }
        if (f5 != this.knobPercent.x || f6 != this.knobPercent.y) {
            ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent) Pools.obtain(ChangeListener.ChangeEvent.class);
            if (fire(changeEvent)) {
                this.knobPercent.set(f5, f6);
                this.knobPosition.set(f3, f4);
            }
            Pools.free(changeEvent);
        }
    }

    public void setStyle(TouchpadStyle touchpadStyle) {
        if (touchpadStyle != null) {
            this.style = touchpadStyle;
            invalidateHierarchy();
            return;
        }
        throw new IllegalArgumentException("style cannot be null");
    }

    public TouchpadStyle getStyle() {
        return this.style;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public Actor hit(float f, float f2, boolean z) {
        if ((!z || getTouchable() == Touchable.enabled) && isVisible() && this.touchBounds.contains(f, f2)) {
            return this;
        }
        return null;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public void layout() {
        float width = getWidth() / 2.0f;
        float height = getHeight() / 2.0f;
        float min = Math.min(width, height);
        this.touchBounds.set(width, height, min);
        if (this.style.knob != null) {
            min -= Math.max(this.style.knob.getMinWidth(), this.style.knob.getMinHeight()) / 2.0f;
        }
        this.knobBounds.set(width, height, min);
        this.deadzoneBounds.set(width, height, this.deadzoneRadius);
        this.knobPosition.set(width, height);
        this.knobPercent.set(0.0f, 0.0f);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        validate();
        Color color = getColor();
        batch.setColor(color.r, color.g, color.b, color.a * f);
        float x = getX();
        float y = getY();
        float width = getWidth();
        float height = getHeight();
        Drawable drawable = this.style.background;
        if (drawable != null) {
            drawable.draw(batch, x, y, width, height);
        }
        Drawable drawable2 = this.style.knob;
        if (drawable2 != null) {
            drawable2.draw(batch, x + (this.knobPosition.x - (drawable2.getMinWidth() / 2.0f)), y + (this.knobPosition.y - (drawable2.getMinHeight() / 2.0f)), drawable2.getMinWidth(), drawable2.getMinHeight());
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefWidth() {
        if (this.style.background != null) {
            return this.style.background.getMinWidth();
        }
        return 0.0f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefHeight() {
        if (this.style.background != null) {
            return this.style.background.getMinHeight();
        }
        return 0.0f;
    }

    public boolean isTouched() {
        return this.touched;
    }

    public boolean getResetOnTouchUp() {
        return this.resetOnTouchUp;
    }

    public void setResetOnTouchUp(boolean z) {
        this.resetOnTouchUp = z;
    }

    public void setDeadzone(float f) {
        if (f >= 0.0f) {
            this.deadzoneRadius = f;
            invalidate();
            return;
        }
        throw new IllegalArgumentException("deadzoneRadius must be > 0");
    }

    public float getKnobX() {
        return this.knobPosition.x;
    }

    public float getKnobY() {
        return this.knobPosition.y;
    }

    public float getKnobPercentX() {
        return this.knobPercent.x;
    }

    public float getKnobPercentY() {
        return this.knobPercent.y;
    }

    public static class TouchpadStyle {
        public Drawable background;
        public Drawable knob;

        public TouchpadStyle() {
        }

        public TouchpadStyle(Drawable drawable, Drawable drawable2) {
            this.background = drawable;
            this.knob = drawable2;
        }

        public TouchpadStyle(TouchpadStyle touchpadStyle) {
            this.background = touchpadStyle.background;
            this.knob = touchpadStyle.knob;
        }
    }
}
