package com.badlogic.gdx.utils;

public abstract class FlushablePool<T> extends Pool<T> {
    protected Array<T> obtained = new Array<>();

    public FlushablePool() {
    }

    public FlushablePool(int i) {
        super(i);
    }

    public FlushablePool(int i, int i2) {
        super(i, i2);
    }

    @Override // com.badlogic.gdx.utils.Pool
    public T obtain() {
        T t = (T) super.obtain();
        this.obtained.add(t);
        return t;
    }

    public void flush() {
        super.freeAll(this.obtained);
        this.obtained.clear();
    }

    @Override // com.badlogic.gdx.utils.Pool
    public void free(T t) {
        this.obtained.removeValue(t, true);
        super.free(t);
    }

    @Override // com.badlogic.gdx.utils.Pool
    public void freeAll(Array<T> array) {
        this.obtained.removeAll(array, true);
        super.freeAll(array);
    }
}
