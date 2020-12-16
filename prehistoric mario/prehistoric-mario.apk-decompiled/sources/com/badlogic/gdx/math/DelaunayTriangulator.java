package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.BooleanArray;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.ShortArray;

public class DelaunayTriangulator {
    private static final int COMPLETE = 1;
    private static final float EPSILON = 1.0E-6f;
    private static final int INCOMPLETE = 2;
    private static final int INSIDE = 0;
    private final Vector2 centroid = new Vector2();
    private final BooleanArray complete = new BooleanArray(false, 16);
    private final IntArray edges = new IntArray();
    private final ShortArray originalIndices = new ShortArray(false, 0);
    private final IntArray quicksortStack = new IntArray();
    private float[] sortedPoints;
    private final float[] superTriangle = new float[6];
    private final ShortArray triangles = new ShortArray(false, 16);

    public ShortArray computeTriangles(FloatArray floatArray, boolean z) {
        return computeTriangles(floatArray.items, 0, floatArray.size, z);
    }

    public ShortArray computeTriangles(float[] fArr, boolean z) {
        return computeTriangles(fArr, 0, fArr.length, z);
    }

    public ShortArray computeTriangles(float[] fArr, int i, int i2, boolean z) {
        float[] fArr2;
        int i3;
        int i4;
        int i5;
        int i6;
        boolean[] zArr;
        int i7;
        float[] fArr3;
        float[] fArr4;
        short[] sArr;
        int i8;
        IntArray intArray;
        BooleanArray booleanArray;
        ShortArray shortArray;
        float f;
        float f2;
        float f3;
        float f4;
        float f5;
        float f6;
        if (i2 <= 32767) {
            ShortArray shortArray2 = this.triangles;
            shortArray2.clear();
            if (i2 < 6) {
                return shortArray2;
            }
            shortArray2.ensureCapacity(i2);
            if (!z) {
                float[] fArr5 = this.sortedPoints;
                if (fArr5 == null || fArr5.length < i2) {
                    this.sortedPoints = new float[i2];
                }
                System.arraycopy(fArr, i, this.sortedPoints, 0, i2);
                float[] fArr6 = this.sortedPoints;
                sort(fArr6, i2);
                fArr2 = fArr6;
                i3 = 0;
            } else {
                fArr2 = fArr;
                i3 = i;
            }
            int i9 = i3 + i2;
            float f7 = fArr2[0];
            int i10 = 1;
            int i11 = i3 + 2;
            float f8 = fArr2[1];
            float f9 = f8;
            float f10 = f7;
            while (i11 < i9) {
                float f11 = fArr2[i11];
                if (f11 < f10) {
                    f10 = f11;
                }
                if (f11 > f7) {
                    f7 = f11;
                }
                int i12 = i11 + 1;
                float f12 = fArr2[i12];
                if (f12 < f9) {
                    f9 = f12;
                }
                if (f12 > f8) {
                    f8 = f12;
                }
                i11 = i12 + 1;
            }
            float f13 = f7 - f10;
            float f14 = f8 - f9;
            if (f13 <= f14) {
                f13 = f14;
            }
            float f15 = f13 * 20.0f;
            float f16 = (f7 + f10) / 2.0f;
            float f17 = (f8 + f9) / 2.0f;
            float[] fArr7 = this.superTriangle;
            fArr7[0] = f16 - f15;
            float f18 = f17 - f15;
            fArr7[1] = f18;
            fArr7[2] = f16;
            fArr7[3] = f17 + f15;
            fArr7[4] = f16 + f15;
            fArr7[5] = f18;
            IntArray intArray2 = this.edges;
            intArray2.ensureCapacity(i2 / 2);
            BooleanArray booleanArray2 = this.complete;
            booleanArray2.clear();
            booleanArray2.ensureCapacity(i2);
            shortArray2.add(i9);
            shortArray2.add(i9 + 2);
            shortArray2.add(i9 + 4);
            booleanArray2.add(false);
            int i13 = i3;
            while (i13 < i9) {
                float f19 = fArr2[i13];
                float f20 = fArr2[i13 + 1];
                short[] sArr2 = shortArray2.items;
                boolean[] zArr2 = booleanArray2.items;
                int i14 = shortArray2.size - i10;
                while (i14 >= 0) {
                    int i15 = i14 / 3;
                    if (zArr2[i15]) {
                        zArr = zArr2;
                        sArr = sArr2;
                        i6 = i13;
                        booleanArray = booleanArray2;
                        fArr4 = fArr7;
                        shortArray = shortArray2;
                        i5 = i3;
                        fArr3 = fArr2;
                        i7 = i9;
                        i8 = i14;
                        intArray = intArray2;
                    } else {
                        int i16 = i14 - 2;
                        short s = sArr2[i16];
                        short s2 = sArr2[i14 - 1];
                        i5 = i3;
                        short s3 = sArr2[i14];
                        if (s >= i9) {
                            int i17 = s - i9;
                            float f21 = fArr7[i17];
                            f = fArr7[i17 + 1];
                            f2 = f21;
                        } else {
                            f2 = fArr2[s];
                            f = fArr2[s + 1];
                        }
                        if (s2 >= i9) {
                            int i18 = s2 - i9;
                            float f22 = fArr7[i18];
                            f3 = fArr7[i18 + 1];
                            f4 = f22;
                        } else {
                            f4 = fArr2[s2];
                            f3 = fArr2[s2 + 1];
                        }
                        if (s3 >= i9) {
                            int i19 = s3 - i9;
                            float f23 = fArr7[i19];
                            f5 = fArr7[i19 + 1];
                            f6 = f23;
                        } else {
                            f6 = fArr2[s3];
                            f5 = fArr2[s3 + 1];
                        }
                        fArr3 = fArr2;
                        i7 = i9;
                        i8 = i14;
                        zArr = zArr2;
                        sArr = sArr2;
                        i6 = i13;
                        intArray = intArray2;
                        fArr4 = fArr7;
                        int circumCircle = circumCircle(f19, f20, f2, f, f4, f3, f6, f5);
                        if (circumCircle != 0) {
                            if (circumCircle == 1) {
                                zArr[i15] = true;
                            }
                            shortArray = shortArray2;
                            booleanArray = booleanArray2;
                        } else {
                            intArray.add(s, s2, s2, s3);
                            intArray.add(s3, s);
                            shortArray = shortArray2;
                            shortArray.removeRange(i16, i8);
                            booleanArray = booleanArray2;
                            booleanArray.removeIndex(i15);
                        }
                    }
                    i14 = i8 - 3;
                    i3 = i5;
                    booleanArray2 = booleanArray;
                    intArray2 = intArray;
                    sArr2 = sArr;
                    fArr7 = fArr4;
                    fArr2 = fArr3;
                    i9 = i7;
                    zArr2 = zArr;
                    i13 = i6;
                    shortArray2 = shortArray;
                }
                int i20 = i13;
                int[] iArr = intArray2.items;
                int i21 = intArray2.size;
                int i22 = 0;
                while (i22 < i21) {
                    int i23 = iArr[i22];
                    if (i23 != -1) {
                        int i24 = i22 + 1;
                        int i25 = iArr[i24];
                        boolean z2 = false;
                        for (int i26 = i22 + 2; i26 < i21; i26 += 2) {
                            if (i23 == iArr[i26 + 1] && i25 == iArr[i26]) {
                                iArr[i26] = -1;
                                z2 = true;
                            }
                        }
                        if (!z2) {
                            shortArray2.add(i23);
                            shortArray2.add(iArr[i24]);
                            i4 = i20;
                            shortArray2.add(i4);
                            booleanArray2.add(false);
                            i22 += 2;
                            i20 = i4;
                        }
                    }
                    i4 = i20;
                    i22 += 2;
                    i20 = i4;
                }
                intArray2.clear();
                i3 = i3;
                booleanArray2 = booleanArray2;
                i13 = i20 + 2;
                intArray2 = intArray2;
                fArr7 = fArr7;
                fArr2 = fArr2;
                i9 = i9;
                i10 = 1;
                shortArray2 = shortArray2;
            }
            int i27 = i9;
            int i28 = 0;
            short[] sArr3 = shortArray2.items;
            int i29 = shortArray2.size - 1;
            while (i29 >= 0) {
                if (sArr3[i29] >= i27 || sArr3[i29 - 1] >= i27 || sArr3[i29 - 2] >= i27) {
                    shortArray2.removeIndex(i29);
                    shortArray2.removeIndex(i29 - 1);
                    shortArray2.removeIndex(i29 - 2);
                }
                i29 -= 3;
                i27 = i27;
            }
            if (!z) {
                short[] sArr4 = this.originalIndices.items;
                int i30 = shortArray2.size;
                for (int i31 = 0; i31 < i30; i31++) {
                    sArr3[i31] = (short) (sArr4[sArr3[i31] / 2] * 2);
                }
            }
            if (i3 == 0) {
                int i32 = shortArray2.size;
                while (i28 < i32) {
                    sArr3[i28] = (short) (sArr3[i28] / 2);
                    i28++;
                }
            } else {
                int i33 = shortArray2.size;
                while (i28 < i33) {
                    sArr3[i28] = (short) ((sArr3[i28] - i3) / 2);
                    i28++;
                }
            }
            return shortArray2;
        }
        throw new IllegalArgumentException("count must be <= 32767");
    }

