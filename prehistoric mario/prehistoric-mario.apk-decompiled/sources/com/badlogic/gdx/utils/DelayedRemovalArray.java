package com.badlogic.gdx.utils;

import java.util.Comparator;

public class DelayedRemovalArray<T> extends Array<T> {
    private int clear;
    private int iterating;
    private IntArray remove = new IntArray(0);

    public DelayedRemovalArray() {
    }

    public DelayedRemovalArray(Array array) {
        super(array);
    }

    public DelayedRemovalArray(boolean z, int i, Class cls) {
        super(z, i, cls);
    }

    public DelayedRemovalArray(boolean z, int i) {
        super(z, i);
    }

    public DelayedRemovalArray(boolean z, T[] tArr, int i, int i2) {
        super(z, tArr, i, i2);
    }

    public DelayedRemovalArray(Class cls) {
        super(cls);
    }

    public DelayedRemovalArray(int i) {
        super(i);
    }

    public DelayedRemovalArray(T[] tArr) {
        super(tArr);
    }

    public void begin() {
        this.iterating++;
    }

    public void end() {
        int i = this.iterating;
        if (i != 0) {
            this.iterating = i - 1;
            if (this.iterating == 0) {
                int i2 = this.clear;
                if (i2 <= 0 || i2 != this.size) {
                    int i3 = this.remove.size;
                    for (int i4 = 0; i4 < i3; i4++) {
                        int pop = this.remove.pop();
                        if (pop >= this.clear) {
                            removeIndex(pop);
                        }
                    }
                    for (int i5 = this.clear - 1; i5 >= 0; i5--) {
                        removeIndex(i5);
                    }
                } else {
                    this.remove.clear();
                    clear();
                }
                this.clear = 0;
                return;
            }
            return;
        }
        throw new IllegalStateException("begin must be called before end.");
    }

    private void remove(int i) {
        if (i >= this.clear) {
            int i2 = this.remove.size;
            for (int i3 = 0; i3 < i2; i3++) {
                int i4 = this.remove.get(i3);
                if (i != i4) {
                    if (i < i4) {
                        this.remove.insert(i3, i);
                        return;
                    }
                } else {
                    return;
                }
            }
            this.remove.add(i);
        }
    }

    @Override // com.badlogic.gdx.utils.Array
    public boolean removeValue(T t, boolean z) {
        if (this.iterating <= 0) {
            return super.removeValue(t, z);
        }
        int indexOf = indexOf(t, z);
        if (indexOf == -1) {
            return false;
        }
        remove(indexOf);
        return true;
    }

    @Override // com.badlogic.gdx.utils.Array
    public T removeIndex(int i) {
        if (this.iterating <= 0) {
            return (T) super.removeIndex(i);
        }
        remove(i);
        return get(i);
    }

    @Override // com.badlogic.gdx.utils.Array
    public void removeRange(int i, int i2) {
        if (this.iterating > 0) {
            while (i2 >= i) {
                remove(i2);
                i2--;
            }
            return;
        }
        super.removeRange(i, i2);
    }

    @Override // com.badlogic.gdx.utils.Array
    public void clear() {
        if (this.iterating > 0) {
            this.clear = this.size;
        } else {
            super.clear();
        }
    }

    @Override // com.badlogic.gdx.utils.Array
    public void set(int i, T t) {
        if (this.iterating <= 0) {
            super.set(i, t);
            return;
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    @Override // com.badlogic.gdx.utils.Array
    public void insert(int i, T t) {
        if (this.iterating <= 0) {
            super.insert(i, t);
            return;
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    @Override // com.badlogic.gdx.utils.Array
    public void swap(int i, int i2) {
        if (this.iterating <= 0) {
            super.swap(i, i2);
            return;
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    @Override // com.badlogic.gdx.utils.Array
    public T pop() {
        if (this.iterating <= 0) {
            return (T) super.pop();
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    @Override // com.badlogic.gdx.utils.Array
    public void sort() {
        if (this.iterating <= 0) {
            super.sort();
            return;
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    @Override // com.badlogic.gdx.utils.Array
    public void sort(Comparator<? super T> comparator) {
        if (this.iterating <= 0) {
            super.sort(comparator);
            return;
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    @Override // com.badlogic.gdx.utils.Array
    public void reverse() {
        if (this.iterating <= 0) {
            super.reverse();
            return;
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    @Override // com.badlogic.gdx.utils.Array
    public void shuffle() {
        if (this.iterating <= 0) {
            super.shuffle();
            return;
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    @Override // com.badlogic.gdx.utils.Array
    public void truncate(int i) {
        if (this.iterating <= 0) {
            super.truncate(i);
            return;
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    @Override // com.badlogic.gdx.utils.Array
    public T[] setSize(int i) {
        if (this.iterating <= 0) {
            return (T[]) super.setSize(i);
        }
        throw new IllegalStateException("Invalid between begin/end.");
    }

    public static <T> DelayedRemovalArray<T> with(T... tArr) {
        return new DelayedRemovalArray<>(tArr);
    }
}
