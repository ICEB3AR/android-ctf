package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.ShortArray;

public class ConvexHull {
    private final FloatArray hull = new FloatArray();
    private final IntArray indices = new IntArray();
    private final ShortArray originalIndices = new ShortArray(false, 0);
    private final IntArray quicksortStack = new IntArray();
    private float[] sortedPoints;

    public FloatArray computePolygon(FloatArray floatArray, boolean z) {
        return computePolygon(floatArray.items, 0, floatArray.size, z);
    }

    public FloatArray computePolygon(float[] fArr, boolean z) {
        return computePolygon(fArr, 0, fArr.length, z);
    }

    public FloatArray computePolygon(float[] fArr, int i, int i2, boolean z) {
        int i3 = i + i2;
        if (!z) {
            float[] fArr2 = this.sortedPoints;
            if (fArr2 == null || fArr2.length < i2) {
                this.sortedPoints = new float[i2];
            }
            System.arraycopy(fArr, i, this.sortedPoints, 0, i2);
            fArr = this.sortedPoints;
            sort(fArr, i2);
            i = 0;
        }
        FloatArray floatArray = this.hull;
        floatArray.clear();
        for (int i4 = i; i4 < i3; i4 += 2) {
            float f = fArr[i4];
            float f2 = fArr[i4 + 1];
            while (floatArray.size >= 4 && ccw(f, f2) <= 0.0f) {
                floatArray.size -= 2;
            }
            floatArray.add(f);
            floatArray.add(f2);
        }
        int i5 = floatArray.size + 2;
        for (int i6 = i3 - 4; i6 >= i; i6 -= 2) {
            float f3 = fArr[i6];
            float f4 = fArr[i6 + 1];
            while (floatArray.size >= i5 && ccw(f3, f4) <= 0.0f) {
                floatArray.size -= 2;
            }
            floatArray.add(f3);
            floatArray.add(f4);
        }
        return floatArray;
    }

    public IntArray computeIndices(FloatArray floatArray, boolean z, boolean z2) {
        return computeIndices(floatArray.items, 0, floatArray.size, z, z2);
    }

