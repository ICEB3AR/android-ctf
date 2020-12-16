package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class LongMap<V> implements Iterable<Entry<V>> {
    private static final int EMPTY = 0;
    private static final int PRIME1 = -1105259343;
    private static final int PRIME2 = -1262997959;
    private static final int PRIME3 = -825114047;
    int capacity;
    private Entries entries1;
    private Entries entries2;
    boolean hasZeroValue;
    private int hashShift;
    long[] keyTable;
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

    public LongMap() {
        this(51, 0.8f);
    }

    public LongMap(int i) {
        this(i, 0.8f);
    }

    public LongMap(int i, float f) {
        if (i >= 0) {
            int nextPowerOfTwo = MathUtils.nextPowerOfTwo((int) Math.ceil((double) (((float) i) / f)));
            if (nextPowerOfTwo <= 1073741824) {
                this.capacity = nextPowerOfTwo;
                if (f > 0.0f) {
                    this.loadFactor = f;
                    int i2 = this.capacity;
                    this.threshold = (int) (((float) i2) * f);
                    this.mask = i2 - 1;
                    this.hashShift = 63 - Long.numberOfTrailingZeros((long) i2);
                    this.stashCapacity = Math.max(3, ((int) Math.ceil(Math.log((double) this.capacity))) * 2);
                    this.pushIterations = Math.max(Math.min(this.capacity, 8), ((int) Math.sqrt((double) this.capacity)) / 8);
                    this.keyTable = new long[(this.capacity + this.stashCapacity)];
                    this.valueTable = (V[]) new Object[this.keyTable.length];
                    return;
                }
                throw new IllegalArgumentException("loadFactor must be > 0: " + f);
            }
            throw new IllegalArgumentException("initialCapacity is too large: " + nextPowerOfTwo);
        }
        throw new IllegalArgumentException("initialCapacity must be >= 0: " + i);
    }

    public LongMap(LongMap<? extends V> longMap) {
        this((int) Math.floor((double) (((float) longMap.capacity) * longMap.loadFactor)), longMap.loadFactor);
        this.stashSize = longMap.stashSize;
        long[] jArr = longMap.keyTable;
        System.arraycopy(jArr, 0, this.keyTable, 0, jArr.length);
        V[] vArr = longMap.valueTable;
        System.arraycopy(vArr, 0, this.valueTable, 0, vArr.length);
        this.size = longMap.size;
        this.zeroValue = longMap.zeroValue;
        this.hasZeroValue = longMap.hasZeroValue;
    }

    public V put(long j, V v) {
        if (j == 0) {
            V v2 = this.zeroValue;
            this.zeroValue = v;
            if (!this.hasZeroValue) {
                this.hasZeroValue = true;
                this.size++;
            }
            return v2;
        }
        long[] jArr = this.keyTable;
        int i = (int) (j & ((long) this.mask));
        long j2 = jArr[i];
        if (j2 == j) {
            V[] vArr = this.valueTable;
            V v3 = vArr[i];
            vArr[i] = v;
            return v3;
        }
        int hash2 = hash2(j);
        long j3 = jArr[hash2];
        if (j3 == j) {
            V[] vArr2 = this.valueTable;
            V v4 = vArr2[hash2];
            vArr2[hash2] = v;
            return v4;
        }
        int hash3 = hash3(j);
        long j4 = jArr[hash3];
        if (j4 == j) {
            V[] vArr3 = this.valueTable;
            V v5 = vArr3[hash3];
            vArr3[hash3] = v;
            return v5;
        }
        int i2 = this.capacity;
        int i3 = this.stashSize + i2;
        while (i2 < i3) {
            if (jArr[i2] == j) {
                V[] vArr4 = this.valueTable;
                V v6 = vArr4[i2];
                vArr4[i2] = v;
                return v6;
            }
            i2++;
        }
        if (j2 == 0) {
            jArr[i] = j;
            this.valueTable[i] = v;
            int i4 = this.size;
            this.size = i4 + 1;
            if (i4 >= this.threshold) {
                resize(this.capacity << 1);
            }
            return null;
        } else if (j3 == 0) {
            jArr[hash2] = j;
            this.valueTable[hash2] = v;
            int i5 = this.size;
            this.size = i5 + 1;
            if (i5 >= this.threshold) {
                resize(this.capacity << 1);
            }
            return null;
        } else if (j4 == 0) {
            jArr[hash3] = j;
            this.valueTable[hash3] = v;
            int i6 = this.size;
            this.size = i6 + 1;
            if (i6 >= this.threshold) {
                resize(this.capacity << 1);
            }
            return null;
        } else {
            push(j, v, i, j2, hash2, j3, hash3, j4);
            return null;
        }
    }

    public void putAll(LongMap<? extends V> longMap) {
        Iterator<Entry<? extends V>> it = longMap.entries().iterator();
        while (it.hasNext()) {
            Entry<? extends V> next = it.next();
            put(next.key, next.value);
        }
    }

    private void putResize(long j, V v) {
        if (j == 0) {
            this.zeroValue = v;
            this.hasZeroValue = true;
            return;
        }
        int i = (int) (j & ((long) this.mask));
        long[] jArr = this.keyTable;
        long j2 = jArr[i];
        if (j2 == 0) {
            jArr[i] = j;
            this.valueTable[i] = v;
            int i2 = this.size;
            this.size = i2 + 1;
            if (i2 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash2 = hash2(j);
        long[] jArr2 = this.keyTable;
        long j3 = jArr2[hash2];
        if (j3 == 0) {
            jArr2[hash2] = j;
            this.valueTable[hash2] = v;
            int i3 = this.size;
            this.size = i3 + 1;
            if (i3 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash3 = hash3(j);
        long[] jArr3 = this.keyTable;
        long j4 = jArr3[hash3];
        if (j4 == 0) {
            jArr3[hash3] = j;
            this.valueTable[hash3] = v;
            int i4 = this.size;
            this.size = i4 + 1;
            if (i4 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        push(j, v, i, j2, hash2, j3, hash3, j4);
    }

    private void push(long j, V v, int i, long j2, int i2, long j3, int i3, long j4) {
        long[] jArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i4 = this.mask;
        int i5 = this.pushIterations;
        long j5 = j;
        V v2 = v;
        int i6 = i;
        long j6 = j2;
        int i7 = i2;
        long j7 = j3;
        int i8 = i3;
        long j8 = j4;
        int i9 = 0;
        while (true) {
            int random = MathUtils.random(2);
            if (random == 0) {
                V v3 = vArr[i6];
                jArr[i6] = j5;
                vArr[i6] = v2;
                v2 = v3;
                j5 = j6;
            } else if (random != 1) {
                V v4 = vArr[i8];
                jArr[i8] = j5;
                vArr[i8] = v2;
                j5 = j8;
                v2 = v4;
            } else {
                V v5 = vArr[i7];
                jArr[i7] = j5;
                vArr[i7] = v2;
                v2 = v5;
                j5 = j7;
            }
            i6 = (int) (((long) i4) & j5);
            j6 = jArr[i6];
            if (j6 == 0) {
                jArr[i6] = j5;
                vArr[i6] = v2;
                int i10 = this.size;
                this.size = i10 + 1;
                if (i10 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i7 = hash2(j5);
            long j9 = jArr[i7];
            if (j9 == 0) {
                jArr[i7] = j5;
                vArr[i7] = v2;
                int i11 = this.size;
                this.size = i11 + 1;
                if (i11 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i8 = hash3(j5);
            long j10 = jArr[i8];
            if (j10 == 0) {
                jArr[i8] = j5;
                vArr[i8] = v2;
                int i12 = this.size;
                this.size = i12 + 1;
                if (i12 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            int i13 = i9 + 1;
            if (i13 == i5) {
                putStash(j5, v2);
                return;
            }
            i9 = i13;
            j7 = j9;
            j8 = j10;
        }
    }

    private void putStash(long j, V v) {
        int i = this.stashSize;
        if (i == this.stashCapacity) {
            resize(this.capacity << 1);
            putResize(j, v);
            return;
        }
        int i2 = this.capacity + i;
        this.keyTable[i2] = j;
        this.valueTable[i2] = v;
        this.stashSize = i + 1;
        this.size++;
    }

    public V get(long j) {
        if (j != 0) {
            int i = (int) (((long) this.mask) & j);
            if (this.keyTable[i] != j) {
                i = hash2(j);
                if (this.keyTable[i] != j) {
                    i = hash3(j);
                    if (this.keyTable[i] != j) {
                        return getStash(j, null);
                    }
                }
            }
            return this.valueTable[i];
        } else if (!this.hasZeroValue) {
            return null;
        } else {
            return this.zeroValue;
        }
    }

    public V get(long j, V v) {
        if (j != 0) {
            int i = (int) (((long) this.mask) & j);
            if (this.keyTable[i] != j) {
                i = hash2(j);
                if (this.keyTable[i] != j) {
                    i = hash3(j);
                    if (this.keyTable[i] != j) {
                        return getStash(j, v);
                    }
                }
            }
            return this.valueTable[i];
        } else if (!this.hasZeroValue) {
            return v;
        } else {
            return this.zeroValue;
        }
    }

    private V getStash(long j, V v) {
        long[] jArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (jArr[i] == j) {
                return this.valueTable[i];
            }
            i++;
        }
        return v;
    }

    public V remove(long j) {
        if (j != 0) {
            int i = (int) (((long) this.mask) & j);
            long[] jArr = this.keyTable;
            if (jArr[i] == j) {
                jArr[i] = 0;
                V[] vArr = this.valueTable;
                V v = vArr[i];
                vArr[i] = null;
                this.size--;
                return v;
            }
            int hash2 = hash2(j);
            long[] jArr2 = this.keyTable;
            if (jArr2[hash2] == j) {
                jArr2[hash2] = 0;
                V[] vArr2 = this.valueTable;
                V v2 = vArr2[hash2];
                vArr2[hash2] = null;
                this.size--;
                return v2;
            }
            int hash3 = hash3(j);
            long[] jArr3 = this.keyTable;
            if (jArr3[hash3] != j) {
                return removeStash(j);
            }
            jArr3[hash3] = 0;
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
    public V removeStash(long j) {
        long[] jArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (jArr[i] == j) {
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
            long[] jArr = this.keyTable;
            jArr[i] = jArr[i2];
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
            long[] jArr = this.keyTable;
            V[] vArr = this.valueTable;
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i > 0) {
                    jArr[i2] = 0;
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
            long[] jArr = this.keyTable;
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i <= 0) {
                    return false;
                }
                if (jArr[i2] != 0 && vArr[i2] == null) {
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

    public boolean containsKey(long j) {
        if (j == 0) {
            return this.hasZeroValue;
        }
        if (this.keyTable[(int) (((long) this.mask) & j)] == j) {
            return true;
        }
        if (this.keyTable[hash2(j)] == j) {
            return true;
        }
        if (this.keyTable[hash3(j)] != j) {
            return containsKeyStash(j);
        }
        return true;
    }

    private boolean containsKeyStash(long j) {
        long[] jArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (jArr[i] == j) {
                return true;
            }
            i++;
        }
        return false;
    }

    public long findKey(Object obj, boolean z, long j) {
        V[] vArr = this.valueTable;
        if (obj == null) {
            if (!this.hasZeroValue || this.zeroValue != null) {
                long[] jArr = this.keyTable;
                int i = this.capacity + this.stashSize;
                while (true) {
                    int i2 = i - 1;
                    if (i <= 0) {
                        break;
                    } else if (jArr[i2] != 0 && vArr[i2] == null) {
                        return jArr[i2];
                    } else {
                        i = i2;
                    }
                }
            } else {
                return 0;
            }
        } else if (z) {
            if (obj != this.zeroValue) {
                int i3 = this.capacity + this.stashSize;
                while (true) {
                    int i4 = i3 - 1;
                    if (i3 <= 0) {
                        break;
                    } else if (vArr[i4] == obj) {
                        return this.keyTable[i4];
                    } else {
                        i3 = i4;
                    }
                }
            } else {
                return 0;
            }
        } else if (!this.hasZeroValue || !obj.equals(this.zeroValue)) {
            int i5 = this.capacity + this.stashSize;
            while (true) {
                int i6 = i5 - 1;
                if (i5 <= 0) {
                    break;
                } else if (obj.equals(vArr[i6])) {
                    return this.keyTable[i6];
                } else {
                    i5 = i6;
                }
            }
        } else {
            return 0;
        }
        return j;
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
        this.hashShift = 63 - Long.numberOfTrailingZeros((long) i);
        double d = (double) i;
        this.stashCapacity = Math.max(3, ((int) Math.ceil(Math.log(d))) * 2);
        this.pushIterations = Math.max(Math.min(i, 8), ((int) Math.sqrt(d)) / 8);
        long[] jArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i3 = this.stashCapacity;
        this.keyTable = new long[(i + i3)];
        this.valueTable = (V[]) new Object[(i + i3)];
        int i4 = this.size;
        this.size = this.hasZeroValue ? 1 : 0;
        this.stashSize = 0;
        if (i4 > 0) {
            for (int i5 = 0; i5 < i2; i5++) {
                long j = jArr[i5];
                if (j != 0) {
                    putResize(j, vArr[i5]);
                }
            }
        }
    }

    private int hash2(long j) {
        long j2 = j * -1262997959;
        return (int) ((j2 ^ (j2 >>> this.hashShift)) & ((long) this.mask));
    }

    private int hash3(long j) {
        long j2 = j * -825114047;
        return (int) ((j2 ^ (j2 >>> this.hashShift)) & ((long) this.mask));
    }

    public int hashCode() {
        V v;
        int hashCode = (!this.hasZeroValue || (v = this.zeroValue) == null) ? 0 : v.hashCode() + 0;
        long[] jArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            long j = jArr[i2];
            if (j != 0) {
                hashCode += ((int) (j ^ (j >>> 32))) * 31;
                V v2 = vArr[i2];
                if (v2 != null) {
                    hashCode += v2.hashCode();
                }
            }
        }
        return hashCode;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r12v1, resolved type: com.badlogic.gdx.utils.LongMap */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean equals(Object obj) {
        boolean z;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof LongMap)) {
            return false;
        }
        LongMap longMap = (LongMap) obj;
        if (!(longMap.size == this.size && longMap.hasZeroValue == (z = this.hasZeroValue))) {
            return false;
        }
        if (z) {
            V v = longMap.zeroValue;
            if (v == null) {
                if (this.zeroValue != null) {
                    return false;
                }
            } else if (!v.equals(this.zeroValue)) {
                return false;
            }
        }
        long[] jArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            long j = jArr[i2];
            if (j != 0) {
                V v2 = vArr[i2];
                if (v2 == null) {
                    if (longMap.get(j, ObjectMap.dummy) != null) {
                        return false;
                    }
                } else if (!v2.equals(longMap.get(j))) {
                    return false;
                }
            }
        }
        return true;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r12v1, resolved type: com.badlogic.gdx.utils.LongMap */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean equalsIdentity(Object obj) {
        boolean z;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof LongMap)) {
            return false;
        }
        LongMap longMap = (LongMap) obj;
        if (!(longMap.size == this.size && longMap.hasZeroValue == (z = this.hasZeroValue))) {
            return false;
        }
        if (z && this.zeroValue != longMap.zeroValue) {
            return false;
        }
        long[] jArr = this.keyTable;
        V[] vArr = this.valueTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            long j = jArr[i2];
            if (!(j == 0 || vArr[i2] == longMap.get(j, ObjectMap.dummy))) {
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
        long[] jArr = this.keyTable;
        V[] vArr = this.valueTable;
        int length = jArr.length;
        while (true) {
            i = length - 1;
            if (length <= 0) {
                break;
            }
            long j = jArr[i];
            if (j != 0) {
                stringBuilder.append(j);
                stringBuilder.append('=');
                stringBuilder.append((Object) vArr[i]);
                break;
            }
            length = i;
        }
        while (true) {
            int i2 = i - 1;
            if (i > 0) {
                long j2 = jArr[i2];
                if (j2 != 0) {
                    stringBuilder.append(", ");
                    stringBuilder.append(j2);
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
        public long key;
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
        final LongMap<V> map;
        int nextIndex;
        boolean valid = true;

        public MapIterator(LongMap<V> longMap) {
            this.map = longMap;
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
            long[] jArr = this.map.keyTable;
            int i = this.map.capacity + this.map.stashSize;
            do {
                int i2 = this.nextIndex + 1;
                this.nextIndex = i2;
                if (i2 >= i) {
                    return;
                }
            } while (jArr[this.nextIndex] == 0);
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
                LongMap<V> longMap = this.map;
                longMap.zeroValue = null;
                longMap.hasZeroValue = false;
            }
            this.currentIndex = INDEX_ILLEGAL;
            LongMap<V> longMap2 = this.map;
            longMap2.size--;
        }
    }

    public static class Entries<V> extends MapIterator<V> implements Iterable<Entry<V>>, Iterator<Entry<V>> {
        private Entry<V> entry = new Entry<>();

        @Override // java.lang.Iterable
        public Iterator<Entry<V>> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.LongMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Entries(LongMap longMap) {
            super(longMap);
        }

        @Override // java.util.Iterator
        public Entry<V> next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                long[] jArr = this.map.keyTable;
                if (this.nextIndex == -1) {
                    Entry<V> entry2 = this.entry;
                    entry2.key = 0;
                    entry2.value = this.map.zeroValue;
                } else {
                    this.entry.key = jArr[this.nextIndex];
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

        @Override // com.badlogic.gdx.utils.LongMap.MapIterator
        public void remove() {
            super.remove();
        }
    }

    public static class Values<V> extends MapIterator<V> implements Iterable<V>, Iterator<V> {
        @Override // java.lang.Iterable
        public Iterator<V> iterator() {
            return this;
        }

        @Override // com.badlogic.gdx.utils.LongMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Values(LongMap<V> longMap) {
            super(longMap);
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

        @Override // com.badlogic.gdx.utils.LongMap.MapIterator
        public void remove() {
            super.remove();
        }
    }

    public static class Keys extends MapIterator {
        @Override // com.badlogic.gdx.utils.LongMap.MapIterator
        public /* bridge */ /* synthetic */ void remove() {
            super.remove();
        }

        @Override // com.badlogic.gdx.utils.LongMap.MapIterator
        public /* bridge */ /* synthetic */ void reset() {
            super.reset();
        }

        public Keys(LongMap longMap) {
            super(longMap);
        }

        public long next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            } else if (this.valid) {
                long j = this.nextIndex == -1 ? 0 : this.map.keyTable[this.nextIndex];
                this.currentIndex = this.nextIndex;
                findNextIndex();
                return j;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public LongArray toArray() {
            LongArray longArray = new LongArray(true, this.map.size);
            while (this.hasNext) {
                longArray.add(next());
            }
            return longArray;
        }
    }
}
