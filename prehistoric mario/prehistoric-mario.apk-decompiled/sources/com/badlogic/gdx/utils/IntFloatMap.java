package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class IntFloatMap implements Iterable<Entry> {
    private static final int EMPTY = 0;
    private static final int PRIME1 = -1105259343;
    private static final int PRIME2 = -1262997959;
    private static final int PRIME3 = -825114047;
    int capacity;
    private Entries entries1;
    private Entries entries2;
    boolean hasZeroValue;
    private int hashShift;
    int[] keyTable;
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
    float zeroValue;

    public IntFloatMap() {
        this(51, 0.8f);
    }

    public IntFloatMap(int i) {
        this(i, 0.8f);
    }

    public IntFloatMap(int i, float f) {
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
                    this.keyTable = new int[(this.capacity + this.stashCapacity)];
                    this.valueTable = new float[this.keyTable.length];
                    return;
                }
                throw new IllegalArgumentException("loadFactor must be > 0: " + f);
            }
            throw new IllegalArgumentException("initialCapacity is too large: " + nextPowerOfTwo);
        }
        throw new IllegalArgumentException("initialCapacity must be >= 0: " + i);
    }

    public IntFloatMap(IntFloatMap intFloatMap) {
        this((int) Math.floor((double) (((float) intFloatMap.capacity) * intFloatMap.loadFactor)), intFloatMap.loadFactor);
        this.stashSize = intFloatMap.stashSize;
        int[] iArr = intFloatMap.keyTable;
        System.arraycopy(iArr, 0, this.keyTable, 0, iArr.length);
        float[] fArr = intFloatMap.valueTable;
        System.arraycopy(fArr, 0, this.valueTable, 0, fArr.length);
        this.size = intFloatMap.size;
        this.zeroValue = intFloatMap.zeroValue;
        this.hasZeroValue = intFloatMap.hasZeroValue;
    }

    public void put(int i, float f) {
        if (i == 0) {
            this.zeroValue = f;
            if (!this.hasZeroValue) {
                this.hasZeroValue = true;
                this.size++;
                return;
            }
            return;
        }
        int[] iArr = this.keyTable;
        int i2 = i & this.mask;
        int i3 = iArr[i2];
        if (i == i3) {
            this.valueTable[i2] = f;
            return;
        }
        int hash2 = hash2(i);
        int i4 = iArr[hash2];
        if (i == i4) {
            this.valueTable[hash2] = f;
            return;
        }
        int hash3 = hash3(i);
        int i5 = iArr[hash3];
        if (i == i5) {
            this.valueTable[hash3] = f;
            return;
        }
        int i6 = this.capacity;
        int i7 = this.stashSize + i6;
        while (i6 < i7) {
            if (i == iArr[i6]) {
                this.valueTable[i6] = f;
                return;
            }
            i6++;
        }
        if (i3 == 0) {
            iArr[i2] = i;
            this.valueTable[i2] = f;
            int i8 = this.size;
            this.size = i8 + 1;
            if (i8 >= this.threshold) {
                resize(this.capacity << 1);
            }
        } else if (i4 == 0) {
            iArr[hash2] = i;
            this.valueTable[hash2] = f;
            int i9 = this.size;
            this.size = i9 + 1;
            if (i9 >= this.threshold) {
                resize(this.capacity << 1);
            }
        } else if (i5 == 0) {
            iArr[hash3] = i;
            this.valueTable[hash3] = f;
            int i10 = this.size;
            this.size = i10 + 1;
            if (i10 >= this.threshold) {
                resize(this.capacity << 1);
            }
        } else {
            push(i, f, i2, i3, hash2, i4, hash3, i5);
        }
    }

    public void putAll(IntFloatMap intFloatMap) {
        Iterator<Entry> it = intFloatMap.entries().iterator();
        while (it.hasNext()) {
            Entry next = it.next();
            put(next.key, next.value);
        }
    }

    private void putResize(int i, float f) {
        if (i == 0) {
            this.zeroValue = f;
            this.hasZeroValue = true;
            return;
        }
        int i2 = i & this.mask;
        int[] iArr = this.keyTable;
        int i3 = iArr[i2];
        if (i3 == 0) {
            iArr[i2] = i;
            this.valueTable[i2] = f;
            int i4 = this.size;
            this.size = i4 + 1;
            if (i4 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash2 = hash2(i);
        int[] iArr2 = this.keyTable;
        int i5 = iArr2[hash2];
        if (i5 == 0) {
            iArr2[hash2] = i;
            this.valueTable[hash2] = f;
            int i6 = this.size;
            this.size = i6 + 1;
            if (i6 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash3 = hash3(i);
        int[] iArr3 = this.keyTable;
        int i7 = iArr3[hash3];
        if (i7 == 0) {
            iArr3[hash3] = i;
            this.valueTable[hash3] = f;
            int i8 = this.size;
            this.size = i8 + 1;
            if (i8 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        push(i, f, i2, i3, hash2, i5, hash3, i7);
    }

    private void push(int i, float f, int i2, int i3, int i4, int i5, int i6, int i7) {
        int[] iArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i8 = this.mask;
        int i9 = this.pushIterations;
        int i10 = 0;
        do {
            int random = MathUtils.random(2);
            if (random == 0) {
                float f2 = fArr[i2];
                iArr[i2] = i;
                fArr[i2] = f;
                i = i3;
                f = f2;
            } else if (random != 1) {
                float f3 = fArr[i6];
                iArr[i6] = i;
                fArr[i6] = f;
                f = f3;
                i = i7;
            } else {
                float f4 = fArr[i4];
                iArr[i4] = i;
                fArr[i4] = f;
                f = f4;
                i = i5;
            }
            i2 = i & i8;
            i3 = iArr[i2];
            if (i3 == 0) {
                iArr[i2] = i;
                fArr[i2] = f;
                int i11 = this.size;
                this.size = i11 + 1;
                if (i11 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i4 = hash2(i);
            i5 = iArr[i4];
            if (i5 == 0) {
                iArr[i4] = i;
                fArr[i4] = f;
                int i12 = this.size;
                this.size = i12 + 1;
                if (i12 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i6 = hash3(i);
            i7 = iArr[i6];
            if (i7 == 0) {
                iArr[i6] = i;
                fArr[i6] = f;
                int i13 = this.size;
                this.size = i13 + 1;
                if (i13 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i10++;
        } while (i10 != i9);
        putStash(i, f);
    }

    private void putStash(int i, float f) {
        int i2 = this.stashSize;
        if (i2 == this.stashCapacity) {
            resize(this.capacity << 1);
            putResize(i, f);
            return;
        }
        int i3 = this.capacity + i2;
        this.keyTable[i3] = i;
        this.valueTable[i3] = f;
        this.stashSize = i2 + 1;
        this.size++;
    }

    public float get(int i, float f) {
        if (i != 0) {
            int i2 = this.mask & i;
            if (this.keyTable[i2] != i) {
                i2 = hash2(i);
                if (this.keyTable[i2] != i) {
                    i2 = hash3(i);
                    if (this.keyTable[i2] != i) {
                        return getStash(i, f);
                    }
                }
            }
            return this.valueTable[i2];
        } else if (!this.hasZeroValue) {
            return f;
        } else {
            return this.zeroValue;
        }
    }

    private float getStash(int i, float f) {
        int[] iArr = this.keyTable;
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (i == iArr[i2]) {
                return this.valueTable[i2];
            }
            i2++;
        }
        return f;
    }

    public float getAndIncrement(int i, float f, float f2) {
        if (i != 0) {
            int i2 = this.mask & i;
            if (i != this.keyTable[i2]) {
                i2 = hash2(i);
                if (i != this.keyTable[i2]) {
                    i2 = hash3(i);
                    if (i != this.keyTable[i2]) {
                        return getAndIncrementStash(i, f, f2);
                    }
                }
            }
            float[] fArr = this.valueTable;
            float f3 = fArr[i2];
            fArr[i2] = f2 + f3;
            return f3;
        } else if (this.hasZeroValue) {
            float f4 = this.zeroValue;
            this.zeroValue = f2 + f4;
            return f4;
        } else {
            this.hasZeroValue = true;
            this.zeroValue = f2 + f;
            this.size++;
            return f;
        }
    }

    private float getAndIncrementStash(int i, float f, float f2) {
        int[] iArr = this.keyTable;
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (i == iArr[i2]) {
                float[] fArr = this.valueTable;
                float f3 = fArr[i2];
                fArr[i2] = f2 + f3;
                return f3;
            }
            i2++;
        }
        put(i, f2 + f);
        return f;
    }

    public float remove(int i, float f) {
        if (i != 0) {
            int i2 = this.mask & i;
            int[] iArr = this.keyTable;
            if (i == iArr[i2]) {
                iArr[i2] = 0;
                this.size--;
                return this.valueTable[i2];
            }
            int hash2 = hash2(i);
            int[] iArr2 = this.keyTable;
            if (i == iArr2[hash2]) {
                iArr2[hash2] = 0;
                this.size--;
                return this.valueTable[hash2];
            }
            int hash3 = hash3(i);
            int[] iArr3 = this.keyTable;
            if (i != iArr3[hash3]) {
                return removeStash(i, f);
            }
            iArr3[hash3] = 0;
            this.size--;
            return this.valueTable[hash3];
        } else if (!this.hasZeroValue) {
            return f;
        } else {
            this.hasZeroValue = false;
            this.size--;
            return this.zeroValue;
        }
    }

    /* access modifiers changed from: package-private */
    public float removeStash(int i, float f) {
        int[] iArr = this.keyTable;
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (i == iArr[i2]) {
                float f2 = this.valueTable[i2];
                removeStashIndex(i2);
                this.size--;
                return f2;
            }
            i2++;
        }
        return f;
    }

    /* access modifiers changed from: package-private */
    public void removeStashIndex(int i) {
        this.stashSize--;
        int i2 = this.capacity + this.stashSize;
        if (i < i2) {
            int[] iArr = this.keyTable;
            iArr[i] = iArr[i2];
            float[] fArr = this.valueTable;
            fArr[i] = fArr[i2];
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
        this.hasZeroValue = false;
        this.size = 0;
        resize(i);
    }

    public void clear() {
        if (this.size != 0) {
            int[] iArr = this.keyTable;
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i > 0) {
                    iArr[i2] = 0;
                    i = i2;
                } else {
                    this.hasZeroValue = false;
                    this.size = 0;
                    this.stashSize = 0;
                    return;
                }
            }
        }
    }

    public boolean containsValue(float f) {
        if (this.hasZeroValue && this.zeroValue == f) {
            return true;
        }
        int[] iArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        while (true) {
            int i2 = i - 1;
            if (i <= 0) {
                return false;
            }
            if (iArr[i2] != 0 && fArr[i2] == f) {
                return true;
            }
            i = i2;
        }
    }

    public boolean containsValue(float f, float f2) {
        if (this.hasZeroValue && Math.abs(this.zeroValue - f) <= f2) {
            return true;
        }
        float[] fArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        while (true) {
            int i2 = i - 1;
            if (i <= 0) {
                return false;
            }
            if (Math.abs(fArr[i2] - f) <= f2) {
                return true;
            }
            i = i2;
        }
    }

    public boolean containsKey(int i) {
        if (i == 0) {
            return this.hasZeroValue;
        }
        if (this.keyTable[this.mask & i] == i) {
            return true;
        }
        if (this.keyTable[hash2(i)] == i) {
            return true;
        }
        if (this.keyTable[hash3(i)] != i) {
            return containsKeyStash(i);
        }
        return true;
    }

    private boolean containsKeyStash(int i) {
        int[] iArr = this.keyTable;
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (i == iArr[i2]) {
                return true;
            }
            i2++;
        }
        return false;
    }

    public int findKey(float f, int i) {
        if (this.hasZeroValue && this.zeroValue == f) {
            return 0;
        }
        int[] iArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i2 = this.capacity + this.stashSize;
        while (true) {
            int i3 = i2 - 1;
            if (i2 <= 0) {
                return i;
            }
            if (iArr[i3] != 0 && fArr[i3] == f) {
                return iArr[i3];
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
        int[] iArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i3 = this.stashCapacity;
        this.keyTable = new int[(i + i3)];
        this.valueTable = new float[(i + i3)];
        int i4 = this.size;
        this.size = this.hasZeroValue ? 1 : 0;
        this.stashSize = 0;
        if (i4 > 0) {
            for (int i5 = 0; i5 < i2; i5++) {
                int i6 = iArr[i5];
                if (i6 != 0) {
                    putResize(i6, fArr[i5]);
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
        int floatToIntBits = this.hasZeroValue ? Float.floatToIntBits(this.zeroValue) + 0 : 0;
        int[] iArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = iArr[i2];
            if (i3 != 0) {
                floatToIntBits = floatToIntBits + (i3 * 31) + Float.floatToIntBits(fArr[i2]);
            }
        }
        return floatToIntBits;
    }

    public boolean equals(Object obj) {
        boolean z;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof IntFloatMap)) {
            return false;
        }
        IntFloatMap intFloatMap = (IntFloatMap) obj;
        if (!(intFloatMap.size == this.size && intFloatMap.hasZeroValue == (z = this.hasZeroValue))) {
            return false;
        }
        if (z && intFloatMap.zeroValue != this.zeroValue) {
            return false;
        }
        int[] iArr = this.keyTable;
        float[] fArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = iArr[i2];
            if (i3 != 0) {
                float f = intFloatMap.get(i3, 0.0f);
                if ((f == 0.0f && !intFloatMap.containsKey(i3)) || f != fArr[i2]) {
                    return false;
                }
            }
        }
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0043  */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0059  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.lang.String toString() {
        /*
            r7 = this;
            int r0 = r7.size
            if (r0 != 0) goto L_0x0007
            java.lang.String r0 = "{}"
            return r0
        L_0x0007:
            com.badlogic.gdx.utils.StringBuilder r0 = new com.badlogic.gdx.utils.StringBuilder
            r1 = 32
            r0.<init>(r1)
            r1 = 123(0x7b, float:1.72E-43)
            r0.append(r1)
            int[] r1 = r7.keyTable
            float[] r2 = r7.valueTable
            int r3 = r1.length
            boolean r4 = r7.hasZeroValue
            r5 = 61
            if (r4 == 0) goto L_0x0029
            java.lang.String r4 = "0="
            r0.append(r4)
            float r4 = r7.zeroValue
            r0.append(r4)
            goto L_0x003f
        L_0x0029:
            int r4 = r3 + -1
            if (r3 <= 0) goto L_0x003e
            r3 = r1[r4]
            if (r3 != 0) goto L_0x0033
            r3 = r4
            goto L_0x0029
        L_0x0033:
            r0.append(r3)
            r0.append(r5)
            r3 = r2[r4]
            r0.append(r3)
        L_0x003e:
            r3 = r4
        L_0x003f:
            int r4 = r3 + -1
            if (r3 <= 0) goto L_0x0059
            r3 = r1[r4]
            if (r3 != 0) goto L_0x0048
            goto L_0x003e
        L_0x0048:
            java.lang.String r6 = ", "
            r0.append(r6)
            r0.append(r3)
            r0.append(r5)
            r3 = r2[r4]
            r0.append(r3)
            goto L_0x003e
        L_0x0059:
            r1 = 125(0x7d, float:1.75E-43)
            r0.append(r1)
            java.lang.String r0 = r0.toString()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.IntFloatMap.toString():java.lang.String");
    }

    @Override // java.lang.Iterable
    public Iterator<Entry> iterator() {
        return entries();
    }

    public Entries entries() {
        if (Collections.allocateIterators) {
            return new Entries(this);
        }
        if (this.entries1 == null) {
            this.entries1 = new Entries(this);
            this.entries2 = new Entries(this);
        }
        if (!this.entries1.valid) {
            this.entries1.reset();
            Entries entries = this.entries1;
            entries.valid = true;
            this.entries2.valid = false;
            return entries;
        }
        this.entries2.reset();
        Entries entries3 = this.entries2;
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

    public Keys keys() {
        if (Collections.allocateIterators) {
            return new Keys(this);
        }
        if (this.keys1 == null) {
            this.keys1 = new Keys(this);
            this.keys2 = new Keys(this);
        }
        if (!this.keys1.valid) {
            this.keys1.reset();
            Keys keys = this.keys1;
            keys.valid = true;
            this.keys2.valid = false;
            return keys;
        }
        this.keys2.reset();
        Keys keys3 = this.keys2;
        keys3.valid = true;
        this.keys1.valid = false;
        return keys3;
    }

    public static class Entry {
        public int key;
        public float value;

        public String toString() {
            return this.key + "=" + this.value;
        }
    }

    /* access modifiers changed from: private */
    public static class MapIterator {
        static final int INDEX_ILLEGAL = -2;
        static final int INDEX_ZERO = -1;
        int currentIndex;
        public boolean hasNext;
        final IntFloatMap map;
        int nextIndex;
        boolean valid = true;

        public MapIterator(IntFloatMap intFloatMap) {
            this.map = intFloatMap;
            reset();
        }

        public void reset() {
            this.currentIndex = INDEX_ILLEGAL;
            this.nextIndex = -1;
            if (this.map.hasZeroValue) {
                this.hasNext = true;
            } else {
                findNextIndex();
            }
        }

        /* access modifiers changed from: package-private */
        public void findNextIndex() {
            this.hasNext = false;
            int[] iArr = this.map.keyTable;
            int i = this.map.capacity + this.map.stashSize;
            do {
                int i2 = this.nextIndex + 1;
                this.nextIndex = i2;
                if (i2 >= i) {
                    return;
                }
            } while (iArr[this.nextIndex] == 0);
            this.hasNext = true;
        }

        public void remove() {
            if (this.currentIndex != -1 || !this.map.hasZeroValue) {
                int i = this.currentIndex;
                if (i < 0) {
                    throw new IllegalStateException("next must be called before remove.");
                } else if (i >= this.map.capacity) {
                    this.map.removeStashIndex(this.currentIndex);
                    this.nextIndex = this.currentIndex - 1;
                    findNextIndex();
                } else {
                    this.map.keyTable[this.currentIndex] = 0;
                }
            } else {
                this.map.hasZeroValue = false;
            }
            this.currentIndex = INDEX_ILLEGAL;
            IntFloatMap intFloatMap = this.map;
            intFloatMap.size--;
        }
    }

    public static class Entries extends MapIterator implements Iterable<Entry>, Iterator<Entry> {
        private Entry entry = new Entry();

        @Override // java.lang.Iterable
        public Iterator<Entry> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.IntFloatMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Entries(IntFloatMap intFloatMap) {
            super(intFloatMap);
        }

        @Override // java.util.Iterator
        public Entry next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                int[] iArr = this.map.keyTable;
                if (this.nextIndex == -1) {
                    Entry entry2 = this.entry;
                    entry2.key = 0;
                    entry2.value = this.map.zeroValue;
                } else {
                    this.entry.key = iArr[this.nextIndex];
                    this.entry.value = this.map.valueTable[this.nextIndex];
                }
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

        @Override // com.badlogic.gdx.utils.IntFloatMap.MapIterator
        public void remove() {
            super.remove();
        }
    }

    public static class Values extends MapIterator {
        @Override // com.badlogic.gdx.utils.IntFloatMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.IntFloatMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Values(IntFloatMap intFloatMap) {
            super(intFloatMap);
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.hasNext;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        public float next() {
            float f;
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                if (this.nextIndex == -1) {
                    f = this.map.zeroValue;
                } else {
                    f = this.map.valueTable[this.nextIndex];
                }
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

    public static class Keys extends MapIterator {
        @Override // com.badlogic.gdx.utils.IntFloatMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.IntFloatMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Keys(IntFloatMap intFloatMap) {
            super(intFloatMap);
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
                int i = this.nextIndex == -1 ? 0 : this.map.keyTable[this.nextIndex];
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
}