    public IntArray computeIndices(float[] fArr, boolean z, boolean z2) {
        return computeIndices(fArr, 0, fArr.length, z, z2);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r10v4, resolved type: short[] */
    /* JADX DEBUG: Multi-variable search result rejected for r11v3, resolved type: int[] */
    /* JADX DEBUG: Multi-variable search result rejected for r14v2, resolved type: int */
    /* JADX DEBUG: Multi-variable search result rejected for r14v3, resolved type: short */
    /* JADX WARN: Multi-variable type inference failed */
    public IntArray computeIndices(float[] fArr, int i, int i2, boolean z, boolean z2) {
        if (i2 <= 32767) {
            int i3 = i + i2;
            if (!z) {
                float[] fArr2 = this.sortedPoints;
                if (fArr2 == null || fArr2.length < i2) {
                    this.sortedPoints = new float[i2];
                }
                System.arraycopy(fArr, i, this.sortedPoints, 0, i2);
                fArr = this.sortedPoints;
                sortWithIndices(fArr, i2, z2);
                i = 0;
            }
            IntArray intArray = this.indices;
            intArray.clear();
            FloatArray floatArray = this.hull;
            floatArray.clear();
            int i4 = i / 2;
            int i5 = i;
            while (i5 < i3) {
                float f = fArr[i5];
                float f2 = fArr[i5 + 1];
                while (floatArray.size >= 4 && ccw(f, f2) <= 0.0f) {
                    floatArray.size -= 2;
                    intArray.size--;
                }
                floatArray.add(f);
                floatArray.add(f2);
                intArray.add(i4);
                i5 += 2;
                i4++;
            }
            int i6 = i3 - 4;
            int i7 = i6 / 2;
            int i8 = floatArray.size + 2;
            while (i6 >= i) {
                float f3 = fArr[i6];
                float f4 = fArr[i6 + 1];
                while (floatArray.size >= i8 && ccw(f3, f4) <= 0.0f) {
                    floatArray.size -= 2;
                    intArray.size--;
                }
                floatArray.add(f3);
                floatArray.add(f4);
                intArray.add(i7);
                i6 -= 2;
                i7--;
            }
            if (!z) {
                short[] sArr = this.originalIndices.items;
                int[] iArr = intArray.items;
                int i9 = intArray.size;
                for (int i10 = 0; i10 < i9; i10++) {
                    iArr[i10] = sArr[iArr[i10]];
                }
            }
            return intArray;
        }
        throw new IllegalArgumentException("count must be <= 32767");
    }

    private float ccw(float f, float f2) {
        FloatArray floatArray = this.hull;
        int i = floatArray.size;
        float f3 = floatArray.get(i - 4);
        float f4 = floatArray.get(i - 3);
        return ((floatArray.get(i - 2) - f3) * (f2 - f4)) - ((floatArray.peek() - f4) * (f - f3));
    }

    private void sort(float[] fArr, int i) {
        IntArray intArray = this.quicksortStack;
        intArray.add(0);
        intArray.add((i - 1) - 1);
        while (intArray.size > 0) {
            int pop = intArray.pop();
            int pop2 = intArray.pop();
            if (pop > pop2) {
                int quicksortPartition = quicksortPartition(fArr, pop2, pop);
                int i2 = quicksortPartition - pop2;
                int i3 = pop - quicksortPartition;
                if (i2 > i3) {
                    intArray.add(pop2);
                    intArray.add(quicksortPartition - 2);
                }
                intArray.add(quicksortPartition + 2);
                intArray.add(pop);
                if (i3 >= i2) {
                    intArray.add(pop2);
                    intArray.add(quicksortPartition - 2);
                }
            }
        }
    }

    private int quicksortPartition(float[] fArr, int i, int i2) {
        float f = fArr[i];
        int i3 = i + 1;
        float f2 = fArr[i3];
        int i4 = i2;
        int i5 = i;
        while (i5 < i4) {
            while (i5 < i4 && fArr[i5] <= f) {
                i5 += 2;
            }
            while (true) {
                if (fArr[i4] > f || (fArr[i4] == f && fArr[i4 + 1] < f2)) {
                    i4 -= 2;
                }
            }
            if (i5 < i4) {
                float f3 = fArr[i5];
                fArr[i5] = fArr[i4];
                fArr[i4] = f3;
                int i6 = i5 + 1;
                float f4 = fArr[i6];
                int i7 = i4 + 1;
                fArr[i6] = fArr[i7];
                fArr[i7] = f4;
            }
        }
        fArr[i] = fArr[i4];
        fArr[i4] = f;
        int i8 = i4 + 1;
        fArr[i3] = fArr[i8];
        fArr[i8] = f2;
        return i4;
    }

    private void sortWithIndices(float[] fArr, int i, boolean z) {
        int i2 = i / 2;
        this.originalIndices.clear();
        this.originalIndices.ensureCapacity(i2);
        short[] sArr = this.originalIndices.items;
        for (short s = 0; s < i2; s = (short) (s + 1)) {
            sArr[s] = s;
        }
        IntArray intArray = this.quicksortStack;
        intArray.add(0);
        intArray.add((i - 1) - 1);
        while (intArray.size > 0) {
            int pop = intArray.pop();
            int pop2 = intArray.pop();
            if (pop > pop2) {
                int quicksortPartitionWithIndices = quicksortPartitionWithIndices(fArr, pop2, pop, z, sArr);
                int i3 = quicksortPartitionWithIndices - pop2;
                int i4 = pop - quicksortPartitionWithIndices;
                if (i3 > i4) {
                    intArray.add(pop2);
                    intArray.add(quicksortPartitionWithIndices - 2);
                }
                intArray.add(quicksortPartitionWithIndices + 2);
                intArray.add(pop);
                if (i4 >= i3) {
                    intArray.add(pop2);
                    intArray.add(quicksortPartitionWithIndices - 2);
                }
            }
        }
    }

    private int quicksortPartitionWithIndices(float[] fArr, int i, int i2, boolean z, short[] sArr) {
        float f = fArr[i];
        int i3 = i + 1;
        float f2 = fArr[i3];
        int i4 = i2;
        int i5 = i;
        while (i5 < i4) {
            while (i5 < i4 && fArr[i5] <= f) {
                i5 += 2;
            }
            if (!z) {
                while (true) {
                    if (fArr[i4] <= f && (fArr[i4] != f || fArr[i4 + 1] <= f2)) {
                        break;
                    }
                    i4 -= 2;
                }
            } else {
                while (true) {
                    if (fArr[i4] <= f && (fArr[i4] != f || fArr[i4 + 1] >= f2)) {
                        break;
                    }
                    i4 -= 2;
                }
            }
            if (i5 < i4) {
                float f3 = fArr[i5];
                fArr[i5] = fArr[i4];
                fArr[i4] = f3;
                int i6 = i5 + 1;
                float f4 = fArr[i6];
                int i7 = i4 + 1;
                fArr[i6] = fArr[i7];
                fArr[i7] = f4;
                int i8 = i5 / 2;
                short s = sArr[i8];
                int i9 = i4 / 2;
                sArr[i8] = sArr[i9];
                sArr[i9] = s;
            }
        }
        fArr[i] = fArr[i4];
        fArr[i4] = f;
        int i10 = i4 + 1;
        fArr[i3] = fArr[i10];
        fArr[i10] = f2;
        int i11 = i / 2;
        short s2 = sArr[i11];
        int i12 = i4 / 2;
        sArr[i11] = sArr[i12];
        sArr[i12] = s2;
        return i4;
    }
}
