package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Predicate;
import com.badlogic.gdx.utils.reflect.ArrayReflection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class Array<T> implements Iterable<T> {
    public T[] items;
    private ArrayIterable iterable;
    public boolean ordered;
    private Predicate.PredicateIterable<T> predicateIterable;
    public int size;

    public Array() {
        this(true, 16);
    }

    public Array(int i) {
        this(true, i);
    }

    public Array(boolean z, int i) {
        this.ordered = z;
        this.items = (T[]) new Object[i];
    }

    public Array(boolean z, int i, Class cls) {
        this.ordered = z;
        this.items = (T[]) ((Object[]) ArrayReflection.newInstance(cls, i));
    }

    public Array(Class cls) {
        this(true, 16, cls);
    }

    public Array(Array<? extends T> array) {
        this(array.ordered, array.size, array.items.getClass().getComponentType());
        this.size = array.size;
        System.arraycopy(array.items, 0, this.items, 0, this.size);
    }

    public Array(T[] tArr) {
        this(true, tArr, 0, tArr.length);
    }

    public Array(boolean z, T[] tArr, int i, int i2) {
        this(z, i2, tArr.getClass().getComponentType());
        this.size = i2;
        System.arraycopy(tArr, i, this.items, 0, this.size);
    }

    public void add(T t) {
        T[] tArr = this.items;
        int i = this.size;
        if (i == tArr.length) {
            tArr = resize(Math.max(8, (int) (((float) i) * 1.75f)));
        }
        int i2 = this.size;
        this.size = i2 + 1;
        tArr[i2] = t;
    }

    public void add(T t, T t2) {
        T[] tArr = this.items;
        int i = this.size;
        if (i + 1 >= tArr.length) {
            tArr = resize(Math.max(8, (int) (((float) i) * 1.75f)));
        }
        int i2 = this.size;
        tArr[i2] = t;
        tArr[i2 + 1] = t2;
        this.size = i2 + 2;
    }

    public void add(T t, T t2, T t3) {
        T[] tArr = this.items;
        int i = this.size;
        if (i + 2 >= tArr.length) {
            tArr = resize(Math.max(8, (int) (((float) i) * 1.75f)));
        }
        int i2 = this.size;
        tArr[i2] = t;
        tArr[i2 + 1] = t2;
        tArr[i2 + 2] = t3;
        this.size = i2 + 3;
    }

    public void add(T t, T t2, T t3, T t4) {
        T[] tArr = this.items;
        int i = this.size;
        if (i + 3 >= tArr.length) {
            tArr = resize(Math.max(8, (int) (((float) i) * 1.8f)));
        }
        int i2 = this.size;
        tArr[i2] = t;
        tArr[i2 + 1] = t2;
        tArr[i2 + 2] = t3;
        tArr[i2 + 3] = t4;
        this.size = i2 + 4;
    }

    public void addAll(Array<? extends T> array) {
        addAll(array.items, 0, array.size);
    }

    public void addAll(Array<? extends T> array, int i, int i2) {
        if (i + i2 <= array.size) {
            addAll(array.items, i, i2);
            return;
        }
        throw new IllegalArgumentException("start + count must be <= size: " + i + " + " + i2 + " <= " + array.size);
    }

    public void addAll(T... tArr) {
        addAll(tArr, 0, tArr.length);
    }

    public void addAll(T[] tArr, int i, int i2) {
        T[] tArr2 = this.items;
        int i3 = this.size + i2;
        if (i3 > tArr2.length) {
            tArr2 = resize(Math.max(8, (int) (((float) i3) * 1.75f)));
        }
        System.arraycopy(tArr, i, tArr2, this.size, i2);
        this.size += i2;
    }

    public T get(int i) {
        if (i < this.size) {
            return this.items[i];
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void set(int i, T t) {
        if (i < this.size) {
            this.items[i] = t;
            return;
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void insert(int i, T t) {
        int i2 = this.size;
        if (i <= i2) {
            T[] tArr = this.items;
            if (i2 == tArr.length) {
                tArr = resize(Math.max(8, (int) (((float) i2) * 1.75f)));
            }
            if (this.ordered) {
                System.arraycopy(tArr, i, tArr, i + 1, this.size - i);
            } else {
                tArr[this.size] = tArr[i];
            }
            this.size++;
            tArr[i] = t;
            return;
        }
        throw new IndexOutOfBoundsException("index can't be > size: " + i + " > " + this.size);
    }

    public void swap(int i, int i2) {
        int i3 = this.size;
        if (i >= i3) {
            throw new IndexOutOfBoundsException("first can't be >= size: " + i + " >= " + this.size);
        } else if (i2 < i3) {
            T[] tArr = this.items;
            T t = tArr[i];
            tArr[i] = tArr[i2];
            tArr[i2] = t;
        } else {
            throw new IndexOutOfBoundsException("second can't be >= size: " + i2 + " >= " + this.size);
        }
    }

    public boolean contains(T t, boolean z) {
        T[] tArr = this.items;
        int i = this.size - 1;
        if (z || t == null) {
            while (i >= 0) {
                int i2 = i - 1;
                if (tArr[i] == t) {
                    return true;
                }
                i = i2;
            }
            return false;
        }
        while (i >= 0) {
            int i3 = i - 1;
            if (t.equals(tArr[i])) {
                return true;
            }
            i = i3;
        }
        return false;
    }

    public boolean containsAll(Array<? extends T> array, boolean z) {
        T[] tArr = array.items;
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (!contains(tArr[i2], z)) {
                return false;
            }
        }
        return true;
    }

    public boolean containsAny(Array<? extends T> array, boolean z) {
        T[] tArr = array.items;
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (contains(tArr[i2], z)) {
                return true;
            }
        }
        return false;
    }

    public int indexOf(T t, boolean z) {
        T[] tArr = this.items;
        int i = 0;
        if (z || t == null) {
            int i2 = this.size;
            while (i < i2) {
                if (tArr[i] == t) {
                    return i;
                }
                i++;
            }
            return -1;
        }
        int i3 = this.size;
        while (i < i3) {
            if (t.equals(tArr[i])) {
                return i;
            }
            i++;
        }
        return -1;
    }

    public int lastIndexOf(T t, boolean z) {
        T[] tArr = this.items;
        if (z || t == null) {
            for (int i = this.size - 1; i >= 0; i--) {
                if (tArr[i] == t) {
                    return i;
                }
            }
            return -1;
        }
        for (int i2 = this.size - 1; i2 >= 0; i2--) {
            if (t.equals(tArr[i2])) {
                return i2;
            }
        }
        return -1;
    }

    public boolean removeValue(T t, boolean z) {
        T[] tArr = this.items;
        if (z || t == null) {
            int i = this.size;
            for (int i2 = 0; i2 < i; i2++) {
                if (tArr[i2] == t) {
                    removeIndex(i2);
                    return true;
                }
            }
        } else {
            int i3 = this.size;
            for (int i4 = 0; i4 < i3; i4++) {
                if (t.equals(tArr[i4])) {
                    removeIndex(i4);
                    return true;
                }
            }
        }
        return false;
    }

    public T removeIndex(int i) {
        int i2 = this.size;
        if (i < i2) {
            T[] tArr = this.items;
            T t = tArr[i];
            this.size = i2 - 1;
            if (this.ordered) {
                System.arraycopy(tArr, i + 1, tArr, i, this.size - i);
            } else {
                tArr[i] = tArr[this.size];
            }
            tArr[this.size] = null;
            return t;
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void removeRange(int i, int i2) {
        int i3 = this.size;
        if (i2 >= i3) {
            throw new IndexOutOfBoundsException("end can't be >= size: " + i2 + " >= " + this.size);
        } else if (i <= i2) {
            T[] tArr = this.items;
            int i4 = (i2 - i) + 1;
            int i5 = i3 - i4;
            if (this.ordered) {
                int i6 = i4 + i;
                System.arraycopy(tArr, i6, tArr, i, i3 - i6);
            } else {
                int max = Math.max(i5, i2 + 1);
                System.arraycopy(tArr, max, tArr, i, i3 - max);
            }
            for (int i7 = i5; i7 < i3; i7++) {
                tArr[i7] = null;
            }
            this.size = i5;
        } else {
            throw new IndexOutOfBoundsException("start can't be > end: " + i + " > " + i2);
        }
    }

    public boolean removeAll(Array<? extends T> array, boolean z) {
        int i;
        int i2 = this.size;
        T[] tArr = this.items;
        if (z) {
            int i3 = array.size;
            i = i2;
            for (int i4 = 0; i4 < i3; i4++) {
                Object obj = array.get(i4);
                int i5 = 0;
                while (true) {
                    if (i5 >= i) {
                        break;
                    } else if (obj == tArr[i5]) {
                        removeIndex(i5);
                        i--;
                        break;
                    } else {
                        i5++;
                    }
                }
            }
        } else {
            int i6 = array.size;
            i = i2;
            for (int i7 = 0; i7 < i6; i7++) {
                Object obj2 = array.get(i7);
                int i8 = 0;
                while (true) {
                    if (i8 >= i) {
                        break;
                    } else if (obj2.equals(tArr[i8])) {
                        removeIndex(i8);
                        i--;
                        break;
                    } else {
                        i8++;
                    }
                }
            }
        }
        if (i != i2) {
            return true;
        }
        return false;
    }

    public T pop() {
        int i = this.size;
        if (i != 0) {
            this.size = i - 1;
            T[] tArr = this.items;
            int i2 = this.size;
            T t = tArr[i2];
            tArr[i2] = null;
            return t;
        }
        throw new IllegalStateException("Array is empty.");
    }

    public T peek() {
        int i = this.size;
        if (i != 0) {
            return this.items[i - 1];
        }
        throw new IllegalStateException("Array is empty.");
    }

    public T first() {
        if (this.size != 0) {
            return this.items[0];
        }
        throw new IllegalStateException("Array is empty.");
    }

    public boolean notEmpty() {
        return this.size > 0;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    public void clear() {
        T[] tArr = this.items;
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            tArr[i2] = null;
        }
        this.size = 0;
    }

    public T[] shrink() {
        int length = this.items.length;
        int i = this.size;
        if (length != i) {
            resize(i);
        }
        return this.items;
    }

    public T[] ensureCapacity(int i) {
        if (i >= 0) {
            int i2 = this.size + i;
            if (i2 > this.items.length) {
                resize(Math.max(8, i2));
            }
            return this.items;
        }
        throw new IllegalArgumentException("additionalCapacity must be >= 0: " + i);
    }

    public T[] setSize(int i) {
        truncate(i);
        if (i > this.items.length) {
            resize(Math.max(8, i));
        }
        this.size = i;
        return this.items;
    }

    /* access modifiers changed from: protected */
    public T[] resize(int i) {
        T[] tArr = this.items;
        T[] tArr2 = (T[]) ((Object[]) ArrayReflection.newInstance(tArr.getClass().getComponentType(), i));
        System.arraycopy(tArr, 0, tArr2, 0, Math.min(this.size, tArr2.length));
        this.items = tArr2;
        return tArr2;
    }

    public void sort() {
        Sort.instance().sort(this.items, 0, this.size);
    }

    public void sort(Comparator<? super T> comparator) {
        Sort.instance().sort(this.items, comparator, 0, this.size);
    }

    public T selectRanked(Comparator<T> comparator, int i) {
        if (i >= 1) {
            return (T) Select.instance().select(this.items, comparator, i, this.size);
        }
        throw new GdxRuntimeException("nth_lowest must be greater than 0, 1 = first, 2 = second...");
    }

    public int selectRankedIndex(Comparator<T> comparator, int i) {
        if (i >= 1) {
            return Select.instance().selectIndex(this.items, comparator, i, this.size);
        }
        throw new GdxRuntimeException("nth_lowest must be greater than 0, 1 = first, 2 = second...");
    }

    public void reverse() {
        T[] tArr = this.items;
        int i = this.size;
        int i2 = i - 1;
        int i3 = i / 2;
        for (int i4 = 0; i4 < i3; i4++) {
            int i5 = i2 - i4;
            T t = tArr[i4];
            tArr[i4] = tArr[i5];
            tArr[i5] = t;
        }
    }

    public void shuffle() {
        T[] tArr = this.items;
        for (int i = this.size - 1; i >= 0; i--) {
            int random = MathUtils.random(i);
            T t = tArr[i];
            tArr[i] = tArr[random];
            tArr[random] = t;
        }
    }

    @Override // java.lang.Iterable
    public Iterator<T> iterator() {
        if (Collections.allocateIterators) {
            return new ArrayIterator(this, true);
        }
        if (this.iterable == null) {
            this.iterable = new ArrayIterable(this);
        }
        return this.iterable.iterator();
    }

    public Iterable<T> select(Predicate<T> predicate) {
        if (Collections.allocateIterators) {
            new Predicate.PredicateIterable(this, predicate);
        }
        Predicate.PredicateIterable<T> predicateIterable2 = this.predicateIterable;
        if (predicateIterable2 == null) {
            this.predicateIterable = new Predicate.PredicateIterable<>(this, predicate);
        } else {
            predicateIterable2.set(this, predicate);
        }
        return this.predicateIterable;
    }

    public void truncate(int i) {
        if (i < 0) {
            throw new IllegalArgumentException("newSize must be >= 0: " + i);
        } else if (this.size > i) {
            for (int i2 = i; i2 < this.size; i2++) {
                this.items[i2] = null;
            }
            this.size = i;
        }
    }

    public T random() {
        int i = this.size;
        if (i == 0) {
            return null;
        }
        return this.items[MathUtils.random(0, i - 1)];
    }

    public T[] toArray() {
        return (T[]) toArray((Class<V>) this.items.getClass().getComponentType());
    }

    public <V> V[] toArray(Class<V> cls) {
        V[] vArr = (V[]) ((Object[]) ArrayReflection.newInstance(cls, this.size));
        System.arraycopy(this.items, 0, vArr, 0, this.size);
        return vArr;
    }

    public int hashCode() {
        if (!this.ordered) {
            return super.hashCode();
        }
        T[] tArr = this.items;
        int i = this.size;
        int i2 = 1;
        for (int i3 = 0; i3 < i; i3++) {
            i2 *= 31;
            T t = tArr[i3];
            if (t != null) {
                i2 += t.hashCode();
            }
        }
        return i2;
    }

    public boolean equals(Object obj) {
        int i;
        if (obj == this) {
            return true;
        }
        if (!(this.ordered && (obj instanceof Array))) {
            return false;
        }
        Array array = (Array) obj;
        if (!(array.ordered && (i = this.size) == array.size)) {
            return false;
        }
        T[] tArr = this.items;
        T[] tArr2 = array.items;
        for (int i2 = 0; i2 < i; i2++) {
            T t = tArr[i2];
            T t2 = tArr2[i2];
            if (t == null) {
                if (t2 == null) {
                }
            } else if (t.equals(t2)) {
            }
            return false;
        }
        return true;
    }

    public boolean equalsIdentity(Object obj) {
        int i;
        if (obj == this) {
            return true;
        }
        if (!(this.ordered && (obj instanceof Array))) {
            return false;
        }
        Array array = (Array) obj;
        if (!(array.ordered && (i = this.size) == array.size)) {
            return false;
        }
        T[] tArr = this.items;
        T[] tArr2 = array.items;
        for (int i2 = 0; i2 < i; i2++) {
            if (tArr[i2] != tArr2[i2]) {
                return false;
            }
        }
        return true;
    }

    public String toString() {
        if (this.size == 0) {
            return "[]";
        }
        T[] tArr = this.items;
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append('[');
        stringBuilder.append((Object) tArr[0]);
        for (int i = 1; i < this.size; i++) {
            stringBuilder.append(", ");
            stringBuilder.append((Object) tArr[i]);
        }
        stringBuilder.append(']');
        return stringBuilder.toString();
    }

    public String toString(String str) {
        if (this.size == 0) {
            return BuildConfig.FLAVOR;
        }
        T[] tArr = this.items;
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append((Object) tArr[0]);
        for (int i = 1; i < this.size; i++) {
            stringBuilder.append(str);
            stringBuilder.append((Object) tArr[i]);
        }
        return stringBuilder.toString();
    }

    public static <T> Array<T> of(Class<T> cls) {
        return new Array<>(cls);
    }

    public static <T> Array<T> of(boolean z, int i, Class<T> cls) {
        return new Array<>(z, i, cls);
    }

    public static <T> Array<T> with(T... tArr) {
        return new Array<>(tArr);
    }

    public static class ArrayIterator<T> implements Iterator<T>, Iterable<T> {
        private final boolean allowRemove;
        private final Array<T> array;
        int index;
        boolean valid;

        @Override // java.lang.Iterable
        public Iterator<T> iterator() {
            return this;
        }

        public ArrayIterator(Array<T> array2) {
            this(array2, true);
        }

        public ArrayIterator(Array<T> array2, boolean z) {
            this.valid = true;
            this.array = array2;
            this.allowRemove = z;
        }

        public boolean hasNext() {
            if (this.valid) {
                return this.index < this.array.size;
            }
            throw new GdxRuntimeException("#iterator() cannot be used nested.");
        }

        @Override // java.util.Iterator
        public T next() {
            if (this.index >= this.array.size) {
                throw new NoSuchElementException(String.valueOf(this.index));
            } else if (this.valid) {
                T[] tArr = this.array.items;
                int i = this.index;
                this.index = i + 1;
                return tArr[i];
            } else {
                throw new GdxRuntimeException("#iterator() cannot be used nested.");
            }
        }

        public void remove() {
            if (this.allowRemove) {
                this.index--;
                this.array.removeIndex(this.index);
                return;
            }
            throw new GdxRuntimeException("Remove not allowed.");
        }

        public void reset() {
            this.index = 0;
        }
    }

    public static class ArrayIterable<T> implements Iterable<T> {
        private final boolean allowRemove;
        private final Array<T> array;
        private ArrayIterator iterator1;
        private ArrayIterator iterator2;

        public ArrayIterable(Array<T> array2) {
            this(array2, true);
        }

        public ArrayIterable(Array<T> array2, boolean z) {
            this.array = array2;
            this.allowRemove = z;
        }

        @Override // java.lang.Iterable
        public Iterator<T> iterator() {
            if (Collections.allocateIterators) {
                return new ArrayIterator(this.array, this.allowRemove);
            }
            if (this.iterator1 == null) {
                this.iterator1 = new ArrayIterator(this.array, this.allowRemove);
                this.iterator2 = new ArrayIterator(this.array, this.allowRemove);
            }
            if (!this.iterator1.valid) {
                ArrayIterator arrayIterator = this.iterator1;
                arrayIterator.index = 0;
                arrayIterator.valid = true;
                this.iterator2.valid = false;
                return arrayIterator;
            }
            ArrayIterator arrayIterator2 = this.iterator2;
            arrayIterator2.index = 0;
            arrayIterator2.valid = true;
            this.iterator1.valid = false;
            return arrayIterator2;
        }
    }
}
