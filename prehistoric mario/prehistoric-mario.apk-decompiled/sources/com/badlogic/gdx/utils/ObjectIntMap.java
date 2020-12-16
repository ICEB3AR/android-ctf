package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ObjectIntMap<K> implements Iterable<Entry<K>> {
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
    int[] valueTable;
    private Values values1;
    private Values values2;

    public ObjectIntMap() {
        this(51, 0.8f);
    }

    public ObjectIntMap(int i) {
        this(i, 0.8f);
    }

    public ObjectIntMap(int i, float f) {
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
                    this.valueTable = new int[this.keyTable.length];
                    return;
                }
                throw new IllegalArgumentException("loadFactor must be > 0: " + f);
            }
            throw new IllegalArgumentException("initialCapacity is too large: " + nextPowerOfTwo);
        }
        throw new IllegalArgumentException("initialCapacity must be >= 0: " + i);
    }

    public ObjectIntMap(ObjectIntMap<? extends K> objectIntMap) {
        this((int) Math.floor((double) (((float) objectIntMap.capacity) * objectIntMap.loadFactor)), objectIntMap.loadFactor);
        this.stashSize = objectIntMap.stashSize;
        K[] kArr = objectIntMap.keyTable;
        System.arraycopy(kArr, 0, this.keyTable, 0, kArr.length);
        int[] iArr = objectIntMap.valueTable;
        System.arraycopy(iArr, 0, this.valueTable, 0, iArr.length);
        this.size = objectIntMap.size;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r7v0, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r9v0, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r11v0, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r3v1, resolved type: java.lang.Object[] */
    /* JADX WARN: Multi-variable type inference failed */
    public void put(K k, int i) {
        if (k != null) {
            K[] kArr = this.keyTable;
            int hashCode = k.hashCode();
            int i2 = hashCode & this.mask;
            K k2 = kArr[i2];
            if (k.equals(k2)) {
                this.valueTable[i2] = i;
                return;
            }
            int hash2 = hash2(hashCode);
            K k3 = kArr[hash2];
            if (k.equals(k3)) {
                this.valueTable[hash2] = i;
                return;
            }
            int hash3 = hash3(hashCode);
            K k4 = kArr[hash3];
            if (k.equals(k4)) {
                this.valueTable[hash3] = i;
                return;
            }
            int i3 = this.capacity;
            int i4 = this.stashSize + i3;
            while (i3 < i4) {
                if (k.equals(kArr[i3])) {
                    this.valueTable[i3] = i;
                    return;
                }
                i3++;
            }
            if (k2 == null) {
                kArr[i2] = k;
                this.valueTable[i2] = i;
                int i5 = this.size;
                this.size = i5 + 1;
                if (i5 >= this.threshold) {
                    resize(this.capacity << 1);
                }
            } else if (k3 == null) {
                kArr[hash2] = k;
                this.valueTable[hash2] = i;
                int i6 = this.size;
                this.size = i6 + 1;
                if (i6 >= this.threshold) {
                    resize(this.capacity << 1);
                }
            } else if (k4 == null) {
                kArr[hash3] = k;
                this.valueTable[hash3] = i;
                int i7 = this.size;
                this.size = i7 + 1;
                if (i7 >= this.threshold) {
                    resize(this.capacity << 1);
                }
            } else {
                push(k, i, i2, k2, hash2, k3, hash3, k4);
            }
        } else {
            throw new IllegalArgumentException("key cannot be null.");
        }
    }

    public void putAll(ObjectIntMap<? extends K> objectIntMap) {
        Entries<? extends K> it = objectIntMap.entries().iterator();
        while (it.hasNext()) {
            Entry entry = (Entry) it.next();
            put(entry.key, entry.value);
        }
    }

    private void putResize(K k, int i) {
        int hashCode = k.hashCode();
        int i2 = hashCode & this.mask;
        K[] kArr = this.keyTable;
        K k2 = kArr[i2];
        if (k2 == null) {
            kArr[i2] = k;
            this.valueTable[i2] = i;
            int i3 = this.size;
            this.size = i3 + 1;
            if (i3 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash2 = hash2(hashCode);
        K[] kArr2 = this.keyTable;
        K k3 = kArr2[hash2];
        if (k3 == null) {
            kArr2[hash2] = k;
            this.valueTable[hash2] = i;
            int i4 = this.size;
            this.size = i4 + 1;
            if (i4 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash3 = hash3(hashCode);
        K[] kArr3 = this.keyTable;
        K k4 = kArr3[hash3];
        if (k4 == null) {
            kArr3[hash3] = k;
            this.valueTable[hash3] = i;
            int i5 = this.size;
            this.size = i5 + 1;
            if (i5 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        push(k, i, i2, k2, hash2, k3, hash3, k4);
    }

    private void push(K k, int i, int i2, K k2, int i3, K k3, int i4, K k4) {
        K[] kArr = this.keyTable;
        int[] iArr = this.valueTable;
        int i5 = this.mask;
        int i6 = this.pushIterations;
        K k5 = k;
        int i7 = i;
        int i8 = i2;
        K k6 = k2;
        int i9 = i3;
        K k7 = k3;
        int i10 = i4;
        K k8 = k4;
        int i11 = 0;
        do {
            int random = MathUtils.random(2);
            if (random == 0) {
                int i12 = iArr[i8];
                kArr[i8] = k5;
                iArr[i8] = i7;
                i7 = i12;
                k5 = k6;
            } else if (random != 1) {
                int i13 = iArr[i10];
                kArr[i10] = k5;
                iArr[i10] = i7;
                k5 = k8;
                i7 = i13;
            } else {
                int i14 = iArr[i9];
                kArr[i9] = k5;
                iArr[i9] = i7;
                i7 = i14;
                k5 = k7;
            }
            int hashCode = k5.hashCode();
            i8 = hashCode & i5;
            k6 = kArr[i8];
            if (k6 == null) {
                kArr[i8] = k5;
                iArr[i8] = i7;
                int i15 = this.size;
                this.size = i15 + 1;
                if (i15 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i9 = hash2(hashCode);
            k7 = kArr[i9];
            if (k7 == null) {
                kArr[i9] = k5;
                iArr[i9] = i7;
                int i16 = this.size;
                this.size = i16 + 1;
                if (i16 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i10 = hash3(hashCode);
            k8 = kArr[i10];
            if (k8 == null) {
                kArr[i10] = k5;
                iArr[i10] = i7;
                int i17 = this.size;
                this.size = i17 + 1;
                if (i17 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i11++;
        } while (i11 != i6);
        putStash(k5, i7);
    }

    private void putStash(K k, int i) {
        int i2 = this.stashSize;
        if (i2 == this.stashCapacity) {
            resize(this.capacity << 1);
            putResize(k, i);
            return;
        }
        int i3 = this.capacity + i2;
        this.keyTable[i3] = k;
        this.valueTable[i3] = i;
        this.stashSize = i2 + 1;
        this.size++;
    }

    public int get(K k, int i) {
        int hashCode = k.hashCode();
        int i2 = this.mask & hashCode;
        if (!k.equals(this.keyTable[i2])) {
            i2 = hash2(hashCode);
            if (!k.equals(this.keyTable[i2])) {
                i2 = hash3(hashCode);
                if (!k.equals(this.keyTable[i2])) {
                    return getStash(k, i);
                }
            }
        }
        return this.valueTable[i2];
    }

    private int getStash(K k, int i) {
        K[] kArr = this.keyTable;
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (k.equals(kArr[i2])) {
                return this.valueTable[i2];
            }
            i2++;
        }
        return i;
    }

    public int getAndIncrement(K k, int i, int i2) {
        int hashCode = k.hashCode();
        int i3 = this.mask & hashCode;
        if (!k.equals(this.keyTable[i3])) {
            i3 = hash2(hashCode);
            if (!k.equals(this.keyTable[i3])) {
                i3 = hash3(hashCode);
                if (!k.equals(this.keyTable[i3])) {
                    return getAndIncrementStash(k, i, i2);
                }
            }
        }
        int[] iArr = this.valueTable;
        int i4 = iArr[i3];
        iArr[i3] = i2 + i4;
        return i4;
    }

    private int getAndIncrementStash(K k, int i, int i2) {
        K[] kArr = this.keyTable;
        int i3 = this.capacity;
        int i4 = this.stashSize + i3;
        while (i3 < i4) {
            if (k.equals(kArr[i3])) {
                int[] iArr = this.valueTable;
                int i5 = iArr[i3];
                iArr[i3] = i2 + i5;
                return i5;
            }
            i3++;
        }
        put(k, i2 + i);
        return i;
    }

    public int remove(K k, int i) {
        int hashCode = k.hashCode();
        int i2 = this.mask & hashCode;
        if (k.equals(this.keyTable[i2])) {
            this.keyTable[i2] = null;
            this.size--;
            return this.valueTable[i2];
        }
        int hash2 = hash2(hashCode);
        if (k.equals(this.keyTable[hash2])) {
            this.keyTable[hash2] = null;
            this.size--;
            return this.valueTable[hash2];
        }
        int hash3 = hash3(hashCode);
        if (!k.equals(this.keyTable[hash3])) {
            return removeStash(k, i);
        }
        this.keyTable[hash3] = null;
        this.size--;
        return this.valueTable[hash3];
    }

    /* access modifiers changed from: package-private */
    public int removeStash(K k, int i) {
        K[] kArr = this.keyTable;
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (k.equals(kArr[i2])) {
                int i4 = this.valueTable[i2];
                removeStashIndex(i2);
                this.size--;
                return i4;
            }
            i2++;
        }
        return i;
    }

    /* access modifiers changed from: package-private */
    public void removeStashIndex(int i) {
        this.stashSize--;
        int i2 = this.capacity + this.stashSize;
        if (i < i2) {
            K[] kArr = this.keyTable;
            kArr[i] = kArr[i2];
            int[] iArr = this.valueTable;
            iArr[i] = iArr[i2];
            kArr[i2] = null;
        }
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
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i > 0) {
                    kArr[i2] = null;
                    i = i2;
                } else {
                    this.size = 0;
                    this.stashSize = 0;
                    return;
                }
            }
        }
    }

    public boolean containsValue(int i) {
        K[] kArr = this.keyTable;
        int[] iArr = this.valueTable;
        int i2 = this.capacity + this.stashSize;
        while (true) {
            int i3 = i2 - 1;
            if (i2 <= 0) {
                return false;
            }
            if (kArr[i3] != null && iArr[i3] == i) {
                return true;
            }
            i2 = i3;
        }
    }

    public boolean containsKey(K k) {
        int hashCode = k.hashCode();
        if (k.equals(this.keyTable[this.mask & hashCode])) {
            return true;
        }
        if (k.equals(this.keyTable[hash2(hashCode)])) {
            return true;
        }
        if (!k.equals(this.keyTable[hash3(hashCode)])) {
            return containsKeyStash(k);
        }
        return true;
    }

    private boolean containsKeyStash(K k) {
        K[] kArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (k.equals(kArr[i])) {
                return true;
            }
            i++;
        }
        return false;
    }

    public K findKey(int i) {
        K[] kArr = this.keyTable;
        int[] iArr = this.valueTable;
        int i2 = this.capacity + this.stashSize;
        while (true) {
            int i3 = i2 - 1;
            if (i2 <= 0) {
                return null;
            }
            if (kArr[i3] != null && iArr[i3] == i) {
                return kArr[i3];
            }
            i2 = i3;
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
        int[] iArr = this.valueTable;
        int i3 = this.stashCapacity;
        this.keyTable = (K[]) new Object[(i + i3)];
        this.valueTable = new int[(i + i3)];
        int i4 = this.size;
        this.size = 0;
        this.stashSize = 0;
        if (i4 > 0) {
            for (int i5 = 0; i5 < i2; i5++) {
                K k = kArr[i5];
                if (k != null) {
                    putResize(k, iArr[i5]);
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
        int[] iArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            K k = kArr[i3];
            if (k != null) {
                i2 = i2 + (k.hashCode() * 31) + iArr[i3];
            }
        }
        return i2;
    }

    public boolean equals(Object obj) {
        int i;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ObjectIntMap)) {
            return false;
        }
        ObjectIntMap objectIntMap = (ObjectIntMap) obj;
        if (objectIntMap.size != this.size) {
            return false;
        }
        K[] kArr = this.keyTable;
        int[] iArr = this.valueTable;
        int i2 = this.capacity + this.stashSize;
        for (int i3 = 0; i3 < i2; i3++) {
            K k = kArr[i3];
            if (k != null && (((i = objectIntMap.get(k, 0)) == 0 && !objectIntMap.containsKey(k)) || i != iArr[i3])) {
                return false;
            }
        }
        return true;
    }

    public String toString() {
        int i;
        if (this.size == 0) {
            return "{}";
        }
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append('{');
        K[] kArr = this.keyTable;
        int[] iArr = this.valueTable;
        int length = kArr.length;
        while (true) {
            i = length - 1;
            if (length > 0) {
                K k = kArr[i];
                if (k != null) {
                    stringBuilder.append((Object) k);
                    stringBuilder.append('=');
                    stringBuilder.append(iArr[i]);
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
                    stringBuilder.append(iArr[i2]);
                }
                i = i2;
            } else {
                stringBuilder.append('}');
                return stringBuilder.toString();
            }
        }
    }

    @Override // java.lang.Iterable
    public Entries<K> iterator() {
        return entries();
    }

    public Entries<K> entries() {
        if (Collections.allocateIterators) {
            return new Entries<>(this);
        }
        if (this.entries1 == null) {
            this.entries1 = new Entries(this);
            this.entries2 = new Entries(this);
        }
        if (!this.entries1.valid) {
            this.entries1.reset();
            Entries<K> entries = this.entries1;
            entries.valid = true;
            this.entries2.valid = false;
            return entries;
        }
        this.entries2.reset();
        Entries<K> entries3 = this.entries2;
        entries3.valid = true;
        this.entries1.valid = false;
        return entries3;
    }

    public Values values() {
        if (Collections.allocateIterators) {
            return new Values(this);
        }
        if (this.values1 == null) {
            this.values1 = new Values(this);
            this.values2 = new Values(this);
        }
        if (!this.values1.valid) {
            this.values1.reset();
            Values values = this.values1;
            values.valid = true;
            this.values2.valid = false;
            return values;
        }
        this.values2.reset();
        Values values3 = this.values2;
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

    public static class Entry<K> {
        public K key;
        public int value;

        public String toString() {
            return ((Object) this.key) + "=" + this.value;
        }
    }

    /* access modifiers changed from: private */
    public static class MapIterator<K> {
        int currentIndex;
        public boolean hasNext;
        final ObjectIntMap<K> map;
        int nextIndex;
        boolean valid = true;

        public MapIterator(ObjectIntMap<K> objectIntMap) {
            this.map = objectIntMap;
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
                }
                this.currentIndex = -1;
                ObjectIntMap<K> objectIntMap = this.map;
                objectIntMap.size--;
                return;
            }
            throw new IllegalStateException("next must be called before remove.");
        }
    }

    public static class Entries<K> extends MapIterator<K> implements Iterable<Entry<K>>, Iterator<Entry<K>> {
        private Entry<K> entry = new Entry<>();

        @Override // java.lang.Iterable
        public Entries<K> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.ObjectIntMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Entries(ObjectIntMap<K> objectIntMap) {
            super(objectIntMap);
        }

        @Override // java.util.Iterator
        public Entry<K> next() {
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

        @Override // com.badlogic.gdx.utils.ObjectIntMap.MapIterator
        public void remove() {
            super.remove();
        }
    }

    public static class Values extends MapIterator<Object> {
        @Override // com.badlogic.gdx.utils.ObjectIntMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.ObjectIntMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Values(ObjectIntMap<?> objectIntMap) {
            super(objectIntMap);
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.hasNext;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        public int next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                int i = this.map.valueTable[this.nextIndex];
                this.currentIndex = this.nextIndex;
                findNextIndex();
                return i;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public IntArray toArray() {
            IntArray intArray = new IntArray(true, this.map.size);
            while (this.hasNext) {
                intArray.add(next());
            }
            return intArray;
        }
    }

    public static class Keys<K> extends MapIterator<K> implements Iterable<K>, Iterator<K> {
        @Override // java.lang.Iterable
        public Keys<K> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.ObjectIntMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Keys(ObjectIntMap<K> objectIntMap) {
            super(objectIntMap);
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

        public Array<K> toArray(Array<K> array) {
            while (this.hasNext) {
                array.add(next());
            }
            return array;
        }

        @Override // com.badlogic.gdx.utils.ObjectIntMap.MapIterator
        public void remove() {
            super.remove();
        }
    }
}
