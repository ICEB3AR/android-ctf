package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.math.MathUtils;
import java.util.Arrays;

public class ShortArray {
    public short[] items;
    public boolean ordered;
    public int size;

    public ShortArray() {
        this(true, 16);
    }

    public ShortArray(int i) {
        this(true, i);
    }

    public ShortArray(boolean z, int i) {
        this.ordered = z;
        this.items = new short[i];
    }

    public ShortArray(ShortArray shortArray) {
        this.ordered = shortArray.ordered;
        this.size = shortArray.size;
        int i = this.size;
        this.items = new short[i];
        System.arraycopy(shortArray.items, 0, this.items, 0, i);
    }

    public ShortArray(short[] sArr) {
        this(true, sArr, 0, sArr.length);
    }

    public ShortArray(boolean z, short[] sArr, int i, int i2) {
        this(z, i2);
        this.size = i2;
        System.arraycopy(sArr, i, this.items, 0, i2);
    }

    public void add(int i) {
        short[] sArr = this.items;
        int i2 = this.size;
        if (i2 == sArr.length) {
            sArr = resize(Math.max(8, (int) (((float) i2) * 1.75f)));
        }
        int i3 = this.size;
        this.size = i3 + 1;
        sArr[i3] = (short) i;
    }

    public void add(short s) {
        short[] sArr = this.items;
        int i = this.size;
        if (i == sArr.length) {
            sArr = resize(Math.max(8, (int) (((float) i) * 1.75f)));
        }
        int i2 = this.size;
        this.size = i2 + 1;
        sArr[i2] = s;
    }

    public void add(short s, short s2) {
        short[] sArr = this.items;
        int i = this.size;
        if (i + 1 >= sArr.length) {
            sArr = resize(Math.max(8, (int) (((float) i) * 1.75f)));
        }
        int i2 = this.size;
        sArr[i2] = s;
        sArr[i2 + 1] = s2;
        this.size = i2 + 2;
    }

    public void add(short s, short s2, short s3) {
        short[] sArr = this.items;
        int i = this.size;
        if (i + 2 >= sArr.length) {
            sArr = resize(Math.max(8, (int) (((float) i) * 1.75f)));
        }
        int i2 = this.size;
        sArr[i2] = s;
        sArr[i2 + 1] = s2;
        sArr[i2 + 2] = s3;
        this.size = i2 + 3;
    }

    public void add(short s, short s2, short s3, short s4) {
        short[] sArr = this.items;
        int i = this.size;
        if (i + 3 >= sArr.length) {
            sArr = resize(Math.max(8, (int) (((float) i) * 1.8f)));
        }
        int i2 = this.size;
        sArr[i2] = s;
        sArr[i2 + 1] = s2;
        sArr[i2 + 2] = s3;
        sArr[i2 + 3] = s4;
        this.size = i2 + 4;
    }

    public void addAll(ShortArray shortArray) {
        addAll(shortArray.items, 0, shortArray.size);
    }

    public void addAll(ShortArray shortArray, int i, int i2) {
        if (i + i2 <= shortArray.size) {
            addAll(shortArray.items, i, i2);
            return;
        }
        throw new IllegalArgumentException("offset + length must be <= size: " + i + " + " + i2 + " <= " + shortArray.size);
    }

    public void addAll(short... sArr) {
        addAll(sArr, 0, sArr.length);
    }

    public void addAll(short[] sArr, int i, int i2) {
        short[] sArr2 = this.items;
        int i3 = this.size + i2;
        if (i3 > sArr2.length) {
            sArr2 = resize(Math.max(8, (int) (((float) i3) * 1.75f)));
        }
        System.arraycopy(sArr, i, sArr2, this.size, i2);
        this.size += i2;
    }

