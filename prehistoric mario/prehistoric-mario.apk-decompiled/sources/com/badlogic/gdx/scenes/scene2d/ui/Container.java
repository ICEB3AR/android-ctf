package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.ui.Value;
import com.badlogic.gdx.scenes.scene2d.utils.Cullable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;

public class Container<T extends Actor> extends WidgetGroup {
    private T actor;
    private int align;
    private Drawable background;
    private boolean clip;
    private float fillX;
    private float fillY;
    private Value maxHeight;
    private Value maxWidth;
    private Value minHeight;
    private Value minWidth;
    private Value padBottom;
    private Value padLeft;
    private Value padRight;
    private Value padTop;
    private Value prefHeight;
    private Value prefWidth;
    private boolean round;

    public Container() {
        this.minWidth = Value.minWidth;
        this.minHeight = Value.minHeight;
        this.prefWidth = Value.prefWidth;
        this.prefHeight = Value.prefHeight;
        this.maxWidth = Value.zero;
        this.maxHeight = Value.zero;
        this.padTop = Value.zero;
        this.padLeft = Value.zero;
        this.padBottom = Value.zero;
        this.padRight = Value.zero;
        this.round = true;
        setTouchable(Touchable.childrenOnly);
        setTransform(false);
    }

    public Container(T t) {
        this();
        setActor(t);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void draw(Batch batch, float f) {
        validate();
        if (isTransform()) {
            applyTransform(batch, computeTransform());
            drawBackground(batch, f, 0.0f, 0.0f);
            if (this.clip) {
                batch.flush();
                float f2 = this.padLeft.get(this);
                float f3 = this.padBottom.get(this);
                if (clipBegin(f2, f3, (getWidth() - f2) - this.padRight.get(this), (getHeight() - f3) - this.padTop.get(this))) {
                    drawChildren(batch, f);
                    batch.flush();
                    clipEnd();
                }
            } else {
                drawChildren(batch, f);
            }
            resetTransform(batch);
            return;
        }
        drawBackground(batch, f, getX(), getY());
        super.draw(batch, f);
    }

    /* access modifiers changed from: protected */
    public void drawBackground(Batch batch, float f, float f2, float f3) {
        if (this.background != null) {
            Color color = getColor();
            batch.setColor(color.r, color.g, color.b, color.a * f);
            this.background.draw(batch, f2, f3, getWidth(), getHeight());
        }
    }

    public void setBackground(Drawable drawable) {
        setBackground(drawable, true);
    }

    public void setBackground(Drawable drawable, boolean z) {
        if (this.background != drawable) {
            this.background = drawable;
            if (z) {
                if (drawable == null) {
                    pad(Value.zero);
                } else {
                    pad(drawable.getTopHeight(), drawable.getLeftWidth(), drawable.getBottomHeight(), drawable.getRightWidth());
                }
                invalidate();
            }
        }
    }

    public Container<T> background(Drawable drawable) {
        setBackground(drawable);
        return this;
    }

    public Drawable getBackground() {
        return this.background;
    }

    /* JADX WARNING: Removed duplicated region for block: B:36:0x00ab  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00ae  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x00b9  */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00d8  */
    /* JADX WARNING: Removed duplicated region for block: B:48:? A[RETURN, SYNTHETIC] */
    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void layout() {
        /*
        // Method dump skipped, instructions count: 222
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.Container.layout():void");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.utils.Cullable
    public void setCullingArea(Rectangle rectangle) {
        super.setCullingArea(rectangle);
        if (this.fillX == 1.0f && this.fillY == 1.0f) {
            T t = this.actor;
            if (t instanceof Cullable) {
                ((Cullable) t).setCullingArea(rectangle);
            }
        }
    }

    public void setActor(T t) {
        if (t != this) {
            T t2 = this.actor;
            if (t != t2) {
                if (t2 != null) {
                    super.removeActor(t2);
                }
                this.actor = t;
                if (t != null) {
                    super.addActor(t);
                    return;
                }
                return;
            }
            return;
        }
        throw new IllegalArgumentException("actor cannot be the Container.");
    }

    public T getActor() {
        return this.actor;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActor(Actor actor2) {
        throw new UnsupportedOperationException("Use Container#setActor.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActorAt(int i, Actor actor2) {
        throw new UnsupportedOperationException("Use Container#setActor.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActorBefore(Actor actor2, Actor actor3) {
        throw new UnsupportedOperationException("Use Container#setActor.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActorAfter(Actor actor2, Actor actor3) {
        throw new UnsupportedOperationException("Use Container#setActor.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public boolean removeActor(Actor actor2) {
        if (actor2 == null) {
            throw new IllegalArgumentException("actor cannot be null.");
        } else if (actor2 != this.actor) {
            return false;
        } else {
            setActor(null);
            return true;
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public boolean removeActor(Actor actor2, boolean z) {
        if (actor2 == null) {
            throw new IllegalArgumentException("actor cannot be null.");
        } else if (actor2 != this.actor) {
            return false;
        } else {
            this.actor = null;
            return super.removeActor(actor2, z);
        }
    }

    public Container<T> size(Value value) {
        if (value != null) {
            this.minWidth = value;
            this.minHeight = value;
            this.prefWidth = value;
            this.prefHeight = value;
            this.maxWidth = value;
            this.maxHeight = value;
            return this;
        }
        throw new IllegalArgumentException("size cannot be null.");
    }

    public Container<T> size(Value value, Value value2) {
        if (value == null) {
            throw new IllegalArgumentException("width cannot be null.");
        } else if (value2 != null) {
            this.minWidth = value;
            this.minHeight = value2;
            this.prefWidth = value;
            this.prefHeight = value2;
            this.maxWidth = value;
            this.maxHeight = value2;
            return this;
        } else {
            throw new IllegalArgumentException("height cannot be null.");
        }
    }

    public Container<T> size(float f) {
        size(Value.Fixed.valueOf(f));
        return this;
    }

    public Container<T> size(float f, float f2) {
        size(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2));
        return this;
    }

    public Container<T> width(Value value) {
        if (value != null) {
            this.minWidth = value;
            this.prefWidth = value;
            this.maxWidth = value;
            return this;
        }
        throw new IllegalArgumentException("width cannot be null.");
    }

    public Container<T> width(float f) {
        width(Value.Fixed.valueOf(f));
        return this;
    }

    public Container<T> height(Value value) {
        if (value != null) {
            this.minHeight = value;
            this.prefHeight = value;
            this.maxHeight = value;
            return this;
        }
        throw new IllegalArgumentException("height cannot be null.");
    }

    public Container<T> height(float f) {
        height(Value.Fixed.valueOf(f));
        return this;
    }

    public Container<T> minSize(Value value) {
        if (value != null) {
            this.minWidth = value;
            this.minHeight = value;
            return this;
        }
        throw new IllegalArgumentException("size cannot be null.");
    }

    public Container<T> minSize(Value value, Value value2) {
        if (value == null) {
            throw new IllegalArgumentException("width cannot be null.");
        } else if (value2 != null) {
            this.minWidth = value;
            this.minHeight = value2;
            return this;
        } else {
            throw new IllegalArgumentException("height cannot be null.");
        }
    }

    public Container<T> minWidth(Value value) {
        if (value != null) {
            this.minWidth = value;
            return this;
        }
        throw new IllegalArgumentException("minWidth cannot be null.");
    }

    public Container<T> minHeight(Value value) {
        if (value != null) {
            this.minHeight = value;
            return this;
        }
        throw new IllegalArgumentException("minHeight cannot be null.");
    }

    public Container<T> minSize(float f) {
        minSize(Value.Fixed.valueOf(f));
        return this;
    }

    public Container<T> minSize(float f, float f2) {
        minSize(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2));
        return this;
    }

    public Container<T> minWidth(float f) {
        this.minWidth = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> minHeight(float f) {
        this.minHeight = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> prefSize(Value value) {
        if (value != null) {
            this.prefWidth = value;
            this.prefHeight = value;
            return this;
        }
        throw new IllegalArgumentException("size cannot be null.");
    }

    public Container<T> prefSize(Value value, Value value2) {
        if (value == null) {
            throw new IllegalArgumentException("width cannot be null.");
        } else if (value2 != null) {
            this.prefWidth = value;
            this.prefHeight = value2;
            return this;
        } else {
            throw new IllegalArgumentException("height cannot be null.");
        }
    }

    public Container<T> prefWidth(Value value) {
        if (value != null) {
            this.prefWidth = value;
            return this;
        }
        throw new IllegalArgumentException("prefWidth cannot be null.");
    }

    public Container<T> prefHeight(Value value) {
        if (value != null) {
            this.prefHeight = value;
            return this;
        }
        throw new IllegalArgumentException("prefHeight cannot be null.");
    }

    public Container<T> prefSize(float f, float f2) {
        prefSize(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2));
        return this;
    }

    public Container<T> prefSize(float f) {
        prefSize(Value.Fixed.valueOf(f));
        return this;
    }

    public Container<T> prefWidth(float f) {
        this.prefWidth = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> prefHeight(float f) {
        this.prefHeight = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> maxSize(Value value) {
        if (value != null) {
            this.maxWidth = value;
            this.maxHeight = value;
            return this;
        }
        throw new IllegalArgumentException("size cannot be null.");
    }

    public Container<T> maxSize(Value value, Value value2) {
        if (value == null) {
            throw new IllegalArgumentException("width cannot be null.");
        } else if (value2 != null) {
            this.maxWidth = value;
            this.maxHeight = value2;
            return this;
        } else {
            throw new IllegalArgumentException("height cannot be null.");
        }
    }

    public Container<T> maxWidth(Value value) {
        if (value != null) {
            this.maxWidth = value;
            return this;
        }
        throw new IllegalArgumentException("maxWidth cannot be null.");
    }

    public Container<T> maxHeight(Value value) {
        if (value != null) {
            this.maxHeight = value;
            return this;
        }
        throw new IllegalArgumentException("maxHeight cannot be null.");
    }

    public Container<T> maxSize(float f) {
        maxSize(Value.Fixed.valueOf(f));
        return this;
    }

    public Container<T> maxSize(float f, float f2) {
        maxSize(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2));
        return this;
    }

    public Container<T> maxWidth(float f) {
        this.maxWidth = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> maxHeight(float f) {
        this.maxHeight = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> pad(Value value) {
        if (value != null) {
            this.padTop = value;
            this.padLeft = value;
            this.padBottom = value;
            this.padRight = value;
            return this;
        }
        throw new IllegalArgumentException("pad cannot be null.");
    }

    public Container<T> pad(Value value, Value value2, Value value3, Value value4) {
        if (value == null) {
            throw new IllegalArgumentException("top cannot be null.");
        } else if (value2 == null) {
            throw new IllegalArgumentException("left cannot be null.");
        } else if (value3 == null) {
            throw new IllegalArgumentException("bottom cannot be null.");
        } else if (value4 != null) {
            this.padTop = value;
            this.padLeft = value2;
            this.padBottom = value3;
            this.padRight = value4;
            return this;
        } else {
            throw new IllegalArgumentException("right cannot be null.");
        }
    }

    public Container<T> padTop(Value value) {
        if (value != null) {
            this.padTop = value;
            return this;
        }
        throw new IllegalArgumentException("padTop cannot be null.");
    }

    public Container<T> padLeft(Value value) {
        if (value != null) {
            this.padLeft = value;
            return this;
        }
        throw new IllegalArgumentException("padLeft cannot be null.");
    }

    public Container<T> padBottom(Value value) {
        if (value != null) {
            this.padBottom = value;
            return this;
        }
        throw new IllegalArgumentException("padBottom cannot be null.");
    }

    public Container<T> padRight(Value value) {
        if (value != null) {
            this.padRight = value;
            return this;
        }
        throw new IllegalArgumentException("padRight cannot be null.");
    }

    public Container<T> pad(float f) {
        Value.Fixed valueOf = Value.Fixed.valueOf(f);
        this.padTop = valueOf;
        this.padLeft = valueOf;
        this.padBottom = valueOf;
        this.padRight = valueOf;
        return this;
    }

    public Container<T> pad(float f, float f2, float f3, float f4) {
        this.padTop = Value.Fixed.valueOf(f);
        this.padLeft = Value.Fixed.valueOf(f2);
        this.padBottom = Value.Fixed.valueOf(f3);
        this.padRight = Value.Fixed.valueOf(f4);
        return this;
    }

    public Container<T> padTop(float f) {
        this.padTop = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> padLeft(float f) {
        this.padLeft = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> padBottom(float f) {
        this.padBottom = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> padRight(float f) {
        this.padRight = Value.Fixed.valueOf(f);
        return this;
    }

    public Container<T> fill() {
        this.fillX = 1.0f;
        this.fillY = 1.0f;
        return this;
    }

    public Container<T> fillX() {
        this.fillX = 1.0f;
        return this;
    }

    public Container<T> fillY() {
        this.fillY = 1.0f;
        return this;
    }

    public Container<T> fill(float f, float f2) {
        this.fillX = f;
        this.fillY = f2;
        return this;
    }

    public Container<T> fill(boolean z, boolean z2) {
        float f = 1.0f;
        this.fillX = z ? 1.0f : 0.0f;
        if (!z2) {
            f = 0.0f;
        }
        this.fillY = f;
        return this;
    }

    public Container<T> fill(boolean z) {
        float f = 1.0f;
        this.fillX = z ? 1.0f : 0.0f;
        if (!z) {
            f = 0.0f;
        }
        this.fillY = f;
        return this;
    }

    public Container<T> align(int i) {
        this.align = i;
        return this;
    }

    public Container<T> center() {
        this.align = 1;
        return this;
    }

    public Container<T> top() {
        this.align |= 2;
        this.align &= -5;
        return this;
    }

    public Container<T> left() {
        this.align |= 8;
        this.align &= -17;
        return this;
    }

    public Container<T> bottom() {
        this.align |= 4;
        this.align &= -3;
        return this;
    }

    public Container<T> right() {
        this.align |= 16;
        this.align &= -9;
        return this;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinWidth() {
        return this.minWidth.get(this.actor) + this.padLeft.get(this) + this.padRight.get(this);
    }

    public Value getMinHeightValue() {
        return this.minHeight;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinHeight() {
        return this.minHeight.get(this.actor) + this.padTop.get(this) + this.padBottom.get(this);
    }

    public Value getPrefWidthValue() {
        return this.prefWidth;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefWidth() {
        float f = this.prefWidth.get(this.actor);
        Drawable drawable = this.background;
        if (drawable != null) {
            f = Math.max(f, drawable.getMinWidth());
        }
        return Math.max(getMinWidth(), f + this.padLeft.get(this) + this.padRight.get(this));
    }

    public Value getPrefHeightValue() {
        return this.prefHeight;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefHeight() {
        float f = this.prefHeight.get(this.actor);
        Drawable drawable = this.background;
        if (drawable != null) {
            f = Math.max(f, drawable.getMinHeight());
        }
        return Math.max(getMinHeight(), f + this.padTop.get(this) + this.padBottom.get(this));
    }

    public Value getMaxWidthValue() {
        return this.maxWidth;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMaxWidth() {
        float f = this.maxWidth.get(this.actor);
        return f > 0.0f ? f + this.padLeft.get(this) + this.padRight.get(this) : f;
    }

    public Value getMaxHeightValue() {
        return this.maxHeight;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMaxHeight() {
        float f = this.maxHeight.get(this.actor);
        return f > 0.0f ? f + this.padTop.get(this) + this.padBottom.get(this) : f;
    }

    public Value getPadTopValue() {
        return this.padTop;
    }

    public float getPadTop() {
        return this.padTop.get(this);
    }

    public Value getPadLeftValue() {
        return this.padLeft;
    }

    public float getPadLeft() {
        return this.padLeft.get(this);
    }

    public Value getPadBottomValue() {
        return this.padBottom;
    }

    public float getPadBottom() {
        return this.padBottom.get(this);
    }

    public Value getPadRightValue() {
        return this.padRight;
    }

    public float getPadRight() {
        return this.padRight.get(this);
    }

    public float getPadX() {
        return this.padLeft.get(this) + this.padRight.get(this);
    }

    public float getPadY() {
        return this.padTop.get(this) + this.padBottom.get(this);
    }

    public float getFillX() {
        return this.fillX;
    }

    public float getFillY() {
        return this.fillY;
    }

    public int getAlign() {
        return this.align;
    }

    public void setRound(boolean z) {
        this.round = z;
    }

    public void setClip(boolean z) {
        this.clip = z;
        setTransform(z);
        invalidate();
    }

    public boolean getClip() {
        return this.clip;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public Actor hit(float f, float f2, boolean z) {
        if (!this.clip || ((!z || getTouchable() != Touchable.disabled) && f >= 0.0f && f < getWidth() && f2 >= 0.0f && f2 < getHeight())) {
            return super.hit(f, f2, z);
        }
        return null;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public void drawDebug(ShapeRenderer shapeRenderer) {
        boolean z;
        validate();
        if (isTransform()) {
            applyTransform(shapeRenderer, computeTransform());
            if (this.clip) {
                shapeRenderer.flush();
                float f = this.padLeft.get(this);
                float f2 = this.padBottom.get(this);
                if (this.background == null) {
                    z = clipBegin(0.0f, 0.0f, getWidth(), getHeight());
                } else {
                    z = clipBegin(f, f2, (getWidth() - f) - this.padRight.get(this), (getHeight() - f2) - this.padTop.get(this));
                }
                if (z) {
                    drawDebugChildren(shapeRenderer);
                    clipEnd();
                }
            } else {
                drawDebugChildren(shapeRenderer);
            }
            resetTransform(shapeRenderer);
            return;
        }
        super.drawDebug(shapeRenderer);
    }
}
