package com.badlogic.gdx.math;

import com.badlogic.gdx.math.Vector;

public class CatmullRomSpline<T extends Vector<T>> implements Path<T> {
    public boolean continuous;
    public T[] controlPoints;
    public int spanCount;
    private T tmp;
    private T tmp2;
    private T tmp3;

    public static <T extends Vector<T>> T calculate(T t, float f, T[] tArr, boolean z, T t2) {
        int length = z ? tArr.length : tArr.length - 3;
        float f2 = ((float) length) * f;
        int i = f >= 1.0f ? length - 1 : (int) f2;
        return (T) calculate(t, i, f2 - ((float) i), tArr, z, t2);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r7v0, resolved type: T extends com.badlogic.gdx.math.Vector<T> */
    /* JADX WARN: Multi-variable type inference failed */
    public static <T extends Vector<T>> T calculate(T t, int i, float f, T[] tArr, boolean z, T t2) {
        int length = tArr.length;
        float f2 = f * f;
        float f3 = f2 * f;
        t.set(tArr[i]).scl(((1.5f * f3) - (2.5f * f2)) + 1.0f);
        if (z || i > 0) {
            t.add(t2.set(tArr[((length + i) - 1) % length]).scl(((-0.5f * f3) + f2) - (f * 0.5f)));
        }
        if (z || i < length - 1) {
            t.add(t2.set(tArr[(i + 1) % length]).scl((-1.5f * f3) + (2.0f * f2) + (f * 0.5f)));
        }
        if (z || i < length - 2) {
            t.add(t2.set(tArr[(i + 2) % length]).scl((f3 * 0.5f) - (f2 * 0.5f)));
        }
        return t;
    }

    public static <T extends Vector<T>> T derivative(T t, float f, T[] tArr, boolean z, T t2) {
        int length = z ? tArr.length : tArr.length - 3;
        float f2 = ((float) length) * f;
        int i = f >= 1.0f ? length - 1 : (int) f2;
        return (T) derivative(t, i, f2 - ((float) i), tArr, z, t2);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r8v0, resolved type: T extends com.badlogic.gdx.math.Vector<T> */
    /* JADX WARN: Multi-variable type inference failed */
    public static <T extends Vector<T>> T derivative(T t, int i, float f, T[] tArr, boolean z, T t2) {
        int length = tArr.length;
        float f2 = f * f;
        float f3 = -f;
        float f4 = 4.5f * f2;
        t.set(tArr[i]).scl((5.0f * f3) + f4);
        if (z || i > 0) {
            t.add(t2.set(tArr[((length + i) - 1) % length]).scl(((2.0f * f) - 8.0f) - (f2 * 1.5f)));
        }
        if (z || i < length - 1) {
            t.add(t2.set(tArr[(i + 1) % length]).scl(((f * 4.0f) + 0.5f) - f4));
        }
        if (z || i < length - 2) {
            t.add(t2.set(tArr[(i + 2) % length]).scl(f3 + (f2 * 1.5f)));
        }
        return t;
    }

    public CatmullRomSpline() {
    }

    public CatmullRomSpline(T[] tArr, boolean z) {
        set(tArr, z);
    }

    public CatmullRomSpline set(T[] tArr, boolean z) {
        if (this.tmp == null) {
            this.tmp = (T) tArr[0].cpy();
        }
        if (this.tmp2 == null) {
            this.tmp2 = (T) tArr[0].cpy();
        }
        if (this.tmp3 == null) {
            this.tmp3 = (T) tArr[0].cpy();
        }
        this.controlPoints = tArr;
        this.continuous = z;
        this.spanCount = z ? tArr.length : tArr.length - 3;
        return this;
    }

    public T valueAt(T t, float f) {
        int i = this.spanCount;
        float f2 = ((float) i) * f;
        int i2 = f >= 1.0f ? i - 1 : (int) f2;
        return valueAt(t, i2, f2 - ((float) i2));
    }

    public T valueAt(T t, int i, float f) {
        if (!this.continuous) {
            i++;
        }
        return (T) calculate(t, i, f, this.controlPoints, this.continuous, this.tmp);
    }

    public T derivativeAt(T t, float f) {
        int i = this.spanCount;
        float f2 = ((float) i) * f;
        int i2 = f >= 1.0f ? i - 1 : (int) f2;
        return derivativeAt(t, i2, f2 - ((float) i2));
    }

    public T derivativeAt(T t, int i, float f) {
        if (!this.continuous) {
            i++;
        }
        return (T) derivative(t, i, f, this.controlPoints, this.continuous, this.tmp);
    }

    public int nearest(T t) {
        return nearest(t, 0, this.spanCount);
    }

    public int nearest(T t, int i, int i2) {
        while (i < 0) {
            i += this.spanCount;
        }
        int i3 = i % this.spanCount;
        float dst2 = t.dst2(this.controlPoints[i3]);
        for (int i4 = 1; i4 < i2; i4++) {
            int i5 = (i + i4) % this.spanCount;
            float dst22 = t.dst2(this.controlPoints[i5]);
            if (dst22 < dst2) {
                i3 = i5;
                dst2 = dst22;
            }
        }
        return i3;
    }

    public float approximate(T t) {
        return approximate(t, nearest(t));
    }

    public float approximate(T t, int i, int i2) {
        return approximate(t, nearest(t, i, i2));
    }

    public float approximate(T t, int i) {
        int i2;
        T[] tArr = this.controlPoints;
        T t2 = tArr[i];
        if (i > 0) {
            i2 = i - 1;
        } else {
            i2 = this.spanCount - 1;
        }
        T t3 = tArr[i2];
        T t4 = this.controlPoints[(i + 1) % this.spanCount];
        if (t.dst2(t4) < t.dst2(t3)) {
            t3 = t2;
            t2 = t4;
        } else {
            if (i <= 0) {
                i = this.spanCount;
            }
            i--;
        }
        float dst2 = t3.dst2(t2);
        float dst22 = t.dst2(t2);
        float dst23 = t.dst2(t3);
        float sqrt = (float) Math.sqrt((double) dst2);
        return (((float) i) + MathUtils.clamp((sqrt - (((dst22 + dst2) - dst23) / (2.0f * sqrt))) / sqrt, 0.0f, 1.0f)) / ((float) this.spanCount);
    }

    public float locate(T t) {
        return approximate((Vector) t);
    }

    @Override // com.badlogic.gdx.math.Path
    public float approxLength(int i) {
        float f = 0.0f;
        for (int i2 = 0; i2 < i; i2++) {
            this.tmp2.set(this.tmp3);
            valueAt((Vector) this.tmp3, ((float) i2) / (((float) i) - 1.0f));
            if (i2 > 0) {
                f += this.tmp2.dst(this.tmp3);
            }
        }
        return f;
    }
}