    public short get(int i) {
        if (i < this.size) {
            return this.items[i];
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void set(int i, short s) {
        if (i < this.size) {
            this.items[i] = s;
            return;
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void incr(int i, short s) {
        if (i < this.size) {
            short[] sArr = this.items;
            sArr[i] = (short) (sArr[i] + s);
            return;
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void mul(int i, short s) {
        if (i < this.size) {
            short[] sArr = this.items;
            sArr[i] = (short) (sArr[i] * s);
            return;
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void insert(int i, short s) {
        int i2 = this.size;
        if (i <= i2) {
            short[] sArr = this.items;
            if (i2 == sArr.length) {
                sArr = resize(Math.max(8, (int) (((float) i2) * 1.75f)));
            }
            if (this.ordered) {
                System.arraycopy(sArr, i, sArr, i + 1, this.size - i);
            } else {
                sArr[this.size] = sArr[i];
            }
            this.size++;
            sArr[i] = s;
            return;
        }
        throw new IndexOutOfBoundsException("index can't be > size: " + i + " > " + this.size);
    }

    public void swap(int i, int i2) {
        int i3 = this.size;
        if (i >= i3) {
            throw new IndexOutOfBoundsException("first can't be >= size: " + i + " >= " + this.size);
        } else if (i2 < i3) {
            short[] sArr = this.items;
            short s = sArr[i];
            sArr[i] = sArr[i2];
            sArr[i2] = s;
        } else {
            throw new IndexOutOfBoundsException("second can't be >= size: " + i2 + " >= " + this.size);
        }
    }

    public boolean contains(short s) {
        int i = this.size - 1;
        short[] sArr = this.items;
        while (i >= 0) {
            int i2 = i - 1;
            if (sArr[i] == s) {
                return true;
            }
            i = i2;
        }
        return false;
    }

    public int indexOf(short s) {
        short[] sArr = this.items;
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (sArr[i2] == s) {
                return i2;
            }
        }
        return -1;
    }

    public int lastIndexOf(char c) {
        short[] sArr = this.items;
        for (int i = this.size - 1; i >= 0; i--) {
            if (sArr[i] == c) {
                return i;
            }
        }
        return -1;
    }

    public boolean removeValue(short s) {
        short[] sArr = this.items;
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (sArr[i2] == s) {
                removeIndex(i2);
                return true;
            }
        }
        return false;
    }

    public short removeIndex(int i) {
        int i2 = this.size;
        if (i < i2) {
            short[] sArr = this.items;
            short s = sArr[i];
            this.size = i2 - 1;
            if (this.ordered) {
                System.arraycopy(sArr, i + 1, sArr, i, this.size - i);
            } else {
                sArr[i] = sArr[this.size];
            }
            return s;
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void removeRange(int i, int i2) {
        int i3 = this.size;
        if (i2 >= i3) {
            throw new IndexOutOfBoundsException("end can't be >= size: " + i2 + " >= " + this.size);
        } else if (i <= i2) {
            int i4 = (i2 - i) + 1;
            int i5 = i3 - i4;
            if (this.ordered) {
                short[] sArr = this.items;
                int i6 = i4 + i;
                System.arraycopy(sArr, i6, sArr, i, i3 - i6);
            } else {
                int max = Math.max(i5, i2 + 1);
                short[] sArr2 = this.items;
                System.arraycopy(sArr2, max, sArr2, i, i3 - max);
            }
            this.size = i5;
        } else {
            throw new IndexOutOfBoundsException("start can't be > end: " + i + " > " + i2);
        }
    }

    public boolean removeAll(ShortArray shortArray) {
        int i = this.size;
        short[] sArr = this.items;
        int i2 = shortArray.size;
        int i3 = i;
        for (int i4 = 0; i4 < i2; i4++) {
            short s = shortArray.get(i4);
            int i5 = 0;
            while (true) {
                if (i5 >= i3) {
                    break;
                } else if (s == sArr[i5]) {
                    removeIndex(i5);
                    i3--;
                    break;
                } else {
                    i5++;
                }
            }
        }
        if (i3 != i) {
            return true;
        }
        return false;
    }

    public short pop() {
        short[] sArr = this.items;
        int i = this.size - 1;
        this.size = i;
        return sArr[i];
    }

    public short peek() {
        return this.items[this.size - 1];
    }

    public short first() {
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
        this.size = 0;
    }

    public short[] shrink() {
        int length = this.items.length;
        int i = this.size;
        if (length != i) {
            resize(i);
        }
        return this.items;
    }

    public short[] ensureCapacity(int i) {
        if (i >= 0) {
            int i2 = this.size + i;
            if (i2 > this.items.length) {
                resize(Math.max(8, i2));
            }
            return this.items;
        }
        throw new IllegalArgumentException("additionalCapacity must be >= 0: " + i);
    }

    public short[] setSize(int i) {
        if (i >= 0) {
            if (i > this.items.length) {
                resize(Math.max(8, i));
            }
            this.size = i;
            return this.items;
        }
        throw new IllegalArgumentException("newSize must be >= 0: " + i);
    }

    /* access modifiers changed from: protected */
    public short[] resize(int i) {
        short[] sArr = new short[i];
        System.arraycopy(this.items, 0, sArr, 0, Math.min(this.size, sArr.length));
        this.items = sArr;
        return sArr;
    }

    public void sort() {
        Arrays.sort(this.items, 0, this.size);
    }

    public void reverse() {
        short[] sArr = this.items;
        int i = this.size;
        int i2 = i - 1;
        int i3 = i / 2;
        for (int i4 = 0; i4 < i3; i4++) {
            int i5 = i2 - i4;
            short s = sArr[i4];
            sArr[i4] = sArr[i5];
            sArr[i5] = s;
        }
    }

    public void shuffle() {
        short[] sArr = this.items;
        for (int i = this.size - 1; i >= 0; i--) {
            int random = MathUtils.random(i);
            short s = sArr[i];
            sArr[i] = sArr[random];
            sArr[random] = s;
        }
    }

    public void truncate(int i) {
        if (this.size > i) {
            this.size = i;
        }
    }

    public short random() {
        int i = this.size;
        if (i == 0) {
            return 0;
        }
        return this.items[MathUtils.random(0, i - 1)];
    }

    public short[] toArray() {
        int i = this.size;
        short[] sArr = new short[i];
        System.arraycopy(this.items, 0, sArr, 0, i);
        return sArr;
    }

    public int hashCode() {
        if (!this.ordered) {
            return super.hashCode();
        }
        short[] sArr = this.items;
        int i = this.size;
        int i2 = 1;
        for (int i3 = 0; i3 < i; i3++) {
            i2 = (i2 * 31) + sArr[i3];
        }
        return i2;
    }

    public boolean equals(Object obj) {
        int i;
        if (obj == this) {
            return true;
        }
        if (!(this.ordered && (obj instanceof ShortArray))) {
            return false;
        }
        ShortArray shortArray = (ShortArray) obj;
        if (!(shortArray.ordered && (i = this.size) == shortArray.size)) {
            return false;
        }
        short[] sArr = this.items;
        short[] sArr2 = shortArray.items;
        for (int i2 = 0; i2 < i; i2++) {
            if (sArr[i2] != sArr2[i2]) {
                return false;
            }
        }
        return true;
    }

    public String toString() {
        if (this.size == 0) {
            return "[]";
        }
        short[] sArr = this.items;
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append('[');
        stringBuilder.append((int) sArr[0]);
        for (int i = 1; i < this.size; i++) {
            stringBuilder.append(", ");
            stringBuilder.append((int) sArr[i]);
        }
        stringBuilder.append(']');
        return stringBuilder.toString();
    }

    public String toString(String str) {
        if (this.size == 0) {
            return BuildConfig.FLAVOR;
        }
        short[] sArr = this.items;
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append((int) sArr[0]);
        for (int i = 1; i < this.size; i++) {
            stringBuilder.append(str);
            stringBuilder.append((int) sArr[i]);
        }
        return stringBuilder.toString();
    }

    public static ShortArray with(short... sArr) {
        return new ShortArray(sArr);
    }
}
