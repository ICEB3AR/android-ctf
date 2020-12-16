package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.math.MathUtils;
import java.util.Arrays;

public class FloatArray {
    public float[] items;
    public boolean ordered;
    public int size;

    public FloatArray() {
        this(true, 16);
    }

    public FloatArray(int i) {
        this(true, i);
    }

    public FloatArray(boolean z, int i) {
        this.ordered = z;
        this.items = new float[i];
    }

    public FloatArray(FloatArray floatArray) {
        this.ordered = floatArray.ordered;
        this.size = floatArray.size;
        int i = this.size;
        this.items = new float[i];
        System.arraycopy(floatArray.items, 0, this.items, 0, i);
    }

    public FloatArray(float[] fArr) {
        this(true, fArr, 0, fArr.length);
    }

    public FloatArray(boolean z, float[] fArr, int i, int i2) {
        this(z, i2);
        this.size = i2;
        System.arraycopy(fArr, i, this.items, 0, i2);
    }

    public void add(float f) {
        float[] fArr = this.items;
        int i = this.size;
        if (i == fArr.length) {
            fArr = resize(Math.max(8, (int) (((float) i) * 1.75f)));
        }
        int i2 = this.size;
        this.size = i2 + 1;
        fArr[i2] = f;
    }

    public void add(float f, float f2) {
        float[] fArr = this.items;
        int i = this.size;
        if (i + 1 >= fArr.length) {
            fArr = resize(Math.max(8, (int) (((float) i) * 1.75f)));
        }
        int i2 = this.size;
        fArr[i2] = f;
        fArr[i2 + 1] = f2;
        this.size = i2 + 2;
    }

    public void add(float f, float f2, float f3) {
        float[] fArr = this.items;
        int i = this.size;
        if (i + 2 >= fArr.length) {
            fArr = resize(Math.max(8, (int) (((float) i) * 1.75f)));
        }
        int i2 = this.size;
        fArr[i2] = f;
        fArr[i2 + 1] = f2;
        fArr[i2 + 2] = f3;
        this.size = i2 + 3;
    }

    public void add(float f, float f2, float f3, float f4) {
        float[] fArr = this.items;
        int i = this.size;
        if (i + 3 >= fArr.length) {
            fArr = resize(Math.max(8, (int) (((float) i) * 1.8f)));
        }
        int i2 = this.size;
        fArr[i2] = f;
        fArr[i2 + 1] = f2;
        fArr[i2 + 2] = f3;
        fArr[i2 + 3] = f4;
        this.size = i2 + 4;
    }

    public void addAll(FloatArray floatArray) {
        addAll(floatArray.items, 0, floatArray.size);
    }

    public void addAll(FloatArray floatArray, int i, int i2) {
        if (i + i2 <= floatArray.size) {
            addAll(floatArray.items, i, i2);
            return;
        }
        throw new IllegalArgumentException("offset + length must be <= size: " + i + " + " + i2 + " <= " + floatArray.size);
    }

    public void addAll(float... fArr) {
        addAll(fArr, 0, fArr.length);
    }

    public void addAll(float[] fArr, int i, int i2) {
        float[] fArr2 = this.items;
        int i3 = this.size + i2;
        if (i3 > fArr2.length) {
            fArr2 = resize(Math.max(8, (int) (((float) i3) * 1.75f)));
        }
        System.arraycopy(fArr, i, fArr2, this.size, i2);
        this.size += i2;
    }

