package com.badlogic.gdx.utils;

import com.badlogic.gdx.utils.ObjectMap;
import java.util.NoSuchElementException;

public class OrderedMap<K, V> extends ObjectMap<K, V> {
    final Array<K> keys;

    public OrderedMap() {
        this.keys = new Array<>();
    }

    public OrderedMap(int i) {
        super(i);
        this.keys = new Array<>(this.capacity);
    }

    public OrderedMap(int i, float f) {
        super(i, f);
        this.keys = new Array<>(this.capacity);
    }

    public OrderedMap(OrderedMap<? extends K, ? extends V> orderedMap) {
        super(orderedMap);
        this.keys = new Array<>(orderedMap.keys);
    }

    @Override // com.badlogic.gdx.utils.ObjectMap
    public V put(K k, V v) {
        if (!containsKey(k)) {
            this.keys.add(k);
        }
        return (V) super.put(k, v);
    }

    @Override // com.badlogic.gdx.utils.ObjectMap
    public V remove(K k) {
        this.keys.removeValue(k, false);
        return (V) super.remove(k);
    }

    public V removeIndex(int i) {
        return (V) super.remove(this.keys.removeIndex(i));
    }

    @Override // com.badlogic.gdx.utils.ObjectMap
    public void clear(int i) {
        this.keys.clear();
        super.clear(i);
    }

    @Override // com.badlogic.gdx.utils.ObjectMap
    public void clear() {
        this.keys.clear();
        super.clear();
    }

    public Array<K> orderedKeys() {
        return this.keys;
    }

    @Override // com.badlogic.gdx.utils.ObjectMap, com.badlogic.gdx.utils.ObjectMap, java.lang.Iterable
    public ObjectMap.Entries<K, V> iterator() {
        return entries();
    }

    @Override // com.badlogic.gdx.utils.ObjectMap
    public ObjectMap.Entries<K, V> entries() {
        if (Collections.allocateIterators) {
            return new ObjectMap.Entries<>(this);
        }
        if (this.entries1 == null) {
            this.entries1 = new OrderedMapEntries(this);
            this.entries2 = new OrderedMapEntries(this);
        }
        if (!this.entries1.valid) {
            this.entries1.reset();
            this.entries1.valid = true;
            this.entries2.valid = false;
            return this.entries1;
        }
        this.entries2.reset();
        this.entries2.valid = true;
        this.entries1.valid = false;
        return this.entries2;
    }

    @Override // com.badlogic.gdx.utils.ObjectMap
    public ObjectMap.Values<V> values() {
        if (Collections.allocateIterators) {
            return new ObjectMap.Values<>(this);
        }
        if (this.values1 == null) {
            this.values1 = new OrderedMapValues(this);
            this.values2 = new OrderedMapValues(this);
        }
        if (!this.values1.valid) {
            this.values1.reset();
            this.values1.valid = true;
            this.values2.valid = false;
            return this.values1;
        }
        this.values2.reset();
        this.values2.valid = true;
        this.values1.valid = false;
        return this.values2;
    }

    @Override // com.badlogic.gdx.utils.ObjectMap
    public ObjectMap.Keys<K> keys() {
        if (Collections.allocateIterators) {
            return new ObjectMap.Keys<>(this);
        }
        if (this.keys1 == null) {
            this.keys1 = new OrderedMapKeys(this);
            this.keys2 = new OrderedMapKeys(this);
        }
        if (!this.keys1.valid) {
            this.keys1.reset();
            this.keys1.valid = true;
            this.keys2.valid = false;
            return this.keys1;
        }
        this.keys2.reset();
        this.keys2.valid = true;
        this.keys1.valid = false;
        return this.keys2;
    }

