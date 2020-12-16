package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.ui.Value;
import com.badlogic.gdx.utils.Pool;

public class Cell<T extends Actor> implements Pool.Poolable {
    private static final Integer bottomi = 4;
    private static final Integer centeri = onei;
    private static Cell defaults;
    private static Files files;
    private static final Integer lefti = 8;
    private static final Float onef = Float.valueOf(1.0f);
    private static final Integer onei = 1;
    private static final Integer righti = 16;
    private static final Integer topi = 2;
    private static final Float zerof = Float.valueOf(0.0f);
    private static final Integer zeroi = 0;
    Actor actor;
    float actorHeight;
    float actorWidth;
    float actorX;
    float actorY;
    Integer align;
    int cellAboveIndex = -1;
    Integer colspan;
    int column;
    float computedPadBottom;
    float computedPadLeft;
    float computedPadRight;
    float computedPadTop;
    boolean endRow;
    Integer expandX;
    Integer expandY;
    Float fillX;
    Float fillY;
    Value maxHeight;
    Value maxWidth;
    Value minHeight;
    Value minWidth;
    Value padBottom;
    Value padLeft;
    Value padRight;
    Value padTop;
    Value prefHeight;
    Value prefWidth;
    int row;
    Value spaceBottom;
    Value spaceLeft;
    Value spaceRight;
    Value spaceTop;
    private Table table;
    Boolean uniformX;
    Boolean uniformY;

    public Cell() {
        Cell defaults2 = defaults();
        if (defaults2 != null) {
            set(defaults2);
        }
    }