    public float get(int i) {
        if (i < this.size) {
            return this.items[i];
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void set(int i, float f) {
        if (i < this.size) {
            this.items[i] = f;
            return;
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void incr(int i, float f) {
        if (i < this.size) {
            float[] fArr = this.items;
            fArr[i] = fArr[i] + f;
            return;
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void mul(int i, float f) {
        if (i < this.size) {
            float[] fArr = this.items;
            fArr[i] = fArr[i] * f;
            return;
        }
        throw new IndexOutOfBoundsException("index can't be >= size: " + i + " >= " + this.size);
    }

    public void insert(int i, float f) {
        int i2 = this.size;
        if (i <= i2) {
            float[] fArr = this.items;
            if (i2 == fArr.length) {
                fArr = resize(Math.max(8, (int) (((float) i2) * 1.75f)));
            }
            if (this.ordered) {
                System.arraycopy(fArr, i, fArr, i + 1, this.size - i);
            } else {
                fArr[this.size] = fArr[i];
            }
            this.size++;
            fArr[i] = f;
            return;
        }
        throw new IndexOutOfBoundsException("index can't be > size: " + i + " > " + this.size);
    }

    public void swap(int i, int i2) {
        int i3 = this.size;
        if (i >= i3) {
            throw new IndexOutOfBoundsException("first can't be >= size: " + i + " >= " + this.size);
        } else if (i2 < i3) {
            float[] fArr = this.items;
            float f = fArr[i];
            fArr[i] = fArr[i2];
            fArr[i2] = f;
        } else {
            throw new IndexOutOfBoundsException("second can't be >= size: " + i2 + " >= " + this.size);
        }
    }

    public boolean contains(float f) {
        int i = this.size - 1;
        float[] fArr = this.items;
        while (i >= 0) {
            int i2 = i - 1;
            if (fArr[i] == f) {
                return true;
            }
            i = i2;
        }
        return false;
    }

    public int indexOf(float f) {
        float[] fArr = this.items;
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (fArr[i2] == f) {
                return i2;
            }
        }
        return -1;
    }

    public int lastIndexOf(char c) {
        float[] fArr = this.items;
        for (int i = this.size - 1; i >= 0; i--) {
            if (fArr[i] == ((float) c)) {
                return i;
            }
        }
        return -1;
    }

    public boolean removeValue(float f) {
        float[] fArr = this.items;
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (fArr[i2] == f) {
                removeIndex(i2);
                return true;
            }
        }
        return false;
    }

    public float removeIndex(int i) {
        int i2 = this.size;
        if (i < i2) {
            float[] fArr = this.items;
            float f = fArr[i];
            this.size = i2 - 1;
            if (this.ordered) {
                System.arraycopy(fArr, i + 1, fArr, i, this.size - i);
            } else {
                fArr[i] = fArr[this.size];
            }
            return f;
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
                float[] fArr = this.items;
                int i6 = i4 + i;
                System.arraycopy(fArr, i6, fArr, i, i3 - i6);
            } else {
                int max = Math.max(i5, i2 + 1);
                float[] fArr2 = this.items;
                System.arraycopy(fArr2, max, fArr2, i, i3 - max);
            }
            this.size = i5;
        } else {
            throw new IndexOutOfBoundsException("start can't be > end: " + i + " > " + i2);
        }
    }

    public boolean removeAll(FloatArray floatArray) {
        int i = this.size;
        float[] fArr = this.items;
        int i2 = floatArray.size;
        int i3 = i;
        for (int i4 = 0; i4 < i2; i4++) {
            float f = floatArray.get(i4);
            int i5 = 0;
            while (true) {
                if (i5 >= i3) {
                    break;
                } else if (f == fArr[i5]) {
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

    public float pop() {
        float[] fArr = this.items;
        int i = this.size - 1;
        this.size = i;
        return fArr[i];
    }

    public float peek() {
        return this.items[this.size - 1];
    }

    public float first() {
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

    public float[] shrink() {
        int length = this.items.length;
        int i = this.size;
        if (length != i) {
            resize(i);
        }
        return this.items;
    }

    public float[] ensureCapacity(int i) {
        if (i >= 0) {
            int i2 = this.size + i;
            if (i2 > this.items.length) {
                resize(Math.max(8, i2));
            }
            return this.items;
        }
        throw new IllegalArgumentException("additionalCapacity must be >= 0: " + i);
    }

    public float[] setSize(int i) {
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
    public float[] resize(int i) {
        float[] fArr = new float[i];
        System.arraycopy(this.items, 0, fArr, 0, Math.min(this.size, fArr.length));
        this.items = fArr;
        return fArr;
    }

    public void sort() {
        Arrays.sort(this.items, 0, this.size);
    }

    public void reverse() {
        float[] fArr = this.items;
        int i = this.size;
        int i2 = i - 1;
        int i3 = i / 2;
        for (int i4 = 0; i4 < i3; i4++) {
            int i5 = i2 - i4;
            float f = fArr[i4];
            fArr[i4] = fArr[i5];
            fArr[i5] = f;
        }
    }

    public void shuffle() {
        float[] fArr = this.items;
        for (int i = this.size - 1; i >= 0; i--) {
            int random = MathUtils.random(i);
            float f = fArr[i];
            fArr[i] = fArr[random];
            fArr[random] = f;
        }
    }

    public void truncate(int i) {
        if (this.size > i) {
            this.size = i;
        }
    }

    public float random() {
        int i = this.size;
        if (i == 0) {
            return 0.0f;
        }
        return this.items[MathUtils.random(0, i - 1)];
    }

    public float[] toArray() {
        int i = this.size;
        float[] fArr = new float[i];
        System.arraycopy(this.items, 0, fArr, 0, i);
        return fArr;
    }

    public int hashCode() {
        if (!this.ordered) {
            return super.hashCode();
        }
        float[] fArr = this.items;
        int i = this.size;
        int i2 = 1;
        for (int i3 = 0; i3 < i; i3++) {
            i2 = (i2 * 31) + Float.floatToIntBits(fArr[i3]);
        }
        return i2;
    }

    public boolean equals(Object obj) {
        int i;
        if (obj == this) {
            return true;
        }
        if (!(this.ordered && (obj instanceof FloatArray))) {
            return false;
        }
        FloatArray floatArray = (FloatArray) obj;
        if (!(floatArray.ordered && (i = this.size) == floatArray.size)) {
            return false;
        }
        float[] fArr = this.items;
        float[] fArr2 = floatArray.items;
        for (int i2 = 0; i2 < i; i2++) {
            if (fArr[i2] != fArr2[i2]) {
                return false;
            }
        }
        return true;
    }

    public boolean equals(Object obj, float f) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof FloatArray)) {
            return false;
        }
        FloatArray floatArray = (FloatArray) obj;
        int i = this.size;
        if (!(i == floatArray.size && this.ordered && floatArray.ordered)) {
            return false;
        }
        float[] fArr = this.items;
        float[] fArr2 = floatArray.items;
        for (int i2 = 0; i2 < i; i2++) {
            if (Math.abs(fArr[i2] - fArr2[i2]) > f) {
                return false;
            }
        }
        return true;
    }

    public String toString() {
        if (this.size == 0) {
            return "[]";
        }
        float[] fArr = this.items;
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append('[');
        stringBuilder.append(fArr[0]);
        for (int i = 1; i < this.size; i++) {
            stringBuilder.append(", ");
            stringBuilder.append(fArr[i]);
        }
        stringBuilder.append(']');
        return stringBuilder.toString();
    }

    public String toString(String str) {
        if (this.size == 0) {
            return BuildConfig.FLAVOR;
        }
        float[] fArr = this.items;
        StringBuilder stringBuilder = new StringBuilder(32);
        stringBuilder.append(fArr[0]);
        for (int i = 1; i < this.size; i++) {
            stringBuilder.append(str);
            stringBuilder.append(fArr[i]);
        }
        return stringBuilder.toString();
    }

    public static FloatArray with(float... fArr) {
        return new FloatArray(fArr);
    }
}
