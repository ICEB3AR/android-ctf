package com.badlogic.gdx.math;

public final class GeometryUtils {
    private static final Vector2 tmp1 = new Vector2();
    private static final Vector2 tmp2 = new Vector2();
    private static final Vector2 tmp3 = new Vector2();

    public static Vector2 toBarycoord(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24, Vector2 vector25) {
        Vector2 sub = tmp1.set(vector23).sub(vector22);
        Vector2 sub2 = tmp2.set(vector24).sub(vector22);
        Vector2 sub3 = tmp3.set(vector2).sub(vector22);
        float dot = sub.dot(sub);
        float dot2 = sub.dot(sub2);
        float dot3 = sub2.dot(sub2);
        float dot4 = sub3.dot(sub);
        float dot5 = sub3.dot(sub2);
        float f = (dot * dot3) - (dot2 * dot2);
        vector25.x = ((dot3 * dot4) - (dot2 * dot5)) / f;
        vector25.y = ((dot * dot5) - (dot2 * dot4)) / f;
        return vector25;
    }

    public static boolean barycoordInsideTriangle(Vector2 vector2) {
        return vector2.x >= 0.0f && vector2.y >= 0.0f && vector2.x + vector2.y <= 1.0f;
    }

    public static Vector2 fromBarycoord(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24, Vector2 vector25) {
        float f = (1.0f - vector2.x) - vector2.y;
        vector25.x = (vector22.x * f) + (vector2.x * vector23.x) + (vector2.y * vector24.x);
        vector25.y = (f * vector22.y) + (vector2.x * vector23.y) + (vector2.y * vector24.y);
        return vector25;
    }

    public static float fromBarycoord(Vector2 vector2, float f, float f2, float f3) {
        return (((1.0f - vector2.x) - vector2.y) * f) + (vector2.x * f2) + (vector2.y * f3);
    }

    public static float lowestPositiveRoot(float f, float f2, float f3) {
        float f4 = (f2 * f2) - ((4.0f * f) * f3);
        if (f4 < 0.0f) {
            return Float.NaN;
        }
        float sqrt = (float) Math.sqrt((double) f4);
        float f5 = 1.0f / (f * 2.0f);
        float f6 = -f2;
        float f7 = (f6 - sqrt) * f5;
        float f8 = (f6 + sqrt) * f5;
        if (f7 <= f8) {
            f7 = f8;
            f8 = f7;
        }
        if (f8 > 0.0f) {
            return f8;
        }
        if (f7 > 0.0f) {
            return f7;
        }
        return Float.NaN;
    }

    public static boolean colinear(float f, float f2, float f3, float f4, float f5, float f6) {
        return Math.abs(((f5 - f3) * (f4 - f2)) - ((f3 - f) * (f6 - f4))) < 1.0E-6f;
    }

    public static Vector2 triangleCentroid(float f, float f2, float f3, float f4, float f5, float f6, Vector2 vector2) {
        vector2.x = ((f + f3) + f5) / 3.0f;
        vector2.y = ((f2 + f4) + f6) / 3.0f;
        return vector2;
    }

    public static Vector2 triangleCircumcenter(float f, float f2, float f3, float f4, float f5, float f6, Vector2 vector2) {
        float f7 = f3 - f;
        float f8 = f4 - f2;
        float f9 = f5 - f3;
        float f10 = f6 - f4;
        float f11 = f - f5;
        float f12 = f2 - f6;
        float f13 = (f9 * f8) - (f7 * f10);
        if (Math.abs(f13) >= 1.0E-6f) {
            float f14 = f13 * 2.0f;
            float f15 = (f * f) + (f2 * f2);
            float f16 = (f3 * f3) + (f4 * f4);
            float f17 = (f5 * f5) + (f6 * f6);
            vector2.set((((f10 * f15) + (f12 * f16)) + (f8 * f17)) / f14, (-(((f15 * f9) + (f16 * f11)) + (f17 * f7))) / f14);
            return vector2;
        }
        throw new IllegalArgumentException("Triangle points must not be colinear.");
    }

