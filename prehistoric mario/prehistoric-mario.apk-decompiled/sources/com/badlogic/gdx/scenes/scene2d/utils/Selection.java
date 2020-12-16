package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.OrderedSet;
import com.badlogic.gdx.utils.Pools;
import java.util.Iterator;

public class Selection<T> implements Disableable, Iterable<T> {
    private Actor actor;
    boolean isDisabled;
    T lastSelected;
    boolean multiple;
    private final OrderedSet<T> old = new OrderedSet<>();
    private boolean programmaticChangeEvents = true;
    boolean required;
    final OrderedSet<T> selected = new OrderedSet<>();
    private boolean toggle;

    /* access modifiers changed from: protected */
    public void changed() {
    }

    public void setActor(Actor actor2) {
        this.actor = actor2;
    }

    public void choose(T t) {
        if (t == null) {
            throw new IllegalArgumentException("item cannot be null.");
        } else if (!this.isDisabled) {
            snapshot();
            try {
                if (((!this.toggle || this.required || this.selected.size != 1) && !UIUtils.ctrl()) || !this.selected.contains(t)) {
                    boolean z = false;
                    if (!this.multiple || (!this.toggle && !UIUtils.ctrl())) {
                        if (this.selected.size != 1 || !this.selected.contains(t)) {
                            if (this.selected.size > 0) {
                                z = true;
                            }
                            this.selected.clear(8);
                        } else {
                            cleanup();
                            return;
                        }
                    }
                    if (this.selected.add(t) || z) {
                        this.lastSelected = t;
                    } else {
                        cleanup();
                        return;
                    }
                } else if (!this.required || this.selected.size != 1) {
                    this.selected.remove(t);
                    this.lastSelected = null;
                } else {
                    return;
                }
                if (fireChangeEvent()) {
                    revert();
                } else {
                    changed();
                }
                cleanup();
            } finally {
                cleanup();
            }
        }
    }

    @Deprecated
    public boolean hasItems() {
        return this.selected.size > 0;
    }

    public boolean notEmpty() {
        return this.selected.size > 0;
    }

    public boolean isEmpty() {
        return this.selected.size == 0;
    }

    public int size() {
        return this.selected.size;
    }

    public OrderedSet<T> items() {
        return this.selected;
    }

    public T first() {
        if (this.selected.size == 0) {
            return null;
        }
        return this.selected.first();
    }

    /* access modifiers changed from: package-private */
    public void snapshot() {
        this.old.clear(this.selected.size);
        this.old.addAll(this.selected);
    }

    /* access modifiers changed from: package-private */
    public void revert() {
        this.selected.clear(this.old.size);
        this.selected.addAll(this.old);
    }

    /* access modifiers changed from: package-private */
    public void cleanup() {
        this.old.clear(32);
    }

    public void set(T t) {
        if (t == null) {
            throw new IllegalArgumentException("item cannot be null.");
        } else if (this.selected.size != 1 || this.selected.first() != t) {
            snapshot();
            this.selected.clear(8);
            this.selected.add(t);
            if (!this.programmaticChangeEvents || !fireChangeEvent()) {
                this.lastSelected = t;
                changed();
            } else {
                revert();
            }
            cleanup();
        }
    }

    public void setAll(Array<T> array) {
        snapshot();
        this.lastSelected = null;
        this.selected.clear(array.size);
        int i = array.size;
        boolean z = false;
        for (int i2 = 0; i2 < i; i2++) {
            T t = array.get(i2);
            if (t != null) {
                if (this.selected.add(t)) {
                    z = true;
                }
            } else {
                throw new IllegalArgumentException("item cannot be null.");
            }
        }
        if (z) {
            if (this.programmaticChangeEvents && fireChangeEvent()) {
                revert();
            } else if (array.size > 0) {
                this.lastSelected = array.peek();
                changed();
            }
        }
        cleanup();
    }

