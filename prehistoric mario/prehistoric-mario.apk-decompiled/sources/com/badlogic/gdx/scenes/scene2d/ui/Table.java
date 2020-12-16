package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.scenes.scene2d.ui.Value;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.Layout;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.SnapshotArray;

public class Table extends WidgetGroup {
    public static Value backgroundBottom = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Table.AnonymousClass4 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            Drawable drawable = ((Table) actor).background;
            if (drawable == null) {
                return 0.0f;
            }
            return drawable.getBottomHeight();
        }
    };
    public static Value backgroundLeft = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Table.AnonymousClass3 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            Drawable drawable = ((Table) actor).background;
            if (drawable == null) {
                return 0.0f;
            }
            return drawable.getLeftWidth();
        }
    };
    public static Value backgroundRight = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Table.AnonymousClass5 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            Drawable drawable = ((Table) actor).background;
            if (drawable == null) {
                return 0.0f;
            }
            return drawable.getRightWidth();
        }
    };
    public static Value backgroundTop = new Value() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Table.AnonymousClass2 */

        @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
        public float get(Actor actor) {
            Drawable drawable = ((Table) actor).background;
            if (drawable == null) {
                return 0.0f;
            }
            return drawable.getTopHeight();
        }
    };
    static final Pool<Cell> cellPool = new Pool<Cell>() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Table.AnonymousClass1 */

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.utils.Pool
        public Cell newObject() {
            return new Cell();
        }
    };
    private static float[] columnWeightedWidth;
    public static Color debugActorColor = new Color(0.0f, 1.0f, 0.0f, 1.0f);
    public static Color debugCellColor = new Color(1.0f, 0.0f, 0.0f, 1.0f);
    public static Color debugTableColor = new Color(0.0f, 0.0f, 1.0f, 1.0f);
    private static float[] rowWeightedHeight;
    int align;
    Drawable background;
    private final Cell cellDefaults;
    private final Array<Cell> cells;
    private boolean clip;
    private final Array<Cell> columnDefaults;
    private float[] columnMinWidth;
    private float[] columnPrefWidth;
    private float[] columnWidth;
    private int columns;
    Debug debug;
    Array<DebugRect> debugRects;
    private float[] expandHeight;
    private float[] expandWidth;
    private boolean implicitEndRow;
    Value padBottom;
    Value padLeft;
    Value padRight;
    Value padTop;
    boolean round;
    private Cell rowDefaults;
    private float[] rowHeight;
    private float[] rowMinHeight;
    private float[] rowPrefHeight;
    private int rows;
    private boolean sizeInvalid;
    private Skin skin;
    private float tableMinHeight;
    private float tableMinWidth;
    private float tablePrefHeight;
    private float tablePrefWidth;

    public enum Debug {
        none,
        all,
        table,
        cell,
        actor
    }

    public static class DebugRect extends Rectangle {
        static Pool<DebugRect> pool = Pools.get(DebugRect.class);
        Color color;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void drawDebugBounds(ShapeRenderer shapeRenderer) {
    }

    public Table() {
        this(null);
    }

    public Table(Skin skin2) {
        this.cells = new Array<>(4);
        this.columnDefaults = new Array<>(2);
        this.sizeInvalid = true;
        this.padTop = backgroundTop;
        this.padLeft = backgroundLeft;
        this.padBottom = backgroundBottom;
        this.padRight = backgroundRight;
        this.align = 1;
        this.debug = Debug.none;
        this.round = true;
        this.skin = skin2;
        this.cellDefaults = obtainCell();
        setTransform(false);
        setTouchable(Touchable.childrenOnly);
    }

    private Cell obtainCell() {
        Cell obtain = cellPool.obtain();
        obtain.setTable(this);
        return obtain;
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

    public void setBackground(String str) {
        Skin skin2 = this.skin;
        if (skin2 != null) {
            setBackground(skin2.getDrawable(str));
            return;
        }
        throw new IllegalStateException("Table must have a skin set to use this method.");
    }

    public void setBackground(Drawable drawable) {
        if (this.background != drawable) {
            float padTop2 = getPadTop();
            float padLeft2 = getPadLeft();
            float padBottom2 = getPadBottom();
            float padRight2 = getPadRight();
            this.background = drawable;
            float padTop3 = getPadTop();
            float padLeft3 = getPadLeft();
            float padBottom3 = getPadBottom();
            float padRight3 = getPadRight();
            if (padTop2 + padBottom2 != padTop3 + padBottom3 || padLeft2 + padRight2 != padLeft3 + padRight3) {
                invalidateHierarchy();
            } else if (padTop2 != padTop3 || padLeft2 != padLeft3 || padBottom2 != padBottom3 || padRight2 != padRight3) {
                invalidate();
            }
        }
    }

    public Table background(Drawable drawable) {
        setBackground(drawable);
        return this;
    }

    public Table background(String str) {
        setBackground(str);
        return this;
    }

    public Drawable getBackground() {
        return this.background;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public Actor hit(float f, float f2, boolean z) {
        if (!this.clip || ((!z || getTouchable() != Touchable.disabled) && f >= 0.0f && f < getWidth() && f2 >= 0.0f && f2 < getHeight())) {
            return super.hit(f, f2, z);
        }
        return null;
    }

    public void setClip(boolean z) {
        this.clip = z;
        setTransform(z);
        invalidate();
    }

    public boolean getClip() {
        return this.clip;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void invalidate() {
        this.sizeInvalid = true;
        super.invalidate();
    }

    public <T extends Actor> Cell<T> add(T t) {
        Cell cell;
        Cell<T> obtainCell = obtainCell();
        obtainCell.actor = t;
        if (this.implicitEndRow) {
            this.implicitEndRow = false;
            this.rows--;
            this.cells.peek().endRow = false;
        }
        Array<Cell> array = this.cells;
        int i = array.size;
        if (i > 0) {
            Cell peek = array.peek();
            if (!peek.endRow) {
                obtainCell.column = peek.column + peek.colspan.intValue();
                obtainCell.row = peek.row;
            } else {
                obtainCell.column = 0;
                obtainCell.row = peek.row + 1;
            }
            if (obtainCell.row > 0) {
                int i2 = i - 1;
                loop0:
                while (true) {
                    if (i2 < 0) {
                        break;
                    }
                    Cell cell2 = array.get(i2);
                    int i3 = cell2.column;
                    int intValue = cell2.colspan.intValue() + i3;
                    while (i3 < intValue) {
                        if (i3 == obtainCell.column) {
                            obtainCell.cellAboveIndex = i2;
                            break loop0;
                        }
                        i3++;
                    }
                    i2--;
                }
            }
        } else {
            obtainCell.column = 0;
            obtainCell.row = 0;
        }
        array.add(obtainCell);
        obtainCell.set(this.cellDefaults);
        if (obtainCell.column < this.columnDefaults.size && (cell = this.columnDefaults.get(obtainCell.column)) != null) {
            obtainCell.merge(cell);
        }
        obtainCell.merge(this.rowDefaults);
        if (t != null) {
            addActor(t);
        }
        return obtainCell;
    }

    public Table add(Actor... actorArr) {
        for (Actor actor : actorArr) {
            add(actor);
        }
        return this;
    }

    public Cell<Label> add(CharSequence charSequence) {
        Skin skin2 = this.skin;
        if (skin2 != null) {
            return add(new Label(charSequence, skin2));
        }
        throw new IllegalStateException("Table must have a skin set to use this method.");
    }

    public Cell<Label> add(CharSequence charSequence, String str) {
        Skin skin2 = this.skin;
        if (skin2 != null) {
            return add(new Label(charSequence, (Label.LabelStyle) skin2.get(str, Label.LabelStyle.class)));
        }
        throw new IllegalStateException("Table must have a skin set to use this method.");
    }

    public Cell<Label> add(CharSequence charSequence, String str, Color color) {
        Skin skin2 = this.skin;
        if (skin2 != null) {
            return add(new Label(charSequence, new Label.LabelStyle(skin2.getFont(str), color)));
        }
        throw new IllegalStateException("Table must have a skin set to use this method.");
    }

    public Cell<Label> add(CharSequence charSequence, String str, String str2) {
        Skin skin2 = this.skin;
        if (skin2 != null) {
            return add(new Label(charSequence, new Label.LabelStyle(skin2.getFont(str), this.skin.getColor(str2))));
        }
        throw new IllegalStateException("Table must have a skin set to use this method.");
    }

    public Cell add() {
        return add((Actor) null);
    }

    public Cell<Stack> stack(Actor... actorArr) {
        Stack stack = new Stack();
        if (actorArr != null) {
            for (Actor actor : actorArr) {
                stack.addActor(actor);
            }
        }
        return add(stack);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public boolean removeActor(Actor actor) {
        return removeActor(actor, true);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public boolean removeActor(Actor actor, boolean z) {
        if (!super.removeActor(actor, z)) {
            return false;
        }
        Cell cell = getCell(actor);
        if (cell == null) {
            return true;
        }
        cell.actor = null;
        return true;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public void clearChildren() {
        Array<Cell> array = this.cells;
        for (int i = array.size - 1; i >= 0; i--) {
            Actor actor = array.get(i).actor;
            if (actor != null) {
                actor.remove();
            }
        }
        cellPool.freeAll(array);
        array.clear();
        this.rows = 0;
        this.columns = 0;
        Cell cell = this.rowDefaults;
        if (cell != null) {
            cellPool.free(cell);
        }
        this.rowDefaults = null;
        this.implicitEndRow = false;
        super.clearChildren();
    }

    public void reset() {
        clearChildren();
        this.padTop = backgroundTop;
        this.padLeft = backgroundLeft;
        this.padBottom = backgroundBottom;
        this.padRight = backgroundRight;
        this.align = 1;
        debug(Debug.none);
        this.cellDefaults.reset();
        int i = this.columnDefaults.size;
        for (int i2 = 0; i2 < i; i2++) {
            Cell cell = this.columnDefaults.get(i2);
            if (cell != null) {
                cellPool.free(cell);
            }
        }
        this.columnDefaults.clear();
    }

    public Cell row() {
        if (this.cells.size > 0) {
            if (!this.implicitEndRow) {
                if (this.cells.peek().endRow) {
                    return this.rowDefaults;
                }
                endRow();
            }
            invalidate();
        }
        this.implicitEndRow = false;
        Cell cell = this.rowDefaults;
        if (cell != null) {
            cellPool.free(cell);
        }
        this.rowDefaults = obtainCell();
        this.rowDefaults.clear();
        return this.rowDefaults;
    }

    private void endRow() {
        Array<Cell> array = this.cells;
        int i = 0;
        for (int i2 = array.size - 1; i2 >= 0; i2--) {
            Cell cell = array.get(i2);
            if (cell.endRow) {
                break;
            }
            i += cell.colspan.intValue();
        }
        this.columns = Math.max(this.columns, i);
        this.rows++;
        array.peek().endRow = true;
    }

    public Cell columnDefaults(int i) {
        Cell cell = this.columnDefaults.size > i ? this.columnDefaults.get(i) : null;
        if (cell == null) {
            cell = obtainCell();
            cell.clear();
            if (i >= this.columnDefaults.size) {
                for (int i2 = this.columnDefaults.size; i2 < i; i2++) {
                    this.columnDefaults.add(null);
                }
                this.columnDefaults.add(cell);
            } else {
                this.columnDefaults.set(i, cell);
            }
        }
        return cell;
    }

    public <T extends Actor> Cell<T> getCell(T t) {
        Array<Cell> array = this.cells;
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            Cell<T> cell = array.get(i2);
            if (cell.actor == t) {
                return cell;
            }
        }
        return null;
    }

    public Array<Cell> getCells() {
        return this.cells;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefWidth() {
        if (this.sizeInvalid) {
            computeSize();
        }
        float f = this.tablePrefWidth;
        Drawable drawable = this.background;
        return drawable != null ? Math.max(f, drawable.getMinWidth()) : f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefHeight() {
        if (this.sizeInvalid) {
            computeSize();
        }
        float f = this.tablePrefHeight;
        Drawable drawable = this.background;
        return drawable != null ? Math.max(f, drawable.getMinHeight()) : f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinWidth() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.tableMinWidth;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinHeight() {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.tableMinHeight;
    }

    public Cell defaults() {
        return this.cellDefaults;
    }

    public Table pad(Value value) {
        if (value != null) {
            this.padTop = value;
            this.padLeft = value;
            this.padBottom = value;
            this.padRight = value;
            this.sizeInvalid = true;
            return this;
        }
        throw new IllegalArgumentException("pad cannot be null.");
    }

    public Table pad(Value value, Value value2, Value value3, Value value4) {
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
            this.sizeInvalid = true;
            return this;
        } else {
            throw new IllegalArgumentException("right cannot be null.");
        }
    }

    public Table padTop(Value value) {
        if (value != null) {
            this.padTop = value;
            this.sizeInvalid = true;
            return this;
        }
        throw new IllegalArgumentException("padTop cannot be null.");
    }

    public Table padLeft(Value value) {
        if (value != null) {
            this.padLeft = value;
            this.sizeInvalid = true;
            return this;
        }
        throw new IllegalArgumentException("padLeft cannot be null.");
    }

    public Table padBottom(Value value) {
        if (value != null) {
            this.padBottom = value;
            this.sizeInvalid = true;
            return this;
        }
        throw new IllegalArgumentException("padBottom cannot be null.");
    }

    public Table padRight(Value value) {
        if (value != null) {
            this.padRight = value;
            this.sizeInvalid = true;
            return this;
        }
        throw new IllegalArgumentException("padRight cannot be null.");
    }

    public Table pad(float f) {
        pad(Value.Fixed.valueOf(f));
        return this;
    }

    public Table pad(float f, float f2, float f3, float f4) {
        this.padTop = Value.Fixed.valueOf(f);
        this.padLeft = Value.Fixed.valueOf(f2);
        this.padBottom = Value.Fixed.valueOf(f3);
        this.padRight = Value.Fixed.valueOf(f4);
        this.sizeInvalid = true;
        return this;
    }

    public Table padTop(float f) {
        this.padTop = Value.Fixed.valueOf(f);
        this.sizeInvalid = true;
        return this;
    }

    public Table padLeft(float f) {
        this.padLeft = Value.Fixed.valueOf(f);
        this.sizeInvalid = true;
        return this;
    }

    public Table padBottom(float f) {
        this.padBottom = Value.Fixed.valueOf(f);
        this.sizeInvalid = true;
        return this;
    }

    public Table padRight(float f) {
        this.padRight = Value.Fixed.valueOf(f);
        this.sizeInvalid = true;
        return this;
    }

    public Table align(int i) {
        this.align = i;
        return this;
    }

    public Table center() {
        this.align = 1;
        return this;
    }

    public Table top() {
        this.align |= 2;
        this.align &= -5;
        return this;
    }

    public Table left() {
        this.align |= 8;
        this.align &= -17;
        return this;
    }

    public Table bottom() {
        this.align |= 4;
        this.align &= -3;
        return this;
    }

    public Table right() {
        this.align |= 16;
        this.align &= -9;
        return this;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setDebug(boolean z) {
        debug(z ? Debug.all : Debug.none);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public Table debug() {
        super.debug();
        return this;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group
    public Table debugAll() {
        super.debugAll();
        return this;
    }

    public Table debugTable() {
        super.setDebug(true);
        if (this.debug != Debug.table) {
            this.debug = Debug.table;
            invalidate();
        }
        return this;
    }

    public Table debugCell() {
        super.setDebug(true);
        if (this.debug != Debug.cell) {
            this.debug = Debug.cell;
            invalidate();
        }
        return this;
    }

    public Table debugActor() {
        super.setDebug(true);
        if (this.debug != Debug.actor) {
            this.debug = Debug.actor;
            invalidate();
        }
        return this;
    }

    public Table debug(Debug debug2) {
        super.setDebug(debug2 != Debug.none);
        if (this.debug != debug2) {
            this.debug = debug2;
            if (debug2 == Debug.none) {
                clearDebugRects();
            } else {
                invalidate();
            }
        }
        return this;
    }

    public Debug getTableDebug() {
        return this.debug;
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

    public int getAlign() {
        return this.align;
    }

    public int getRow(float f) {
        Array<Cell> array = this.cells;
        float padTop2 = f + getPadTop();
        int i = array.size;
        if (i == 0) {
            return -1;
        }
        int i2 = 0;
        if (i == 1) {
            return 0;
        }
        int i3 = 0;
        while (i2 < i) {
            int i4 = i2 + 1;
            Cell cell = array.get(i2);
            if (cell.actorY + cell.computedPadTop < padTop2) {
                break;
            }
            if (cell.endRow) {
                i3++;
            }
            i2 = i4;
        }
        return Math.min(i3, this.rows - 1);
    }

    public void setSkin(Skin skin2) {
        this.skin = skin2;
    }

    public void setRound(boolean z) {
        this.round = z;
    }

    public int getRows() {
        return this.rows;
    }

    public int getColumns() {
        return this.columns;
    }

    public float getRowHeight(int i) {
        float[] fArr = this.rowHeight;
        if (fArr == null) {
            return 0.0f;
        }
        return fArr[i];
    }

    public float getRowMinHeight(int i) {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.rowMinHeight[i];
    }

    public float getRowPrefHeight(int i) {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.rowPrefHeight[i];
    }

    public float getColumnWidth(int i) {
        float[] fArr = this.columnWidth;
        if (fArr == null) {
            return 0.0f;
        }
        return fArr[i];
    }

    public float getColumnMinWidth(int i) {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.columnMinWidth[i];
    }

    public float getColumnPrefWidth(int i) {
        if (this.sizeInvalid) {
            computeSize();
        }
        return this.columnPrefWidth[i];
    }

    private float[] ensureSize(float[] fArr, int i) {
        if (fArr == null || fArr.length < i) {
            return new float[i];
        }
        int length = fArr.length;
        for (int i2 = 0; i2 < length; i2++) {
            fArr[i2] = 0.0f;
        }
        return fArr;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void layout() {
        float width = getWidth();
        float height = getHeight();
        layout(0.0f, 0.0f, width, height);
        Array<Cell> array = this.cells;
        if (this.round) {
            int i = array.size;
            for (int i2 = 0; i2 < i; i2++) {
                Cell cell = array.get(i2);
                float round2 = (float) Math.round(cell.actorWidth);
                float round3 = (float) Math.round(cell.actorHeight);
                float round4 = (float) Math.round(cell.actorX);
                float round5 = (height - ((float) Math.round(cell.actorY))) - round3;
                cell.setActorBounds(round4, round5, round2, round3);
                Actor actor = cell.actor;
                if (actor != null) {
                    actor.setBounds(round4, round5, round2, round3);
                }
            }
        } else {
            int i3 = array.size;
            for (int i4 = 0; i4 < i3; i4++) {
                Cell cell2 = array.get(i4);
                float f = cell2.actorHeight;
                float f2 = (height - cell2.actorY) - f;
                cell2.setActorY(f2);
                Actor actor2 = cell2.actor;
                if (actor2 != null) {
                    actor2.setBounds(cell2.actorX, f2, cell2.actorWidth, f);
                }
            }
        }
        SnapshotArray<Actor> children = getChildren();
        int i5 = children.size;
        for (int i6 = 0; i6 < i5; i6++) {
            Actor actor3 = children.get(i6);
            if (actor3 instanceof Layout) {
                ((Layout) actor3).validate();
            }
        }
    }

    private void computeSize() {
        float f;
        float[] fArr;
        float f2;
        this.sizeInvalid = false;
        Array<Cell> array = this.cells;
        int i = array.size;
        if (i > 0 && !array.peek().endRow) {
            endRow();
            this.implicitEndRow = true;
        }
        int i2 = this.columns;
        int i3 = this.rows;
        float[] ensureSize = ensureSize(this.columnMinWidth, i2);
        this.columnMinWidth = ensureSize;
        float[] ensureSize2 = ensureSize(this.rowMinHeight, i3);
        this.rowMinHeight = ensureSize2;
        float[] ensureSize3 = ensureSize(this.columnPrefWidth, i2);
        this.columnPrefWidth = ensureSize3;
        float[] ensureSize4 = ensureSize(this.rowPrefHeight, i3);
        this.rowPrefHeight = ensureSize4;
        this.columnWidth = ensureSize(this.columnWidth, i2);
        this.rowHeight = ensureSize(this.rowHeight, i3);
        float[] ensureSize5 = ensureSize(this.expandWidth, i2);
        this.expandWidth = ensureSize5;
        float[] ensureSize6 = ensureSize(this.expandHeight, i3);
        this.expandHeight = ensureSize6;
        int i4 = 0;
        float f3 = 0.0f;
        while (i4 < i) {
            Cell cell = array.get(i4);
            int i5 = cell.column;
            int i6 = cell.row;
            int intValue = cell.colspan.intValue();
            Actor actor = cell.actor;
            if (cell.expandY.intValue() != 0 && ensureSize6[i6] == 0.0f) {
                ensureSize6[i6] = (float) cell.expandY.intValue();
            }
            if (intValue == 1 && cell.expandX.intValue() != 0 && ensureSize5[i5] == 0.0f) {
                ensureSize5[i5] = (float) cell.expandX.intValue();
            }
            float f4 = cell.padLeft.get(actor);
            if (i5 == 0) {
                fArr = ensureSize6;
                f2 = 0.0f;
            } else {
                fArr = ensureSize6;
                f2 = Math.max(0.0f, cell.spaceLeft.get(actor) - f3);
            }
            cell.computedPadLeft = f4 + f2;
            cell.computedPadTop = cell.padTop.get(actor);
            if (cell.cellAboveIndex != -1) {
                cell.computedPadTop += Math.max(0.0f, cell.spaceTop.get(actor) - array.get(cell.cellAboveIndex).spaceBottom.get(actor));
            }
            float f5 = cell.spaceRight.get(actor);
            cell.computedPadRight = cell.padRight.get(actor) + (i5 + intValue == i2 ? 0.0f : f5);
            cell.computedPadBottom = cell.padBottom.get(actor) + (i6 == i3 + -1 ? 0.0f : cell.spaceBottom.get(actor));
            float f6 = cell.prefWidth.get(actor);
            float f7 = cell.prefHeight.get(actor);
            float f8 = cell.minWidth.get(actor);
            float f9 = cell.minHeight.get(actor);
            float f10 = cell.maxWidth.get(actor);
            float f11 = cell.maxHeight.get(actor);
            if (f6 < f8) {
                f6 = f8;
            }
            if (f7 < f9) {
                f7 = f9;
            }
            if (f10 <= 0.0f || f6 <= f10) {
                f10 = f6;
            }
            if (f11 <= 0.0f || f7 <= f11) {
                f11 = f7;
            }
            if (intValue == 1) {
                float f12 = cell.computedPadLeft + cell.computedPadRight;
                ensureSize3[i5] = Math.max(ensureSize3[i5], f10 + f12);
                ensureSize[i5] = Math.max(ensureSize[i5], f8 + f12);
            }
            float f13 = cell.computedPadTop + cell.computedPadBottom;
            ensureSize4[i6] = Math.max(ensureSize4[i6], f11 + f13);
            ensureSize2[i6] = Math.max(ensureSize2[i6], f9 + f13);
            i4++;
            i = i;
            ensureSize6 = fArr;
            f3 = f5;
            i3 = i3;
            i2 = i2;
            ensureSize5 = ensureSize5;
        }
        float f14 = 0.0f;
        float f15 = 0.0f;
        float f16 = 0.0f;
        float f17 = 0.0f;
        for (int i7 = 0; i7 < i; i7++) {
            Cell cell2 = array.get(i7);
            int i8 = cell2.column;
            int intValue2 = cell2.expandX.intValue();
            if (intValue2 != 0) {
                int intValue3 = cell2.colspan.intValue() + i8;
                int i9 = i8;
                while (true) {
                    if (i9 >= intValue3) {
                        int i10 = i8;
                        while (i10 < intValue3) {
                            ensureSize5[i10] = (float) intValue2;
                            i10++;
                            intValue3 = intValue3;
                        }
                    } else if (ensureSize5[i9] != 0.0f) {
                        break;
                    } else {
                        i9++;
                    }
                }
            }
            if (cell2.uniformX == Boolean.TRUE && cell2.colspan.intValue() == 1) {
                float f18 = cell2.computedPadLeft + cell2.computedPadRight;
                f16 = Math.max(f16, ensureSize[i8] - f18);
                f14 = Math.max(f14, ensureSize3[i8] - f18);
            }
            if (cell2.uniformY == Boolean.TRUE) {
                float f19 = cell2.computedPadTop + cell2.computedPadBottom;
                f17 = Math.max(f17, ensureSize2[cell2.row] - f19);
                f15 = Math.max(f15, ensureSize4[cell2.row] - f19);
            }
        }
        float f20 = 0.0f;
        if (f14 > 0.0f || f15 > 0.0f) {
            int i11 = 0;
            while (i11 < i) {
                Cell cell3 = array.get(i11);
                if (f14 > f20 && cell3.uniformX == Boolean.TRUE && cell3.colspan.intValue() == 1) {
                    float f21 = cell3.computedPadLeft + cell3.computedPadRight;
                    ensureSize[cell3.column] = f16 + f21;
                    ensureSize3[cell3.column] = f21 + f14;
                }
                if (f15 > 0.0f && cell3.uniformY == Boolean.TRUE) {
                    float f22 = cell3.computedPadTop + cell3.computedPadBottom;
                    ensureSize2[cell3.row] = f17 + f22;
                    ensureSize4[cell3.row] = f22 + f15;
                }
                i11++;
                f20 = 0.0f;
            }
        }
        for (int i12 = 0; i12 < i; i12++) {
            Cell cell4 = array.get(i12);
            int intValue4 = cell4.colspan.intValue();
            if (intValue4 != 1) {
                int i13 = cell4.column;
                Actor actor2 = cell4.actor;
                float f23 = cell4.minWidth.get(actor2);
                float f24 = cell4.prefWidth.get(actor2);
                float f25 = cell4.maxWidth.get(actor2);
                if (f24 < f23) {
                    f24 = f23;
                }
                if (f25 <= 0.0f || f24 <= f25) {
                    f25 = f24;
                }
                int i14 = i13 + intValue4;
                float f26 = -(cell4.computedPadLeft + cell4.computedPadRight);
                float f27 = f26;
                float f28 = 0.0f;
                for (int i15 = i13; i15 < i14; i15++) {
                    f26 += ensureSize[i15];
                    f27 += ensureSize3[i15];
                    f28 += ensureSize5[i15];
                }
                float f29 = 0.0f;
                float max = Math.max(0.0f, f23 - f26);
                float max2 = Math.max(0.0f, f25 - f27);
                while (i13 < i14) {
                    if (f28 == f29) {
                        f = 1.0f / ((float) intValue4);
                    } else {
                        f = ensureSize5[i13] / f28;
                    }
                    ensureSize[i13] = ensureSize[i13] + (max * f);
                    ensureSize3[i13] = ensureSize3[i13] + (f * max2);
                    i13++;
                    f29 = 0.0f;
                }
            }
        }
        this.tableMinWidth = 0.0f;
        this.tableMinHeight = 0.0f;
        this.tablePrefWidth = 0.0f;
        this.tablePrefHeight = 0.0f;
        for (int i16 = 0; i16 < i2; i16++) {
            this.tableMinWidth += ensureSize[i16];
            this.tablePrefWidth += ensureSize3[i16];
        }
        for (int i17 = 0; i17 < i3; i17++) {
            this.tableMinHeight += ensureSize2[i17];
            this.tablePrefHeight += Math.max(ensureSize2[i17], ensureSize4[i17]);
        }
        float f30 = this.padLeft.get(this) + this.padRight.get(this);
        float f31 = this.padTop.get(this) + this.padBottom.get(this);
        this.tableMinWidth += f30;
        this.tableMinHeight += f31;
        this.tablePrefWidth = Math.max(this.tablePrefWidth + f30, this.tableMinWidth);
        this.tablePrefHeight = Math.max(this.tablePrefHeight + f31, this.tableMinHeight);
    }

    /* JADX WARNING: Removed duplicated region for block: B:106:0x0299  */
    /* JADX WARNING: Removed duplicated region for block: B:108:0x029d  */
    /* JADX WARNING: Removed duplicated region for block: B:113:0x02ab  */
    /* JADX WARNING: Removed duplicated region for block: B:145:0x0397  */
    /* JADX WARNING: Removed duplicated region for block: B:146:0x039e  */
    /* JADX WARNING: Removed duplicated region for block: B:150:0x03b5 A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:151:0x03b6  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void layout(float r34, float r35, float r36, float r37) {
        /*
        // Method dump skipped, instructions count: 1115
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.Table.layout(float, float, float, float):void");
    }

    private void clearDebugRects() {
        if (this.debugRects != null) {
            DebugRect.pool.freeAll(this.debugRects);
            this.debugRects.clear();
        }
    }

    private void addDebugRect(float f, float f2, float f3, float f4, Color color) {
        if (this.debugRects == null) {
            this.debugRects = new Array<>();
        }
        DebugRect obtain = DebugRect.pool.obtain();
        obtain.color = color;
        obtain.set(f, (getHeight() - f2) - f4, f3, f4);
        this.debugRects.add(obtain);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public void drawDebug(ShapeRenderer shapeRenderer) {
        float f;
        if (isTransform()) {
            applyTransform(shapeRenderer, computeTransform());
            drawDebugRects(shapeRenderer);
            if (this.clip) {
                shapeRenderer.flush();
                float width = getWidth();
                float height = getHeight();
                float f2 = 0.0f;
                if (this.background != null) {
                    f2 = this.padLeft.get(this);
                    f = this.padBottom.get(this);
                    width -= this.padRight.get(this) + f2;
                    height -= this.padTop.get(this) + f;
                } else {
                    f = 0.0f;
                }
                if (clipBegin(f2, f, width, height)) {
                    drawDebugChildren(shapeRenderer);
                    clipEnd();
                }
            } else {
                drawDebugChildren(shapeRenderer);
            }
            resetTransform(shapeRenderer);
            return;
        }
        drawDebugRects(shapeRenderer);
        super.drawDebug(shapeRenderer);
    }

    private void drawDebugRects(ShapeRenderer shapeRenderer) {
        float f;
        if (this.debugRects != null && getDebug()) {
            shapeRenderer.set(ShapeRenderer.ShapeType.Line);
            if (getStage() != null) {
                shapeRenderer.setColor(getStage().getDebugColor());
            }
            float f2 = 0.0f;
            if (!isTransform()) {
                f2 = getX();
                f = getY();
            } else {
                f = 0.0f;
            }
            int i = this.debugRects.size;
            for (int i2 = 0; i2 < i; i2++) {
                DebugRect debugRect = this.debugRects.get(i2);
                shapeRenderer.setColor(debugRect.color);
                shapeRenderer.rect(debugRect.x + f2, debugRect.y + f, debugRect.width, debugRect.height);
            }
        }
    }

    public Skin getSkin() {
        return this.skin;
    }
}