    private int circumCircle(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        float f9;
        float f10;
        float abs = Math.abs(f4 - f6);
        float abs2 = Math.abs(f6 - f8);
        if (abs >= 1.0E-6f) {
            float f11 = (-(f5 - f3)) / (f6 - f4);
            float f12 = (f3 + f5) / 2.0f;
            float f13 = (f4 + f6) / 2.0f;
            if (abs2 < 1.0E-6f) {
                f9 = (f7 + f5) / 2.0f;
            } else {
                float f14 = (-(f7 - f5)) / (f8 - f6);
                f9 = ((((f11 * f12) - (((f7 + f5) / 2.0f) * f14)) + ((f8 + f6) / 2.0f)) - f13) / (f11 - f14);
            }
            f10 = f13 + (f11 * (f9 - f12));
        } else if (abs2 < 1.0E-6f) {
            return 2;
        } else {
            float f15 = (f3 + f5) / 2.0f;
            f10 = (((-(f7 - f5)) / (f8 - f6)) * (f15 - ((f7 + f5) / 2.0f))) + ((f8 + f6) / 2.0f);
            f9 = f15;
        }
        float f16 = f5 - f9;
        float f17 = f6 - f10;
        float f18 = (f16 * f16) + (f17 * f17);
        float f19 = f - f9;
        float f20 = f19 * f19;
        float f21 = f2 - f10;
        if (((f21 * f21) + f20) - f18 <= 1.0E-6f) {
            return 0;
        }
        return (f <= f9 || f20 <= f18) ? 2 : 1;
    }

