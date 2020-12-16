package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.SnapshotArray;

public class VerticalGroup extends WidgetGroup {
    private int align = 2;
    private int columnAlign;
    private FloatArray columnSizes;
    private boolean expand;
    private float fill;
    private float lastPrefWidth;
    private float padBottom;
    private float padLeft;
    private float padRight;
    private float padTop;
    private float prefHeight;
    private float prefWidth;
    private boolean reverse;
    private boolean round = true;
    private boolean sizeInvalid = true;
    private float space;
    private boolean wrap;
    private float wrapSpace;

    public VerticalGroup() {
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
        this.prefWidth = 0.0f;
        if (this.wrap) {
            this.prefHeight = 0.0f;
            FloatArray floatArray = this.columnSizes;
            if (floatArray == null) {
                this.columnSizes = new FloatArray();
            } else {
                floatArray.clear();
            }
            FloatArray floatArray2 = this.columnSizes;
            float f6 = this.space;
            float f7 = this.wrapSpace;
            float f8 = this.padTop + this.padBottom;
            float height = getHeight() - f8;
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
                    f5 = layout.getPrefWidth();
                    f4 = layout.getPrefHeight();
                    if (f4 > height) {
                        f4 = Math.max(height, layout.getMinHeight());
                    }
                } else {
                    f5 = actor.getWidth();
                    f4 = actor.getHeight();
                }
                float f9 = f4 + (f3 > 0.0f ? f6 : 0.0f);
                if (f3 + f9 <= height || f3 <= 0.0f) {
                    f4 = f9;
                } else {
                    floatArray2.add(f3);
                    floatArray2.add(f2);
                    this.prefHeight = Math.max(this.prefHeight, f3 + f8);
                    if (f > 0.0f) {
                        f += f7;
                    }
                    f += f2;
                    f3 = 0.0f;
                    f2 = 0.0f;
                }
                f3 += f4;
                f2 = Math.max(f2, f5);
                i2 += i;
            }
            floatArray2.add(f3);
            floatArray2.add(f2);
            this.prefHeight = Math.max(this.prefHeight, f3 + f8);
            if (f > 0.0f) {
                f += f7;
            }
            this.prefWidth = Math.max(this.prefWidth, f + f2);
        } else {
            this.prefHeight = this.padTop + this.padBottom + (this.space * ((float) (i3 - 1)));
            while (i2 < i3) {
                Actor actor2 = children.get(i2);
                if (actor2 instanceof Layout) {
                    Layout layout2 = (Layout) actor2;
                    this.prefWidth = Math.max(this.prefWidth, layout2.getPrefWidth());
                    this.prefHeight += layout2.getPrefHeight();
                } else {
                    this.prefWidth = Math.max(this.prefWidth, actor2.getWidth());
                    this.prefHeight += actor2.getHeight();
                }
                i2++;
            }
        }
        this.prefWidth += this.padLeft + this.padRight;
        if (this.round) {
            this.prefWidth = (float) Math.round(this.prefWidth);
            this.prefHeight = (float) Math.round(this.prefHeight);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0051  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0078  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x007c  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x007f  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00e7  */
    /* JADX WARNING: Removed duplicated region for block: B:53:0x0101  */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x010a  */
    /* JADX WARNING: Removed duplicated region for block: B:60:0x010d A[SYNTHETIC] */
    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void layout() {
        /*
        // Method dump skipped, instructions count: 279
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.VerticalGroup.layout():void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x004b  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x0051  */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x006f  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0073  */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0081  */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x00d0  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00d9  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x00eb  */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x00fd  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x0103  */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x011b  */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x0121  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x0128  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x013f  */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x0159  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x0160  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x0163 A[SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void layoutWrapped() {
        /*
        // Method dump skipped, instructions count: 369
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.VerticalGroup.layoutWrapped():void");
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
        if (this.wrap) {
            return 0.0f;
        }
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.prefHeight;
    }

    public void setRound(boolean z) {
        this.round = z;
    }

    public VerticalGroup reverse() {
        this.reverse = true;
        return this;
    }

    public VerticalGroup reverse(boolean z) {
        this.reverse = z;
        return this;
    }

    public boolean getReverse() {
        return this.reverse;
    }

    public VerticalGroup space(float f) {
        this.space = f;
        return this;
    }

    public float getSpace() {
        return this.space;
    }

    public VerticalGroup wrapSpace(float f) {
        this.wrapSpace = f;
        return this;
    }

    public float getWrapSpace() {
        return this.wrapSpace;
    }

    public VerticalGroup pad(float f) {
        this.padTop = f;
        this.padLeft = f;
        this.padBottom = f;
        this.padRight = f;
        return this;
    }

    public VerticalGroup pad(float f, float f2, float f3, float f4) {
        this.padTop = f;
        this.padLeft = f2;
        this.padBottom = f3;
        this.padRight = f4;
        return this;
    }

    public VerticalGroup padTop(float f) {
        this.padTop = f;
        return this;
    }

    public VerticalGroup padLeft(float f) {
        this.padLeft = f;
        return this;
    }

    public VerticalGroup padBottom(float f) {
        this.padBottom = f;
        return this;
    }

    public VerticalGroup padRight(float f) {
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

    public VerticalGroup align(int i) {
        this.align = i;
        return this;
    }

    public VerticalGroup center() {
        this.align = 1;
        return this;
    }

    public VerticalGroup top() {
        this.align |= 2;
        this.align &= -5;
        return this;
    }

    public VerticalGroup left() {
        this.align |= 8;
        this.align &= -17;
        return this;
    }

    public VerticalGroup bottom() {
        this.align |= 4;
        this.align &= -3;
        return this;
    }

    public VerticalGroup right() {
        this.align |= 16;
        this.align &= -9;
        return this;
    }

    public int getAlign() {
        return this.align;
    }

    public VerticalGroup fill() {
        this.fill = 1.0f;
        return this;
    }

    public VerticalGroup fill(float f) {
        this.fill = f;
        return this;
    }

    public float getFill() {
        return this.fill;
    }

    public VerticalGroup expand() {
        this.expand = true;
        return this;
    }

    public VerticalGroup expand(boolean z) {
        this.expand = z;
        return this;
    }

    public boolean getExpand() {
        return this.expand;
    }

    public VerticalGroup grow() {
        this.expand = true;
        this.fill = 1.0f;
        return this;
    }

    public VerticalGroup wrap() {
        this.wrap = true;
        return this;
    }

    public VerticalGroup wrap(boolean z) {
        this.wrap = z;
        return this;
    }

    public boolean getWrap() {
        return this.wrap;
    }

    public VerticalGroup columnAlign(int i) {
        this.columnAlign = i;
        return this;
    }

    public VerticalGroup columnCenter() {
        this.columnAlign = 1;
        return this;
    }

    public VerticalGroup columnTop() {
        this.columnAlign |= 2;
        this.columnAlign &= -5;
        return this;
    }

    public VerticalGroup columnLeft() {
        this.columnAlign |= 8;
        this.columnAlign &= -17;
        return this;
    }

    public VerticalGroup columnBottom() {
        this.columnAlign |= 4;
        this.columnAlign &= -3;
        return this;
    }

    public VerticalGroup columnRight() {
        this.columnAlign |= 16;
        this.columnAlign &= -9;
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
