package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.ObjectMap;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class IdentityMap<K, V> implements Iterable<ObjectMap.Entry<K, V>> {
    private static final int PRIME1 = -1105259343;
    private static final int PRIME2 = -1262997959;
    private static final int PRIME3 = -825114047;
    int capacity;
    private Entries entries1;
    private Entries entries2;
    private int hashShift;
    K[] keyTable;
    private Keys keys1;
    private Keys keys2;
    private float loadFactor;
    private int mask;
    private int pushIterations;
    public int size;
    private int stashCapacity;
    int stashSize;
    private int threshold;
    V[] valueTable;
    private Values values1;
    private Values values2;

    public IdentityMap() {
        this(51, 0.8f);
    }

    public IdentityMap(int i) {
        this(i, 0.8f);
    }

    public IdentityMap(int i, float f) {
        if (i >= 0) {
            int nextPowerOfTwo = MathUtils.nextPowerOfTwo((int) Math.ceil((double) (((float) i) / f)));
            if (nextPowerOfTwo <= 1073741824) {
                this.capacity = nextPowerOfTwo;
                if (f > 0.0f) {
                    this.loadFactor = f;
                    int i2 = this.capacity;
                    this.threshold = (int) (((float) i2) * f);
                    this.mask = i2 - 1;
                    this.hashShift = 31 - Integer.numberOfTrailingZeros(i2);
                    this.stashCapacity = Math.max(3, ((int) Math.ceil(Math.log((double) this.capacity))) * 2);
                    this.pushIterations = Math.max(Math.min(this.capacity, 8), ((int) Math.sqrt((double) this.capacity)) / 8);
                    this.keyTable = (K[]) new Object[(this.capacity + this.stashCapacity)];
                    this.valueTable = (V[]) new Object[this.keyTable.length];
                    return;
                }
                throw new IllegalArgumentException("loadFactor must be > 0: " + f);
            }
            throw new IllegalArgumentException("initialCapacity is too large: " + nextPowerOfTwo);
        }
        throw new IllegalArgumentException("initialCapacity must be >= 0: " + i);
    }

    public IdentityMap(IdentityMap identityMap) {
        this((int) Math.floor((double) (((float) identityMap.capacity) * identityMap.loadFactor)), identityMap.loadFactor);
        this.stashSize = identityMap.stashSize;
        K[] kArr = identityMap.keyTable;
        System.arraycopy(kArr, 0, this.keyTable, 0, kArr.length);
        V[] vArr = identityMap.valueTable;
        System.arraycopy(vArr, 0, this.valueTable, 0, vArr.length);
        this.size = identityMap.size;
    }

    public V put(K k, V v) {
        if (k != null) {
            K[] kArr = this.keyTable;
            int identityHashCode = System.identityHashCode(k);
            int i = identityHashCode & this.mask;
            K k2 = kArr[i];
            if (k2 == k) {
                V[] vArr = this.valueTable;
                V v2 = vArr[i];
                vArr[i] = v;
                return v2;
            }
            int hash2 = hash2(identityHashCode);
            K k3 = kArr[hash2];
            if (k3 == k) {
                V[] vArr2 = this.valueTable;
                V v3 = vArr2[hash2];
                vArr2[hash2] = v;
                return v3;
            }
            int hash3 = hash3(identityHashCode);
            K k4 = kArr[hash3];
            if (k4 == k) {
                V[] vArr3 = this.valueTable;
                V v4 = vArr3[hash3];
                vArr3[hash3] = v;
                return v4;
            }
            int i2 = this.capacity;
            int i3 = this.stashSize + i2;
            while (i2 < i3) {
                if (kArr[i2] == k) {
                    V[] vArr4 = this.valueTable;
                    V v5 = vArr4[i2];
                    vArr4[i2] = v;
                    return v5;
                }
                i2++;
            }
            if (k2 == null) {
                kArr[i] = k;
                this.valueTable[i] = v;
                int i4 = this.size;
                this.size = i4 + 1;
                if (i4 >= this.threshold) {
                    resize(this.capacity << 1);
                }
                return null;
            } else if (k3 == null) {
                kArr[hash2] = k;
                this.valueTable[hash2] = v;
                int i5 = this.size;
                this.size = i5 + 1;
                if (i5 >= this.threshold) {
                    resize(this.capacity << 1);
                }
                return null;
            } else if (k4 == null) {
                kArr[hash3] = k;
                this.valueTable[hash3] = v;
                int i6 = this.size;
                this.size = i6 + 1;
                if (i6 >= this.threshold) {
                    resize(this.capacity << 1);
                }
                return null;
            } else {
                push(k, v, i, k2, hash2, k3, hash3, k4);
                return null;
            }
        } else {
            throw new IllegalArgumentException("key cannot be null.");
        }
    }

    private void putResize(K k, V v) {
        int identityHashCode = System.identityHashCode(k);
        int i = identityHashCode & this.mask;
        K[] kArr = this.keyTable;
        K k2 = kArr[i];
        if (k2 == null) {
            kArr[i] = k;
            this.valueTable[i] = v;
            int i2 = this.size;
            this.size = i2 + 1;
            if (i2 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash2 = hash2(identityHashCode);
        K[] kArr2 = this.keyTable;
        K k3 = kArr2[hash2];
        if (k3 == null) {
            kArr2[hash2] = k;
            this.valueTable[hash2] = v;
            int i3 = this.size;
            this.size = i3 + 1;
            if (i3 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash3 = hash3(identityHashCode);
        K[] kArr3 = this.keyTable;
        K k4 = kArr3[hash3];
        if (k4 == null) {
            kArr3[hash3] = k;
            this.valueTable[hash3] = v;
            int i4 = this.size;
            this.size = i4 + 1;
            if (i4 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        push(k, v, i, k2, hash2, k3, hash3, k4);
    }

    private void push(K k, V v, int i, K k2, int i2, K k3, int i3, K k4) {
        K[] kArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i4 = this.mask;
        int i5 = this.pushIterations;
        K k5 = k;
        V v2 = v;
        int i6 = i;
        K k6 = k2;
        int i7 = i2;
        K k7 = k3;
        int i8 = i3;
        K k8 = k4;
        int i9 = 0;
        do {
            int random = MathUtils.random(2);
            if (random == 0) {
                V v3 = vArr[i6];
                kArr[i6] = k5;
                vArr[i6] = v2;
                v2 = v3;
                k5 = k6;
            } else if (random != 1) {
                V v4 = vArr[i8];
                kArr[i8] = k5;
                vArr[i8] = v2;
                k5 = k8;
                v2 = v4;
            } else {
                V v5 = vArr[i7];
                kArr[i7] = k5;
                vArr[i7] = v2;
                v2 = v5;
                k5 = k7;
            }
            int identityHashCode = System.identityHashCode(k5);
            i6 = identityHashCode & i4;
            k6 = kArr[i6];
            if (k6 == null) {
                kArr[i6] = k5;
                vArr[i6] = v2;
                int i10 = this.size;
                this.size = i10 + 1;
                if (i10 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i7 = hash2(identityHashCode);
            k7 = kArr[i7];
            if (k7 == null) {
                kArr[i7] = k5;
                vArr[i7] = v2;
                int i11 = this.size;
                this.size = i11 + 1;
                if (i11 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i8 = hash3(identityHashCode);
            k8 = kArr[i8];
            if (k8 == null) {
                kArr[i8] = k5;
                vArr[i8] = v2;
                int i12 = this.size;
                this.size = i12 + 1;
                if (i12 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i9++;
        } while (i9 != i5);
        putStash(k5, v2);
    }

    private void putStash(K k, V v) {
        int i = this.stashSize;
        if (i == this.stashCapacity) {
            resize(this.capacity << 1);
            putResize(k, v);
            return;
        }
        int i2 = this.capacity + i;
        this.keyTable[i2] = k;
        this.valueTable[i2] = v;
        this.stashSize = i + 1;
        this.size++;
    }

    public V get(K k) {
        int identityHashCode = System.identityHashCode(k);
        int i = this.mask & identityHashCode;
        if (k != this.keyTable[i]) {
            i = hash2(identityHashCode);
            if (k != this.keyTable[i]) {
                i = hash3(identityHashCode);
                if (k != this.keyTable[i]) {
                    return getStash(k, null);
                }
            }
        }
        return this.valueTable[i];
    }

    public V get(K k, V v) {
        int identityHashCode = System.identityHashCode(k);
        int i = this.mask & identityHashCode;
        if (k != this.keyTable[i]) {
            i = hash2(identityHashCode);
            if (k != this.keyTable[i]) {
                i = hash3(identityHashCode);
                if (k != this.keyTable[i]) {
                    return getStash(k, v);
                }
            }
        }
        return this.valueTable[i];
    }

    private V getStash(K k, V v) {
        K[] kArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (kArr[i] == k) {
                return this.valueTable[i];
            }
            i++;
        }
        return v;
    }

    public V remove(K k) {
        int identityHashCode = System.identityHashCode(k);
        int i = this.mask & identityHashCode;
        K[] kArr = this.keyTable;
        if (kArr[i] == k) {
            kArr[i] = null;
            V[] vArr = this.valueTable;
            V v = vArr[i];
            vArr[i] = null;
            this.size--;
            return v;
        }
        int hash2 = hash2(identityHashCode);
        K[] kArr2 = this.keyTable;
        if (kArr2[hash2] == k) {
            kArr2[hash2] = null;
            V[] vArr2 = this.valueTable;
            V v2 = vArr2[hash2];
            vArr2[hash2] = null;
            this.size--;
            return v2;
        }
        int hash3 = hash3(identityHashCode);
        K[] kArr3 = this.keyTable;
        if (kArr3[hash3] != k) {
            return removeStash(k);
        }
        kArr3[hash3] = null;
        V[] vArr3 = this.valueTable;
        V v3 = vArr3[hash3];
        vArr3[hash3] = null;
        this.size--;
        return v3;
    }

    /* access modifiers changed from: package-private */
    public V removeStash(K k) {
        K[] kArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (kArr[i] == k) {
                V v = this.valueTable[i];
                removeStashIndex(i);
                this.size--;
                return v;
            }
            i++;
        }
        return null;
    }

    /* access modifiers changed from: package-private */
    public void removeStashIndex(int i) {
        this.stashSize--;
        int i2 = this.capacity + this.stashSize;
        if (i < i2) {
            K[] kArr = this.keyTable;
            kArr[i] = kArr[i2];
            V[] vArr = this.valueTable;
            vArr[i] = vArr[i2];
            vArr[i2] = null;
            return;
        }
        this.valueTable[i] = null;
    }

    public boolean notEmpty() {
        return this.size > 0;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    public void shrink(int i) {
        if (i >= 0) {
            int i2 = this.size;
            if (i2 > i) {
                i = i2;
            }
            if (this.capacity > i) {
                resize(MathUtils.nextPowerOfTwo(i));
                return;
            }
            return;
        }
        throw new IllegalArgumentException("maximumCapacity must be >= 0: " + i);
    }

    public void clear(int i) {
        if (this.capacity <= i) {
            clear();
            return;
        }
        this.size = 0;
        resize(i);
    }

    public void clear() {
        if (this.size != 0) {
            K[] kArr = this.keyTable;
            V[] vArr = this.valueTable;
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i > 0) {
                    kArr[i2] = null;
                    vArr[i2] = null;
                    i = i2;
                } else {
                    this.size = 0;
                    this.stashSize = 0;
                    return;
                }
            }
        }
    }

    public boolean containsValue(Object obj, boolean z) {
        V[] vArr = this.valueTable;
        if (obj == null) {
            K[] kArr = this.keyTable;
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i <= 0) {
                    return false;
                }
                if (kArr[i2] != null && vArr[i2] == null) {
                    return true;
                }
                i = i2;
            }
        } else if (z) {
            int i3 = this.capacity + this.stashSize;
            while (true) {
                int i4 = i3 - 1;
                if (i3 <= 0) {
                    return false;
                }
                if (vArr[i4] == obj) {
                    return true;
                }
                i3 = i4;
            }
        } else {
            int i5 = this.capacity + this.stashSize;
            while (true) {
                int i6 = i5 - 1;
                if (i5 <= 0) {
                    return false;
                }
                if (obj.equals(vArr[i6])) {
                    return true;
                }
                i5 = i6;
            }
        }
    }

    public boolean containsKey(K k) {
        int identityHashCode = System.identityHashCode(k);
        if (k == this.keyTable[this.mask & identityHashCode]) {
            return true;
        }
        if (k == this.keyTable[hash2(identityHashCode)]) {
            return true;
        }
        if (k != this.keyTable[hash3(identityHashCode)]) {
            return containsKeyStash(k);
        }
        return true;
    }

    private boolean containsKeyStash(K k) {
        K[] kArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (kArr[i] == k) {
                return true;
            }
            i++;
        }
        return false;
    }

    public K findKey(Object obj, boolean z) {
        V[] vArr = this.valueTable;
        if (obj == null) {
            K[] kArr = this.keyTable;
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i <= 0) {
                    return null;
                }
                if (kArr[i2] != null && vArr[i2] == null) {
                    return kArr[i2];
                }
                i = i2;
            }
        } else if (z) {
            int i3 = this.capacity + this.stashSize;
            while (true) {
                int i4 = i3 - 1;
                if (i3 <= 0) {
                    return null;
                }
                if (vArr[i4] == obj) {
                    return this.keyTable[i4];
                }
                i3 = i4;
            }
        } else {
            int i5 = this.capacity + this.stashSize;
            while (true) {
                int i6 = i5 - 1;
                if (i5 <= 0) {
                    return null;
                }
                if (obj.equals(vArr[i6])) {
                    return this.keyTable[i6];
                }
                i5 = i6;
            }
        }
    }

    public void ensureCapacity(int i) {
        if (i >= 0) {
            int i2 = this.size + i;
            if (i2 >= this.threshold) {
                resize(MathUtils.nextPowerOfTwo((int) Math.ceil((double) (((float) i2) / this.loadFactor))));
                return;
            }
            return;
        }
        throw new IllegalArgumentException("additionalCapacity must be >= 0: " + i);
    }

    private void resize(int i) {
        int i2 = this.capacity + this.stashSize;
        this.capacity = i;
        this.threshold = (int) (((float) i) * this.loadFactor);
        this.mask = i - 1;
        this.hashShift = 31 - Integer.numberOfTrailingZeros(i);
        double d = (double) i;
        this.stashCapacity = Math.max(3, ((int) Math.ceil(Math.log(d))) * 2);
        this.pushIterations = Math.max(Math.min(i, 8), ((int) Math.sqrt(d)) / 8);
        K[] kArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i3 = this.stashCapacity;
        this.keyTable = (K[]) new Object[(i + i3)];
        this.valueTable = (V[]) new Object[(i + i3)];
        int i4 = this.size;
        this.size = 0;
        this.stashSize = 0;
        if (i4 > 0) {
            for (int i5 = 0; i5 < i2; i5++) {
                K k = kArr[i5];
                if (k != null) {
                    putResize(k, vArr[i5]);
                }
            }
        }
    }

    private int hash2(int i) {
        int i2 = i * PRIME2;
        return (i2 ^ (i2 >>> this.hashShift)) & this.mask;
    }

    private int hash3(int i) {
        int i2 = i * PRIME3;
        return (i2 ^ (i2 >>> this.hashShift)) & this.mask;
    }

    public int hashCode() {
        K[] kArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            K k = kArr[i3];
            if (k != null) {
                i2 += k.hashCode() * 31;
                V v = vArr[i3];
                if (v != null) {
                    i2 += v.hashCode();
                }
            }
        }
        return i2;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r9v1, resolved type: com.badlogic.gdx.utils.IdentityMap */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof IdentityMap)) {
            return false;
        }
        IdentityMap identityMap = (IdentityMap) obj;
        if (identityMap.size != this.size) {
            return false;
        }
        K[] kArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            K k = kArr[i2];
            if (k != null) {
                V v = vArr[i2];
                if (v == null) {
                    if (identityMap.get(k, ObjectMap.dummy) != null) {
                        return false;
                    }
                } else if (!v.equals(identityMap.get(k))) {
                    return false;
                }
            }
        }
        return true;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r10v1, resolved type: com.badlogic.gdx.utils.IdentityMap */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean equalsIdentity(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof IdentityMap)) {
            return false;
        }
        IdentityMap identityMap = (IdentityMap) obj;
        if (identityMap.size != this.size) {
            return false;
        }
        K[] kArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            K k = kArr[i2];
            if (!(k == null || vArr[i2] == identityMap.get(k, ObjectMap.dummy))) {
                return false;
            }
        }
        return true;
    }

    public String toString() {
        int i;
        if (this.size == 0) {
            return "[]";
        }
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append('[');
        K[] kArr = this.keyTable;
        V[] vArr = this.valueTable;
        int length = kArr.length;
        while (true) {
            i = length - 1;
            if (length > 0) {
                K k = kArr[i];
                if (k != null) {
                    stringBuilder.append((Object) k);
                    stringBuilder.append('=');
                    stringBuilder.append((Object) vArr[i]);
                    break;
                }
                length = i;
            } else {
                break;
            }
        }
        while (true) {
            int i2 = i - 1;
            if (i > 0) {
                K k2 = kArr[i2];
                if (k2 != null) {
                    stringBuilder.append(", ");
                    stringBuilder.append((Object) k2);
                    stringBuilder.append('=');
                    stringBuilder.append((Object) vArr[i2]);
                }
                i = i2;
            } else {
                stringBuilder.append(']');
                return stringBuilder.toString();
            }
        }
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
            this.entries1.reset();
            Entries<K, V> entries = this.entries1;
            entries.valid = true;
            this.entries2.valid = false;
            return entries;
        }
        this.entries2.reset();
        Entries<K, V> entries3 = this.entries2;
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
            this.values1.reset();
            Values<V> values = this.values1;
            values.valid = true;
            this.values2.valid = false;
            return values;
        }
        this.values2.reset();
        Values<V> values3 = this.values2;
        values3.valid = true;
        this.values1.valid = false;
        return values3;
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
            this.keys1.reset();
            Keys<K> keys = this.keys1;
            keys.valid = true;
            this.keys2.valid = false;
            return keys;
        }
        this.keys2.reset();
        Keys<K> keys3 = this.keys2;
        keys3.valid = true;
        this.keys1.valid = false;
        return keys3;
    }

    /* access modifiers changed from: private */
    public static abstract class MapIterator<K, V, I> implements Iterable<I>, Iterator<I> {
        int currentIndex;
        public boolean hasNext;
        final IdentityMap<K, V> map;
        int nextIndex;
        boolean valid = true;

        public MapIterator(IdentityMap<K, V> identityMap) {
            this.map = identityMap;
            reset();
        }

        public void reset() {
            this.currentIndex = -1;
            this.nextIndex = -1;
            findNextIndex();
        }

        /* access modifiers changed from: package-private */
        public void findNextIndex() {
            this.hasNext = false;
            K[] kArr = this.map.keyTable;
            int i = this.map.capacity + this.map.stashSize;
            do {
                int i2 = this.nextIndex + 1;
                this.nextIndex = i2;
                if (i2 >= i) {
                    return;
                }
            } while (kArr[this.nextIndex] == null);
            this.hasNext = true;
        }

        public void remove() {
            int i = this.currentIndex;
            if (i >= 0) {
                if (i >= this.map.capacity) {
                    this.map.removeStashIndex(this.currentIndex);
                    this.nextIndex = this.currentIndex - 1;
                    findNextIndex();
                } else {
                    this.map.keyTable[this.currentIndex] = null;
                    this.map.valueTable[this.currentIndex] = null;
                }
                this.currentIndex = -1;
                IdentityMap<K, V> identityMap = this.map;
                identityMap.size--;
                return;
            }
            throw new IllegalStateException("next must be called before remove.");
        }
    }

    public static class Entries<K, V> extends MapIterator<K, V, ObjectMap.Entry<K, V>> {
        private ObjectMap.Entry<K, V> entry = new ObjectMap.Entry<>();

        @Override // java.lang.Iterable
        public Iterator<ObjectMap.Entry<K, V>> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.IdentityMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.IdentityMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Entries(IdentityMap<K, V> identityMap) {
            super(identityMap);
        }

        @Override // java.util.Iterator
        public ObjectMap.Entry<K, V> next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                K[] kArr = this.map.keyTable;
                this.entry.key = kArr[this.nextIndex];
                this.entry.value = this.map.valueTable[this.nextIndex];
                this.currentIndex = this.nextIndex;
                findNextIndex();
                return this.entry;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.hasNext;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }
    }

    public static class Values<V> extends MapIterator<Object, V, V> {
        @Override // java.lang.Iterable
        public Iterator<V> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.IdentityMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.IdentityMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Values(IdentityMap<?, V> identityMap) {
            super(identityMap);
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.hasNext;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        @Override // java.util.Iterator
        public V next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                V v = this.map.valueTable[this.nextIndex];
                this.currentIndex = this.nextIndex;
                findNextIndex();
                return v;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public Array<V> toArray() {
            Array<V> array = new Array<>(true, this.map.size);
            while (this.hasNext) {
                array.add(next());
            }
            return array;
        }

        public void toArray(Array<V> array) {
            while (this.hasNext) {
                array.add(next());
            }
        }
    }

    public static class Keys<K> extends MapIterator<K, Object, K> {
        @Override // java.lang.Iterable
        public Iterator<K> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.IdentityMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.IdentityMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Keys(IdentityMap<K, ?> identityMap) {
            super(identityMap);
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.hasNext;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        @Override // java.util.Iterator
        public K next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                K k = this.map.keyTable[this.nextIndex];
                this.currentIndex = this.nextIndex;
                findNextIndex();
                return k;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public Array<K> toArray() {
            Array<K> array = new Array<>(true, this.map.size);
            while (this.hasNext) {
                array.add(next());
            }
            return array;
        }
    }
}
