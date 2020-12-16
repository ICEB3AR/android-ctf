package com.badlogic.gdx.scenes.scene2d.ui;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.utils.ArraySelection;
import com.badlogic.gdx.scenes.scene2d.utils.Cullable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.UIUtils;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.OrderedSet;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;

public class List<T> extends Widget implements Cullable {
    private int alignment;
    private Rectangle cullingArea;
    float itemHeight;
    final Array<T> items;
    private InputListener keyListener;
    int overIndex;
    private float prefHeight;
    private float prefWidth;
    int pressedIndex;
    ArraySelection<T> selection;
    ListStyle style;
    boolean typeToSelect;

    public List(Skin skin) {
        this((ListStyle) skin.get(ListStyle.class));
    }

    public List(Skin skin, String str) {
        this((ListStyle) skin.get(str, ListStyle.class));
    }

    public List(ListStyle listStyle) {
        this.items = new Array<>();
        this.selection = new ArraySelection<>(this.items);
        this.alignment = 8;
        this.pressedIndex = -1;
        this.overIndex = -1;
        this.selection.setActor(this);
        this.selection.setRequired(true);
        setStyle(listStyle);
        setSize(getPrefWidth(), getPrefHeight());
        AnonymousClass1 r3 = new InputListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.List.AnonymousClass1 */
            String prefix;
            long typeTimeout;

            /* JADX DEBUG: Multi-variable search result rejected for r3v17, resolved type: com.badlogic.gdx.utils.Array<T> */
            /* JADX DEBUG: Multi-variable search result rejected for r3v27, resolved type: com.badlogic.gdx.utils.Array<T> */
            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean keyDown(InputEvent inputEvent, int i) {
                if (List.this.items.isEmpty()) {
                    return false;
                }
                if (i != 3) {
                    if (i != 29) {
                        if (i == 19) {
                            int indexOf = List.this.items.indexOf(List.this.getSelected(), false) - 1;
                            if (indexOf < 0) {
                                indexOf = List.this.items.size - 1;
                            }
                            List.this.setSelectedIndex(indexOf);
                            return true;
                        } else if (i == 20) {
                            int indexOf2 = List.this.items.indexOf(List.this.getSelected(), false) + 1;
                            if (indexOf2 >= List.this.items.size) {
                                indexOf2 = 0;
                            }
                            List.this.setSelectedIndex(indexOf2);
                            return true;
                        } else if (i == 131) {
                            if (List.this.getStage() != null) {
                                List.this.getStage().setKeyboardFocus(null);
                            }
                            return true;
                        } else if (i == 132) {
                            List list = List.this;
                            list.setSelectedIndex(list.items.size - 1);
                            return true;
                        }
                    } else if (UIUtils.ctrl() && List.this.selection.getMultiple()) {
                        List.this.selection.clear();
                        List.this.selection.addAll(List.this.items);
                        return true;
                    }
                    return false;
                }
                List.this.setSelectedIndex(0);
                return true;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean keyTyped(InputEvent inputEvent, char c) {
                if (!List.this.typeToSelect) {
                    return false;
                }
                long currentTimeMillis = System.currentTimeMillis();
                if (currentTimeMillis > this.typeTimeout) {
                    this.prefix = BuildConfig.FLAVOR;
                }
                this.typeTimeout = currentTimeMillis + 300;
                this.prefix += Character.toLowerCase(c);
                int i = List.this.items.size;
                int i2 = 0;
                while (true) {
                    if (i2 >= i) {
                        break;
                    }
                    List list = List.this;
                    if (list.toString(list.items.get(i2)).toLowerCase().startsWith(this.prefix)) {
                        List.this.setSelectedIndex(i2);
                        break;
                    }
                    i2++;
                }
                return false;
            }
        };
        this.keyListener = r3;
        addListener(r3);
        addListener(new InputListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.List.AnonymousClass2 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                int itemIndexAt;
                if (i != 0 || i2 != 0 || List.this.selection.isDisabled()) {
                    return true;
                }
                if (List.this.getStage() != null) {
                    List.this.getStage().setKeyboardFocus(List.this);
                }
                if (List.this.items.size == 0 || (itemIndexAt = List.this.getItemIndexAt(f2)) == -1) {
                    return true;
                }
                List.this.selection.choose(List.this.items.get(itemIndexAt));
                List.this.pressedIndex = itemIndexAt;
                return true;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                if (i == 0 && i2 == 0) {
                    List.this.pressedIndex = -1;
                }
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchDragged(InputEvent inputEvent, float f, float f2, int i) {
                List list = List.this;
                list.overIndex = list.getItemIndexAt(f2);
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean mouseMoved(InputEvent inputEvent, float f, float f2) {
                List list = List.this;
                list.overIndex = list.getItemIndexAt(f2);
                return false;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void exit(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
                if (i == 0) {
                    List.this.pressedIndex = -1;
                }
                if (i == -1) {
                    List.this.overIndex = -1;
                }
            }
        });
    }

    public void setStyle(ListStyle listStyle) {
        if (listStyle != null) {
            this.style = listStyle;
            invalidateHierarchy();
            return;
        }
        throw new IllegalArgumentException("style cannot be null.");
    }

    public ListStyle getStyle() {
        return this.style;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r2v6, resolved type: com.badlogic.gdx.utils.Pool */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public void layout() {
        BitmapFont bitmapFont = this.style.font;
        Drawable drawable = this.style.selection;
        this.itemHeight = bitmapFont.getCapHeight() - (bitmapFont.getDescent() * 2.0f);
        this.itemHeight += drawable.getTopHeight() + drawable.getBottomHeight();
        this.prefWidth = 0.0f;
        Pool pool = Pools.get(GlyphLayout.class);
        GlyphLayout glyphLayout = (GlyphLayout) pool.obtain();
        for (int i = 0; i < this.items.size; i++) {
            glyphLayout.setText(bitmapFont, toString(this.items.get(i)));
            this.prefWidth = Math.max(glyphLayout.width, this.prefWidth);
        }
        pool.free(glyphLayout);
        this.prefWidth += drawable.getLeftWidth() + drawable.getRightWidth();
        this.prefHeight = ((float) this.items.size) * this.itemHeight;
        Drawable drawable2 = this.style.background;
        if (drawable2 != null) {
            this.prefWidth += drawable2.getLeftWidth() + drawable2.getRightWidth();
            this.prefHeight += drawable2.getTopHeight() + drawable2.getBottomHeight();
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x00e9  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x010f  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x011c A[SYNTHETIC] */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.Actor
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void draw(com.badlogic.gdx.graphics.g2d.Batch r28, float r29) {
        /*
        // Method dump skipped, instructions count: 295
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.List.draw(com.badlogic.gdx.graphics.g2d.Batch, float):void");
    }

    /* access modifiers changed from: protected */
    public void drawBackground(Batch batch, float f) {
        if (this.style.background != null) {
            Color color = getColor();
            batch.setColor(color.r, color.g, color.b, color.a * f);
            this.style.background.draw(batch, getX(), getY(), getWidth(), getHeight());
        }
    }

    /* access modifiers changed from: protected */
    public GlyphLayout drawItem(Batch batch, BitmapFont bitmapFont, int i, T t, float f, float f2, float f3) {
        String list = toString(t);
        return bitmapFont.draw(batch, list, f, f2, 0, list.length(), f3, this.alignment, false, "...");
    }

    public ArraySelection<T> getSelection() {
        return this.selection;
    }

    public void setSelection(ArraySelection<T> arraySelection) {
        this.selection = arraySelection;
    }

    public T getSelected() {
        return this.selection.first();
    }

    public void setSelected(T t) {
        if (this.items.contains(t, false)) {
            this.selection.set(t);
        } else if (!this.selection.getRequired() || this.items.size <= 0) {
            this.selection.clear();
        } else {
            this.selection.set(this.items.first());
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
        if (i < -1 || i >= this.items.size) {
            throw new IllegalArgumentException("index must be >= -1 and < " + this.items.size + ": " + i);
        } else if (i == -1) {
            this.selection.clear();
        } else {
            this.selection.set(this.items.get(i));
        }
    }

    public T getOverItem() {
        int i = this.overIndex;
        if (i == -1) {
            return null;
        }
        return this.items.get(i);
    }

    public T getPressedItem() {
        int i = this.pressedIndex;
        if (i == -1) {
            return null;
        }
        return this.items.get(i);
    }

    public T getItemAt(float f) {
        int itemIndexAt = getItemIndexAt(f);
        if (itemIndexAt == -1) {
            return null;
        }
        return this.items.get(itemIndexAt);
    }

    public int getItemIndexAt(float f) {
        float height = getHeight();
        Drawable drawable = this.style.background;
        if (drawable != null) {
            height -= drawable.getTopHeight() + drawable.getBottomHeight();
            f -= drawable.getBottomHeight();
        }
        int i = (int) ((height - f) / this.itemHeight);
        if (i < 0 || i >= this.items.size) {
            return -1;
        }
        return i;
    }

    public void setItems(T... tArr) {
        if (tArr != null) {
            float prefWidth2 = getPrefWidth();
            float prefHeight2 = getPrefHeight();
            this.items.clear();
            this.items.addAll(tArr);
            this.overIndex = -1;
            this.pressedIndex = -1;
            this.selection.validate();
            invalidate();
            if (prefWidth2 != getPrefWidth() || prefHeight2 != getPrefHeight()) {
                invalidateHierarchy();
                return;
            }
            return;
        }
        throw new IllegalArgumentException("newItems cannot be null.");
    }

    public void setItems(Array array) {
        if (array != null) {
            float prefWidth2 = getPrefWidth();
            float prefHeight2 = getPrefHeight();
            Array<T> array2 = this.items;
            if (array != array2) {
                array2.clear();
                this.items.addAll(array);
            }
            this.overIndex = -1;
            this.pressedIndex = -1;
            this.selection.validate();
            invalidate();
            if (prefWidth2 != getPrefWidth() || prefHeight2 != getPrefHeight()) {
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
            this.overIndex = -1;
            this.pressedIndex = -1;
            this.selection.clear();
            invalidateHierarchy();
        }
    }

    public Array<T> getItems() {
        return this.items;
    }

    public float getItemHeight() {
        return this.itemHeight;
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

    public String toString(T t) {
        return t.toString();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Cullable
    public void setCullingArea(Rectangle rectangle) {
        this.cullingArea = rectangle;
    }

    public Rectangle getCullingArea() {
        return this.cullingArea;
    }

    public void setAlignment(int i) {
        this.alignment = i;
    }

    public void setTypeToSelect(boolean z) {
        this.typeToSelect = z;
    }

    public InputListener getKeyListener() {
        return this.keyListener;
    }

    public static class ListStyle {
        public Drawable background;
        public Drawable down;
        public BitmapFont font;
        public Color fontColorSelected = new Color(1.0f, 1.0f, 1.0f, 1.0f);
        public Color fontColorUnselected = new Color(1.0f, 1.0f, 1.0f, 1.0f);
        public Drawable over;
        public Drawable selection;

        public ListStyle() {
        }

        public ListStyle(BitmapFont bitmapFont, Color color, Color color2, Drawable drawable) {
            this.font = bitmapFont;
            this.fontColorSelected.set(color);
            this.fontColorUnselected.set(color2);
            this.selection = drawable;
        }

        public ListStyle(ListStyle listStyle) {
            this.font = listStyle.font;
            this.fontColorSelected.set(listStyle.fontColorSelected);
            this.fontColorUnselected.set(listStyle.fontColorUnselected);
            this.selection = listStyle.selection;
            this.down = listStyle.down;
            this.over = listStyle.over;
            this.background = listStyle.background;
        }
    }
}