    public void setTable(Table table2) {
        this.table = table2;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r2v0, resolved type: com.badlogic.gdx.scenes.scene2d.ui.Cell<T extends com.badlogic.gdx.scenes.scene2d.Actor> */
    /* JADX WARN: Multi-variable type inference failed */
    public <A extends Actor> Cell<A> setActor(A a) {
        Actor actor2 = this.actor;
        if (actor2 != a) {
            if (actor2 != null && actor2.getParent() == this.table) {
                this.actor.remove();
            }
            this.actor = a;
            if (a != null) {
                this.table.addActor(a);
            }
        }
        return this;
    }

    public Cell<T> clearActor() {
        setActor(null);
        return this;
    }

    public T getActor() {
        return (T) this.actor;
    }

    public boolean hasActor() {
        return this.actor != null;
    }

    public Cell<T> size(Value value) {
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

    public Cell<T> size(Value value, Value value2) {
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

    public Cell<T> size(float f) {
        size(Value.Fixed.valueOf(f));
        return this;
    }

    public Cell<T> size(float f, float f2) {
        size(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2));
        return this;
    }

    public Cell<T> width(Value value) {
        if (value != null) {
            this.minWidth = value;
            this.prefWidth = value;
            this.maxWidth = value;
            return this;
        }
        throw new IllegalArgumentException("width cannot be null.");
    }

    public Cell<T> width(float f) {
        width(Value.Fixed.valueOf(f));
        return this;
    }

    public Cell<T> height(Value value) {
        if (value != null) {
            this.minHeight = value;
            this.prefHeight = value;
            this.maxHeight = value;
            return this;
        }
        throw new IllegalArgumentException("height cannot be null.");
    }

    public Cell<T> height(float f) {
        height(Value.Fixed.valueOf(f));
        return this;
    }

    public Cell<T> minSize(Value value) {
        if (value != null) {
            this.minWidth = value;
            this.minHeight = value;
            return this;
        }
        throw new IllegalArgumentException("size cannot be null.");
    }

    public Cell<T> minSize(Value value, Value value2) {
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

    public Cell<T> minWidth(Value value) {
        if (value != null) {
            this.minWidth = value;
            return this;
        }
        throw new IllegalArgumentException("minWidth cannot be null.");
    }

    public Cell<T> minHeight(Value value) {
        if (value != null) {
            this.minHeight = value;
            return this;
        }
        throw new IllegalArgumentException("minHeight cannot be null.");
    }

    public Cell<T> minSize(float f) {
        minSize(Value.Fixed.valueOf(f));
        return this;
    }

    public Cell<T> minSize(float f, float f2) {
        minSize(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2));
        return this;
    }

    public Cell<T> minWidth(float f) {
        this.minWidth = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> minHeight(float f) {
        this.minHeight = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> prefSize(Value value) {
        if (value != null) {
            this.prefWidth = value;
            this.prefHeight = value;
            return this;
        }
        throw new IllegalArgumentException("size cannot be null.");
    }

    public Cell<T> prefSize(Value value, Value value2) {
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

    public Cell<T> prefWidth(Value value) {
        if (value != null) {
            this.prefWidth = value;
            return this;
        }
        throw new IllegalArgumentException("prefWidth cannot be null.");
    }

    public Cell<T> prefHeight(Value value) {
        if (value != null) {
            this.prefHeight = value;
            return this;
        }
        throw new IllegalArgumentException("prefHeight cannot be null.");
    }

    public Cell<T> prefSize(float f, float f2) {
        prefSize(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2));
        return this;
    }

    public Cell<T> prefSize(float f) {
        prefSize(Value.Fixed.valueOf(f));
        return this;
    }

    public Cell<T> prefWidth(float f) {
        this.prefWidth = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> prefHeight(float f) {
        this.prefHeight = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> maxSize(Value value) {
        if (value != null) {
            this.maxWidth = value;
            this.maxHeight = value;
            return this;
        }
        throw new IllegalArgumentException("size cannot be null.");
    }

    public Cell<T> maxSize(Value value, Value value2) {
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

    public Cell<T> maxWidth(Value value) {
        if (value != null) {
            this.maxWidth = value;
            return this;
        }
        throw new IllegalArgumentException("maxWidth cannot be null.");
    }

    public Cell<T> maxHeight(Value value) {
        if (value != null) {
            this.maxHeight = value;
            return this;
        }
        throw new IllegalArgumentException("maxHeight cannot be null.");
    }

    public Cell<T> maxSize(float f) {
        maxSize(Value.Fixed.valueOf(f));
        return this;
    }

    public Cell<T> maxSize(float f, float f2) {
        maxSize(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2));
        return this;
    }

    public Cell<T> maxWidth(float f) {
        this.maxWidth = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> maxHeight(float f) {
        this.maxHeight = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> space(Value value) {
        if (value != null) {
            this.spaceTop = value;
            this.spaceLeft = value;
            this.spaceBottom = value;
            this.spaceRight = value;
            return this;
        }
        throw new IllegalArgumentException("space cannot be null.");
    }

    public Cell<T> space(Value value, Value value2, Value value3, Value value4) {
        if (value == null) {
            throw new IllegalArgumentException("top cannot be null.");
        } else if (value2 == null) {
            throw new IllegalArgumentException("left cannot be null.");
        } else if (value3 == null) {
            throw new IllegalArgumentException("bottom cannot be null.");
        } else if (value4 != null) {
            this.spaceTop = value;
            this.spaceLeft = value2;
            this.spaceBottom = value3;
            this.spaceRight = value4;
            return this;
        } else {
            throw new IllegalArgumentException("right cannot be null.");
        }
    }

    public Cell<T> spaceTop(Value value) {
        if (value != null) {
            this.spaceTop = value;
            return this;
        }
        throw new IllegalArgumentException("spaceTop cannot be null.");
    }

    public Cell<T> spaceLeft(Value value) {
        if (value != null) {
            this.spaceLeft = value;
            return this;
        }
        throw new IllegalArgumentException("spaceLeft cannot be null.");
    }

    public Cell<T> spaceBottom(Value value) {
        if (value != null) {
            this.spaceBottom = value;
            return this;
        }
        throw new IllegalArgumentException("spaceBottom cannot be null.");
    }

    public Cell<T> spaceRight(Value value) {
        if (value != null) {
            this.spaceRight = value;
            return this;
        }
        throw new IllegalArgumentException("spaceRight cannot be null.");
    }

    public Cell<T> space(float f) {
        if (f >= 0.0f) {
            space(Value.Fixed.valueOf(f));
            return this;
        }
        throw new IllegalArgumentException("space cannot be < 0: " + f);
    }

    public Cell<T> space(float f, float f2, float f3, float f4) {
        if (f < 0.0f) {
            throw new IllegalArgumentException("top cannot be < 0: " + f);
        } else if (f2 < 0.0f) {
            throw new IllegalArgumentException("left cannot be < 0: " + f2);
        } else if (f3 < 0.0f) {
            throw new IllegalArgumentException("bottom cannot be < 0: " + f3);
        } else if (f4 >= 0.0f) {
            space(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2), Value.Fixed.valueOf(f3), Value.Fixed.valueOf(f4));
            return this;
        } else {
            throw new IllegalArgumentException("right cannot be < 0: " + f4);
        }
    }

    public Cell<T> spaceTop(float f) {
        if (f >= 0.0f) {
            this.spaceTop = Value.Fixed.valueOf(f);
            return this;
        }
        throw new IllegalArgumentException("spaceTop cannot be < 0: " + f);
    }

    public Cell<T> spaceLeft(float f) {
        if (f >= 0.0f) {
            this.spaceLeft = Value.Fixed.valueOf(f);
            return this;
        }
        throw new IllegalArgumentException("spaceLeft cannot be < 0: " + f);
    }

    public Cell<T> spaceBottom(float f) {
        if (f >= 0.0f) {
            this.spaceBottom = Value.Fixed.valueOf(f);
            return this;
        }
        throw new IllegalArgumentException("spaceBottom cannot be < 0: " + f);
    }

    public Cell<T> spaceRight(float f) {
        if (f >= 0.0f) {
            this.spaceRight = Value.Fixed.valueOf(f);
            return this;
        }
        throw new IllegalArgumentException("spaceRight cannot be < 0: " + f);
    }

    public Cell<T> pad(Value value) {
        if (value != null) {
            this.padTop = value;
            this.padLeft = value;
            this.padBottom = value;
            this.padRight = value;
            return this;
        }
        throw new IllegalArgumentException("pad cannot be null.");
    }

    public Cell<T> pad(Value value, Value value2, Value value3, Value value4) {
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

    public Cell<T> padTop(Value value) {
        if (value != null) {
            this.padTop = value;
            return this;
        }
        throw new IllegalArgumentException("padTop cannot be null.");
    }

    public Cell<T> padLeft(Value value) {
        if (value != null) {
            this.padLeft = value;
            return this;
        }
        throw new IllegalArgumentException("padLeft cannot be null.");
    }

    public Cell<T> padBottom(Value value) {
        if (value != null) {
            this.padBottom = value;
            return this;
        }
        throw new IllegalArgumentException("padBottom cannot be null.");
    }

    public Cell<T> padRight(Value value) {
        if (value != null) {
            this.padRight = value;
            return this;
        }
        throw new IllegalArgumentException("padRight cannot be null.");
    }

    public Cell<T> pad(float f) {
        pad(Value.Fixed.valueOf(f));
        return this;
    }

    public Cell<T> pad(float f, float f2, float f3, float f4) {
        pad(Value.Fixed.valueOf(f), Value.Fixed.valueOf(f2), Value.Fixed.valueOf(f3), Value.Fixed.valueOf(f4));
        return this;
    }

    public Cell<T> padTop(float f) {
        this.padTop = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> padLeft(float f) {
        this.padLeft = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> padBottom(float f) {
        this.padBottom = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> padRight(float f) {
        this.padRight = Value.Fixed.valueOf(f);
        return this;
    }

    public Cell<T> fill() {
        Float f = onef;
        this.fillX = f;
        this.fillY = f;
        return this;
    }

    public Cell<T> fillX() {
        this.fillX = onef;
        return this;
    }

    public Cell<T> fillY() {
        this.fillY = onef;
        return this;
    }

    public Cell<T> fill(float f, float f2) {
        this.fillX = Float.valueOf(f);
        this.fillY = Float.valueOf(f2);
        return this;
    }

    public Cell<T> fill(boolean z, boolean z2) {
        this.fillX = z ? onef : zerof;
        this.fillY = z2 ? onef : zerof;
        return this;
    }

    public Cell<T> fill(boolean z) {
        this.fillX = z ? onef : zerof;
        this.fillY = z ? onef : zerof;
        return this;
    }

    public Cell<T> align(int i) {
        this.align = Integer.valueOf(i);
        return this;
    }

    public Cell<T> center() {
        this.align = centeri;
        return this;
    }

    public Cell<T> top() {
        Integer num = this.align;
        if (num == null) {
            this.align = topi;
        } else {
            this.align = Integer.valueOf((num.intValue() | 2) & -5);
        }
        return this;
    }

    public Cell<T> left() {
        Integer num = this.align;
        if (num == null) {
            this.align = lefti;
        } else {
            this.align = Integer.valueOf((num.intValue() | 8) & -17);
        }
        return this;
    }

    public Cell<T> bottom() {
        Integer num = this.align;
        if (num == null) {
            this.align = bottomi;
        } else {
            this.align = Integer.valueOf((num.intValue() | 4) & -3);
        }
        return this;
    }

    public Cell<T> right() {
        Integer num = this.align;
        if (num == null) {
            this.align = righti;
        } else {
            this.align = Integer.valueOf((num.intValue() | 16) & -9);
        }
        return this;
    }

    public Cell<T> grow() {
        Integer num = onei;
        this.expandX = num;
        this.expandY = num;
        Float f = onef;
        this.fillX = f;
        this.fillY = f;
        return this;
    }

    public Cell<T> growX() {
        this.expandX = onei;
        this.fillX = onef;
        return this;
    }

    public Cell<T> growY() {
        this.expandY = onei;
        this.fillY = onef;
        return this;
    }

    public Cell<T> expand() {
        Integer num = onei;
        this.expandX = num;
        this.expandY = num;
        return this;
    }

    public Cell<T> expandX() {
        this.expandX = onei;
        return this;
    }

    public Cell<T> expandY() {
        this.expandY = onei;
        return this;
    }

    public Cell<T> expand(int i, int i2) {
        this.expandX = Integer.valueOf(i);
        this.expandY = Integer.valueOf(i2);
        return this;
    }

    public Cell<T> expand(boolean z, boolean z2) {
        this.expandX = z ? onei : zeroi;
        this.expandY = z2 ? onei : zeroi;
        return this;
    }

    public Cell<T> colspan(int i) {
        this.colspan = Integer.valueOf(i);
        return this;
    }

    public Cell<T> uniform() {
        this.uniformX = Boolean.TRUE;
        this.uniformY = Boolean.TRUE;
        return this;
    }

    public Cell<T> uniformX() {
        this.uniformX = Boolean.TRUE;
        return this;
    }

    public Cell<T> uniformY() {
        this.uniformY = Boolean.TRUE;
        return this;
    }

    public Cell<T> uniform(boolean z) {
        this.uniformX = Boolean.valueOf(z);
        this.uniformY = Boolean.valueOf(z);
        return this;
    }

    public Cell<T> uniform(boolean z, boolean z2) {
        this.uniformX = Boolean.valueOf(z);
        this.uniformY = Boolean.valueOf(z2);
        return this;
    }

    public void setActorBounds(float f, float f2, float f3, float f4) {
        this.actorX = f;
        this.actorY = f2;
        this.actorWidth = f3;
        this.actorHeight = f4;
    }

    public float getActorX() {
        return this.actorX;
    }

    public void setActorX(float f) {
        this.actorX = f;
    }

    public float getActorY() {
        return this.actorY;
    }

    public void setActorY(float f) {
        this.actorY = f;
    }

    public float getActorWidth() {
        return this.actorWidth;
    }

    public void setActorWidth(float f) {
        this.actorWidth = f;
    }

    public float getActorHeight() {
        return this.actorHeight;
    }

    public void setActorHeight(float f) {
        this.actorHeight = f;
    }

    public int getColumn() {
        return this.column;
    }

    public int getRow() {
        return this.row;
    }

    public Value getMinWidthValue() {
        return this.minWidth;
    }

    public float getMinWidth() {
        return this.minWidth.get(this.actor);
    }

    public Value getMinHeightValue() {
        return this.minHeight;
    }

    public float getMinHeight() {
        return this.minHeight.get(this.actor);
    }

    public Value getPrefWidthValue() {
        return this.prefWidth;
    }

    public float getPrefWidth() {
        return this.prefWidth.get(this.actor);
    }

    public Value getPrefHeightValue() {
        return this.prefHeight;
    }

    public float getPrefHeight() {
        return this.prefHeight.get(this.actor);
    }

    public Value getMaxWidthValue() {
        return this.maxWidth;
    }

    public float getMaxWidth() {
        return this.maxWidth.get(this.actor);
    }

    public Value getMaxHeightValue() {
        return this.maxHeight;
    }

    public float getMaxHeight() {
        return this.maxHeight.get(this.actor);
    }

    public Value getSpaceTopValue() {
        return this.spaceTop;
    }

    public float getSpaceTop() {
        return this.spaceTop.get(this.actor);
    }

    public Value getSpaceLeftValue() {
        return this.spaceLeft;
    }

    public float getSpaceLeft() {
        return this.spaceLeft.get(this.actor);
    }

    public Value getSpaceBottomValue() {
        return this.spaceBottom;
    }

    public float getSpaceBottom() {
        return this.spaceBottom.get(this.actor);
    }

    public Value getSpaceRightValue() {
        return this.spaceRight;
    }

    public float getSpaceRight() {
        return this.spaceRight.get(this.actor);
    }

    public Value getPadTopValue() {
        return this.padTop;
    }

    public float getPadTop() {
        return this.padTop.get(this.actor);
    }

    public Value getPadLeftValue() {
        return this.padLeft;
    }

    public float getPadLeft() {
        return this.padLeft.get(this.actor);
    }

    public Value getPadBottomValue() {
        return this.padBottom;
    }

    public float getPadBottom() {
        return this.padBottom.get(this.actor);
    }

    public Value getPadRightValue() {
        return this.padRight;
    }

    public float getPadRight() {
        return this.padRight.get(this.actor);
    }

    public float getPadX() {
        return this.padLeft.get(this.actor) + this.padRight.get(this.actor);
    }

    public float getPadY() {
        return this.padTop.get(this.actor) + this.padBottom.get(this.actor);
    }

    public float getFillX() {
        return this.fillX.floatValue();
    }

    public float getFillY() {
        return this.fillY.floatValue();
    }

    public int getAlign() {
        return this.align.intValue();
    }

    public int getExpandX() {
        return this.expandX.intValue();
    }

    public int getExpandY() {
        return this.expandY.intValue();
    }

    public int getColspan() {
        return this.colspan.intValue();
    }

    public boolean getUniformX() {
        return this.uniformX.booleanValue();
    }

    public boolean getUniformY() {
        return this.uniformY.booleanValue();
    }

    public boolean isEndRow() {
        return this.endRow;
    }

    public float getComputedPadTop() {
        return this.computedPadTop;
    }

    public float getComputedPadLeft() {
        return this.computedPadLeft;
    }

    public float getComputedPadBottom() {
        return this.computedPadBottom;
    }

    public float getComputedPadRight() {
        return this.computedPadRight;
    }

    public void row() {
        this.table.row();
    }

    public Table getTable() {
        return this.table;
    }

    /* access modifiers changed from: package-private */
    public void clear() {
        this.minWidth = null;
        this.minHeight = null;
        this.prefWidth = null;
        this.prefHeight = null;
        this.maxWidth = null;
        this.maxHeight = null;
        this.spaceTop = null;
        this.spaceLeft = null;
        this.spaceBottom = null;
        this.spaceRight = null;
        this.padTop = null;
        this.padLeft = null;
        this.padBottom = null;
        this.padRight = null;
        this.fillX = null;
        this.fillY = null;
        this.align = null;
        this.expandX = null;
        this.expandY = null;
        this.colspan = null;
        this.uniformX = null;
        this.uniformY = null;
    }

    @Override // com.badlogic.gdx.utils.Pool.Poolable
    public void reset() {
        this.actor = null;
        this.table = null;
        this.endRow = false;
        this.cellAboveIndex = -1;
        set(defaults());
    }

    /* access modifiers changed from: package-private */
    public void set(Cell cell) {
        this.minWidth = cell.minWidth;
        this.minHeight = cell.minHeight;
        this.prefWidth = cell.prefWidth;
        this.prefHeight = cell.prefHeight;
        this.maxWidth = cell.maxWidth;
        this.maxHeight = cell.maxHeight;
        this.spaceTop = cell.spaceTop;
        this.spaceLeft = cell.spaceLeft;
        this.spaceBottom = cell.spaceBottom;
        this.spaceRight = cell.spaceRight;
        this.padTop = cell.padTop;
        this.padLeft = cell.padLeft;
        this.padBottom = cell.padBottom;
        this.padRight = cell.padRight;
        this.fillX = cell.fillX;
        this.fillY = cell.fillY;
        this.align = cell.align;
        this.expandX = cell.expandX;
        this.expandY = cell.expandY;
        this.colspan = cell.colspan;
        this.uniformX = cell.uniformX;
        this.uniformY = cell.uniformY;
    }

    /* access modifiers changed from: package-private */
    public void merge(Cell cell) {
        if (cell != null) {
            Value value = cell.minWidth;
            if (value != null) {
                this.minWidth = value;
            }
            Value value2 = cell.minHeight;
            if (value2 != null) {
                this.minHeight = value2;
            }
            Value value3 = cell.prefWidth;
            if (value3 != null) {
                this.prefWidth = value3;
            }
            Value value4 = cell.prefHeight;
            if (value4 != null) {
                this.prefHeight = value4;
            }
            Value value5 = cell.maxWidth;
            if (value5 != null) {
                this.maxWidth = value5;
            }
            Value value6 = cell.maxHeight;
            if (value6 != null) {
                this.maxHeight = value6;
            }
            Value value7 = cell.spaceTop;
            if (value7 != null) {
                this.spaceTop = value7;
            }
            Value value8 = cell.spaceLeft;
            if (value8 != null) {
                this.spaceLeft = value8;
            }
            Value value9 = cell.spaceBottom;
            if (value9 != null) {
                this.spaceBottom = value9;
            }
            Value value10 = cell.spaceRight;
            if (value10 != null) {
                this.spaceRight = value10;
            }
            Value value11 = cell.padTop;
            if (value11 != null) {
                this.padTop = value11;
            }
            Value value12 = cell.padLeft;
            if (value12 != null) {
                this.padLeft = value12;
            }
            Value value13 = cell.padBottom;
            if (value13 != null) {
                this.padBottom = value13;
            }
            Value value14 = cell.padRight;
            if (value14 != null) {
                this.padRight = value14;
            }
            Float f = cell.fillX;
            if (f != null) {
                this.fillX = f;
            }
            Float f2 = cell.fillY;
            if (f2 != null) {
                this.fillY = f2;
            }
            Integer num = cell.align;
            if (num != null) {
                this.align = num;
            }
            Integer num2 = cell.expandX;
            if (num2 != null) {
                this.expandX = num2;
            }
            Integer num3 = cell.expandY;
            if (num3 != null) {
                this.expandY = num3;
            }
            Integer num4 = cell.colspan;
            if (num4 != null) {
                this.colspan = num4;
            }
            Boolean bool = cell.uniformX;
            if (bool != null) {
                this.uniformX = bool;
            }
            Boolean bool2 = cell.uniformY;
            if (bool2 != null) {
                this.uniformY = bool2;
            }
        }
    }

    public String toString() {
        Actor actor2 = this.actor;
        return actor2 != null ? actor2.toString() : super.toString();
    }

    public static Cell defaults() {
        Files files2 = files;
        if (files2 == null || files2 != Gdx.files) {
            files = Gdx.files;
            defaults = new Cell();
            defaults.minWidth = Value.minWidth;
            defaults.minHeight = Value.minHeight;
            defaults.prefWidth = Value.prefWidth;
            defaults.prefHeight = Value.prefHeight;
            defaults.maxWidth = Value.maxWidth;
            defaults.maxHeight = Value.maxHeight;
            defaults.spaceTop = Value.zero;
            defaults.spaceLeft = Value.zero;
            defaults.spaceBottom = Value.zero;
            defaults.spaceRight = Value.zero;
            defaults.padTop = Value.zero;
            defaults.padLeft = Value.zero;
            defaults.padBottom = Value.zero;
            defaults.padRight = Value.zero;
            Cell cell = defaults;
            Float f = zerof;
            cell.fillX = f;
            cell.fillY = f;
            cell.align = centeri;
            Integer num = zeroi;
            cell.expandX = num;
            cell.expandY = num;
            cell.colspan = onei;
            cell.uniformX = null;
            cell.uniformY = null;
        }
        return defaults;
    }
}
