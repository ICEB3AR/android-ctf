package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Event;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener;
import com.badlogic.gdx.scenes.scene2d.utils.Cullable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;

public class ScrollPane extends WidgetGroup {
    float amountX;
    float amountY;
    float areaHeight;
    float areaWidth;
    boolean cancelTouchFocus;
    private boolean clamp;
    boolean disableX;
    boolean disableY;
    int draggingPointer;
    float fadeAlpha;
    float fadeAlphaSeconds;
    float fadeDelay;
    float fadeDelaySeconds;
    boolean fadeScrollBars;
    boolean flickScroll;
    private ActorGestureListener flickScrollListener;
    float flingTime;
    float flingTimer;
    private boolean forceScrollX;
    private boolean forceScrollY;
    final Rectangle hKnobBounds;
    final Rectangle hScrollBounds;
    boolean hScrollOnBottom;
    final Vector2 lastPoint;
    float maxX;
    float maxY;
    private float overscrollDistance;
    private float overscrollSpeedMax;
    private float overscrollSpeedMin;
    private boolean overscrollX;
    private boolean overscrollY;
    boolean scrollBarTouch;
    boolean scrollX;
    boolean scrollY;
    private boolean scrollbarsOnTop;
    boolean smoothScrolling;
    private ScrollPaneStyle style;
    boolean touchScrollH;
    boolean touchScrollV;
    final Rectangle vKnobBounds;
    final Rectangle vScrollBounds;
    boolean vScrollOnRight;
    private boolean variableSizeKnobs;
    float velocityX;
    float velocityY;
    float visualAmountX;
    float visualAmountY;
    private Actor widget;
    private final Rectangle widgetAreaBounds;
    private final Rectangle widgetCullingArea;

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinHeight() {
        return 0.0f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinWidth() {
        return 0.0f;
    }

    public ScrollPane(Actor actor) {
        this(actor, new ScrollPaneStyle());
    }

    public ScrollPane(Actor actor, Skin skin) {
        this(actor, (ScrollPaneStyle) skin.get(ScrollPaneStyle.class));
    }

    public ScrollPane(Actor actor, Skin skin, String str) {
        this(actor, (ScrollPaneStyle) skin.get(str, ScrollPaneStyle.class));
    }

    public ScrollPane(Actor actor, ScrollPaneStyle scrollPaneStyle) {
        this.hScrollBounds = new Rectangle();
        this.vScrollBounds = new Rectangle();
        this.hKnobBounds = new Rectangle();
        this.vKnobBounds = new Rectangle();
        this.widgetAreaBounds = new Rectangle();
        this.widgetCullingArea = new Rectangle();
        this.vScrollOnRight = true;
        this.hScrollOnBottom = true;
        this.lastPoint = new Vector2();
        this.fadeScrollBars = true;
        this.smoothScrolling = true;
        this.scrollBarTouch = true;
        this.fadeAlphaSeconds = 1.0f;
        this.fadeDelaySeconds = 1.0f;
        this.cancelTouchFocus = true;
        this.flickScroll = true;
        this.overscrollX = true;
        this.overscrollY = true;
        this.flingTime = 1.0f;
        this.overscrollDistance = 50.0f;
        this.overscrollSpeedMin = 30.0f;
        this.overscrollSpeedMax = 200.0f;
        this.clamp = true;
        this.variableSizeKnobs = true;
        this.draggingPointer = -1;
        if (scrollPaneStyle != null) {
            this.style = scrollPaneStyle;
            setActor(actor);
            setSize(150.0f, 150.0f);
            addCaptureListener(new InputListener() {
                /* class com.badlogic.gdx.scenes.scene2d.ui.ScrollPane.AnonymousClass1 */
                private float handlePosition;

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                    int i3 = -1;
                    if (ScrollPane.this.draggingPointer != -1) {
                        return false;
                    }
                    if (i == 0 && i2 != 0) {
                        return false;
                    }
                    if (ScrollPane.this.getStage() != null) {
                        ScrollPane.this.getStage().setScrollFocus(ScrollPane.this);
                    }
                    if (!ScrollPane.this.flickScroll) {
                        ScrollPane.this.setScrollbarsVisible(true);
                    }
                    if (ScrollPane.this.fadeAlpha == 0.0f) {
                        return false;
                    }
                    if (ScrollPane.this.scrollBarTouch && ScrollPane.this.scrollX && ScrollPane.this.hScrollBounds.contains(f, f2)) {
                        inputEvent.stop();
                        ScrollPane.this.setScrollbarsVisible(true);
                        if (ScrollPane.this.hKnobBounds.contains(f, f2)) {
                            ScrollPane.this.lastPoint.set(f, f2);
                            this.handlePosition = ScrollPane.this.hKnobBounds.x;
                            ScrollPane scrollPane = ScrollPane.this;
                            scrollPane.touchScrollH = true;
                            scrollPane.draggingPointer = i;
                            return true;
                        }
                        ScrollPane scrollPane2 = ScrollPane.this;
                        float f3 = scrollPane2.amountX;
                        float f4 = ScrollPane.this.areaWidth;
                        if (f >= ScrollPane.this.hKnobBounds.x) {
                            i3 = 1;
                        }
                        scrollPane2.setScrollX(f3 + (f4 * ((float) i3)));
                        return true;
                    } else if (!ScrollPane.this.scrollBarTouch || !ScrollPane.this.scrollY || !ScrollPane.this.vScrollBounds.contains(f, f2)) {
                        return false;
                    } else {
                        inputEvent.stop();
                        ScrollPane.this.setScrollbarsVisible(true);
                        if (ScrollPane.this.vKnobBounds.contains(f, f2)) {
                            ScrollPane.this.lastPoint.set(f, f2);
                            this.handlePosition = ScrollPane.this.vKnobBounds.y;
                            ScrollPane scrollPane3 = ScrollPane.this;
                            scrollPane3.touchScrollV = true;
                            scrollPane3.draggingPointer = i;
                            return true;
                        }
                        ScrollPane scrollPane4 = ScrollPane.this;
                        float f5 = scrollPane4.amountY;
                        float f6 = ScrollPane.this.areaHeight;
                        if (f2 < ScrollPane.this.vKnobBounds.y) {
                            i3 = 1;
                        }
                        scrollPane4.setScrollY(f5 + (f6 * ((float) i3)));
                        return true;
                    }
                }

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                    if (i == ScrollPane.this.draggingPointer) {
                        ScrollPane.this.cancel();
                    }
                }

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public void touchDragged(InputEvent inputEvent, float f, float f2, int i) {
                    if (i == ScrollPane.this.draggingPointer) {
                        if (ScrollPane.this.touchScrollH) {
                            float f3 = this.handlePosition + (f - ScrollPane.this.lastPoint.x);
                            this.handlePosition = f3;
                            float min = Math.min((ScrollPane.this.hScrollBounds.x + ScrollPane.this.hScrollBounds.width) - ScrollPane.this.hKnobBounds.width, Math.max(ScrollPane.this.hScrollBounds.x, f3));
                            float f4 = ScrollPane.this.hScrollBounds.width - ScrollPane.this.hKnobBounds.width;
                            if (f4 != 0.0f) {
                                ScrollPane scrollPane = ScrollPane.this;
                                scrollPane.setScrollPercentX((min - scrollPane.hScrollBounds.x) / f4);
                            }
                            ScrollPane.this.lastPoint.set(f, f2);
                        } else if (ScrollPane.this.touchScrollV) {
                            float f5 = this.handlePosition + (f2 - ScrollPane.this.lastPoint.y);
                            this.handlePosition = f5;
                            float min2 = Math.min((ScrollPane.this.vScrollBounds.y + ScrollPane.this.vScrollBounds.height) - ScrollPane.this.vKnobBounds.height, Math.max(ScrollPane.this.vScrollBounds.y, f5));
                            float f6 = ScrollPane.this.vScrollBounds.height - ScrollPane.this.vKnobBounds.height;
                            if (f6 != 0.0f) {
                                ScrollPane scrollPane2 = ScrollPane.this;
                                scrollPane2.setScrollPercentY(1.0f - ((min2 - scrollPane2.vScrollBounds.y) / f6));
                            }
                            ScrollPane.this.lastPoint.set(f, f2);
                        }
                    }
                }

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public boolean mouseMoved(InputEvent inputEvent, float f, float f2) {
                    if (ScrollPane.this.flickScroll) {
                        return false;
                    }
                    ScrollPane.this.setScrollbarsVisible(true);
                    return false;
                }
            });
            this.flickScrollListener = new ActorGestureListener() {
                /* class com.badlogic.gdx.scenes.scene2d.ui.ScrollPane.AnonymousClass2 */

                @Override // com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener
                public void pan(InputEvent inputEvent, float f, float f2, float f3, float f4) {
                    ScrollPane.this.setScrollbarsVisible(true);
                    ScrollPane.this.amountX -= f3;
                    ScrollPane.this.amountY += f4;
                    ScrollPane.this.clamp();
                    if (!ScrollPane.this.cancelTouchFocus) {
                        return;
                    }
                    if ((ScrollPane.this.scrollX && f3 != 0.0f) || (ScrollPane.this.scrollY && f4 != 0.0f)) {
                        ScrollPane.this.cancelTouchFocus();
                    }
                }

                @Override // com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener
                public void fling(InputEvent inputEvent, float f, float f2, int i) {
                    if (Math.abs(f) > 150.0f && ScrollPane.this.scrollX) {
                        ScrollPane scrollPane = ScrollPane.this;
                        scrollPane.flingTimer = scrollPane.flingTime;
                        ScrollPane scrollPane2 = ScrollPane.this;
                        scrollPane2.velocityX = f;
                        if (scrollPane2.cancelTouchFocus) {
                            ScrollPane.this.cancelTouchFocus();
                        }
                    }
                    if (Math.abs(f2) > 150.0f && ScrollPane.this.scrollY) {
                        ScrollPane scrollPane3 = ScrollPane.this;
                        scrollPane3.flingTimer = scrollPane3.flingTime;
                        ScrollPane scrollPane4 = ScrollPane.this;
                        scrollPane4.velocityY = -f2;
                        if (scrollPane4.cancelTouchFocus) {
                            ScrollPane.this.cancelTouchFocus();
                        }
                    }
                }

                @Override // com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener, com.badlogic.gdx.scenes.scene2d.EventListener
                public boolean handle(Event event) {
                    if (super.handle(event)) {
                        if (((InputEvent) event).getType() != InputEvent.Type.touchDown) {
                            return true;
                        }
                        ScrollPane.this.flingTimer = 0.0f;
                        return true;
                    } else if (!(event instanceof InputEvent) || !((InputEvent) event).isTouchFocusCancel()) {
                        return false;
                    } else {
                        ScrollPane.this.cancel();
                        return false;
                    }
                }
            };
            addListener(this.flickScrollListener);
            addListener(new InputListener() {
                /* class com.badlogic.gdx.scenes.scene2d.ui.ScrollPane.AnonymousClass3 */

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public boolean scrolled(InputEvent inputEvent, float f, float f2, int i) {
                    ScrollPane.this.setScrollbarsVisible(true);
                    if (ScrollPane.this.scrollY) {
                        ScrollPane scrollPane = ScrollPane.this;
                        scrollPane.setScrollY(scrollPane.amountY + (ScrollPane.this.getMouseWheelY() * ((float) i)));
                    } else if (!ScrollPane.this.scrollX) {
                        return false;
                    } else {
                        ScrollPane scrollPane2 = ScrollPane.this;
                        scrollPane2.setScrollX(scrollPane2.amountX + (ScrollPane.this.getMouseWheelX() * ((float) i)));
                    }
                    return true;
                }
            });
            return;
        }
        throw new IllegalArgumentException("style cannot be null.");
    }

    public void setScrollbarsVisible(boolean z) {
        if (z) {
            this.fadeAlpha = this.fadeAlphaSeconds;
            this.fadeDelay = this.fadeDelaySeconds;
            return;
        }
        this.fadeAlpha = 0.0f;
        this.fadeDelay = 0.0f;
    }

    public void cancelTouchFocus() {
        Stage stage = getStage();
        if (stage != null) {
            stage.cancelTouchFocusExcept(this.flickScrollListener, this);
        }
    }

    public void cancel() {
        this.draggingPointer = -1;
        this.touchScrollH = false;
        this.touchScrollV = false;
        this.flickScrollListener.getGestureDetector().cancel();
    }

    /* access modifiers changed from: package-private */
    public void clamp() {
        float f;
        float f2;
        if (this.clamp) {
            if (this.overscrollX) {
                float f3 = this.amountX;
                float f4 = this.overscrollDistance;
                f = MathUtils.clamp(f3, -f4, this.maxX + f4);
            } else {
                f = MathUtils.clamp(this.amountX, 0.0f, this.maxX);
            }
            scrollX(f);
            if (this.overscrollY) {
                float f5 = this.amountY;
                float f6 = this.overscrollDistance;
                f2 = MathUtils.clamp(f5, -f6, this.maxY + f6);
            } else {
                f2 = MathUtils.clamp(this.amountY, 0.0f, this.maxY);
            }
            scrollY(f2);
        }
    }

    public void setStyle(ScrollPaneStyle scrollPaneStyle) {
        if (scrollPaneStyle != null) {
            this.style = scrollPaneStyle;
            invalidateHierarchy();
            return;
        }
        throw new IllegalArgumentException("style cannot be null.");
    }

    public ScrollPaneStyle getStyle() {
        return this.style;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public void act(float f) {
        boolean z;
        Stage stage;
        super.act(f);
        boolean isPanning = this.flickScrollListener.getGestureDetector().isPanning();
        float f2 = this.fadeAlpha;
        if (f2 <= 0.0f || !this.fadeScrollBars || isPanning || this.touchScrollH || this.touchScrollV) {
            z = false;
        } else {
            this.fadeDelay -= f;
            if (this.fadeDelay <= 0.0f) {
                this.fadeAlpha = Math.max(0.0f, f2 - f);
            }
            z = true;
        }
        if (this.flingTimer > 0.0f) {
            setScrollbarsVisible(true);
            float f3 = this.flingTimer / this.flingTime;
            this.amountX -= (this.velocityX * f3) * f;
            this.amountY -= (this.velocityY * f3) * f;
            clamp();
            if (this.amountX == (-this.overscrollDistance)) {
                this.velocityX = 0.0f;
            }
            if (this.amountX >= this.maxX + this.overscrollDistance) {
                this.velocityX = 0.0f;
            }
            if (this.amountY == (-this.overscrollDistance)) {
                this.velocityY = 0.0f;
            }
            if (this.amountY >= this.maxY + this.overscrollDistance) {
                this.velocityY = 0.0f;
            }
            this.flingTimer -= f;
            if (this.flingTimer <= 0.0f) {
                this.velocityX = 0.0f;
                this.velocityY = 0.0f;
            }
            z = true;
        }
        if (!this.smoothScrolling || this.flingTimer > 0.0f || isPanning || ((this.touchScrollH && (!this.scrollX || this.maxX / (this.hScrollBounds.width - this.hKnobBounds.width) <= this.areaWidth * 0.1f)) || (this.touchScrollV && (!this.scrollY || this.maxY / (this.vScrollBounds.height - this.vKnobBounds.height) <= this.areaHeight * 0.1f)))) {
            float f4 = this.visualAmountX;
            float f5 = this.amountX;
            if (f4 != f5) {
                visualScrollX(f5);
            }
            float f6 = this.visualAmountY;
            float f7 = this.amountY;
            if (f6 != f7) {
                visualScrollY(f7);
            }
        } else {
            float f8 = this.visualAmountX;
            float f9 = this.amountX;
            if (f8 != f9) {
                if (f8 < f9) {
                    visualScrollX(Math.min(f9, f8 + Math.max(f * 200.0f, (f9 - f8) * 7.0f * f)));
                } else {
                    visualScrollX(Math.max(f9, f8 - Math.max(f * 200.0f, ((f8 - f9) * 7.0f) * f)));
                }
                z = true;
            }
            float f10 = this.visualAmountY;
            float f11 = this.amountY;
            if (f10 != f11) {
                if (f10 < f11) {
                    visualScrollY(Math.min(f11, f10 + Math.max(200.0f * f, (f11 - f10) * 7.0f * f)));
                } else {
                    visualScrollY(Math.max(f11, f10 - Math.max(200.0f * f, ((f10 - f11) * 7.0f) * f)));
                }
                z = true;
            }
        }
        if (!isPanning) {
            if (this.overscrollX && this.scrollX) {
                float f12 = this.amountX;
                if (f12 < 0.0f) {
                    setScrollbarsVisible(true);
                    float f13 = this.amountX;
                    float f14 = this.overscrollSpeedMin;
                    this.amountX = f13 + ((f14 + (((this.overscrollSpeedMax - f14) * (-f13)) / this.overscrollDistance)) * f);
                    if (this.amountX > 0.0f) {
                        scrollX(0.0f);
                    }
                } else if (f12 > this.maxX) {
                    setScrollbarsVisible(true);
                    float f15 = this.amountX;
                    float f16 = this.overscrollSpeedMin;
                    float f17 = this.maxX;
                    this.amountX = f15 - ((f16 + (((this.overscrollSpeedMax - f16) * (-(f17 - f15))) / this.overscrollDistance)) * f);
                    if (this.amountX < f17) {
                        scrollX(f17);
                    }
                }
                z = true;
            }
            if (this.overscrollY && this.scrollY) {
                float f18 = this.amountY;
                if (f18 < 0.0f) {
                    setScrollbarsVisible(true);
                    float f19 = this.amountY;
                    float f20 = this.overscrollSpeedMin;
                    this.amountY = f19 + ((f20 + (((this.overscrollSpeedMax - f20) * (-f19)) / this.overscrollDistance)) * f);
                    if (this.amountY > 0.0f) {
                        scrollY(0.0f);
                    }
                } else if (f18 > this.maxY) {
                    setScrollbarsVisible(true);
                    float f21 = this.amountY;
                    float f22 = this.overscrollSpeedMin;
                    float f23 = this.maxY;
                    this.amountY = f21 - ((f22 + (((this.overscrollSpeedMax - f22) * (-(f23 - f21))) / this.overscrollDistance)) * f);
                    if (this.amountY < f23) {
                        scrollY(f23);
                    }
                }
                z = true;
            }
        }
        if (z && (stage = getStage()) != null && stage.getActionsRequestRendering()) {
            Gdx.graphics.requestRendering();
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void layout() {
        float f;
        float f2;
        float f3;
        float f4;
        float f5;
        float f6;
        Drawable drawable = this.style.background;
        Drawable drawable2 = this.style.hScrollKnob;
        Drawable drawable3 = this.style.vScrollKnob;
        if (drawable != null) {
            f3 = drawable.getLeftWidth();
            f2 = drawable.getRightWidth();
            f = drawable.getTopHeight();
            f4 = drawable.getBottomHeight();
        } else {
            f4 = 0.0f;
            f3 = 0.0f;
            f2 = 0.0f;
            f = 0.0f;
        }
        float width = getWidth();
        float height = getHeight();
        float minHeight = drawable2 != null ? drawable2.getMinHeight() : 0.0f;
        if (this.style.hScroll != null) {
            minHeight = Math.max(minHeight, this.style.hScroll.getMinHeight());
        }
        float minWidth = drawable3 != null ? drawable3.getMinWidth() : 0.0f;
        if (this.style.vScroll != null) {
            minWidth = Math.max(minWidth, this.style.vScroll.getMinWidth());
        }
        this.areaWidth = (width - f3) - f2;
        float f7 = height - f;
        this.areaHeight = f7 - f4;
        Actor actor = this.widget;
        if (actor != null) {
            if (actor instanceof Layout) {
                Layout layout = (Layout) actor;
                f5 = layout.getPrefWidth();
                f6 = layout.getPrefHeight();
            } else {
                f5 = actor.getWidth();
                f6 = this.widget.getHeight();
            }
            boolean z = false;
            this.scrollX = this.forceScrollX || (f5 > this.areaWidth && !this.disableX);
            if (this.forceScrollY || (f6 > this.areaHeight && !this.disableY)) {
                z = true;
            }
            this.scrollY = z;
            boolean z2 = this.fadeScrollBars;
            if (!z2) {
                if (this.scrollY) {
                    this.areaWidth -= minWidth;
                    if (!this.scrollX && f5 > this.areaWidth && !this.disableX) {
                        this.scrollX = true;
                    }
                }
                if (this.scrollX) {
                    this.areaHeight -= minHeight;
                    if (!this.scrollY && f6 > this.areaHeight && !this.disableY) {
                        this.scrollY = true;
                        this.areaWidth -= minWidth;
                    }
                }
            }
            this.widgetAreaBounds.set(f3, f4, this.areaWidth, this.areaHeight);
            if (z2) {
                if (this.scrollX && this.scrollY) {
                    this.areaHeight -= minHeight;
                    this.areaWidth -= minWidth;
                }
            } else if (this.scrollbarsOnTop) {
                if (this.scrollX) {
                    this.widgetAreaBounds.height += minHeight;
                }
                if (this.scrollY) {
                    this.widgetAreaBounds.width += minWidth;
                }
            } else {
                if (this.scrollX && this.hScrollOnBottom) {
                    this.widgetAreaBounds.y += minHeight;
                }
                if (this.scrollY && !this.vScrollOnRight) {
                    this.widgetAreaBounds.x += minWidth;
                }
            }
            float max = this.disableX ? this.areaWidth : Math.max(this.areaWidth, f5);
            float max2 = this.disableY ? this.areaHeight : Math.max(this.areaHeight, f6);
            this.maxX = max - this.areaWidth;
            this.maxY = max2 - this.areaHeight;
            if (z2 && this.scrollX && this.scrollY) {
                this.maxY -= minHeight;
                this.maxX -= minWidth;
            }
            scrollX(MathUtils.clamp(this.amountX, 0.0f, this.maxX));
            scrollY(MathUtils.clamp(this.amountY, 0.0f, this.maxY));
            if (this.scrollX) {
                if (drawable2 != null) {
                    float minHeight2 = this.style.hScroll != null ? this.style.hScroll.getMinHeight() : drawable2.getMinHeight();
                    this.hScrollBounds.set(this.vScrollOnRight ? f3 : minWidth + f3, this.hScrollOnBottom ? f4 : f7 - minHeight2, this.areaWidth, minHeight2);
                    if (this.variableSizeKnobs) {
                        this.hKnobBounds.width = Math.max(drawable2.getMinWidth(), (float) ((int) ((this.hScrollBounds.width * this.areaWidth) / max)));
                    } else {
                        this.hKnobBounds.width = drawable2.getMinWidth();
                    }
                    if (this.hKnobBounds.width > max) {
                        this.hKnobBounds.width = 0.0f;
                    }
                    this.hKnobBounds.height = drawable2.getMinHeight();
                    this.hKnobBounds.x = this.hScrollBounds.x + ((float) ((int) ((this.hScrollBounds.width - this.hKnobBounds.width) * getScrollPercentX())));
                    this.hKnobBounds.y = this.hScrollBounds.y;
                } else {
                    this.hScrollBounds.set(0.0f, 0.0f, 0.0f, 0.0f);
                    this.hKnobBounds.set(0.0f, 0.0f, 0.0f, 0.0f);
                }
            }
            if (this.scrollY) {
                if (drawable3 != null) {
                    float minWidth2 = this.style.vScroll != null ? this.style.vScroll.getMinWidth() : drawable3.getMinWidth();
                    if (this.hScrollOnBottom) {
                        f4 = f7 - this.areaHeight;
                    }
                    this.vScrollBounds.set(this.vScrollOnRight ? (width - f2) - minWidth2 : f3, f4, minWidth2, this.areaHeight);
                    this.vKnobBounds.width = drawable3.getMinWidth();
                    if (this.variableSizeKnobs) {
                        this.vKnobBounds.height = Math.max(drawable3.getMinHeight(), (float) ((int) ((this.vScrollBounds.height * this.areaHeight) / max2)));
                    } else {
                        this.vKnobBounds.height = drawable3.getMinHeight();
                    }
                    if (this.vKnobBounds.height > max2) {
                        this.vKnobBounds.height = 0.0f;
                    }
                    if (this.vScrollOnRight) {
                        this.vKnobBounds.x = (width - f2) - drawable3.getMinWidth();
                    } else {
                        this.vKnobBounds.x = f3;
                    }
                    this.vKnobBounds.y = this.vScrollBounds.y + ((float) ((int) ((this.vScrollBounds.height - this.vKnobBounds.height) * (1.0f - getScrollPercentY()))));
                } else {
                    this.vScrollBounds.set(0.0f, 0.0f, 0.0f, 0.0f);
                    this.vKnobBounds.set(0.0f, 0.0f, 0.0f, 0.0f);
                }
            }
            updateWidgetPosition();
            Actor actor2 = this.widget;
            if (actor2 instanceof Layout) {
                actor2.setSize(max, max2);
                ((Layout) this.widget).validate();
            }
        }
    }

    private void updateWidgetPosition() {
        float f;
        float f2 = this.widgetAreaBounds.y;
        if (!this.scrollY) {
            f = this.maxY;
        } else {
            f = this.maxY - this.visualAmountY;
        }
        float f3 = f2 - ((float) ((int) f));
        float f4 = this.widgetAreaBounds.x;
        if (this.scrollX) {
            f4 -= (float) ((int) this.visualAmountX);
        }
        if (!this.fadeScrollBars && this.scrollbarsOnTop) {
            float f5 = 0.0f;
            if (this.scrollX && this.hScrollOnBottom) {
                float minHeight = this.style.hScrollKnob != null ? this.style.hScrollKnob.getMinHeight() : 0.0f;
                if (this.style.hScroll != null) {
                    minHeight = Math.max(minHeight, this.style.hScroll.getMinHeight());
                }
                f3 += minHeight;
            }
            if (this.scrollY && !this.vScrollOnRight) {
                if (this.style.hScrollKnob != null) {
                    f5 = this.style.hScrollKnob.getMinWidth();
                }
                if (this.style.hScroll != null) {
                    f5 = Math.max(f5, this.style.hScroll.getMinWidth());
                }
                f4 += f5;
            }
        }
        this.widget.setPosition(f4, f3);
        if (this.widget instanceof Cullable) {
            this.widgetCullingArea.x = this.widgetAreaBounds.x - f4;
            this.widgetCullingArea.y = this.widgetAreaBounds.y - f3;
            this.widgetCullingArea.width = this.widgetAreaBounds.width;
            this.widgetCullingArea.height = this.widgetAreaBounds.height;
            ((Cullable) this.widget).setCullingArea(this.widgetCullingArea);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void draw(Batch batch, float f) {
        if (this.widget != null) {
            validate();
            applyTransform(batch, computeTransform());
            if (this.scrollX) {
                this.hKnobBounds.x = this.hScrollBounds.x + ((float) ((int) ((this.hScrollBounds.width - this.hKnobBounds.width) * getVisualScrollPercentX())));
            }
            if (this.scrollY) {
                this.vKnobBounds.y = this.vScrollBounds.y + ((float) ((int) ((this.vScrollBounds.height - this.vKnobBounds.height) * (1.0f - getVisualScrollPercentY()))));
            }
            updateWidgetPosition();
            Color color = getColor();
            batch.setColor(color.r, color.g, color.b, color.a * f);
            if (this.style.background != null) {
                this.style.background.draw(batch, 0.0f, 0.0f, getWidth(), getHeight());
            }
            batch.flush();
            if (clipBegin(this.widgetAreaBounds.x, this.widgetAreaBounds.y, this.widgetAreaBounds.width, this.widgetAreaBounds.height)) {
                drawChildren(batch, f);
                batch.flush();
                clipEnd();
            }
            float f2 = color.a * f;
            if (this.fadeScrollBars) {
                f2 *= Interpolation.fade.apply(this.fadeAlpha / this.fadeAlphaSeconds);
            }
            batch.setColor(color.r, color.g, color.b, color.a * f);
            drawScrollBars(batch, color.r, color.g, color.b, f2);
            resetTransform(batch);
        }
    }

    /* access modifiers changed from: protected */
    public void drawScrollBars(Batch batch, float f, float f2, float f3, float f4) {
        if (f4 > 0.0f) {
            batch.setColor(f, f2, f3, f4);
            boolean z = true;
            boolean z2 = this.scrollX && this.hKnobBounds.width > 0.0f;
            if (!this.scrollY || this.vKnobBounds.height <= 0.0f) {
                z = false;
            }
            if (z2 && z && this.style.corner != null) {
                this.style.corner.draw(batch, this.hScrollBounds.x + this.hScrollBounds.width, this.hScrollBounds.y, this.vScrollBounds.width, this.vScrollBounds.y);
            }
            if (z2) {
                if (this.style.hScroll != null) {
                    this.style.hScroll.draw(batch, this.hScrollBounds.x, this.hScrollBounds.y, this.hScrollBounds.width, this.hScrollBounds.height);
                }
                if (this.style.hScrollKnob != null) {
                    this.style.hScrollKnob.draw(batch, this.hKnobBounds.x, this.hKnobBounds.y, this.hKnobBounds.width, this.hKnobBounds.height);
                }
            }
            if (z) {
                if (this.style.vScroll != null) {
                    this.style.vScroll.draw(batch, this.vScrollBounds.x, this.vScrollBounds.y, this.vScrollBounds.width, this.vScrollBounds.height);
                }
                if (this.style.vScrollKnob != null) {
                    this.style.vScrollKnob.draw(batch, this.vKnobBounds.x, this.vKnobBounds.y, this.vKnobBounds.width, this.vKnobBounds.height);
                }
            }
        }
    }

    public void fling(float f, float f2, float f3) {
        this.flingTimer = f;
        this.velocityX = f2;
        this.velocityY = f3;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefWidth() {
        float f;
        Actor actor = this.widget;
        float f2 = 0.0f;
        if (actor instanceof Layout) {
            validate();
            f = ((Layout) this.widget).getPrefWidth();
        } else {
            f = actor != null ? actor.getWidth() : 0.0f;
        }
        if (this.style.background != null) {
            f += this.style.background.getLeftWidth() + this.style.background.getRightWidth();
        }
        if (!this.scrollY) {
            return f;
        }
        if (this.style.vScrollKnob != null) {
            f2 = this.style.vScrollKnob.getMinWidth();
        }
        if (this.style.vScroll != null) {
            f2 = Math.max(f2, this.style.vScroll.getMinWidth());
        }
        return f + f2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefHeight() {
        float f;
        Actor actor = this.widget;
        float f2 = 0.0f;
        if (actor instanceof Layout) {
            validate();
            f = ((Layout) this.widget).getPrefHeight();
        } else {
            f = actor != null ? actor.getHeight() : 0.0f;
        }
        if (this.style.background != null) {
            f += this.style.background.getTopHeight() + this.style.background.getBottomHeight();
        }
        if (!this.scrollX) {
            return f;
        }
        if (this.style.hScrollKnob != null) {
            f2 = this.style.hScrollKnob.getMinHeight();
        }
        if (this.style.hScroll != null) {
            f2 = Math.max(f2, this.style.hScroll.getMinHeight());
        }
        return f + f2;
    }

    public void setActor(Actor actor) {
        Actor actor2 = this.widget;
        if (actor2 != this) {
            if (actor2 != null) {
                super.removeActor(actor2);
            }
            this.widget = actor;
            Actor actor3 = this.widget;
            if (actor3 != null) {
                super.addActor(actor3);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("widget cannot be the ScrollPane.");
    }

    public Actor getActor() {
        return this.widget;
    }

    public void setWidget(Actor actor) {
        setActor(actor);
    }

    public Actor getWidget() {
        return this.widget;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActor(Actor actor) {
        throw new UnsupportedOperationException("Use ScrollPane#setWidget.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActorAt(int i, Actor actor) {
        throw new UnsupportedOperationException("Use ScrollPane#setWidget.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActorBefore(Actor actor, Actor actor2) {
        throw new UnsupportedOperationException("Use ScrollPane#setWidget.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void addActorAfter(Actor actor, Actor actor2) {
        throw new UnsupportedOperationException("Use ScrollPane#setWidget.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public boolean removeActor(Actor actor) {
        if (actor == null) {
            throw new IllegalArgumentException("actor cannot be null.");
        } else if (actor != this.widget) {
            return false;
        } else {
            setActor(null);
            return true;
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public boolean removeActor(Actor actor, boolean z) {
        if (actor == null) {
            throw new IllegalArgumentException("actor cannot be null.");
        } else if (actor != this.widget) {
            return false;
        } else {
            this.widget = null;
            return super.removeActor(actor, z);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public Actor hit(float f, float f2, boolean z) {
        if (f < 0.0f || f >= getWidth() || f2 < 0.0f || f2 >= getHeight()) {
            return null;
        }
        if (z && getTouchable() == Touchable.enabled && isVisible()) {
            if (this.scrollX && this.touchScrollH && this.hScrollBounds.contains(f, f2)) {
                return this;
            }
            if (this.scrollY && this.touchScrollV && this.vScrollBounds.contains(f, f2)) {
                return this;
            }
        }
        return super.hit(f, f2, z);
    }

    /* access modifiers changed from: protected */
    public void scrollX(float f) {
        this.amountX = f;
    }

    /* access modifiers changed from: protected */
    public void scrollY(float f) {
        this.amountY = f;
    }

    /* access modifiers changed from: protected */
    public void visualScrollX(float f) {
        this.visualAmountX = f;
    }

    /* access modifiers changed from: protected */
    public void visualScrollY(float f) {
        this.visualAmountY = f;
    }

    /* access modifiers changed from: protected */
    public float getMouseWheelX() {
        float f = this.areaWidth;
        return Math.min(f, Math.max(0.9f * f, this.maxX * 0.1f) / 4.0f);
    }

    /* access modifiers changed from: protected */
    public float getMouseWheelY() {
        float f = this.areaHeight;
        return Math.min(f, Math.max(0.9f * f, this.maxY * 0.1f) / 4.0f);
    }

    public void setScrollX(float f) {
        scrollX(MathUtils.clamp(f, 0.0f, this.maxX));
    }

    public float getScrollX() {
        return this.amountX;
    }

    public void setScrollY(float f) {
        scrollY(MathUtils.clamp(f, 0.0f, this.maxY));
    }

    public float getScrollY() {
        return this.amountY;
    }

    public void updateVisualScroll() {
        this.visualAmountX = this.amountX;
        this.visualAmountY = this.amountY;
    }

    public float getVisualScrollX() {
        if (!this.scrollX) {
            return 0.0f;
        }
        return this.visualAmountX;
    }

    public float getVisualScrollY() {
        if (!this.scrollY) {
            return 0.0f;
        }
        return this.visualAmountY;
    }

    public float getVisualScrollPercentX() {
        float f = this.maxX;
        if (f == 0.0f) {
            return 0.0f;
        }
        return MathUtils.clamp(this.visualAmountX / f, 0.0f, 1.0f);
    }

    public float getVisualScrollPercentY() {
        float f = this.maxY;
        if (f == 0.0f) {
            return 0.0f;
        }
        return MathUtils.clamp(this.visualAmountY / f, 0.0f, 1.0f);
    }

    public float getScrollPercentX() {
        float f = this.maxX;
        if (f == 0.0f) {
            return 0.0f;
        }
        return MathUtils.clamp(this.amountX / f, 0.0f, 1.0f);
    }

    public void setScrollPercentX(float f) {
        scrollX(this.maxX * MathUtils.clamp(f, 0.0f, 1.0f));
    }

    public float getScrollPercentY() {
        float f = this.maxY;
        if (f == 0.0f) {
            return 0.0f;
        }
        return MathUtils.clamp(this.amountY / f, 0.0f, 1.0f);
    }

    public void setScrollPercentY(float f) {
        scrollY(this.maxY * MathUtils.clamp(f, 0.0f, 1.0f));
    }

    public void setFlickScroll(boolean z) {
        if (this.flickScroll != z) {
            this.flickScroll = z;
            if (z) {
                addListener(this.flickScrollListener);
            } else {
                removeListener(this.flickScrollListener);
            }
            invalidate();
        }
    }

    public void setFlickScrollTapSquareSize(float f) {
        this.flickScrollListener.getGestureDetector().setTapSquareSize(f);
    }

    public void scrollTo(float f, float f2, float f3, float f4) {
        scrollTo(f, f2, f3, f4, false, false);
    }

    public void scrollTo(float f, float f2, float f3, float f4, boolean z, boolean z2) {
        validate();
        float f5 = this.amountX;
        if (z) {
            f = (f - (this.areaWidth / 2.0f)) + (f3 / 2.0f);
        } else {
            float f6 = f3 + f;
            float f7 = this.areaWidth;
            float f8 = f6 > f5 + f7 ? f6 - f7 : f5;
            if (f >= f8) {
                f = f8;
            }
        }
        scrollX(MathUtils.clamp(f, 0.0f, this.maxX));
        float f9 = this.amountY;
        if (z2) {
            f9 = ((this.maxY - f2) + (this.areaHeight / 2.0f)) - (f4 / 2.0f);
        } else {
            float f10 = this.maxY;
            float f11 = this.areaHeight;
            if (f9 > ((f10 - f2) - f4) + f11) {
                f9 = ((f10 - f2) - f4) + f11;
            }
            float f12 = this.maxY;
            if (f9 < f12 - f2) {
                f9 = f12 - f2;
            }
        }
        scrollY(MathUtils.clamp(f9, 0.0f, this.maxY));
    }

    public float getMaxX() {
        return this.maxX;
    }

    public float getMaxY() {
        return this.maxY;
    }

    public float getScrollBarHeight() {
        float f = 0.0f;
        if (!this.scrollX) {
            return 0.0f;
        }
        if (this.style.hScrollKnob != null) {
            f = this.style.hScrollKnob.getMinHeight();
        }
        return this.style.hScroll != null ? Math.max(f, this.style.hScroll.getMinHeight()) : f;
    }

    public float getScrollBarWidth() {
        float f = 0.0f;
        if (!this.scrollY) {
            return 0.0f;
        }
        if (this.style.vScrollKnob != null) {
            f = this.style.vScrollKnob.getMinWidth();
        }
        return this.style.vScroll != null ? Math.max(f, this.style.vScroll.getMinWidth()) : f;
    }

    public float getScrollWidth() {
        return this.areaWidth;
    }

    public float getScrollHeight() {
        return this.areaHeight;
    }

    public boolean isScrollX() {
        return this.scrollX;
    }

    public boolean isScrollY() {
        return this.scrollY;
    }

    public void setScrollingDisabled(boolean z, boolean z2) {
        this.disableX = z;
        this.disableY = z2;
        invalidate();
    }

    public boolean isScrollingDisabledX() {
        return this.disableX;
    }

    public boolean isScrollingDisabledY() {
        return this.disableY;
    }

    public boolean isLeftEdge() {
        return !this.scrollX || this.amountX <= 0.0f;
    }

    public boolean isRightEdge() {
        return !this.scrollX || this.amountX >= this.maxX;
    }

    public boolean isTopEdge() {
        return !this.scrollY || this.amountY <= 0.0f;
    }

    public boolean isBottomEdge() {
        return !this.scrollY || this.amountY >= this.maxY;
    }

    public boolean isDragging() {
        return this.draggingPointer != -1;
    }

    public boolean isPanning() {
        return this.flickScrollListener.getGestureDetector().isPanning();
    }

    public boolean isFlinging() {
        return this.flingTimer > 0.0f;
    }

    public void setVelocityX(float f) {
        this.velocityX = f;
    }

    public float getVelocityX() {
        return this.velocityX;
    }

    public void setVelocityY(float f) {
        this.velocityY = f;
    }

    public float getVelocityY() {
        return this.velocityY;
    }

    public void setOverscroll(boolean z, boolean z2) {
        this.overscrollX = z;
        this.overscrollY = z2;
    }

    public void setupOverscroll(float f, float f2, float f3) {
        this.overscrollDistance = f;
        this.overscrollSpeedMin = f2;
        this.overscrollSpeedMax = f3;
    }

    public float getOverscrollDistance() {
        return this.overscrollDistance;
    }

    public void setForceScroll(boolean z, boolean z2) {
        this.forceScrollX = z;
        this.forceScrollY = z2;
    }

    public boolean isForceScrollX() {
        return this.forceScrollX;
    }

    public boolean isForceScrollY() {
        return this.forceScrollY;
    }

    public void setFlingTime(float f) {
        this.flingTime = f;
    }

    public void setClamp(boolean z) {
        this.clamp = z;
    }

    public void setScrollBarPositions(boolean z, boolean z2) {
        this.hScrollOnBottom = z;
        this.vScrollOnRight = z2;
    }

    public void setFadeScrollBars(boolean z) {
        if (this.fadeScrollBars != z) {
            this.fadeScrollBars = z;
            if (!z) {
                this.fadeAlpha = this.fadeAlphaSeconds;
            }
            invalidate();
        }
    }

    public void setupFadeScrollBars(float f, float f2) {
        this.fadeAlphaSeconds = f;
        this.fadeDelaySeconds = f2;
    }

    public boolean getFadeScrollBars() {
        return this.fadeScrollBars;
    }

    public void setScrollBarTouch(boolean z) {
        this.scrollBarTouch = z;
    }

    public void setSmoothScrolling(boolean z) {
        this.smoothScrolling = z;
    }

    public void setScrollbarsOnTop(boolean z) {
        this.scrollbarsOnTop = z;
        invalidate();
    }

    public boolean getVariableSizeKnobs() {
        return this.variableSizeKnobs;
    }

    public void setVariableSizeKnobs(boolean z) {
        this.variableSizeKnobs = z;
    }

    public void setCancelTouchFocus(boolean z) {
        this.cancelTouchFocus = z;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public void drawDebug(ShapeRenderer shapeRenderer) {
        drawDebugBounds(shapeRenderer);
        applyTransform(shapeRenderer, computeTransform());
        if (clipBegin(this.widgetAreaBounds.x, this.widgetAreaBounds.y, this.widgetAreaBounds.width, this.widgetAreaBounds.height)) {
            drawDebugChildren(shapeRenderer);
            shapeRenderer.flush();
            clipEnd();
        }
        resetTransform(shapeRenderer);
    }

    public static class ScrollPaneStyle {
        public Drawable background;
        public Drawable corner;
        public Drawable hScroll;
        public Drawable hScrollKnob;
        public Drawable vScroll;
        public Drawable vScrollKnob;

        public ScrollPaneStyle() {
        }

        public ScrollPaneStyle(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4, Drawable drawable5) {
            this.background = drawable;
            this.hScroll = drawable2;
            this.hScrollKnob = drawable3;
            this.vScroll = drawable4;
            this.vScrollKnob = drawable5;
        }

        public ScrollPaneStyle(ScrollPaneStyle scrollPaneStyle) {
            this.background = scrollPaneStyle.background;
            this.corner = scrollPaneStyle.corner;
            this.hScroll = scrollPaneStyle.hScroll;
            this.hScrollKnob = scrollPaneStyle.hScrollKnob;
            this.vScroll = scrollPaneStyle.vScroll;
            this.vScrollKnob = scrollPaneStyle.vScrollKnob;
        }
    }
}
