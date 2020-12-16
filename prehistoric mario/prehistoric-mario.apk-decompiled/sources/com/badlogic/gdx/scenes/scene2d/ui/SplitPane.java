package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.scenes.scene2d.utils.ScissorStack;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class SplitPane extends WidgetGroup {
    boolean cursorOverHandle;
    private Actor firstWidget;
    private Rectangle firstWidgetBounds;
    Rectangle handleBounds;
    Vector2 handlePosition;
    Vector2 lastPoint;
    float maxAmount;
    float minAmount;
    private Actor secondWidget;
    private Rectangle secondWidgetBounds;
    float splitAmount;
    SplitPaneStyle style;
    private Rectangle tempScissors;
    boolean vertical;

    /* JADX WARNING: Illegal instructions before constructor call */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public SplitPane(com.badlogic.gdx.scenes.scene2d.Actor r9, com.badlogic.gdx.scenes.scene2d.Actor r10, boolean r11, com.badlogic.gdx.scenes.scene2d.ui.Skin r12) {
        /*
            r8 = this;
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "default-"
            r0.append(r1)
            if (r11 == 0) goto L_0x000f
            java.lang.String r1 = "vertical"
            goto L_0x0011
        L_0x000f:
            java.lang.String r1 = "horizontal"
        L_0x0011:
            r0.append(r1)
            java.lang.String r7 = r0.toString()
            r2 = r8
            r3 = r9
            r4 = r10
            r5 = r11
            r6 = r12
            r2.<init>(r3, r4, r5, r6, r7)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.SplitPane.<init>(com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.Actor, boolean, com.badlogic.gdx.scenes.scene2d.ui.Skin):void");
    }

    public SplitPane(Actor actor, Actor actor2, boolean z, Skin skin, String str) {
        this(actor, actor2, z, (SplitPaneStyle) skin.get(str, SplitPaneStyle.class));
    }

    public SplitPane(Actor actor, Actor actor2, boolean z, SplitPaneStyle splitPaneStyle) {
        this.splitAmount = 0.5f;
        this.maxAmount = 1.0f;
        this.firstWidgetBounds = new Rectangle();
        this.secondWidgetBounds = new Rectangle();
        this.handleBounds = new Rectangle();
        this.tempScissors = new Rectangle();
        this.lastPoint = new Vector2();
        this.handlePosition = new Vector2();
        this.vertical = z;
        setStyle(splitPaneStyle);
        setFirstWidget(actor);
        setSecondWidget(actor2);
        setSize(getPrefWidth(), getPrefHeight());
        initialize();
    }

    private void initialize() {
        addListener(new InputListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.SplitPane.AnonymousClass1 */
            int draggingPointer = -1;

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                if (this.draggingPointer != -1) {
                    return false;
                }
                if ((i == 0 && i2 != 0) || !SplitPane.this.handleBounds.contains(f, f2)) {
                    return false;
                }
                this.draggingPointer = i;
                SplitPane.this.lastPoint.set(f, f2);
                SplitPane.this.handlePosition.set(SplitPane.this.handleBounds.x, SplitPane.this.handleBounds.y);
                return true;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                if (i == this.draggingPointer) {
                    this.draggingPointer = -1;
                }
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchDragged(InputEvent inputEvent, float f, float f2, int i) {
                if (i == this.draggingPointer) {
                    Drawable drawable = SplitPane.this.style.handle;
                    if (!SplitPane.this.vertical) {
                        float width = SplitPane.this.getWidth() - drawable.getMinWidth();
                        float f3 = SplitPane.this.handlePosition.x + (f - SplitPane.this.lastPoint.x);
                        SplitPane.this.handlePosition.x = f3;
                        float min = Math.min(width, Math.max(0.0f, f3));
                        SplitPane splitPane = SplitPane.this;
                        splitPane.splitAmount = min / width;
                        splitPane.lastPoint.set(f, f2);
                    } else {
                        float height = SplitPane.this.getHeight() - drawable.getMinHeight();
                        float f4 = SplitPane.this.handlePosition.y + (f2 - SplitPane.this.lastPoint.y);
                        SplitPane.this.handlePosition.y = f4;
                        float min2 = Math.min(height, Math.max(0.0f, f4));
                        SplitPane splitPane2 = SplitPane.this;
                        splitPane2.splitAmount = 1.0f - (min2 / height);
                        splitPane2.lastPoint.set(f, f2);
                    }
                    SplitPane.this.invalidate();
                }
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean mouseMoved(InputEvent inputEvent, float f, float f2) {
                SplitPane splitPane = SplitPane.this;
                splitPane.cursorOverHandle = splitPane.handleBounds.contains(f, f2);
                return false;
            }
        });
    }

    public void setStyle(SplitPaneStyle splitPaneStyle) {
        this.style = splitPaneStyle;
        invalidateHierarchy();
    }

    public SplitPaneStyle getStyle() {
        return this.style;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void layout() {
        clampSplitAmount();
        if (!this.vertical) {
            calculateHorizBoundsAndPositions();
        } else {
            calculateVertBoundsAndPositions();
        }
        Actor actor = this.firstWidget;
        if (actor != null) {
            Rectangle rectangle = this.firstWidgetBounds;
            actor.setBounds(rectangle.x, rectangle.y, rectangle.width, rectangle.height);
            if (actor instanceof Layout) {
                ((Layout) actor).validate();
            }
        }
        Actor actor2 = this.secondWidget;
        if (actor2 != null) {
            Rectangle rectangle2 = this.secondWidgetBounds;
            actor2.setBounds(rectangle2.x, rectangle2.y, rectangle2.width, rectangle2.height);
            if (actor2 instanceof Layout) {
                ((Layout) actor2).validate();
            }
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefWidth() {
        float f;
        Actor actor = this.firstWidget;
        float f2 = 0.0f;
        if (actor == null) {
            f = 0.0f;
        } else {
            f = actor instanceof Layout ? ((Layout) actor).getPrefWidth() : actor.getWidth();
        }
        Actor actor2 = this.secondWidget;
        if (actor2 != null) {
            f2 = actor2 instanceof Layout ? ((Layout) actor2).getPrefWidth() : actor2.getWidth();
        }
        if (this.vertical) {
            return Math.max(f, f2);
        }
        return f + this.style.handle.getMinWidth() + f2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefHeight() {
        float f;
        Actor actor = this.firstWidget;
        float f2 = 0.0f;
        if (actor == null) {
            f = 0.0f;
        } else {
            f = actor instanceof Layout ? ((Layout) actor).getPrefHeight() : actor.getHeight();
        }
        Actor actor2 = this.secondWidget;
        if (actor2 != null) {
            f2 = actor2 instanceof Layout ? ((Layout) actor2).getPrefHeight() : actor2.getHeight();
        }
        if (!this.vertical) {
            return Math.max(f, f2);
        }
        return f + this.style.handle.getMinHeight() + f2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinWidth() {
        Actor actor = this.firstWidget;
        float f = 0.0f;
        float minWidth = actor instanceof Layout ? ((Layout) actor).getMinWidth() : 0.0f;
        Actor actor2 = this.secondWidget;
        if (actor2 instanceof Layout) {
            f = ((Layout) actor2).getMinWidth();
        }
        if (this.vertical) {
            return Math.max(minWidth, f);
        }
        return minWidth + this.style.handle.getMinWidth() + f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinHeight() {
        Actor actor = this.firstWidget;
        float f = 0.0f;
        float minHeight = actor instanceof Layout ? ((Layout) actor).getMinHeight() : 0.0f;
        Actor actor2 = this.secondWidget;
        if (actor2 instanceof Layout) {
            f = ((Layout) actor2).getMinHeight();
        }
        if (!this.vertical) {
            return Math.max(minHeight, f);
        }
        return minHeight + this.style.handle.getMinHeight() + f;
    }

    public void setVertical(boolean z) {
        if (this.vertical != z) {
            this.vertical = z;
            invalidateHierarchy();
        }
    }

    public boolean isVertical() {
        return this.vertical;
    }

    private void calculateHorizBoundsAndPositions() {
        Drawable drawable = this.style.handle;
        float height = getHeight();
        float width = getWidth() - drawable.getMinWidth();
        float f = (float) ((int) (this.splitAmount * width));
        float minWidth = drawable.getMinWidth();
        this.firstWidgetBounds.set(0.0f, 0.0f, f, height);
        this.secondWidgetBounds.set(f + minWidth, 0.0f, width - f, height);
        this.handleBounds.set(f, 0.0f, minWidth, height);
    }

    private void calculateVertBoundsAndPositions() {
        Drawable drawable = this.style.handle;
        float width = getWidth();
        float height = getHeight();
        float minHeight = height - drawable.getMinHeight();
        float f = (float) ((int) (this.splitAmount * minHeight));
        float f2 = minHeight - f;
        float minHeight2 = drawable.getMinHeight();
        this.firstWidgetBounds.set(0.0f, height - f, width, f);
        this.secondWidgetBounds.set(0.0f, 0.0f, width, f2);
        this.handleBounds.set(0.0f, f2, width, minHeight2);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void draw(Batch batch, float f) {
        Stage stage = getStage();
        if (stage != null) {
            validate();
            Color color = getColor();
            float f2 = color.a * f;
            applyTransform(batch, computeTransform());
            Actor actor = this.firstWidget;
            if (actor != null && actor.isVisible()) {
                batch.flush();
                stage.calculateScissors(this.firstWidgetBounds, this.tempScissors);
                if (ScissorStack.pushScissors(this.tempScissors)) {
                    this.firstWidget.draw(batch, f2);
                    batch.flush();
                    ScissorStack.popScissors();
                }
            }
            Actor actor2 = this.secondWidget;
            if (actor2 != null && actor2.isVisible()) {
                batch.flush();
                stage.calculateScissors(this.secondWidgetBounds, this.tempScissors);
                if (ScissorStack.pushScissors(this.tempScissors)) {
                    this.secondWidget.draw(batch, f2);
                    batch.flush();
                    ScissorStack.popScissors();
                }
            }
            batch.setColor(color.r, color.g, color.b, f2);
            this.style.handle.draw(batch, this.handleBounds.x, this.handleBounds.y, this.handleBounds.width, this.handleBounds.height);
            resetTransform(batch);
        }
    }

    public void setSplitAmount(float f) {
        this.splitAmount = f;
        invalidate();
    }

    public float getSplitAmount() {
        return this.splitAmount;
    }

    /* access modifiers changed from: protected */
    public void clampSplitAmount() {
        float f = this.minAmount;
        float f2 = this.maxAmount;
        if (this.vertical) {
            float height = getHeight() - this.style.handle.getMinHeight();
            Actor actor = this.firstWidget;
            if (actor instanceof Layout) {
                f = Math.max(f, Math.min(((Layout) actor).getMinHeight() / height, 1.0f));
            }
            Actor actor2 = this.secondWidget;
            if (actor2 instanceof Layout) {
                f2 = Math.min(f2, 1.0f - Math.min(((Layout) actor2).getMinHeight() / height, 1.0f));
            }
        } else {
            float width = getWidth() - this.style.handle.getMinWidth();
            Actor actor3 = this.firstWidget;
            if (actor3 instanceof Layout) {
                f = Math.max(f, Math.min(((Layout) actor3).getMinWidth() / width, 1.0f));
            }
            Actor actor4 = this.secondWidget;
            if (actor4 instanceof Layout) {
                f2 = Math.min(f2, 1.0f - Math.min(((Layout) actor4).getMinWidth() / width, 1.0f));
            }
        }
        if (f > f2) {
            this.splitAmount = (f + f2) * 0.5f;
        } else {
            this.splitAmount = Math.max(Math.min(this.splitAmount, f2), f);
        }
    }

    public float getMinSplitAmount() {
        return this.minAmount;
    }

    public void setMinSplitAmount(float f) {
        if (f < 0.0f || f > 1.0f) {
            throw new GdxRuntimeException("minAmount has to be >= 0 and <= 1");
        }
        this.minAmount = f;
    }

    public float getMaxSplitAmount() {
        return this.maxAmount;
    }

    public void setMaxSplitAmount(float f) {
        if (f < 0.0f || f > 1.0f) {
            throw new GdxRuntimeException("maxAmount has to be >= 0 and <= 1");
        }
        this.maxAmount = f;
    }

    public void setFirstWidget(Actor actor) {
        Actor actor2 = this.firstWidget;
        if (actor2 != null) {
            super.removeActor(actor2);
        }
        this.firstWidget = actor;
        if (actor != null) {
            super.addActor(actor);
        }
        invalidate();
    }

    public void setSecondWidget(Actor actor) {
        Actor actor2 = this.secondWidget;
        if (actor2 != null) {
            super.removeActor(actor2);
        }
        this.secondWidget = actor;
        if (actor != null) {
            super.addActor(actor);
        }
        invalidate();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActor(Actor actor) {
        throw new UnsupportedOperationException("Use SplitPane#setWidget.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActorAt(int i, Actor actor) {
        throw new UnsupportedOperationException("Use SplitPane#setWidget.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActorBefore(Actor actor, Actor actor2) {
        throw new UnsupportedOperationException("Use SplitPane#setWidget.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public boolean removeActor(Actor actor) {
        if (actor == null) {
            throw new IllegalArgumentException("actor cannot be null.");
        } else if (actor == this.firstWidget) {
            setFirstWidget(null);
            return true;
        } else {
            if (actor == this.secondWidget) {
                setSecondWidget(null);
            }
            return true;
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public boolean removeActor(Actor actor, boolean z) {
        if (actor == null) {
            throw new IllegalArgumentException("actor cannot be null.");
        } else if (actor == this.firstWidget) {
            super.removeActor(actor, z);
            this.firstWidget = null;
            invalidate();
            return true;
        } else if (actor != this.secondWidget) {
            return false;
        } else {
            super.removeActor(actor, z);
            this.secondWidget = null;
            invalidate();
            return true;
        }
    }

    public boolean isCursorOverHandle() {
        return this.cursorOverHandle;
    }

    public static class SplitPaneStyle {
        public Drawable handle;

        public SplitPaneStyle() {
        }

        public SplitPaneStyle(Drawable drawable) {
            this.handle = drawable;
        }

        public SplitPaneStyle(SplitPaneStyle splitPaneStyle) {
            this.handle = splitPaneStyle.handle;
        }
    }
}
