package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class IntMap<V> implements Iterable<Entry<V>> {
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
    V[] valueTable;
    private Values values1;
    private Values values2;
    V zeroValue;

    public IntMap() {
        this(51, 0.8f);
    }

    public IntMap(int i) {
        this(i, 0.8f);
    }

    public IntMap(int i, float f) {
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
                    this.valueTable = (V[]) new Object[this.keyTable.length];
                    return;
                }
                throw new IllegalArgumentException("loadFactor must be > 0: " + f);
            }
            throw new IllegalArgumentException("initialCapacity is too large: " + nextPowerOfTwo);
        }
        throw new IllegalArgumentException("initialCapacity must be >= 0: " + i);
    }

    public IntMap(IntMap<? extends V> intMap) {
        this((int) Math.floor((double) (((float) intMap.capacity) * intMap.loadFactor)), intMap.loadFactor);
        this.stashSize = intMap.stashSize;
        int[] iArr = intMap.keyTable;
        System.arraycopy(iArr, 0, this.keyTable, 0, iArr.length);
        V[] vArr = intMap.valueTable;
        System.arraycopy(vArr, 0, this.valueTable, 0, vArr.length);
        this.size = intMap.size;
        this.zeroValue = intMap.zeroValue;
        this.hasZeroValue = intMap.hasZeroValue;
    }

    public V put(int i, V v) {
        if (i == 0) {
            V v2 = this.zeroValue;
            this.zeroValue = v;
            if (!this.hasZeroValue) {
                this.hasZeroValue = true;
                this.size++;
            }
            return v2;
        }
        int[] iArr = this.keyTable;
        int i2 = i & this.mask;
        int i3 = iArr[i2];
        if (i3 == i) {
            V[] vArr = this.valueTable;
            V v3 = vArr[i2];
            vArr[i2] = v;
            return v3;
        }
        int hash2 = hash2(i);
        int i4 = iArr[hash2];
        if (i4 == i) {
            V[] vArr2 = this.valueTable;
            V v4 = vArr2[hash2];
            vArr2[hash2] = v;
            return v4;
        }
        int hash3 = hash3(i);
        int i5 = iArr[hash3];
        if (i5 == i) {
            V[] vArr3 = this.valueTable;
            V v5 = vArr3[hash3];
            vArr3[hash3] = v;
            return v5;
        }
        int i6 = this.capacity;
        int i7 = this.stashSize + i6;
        while (i6 < i7) {
            if (iArr[i6] == i) {
                V[] vArr4 = this.valueTable;
                V v6 = vArr4[i6];
                vArr4[i6] = v;
                return v6;
            }
            i6++;
        }
        if (i3 == 0) {
            iArr[i2] = i;
            this.valueTable[i2] = v;
            int i8 = this.size;
            this.size = i8 + 1;
            if (i8 >= this.threshold) {
                resize(this.capacity << 1);
            }
            return null;
        } else if (i4 == 0) {
            iArr[hash2] = i;
            this.valueTable[hash2] = v;
            int i9 = this.size;
            this.size = i9 + 1;
            if (i9 >= this.threshold) {
                resize(this.capacity << 1);
            }
            return null;
        } else if (i5 == 0) {
            iArr[hash3] = i;
            this.valueTable[hash3] = v;
            int i10 = this.size;
            this.size = i10 + 1;
            if (i10 >= this.threshold) {
                resize(this.capacity << 1);
            }
            return null;
        } else {
            push(i, v, i2, i3, hash2, i4, hash3, i5);
            return null;
        }
    }

    public void putAll(IntMap<? extends V> intMap) {
        Iterator<Entry<? extends V>> it = intMap.entries().iterator();
        while (it.hasNext()) {
            Entry<? extends V> next = it.next();
            put(next.key, next.value);
        }
    }

    private void putResize(int i, V v) {
        if (i == 0) {
            this.zeroValue = v;
            this.hasZeroValue = true;
            return;
        }
        int i2 = i & this.mask;
        int[] iArr = this.keyTable;
        int i3 = iArr[i2];
        if (i3 == 0) {
            iArr[i2] = i;
            this.valueTable[i2] = v;
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
            this.valueTable[hash2] = v;
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
            this.valueTable[hash3] = v;
            int i8 = this.size;
            this.size = i8 + 1;
            if (i8 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        push(i, v, i2, i3, hash2, i5, hash3, i7);
    }

    private void push(int i, V v, int i2, int i3, int i4, int i5, int i6, int i7) {
        int[] iArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i8 = this.mask;
        int i9 = this.pushIterations;
        int i10 = 0;
        do {
            int random = MathUtils.random(2);
            if (random == 0) {
                V v2 = vArr[i2];
                iArr[i2] = i;
                vArr[i2] = v;
                i = i3;
                v = v2;
            } else if (random != 1) {
                V v3 = vArr[i6];
                iArr[i6] = i;
                vArr[i6] = v;
                v = v3;
                i = i7;
            } else {
                V v4 = vArr[i4];
                iArr[i4] = i;
                vArr[i4] = v;
                v = v4;
                i = i5;
            }
            i2 = i & i8;
            i3 = iArr[i2];
            if (i3 == 0) {
                iArr[i2] = i;
                vArr[i2] = v;
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
                vArr[i4] = v;
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
                vArr[i6] = v;
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
        putStash(i, v);
    }

    private void putStash(int i, V v) {
        int i2 = this.stashSize;
        if (i2 == this.stashCapacity) {
            resize(this.capacity << 1);
            putResize(i, v);
            return;
        }
        int i3 = this.capacity + i2;
        this.keyTable[i3] = i;
        this.valueTable[i3] = v;
        this.stashSize = i2 + 1;
        this.size++;
    }

    public V get(int i) {
        if (i != 0) {
            int i2 = this.mask & i;
            if (this.keyTable[i2] != i) {
                i2 = hash2(i);
                if (this.keyTable[i2] != i) {
                    i2 = hash3(i);
                    if (this.keyTable[i2] != i) {
                        return getStash(i, null);
                    }
                }
            }
            return this.valueTable[i2];
        } else if (!this.hasZeroValue) {
            return null;
        } else {
            return this.zeroValue;
        }
    }

    public V get(int i, V v) {
        if (i != 0) {
            int i2 = this.mask & i;
            if (this.keyTable[i2] != i) {
                i2 = hash2(i);
                if (this.keyTable[i2] != i) {
                    i2 = hash3(i);
                    if (this.keyTable[i2] != i) {
                        return getStash(i, v);
                    }
                }
            }
            return this.valueTable[i2];
        } else if (!this.hasZeroValue) {
            return v;
        } else {
            return this.zeroValue;
        }
    }

    private V getStash(int i, V v) {
        int[] iArr = this.keyTable;
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (iArr[i2] == i) {
                return this.valueTable[i2];
            }
            i2++;
        }
        return v;
    }

    public V remove(int i) {
        if (i != 0) {
            int i2 = this.mask & i;
            int[] iArr = this.keyTable;
            if (iArr[i2] == i) {
                iArr[i2] = 0;
                V[] vArr = this.valueTable;
                V v = vArr[i2];
                vArr[i2] = null;
                this.size--;
                return v;
            }
            int hash2 = hash2(i);
            int[] iArr2 = this.keyTable;
            if (iArr2[hash2] == i) {
                iArr2[hash2] = 0;
                V[] vArr2 = this.valueTable;
                V v2 = vArr2[hash2];
                vArr2[hash2] = null;
                this.size--;
                return v2;
            }
            int hash3 = hash3(i);
            int[] iArr3 = this.keyTable;
            if (iArr3[hash3] != i) {
                return removeStash(i);
            }
            iArr3[hash3] = 0;
            V[] vArr3 = this.valueTable;
            V v3 = vArr3[hash3];
            vArr3[hash3] = null;
            this.size--;
            return v3;
        } else if (!this.hasZeroValue) {
            return null;
        } else {
            V v4 = this.zeroValue;
            this.zeroValue = null;
            this.hasZeroValue = false;
            this.size--;
            return v4;
        }
    }

    /* access modifiers changed from: package-private */
    public V removeStash(int i) {
        int[] iArr = this.keyTable;
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (iArr[i2] == i) {
                V v = this.valueTable[i2];
                removeStashIndex(i2);
                this.size--;
                return v;
            }
            i2++;
        }
        return null;
    }

    /* access modifiers changed from: package-private */
    public void removeStashIndex(int i) {
        this.stashSize--;
        int i2 = this.capacity + this.stashSize;
        if (i < i2) {
            int[] iArr = this.keyTable;
            iArr[i] = iArr[i2];
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
        this.zeroValue = null;
        this.hasZeroValue = false;
        this.size = 0;
        resize(i);
    }

    public void clear() {
        if (this.size != 0) {
            int[] iArr = this.keyTable;
            V[] vArr = this.valueTable;
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i > 0) {
                    iArr[i2] = 0;
                    vArr[i2] = null;
                    i = i2;
                } else {
                    this.size = 0;
                    this.stashSize = 0;
                    this.zeroValue = null;
                    this.hasZeroValue = false;
                    return;
                }
            }
        }
    }

    public boolean containsValue(Object obj, boolean z) {
        V[] vArr = this.valueTable;
        if (obj == null) {
            if (this.hasZeroValue && this.zeroValue == null) {
                return true;
            }
            int[] iArr = this.keyTable;
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i <= 0) {
                    return false;
                }
                if (iArr[i2] != 0 && vArr[i2] == null) {
                    return true;
                }
                i = i2;
            }
        } else if (z) {
            if (obj == this.zeroValue) {
                return true;
            }
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
        } else if (this.hasZeroValue && obj.equals(this.zeroValue)) {
            return true;
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
            if (iArr[i2] == i) {
                return true;
            }
            i2++;
        }
        return false;
    }

    public int findKey(Object obj, boolean z, int i) {
        V[] vArr = this.valueTable;
        if (obj == null) {
            if (!this.hasZeroValue || this.zeroValue != null) {
                int[] iArr = this.keyTable;
                int i2 = this.capacity + this.stashSize;
                while (true) {
                    int i3 = i2 - 1;
                    if (i2 <= 0) {
                        break;
                    } else if (iArr[i3] != 0 && vArr[i3] == null) {
                        return iArr[i3];
                    } else {
                        i2 = i3;
                    }
                }
            } else {
                return 0;
            }
        } else if (z) {
            if (obj != this.zeroValue) {
                int i4 = this.capacity + this.stashSize;
                while (true) {
                    int i5 = i4 - 1;
                    if (i4 <= 0) {
                        break;
                    } else if (vArr[i5] == obj) {
                        return this.keyTable[i5];
                    } else {
                        i4 = i5;
                    }
                }
            } else {
                return 0;
            }
        } else if (!this.hasZeroValue || !obj.equals(this.zeroValue)) {
            int i6 = this.capacity + this.stashSize;
            while (true) {
                int i7 = i6 - 1;
                if (i6 <= 0) {
                    break;
                } else if (obj.equals(vArr[i7])) {
                    return this.keyTable[i7];
                } else {
                    i6 = i7;
                }
            }
        } else {
            return 0;
        }
        return i;
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
        V[] vArr = this.valueTable;
        int i3 = this.stashCapacity;
        this.keyTable = new int[(i + i3)];
        this.valueTable = (V[]) new Object[(i + i3)];
        int i4 = this.size;
        this.size = this.hasZeroValue ? 1 : 0;
        this.stashSize = 0;
        if (i4 > 0) {
            for (int i5 = 0; i5 < i2; i5++) {
                int i6 = iArr[i5];
                if (i6 != 0) {
                    putResize(i6, vArr[i5]);
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
        V v;
        int hashCode = (!this.hasZeroValue || (v = this.zeroValue) == null) ? 0 : v.hashCode() + 0;
        int[] iArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = iArr[i2];
            if (i3 != 0) {
                hashCode += i3 * 31;
                V v2 = vArr[i2];
                if (v2 != null) {
                    hashCode += v2.hashCode();
                }
            }
        }
        return hashCode;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r9v1, resolved type: com.badlogic.gdx.utils.IntMap */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean equals(Object obj) {
        boolean z;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof IntMap)) {
            return false;
        }
        IntMap intMap = (IntMap) obj;
        if (!(intMap.size == this.size && intMap.hasZeroValue == (z = this.hasZeroValue))) {
            return false;
        }
        if (z) {
            V v = intMap.zeroValue;
            if (v == null) {
                if (this.zeroValue != null) {
                    return false;
                }
            } else if (!v.equals(this.zeroValue)) {
                return false;
            }
        }
        int[] iArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = iArr[i2];
            if (i3 != 0) {
                V v2 = vArr[i2];
                if (v2 == null) {
                    if (intMap.get(i3, ObjectMap.dummy) != null) {
                        return false;
                    }
                } else if (!v2.equals(intMap.get(i3))) {
                    return false;
                }
            }
        }
        return true;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r10v1, resolved type: com.badlogic.gdx.utils.IntMap */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean equalsIdentity(Object obj) {
        boolean z;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof IntMap)) {
            return false;
        }
        IntMap intMap = (IntMap) obj;
        if (!(intMap.size == this.size && intMap.hasZeroValue == (z = this.hasZeroValue))) {
            return false;
        }
        if (z && this.zeroValue != intMap.zeroValue) {
            return false;
        }
        int[] iArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = iArr[i2];
            if (!(i3 == 0 || vArr[i2] == intMap.get(i3, ObjectMap.dummy))) {
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
            java.lang.String r0 = "[]"
            return r0
        L_0x0007:
            com.badlogic.gdx.utils.StringBuilder r0 = new com.badlogic.gdx.utils.StringBuilder
            r1 = 32
            r0.<init>(r1)
            r1 = 91
            r0.append(r1)
            int[] r1 = r7.keyTable
            V[] r2 = r7.valueTable
            int r3 = r1.length
            boolean r4 = r7.hasZeroValue
            r5 = 61
            if (r4 == 0) goto L_0x0029
            java.lang.String r4 = "0="
            r0.append(r4)
            V r4 = r7.zeroValue
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
            r1 = 93
            r0.append(r1)
            java.lang.String r0 = r0.toString()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.IntMap.toString():java.lang.String");
    }

    @Override // java.lang.Iterable
    public Iterator<Entry<V>> iterator() {
        return entries();
    }

    public Entries<V> entries() {
        if (Collections.allocateIterators) {
            return new Entries<>(this);
        }
        if (this.entries1 == null) {
            this.entries1 = new Entries(this);
            this.entries2 = new Entries(this);
        }
        if (!this.entries1.valid) {
            this.entries1.reset();
            Entries<V> entries = this.entries1;
            entries.valid = true;
            this.entries2.valid = false;
            return entries;
        }
        this.entries2.reset();
        Entries<V> entries3 = this.entries2;
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

    public static class Entry<V> {
        public int key;
        public V value;

        public String toString() {
            return this.key + "=" + ((Object) this.value);
        }
    }

    /* access modifiers changed from: private */
    public static class MapIterator<V> {
        static final int INDEX_ILLEGAL = -2;
        static final int INDEX_ZERO = -1;
        int currentIndex;
        public boolean hasNext;
        final IntMap<V> map;
        int nextIndex;
        boolean valid = true;

        public MapIterator(IntMap<V> intMap) {
            this.map = intMap;
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
                    this.map.valueTable[this.currentIndex] = null;
                }
            } else {
                IntMap<V> intMap = this.map;
                intMap.zeroValue = null;
                intMap.hasZeroValue = false;
            }
            this.currentIndex = INDEX_ILLEGAL;
            IntMap<V> intMap2 = this.map;
            intMap2.size--;
        }
    }

    public static class Entries<V> extends MapIterator<V> implements Iterable<Entry<V>>, Iterator<Entry<V>> {
        private Entry<V> entry = new Entry<>();

        @Override // java.lang.Iterable
        public Iterator<Entry<V>> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.IntMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Entries(IntMap intMap) {
            super(intMap);
        }

        @Override // java.util.Iterator
        public Entry<V> next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                int[] iArr = this.map.keyTable;
                if (this.nextIndex == -1) {
                    Entry<V> entry2 = this.entry;
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

        @Override // com.badlogic.gdx.utils.IntMap.MapIterator
        public void remove() {
            super.remove();
        }
    }

    public static class Values<V> extends MapIterator<V> implements Iterable<V>, Iterator<V> {
        @Override // java.lang.Iterable
        public Iterator<V> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.IntMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Values(IntMap<V> intMap) {
            super(intMap);
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.hasNext;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        @Override // java.util.Iterator
        public V next() {
            V v;
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                if (this.nextIndex == -1) {
                    v = this.map.zeroValue;
                } else {
                    v = this.map.valueTable[this.nextIndex];
                }
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

        @Override // com.badlogic.gdx.utils.IntMap.MapIterator
        public void remove() {
            super.remove();
        }
    }

    public static class Keys extends MapIterator {
        @Override // com.badlogic.gdx.utils.IntMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.IntMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Keys(IntMap intMap) {
            super(intMap);
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