    public static float triangleCircumradius(float f, float f2, float f3, float f4, float f5, float f6) {
        float f7;
        float f8;
        float f9 = f4 - f2;
        if (Math.abs(f9) < 1.0E-6f) {
            f7 = (f3 + f) / 2.0f;
            f8 = (((-(f5 - f3)) / (f6 - f4)) * (f7 - ((f5 + f3) / 2.0f))) + ((f4 + f6) / 2.0f);
        } else {
            float f10 = f6 - f4;
            if (Math.abs(f10) < 1.0E-6f) {
                f7 = (f5 + f3) / 2.0f;
                f8 = (((-(f3 - f)) / f9) * (f7 - ((f + f3) / 2.0f))) + ((f4 + f2) / 2.0f);
            } else {
                float f11 = (-(f3 - f)) / f9;
                float f12 = (-(f5 - f3)) / f10;
                float f13 = (f + f3) / 2.0f;
                float f14 = (f2 + f4) / 2.0f;
                f7 = ((((f11 * f13) - (((f3 + f5) / 2.0f) * f12)) + ((f4 + f6) / 2.0f)) - f14) / (f11 - f12);
                f8 = (f11 * (f7 - f13)) + f14;
            }
        }
        float f15 = f - f7;
        float f16 = f2 - f8;
        return (float) Math.sqrt((double) ((f15 * f15) + (f16 * f16)));
    }

    public static float triangleQuality(float f, float f2, float f3, float f4, float f5, float f6) {
        return Math.min((float) Math.sqrt((double) ((f * f) + (f2 * f2))), Math.min((float) Math.sqrt((double) ((f3 * f3) + (f4 * f4))), (float) Math.sqrt((double) ((f5 * f5) + (f6 * f6))))) / triangleCircumradius(f, f2, f3, f4, f5, f6);
    }

    public static float triangleArea(float f, float f2, float f3, float f4, float f5, float f6) {
        return Math.abs(((f - f5) * (f4 - f2)) - ((f - f3) * (f6 - f2))) * 0.5f;
    }

    public static Vector2 quadrilateralCentroid(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, Vector2 vector2) {
        float f9 = ((f3 + f) + f5) / 3.0f;
        float f10 = ((f4 + f2) + f6) / 3.0f;
        vector2.x = f9 - ((f9 - (((f + f7) + f5) / 3.0f)) / 2.0f);
        vector2.y = f10 - ((f10 - (((f2 + f8) + f6) / 3.0f)) / 2.0f);
        return vector2;
    }

    public static Vector2 polygonCentroid(float[] fArr, int i, int i2, Vector2 vector2) {
        if (i2 >= 6) {
            int i3 = (i2 + i) - 2;
            float f = fArr[i3];
            float f2 = fArr[i3 + 1];
            float f3 = 0.0f;
            float f4 = 0.0f;
            float f5 = f;
            float f6 = 0.0f;
            while (i <= i3) {
                float f7 = fArr[i];
                float f8 = fArr[i + 1];
                float f9 = (f5 * f8) - (f7 * f2);
                f6 += f9;
                f3 += (f5 + f7) * f9;
                f4 += (f2 + f8) * f9;
                i += 2;
                f5 = f7;
                f2 = f8;
            }
            if (f6 == 0.0f) {
                vector2.x = 0.0f;
                vector2.y = 0.0f;
            } else {
                float f10 = f6 * 0.5f * 6.0f;
                vector2.x = f3 / f10;
                vector2.y = f4 / f10;
            }
            return vector2;
        }
        throw new IllegalArgumentException("A polygon must have 3 or more coordinate pairs.");
    }

    public static float polygonArea(float[] fArr, int i, int i2) {
        int i3 = (i2 + i) - 2;
        float f = fArr[i3];
        float f2 = fArr[i3 + 1];
        float f3 = 0.0f;
        while (i <= i3) {
            float f4 = fArr[i];
            float f5 = fArr[i + 1];
            f3 += (f * f5) - (f2 * f4);
            i += 2;
            f = f4;
            f2 = f5;
        }
        return f3 * 0.5f;
    }

    public static void ensureCCW(float[] fArr) {
        ensureCCW(fArr, 0, fArr.length);
    }

    public static void ensureCCW(float[] fArr, int i, int i2) {
        if (isClockwise(fArr, i, i2)) {
            int i3 = (i + i2) - 2;
            int i4 = (i2 / 2) + i;
            while (i < i4) {
                int i5 = i3 - i;
                float f = fArr[i];
                int i6 = i + 1;
                float f2 = fArr[i6];
                fArr[i] = fArr[i5];
                int i7 = i5 + 1;
                fArr[i6] = fArr[i7];
                fArr[i5] = f;
                fArr[i7] = f2;
                i += 2;
            }
        }
    }

    public static boolean isClockwise(float[] fArr, int i, int i2) {
        if (i2 <= 2) {
            return false;
        }
        int i3 = (i2 + i) - 2;
        float f = fArr[i3];
        float f2 = fArr[i3 + 1];
        float f3 = f;
        float f4 = 0.0f;
        while (i <= i3) {
            float f5 = fArr[i];
            float f6 = fArr[i + 1];
            f4 += (f3 * f6) - (f2 * f5);
            i += 2;
            f3 = f5;
            f2 = f6;
        }
        if (f4 < 0.0f) {
            return true;
        }
        return false;
    }
}