    private void sort(float[] fArr, int i) {
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
                int quicksortPartition = quicksortPartition(fArr, pop2, pop, sArr);
                int i3 = quicksortPartition - pop2;
                int i4 = pop - quicksortPartition;
                if (i3 > i4) {
                    intArray.add(pop2);
                    intArray.add(quicksortPartition - 2);
                }
                intArray.add(quicksortPartition + 2);
                intArray.add(pop);
                if (i4 >= i3) {
                    intArray.add(pop2);
                    intArray.add(quicksortPartition - 2);
                }
            }
        }
    }

    private int quicksortPartition(float[] fArr, int i, int i2, short[] sArr) {
        float f = fArr[i];
        int i3 = i + 2;
        while (i3 < i2) {
            while (i3 < i2 && fArr[i3] <= f) {
                i3 += 2;
            }
            while (fArr[i2] > f) {
                i2 -= 2;
            }
            if (i3 < i2) {
                float f2 = fArr[i3];
                fArr[i3] = fArr[i2];
                fArr[i2] = f2;
                int i4 = i3 + 1;
                float f3 = fArr[i4];
                int i5 = i2 + 1;
                fArr[i4] = fArr[i5];
                fArr[i5] = f3;
                int i6 = i3 / 2;
                short s = sArr[i6];
                int i7 = i2 / 2;
                sArr[i6] = sArr[i7];
                sArr[i7] = s;
            }
        }
        fArr[i] = fArr[i2];
        fArr[i2] = f;
        int i8 = i + 1;
        float f4 = fArr[i8];
        int i9 = i2 + 1;
        fArr[i8] = fArr[i9];
        fArr[i9] = f4;
        int i10 = i / 2;
        short s2 = sArr[i10];
        int i11 = i2 / 2;
        sArr[i10] = sArr[i11];
        sArr[i11] = s2;
        return i2;
    }

    public void trim(ShortArray shortArray, float[] fArr, float[] fArr2, int i, int i2) {
        short[] sArr = shortArray.items;
        for (int i3 = shortArray.size - 1; i3 >= 0; i3 -= 3) {
            int i4 = i3 - 2;
            int i5 = sArr[i4] * 2;
            int i6 = i3 - 1;
            int i7 = sArr[i6] * 2;
            int i8 = sArr[i3] * 2;
            GeometryUtils.triangleCentroid(fArr[i5], fArr[i5 + 1], fArr[i7], fArr[i7 + 1], fArr[i8], fArr[i8 + 1], this.centroid);
            if (!Intersector.isPointInPolygon(fArr2, i, i2, this.centroid.x, this.centroid.y)) {
                shortArray.removeIndex(i3);
                shortArray.removeIndex(i6);
                shortArray.removeIndex(i4);
            }
        }
    }
}
