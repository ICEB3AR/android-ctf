package com.badlogic.gdx.graphics.g3d.environment;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class AmbientCubemap {
    private static final int NUM_VALUES = 18;
    public final float[] data;

    private static final float clamp(float f) {
        if (f < 0.0f) {
            return 0.0f;
        }
        if (f > 1.0f) {
            return 1.0f;
        }
        return f;
    }

    public AmbientCubemap() {
        this.data = new float[18];
    }

    public AmbientCubemap(float[] fArr) {
        if (fArr.length == 18) {
            this.data = new float[fArr.length];
            float[] fArr2 = this.data;
            System.arraycopy(fArr, 0, fArr2, 0, fArr2.length);
            return;
        }
        throw new GdxRuntimeException("Incorrect array size");
    }

    public AmbientCubemap(AmbientCubemap ambientCubemap) {
        this(ambientCubemap.data);
    }

    public AmbientCubemap set(float[] fArr) {
        int i = 0;
        while (true) {
            float[] fArr2 = this.data;
            if (i >= fArr2.length) {
                return this;
            }
            fArr2[i] = fArr[i];
            i++;
        }
    }

    public AmbientCubemap set(AmbientCubemap ambientCubemap) {
        return set(ambientCubemap.data);
    }

    public AmbientCubemap set(Color color) {
        return set(color.r, color.g, color.b);
    }

    public AmbientCubemap set(float f, float f2, float f3) {
        for (int i = 0; i < 18; i += 3) {
            float[] fArr = this.data;
            fArr[i] = f;
            fArr[i + 1] = f2;
            fArr[i + 2] = f3;
        }
        return this;
    }

    public Color getColor(Color color, int i) {
        int i2 = i * 3;
        float[] fArr = this.data;
        return color.set(fArr[i2], fArr[i2 + 1], fArr[i2 + 2], 1.0f);
    }

    public AmbientCubemap clear() {
        int i = 0;
        while (true) {
            float[] fArr = this.data;
            if (i >= fArr.length) {
                return this;
            }
            fArr[i] = 0.0f;
            i++;
        }
    }

    public AmbientCubemap clamp() {
        int i = 0;
        while (true) {
            float[] fArr = this.data;
            if (i >= fArr.length) {
                return this;
            }
            fArr[i] = clamp(fArr[i]);
            i++;
        }
    }

    public AmbientCubemap add(float f, float f2, float f3) {
        int i = 0;
        while (true) {
            float[] fArr = this.data;
            if (i >= fArr.length) {
                return this;
            }
            int i2 = i + 1;
            fArr[i] = fArr[i] + f;
            int i3 = i2 + 1;
            fArr[i2] = fArr[i2] + f2;
            fArr[i3] = fArr[i3] + f3;
            i = i3 + 1;
        }
    }

    public AmbientCubemap add(Color color) {
        return add(color.r, color.g, color.b);
    }

    public AmbientCubemap add(float f, float f2, float f3, float f4, float f5, float f6) {
        float f7 = f4 * f4;
        float f8 = f5 * f5;
        float f9 = f6 * f6;
        float f10 = f7 + f8 + f9;
        if (f10 == 0.0f) {
            return this;
        }
        float f11 = (1.0f / f10) * (f10 + 1.0f);
        float f12 = f * f11;
        float f13 = f2 * f11;
        float f14 = f3 * f11;
        int i = f4 > 0.0f ? 0 : 3;
        float[] fArr = this.data;
        fArr[i] = fArr[i] + (f7 * f12);
        int i2 = i + 1;
        fArr[i2] = fArr[i2] + (f7 * f13);
        int i3 = i + 2;
        fArr[i3] = fArr[i3] + (f7 * f14);
        int i4 = f5 > 0.0f ? 6 : 9;
        float[] fArr2 = this.data;
        fArr2[i4] = fArr2[i4] + (f8 * f12);
        int i5 = i4 + 1;
        fArr2[i5] = fArr2[i5] + (f8 * f13);
        int i6 = i4 + 2;
        fArr2[i6] = fArr2[i6] + (f8 * f14);
        int i7 = f6 > 0.0f ? 12 : 15;
        float[] fArr3 = this.data;
        fArr3[i7] = fArr3[i7] + (f12 * f9);
        int i8 = i7 + 1;
        fArr3[i8] = fArr3[i8] + (f13 * f9);
        int i9 = i7 + 2;
        fArr3[i9] = fArr3[i9] + (f9 * f14);
        return this;
    }

    public AmbientCubemap add(Color color, Vector3 vector3) {
        return add(color.r, color.g, color.b, vector3.x, vector3.y, vector3.z);
    }

    public AmbientCubemap add(float f, float f2, float f3, Vector3 vector3) {
        return add(f, f2, f3, vector3.x, vector3.y, vector3.z);
    }

    public AmbientCubemap add(Color color, float f, float f2, float f3) {
        return add(color.r, color.g, color.b, f, f2, f3);
    }

    public AmbientCubemap add(Color color, Vector3 vector3, Vector3 vector32) {
        return add(color.r, color.g, color.b, vector32.x - vector3.x, vector32.y - vector3.y, vector32.z - vector3.z);
    }

    public AmbientCubemap add(Color color, Vector3 vector3, Vector3 vector32, float f) {
        float dst = f / (vector32.dst(vector3) + 1.0f);
        return add(color.r * dst, color.g * dst, color.b * dst, vector32.x - vector3.x, vector32.y - vector3.y, vector32.z - vector3.z);
    }

    public String toString() {
        String str = BuildConfig.FLAVOR;
        for (int i = 0; i < this.data.length; i += 3) {
            str = str + Float.toString(this.data[i]) + ", " + Float.toString(this.data[i + 1]) + ", " + Float.toString(this.data[i + 2]) + "\n";
        }
        return str;
    }
}
