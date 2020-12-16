package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ObjectFloatMap<K> implements Iterable<Entry<K>> {
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
    float[] valueTable;
    private Values values1;
    private Values values2;

    public ObjectFloatMap() {
        this(51, 0.8f);
    }

    public ObjectFloatMap(int i) {
        this(i, 0.8f);
    }

    public ObjectFloatMap(int i, float f) {
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
                    this.valueTable = new float[this.keyTable.length];
                    return;
                }
                throw new IllegalArgumentException("loadFactor must be > 0: " + f);
            }
            throw new IllegalArgumentException("initialCapacity is too large: " + nextPowerOfTwo);
        }
        throw new IllegalArgumentException("initialCapacity must be >= 0: " + i);
    }

    public ObjectFloatMap(ObjectFloatMap<? extends K> objectFloatMap) {
        this((int) Math.floor((double) (((float) objectFloatMap.capacity) * objectFloatMap.loadFactor)), objectFloatMap.loadFactor);
        this.stashSize = objectFloatMap.stashSize;
        K[] kArr = objectFloatMap.keyTable;
        System.arraycopy(kArr, 0, this.keyTable, 0, kArr.length);
        float[] fArr = objectFloatMap.valueTable;
        System.arraycopy(fArr, 0, this.valueTable, 0, fArr.length);
        this.size = objectFloatMap.size;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r7v0, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r9v0, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r11v0, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r3v1, resolved type: java.lang.Object[] */
    /* JADX WARN: Multi-variable type inference failed */
    public void put(K k, float f) {
        if (k != null) {
            K[] kArr = this.keyTable;
            int hashCode = k.hashCode();
            int i = hashCode & this.mask;
            K k2 = kArr[i];
            if (k.equals(k2)) {
                this.valueTable[i] = f;
                return;
            }
            int hash2 = hash2(hashCode);
            K k3 = kArr[hash2];
            if (k.equals(k3)) {
                this.valueTable[hash2] = f;
                return;
            }
            int hash3 = hash3(hashCode);
            K k4 = kArr[hash3];
            if (k.equals(k4)) {
                this.valueTable[hash3] = f;
                return;
            }
            int i2 = this.capacity;
            int i3 = this.stashSize + i2;
            while (i2 < i3) {
                if (k.equals(kArr[i2])) {
                    this.valueTable[i2] = f;
                    return;
                }
                i2++;
            }
            if (k2 == null) {
                kArr[i] = k;
                this.valueTable[i] = f;
                int i4 = this.size;
                this.size = i4 + 1;
                if (i4 >= this.threshold) {
                    resize(this.capacity << 1);
                }
            } else if (k3 == null) {
                kArr[hash2] = k;
                this.valueTable[hash2] = f;
                int i5 = this.size;
                this.size = i5 + 1;
                if (i5 >= this.threshold) {
                    resize(this.capacity << 1);
                }
            } else if (k4 == null) {
                kArr[hash3] = k;
                this.valueTable[hash3] = f;
                int i6 = this.size;
                this.size = i6 + 1;
                if (i6 >= this.threshold) {
                    resize(this.capacity << 1);
                }
            } else {
                push(k, f, i, k2, hash2, k3, hash3, k4);
            }
        } else {
            throw new IllegalArgumentException("key cannot be null.");
        }
    }

    public void putAll(ObjectFloatMap<? extends K> objectFloatMap) {
        Entries<? extends K> it = objectFloatMap.entries().iterator();
        while (it.hasNext()) {
            Entry entry = (Entry) it.next();
            put(entry.key, entry.value);
        }
    }

    private void putResize(K k, float f) {
        int hashCode = k.hashCode();
        int i = hashCode & this.mask;
        K[] kArr = this.keyTable;
        K k2 = kArr[i];
        if (k2 == null) {
            kArr[i] = k;
            this.valueTable[i] = f;
            int i2 = this.size;
            this.size = i2 + 1;
            if (i2 >= this.threshold) {
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
            this.valueTable[hash2] = f;
            int i3 = this.size;
            this.size = i3 + 1;
            if (i3 >= this.threshold) {
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
            this.valueTable[hash3] = f;
            int i4 = this.size;
            this.size = i4 + 1;
            if (i4 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        push(k, f, i, k2, hash2, k3, hash3, k4);
    }

    private void push(K k, float f, int i, K k2, int i2, K k3, int i3, K k4) {
        K[] kArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i4 = this.mask;
        int i5 = this.pushIterations;
        K k5 = k;
        float f2 = f;
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
                float f3 = fArr[i6];
                kArr[i6] = k5;
                fArr[i6] = f2;
                f2 = f3;
                k5 = k6;
            } else if (random != 1) {
                float f4 = fArr[i8];
                kArr[i8] = k5;
                fArr[i8] = f2;
                k5 = k8;
                f2 = f4;
            } else {
                float f5 = fArr[i7];
                kArr[i7] = k5;
                fArr[i7] = f2;
                f2 = f5;
                k5 = k7;
            }
            int hashCode = k5.hashCode();
            i6 = hashCode & i4;
            k6 = kArr[i6];
            if (k6 == null) {
                kArr[i6] = k5;
                fArr[i6] = f2;
                int i10 = this.size;
                this.size = i10 + 1;
                if (i10 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i7 = hash2(hashCode);
            k7 = kArr[i7];
            if (k7 == null) {
                kArr[i7] = k5;
                fArr[i7] = f2;
                int i11 = this.size;
                this.size = i11 + 1;
                if (i11 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i8 = hash3(hashCode);
            k8 = kArr[i8];
            if (k8 == null) {
                kArr[i8] = k5;
                fArr[i8] = f2;
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
        putStash(k5, f2);
    }

    private void putStash(K k, float f) {
        int i = this.stashSize;
        if (i == this.stashCapacity) {
            resize(this.capacity << 1);
            putResize(k, f);
            return;
        }
        int i2 = this.capacity + i;
        this.keyTable[i2] = k;
        this.valueTable[i2] = f;
        this.stashSize = i + 1;
        this.size++;
    }

    public float get(K k, float f) {
        int hashCode = k.hashCode();
        int i = this.mask & hashCode;
        if (!k.equals(this.keyTable[i])) {
            i = hash2(hashCode);
            if (!k.equals(this.keyTable[i])) {
                i = hash3(hashCode);
                if (!k.equals(this.keyTable[i])) {
                    return getStash(k, f);
                }
            }
        }
        return this.valueTable[i];
    }

    private float getStash(K k, float f) {
        K[] kArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (k.equals(kArr[i])) {
                return this.valueTable[i];
            }
            i++;
        }
        return f;
    }

    public float getAndIncrement(K k, float f, float f2) {
        int hashCode = k.hashCode();
        int i = this.mask & hashCode;
        if (!k.equals(this.keyTable[i])) {
            i = hash2(hashCode);
            if (!k.equals(this.keyTable[i])) {
                i = hash3(hashCode);
                if (!k.equals(this.keyTable[i])) {
                    return getAndIncrementStash(k, f, f2);
                }
            }
        }
        float[] fArr = this.valueTable;
        float f3 = fArr[i];
        fArr[i] = f2 + f3;
        return f3;
    }

    private float getAndIncrementStash(K k, float f, float f2) {
        K[] kArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (k.equals(kArr[i])) {
                float[] fArr = this.valueTable;
                float f3 = fArr[i];
                fArr[i] = f2 + f3;
                return f3;
            }
            i++;
        }
        put(k, f2 + f);
        return f;
    }

    public float remove(K k, float f) {
        int hashCode = k.hashCode();
        int i = this.mask & hashCode;
        if (k.equals(this.keyTable[i])) {
            this.keyTable[i] = null;
            this.size--;
            return this.valueTable[i];
        }
        int hash2 = hash2(hashCode);
        if (k.equals(this.keyTable[hash2])) {
            this.keyTable[hash2] = null;
            this.size--;
            return this.valueTable[hash2];
        }
        int hash3 = hash3(hashCode);
        if (!k.equals(this.keyTable[hash3])) {
            return removeStash(k, f);
        }
        this.keyTable[hash3] = null;
        this.size--;
        return this.valueTable[hash3];
    }

    /* access modifiers changed from: package-private */
    public float removeStash(K k, float f) {
        K[] kArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (k.equals(kArr[i])) {
                float f2 = this.valueTable[i];
                removeStashIndex(i);
                this.size--;
                return f2;
            }
            i++;
        }
        return f;
    }

    /* access modifiers changed from: package-private */
    public void removeStashIndex(int i) {
        this.stashSize--;
        int i2 = this.capacity + this.stashSize;
        if (i < i2) {
            K[] kArr = this.keyTable;
            kArr[i] = kArr[i2];
            float[] fArr = this.valueTable;
            fArr[i] = fArr[i2];
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

    public boolean containsValue(float f) {
        K[] kArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        while (true) {
            int i2 = i - 1;
            if (i <= 0) {
                return false;
            }
            if (kArr[i2] != null && fArr[i2] == f) {
                return true;
            }
            i = i2;
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

    public K findKey(float f) {
        K[] kArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        while (true) {
            int i2 = i - 1;
            if (i <= 0) {
                return null;
            }
            if (kArr[i2] != null && fArr[i2] == f) {
                return kArr[i2];
            }
            i = i2;
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
        float[] fArr = this.valueTable;
        int i3 = this.stashCapacity;
        this.keyTable = (K[]) new Object[(i + i3)];
        this.valueTable = new float[(i + i3)];
        int i4 = this.size;
        this.size = 0;
        this.stashSize = 0;
        if (i4 > 0) {
            for (int i5 = 0; i5 < i2; i5++) {
                K k = kArr[i5];
                if (k != null) {
                    putResize(k, fArr[i5]);
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
        float[] fArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            K k = kArr[i3];
            if (k != null) {
                i2 = i2 + (k.hashCode() * 31) + Float.floatToIntBits(fArr[i3]);
            }
        }
        return i2;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ObjectFloatMap)) {
            return false;
        }
        ObjectFloatMap objectFloatMap = (ObjectFloatMap) obj;
        if (objectFloatMap.size != this.size) {
            return false;
        }
        K[] kArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            K k = kArr[i2];
            if (k != null) {
                float f = objectFloatMap.get(k, 0.0f);
                if ((f == 0.0f && !objectFloatMap.containsKey(k)) || f != fArr[i2]) {
                    return false;
                }
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
        float[] fArr = this.valueTable;
        int length = kArr.length;
        while (true) {
            i = length - 1;
            if (length > 0) {
                K k = kArr[i];
                if (k != null) {
                    stringBuilder.append((Object) k);
                    stringBuilder.append('=');
                    stringBuilder.append(fArr[i]);
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
                    stringBuilder.append(fArr[i2]);
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
        public float value;

        public String toString() {
            return ((Object) this.key) + "=" + this.value;
        }
    }

    /* access modifiers changed from: private */
    public static class MapIterator<K> {
        int currentIndex;
        public boolean hasNext;
        final ObjectFloatMap<K> map;
        int nextIndex;
        boolean valid = true;

        public MapIterator(ObjectFloatMap<K> objectFloatMap) {
            this.map = objectFloatMap;
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
                ObjectFloatMap<K> objectFloatMap = this.map;
                objectFloatMap.size--;
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

        @Override // com.badlogic.gdx.utils.ObjectFloatMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Entries(ObjectFloatMap<K> objectFloatMap) {
            super(objectFloatMap);
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

        @Override // com.badlogic.gdx.utils.ObjectFloatMap.MapIterator
        public void remove() {
            super.remove();
        }
    }

    public static class Values extends MapIterator<Object> {
        @Override // com.badlogic.gdx.utils.ObjectFloatMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.ObjectFloatMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Values(ObjectFloatMap<?> objectFloatMap) {
            super(objectFloatMap);
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.hasNext;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        public float next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                float f = this.map.valueTable[this.nextIndex];
                this.currentIndex = this.nextIndex;
                findNextIndex();
                return f;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public FloatArray toArray() {
            FloatArray floatArray = new FloatArray(true, this.map.size);
            while (this.hasNext) {
                floatArray.add(next());
            }
            return floatArray;
        }
    }

    public static class Keys<K> extends MapIterator<K> implements Iterable<K>, Iterator<K> {
        @Override // java.lang.Iterable
        public Keys<K> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.ObjectFloatMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Keys(ObjectFloatMap<K> objectFloatMap) {
            super(objectFloatMap);
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

        @Override // com.badlogic.gdx.utils.ObjectFloatMap.MapIterator
        public void remove() {
            super.remove();
        }
    }
}
