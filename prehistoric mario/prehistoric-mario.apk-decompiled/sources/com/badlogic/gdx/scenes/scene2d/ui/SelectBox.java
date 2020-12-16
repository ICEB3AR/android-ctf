package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.actions.Actions;
import com.badlogic.gdx.scenes.scene2d.ui.List;
import com.badlogic.gdx.scenes.scene2d.ui.ScrollPane;
import com.badlogic.gdx.scenes.scene2d.utils.ArraySelection;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.scenes.scene2d.utils.Disableable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.OrderedSet;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;

public class SelectBox<T> extends Widget implements Disableable {
    static final Vector2 temp = new Vector2();
    private int alignment;
    private ClickListener clickListener;
    boolean disabled;
    final Array<T> items;
    private float prefHeight;
    private float prefWidth;
    SelectBoxList<T> selectBoxList;
    final ArraySelection<T> selection;
    SelectBoxStyle style;

    public SelectBox(Skin skin) {
        this((SelectBoxStyle) skin.get(SelectBoxStyle.class));
    }

    public SelectBox(Skin skin, String str) {
        this((SelectBoxStyle) skin.get(str, SelectBoxStyle.class));
    }

    public SelectBox(SelectBoxStyle selectBoxStyle) {
        this.items = new Array<>();
        this.selection = new ArraySelection<>(this.items);
        this.alignment = 8;
        setStyle(selectBoxStyle);
        setSize(getPrefWidth(), getPrefHeight());
        this.selection.setActor(this);
        this.selection.setRequired(true);
        this.selectBoxList = new SelectBoxList<>(this);
        AnonymousClass1 r3 = new ClickListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.SelectBox.AnonymousClass1 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.utils.ClickListener
            public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                if ((i == 0 && i2 != 0) || SelectBox.this.disabled) {
                    return false;
                }
                if (SelectBox.this.selectBoxList.hasParent()) {
                    SelectBox.this.hideList();
                    return true;
                }
                SelectBox.this.showList();
                return true;
            }
        };
        this.clickListener = r3;
        addListener(r3);
    }

    public void setMaxListCount(int i) {
        this.selectBoxList.maxListCount = i;
    }

    public int getMaxListCount() {
        return this.selectBoxList.maxListCount;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setStage(Stage stage) {
        if (stage == null) {
            this.selectBoxList.hide();
        }
        super.setStage(stage);
    }

    public void setStyle(SelectBoxStyle selectBoxStyle) {
        if (selectBoxStyle != null) {
            this.style = selectBoxStyle;
            SelectBoxList<T> selectBoxList2 = this.selectBoxList;
            if (selectBoxList2 != null) {
                selectBoxList2.setStyle(selectBoxStyle.scrollStyle);
                this.selectBoxList.list.setStyle(selectBoxStyle.listStyle);
            }
            invalidateHierarchy();
            return;
        }
        throw new IllegalArgumentException("style cannot be null.");
    }

    public SelectBoxStyle getStyle() {
        return this.style;
    }

    public void setItems(T... tArr) {
        if (tArr != null) {
            float prefWidth2 = getPrefWidth();
            this.items.clear();
            this.items.addAll(tArr);
            this.selection.validate();
            this.selectBoxList.list.setItems(this.items);
            invalidate();
            if (prefWidth2 != getPrefWidth()) {
                invalidateHierarchy();
                return;
            }
            return;
        }
        throw new IllegalArgumentException("newItems cannot be null.");
    }

    public void setItems(Array<T> array) {
        if (array != null) {
            float prefWidth2 = getPrefWidth();
            Array<T> array2 = this.items;
            if (array != array2) {
                array2.clear();
                this.items.addAll(array);
            }
            this.selection.validate();
            this.selectBoxList.list.setItems(this.items);
            invalidate();
            if (prefWidth2 != getPrefWidth()) {
                invalidateHierarchy();
                return;
            }
            return;
        }
        throw new IllegalArgumentException("newItems cannot be null.");
    }

    public void clearItems() {
        if (this.items.size != 0) {
            this.items.clear();
            this.selection.clear();
            invalidateHierarchy();
        }
    }

    public Array<T> getItems() {
        return this.items;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r2v2, resolved type: com.badlogic.gdx.utils.Pool */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public void layout() {
        Drawable drawable = this.style.background;
        BitmapFont bitmapFont = this.style.font;
        if (drawable != null) {
            this.prefHeight = Math.max(((drawable.getTopHeight() + drawable.getBottomHeight()) + bitmapFont.getCapHeight()) - (bitmapFont.getDescent() * 2.0f), drawable.getMinHeight());
        } else {
            this.prefHeight = bitmapFont.getCapHeight() - (bitmapFont.getDescent() * 2.0f);
        }
        Pool pool = Pools.get(GlyphLayout.class);
        GlyphLayout glyphLayout = (GlyphLayout) pool.obtain();
        float f = 0.0f;
        float f2 = 0.0f;
        for (int i = 0; i < this.items.size; i++) {
            glyphLayout.setText(bitmapFont, toString(this.items.get(i)));
            f2 = Math.max(glyphLayout.width, f2);
        }
        pool.free(glyphLayout);
        this.prefWidth = f2;
        if (drawable != null) {
            this.prefWidth += drawable.getLeftWidth() + drawable.getRightWidth();
        }
        List.ListStyle listStyle = this.style.listStyle;
        ScrollPane.ScrollPaneStyle scrollPaneStyle = this.style.scrollStyle;
        float leftWidth = f2 + listStyle.selection.getLeftWidth() + listStyle.selection.getRightWidth();
        if (scrollPaneStyle.background != null) {
            leftWidth += scrollPaneStyle.background.getLeftWidth() + scrollPaneStyle.background.getRightWidth();
        }
        SelectBoxList<T> selectBoxList2 = this.selectBoxList;
        if (selectBoxList2 == null || !selectBoxList2.disableY) {
            float minWidth = this.style.scrollStyle.vScroll != null ? this.style.scrollStyle.vScroll.getMinWidth() : 0.0f;
            if (this.style.scrollStyle.vScrollKnob != null) {
                f = this.style.scrollStyle.vScrollKnob.getMinWidth();
            }
            leftWidth += Math.max(minWidth, f);
        }
        this.prefWidth = Math.max(this.prefWidth, leftWidth);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        Drawable drawable;
        float f2;
        float f3;
        validate();
        if (this.disabled && this.style.backgroundDisabled != null) {
            drawable = this.style.backgroundDisabled;
        } else if (this.selectBoxList.hasParent() && this.style.backgroundOpen != null) {
            drawable = this.style.backgroundOpen;
        } else if (!this.clickListener.isOver() || this.style.backgroundOver == null) {
            drawable = this.style.background != null ? this.style.background : null;
        } else {
            drawable = this.style.backgroundOver;
        }
        BitmapFont bitmapFont = this.style.font;
        Color color = (!this.disabled || this.style.disabledFontColor == null) ? this.style.fontColor : this.style.disabledFontColor;
        Color color2 = getColor();
        float x = getX();
        float y = getY();
        float width = getWidth();
        float height = getHeight();
        batch.setColor(color2.r, color2.g, color2.b, color2.a * f);
        if (drawable != null) {
            drawable.draw(batch, x, y, width, height);
        }
        T first = this.selection.first();
        if (first != null) {
            if (drawable != null) {
                width -= drawable.getLeftWidth() + drawable.getRightWidth();
                float bottomHeight = height - (drawable.getBottomHeight() + drawable.getTopHeight());
                x += drawable.getLeftWidth();
                f2 = (bottomHeight / 2.0f) + drawable.getBottomHeight();
                f3 = bitmapFont.getData().capHeight;
            } else {
                f2 = height / 2.0f;
                f3 = bitmapFont.getData().capHeight;
            }
            bitmapFont.setColor(color.r, color.g, color.b, color.a * f);
            drawItem(batch, bitmapFont, first, x, y + ((float) ((int) (f2 + (f3 / 2.0f)))), width);
        }
    }

    /* access modifiers changed from: protected */
    public GlyphLayout drawItem(Batch batch, BitmapFont bitmapFont, T t, float f, float f2, float f3) {
        String selectBox = toString(t);
        return bitmapFont.draw(batch, selectBox, f, f2, 0, selectBox.length(), f3, this.alignment, false, "...");
    }

    public void setAlignment(int i) {
        this.alignment = i;
    }

    public ArraySelection<T> getSelection() {
        return this.selection;
    }

    public T getSelected() {
        return this.selection.first();
    }

    public void setSelected(T t) {
        if (this.items.contains(t, false)) {
            this.selection.set(t);
        } else if (this.items.size > 0) {
            this.selection.set(this.items.first());
        } else {
            this.selection.clear();
        }
    }

    public int getSelectedIndex() {
        OrderedSet<T> items2 = this.selection.items();
        if (items2.size == 0) {
            return -1;
        }
        return this.items.indexOf(items2.first(), false);
    }

    public void setSelectedIndex(int i) {
        this.selection.set(this.items.get(i));
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public void setDisabled(boolean z) {
        if (z && !this.disabled) {
            hideList();
        }
        this.disabled = z;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public boolean isDisabled() {
        return this.disabled;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefWidth() {
        validate();
        return this.prefWidth;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefHeight() {
        validate();
        return this.prefHeight;
    }

    /* access modifiers changed from: protected */
    public String toString(T t) {
        return t.toString();
    }

    public void showList() {
        if (this.items.size != 0 && getStage() != null) {
            this.selectBoxList.show(getStage());
        }
    }

    public void hideList() {
        this.selectBoxList.hide();
    }

    public List<T> getList() {
        return this.selectBoxList.list;
    }

    public void setScrollingDisabled(boolean z) {
        this.selectBoxList.setScrollingDisabled(true, z);
        invalidateHierarchy();
    }

    public ScrollPane getScrollPane() {
        return this.selectBoxList;
    }

    /* access modifiers changed from: protected */
    public void onShow(Actor actor, boolean z) {
        actor.getColor().a = 0.0f;
        actor.addAction(Actions.fadeIn(0.3f, Interpolation.fade));
    }

    /* access modifiers changed from: protected */
    public void onHide(Actor actor) {
        actor.getColor().a = 1.0f;
        actor.addAction(Actions.sequence(Actions.fadeOut(0.15f, Interpolation.fade), Actions.removeActor()));
    }

    /* access modifiers changed from: package-private */
    public static class SelectBoxList<T> extends ScrollPane {
        private InputListener hideListener;
        final List<T> list;
        int maxListCount;
        private Actor previousScrollFocus;
        private final Vector2 screenPosition = new Vector2();
        private final SelectBox<T> selectBox;

        public SelectBoxList(final SelectBox<T> selectBox2) {
            super((Actor) null, selectBox2.style.scrollStyle);
            this.selectBox = selectBox2;
            setOverscroll(false, false);
            setFadeScrollBars(false);
            setScrollingDisabled(true, false);
            this.list = new List<T>(selectBox2.style.listStyle) {
                /* class com.badlogic.gdx.scenes.scene2d.ui.SelectBox.SelectBoxList.AnonymousClass1 */

                @Override // com.badlogic.gdx.scenes.scene2d.ui.List
                public String toString(T t) {
                    return selectBox2.toString(t);
                }
            };
            this.list.setTouchable(Touchable.disabled);
            this.list.setTypeToSelect(true);
            setActor(this.list);
            this.list.addListener(new ClickListener() {
                /* class com.badlogic.gdx.scenes.scene2d.ui.SelectBox.SelectBoxList.AnonymousClass2 */

                @Override // com.badlogic.gdx.scenes.scene2d.utils.ClickListener
                public void clicked(InputEvent inputEvent, float f, float f2) {
                    selectBox2.selection.choose(SelectBoxList.this.list.getSelected());
                    SelectBoxList.this.hide();
                }

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public boolean mouseMoved(InputEvent inputEvent, float f, float f2) {
                    int itemIndexAt = SelectBoxList.this.list.getItemIndexAt(f2);
                    if (itemIndexAt == -1) {
                        return true;
                    }
                    SelectBoxList.this.list.setSelectedIndex(itemIndexAt);
                    return true;
                }
            });
            addListener(new InputListener() {
                /* class com.badlogic.gdx.scenes.scene2d.ui.SelectBox.SelectBoxList.AnonymousClass3 */

                /* JADX DEBUG: Multi-variable search result rejected for r1v3, resolved type: com.badlogic.gdx.scenes.scene2d.utils.ArraySelection<T> */
                /* JADX WARN: Multi-variable type inference failed */
                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public void exit(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
                    if (actor == null || !SelectBoxList.this.isAscendantOf(actor)) {
                        SelectBoxList.this.list.selection.set(selectBox2.getSelected());
                    }
                }
            });
            this.hideListener = new InputListener() {
                /* class com.badlogic.gdx.scenes.scene2d.ui.SelectBox.SelectBoxList.AnonymousClass4 */

                /* JADX DEBUG: Multi-variable search result rejected for r1v5, resolved type: com.badlogic.gdx.scenes.scene2d.utils.ArraySelection<T> */
                /* JADX WARN: Multi-variable type inference failed */
                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                    if (SelectBoxList.this.isAscendantOf(inputEvent.getTarget())) {
                        return false;
                    }
                    SelectBoxList.this.list.selection.set(selectBox2.getSelected());
                    SelectBoxList.this.hide();
                    return false;
                }

                @Override // com.badlogic.gdx.scenes.scene2d.InputListener
                public boolean keyDown(InputEvent inputEvent, int i) {
                    if (i == 66) {
                        selectBox2.selection.choose(SelectBoxList.this.list.getSelected());
                    } else if (i != 131) {
                        return false;
                    }
                    SelectBoxList.this.hide();
                    inputEvent.stop();
                    return true;
                }
            };
        }

        public void show(Stage stage) {
            if (!this.list.isTouchable()) {
                stage.addActor(this);
                stage.addCaptureListener(this.hideListener);
                stage.addListener(this.list.getKeyListener());
                this.selectBox.localToStageCoordinates(this.screenPosition.set(0.0f, 0.0f));
                float itemHeight = this.list.getItemHeight();
                int i = this.maxListCount;
                float min = ((float) (i <= 0 ? this.selectBox.items.size : Math.min(i, this.selectBox.items.size))) * itemHeight;
                Drawable drawable = getStyle().background;
                if (drawable != null) {
                    min += drawable.getTopHeight() + drawable.getBottomHeight();
                }
                Drawable drawable2 = this.list.getStyle().background;
                if (drawable2 != null) {
                    min += drawable2.getTopHeight() + drawable2.getBottomHeight();
                }
                float f = this.screenPosition.y;
                float height = (stage.getCamera().viewportHeight - this.screenPosition.y) - this.selectBox.getHeight();
                boolean z = true;
                if (min > f) {
                    if (height > f) {
                        z = false;
                        min = Math.min(min, height);
                    } else {
                        min = f;
                    }
                }
                if (z) {
                    setY(this.screenPosition.y - min);
                } else {
                    setY(this.screenPosition.y + this.selectBox.getHeight());
                }
                setX(this.screenPosition.x);
                setHeight(min);
                validate();
                float max = Math.max(getPrefWidth(), this.selectBox.getWidth());
                if (getPrefHeight() > min && !this.disableY) {
                    max += getScrollBarWidth();
                }
                setWidth(max);
                validate();
                scrollTo(0.0f, (this.list.getHeight() - (((float) this.selectBox.getSelectedIndex()) * itemHeight)) - (itemHeight / 2.0f), 0.0f, 0.0f, true, true);
                updateVisualScroll();
                this.previousScrollFocus = null;
                Actor scrollFocus = stage.getScrollFocus();
                if (scrollFocus != null && !scrollFocus.isDescendantOf(this)) {
                    this.previousScrollFocus = scrollFocus;
                }
                stage.setScrollFocus(this);
                this.list.selection.set(this.selectBox.getSelected());
                this.list.setTouchable(Touchable.enabled);
                clearActions();
                this.selectBox.onShow(this, z);
            }
        }

        public void hide() {
            if (this.list.isTouchable() && hasParent()) {
                this.list.setTouchable(Touchable.disabled);
                Stage stage = getStage();
                if (stage != null) {
                    stage.removeCaptureListener(this.hideListener);
                    stage.removeListener(this.list.getKeyListener());
                    Actor actor = this.previousScrollFocus;
                    if (actor != null && actor.getStage() == null) {
                        this.previousScrollFocus = null;
                    }
                    Actor scrollFocus = stage.getScrollFocus();
                    if (scrollFocus == null || isAscendantOf(scrollFocus)) {
                        stage.setScrollFocus(this.previousScrollFocus);
                    }
                }
                clearActions();
                this.selectBox.onHide(this);
            }
        }

        @Override // com.badlogic.gdx.scenes.scene2d.ui.ScrollPane, com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
        public void draw(Batch batch, float f) {
            this.selectBox.localToStageCoordinates(SelectBox.temp.set(0.0f, 0.0f));
            if (!SelectBox.temp.equals(this.screenPosition)) {
                hide();
            }
            super.draw(batch, f);
        }

        @Override // com.badlogic.gdx.scenes.scene2d.ui.ScrollPane, com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
        public void act(float f) {
            super.act(f);
            toFront();
        }

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
        public void setStage(Stage stage) {
            Stage stage2 = getStage();
            if (stage2 != null) {
                stage2.removeCaptureListener(this.hideListener);
                stage2.removeListener(this.list.getKeyListener());
            }
            super.setStage(stage);
        }
    }

    public static class SelectBoxStyle {
        public Drawable background;
        public Drawable backgroundDisabled;
        public Drawable backgroundOpen;
        public Drawable backgroundOver;
        public Color disabledFontColor;
        public BitmapFont font;
        public Color fontColor = new Color(1.0f, 1.0f, 1.0f, 1.0f);
        public List.ListStyle listStyle;
        public ScrollPane.ScrollPaneStyle scrollStyle;

        public SelectBoxStyle() {
        }

        public SelectBoxStyle(BitmapFont bitmapFont, Color color, Drawable drawable, ScrollPane.ScrollPaneStyle scrollPaneStyle, List.ListStyle listStyle2) {
            this.font = bitmapFont;
            this.fontColor.set(color);
            this.background = drawable;
            this.scrollStyle = scrollPaneStyle;
            this.listStyle = listStyle2;
        }

        public SelectBoxStyle(SelectBoxStyle selectBoxStyle) {
            this.font = selectBoxStyle.font;
            this.fontColor.set(selectBoxStyle.fontColor);
            Color color = selectBoxStyle.disabledFontColor;
            if (color != null) {
                this.disabledFontColor = new Color(color);
            }
            this.background = selectBoxStyle.background;
            this.backgroundOver = selectBoxStyle.backgroundOver;
            this.backgroundOpen = selectBoxStyle.backgroundOpen;
            this.backgroundDisabled = selectBoxStyle.backgroundDisabled;
            this.scrollStyle = new ScrollPane.ScrollPaneStyle(selectBoxStyle.scrollStyle);
            this.listStyle = new List.ListStyle(selectBoxStyle.listStyle);
        }
    }
}