    public void add(T t) {
        if (t == null) {
            throw new IllegalArgumentException("item cannot be null.");
        } else if (this.selected.add(t)) {
            if (!this.programmaticChangeEvents || !fireChangeEvent()) {
                this.lastSelected = t;
                changed();
                return;
            }
            this.selected.remove(t);
        }
    }

    public void addAll(Array<T> array) {
        snapshot();
        int i = array.size;
        boolean z = false;
        for (int i2 = 0; i2 < i; i2++) {
            T t = array.get(i2);
            if (t != null) {
                if (this.selected.add(t)) {
                    z = true;
                }
            } else {
                throw new IllegalArgumentException("item cannot be null.");
            }
        }
        if (z) {
            if (!this.programmaticChangeEvents || !fireChangeEvent()) {
                this.lastSelected = array.peek();
                changed();
            } else {
                revert();
            }
        }
        cleanup();
    }

    public void remove(T t) {
        if (t == null) {
            throw new IllegalArgumentException("item cannot be null.");
        } else if (this.selected.remove(t)) {
            if (!this.programmaticChangeEvents || !fireChangeEvent()) {
                this.lastSelected = null;
                changed();
                return;
            }
            this.selected.add(t);
        }
    }

    public void removeAll(Array<T> array) {
        snapshot();
        int i = array.size;
        boolean z = false;
        for (int i2 = 0; i2 < i; i2++) {
            T t = array.get(i2);
            if (t != null) {
                if (this.selected.remove(t)) {
                    z = true;
                }
            } else {
                throw new IllegalArgumentException("item cannot be null.");
            }
        }
        if (z) {
            if (!this.programmaticChangeEvents || !fireChangeEvent()) {
                this.lastSelected = null;
                changed();
            } else {
                revert();
            }
        }
        cleanup();
    }

    public void clear() {
        if (this.selected.size != 0) {
            snapshot();
            this.selected.clear(8);
            if (!this.programmaticChangeEvents || !fireChangeEvent()) {
                this.lastSelected = null;
                changed();
            } else {
                revert();
            }
            cleanup();
        }
    }

    public boolean fireChangeEvent() {
        if (this.actor == null) {
            return false;
        }
        ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent) Pools.obtain(ChangeListener.ChangeEvent.class);
        try {
            return this.actor.fire(changeEvent);
        } finally {
            Pools.free(changeEvent);
        }
    }

    public boolean contains(T t) {
        if (t == null) {
            return false;
        }
        return this.selected.contains(t);
    }

    public T getLastSelected() {
        T t = this.lastSelected;
        if (t != null) {
            return t;
        }
        if (this.selected.size > 0) {
            return this.selected.first();
        }
        return null;
    }

    @Override // java.lang.Iterable
    public Iterator<T> iterator() {
        return this.selected.iterator();
    }

    /* JADX DEBUG: Type inference failed for r0v2. Raw type applied. Possible types: com.badlogic.gdx.utils.Array<K>, com.badlogic.gdx.utils.Array<T> */
    public Array<T> toArray() {
        return (Array<K>) this.selected.iterator().toArray();
    }

    /* JADX DEBUG: Type inference failed for r2v1. Raw type applied. Possible types: com.badlogic.gdx.utils.Array<K>, com.badlogic.gdx.utils.Array<T> */
    public Array<T> toArray(Array<T> array) {
        return (Array<K>) this.selected.iterator().toArray(array);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public void setDisabled(boolean z) {
        this.isDisabled = z;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public boolean isDisabled() {
        return this.isDisabled;
    }

    public boolean getToggle() {
        return this.toggle;
    }

    public void setToggle(boolean z) {
        this.toggle = z;
    }

    public boolean getMultiple() {
        return this.multiple;
    }

    public void setMultiple(boolean z) {
        this.multiple = z;
    }

    public boolean getRequired() {
        return this.required;
    }

    public void setRequired(boolean z) {
        this.required = z;
    }

    public void setProgrammaticChangeEvents(boolean z) {
        this.programmaticChangeEvents = z;
    }

    public String toString() {
        return this.selected.toString();
    }
}
