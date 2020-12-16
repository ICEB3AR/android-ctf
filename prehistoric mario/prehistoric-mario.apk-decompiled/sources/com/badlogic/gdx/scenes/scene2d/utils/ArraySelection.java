package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.OrderedSet;

public class ArraySelection<T> extends Selection<T> {
    private Array<T> array;
    private boolean rangeSelect = true;
    private T rangeStart;

    public ArraySelection(Array<T> array2) {
        this.array = array2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Selection
    public void choose(T t) {
        if (t == null) {
            throw new IllegalArgumentException("item cannot be null.");
        } else if (!this.isDisabled) {
            if (!this.rangeSelect || !this.multiple) {
                super.choose(t);
                return;
            }
            if (this.selected.size > 0 && UIUtils.shift()) {
                T t2 = this.rangeStart;
                int indexOf = t2 == null ? -1 : this.array.indexOf(t2, false);
                if (indexOf != -1) {
                    T t3 = this.rangeStart;
                    snapshot();
                    int indexOf2 = this.array.indexOf(t, false);
                    if (indexOf <= indexOf2) {
                        indexOf = indexOf2;
                        indexOf2 = indexOf;
                    }
                    if (!UIUtils.ctrl()) {
                        this.selected.clear(8);
                    }
                    while (indexOf2 <= indexOf) {
                        this.selected.add(this.array.get(indexOf2));
                        indexOf2++;
                    }
                    if (fireChangeEvent()) {
                        revert();
                    } else {
                        changed();
                    }
                    this.rangeStart = t3;
                    cleanup();
                    return;
                }
            }
            super.choose(t);
            this.rangeStart = t;
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.utils.Selection
    public void changed() {
        this.rangeStart = null;
    }

    public boolean getRangeSelect() {
        return this.rangeSelect;
    }

    public void setRangeSelect(boolean z) {
        this.rangeSelect = z;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v0, resolved type: com.badlogic.gdx.utils.Array<T> */
    /* JADX WARN: Multi-variable type inference failed */
    public void validate() {
        Array<T> array2 = this.array;
        if (array2.size == 0) {
            clear();
            return;
        }
        OrderedSet.OrderedSetIterator<T> it = items().iterator();
        while (it.hasNext()) {
            if (!array2.contains(it.next(), false)) {
                it.remove();
            }
        }
        if (this.required && this.selected.size == 0) {
            set(array2.first());
        }
    }
}
