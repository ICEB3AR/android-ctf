package com.badlogic.gdx.utils;

import java.util.Comparator;

public class QuickSelect<T> {
    private T[] array;
    private Comparator<? super T> comp;

    public int select(T[] tArr, Comparator<T> comparator, int i, int i2) {
        this.array = tArr;
        this.comp = comparator;
        return recursiveSelect(0, i2 - 1, i);
    }

    private int partition(int i, int i2, int i3) {
        T t = this.array[i3];
        swap(i2, i3);
        int i4 = i;
        while (i < i2) {
            if (this.comp.compare(this.array[i], t) < 0) {
                swap(i4, i);
                i4++;
            }
            i++;
        }
        swap(i2, i4);
        return i4;
    }

    private int recursiveSelect(int i, int i2, int i3) {
        if (i == i2) {
            return i;
        }
        int partition = partition(i, i2, medianOfThreePivot(i, i2));
        int i4 = (partition - i) + 1;
        if (i4 == i3) {
            return partition;
        }
        if (i3 < i4) {
            return recursiveSelect(i, partition - 1, i3);
        }
        return recursiveSelect(partition + 1, i2, i3 - i4);
    }

    private int medianOfThreePivot(int i, int i2) {
        T[] tArr = this.array;
        T t = tArr[i];
        int i3 = (i + i2) / 2;
        T t2 = tArr[i3];
        T t3 = tArr[i2];
        if (this.comp.compare(t, t2) > 0) {
            if (this.comp.compare(t2, t3) > 0) {
                return i3;
            }
            return this.comp.compare(t, t3) > 0 ? i2 : i;
        } else if (this.comp.compare(t, t3) > 0) {
            return i;
        } else {
            return this.comp.compare(t2, t3) > 0 ? i2 : i3;
        }
    }

    private void swap(int i, int i2) {
        T[] tArr = this.array;
        T t = tArr[i];
        tArr[i] = tArr[i2];
        tArr[i2] = t;
    }
}
