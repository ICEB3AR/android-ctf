package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class IntIntMap implements Iterable<Entry> {
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
    int[] valueTable;
    private Values values1;
    private Values values2;
    int zeroValue;

    public IntIntMap() {
        this(51, 0.8f);
    }

    public IntIntMap(int i) {
        this(i, 0.8f);
    }

    public IntIntMap(int i, float f) {
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
                    this.valueTable = new int[this.keyTable.length];
                    return;
                }
                throw new IllegalArgumentException("loadFactor must be > 0: " + f);
            }
            throw new IllegalArgumentException("initialCapacity is too large: " + nextPowerOfTwo);
        }
        throw new IllegalArgumentException("initialCapacity must be >= 0: " + i);
    }

    public IntIntMap(IntIntMap intIntMap) {
        this((int) Math.floor((double) (((float) intIntMap.capacity) * intIntMap.loadFactor)), intIntMap.loadFactor);
        this.stashSize = intIntMap.stashSize;
        int[] iArr = intIntMap.keyTable;
        System.arraycopy(iArr, 0, this.keyTable, 0, iArr.length);
        int[] iArr2 = intIntMap.valueTable;
        System.arraycopy(iArr2, 0, this.valueTable, 0, iArr2.length);
        this.size = intIntMap.size;
        this.zeroValue = intIntMap.zeroValue;
        this.hasZeroValue = intIntMap.hasZeroValue;
    }

    public void put(int i, int i2) {
        if (i == 0) {
            this.zeroValue = i2;
            if (!this.hasZeroValue) {
                this.hasZeroValue = true;
                this.size++;
                return;
            }
            return;
        }
        int[] iArr = this.keyTable;
        int i3 = i & this.mask;
        int i4 = iArr[i3];
        if (i == i4) {
            this.valueTable[i3] = i2;
            return;
        }
        int hash2 = hash2(i);
        int i5 = iArr[hash2];
        if (i == i5) {
            this.valueTable[hash2] = i2;
            return;
        }
        int hash3 = hash3(i);
        int i6 = iArr[hash3];
        if (i == i6) {
            this.valueTable[hash3] = i2;
            return;
        }
        int i7 = this.capacity;
        int i8 = this.stashSize + i7;
        while (i7 < i8) {
            if (i == iArr[i7]) {
                this.valueTable[i7] = i2;
                return;
            }
            i7++;
        }
        if (i4 == 0) {
            iArr[i3] = i;
            this.valueTable[i3] = i2;
            int i9 = this.size;
            this.size = i9 + 1;
            if (i9 >= this.threshold) {
                resize(this.capacity << 1);
            }
        } else if (i5 == 0) {
            iArr[hash2] = i;
            this.valueTable[hash2] = i2;
            int i10 = this.size;
            this.size = i10 + 1;
            if (i10 >= this.threshold) {
                resize(this.capacity << 1);
            }
        } else if (i6 == 0) {
            iArr[hash3] = i;
            this.valueTable[hash3] = i2;
            int i11 = this.size;
            this.size = i11 + 1;
            if (i11 >= this.threshold) {
                resize(this.capacity << 1);
            }
        } else {
            push(i, i2, i3, i4, hash2, i5, hash3, i6);
        }
    }

    public void putAll(IntIntMap intIntMap) {
        Iterator<Entry> it = intIntMap.entries().iterator();
        while (it.hasNext()) {
            Entry next = it.next();
            put(next.key, next.value);
        }
    }

    private void putResize(int i, int i2) {
        if (i == 0) {
            this.zeroValue = i2;
            this.hasZeroValue = true;
            return;
        }
        int i3 = i & this.mask;
        int[] iArr = this.keyTable;
        int i4 = iArr[i3];
        if (i4 == 0) {
            iArr[i3] = i;
            this.valueTable[i3] = i2;
            int i5 = this.size;
            this.size = i5 + 1;
            if (i5 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash2 = hash2(i);
        int[] iArr2 = this.keyTable;
        int i6 = iArr2[hash2];
        if (i6 == 0) {
            iArr2[hash2] = i;
            this.valueTable[hash2] = i2;
            int i7 = this.size;
            this.size = i7 + 1;
            if (i7 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash3 = hash3(i);
        int[] iArr3 = this.keyTable;
        int i8 = iArr3[hash3];
        if (i8 == 0) {
            iArr3[hash3] = i;
            this.valueTable[hash3] = i2;
            int i9 = this.size;
            this.size = i9 + 1;
            if (i9 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        push(i, i2, i3, i4, hash2, i6, hash3, i8);
    }

    private void push(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        int[] iArr = this.keyTable;
        int[] iArr2 = this.valueTable;
        int i9 = this.mask;
        int i10 = this.pushIterations;
        int i11 = 0;
        do {
            int random = MathUtils.random(2);
            if (random == 0) {
                int i12 = iArr2[i3];
                iArr[i3] = i;
                iArr2[i3] = i2;
                i = i4;
                i2 = i12;
            } else if (random != 1) {
                int i13 = iArr2[i7];
                iArr[i7] = i;
                iArr2[i7] = i2;
                i2 = i13;
                i = i8;
            } else {
                int i14 = iArr2[i5];
                iArr[i5] = i;
                iArr2[i5] = i2;
                i2 = i14;
                i = i6;
            }
            i3 = i & i9;
            i4 = iArr[i3];
            if (i4 == 0) {
                iArr[i3] = i;
                iArr2[i3] = i2;
                int i15 = this.size;
                this.size = i15 + 1;
                if (i15 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i5 = hash2(i);
            i6 = iArr[i5];
            if (i6 == 0) {
                iArr[i5] = i;
                iArr2[i5] = i2;
                int i16 = this.size;
                this.size = i16 + 1;
                if (i16 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i7 = hash3(i);
            i8 = iArr[i7];
            if (i8 == 0) {
                iArr[i7] = i;
                iArr2[i7] = i2;
                int i17 = this.size;
                this.size = i17 + 1;
                if (i17 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i11++;
        } while (i11 != i10);
        putStash(i, i2);
    }

    private void putStash(int i, int i2) {
        int i3 = this.stashSize;
        if (i3 == this.stashCapacity) {
            resize(this.capacity << 1);
            putResize(i, i2);
            return;
        }
        int i4 = this.capacity + i3;
        this.keyTable[i4] = i;
        this.valueTable[i4] = i2;
        this.stashSize = i3 + 1;
        this.size++;
    }

    public int get(int i, int i2) {
        if (i != 0) {
            int i3 = this.mask & i;
            if (this.keyTable[i3] != i) {
                i3 = hash2(i);
                if (this.keyTable[i3] != i) {
                    i3 = hash3(i);
                    if (this.keyTable[i3] != i) {
                        return getStash(i, i2);
                    }
                }
            }
            return this.valueTable[i3];
        } else if (!this.hasZeroValue) {
            return i2;
        } else {
            return this.zeroValue;
        }
    }

    private int getStash(int i, int i2) {
        int[] iArr = this.keyTable;
        int i3 = this.capacity;
        int i4 = this.stashSize + i3;
        while (i3 < i4) {
            if (i == iArr[i3]) {
                return this.valueTable[i3];
            }
            i3++;
        }
        return i2;
    }

    public int getAndIncrement(int i, int i2, int i3) {
        if (i != 0) {
            int i4 = this.mask & i;
            if (i != this.keyTable[i4]) {
                i4 = hash2(i);
                if (i != this.keyTable[i4]) {
                    i4 = hash3(i);
                    if (i != this.keyTable[i4]) {
                        return getAndIncrementStash(i, i2, i3);
                    }
                }
            }
            int[] iArr = this.valueTable;
            int i5 = iArr[i4];
            iArr[i4] = i3 + i5;
            return i5;
        } else if (this.hasZeroValue) {
            int i6 = this.zeroValue;
            this.zeroValue = i3 + i6;
            return i6;
        } else {
            this.hasZeroValue = true;
            this.zeroValue = i3 + i2;
            this.size++;
            return i2;
        }
    }

    private int getAndIncrementStash(int i, int i2, int i3) {
        int[] iArr = this.keyTable;
        int i4 = this.capacity;
        int i5 = this.stashSize + i4;
        while (i4 < i5) {
            if (i == iArr[i4]) {
                int[] iArr2 = this.valueTable;
                int i6 = iArr2[i4];
                iArr2[i4] = i3 + i6;
                return i6;
            }
            i4++;
        }
        put(i, i3 + i2);
        return i2;
    }

    public int remove(int i, int i2) {
        if (i != 0) {
            int i3 = this.mask & i;
            int[] iArr = this.keyTable;
            if (i == iArr[i3]) {
                iArr[i3] = 0;
                this.size--;
                return this.valueTable[i3];
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
                return removeStash(i, i2);
            }
            iArr3[hash3] = 0;
            this.size--;
            return this.valueTable[hash3];
        } else if (!this.hasZeroValue) {
            return i2;
        } else {
            this.hasZeroValue = false;
            this.size--;
            return this.zeroValue;
        }
    }

    /* access modifiers changed from: package-private */
    public int removeStash(int i, int i2) {
        int[] iArr = this.keyTable;
        int i3 = this.capacity;
        int i4 = this.stashSize + i3;
        while (i3 < i4) {
            if (i == iArr[i3]) {
                int i5 = this.valueTable[i3];
                removeStashIndex(i3);
                this.size--;
                return i5;
            }
            i3++;
        }
        return i2;
    }

    /* access modifiers changed from: package-private */
    public void removeStashIndex(int i) {
        this.stashSize--;
        int i2 = this.capacity + this.stashSize;
        if (i < i2) {
            int[] iArr = this.keyTable;
            iArr[i] = iArr[i2];
            int[] iArr2 = this.valueTable;
            iArr2[i] = iArr2[i2];
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
                    this.size = 0;
                    this.stashSize = 0;
                    this.hasZeroValue = false;
                    return;
                }
            }
        }
    }

    public boolean containsValue(int i) {
        if (this.hasZeroValue && this.zeroValue == i) {
            return true;
        }
        int[] iArr = this.keyTable;
        int[] iArr2 = this.valueTable;
        int i2 = this.capacity + this.stashSize;
        while (true) {
            int i3 = i2 - 1;
            if (i2 <= 0) {
                return false;
            }
            if (iArr[i3] != 0 && iArr2[i3] == i) {
                return true;
            }
            i2 = i3;
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

    public int findKey(int i, int i2) {
        if (this.hasZeroValue && this.zeroValue == i) {
            return 0;
        }
        int[] iArr = this.keyTable;
        int[] iArr2 = this.valueTable;
        int i3 = this.capacity + this.stashSize;
        while (true) {
            int i4 = i3 - 1;
            if (i3 <= 0) {
                return i2;
            }
            if (iArr[i4] != 0 && iArr2[i4] == i) {
                return iArr[i4];
            }
            i3 = i4;
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
        int[] iArr2 = this.valueTable;
        int i3 = this.stashCapacity;
        this.keyTable = new int[(i + i3)];
        this.valueTable = new int[(i + i3)];
        int i4 = this.size;
        this.size = this.hasZeroValue ? 1 : 0;
        this.stashSize = 0;
        if (i4 > 0) {
            for (int i5 = 0; i5 < i2; i5++) {
                int i6 = iArr[i5];
                if (i6 != 0) {
                    putResize(i6, iArr2[i5]);
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
        int floatToIntBits = this.hasZeroValue ? Float.floatToIntBits((float) this.zeroValue) + 0 : 0;
        int[] iArr = this.keyTable;
        int[] iArr2 = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = iArr[i2];
            if (i3 != 0) {
                floatToIntBits = floatToIntBits + (i3 * 31) + iArr2[i2];
            }
        }
        return floatToIntBits;
    }

    public boolean equals(Object obj) {
        boolean z;
        int i;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof IntIntMap)) {
            return false;
        }
        IntIntMap intIntMap = (IntIntMap) obj;
        if (!(intIntMap.size == this.size && intIntMap.hasZeroValue == (z = this.hasZeroValue))) {
            return false;
        }
        if (z && intIntMap.zeroValue != this.zeroValue) {
            return false;
        }
        int[] iArr = this.keyTable;
        int[] iArr2 = this.valueTable;
        int i2 = this.capacity + this.stashSize;
        for (int i3 = 0; i3 < i2; i3++) {
            int i4 = iArr[i3];
            if (i4 != 0 && (((i = intIntMap.get(i4, 0)) == 0 && !intIntMap.containsKey(i4)) || i != iArr2[i3])) {
                return false;
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
            int[] r2 = r7.valueTable
            int r3 = r1.length
            boolean r4 = r7.hasZeroValue
            r5 = 61
            if (r4 == 0) goto L_0x0029
            java.lang.String r4 = "0="
            r0.append(r4)
            int r4 = r7.zeroValue
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
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.IntIntMap.toString():java.lang.String");
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
        public int value;

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
        final IntIntMap map;
        int nextIndex;
        boolean valid = true;

        public MapIterator(IntIntMap intIntMap) {
            this.map = intIntMap;
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
            IntIntMap intIntMap = this.map;
            intIntMap.size--;
        }
    }

    public static class Entries extends MapIterator implements Iterable<Entry>, Iterator<Entry> {
        private Entry entry = new Entry();

        @Override // java.lang.Iterable
        public Iterator<Entry> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.IntIntMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Entries(IntIntMap intIntMap) {
            super(intIntMap);
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

        @Override // com.badlogic.gdx.utils.IntIntMap.MapIterator
        public void remove() {
            super.remove();
        }
    }

    public static class Values extends MapIterator {
        @Override // com.badlogic.gdx.utils.IntIntMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.IntIntMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Values(IntIntMap intIntMap) {
            super(intIntMap);
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.hasNext;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        public int next() {
            int i;
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                if (this.nextIndex == -1) {
                    i = this.map.zeroValue;
                } else {
                    i = this.map.valueTable[this.nextIndex];
                }
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

    public static class Keys extends MapIterator {
        @Override // com.badlogic.gdx.utils.IntIntMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.IntIntMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Keys(IntIntMap intIntMap) {
            super(intIntMap);
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
