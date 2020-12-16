package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.NoSuchElementException;

public class IntSet {
    private static final int EMPTY = 0;
    private static final int PRIME1 = -1105259343;
    private static final int PRIME2 = -1262997959;
    private static final int PRIME3 = -825114047;
    int capacity;
    boolean hasZeroValue;
    private int hashShift;
    private IntSetIterator iterator1;
    private IntSetIterator iterator2;
    int[] keyTable;
    private float loadFactor;
    private int mask;
    private int pushIterations;
    public int size;
    private int stashCapacity;
    int stashSize;
    private int threshold;

    public IntSet() {
        this(51, 0.8f);
    }

    public IntSet(int i) {
        this(i, 0.8f);
    }

    public IntSet(int i, float f) {
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
                    return;
                }
                throw new IllegalArgumentException("loadFactor must be > 0: " + f);
            }
            throw new IllegalArgumentException("initialCapacity is too large: " + nextPowerOfTwo);
        }
        throw new IllegalArgumentException("initialCapacity must be >= 0: " + i);
    }

    public IntSet(IntSet intSet) {
        this((int) Math.floor((double) (((float) intSet.capacity) * intSet.loadFactor)), intSet.loadFactor);
        this.stashSize = intSet.stashSize;
        int[] iArr = intSet.keyTable;
        System.arraycopy(iArr, 0, this.keyTable, 0, iArr.length);
        this.size = intSet.size;
        this.hasZeroValue = intSet.hasZeroValue;
    }

    public boolean add(int i) {
        int hash2;
        int i2;
        int hash3;
        int i3;
        if (i != 0) {
            int[] iArr = this.keyTable;
            int i4 = i & this.mask;
            int i5 = iArr[i4];
            if (i5 == i || (i2 = iArr[(hash2 = hash2(i))]) == i || (i3 = iArr[(hash3 = hash3(i))]) == i) {
                return false;
            }
            int i6 = this.capacity;
            int i7 = this.stashSize + i6;
            while (i6 < i7) {
                if (iArr[i6] == i) {
                    return false;
                }
                i6++;
            }
            if (i5 == 0) {
                iArr[i4] = i;
                int i8 = this.size;
                this.size = i8 + 1;
                if (i8 >= this.threshold) {
                    resize(this.capacity << 1);
                }
                return true;
            } else if (i2 == 0) {
                iArr[hash2] = i;
                int i9 = this.size;
                this.size = i9 + 1;
                if (i9 >= this.threshold) {
                    resize(this.capacity << 1);
                }
                return true;
            } else if (i3 == 0) {
                iArr[hash3] = i;
                int i10 = this.size;
                this.size = i10 + 1;
                if (i10 >= this.threshold) {
                    resize(this.capacity << 1);
                }
                return true;
            } else {
                push(i, i4, i5, hash2, i2, hash3, i3);
                return true;
            }
        } else if (this.hasZeroValue) {
            return false;
        } else {
            this.hasZeroValue = true;
            this.size++;
            return true;
        }
    }

    public void addAll(IntArray intArray) {
        addAll(intArray.items, 0, intArray.size);
    }

    public void addAll(IntArray intArray, int i, int i2) {
        if (i + i2 <= intArray.size) {
            addAll(intArray.items, i, i2);
            return;
        }
        throw new IllegalArgumentException("offset + length must be <= size: " + i + " + " + i2 + " <= " + intArray.size);
    }

    public void addAll(int... iArr) {
        addAll(iArr, 0, iArr.length);
    }

    public void addAll(int[] iArr, int i, int i2) {
        ensureCapacity(i2);
        int i3 = i2 + i;
        while (i < i3) {
            add(iArr[i]);
            i++;
        }
    }

    public void addAll(IntSet intSet) {
        ensureCapacity(intSet.size);
        IntSetIterator it = intSet.iterator();
        while (it.hasNext) {
            add(it.next());
        }
    }

    private void addResize(int i) {
        if (i == 0) {
            this.hasZeroValue = true;
            return;
        }
        int i2 = i & this.mask;
        int[] iArr = this.keyTable;
        int i3 = iArr[i2];
        if (i3 == 0) {
            iArr[i2] = i;
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
            int i8 = this.size;
            this.size = i8 + 1;
            if (i8 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        push(i, i2, i3, hash2, i5, hash3, i7);
    }

    private void push(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        int[] iArr = this.keyTable;
        int i8 = this.mask;
        int i9 = this.pushIterations;
        int i10 = 0;
        do {
            int random = MathUtils.random(2);
            if (random == 0) {
                iArr[i2] = i;
                i = i3;
            } else if (random != 1) {
                iArr[i6] = i;
                i = i7;
            } else {
                iArr[i4] = i;
                i = i5;
            }
            i2 = i & i8;
            i3 = iArr[i2];
            if (i3 == 0) {
                iArr[i2] = i;
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
        addStash(i);
    }

    private void addStash(int i) {
        int i2 = this.stashSize;
        if (i2 == this.stashCapacity) {
            resize(this.capacity << 1);
            addResize(i);
            return;
        }
        this.keyTable[this.capacity + i2] = i;
        this.stashSize = i2 + 1;
        this.size++;
    }

    public boolean remove(int i) {
        if (i != 0) {
            int i2 = this.mask & i;
            int[] iArr = this.keyTable;
            if (iArr[i2] == i) {
                iArr[i2] = 0;
                this.size--;
                return true;
            }
            int hash2 = hash2(i);
            int[] iArr2 = this.keyTable;
            if (iArr2[hash2] == i) {
                iArr2[hash2] = 0;
                this.size--;
                return true;
            }
            int hash3 = hash3(i);
            int[] iArr3 = this.keyTable;
            if (iArr3[hash3] != i) {
                return removeStash(i);
            }
            iArr3[hash3] = 0;
            this.size--;
            return true;
        } else if (!this.hasZeroValue) {
            return false;
        } else {
            this.hasZeroValue = false;
            this.size--;
            return true;
        }
    }

    /* access modifiers changed from: package-private */
    public boolean removeStash(int i) {
        int[] iArr = this.keyTable;
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (iArr[i2] == i) {
                removeStashIndex(i2);
                this.size--;
                return true;
            }
            i2++;
        }
        return false;
    }

    /* access modifiers changed from: package-private */
    public void removeStashIndex(int i) {
        this.stashSize--;
        int i2 = this.capacity + this.stashSize;
        if (i < i2) {
            int[] iArr = this.keyTable;
            iArr[i] = iArr[i2];
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

    public boolean contains(int i) {
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
            if (iArr[i2] == i) {
                return true;
            }
            i2++;
        }
        return false;
    }

    public int first() {
        if (this.hasZeroValue) {
            return 0;
        }
        int[] iArr = this.keyTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            if (iArr[i2] != 0) {
                return iArr[i2];
            }
        }
        throw new IllegalStateException("IntSet is empty.");
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
        this.keyTable = new int[(i + this.stashCapacity)];
        int i3 = this.size;
        this.size = this.hasZeroValue ? 1 : 0;
        this.stashSize = 0;
        if (i3 > 0) {
            for (int i4 = 0; i4 < i2; i4++) {
                int i5 = iArr[i4];
                if (i5 != 0) {
                    addResize(i5);
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
        int i = this.capacity + this.stashSize;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            int[] iArr = this.keyTable;
            if (iArr[i3] != 0) {
                i2 += iArr[i3];
            }
        }
        return i2;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof IntSet)) {
            return false;
        }
        IntSet intSet = (IntSet) obj;
        if (!(intSet.size == this.size && intSet.hasZeroValue == this.hasZeroValue)) {
            return false;
        }
        int[] iArr = this.keyTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            if (!(iArr[i2] == 0 || intSet.contains(iArr[i2]))) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0032  */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0040  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.lang.String toString() {
        /*
            r5 = this;
            int r0 = r5.size
            if (r0 != 0) goto L_0x0007
            java.lang.String r0 = "[]"
            return r0
        L_0x0007:
            com.badlogic.gdx.utils.StringBuilder r0 = new com.badlogic.gdx.utils.StringBuilder
            r1 = 32
            r0.<init>(r1)
            r1 = 91
            r0.append(r1)
            int[] r1 = r5.keyTable
            int r2 = r1.length
            boolean r3 = r5.hasZeroValue
            if (r3 == 0) goto L_0x0020
            java.lang.String r3 = "0"
            r0.append(r3)
            goto L_0x002e
        L_0x0020:
            int r3 = r2 + -1
            if (r2 <= 0) goto L_0x002d
            r2 = r1[r3]
            if (r2 != 0) goto L_0x002a
            r2 = r3
            goto L_0x0020
        L_0x002a:
            r0.append(r2)
        L_0x002d:
            r2 = r3
        L_0x002e:
            int r3 = r2 + -1
            if (r2 <= 0) goto L_0x0040
            r2 = r1[r3]
            if (r2 != 0) goto L_0x0037
            goto L_0x002d
        L_0x0037:
            java.lang.String r4 = ", "
            r0.append(r4)
            r0.append(r2)
            goto L_0x002d
        L_0x0040:
            r1 = 93
            r0.append(r1)
            java.lang.String r0 = r0.toString()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.IntSet.toString():java.lang.String");
    }

    public IntSetIterator iterator() {
        if (Collections.allocateIterators) {
            return new IntSetIterator(this);
        }
        if (this.iterator1 == null) {
            this.iterator1 = new IntSetIterator(this);
            this.iterator2 = new IntSetIterator(this);
        }
        if (!this.iterator1.valid) {
            this.iterator1.reset();
            IntSetIterator intSetIterator = this.iterator1;
            intSetIterator.valid = true;
            this.iterator2.valid = false;
            return intSetIterator;
        }
        this.iterator2.reset();
        IntSetIterator intSetIterator2 = this.iterator2;
        intSetIterator2.valid = true;
        this.iterator1.valid = false;
        return intSetIterator2;
    }

    public static IntSet with(int... iArr) {
        IntSet intSet = new IntSet();
        intSet.addAll(iArr);
        return intSet;
    }

    public static class IntSetIterator {
        static final int INDEX_ILLEGAL = -2;
        static final int INDEX_ZERO = -1;
        int currentIndex;
        public boolean hasNext;
        int nextIndex;
        final IntSet set;
        boolean valid = true;

        public IntSetIterator(IntSet intSet) {
            this.set = intSet;
            reset();
        }

        public void reset() {
            this.currentIndex = INDEX_ILLEGAL;
            this.nextIndex = -1;
            if (this.set.hasZeroValue) {
                this.hasNext = true;
            } else {
                findNextIndex();
            }
        }

        /* access modifiers changed from: package-private */
        public void findNextIndex() {
            this.hasNext = false;
            int[] iArr = this.set.keyTable;
            int i = this.set.capacity + this.set.stashSize;
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
            if (this.currentIndex != -1 || !this.set.hasZeroValue) {
                int i = this.currentIndex;
                if (i < 0) {
                    throw new IllegalStateException("next must be called before remove.");
                } else if (i >= this.set.capacity) {
                    this.set.removeStashIndex(this.currentIndex);
                    this.nextIndex = this.currentIndex - 1;
                    findNextIndex();
                } else {
                    this.set.keyTable[this.currentIndex] = 0;
                }
            } else {
                this.set.hasZeroValue = false;
            }
            this.currentIndex = INDEX_ILLEGAL;
            IntSet intSet = this.set;
            intSet.size--;
        }

        public int next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                int i = this.nextIndex == -1 ? 0 : this.set.keyTable[this.nextIndex];
                this.currentIndex = this.nextIndex;
                findNextIndex();
                return i;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public IntArray toArray() {
            IntArray intArray = new IntArray(true, this.set.size);
            while (this.hasNext) {
                intArray.add(next());
            }
            return intArray;
        }
    }
}
