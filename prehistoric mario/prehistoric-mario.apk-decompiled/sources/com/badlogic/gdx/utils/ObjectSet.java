package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.math.MathUtils;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ObjectSet<T> implements Iterable<T> {
    private static final int PRIME1 = -1105259343;
    private static final int PRIME2 = -1262997959;
    private static final int PRIME3 = -825114047;
    int capacity;
    private int hashShift;
    private ObjectSetIterator iterator1;
    private ObjectSetIterator iterator2;
    T[] keyTable;
    private float loadFactor;
    private int mask;
    private int pushIterations;
    public int size;
    private int stashCapacity;
    int stashSize;
    private int threshold;

    public ObjectSet() {
        this(51, 0.8f);
    }

    public ObjectSet(int i) {
        this(i, 0.8f);
    }

    public ObjectSet(int i, float f) {
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
                    this.keyTable = (T[]) new Object[(this.capacity + this.stashCapacity)];
                    return;
                }
                throw new IllegalArgumentException("loadFactor must be > 0: " + f);
            }
            throw new IllegalArgumentException("initialCapacity is too large: " + nextPowerOfTwo);
        }
        throw new IllegalArgumentException("initialCapacity must be >= 0: " + i);
    }

    public ObjectSet(ObjectSet<? extends T> objectSet) {
        this((int) Math.floor((double) (((float) objectSet.capacity) * objectSet.loadFactor)), objectSet.loadFactor);
        this.stashSize = objectSet.stashSize;
        T[] tArr = objectSet.keyTable;
        System.arraycopy(tArr, 0, this.keyTable, 0, tArr.length);
        this.size = objectSet.size;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r6v0, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r8v0, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r10v0, resolved type: java.lang.Object[] */
    /* JADX DEBUG: Multi-variable search result rejected for r4v1, resolved type: java.lang.Object[] */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean add(T t) {
        if (t != null) {
            T[] tArr = this.keyTable;
            int hashCode = t.hashCode();
            int i = hashCode & this.mask;
            T t2 = tArr[i];
            if (t.equals(t2)) {
                return false;
            }
            int hash2 = hash2(hashCode);
            T t3 = tArr[hash2];
            if (t.equals(t3)) {
                return false;
            }
            int hash3 = hash3(hashCode);
            T t4 = tArr[hash3];
            if (t.equals(t4)) {
                return false;
            }
            int i2 = this.capacity;
            int i3 = this.stashSize + i2;
            while (i2 < i3) {
                if (t.equals(tArr[i2])) {
                    return false;
                }
                i2++;
            }
            if (t2 == null) {
                tArr[i] = t;
                int i4 = this.size;
                this.size = i4 + 1;
                if (i4 >= this.threshold) {
                    resize(this.capacity << 1);
                }
                return true;
            } else if (t3 == null) {
                tArr[hash2] = t;
                int i5 = this.size;
                this.size = i5 + 1;
                if (i5 >= this.threshold) {
                    resize(this.capacity << 1);
                }
                return true;
            } else if (t4 == null) {
                tArr[hash3] = t;
                int i6 = this.size;
                this.size = i6 + 1;
                if (i6 >= this.threshold) {
                    resize(this.capacity << 1);
                }
                return true;
            } else {
                push(t, i, t2, hash2, t3, hash3, t4);
                return true;
            }
        } else {
            throw new IllegalArgumentException("key cannot be null.");
        }
    }

    public void addAll(Array<? extends T> array) {
        addAll(array.items, 0, array.size);
    }

    public void addAll(Array<? extends T> array, int i, int i2) {
        if (i + i2 <= array.size) {
            addAll(array.items, i, i2);
            return;
        }
        throw new IllegalArgumentException("offset + length must be <= size: " + i + " + " + i2 + " <= " + array.size);
    }

    public void addAll(T... tArr) {
        addAll(tArr, 0, tArr.length);
    }

    public void addAll(T[] tArr, int i, int i2) {
        ensureCapacity(i2);
        int i3 = i2 + i;
        while (i < i3) {
            add(tArr[i]);
            i++;
        }
    }

    /* JADX DEBUG: Multi-variable search result rejected for r1v0, resolved type: com.badlogic.gdx.utils.ObjectSet<T> */
    /* JADX WARN: Multi-variable type inference failed */
    public void addAll(ObjectSet<T> objectSet) {
        ensureCapacity(objectSet.size);
        ObjectSetIterator<T> it = objectSet.iterator();
        while (it.hasNext()) {
            add(it.next());
        }
    }

    private void addResize(T t) {
        int hashCode = t.hashCode();
        int i = hashCode & this.mask;
        T[] tArr = this.keyTable;
        T t2 = tArr[i];
        if (t2 == null) {
            tArr[i] = t;
            int i2 = this.size;
            this.size = i2 + 1;
            if (i2 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash2 = hash2(hashCode);
        T[] tArr2 = this.keyTable;
        T t3 = tArr2[hash2];
        if (t3 == null) {
            tArr2[hash2] = t;
            int i3 = this.size;
            this.size = i3 + 1;
            if (i3 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        int hash3 = hash3(hashCode);
        T[] tArr3 = this.keyTable;
        T t4 = tArr3[hash3];
        if (t4 == null) {
            tArr3[hash3] = t;
            int i4 = this.size;
            this.size = i4 + 1;
            if (i4 >= this.threshold) {
                resize(this.capacity << 1);
                return;
            }
            return;
        }
        push(t, i, t2, hash2, t3, hash3, t4);
    }

    private void push(T t, int i, T t2, int i2, T t3, int i3, T t4) {
        T[] tArr = this.keyTable;
        int i4 = this.mask;
        int i5 = this.pushIterations;
        int i6 = 0;
        while (true) {
            int random = MathUtils.random(2);
            if (random == 0) {
                tArr[i] = t;
                t = t2;
            } else if (random != 1) {
                tArr[i3] = t;
                t = t4;
            } else {
                tArr[i2] = t;
                t = t3;
            }
            int hashCode = t.hashCode();
            int i7 = hashCode & i4;
            T t5 = tArr[i7];
            if (t5 == null) {
                tArr[i7] = t;
                int i8 = this.size;
                this.size = i8 + 1;
                if (i8 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            int hash2 = hash2(hashCode);
            T t6 = tArr[hash2];
            if (t6 == null) {
                tArr[hash2] = t;
                int i9 = this.size;
                this.size = i9 + 1;
                if (i9 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            int hash3 = hash3(hashCode);
            t4 = tArr[hash3];
            if (t4 == null) {
                tArr[hash3] = t;
                int i10 = this.size;
                this.size = i10 + 1;
                if (i10 >= this.threshold) {
                    resize(this.capacity << 1);
                    return;
                }
                return;
            }
            i6++;
            if (i6 == i5) {
                addStash(t);
                return;
            }
            i3 = hash3;
            i = i7;
            t2 = t5;
            i2 = hash2;
            t3 = t6;
        }
    }

    private void addStash(T t) {
        int i = this.stashSize;
        if (i == this.stashCapacity) {
            resize(this.capacity << 1);
            addResize(t);
            return;
        }
        this.keyTable[this.capacity + i] = t;
        this.stashSize = i + 1;
        this.size++;
    }

    public boolean remove(T t) {
        int hashCode = t.hashCode();
        int i = this.mask & hashCode;
        if (t.equals(this.keyTable[i])) {
            this.keyTable[i] = null;
            this.size--;
            return true;
        }
        int hash2 = hash2(hashCode);
        if (t.equals(this.keyTable[hash2])) {
            this.keyTable[hash2] = null;
            this.size--;
            return true;
        }
        int hash3 = hash3(hashCode);
        if (!t.equals(this.keyTable[hash3])) {
            return removeStash(t);
        }
        this.keyTable[hash3] = null;
        this.size--;
        return true;
    }

    /* access modifiers changed from: package-private */
    public boolean removeStash(T t) {
        T[] tArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (t.equals(tArr[i])) {
                removeStashIndex(i);
                this.size--;
                return true;
            }
            i++;
        }
        return false;
    }

    /* access modifiers changed from: package-private */
    public void removeStashIndex(int i) {
        this.stashSize--;
        int i2 = this.capacity + this.stashSize;
        if (i < i2) {
            T[] tArr = this.keyTable;
            tArr[i] = tArr[i2];
            tArr[i2] = null;
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
            T[] tArr = this.keyTable;
            int i = this.capacity + this.stashSize;
            while (true) {
                int i2 = i - 1;
                if (i > 0) {
                    tArr[i2] = null;
                    i = i2;
                } else {
                    this.size = 0;
                    this.stashSize = 0;
                    return;
                }
            }
        }
    }

    public boolean contains(T t) {
        int hashCode = t.hashCode();
        if (t.equals(this.keyTable[this.mask & hashCode])) {
            return true;
        }
        if (t.equals(this.keyTable[hash2(hashCode)])) {
            return true;
        }
        if (t.equals(this.keyTable[hash3(hashCode)]) || getKeyStash(t) != null) {
            return true;
        }
        return false;
    }

    public T get(T t) {
        int hashCode = t.hashCode();
        T t2 = this.keyTable[this.mask & hashCode];
        if (!t.equals(t2)) {
            t2 = this.keyTable[hash2(hashCode)];
            if (!t.equals(t2)) {
                t2 = this.keyTable[hash3(hashCode)];
                if (!t.equals(t2)) {
                    return getKeyStash(t);
                }
            }
        }
        return t2;
    }

    private T getKeyStash(T t) {
        Object[] objArr = this.keyTable;
        int i = this.capacity;
        int i2 = this.stashSize + i;
        while (i < i2) {
            if (t.equals(objArr[i])) {
                return objArr[i];
            }
            i++;
        }
        return null;
    }

    public T first() {
        T[] tArr = this.keyTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            if (tArr[i2] != null) {
                return tArr[i2];
            }
        }
        throw new IllegalStateException("ObjectSet is empty.");
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
        T[] tArr = this.keyTable;
        this.keyTable = (T[]) new Object[(i + this.stashCapacity)];
        int i3 = this.size;
        this.size = 0;
        this.stashSize = 0;
        if (i3 > 0) {
            for (int i4 = 0; i4 < i2; i4++) {
                T t = tArr[i4];
                if (t != null) {
                    addResize(t);
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
            T[] tArr = this.keyTable;
            if (tArr[i3] != null) {
                i2 += tArr[i3].hashCode();
            }
        }
        return i2;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof ObjectSet)) {
            return false;
        }
        ObjectSet objectSet = (ObjectSet) obj;
        if (objectSet.size != this.size) {
            return false;
        }
        T[] tArr = this.keyTable;
        int i = this.capacity + this.stashSize;
        for (int i2 = 0; i2 < i; i2++) {
            if (!(tArr[i2] == null || objectSet.contains(tArr[i2]))) {
                return false;
            }
        }
        return true;
    }

    public String toString() {
        return '{' + toString(", ") + '}';
    }

    public String toString(String str) {
        int i;
        if (this.size == 0) {
            return BuildConfig.FLAVOR;
        }
        StringBuilder stringBuilder = new StringBuilder(32);
        T[] tArr = this.keyTable;
        int length = tArr.length;
        while (true) {
            i = length - 1;
            if (length > 0) {
                T t = tArr[i];
                if (t != null) {
                    stringBuilder.append((Object) t);
                    break;
                }
                length = i;
            } else {
                break;
            }
        }
        while (true) {
            int i2 = i - 1;
            if (i <= 0) {
                return stringBuilder.toString();
            }
            T t2 = tArr[i2];
            if (t2 != null) {
                stringBuilder.append(str);
                stringBuilder.append((Object) t2);
            }
            i = i2;
        }
    }

    @Override // java.lang.Iterable
    public ObjectSetIterator<T> iterator() {
        if (Collections.allocateIterators) {
            return new ObjectSetIterator<>(this);
        }
        if (this.iterator1 == null) {
            this.iterator1 = new ObjectSetIterator(this);
            this.iterator2 = new ObjectSetIterator(this);
        }
        if (!this.iterator1.valid) {
            this.iterator1.reset();
            ObjectSetIterator<T> objectSetIterator = this.iterator1;
            objectSetIterator.valid = true;
            this.iterator2.valid = false;
            return objectSetIterator;
        }
        this.iterator2.reset();
        ObjectSetIterator<T> objectSetIterator2 = this.iterator2;
        objectSetIterator2.valid = true;
        this.iterator1.valid = false;
        return objectSetIterator2;
    }

    public static <T> ObjectSet<T> with(T... tArr) {
        ObjectSet<T> objectSet = new ObjectSet<>();
        objectSet.addAll(tArr);
        return objectSet;
    }

    public static class ObjectSetIterator<K> implements Iterable<K>, Iterator<K> {
        int currentIndex;
        public boolean hasNext;
        int nextIndex;
        final ObjectSet<K> set;
        boolean valid = true;

        @Override // java.lang.Iterable
        public ObjectSetIterator<K> iterator() {
            return this;
        }

        public ObjectSetIterator(ObjectSet<K> objectSet) {
            this.set = objectSet;
            reset();
        }

        public void reset() {
            this.currentIndex = -1;
            this.nextIndex = -1;
            findNextIndex();
        }

        private void findNextIndex() {
            this.hasNext = false;
            T[] tArr = this.set.keyTable;
            int i = this.set.capacity + this.set.stashSize;
            do {
                int i2 = this.nextIndex + 1;
                this.nextIndex = i2;
                if (i2 >= i) {
                    return;
                }
            } while (tArr[this.nextIndex] == null);
            this.hasNext = true;
        }

        public void remove() {
            int i = this.currentIndex;
            if (i >= 0) {
                if (i >= this.set.capacity) {
                    this.set.removeStashIndex(this.currentIndex);
                    this.nextIndex = this.currentIndex - 1;
                    findNextIndex();
                } else {
                    this.set.keyTable[this.currentIndex] = null;
                }
                this.currentIndex = -1;
                ObjectSet<K> objectSet = this.set;
                objectSet.size--;
                return;
            }
            throw new IllegalStateException("next must be called before remove.");
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
                int i = this.nextIndex;
                K k = (K) this.set.keyTable[i];
                this.currentIndex = i;
                findNextIndex();
                return k;
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public Array<K> toArray(Array<K> array) {
            while (this.hasNext) {
                array.add(next());
            }
            return array;
        }

        public Array<K> toArray() {
            return toArray(new Array<>(true, this.set.size));
        }
    }
}
