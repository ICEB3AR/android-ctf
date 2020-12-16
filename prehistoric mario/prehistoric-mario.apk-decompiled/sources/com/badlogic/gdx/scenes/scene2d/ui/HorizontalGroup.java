package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.SnapshotArray;

public class HorizontalGroup extends WidgetGroup {
    private int align = 8;
    private boolean expand;
    private float fill;
    private float lastPrefHeight;
    private float padBottom;
    private float padLeft;
    private float padRight;
    private float padTop;
    private float prefHeight;
    private float prefWidth;
    private boolean reverse;
    private boolean round = true;
    private int rowAlign;
    private FloatArray rowSizes;
    private boolean sizeInvalid = true;
    private float space;
    private boolean wrap;
    private float wrapSpace;

    public HorizontalGroup() {
        setTouchable(Touchable.childrenOnly);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void invalidate() {
        super.invalidate();
        this.sizeInvalid = true;
    }

    private void computeSize() {
        int i;
        float f;
        float f2;
        float f3;
        float f4;
        float f5;
        int i2 = 0;
        this.sizeInvalid = false;
        SnapshotArray<Actor> children = getChildren();
        int i3 = children.size;
        float f6 = 0.0f;
        this.prefHeight = 0.0f;
        if (this.wrap) {
            this.prefWidth = 0.0f;
            FloatArray floatArray = this.rowSizes;
            if (floatArray == null) {
                this.rowSizes = new FloatArray();
            } else {
                floatArray.clear();
            }
            FloatArray floatArray2 = this.rowSizes;
            float f7 = this.space;
            float f8 = this.wrapSpace;
            float f9 = this.padLeft + this.padRight;
            float width = getWidth() - f9;
            if (this.reverse) {
                i2 = i3 - 1;
                i3 = -1;
                f3 = 0.0f;
                f2 = 0.0f;
                f = 0.0f;
                i = -1;
            } else {
                f3 = 0.0f;
                f2 = 0.0f;
                f = 0.0f;
                i = 1;
            }
            while (i2 != i3) {
                Actor actor = children.get(i2);
                if (actor instanceof Layout) {
                    Layout layout = (Layout) actor;
                    f4 = layout.getPrefWidth();
                    if (f4 > width) {
                        f4 = Math.max(width, layout.getMinWidth());
                    }
                    f5 = layout.getPrefHeight();
                } else {
                    f4 = actor.getWidth();
                    f5 = actor.getHeight();
                }
                float f10 = f4 + (f3 > f6 ? f7 : 0.0f);
                if (f3 + f10 <= width || f3 <= f6) {
                    f4 = f10;
                } else {
                    floatArray2.add(f3);
                    floatArray2.add(f2);
                    this.prefWidth = Math.max(this.prefWidth, f3 + f9);
                    if (f > 0.0f) {
                        f += f8;
                    }
                    f += f2;
                    f3 = 0.0f;
                    f2 = 0.0f;
                }
                f3 += f4;
                f2 = Math.max(f2, f5);
                i2 += i;
                f6 = 0.0f;
            }
            floatArray2.add(f3);
            floatArray2.add(f2);
            this.prefWidth = Math.max(this.prefWidth, f3 + f9);
            if (f > 0.0f) {
                f += f8;
            }
            this.prefHeight = Math.max(this.prefHeight, f + f2);
        } else {
            this.prefWidth = this.padLeft + this.padRight + (this.space * ((float) (i3 - 1)));
            while (i2 < i3) {
                Actor actor2 = children.get(i2);
                if (actor2 instanceof Layout) {
                    Layout layout2 = (Layout) actor2;
                    this.prefWidth += layout2.getPrefWidth();
                    this.prefHeight = Math.max(this.prefHeight, layout2.getPrefHeight());
                } else {
                    this.prefWidth += actor2.getWidth();
                    this.prefHeight = Math.max(this.prefHeight, actor2.getHeight());
                }
                i2++;
            }
        }
        this.prefHeight += this.padTop + this.padBottom;
        if (this.round) {
            this.prefWidth = (float) Math.round(this.prefWidth);
            this.prefHeight = (float) Math.round(this.prefHeight);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x004d  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0074  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0078  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x007b  */
    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void layout() {
        /*
        // Method dump skipped, instructions count: 268
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.HorizontalGroup.layout():void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x004b  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x0051  */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x006f  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0073  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0081  */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00e8  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void layoutWrapped() {
        /*
        // Method dump skipped, instructions count: 370
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.HorizontalGroup.layoutWrapped():void");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefWidth() {
        if (this.wrap) {
            return 0.0f;
        }
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

    public void setRound(boolean z) {
        this.round = z;
    }

    public HorizontalGroup reverse() {
        this.reverse = true;
        return this;
    }

    public HorizontalGroup reverse(boolean z) {
        this.reverse = z;
        return this;
    }

    public boolean getReverse() {
        return this.reverse;
    }

    public HorizontalGroup space(float f) {
        this.space = f;
        return this;
    }

    public float getSpace() {
        return this.space;
    }

    public HorizontalGroup wrapSpace(float f) {
        this.wrapSpace = f;
        return this;
    }

    public float getWrapSpace() {
        return this.wrapSpace;
    }

    public HorizontalGroup pad(float f) {
        this.padTop = f;
        this.padLeft = f;
        this.padBottom = f;
        this.padRight = f;
        return this;
    }

    public HorizontalGroup pad(float f, float f2, float f3, float f4) {
        this.padTop = f;
        this.padLeft = f2;
        this.padBottom = f3;
        this.padRight = f4;
        return this;
    }

    public HorizontalGroup padTop(float f) {
        this.padTop = f;
        return this;
    }

    public HorizontalGroup padLeft(float f) {
        this.padLeft = f;
        return this;
    }

    public HorizontalGroup padBottom(float f) {
        this.padBottom = f;
        return this;
    }

    public HorizontalGroup padRight(float f) {
        this.padRight = f;
        return this;
    }

    public float getPadTop() {
        return this.padTop;
    }

    public float getPadLeft() {
        return this.padLeft;
    }

    public float getPadBottom() {
        return this.padBottom;
    }

    public float getPadRight() {
        return this.padRight;
    }

    public HorizontalGroup align(int i) {
        this.align = i;
        return this;
    }

    public HorizontalGroup center() {
        this.align = 1;
        return this;
    }

    public HorizontalGroup top() {
        this.align |= 2;
        this.align &= -5;
        return this;
    }

    public HorizontalGroup left() {
        this.align |= 8;
        this.align &= -17;
        return this;
    }

    public HorizontalGroup bottom() {
        this.align |= 4;
        this.align &= -3;
        return this;
    }

    public HorizontalGroup right() {
        this.align |= 16;
        this.align &= -9;
        return this;
    }

    public int getAlign() {
        return this.align;
    }

    public HorizontalGroup fill() {
        this.fill = 1.0f;
        return this;
    }

    public HorizontalGroup fill(float f) {
        this.fill = f;
        return this;
    }

    public float getFill() {
        return this.fill;
    }

    public HorizontalGroup expand() {
        this.expand = true;
        return this;
    }

    public HorizontalGroup expand(boolean z) {
        this.expand = z;
        return this;
    }

    public boolean getExpand() {
        return this.expand;
    }

    public HorizontalGroup grow() {
        this.expand = true;
        this.fill = 1.0f;
        return this;
    }

    public HorizontalGroup wrap() {
        this.wrap = true;
        return this;
    }

    public HorizontalGroup wrap(boolean z) {
        this.wrap = z;
        return this;
    }

    public boolean getWrap() {
        return this.wrap;
    }

    public HorizontalGroup rowAlign(int i) {
        this.rowAlign = i;
        return this;
    }

    public HorizontalGroup rowCenter() {
        this.rowAlign = 1;
        return this;
    }

    public HorizontalGroup rowTop() {
        this.rowAlign |= 2;
        this.rowAlign &= -5;
        return this;
    }

    public HorizontalGroup rowLeft() {
        this.rowAlign |= 8;
        this.rowAlign &= -17;
        return this;
    }

    public HorizontalGroup rowBottom() {
        this.rowAlign |= 4;
        this.rowAlign &= -3;
        return this;
    }

    public HorizontalGroup rowRight() {
        this.rowAlign |= 16;
        this.rowAlign &= -9;
        return this;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void drawDebugBounds(ShapeRenderer shapeRenderer) {
        super.drawDebugBounds(shapeRenderer);
        if (getDebug()) {
            shapeRenderer.set(ShapeRenderer.ShapeType.Line);
            if (getStage() != null) {
                shapeRenderer.setColor(getStage().getDebugColor());
            }
            shapeRenderer.rect(getX() + this.padLeft, getY() + this.padBottom, getOriginX(), getOriginY(), (getWidth() - this.padLeft) - this.padRight, (getHeight() - this.padBottom) - this.padTop, getScaleX(), getScaleY(), getRotation());
        }
    }
}
