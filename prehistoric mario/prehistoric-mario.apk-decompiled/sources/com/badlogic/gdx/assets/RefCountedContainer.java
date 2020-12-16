package com.badlogic.gdx.assets;

public class RefCountedContainer {
    Object object;
    int refCount = 1;

    public RefCountedContainer(Object obj) {
        if (obj != null) {
            this.object = obj;
            return;
        }
        throw new IllegalArgumentException("Object must not be null");
    }

    public void incRefCount() {
        this.refCount++;
    }

    public void decRefCount() {
        this.refCount--;
    }

    public int getRefCount() {
        return this.refCount;
    }

    public void setRefCount(int i) {
        this.refCount = i;
    }

    public <T> T getObject(Class<T> cls) {
        return (T) this.object;
    }

    public void setObject(Object obj) {
        this.object = obj;
    }
}