    @Override // com.badlogic.gdx.utils.ObjectMap
    public String toString() {
        if (this.size == 0) {
            return "{}";
        }
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append('{');
        Array<K> array = this.keys;
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            K k = array.get(i2);
            if (i2 > 0) {
                stringBuilder.append(", ");
            }
            stringBuilder.append((Object) k);
            stringBuilder.append('=');
            stringBuilder.append((Object) get(k));
        }
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public static class OrderedMapEntries<K, V> extends ObjectMap.Entries<K, V> {
        private Array<K> keys;

        public OrderedMapEntries(OrderedMap<K, V> orderedMap) {
            super(orderedMap);
            this.keys = orderedMap.keys;
        }

        @Override // com.badlogic.gdx.utils.ObjectMap.MapIterator, com.badlogic.gdx.utils.ObjectMap.Entries
        public void reset() {
            boolean z = false;
            this.nextIndex = 0;
            if (this.map.size > 0) {
                z = true;
            }
            this.hasNext = z;
        }

        @Override // java.util.Iterator, com.badlogic.gdx.utils.ObjectMap.Entries, com.badlogic.gdx.utils.ObjectMap.Entries
        public ObjectMap.Entry next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                this.entry.key = this.keys.get(this.nextIndex);
                this.entry.value = (V) this.map.get(this.entry.key);
                boolean z = true;
                this.nextIndex++;
                if (this.nextIndex >= this.map.size) {
                    z = false;
                }
                this.hasNext = z;
                return this.entry;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        @Override // com.badlogic.gdx.utils.ObjectMap.MapIterator, com.badlogic.gdx.utils.ObjectMap.Entries
        public void remove() {
            if (this.currentIndex >= 0) {
                this.map.remove(this.entry.key);
                this.nextIndex--;
                return;
            }
            throw new IllegalStateException("next must be called before remove.");
        }
    }

    public static class OrderedMapKeys<K> extends ObjectMap.Keys<K> {
        private Array<K> keys;

        public OrderedMapKeys(OrderedMap<K, ?> orderedMap) {
            super(orderedMap);
            this.keys = orderedMap.keys;
        }

        @Override // com.badlogic.gdx.utils.ObjectMap.Keys, com.badlogic.gdx.utils.ObjectMap.MapIterator
        public void reset() {
            boolean z = false;
            this.nextIndex = 0;
            if (this.map.size > 0) {
                z = true;
            }
            this.hasNext = z;
        }

        @Override // java.util.Iterator, com.badlogic.gdx.utils.ObjectMap.Keys
        public K next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                K k = this.keys.get(this.nextIndex);
                this.currentIndex = this.nextIndex;
                boolean z = true;
                this.nextIndex++;
                if (this.nextIndex >= this.map.size) {
                    z = false;
                }
                this.hasNext = z;
                return k;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        @Override // com.badlogic.gdx.utils.ObjectMap.Keys, com.badlogic.gdx.utils.ObjectMap.MapIterator
        public void remove() {
            if (this.currentIndex >= 0) {
                ((OrderedMap) this.map).removeIndex(this.nextIndex - 1);
                this.nextIndex = this.currentIndex;
                this.currentIndex = -1;
                return;
            }
            throw new IllegalStateException("next must be called before remove.");
        }
    }

    public static class OrderedMapValues<V> extends ObjectMap.Values<V> {
        private Array keys;

        public OrderedMapValues(OrderedMap<?, V> orderedMap) {
            super(orderedMap);
            this.keys = orderedMap.keys;
        }

        @Override // com.badlogic.gdx.utils.ObjectMap.MapIterator, com.badlogic.gdx.utils.ObjectMap.Values
        public void reset() {
            boolean z = false;
            this.nextIndex = 0;
            if (this.map.size > 0) {
                z = true;
            }
            this.hasNext = z;
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v4, resolved type: com.badlogic.gdx.utils.ObjectMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Iterator, com.badlogic.gdx.utils.ObjectMap.Values
        public V next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                V v = (V) this.map.get(this.keys.get(this.nextIndex));
                this.currentIndex = this.nextIndex;
                boolean z = true;
                this.nextIndex++;
                if (this.nextIndex >= this.map.size) {
                    z = false;
                }
                this.hasNext = z;
                return v;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        @Override // com.badlogic.gdx.utils.ObjectMap.MapIterator, com.badlogic.gdx.utils.ObjectMap.Values
        public void remove() {
            if (this.currentIndex >= 0) {
                ((OrderedMap) this.map).removeIndex(this.currentIndex);
                this.nextIndex = this.currentIndex;
                this.currentIndex = -1;
                return;
            }
            throw new IllegalStateException("next must be called before remove.");
        }
    }
}
