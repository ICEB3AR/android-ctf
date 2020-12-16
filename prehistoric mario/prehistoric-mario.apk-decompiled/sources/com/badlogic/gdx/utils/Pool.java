package com.badlogic.gdx.utils;

public abstract class Pool<T> {
    private final Array<T> freeObjects;
    public final int max;
    public int peak;

    public interface Poolable {
        void reset();
    }

    /* access modifiers changed from: protected */
    public abstract T newObject();

    public Pool() {
        this(16, Integer.MAX_VALUE);
    }

    public Pool(int i) {
        this(i, Integer.MAX_VALUE);
    }

    public Pool(int i, int i2) {
        this.freeObjects = new Array<>(false, i);
        this.max = i2;
    }

    public T obtain() {
        return this.freeObjects.size == 0 ? newObject() : this.freeObjects.pop();
    }

    public void free(T t) {
        if (t != null) {
            if (this.freeObjects.size < this.max) {
                this.freeObjects.add(t);
                this.peak = Math.max(this.peak, this.freeObjects.size);
            }
            reset(t);
            return;
        }
        throw new IllegalArgumentException("object cannot be null.");
    }

    /* access modifiers changed from: protected */
    public void reset(T t) {
        if (t instanceof Poolable) {
            t.reset();
        }
    }

    public void freeAll(Array<T> array) {
        if (array != null) {
            Array<T> array2 = this.freeObjects;
            int i = this.max;
            for (int i2 = 0; i2 < array.size; i2++) {
                T t = array.get(i2);
                if (t != null) {
                    if (array2.size < i) {
                        array2.add(t);
                    }
                    reset(t);
                }
            }
            this.peak = Math.max(this.peak, array2.size);
            return;
        }
        throw new IllegalArgumentException("objects cannot be null.");
    }

    public void clear() {
        this.freeObjects.clear();
    }

    public int getFree() {
        return this.freeObjects.size;
    }
}
