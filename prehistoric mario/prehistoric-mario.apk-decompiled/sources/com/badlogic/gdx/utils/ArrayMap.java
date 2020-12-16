package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.reflect.ArrayReflection;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ArrayMap<K, V> implements Iterable<ObjectMap.Entry<K, V>> {
    private Entries entries1;
    private Entries entries2;
    public K[] keys;
    private Keys keys1;
    private Keys keys2;
    public boolean ordered;
    public int size;
    public V[] values;
    private Values values1;
    private Values values2;

    public ArrayMap() {
        this(true, 16);
    }

    public ArrayMap(int i) {
        this(true, i);
    }

    public ArrayMap(boolean z, int i) {
        this.ordered = z;
        this.keys = (K[]) new Object[i];
        this.values = (V[]) new Object[i];
    }

    public ArrayMap(boolean z, int i, Class cls, Class cls2) {
        this.ordered = z;
        this.keys = (K[]) ((Object[]) ArrayReflection.newInstance(cls, i));
        this.values = (V[]) ((Object[]) ArrayReflection.newInstance(cls2, i));
    }

    public ArrayMap(Class cls, Class cls2) {
        this(false, 16, cls, cls2);
    }

    public ArrayMap(ArrayMap arrayMap) {
        this(arrayMap.ordered, arrayMap.size, arrayMap.keys.getClass().getComponentType(), arrayMap.values.getClass().getComponentType());
        this.size = arrayMap.size;
        System.arraycopy(arrayMap.keys, 0, this.keys, 0, this.size);
        System.arraycopy(arrayMap.values, 0, this.values, 0, this.size);
    }

    public int put(K k, V v) {
        int indexOfKey = indexOfKey(k);
        if (indexOfKey == -1) {
            int i = this.size;
            if (i == this.keys.length) {
                resize(Math.max(8, (int) (((float) i) * 1.75f)));
            }
            indexOfKey = this.size;
            this.size = indexOfKey + 1;
        }
        this.keys[indexOfKey] = k;
        this.values[indexOfKey] = v;
        return indexOfKey;
    }

    public int put(K k, V v, int i) {
        int indexOfKey = indexOfKey(k);
        if (indexOfKey != -1) {
            removeIndex(indexOfKey);
        } else {
            int i2 = this.size;
            if (i2 == this.keys.length) {
                resize(Math.max(8, (int) (((float) i2) * 1.75f)));
            }
        }
        K[] kArr = this.keys;
        int i3 = i + 1;
        System.arraycopy(kArr, i, kArr, i3, this.size - i);
        V[] vArr = this.values;
        System.arraycopy(vArr, i, vArr, i3, this.size - i);
        this.keys[i] = k;
        this.values[i] = v;
        this.size++;
        return i;
    }

    public void putAll(ArrayMap<? extends K, ? extends V> arrayMap) {
        putAll(arrayMap, 0, arrayMap.size);
    }

    public void putAll(ArrayMap<? extends K, ? extends V> arrayMap, int i, int i2) {
        if (i + i2 <= arrayMap.size) {
            int i3 = (this.size + i2) - i;
            if (i3 >= this.keys.length) {
                resize(Math.max(8, (int) (((float) i3) * 1.75f)));
            }
            System.arraycopy(arrayMap.keys, i, this.keys, this.size, i2);
            System.arraycopy(arrayMap.values, i, this.values, this.size, i2);
            this.size += i2;
            return;
        }
        throw new IllegalArgumentException("offset + length must be <= size: " + i + " + " + i2 + " <= " + arrayMap.size);
    }

    public V get(K k) {
        return get(k, null);
    }

    public V get(K k, V v) {
        K[] kArr = this.keys;
        int i = this.size - 1;
        if (k == null) {
            while (i >= 0) {
                if (kArr[i] == k) {
                    return this.values[i];
                }
                i--;
            }
        } else {
            while (i >= 0) {
                if (k.equals(kArr[i])) {
                    return this.values[i];
                }
                i--;
            }
        }
        return v;
    }

    public K getKey(V v, boolean z) {
        V[] vArr = this.values;
        int i = this.size - 1;
        if (z || v == null) {
            while (i >= 0) {
                if (vArr[i] == v) {
                    return this.keys[i];
                }
                i--;
            }
            return null;
        }
        while (i >= 0) {
            if (v.equals(vArr[i])) {
                return this.keys[i];
            }
            i--;
        }
        return null;
    }

    public K getKeyAt(int i) {
        if (i < this.size) {
            return this.keys[i];
        }
        throw new IndexOutOfBoundsException(String.valueOf(i));
    }

    public V getValueAt(int i) {
        if (i < this.size) {
            return this.values[i];
        }
        throw new IndexOutOfBoundsException(String.valueOf(i));
    }

    public K firstKey() {
        if (this.size != 0) {
            return this.keys[0];
        }
        throw new IllegalStateException("Map is empty.");
    }

    public V firstValue() {
        if (this.size != 0) {
            return this.values[0];
        }
        throw new IllegalStateException("Map is empty.");
    }

    public void setKey(int i, K k) {
        if (i < this.size) {
            this.keys[i] = k;
            return;
        }
        throw new IndexOutOfBoundsException(String.valueOf(i));
    }

    public void setValue(int i, V v) {
        if (i < this.size) {
            this.values[i] = v;
            return;
        }
        throw new IndexOutOfBoundsException(String.valueOf(i));
    }

    public void insert(int i, K k, V v) {
        int i2 = this.size;
        if (i <= i2) {
            if (i2 == this.keys.length) {
                resize(Math.max(8, (int) (((float) i2) * 1.75f)));
            }
            if (this.ordered) {
                K[] kArr = this.keys;
                int i3 = i + 1;
                System.arraycopy(kArr, i, kArr, i3, this.size - i);
                V[] vArr = this.values;
                System.arraycopy(vArr, i, vArr, i3, this.size - i);
            } else {
                K[] kArr2 = this.keys;
                int i4 = this.size;
                kArr2[i4] = kArr2[i];
                V[] vArr2 = this.values;
                vArr2[i4] = vArr2[i];
            }
            this.size++;
            this.keys[i] = k;
            this.values[i] = v;
            return;
        }
        throw new IndexOutOfBoundsException(String.valueOf(i));
    }

    public boolean containsKey(K k) {
        K[] kArr = this.keys;
        int i = this.size - 1;
        if (k == null) {
            while (i >= 0) {
                int i2 = i - 1;
                if (kArr[i] == k) {
                    return true;
                }
                i = i2;
            }
            return false;
        }
        while (i >= 0) {
            int i3 = i - 1;
            if (k.equals(kArr[i])) {
                return true;
            }
            i = i3;
        }
        return false;
    }

    public boolean containsValue(V v, boolean z) {
        V[] vArr = this.values;
        int i = this.size - 1;
        if (z || v == null) {
            while (i >= 0) {
                int i2 = i - 1;
                if (vArr[i] == v) {
                    return true;
                }
                i = i2;
            }
            return false;
        }
        while (i >= 0) {
            int i3 = i - 1;
            if (v.equals(vArr[i])) {
                return true;
            }
            i = i3;
        }
        return false;
    }

    public int indexOfKey(K k) {
        K[] kArr = this.keys;
        int i = 0;
        if (k == null) {
            int i2 = this.size;
            while (i < i2) {
                if (kArr[i] == k) {
                    return i;
                }
                i++;
            }
            return -1;
        }
        int i3 = this.size;
        while (i < i3) {
            if (k.equals(kArr[i])) {
                return i;
            }
            i++;
        }
        return -1;
    }

    public int indexOfValue(V v, boolean z) {
        V[] vArr = this.values;
        int i = 0;
        if (z || v == null) {
            int i2 = this.size;
            while (i < i2) {
                if (vArr[i] == v) {
                    return i;
                }
                i++;
            }
            return -1;
        }
        int i3 = this.size;
        while (i < i3) {
            if (v.equals(vArr[i])) {
                return i;
            }
            i++;
        }
        return -1;
    }

    public V removeKey(K k) {
        K[] kArr = this.keys;
        int i = 0;
        if (k == null) {
            int i2 = this.size;
            while (i < i2) {
                if (kArr[i] == k) {
                    V v = this.values[i];
                    removeIndex(i);
                    return v;
                }
                i++;
            }
            return null;
        }
        int i3 = this.size;
        while (i < i3) {
            if (k.equals(kArr[i])) {
                V v2 = this.values[i];
                removeIndex(i);
                return v2;
            }
            i++;
        }
        return null;
    }

    public boolean removeValue(V v, boolean z) {
        V[] vArr = this.values;
        if (z || v == null) {
            int i = this.size;
            for (int i2 = 0; i2 < i; i2++) {
                if (vArr[i2] == v) {
                    removeIndex(i2);
                    return true;
                }
            }
        } else {
            int i3 = this.size;
            for (int i4 = 0; i4 < i3; i4++) {
                if (v.equals(vArr[i4])) {
                    removeIndex(i4);
                    return true;
                }
            }
        }
        return false;
    }

    public void removeIndex(int i) {
        int i2 = this.size;
        if (i < i2) {
            K[] kArr = this.keys;
            this.size = i2 - 1;
            if (this.ordered) {
                int i3 = i + 1;
                System.arraycopy(kArr, i3, kArr, i, this.size - i);
                V[] vArr = this.values;
                System.arraycopy(vArr, i3, vArr, i, this.size - i);
            } else {
                int i4 = this.size;
                kArr[i] = kArr[i4];
                V[] vArr2 = this.values;
                vArr2[i] = vArr2[i4];
            }
            int i5 = this.size;
            kArr[i5] = null;
            this.values[i5] = null;
            return;
        }
        throw new IndexOutOfBoundsException(String.valueOf(i));
    }

    public boolean notEmpty() {
        return this.size > 0;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    public K peekKey() {
        return this.keys[this.size - 1];
    }

    public V peekValue() {
        return this.values[this.size - 1];
    }

    public void clear(int i) {
        if (this.keys.length <= i) {
            clear();
            return;
        }
        this.size = 0;
        resize(i);
    }

    public void clear() {
        K[] kArr = this.keys;
        V[] vArr = this.values;
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            kArr[i2] = null;
            vArr[i2] = null;
        }
        this.size = 0;
    }

    public void shrink() {
        int length = this.keys.length;
        int i = this.size;
        if (length != i) {
            resize(i);
        }
    }

    public void ensureCapacity(int i) {
        if (i >= 0) {
            int i2 = this.size + i;
            if (i2 >= this.keys.length) {
                resize(Math.max(8, i2));
                return;
            }
            return;
        }
        throw new IllegalArgumentException("additionalCapacity must be >= 0: " + i);
    }

    /* access modifiers changed from: protected */
    public void resize(int i) {
        K[] kArr = (K[]) ((Object[]) ArrayReflection.newInstance(this.keys.getClass().getComponentType(), i));
        System.arraycopy(this.keys, 0, kArr, 0, Math.min(this.size, kArr.length));
        this.keys = kArr;
        V[] vArr = (V[]) ((Object[]) ArrayReflection.newInstance(this.values.getClass().getComponentType(), i));
        System.arraycopy(this.values, 0, vArr, 0, Math.min(this.size, vArr.length));
        this.values = vArr;
    }

    public void reverse() {
        int i = this.size;
        int i2 = i - 1;
        int i3 = i / 2;
        for (int i4 = 0; i4 < i3; i4++) {
            int i5 = i2 - i4;
            K[] kArr = this.keys;
            K k = kArr[i4];
            kArr[i4] = kArr[i5];
            kArr[i5] = k;
            V[] vArr = this.values;
            V v = vArr[i4];
            vArr[i4] = vArr[i5];
            vArr[i5] = v;
        }
    }

    public void shuffle() {
        for (int i = this.size - 1; i >= 0; i--) {
            int random = MathUtils.random(i);
            K[] kArr = this.keys;
            K k = kArr[i];
            kArr[i] = kArr[random];
            kArr[random] = k;
            V[] vArr = this.values;
            V v = vArr[i];
            vArr[i] = vArr[random];
            vArr[random] = v;
        }
    }

    public void truncate(int i) {
        if (this.size > i) {
            for (int i2 = i; i2 < this.size; i2++) {
                this.keys[i2] = null;
                this.values[i2] = null;
            }
            this.size = i;
        }
    }

    public int hashCode() {
        K[] kArr = this.keys;
        V[] vArr = this.values;
        int i = this.size;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            K k = kArr[i3];
            V v = vArr[i3];
            if (k != null) {
                i2 += k.hashCode() * 31;
            }
            if (v != null) {
                i2 += v.hashCode();
            }
        }
        return i2;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r9v1, resolved type: com.badlogic.gdx.utils.ArrayMap */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean equals(Object obj) {
        ArrayMap arrayMap;
        int i;
        if (obj == this) {
            return true;
        }
        if (!((obj instanceof ArrayMap) && (arrayMap = (ArrayMap) obj).size == (i = this.size))) {
            return false;
        }
        K[] kArr = this.keys;
        V[] vArr = this.values;
        for (int i2 = 0; i2 < i; i2++) {
            K k = kArr[i2];
            V v = vArr[i2];
            if (v == null) {
                if (arrayMap.get(k, ObjectMap.dummy) != null) {
                    return false;
                }
            } else if (!v.equals(arrayMap.get(k))) {
                return false;
            }
        }
        return true;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r10v1, resolved type: com.badlogic.gdx.utils.ArrayMap */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean equalsIdentity(Object obj) {
        ArrayMap arrayMap;
        int i;
        if (obj == this) {
            return true;
        }
        if (!((obj instanceof ArrayMap) && (arrayMap = (ArrayMap) obj).size == (i = this.size))) {
            return false;
        }
        K[] kArr = this.keys;
        V[] vArr = this.values;
        for (int i2 = 0; i2 < i; i2++) {
            if (vArr[i2] != arrayMap.get(kArr[i2], ObjectMap.dummy)) {
                return false;
            }
        }
        return true;
    }

    public String toString() {
        if (this.size == 0) {
            return "{}";
        }
        K[] kArr = this.keys;
        V[] vArr = this.values;
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append('{');
        stringBuilder.append((Object) kArr[0]);
        stringBuilder.append('=');
        stringBuilder.append((Object) vArr[0]);
        for (int i = 1; i < this.size; i++) {
            stringBuilder.append(", ");
            stringBuilder.append((Object) kArr[i]);
            stringBuilder.append('=');
            stringBuilder.append((Object) vArr[i]);
        }
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    @Override // java.lang.Iterable
    public Iterator<ObjectMap.Entry<K, V>> iterator() {
        return entries();
    }

    public Entries<K, V> entries() {
        if (Collections.allocateIterators) {
            return new Entries<>(this);
        }
        if (this.entries1 == null) {
            this.entries1 = new Entries(this);
            this.entries2 = new Entries(this);
        }
        if (!this.entries1.valid) {
            Entries<K, V> entries = this.entries1;
            entries.index = 0;
            entries.valid = true;
            this.entries2.valid = false;
            return entries;
        }
        Entries<K, V> entries3 = this.entries2;
        entries3.index = 0;
        entries3.valid = true;
        this.entries1.valid = false;
        return entries3;
    }

    public Values<V> values() {
        if (Collections.allocateIterators) {
            return new Values<>(this);
        }
        if (this.values1 == null) {
            this.values1 = new Values(this);
            this.values2 = new Values(this);
        }
        if (!this.values1.valid) {
            Values<V> values3 = this.values1;
            values3.index = 0;
            values3.valid = true;
            this.values2.valid = false;
            return values3;
        }
        Values<V> values4 = this.values2;
        values4.index = 0;
        values4.valid = true;
        this.values1.valid = false;
        return values4;
    }

    public Keys<K> keys() {
        if (Collections.allocateIterators) {
            return new Keys<>(this);
        }
        if (this.keys1 == null) {
            this.keys1 = new Keys(this);
            this.keys2 = new Keys(this);
        }
        if (!this.keys1.valid) {
            Keys<K> keys3 = this.keys1;
            keys3.index = 0;
            keys3.valid = true;
            this.keys2.valid = false;
            return keys3;
        }
        Keys<K> keys4 = this.keys2;
        keys4.index = 0;
        keys4.valid = true;
        this.keys1.valid = false;
        return keys4;
    }

    public static class Entries<K, V> implements Iterable<ObjectMap.Entry<K, V>>, Iterator<ObjectMap.Entry<K, V>> {
        ObjectMap.Entry<K, V> entry = new ObjectMap.Entry<>();
        int index;
        private final ArrayMap<K, V> map;
        boolean valid = true;

        @Override // java.lang.Iterable
        public Iterator<ObjectMap.Entry<K, V>> iterator() {
            return this;
        }

        public Entries(ArrayMap<K, V> arrayMap) {
            this.map = arrayMap;
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.index < this.map.size;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        @Override // java.util.Iterator
        public ObjectMap.Entry<K, V> next() {
            if (this.index >= this.map.size) {
                throw new NoSuchElementException(String.valueOf(this.index));
            } else if (this.valid) {
                this.entry.key = this.map.keys[this.index];
                ObjectMap.Entry<K, V> entry2 = this.entry;
                V[] vArr = this.map.values;
                int i = this.index;
                this.index = i + 1;
                entry2.value = vArr[i];
                return this.entry;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public void remove() {
            this.index--;
            this.map.removeIndex(this.index);
        }

        public void reset() {
            this.index = 0;
        }
    }

    public static class Values<V> implements Iterable<V>, Iterator<V> {
        int index;
        private final ArrayMap<Object, V> map;
        boolean valid = true;

        @Override // java.lang.Iterable
        public Iterator<V> iterator() {
            return this;
        }

        public Values(ArrayMap<Object, V> arrayMap) {
            this.map = arrayMap;
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.index < this.map.size;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        @Override // java.util.Iterator
        public V next() {
            if (this.index >= this.map.size) {
                throw new NoSuchElementException(String.valueOf(this.index));
            } else if (this.valid) {
                V[] vArr = this.map.values;
                int i = this.index;
                this.index = i + 1;
                return vArr[i];
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public void remove() {
            this.index--;
            this.map.removeIndex(this.index);
        }

        public void reset() {
            this.index = 0;
        }

        public Array<V> toArray() {
            return new Array<>(true, this.map.values, this.index, this.map.size - this.index);
        }

        public Array<V> toArray(Array array) {
            array.addAll(this.map.values, this.index, this.map.size - this.index);
            return array;
        }
    }

    public static class Keys<K> implements Iterable<K>, Iterator<K> {
        int index;
        private final ArrayMap<K, Object> map;
        boolean valid = true;

        @Override // java.lang.Iterable
        public Iterator<K> iterator() {
            return this;
        }

        public Keys(ArrayMap<K, Object> arrayMap) {
            this.map = arrayMap;
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.index < this.map.size;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        @Override // java.util.Iterator
        public K next() {
            if (this.index >= this.map.size) {
                throw new NoSuchElementException(String.valueOf(this.index));
            } else if (this.valid) {
                K[] kArr = this.map.keys;
                int i = this.index;
                this.index = i + 1;
                return kArr[i];
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public void remove() {
            this.index--;
            this.map.removeIndex(this.index);
        }

        public void reset() {
            this.index = 0;
        }

        public Array<K> toArray() {
            return new Array<>(true, this.map.keys, this.index, this.map.size - this.index);
        }

        public Array<K> toArray(Array array) {
            array.addAll(this.map.keys, this.index, this.map.size - this.index);
            return array;
        }
    }
}
