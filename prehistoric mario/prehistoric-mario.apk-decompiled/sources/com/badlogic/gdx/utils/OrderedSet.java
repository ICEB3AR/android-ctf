package com.badlogic.gdx.utils;

import com.badlogic.gdx.utils.ObjectSet;
import java.util.NoSuchElementException;

public class OrderedSet<T> extends ObjectSet<T> {
    final Array<T> items;
    OrderedSetIterator iterator1;
    OrderedSetIterator iterator2;

    public OrderedSet() {
        this.items = new Array<>();
    }

    public OrderedSet(int i, float f) {
        super(i, f);
        this.items = new Array<>(this.capacity);
    }

    public OrderedSet(int i) {
        super(i);
        this.items = new Array<>(this.capacity);
    }

    public OrderedSet(OrderedSet<? extends T> orderedSet) {
        super(orderedSet);
        this.items = new Array<>(this.capacity);
        this.items.addAll(orderedSet.items);
    }

    @Override // com.badlogic.gdx.utils.ObjectSet
    public boolean add(T t) {
        if (!super.add(t)) {
            return false;
        }
        this.items.add(t);
        return true;
    }

    public boolean add(T t, int i) {
        if (!super.add(t)) {
            this.items.removeValue(t, true);
            this.items.insert(i, t);
            return false;
        }
        this.items.insert(i, t);
        return true;
    }

    @Override // com.badlogic.gdx.utils.ObjectSet
    public boolean remove(T t) {
        if (!super.remove(t)) {
            return false;
        }
        this.items.removeValue(t, false);
        return true;
    }

    public T removeIndex(int i) {
        T removeIndex = this.items.removeIndex(i);
        super.remove(removeIndex);
        return removeIndex;
    }

    @Override // com.badlogic.gdx.utils.ObjectSet
    public void clear(int i) {
        this.items.clear();
        super.clear(i);
    }

    @Override // com.badlogic.gdx.utils.ObjectSet
    public void clear() {
        this.items.clear();
        super.clear();
    }

    public Array<T> orderedItems() {
        return this.items;
    }

    @Override // com.badlogic.gdx.utils.ObjectSet, com.badlogic.gdx.utils.ObjectSet, java.lang.Iterable
    public OrderedSetIterator<T> iterator() {
        if (Collections.allocateIterators) {
            return new OrderedSetIterator<>(this);
        }
        if (this.iterator1 == null) {
            this.iterator1 = new OrderedSetIterator(this);
            this.iterator2 = new OrderedSetIterator(this);
        }
        if (!this.iterator1.valid) {
            this.iterator1.reset();
            OrderedSetIterator<T> orderedSetIterator = this.iterator1;
            orderedSetIterator.valid = true;
            this.iterator2.valid = false;
            return orderedSetIterator;
        }
        this.iterator2.reset();
        OrderedSetIterator<T> orderedSetIterator2 = this.iterator2;
        orderedSetIterator2.valid = true;
        this.iterator1.valid = false;
        return orderedSetIterator2;
    }

    @Override // com.badlogic.gdx.utils.ObjectSet
    public String toString() {
        if (this.size == 0) {
            return "{}";
        }
        T[] tArr = this.items.items;
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append('{');
        stringBuilder.append((Object) tArr[0]);
        for (int i = 1; i < this.size; i++) {
            stringBuilder.append(", ");
            stringBuilder.append((Object) tArr[i]);
        }
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    @Override // com.badlogic.gdx.utils.ObjectSet
    public String toString(String str) {
        return this.items.toString(str);
    }

    public static class OrderedSetIterator<T> extends ObjectSet.ObjectSetIterator<T> {
        private Array<T> items;

        public OrderedSetIterator(OrderedSet<T> orderedSet) {
            super(orderedSet);
            this.items = orderedSet.items;
        }

        @Override // com.badlogic.gdx.utils.ObjectSet.ObjectSetIterator
        public void reset() {
            boolean z = false;
            this.nextIndex = 0;
            if (this.set.size > 0) {
                z = true;
            }
            this.hasNext = z;
        }

        @Override // com.badlogic.gdx.utils.ObjectSet.ObjectSetIterator, java.util.Iterator
        public T next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                T t = this.items.get(this.nextIndex);
                boolean z = true;
                this.nextIndex++;
                if (this.nextIndex >= this.set.size) {
                    z = false;
                }
                this.hasNext = z;
                return t;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        @Override // com.badlogic.gdx.utils.ObjectSet.ObjectSetIterator
        public void remove() {
            if (this.nextIndex >= 0) {
                this.nextIndex--;
                ((OrderedSet) this.set).removeIndex(this.nextIndex);
                return;
            }
            throw new IllegalStateException("next must be called before remove.");
        }
    }
}
