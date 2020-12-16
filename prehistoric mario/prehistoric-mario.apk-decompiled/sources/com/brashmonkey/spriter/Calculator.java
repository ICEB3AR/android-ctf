package com.brashmonkey.spriter;

public class Calculator {
    public static final float PI = 3.1415927f;
    private static final int SIN_BITS = 14;
    private static final int SIN_COUNT = 16384;
    private static final int SIN_MASK = 16383;
    private static final float degFull = 360.0f;
    public static final float degRad = 0.017453292f;
    private static final float degToIndex = 45.511112f;
    public static final float degreesToRadians = 0.017453292f;
    public static final float radDeg = 57.295776f;
    private static final float radFull = 6.2831855f;
    private static final float radToIndex = 2607.5945f;
    public static final float radiansToDegrees = 57.295776f;

    public static float angleDifference(float f, float f2) {
        return ((((f - f2) % degFull) + 540.0f) % degFull) - 180.0f;
    }

    public static float cubed(float f) {
        return f * f * f;
    }

    public static float squared(float f) {
        return f * f;
    }

    public static float angleBetween(float f, float f2, float f3, float f4) {
        return (float) Math.toDegrees(Math.atan2((double) (f4 - f2), (double) (f3 - f)));
    }

    public static float distanceBetween(float f, float f2, float f3, float f4) {
        float f5 = f3 - f;
        float f6 = f4 - f2;
        return sqrt((f5 * f5) + (f6 * f6));
    }

    public static Float solveCubic(float f, float f2, float f3, float f4) {
        if (f == 0.0f) {
            return solveQuadratic(f2, f3, f4);
        }
        if (f4 == 0.0f) {
            return Float.valueOf(0.0f);
        }
        float f5 = f2 / f;
        float f6 = f3 / f;
        float f7 = f4 / f;
        float squared = squared(f5);
        float f8 = ((f6 * 3.0f) - squared) / 9.0f;
        float f9 = ((f7 * -27.0f) + (((f6 * 9.0f) - (squared * 2.0f)) * f5)) / 54.0f;
        float cubed = cubed(f8) + squared(f9);
        float f10 = f5 / 3.0f;
        if (cubed > 0.0f) {
            float sqrt = sqrt(cubed) + f9;
            float cubicRoot = sqrt < 0.0f ? -cubicRoot(-sqrt) : cubicRoot(sqrt);
            float sqrt2 = f9 - sqrt(cubed);
            float cubicRoot2 = (-f10) + cubicRoot + (sqrt2 < 0.0f ? -cubicRoot(-sqrt2) : cubicRoot(sqrt2));
            if (cubicRoot2 < 0.0f || cubicRoot2 > 1.0f) {
                return null;
            }
            return Float.valueOf(cubicRoot2);
        } else if (cubed == 0.0f) {
            float cubicRoot3 = f9 < 0.0f ? -cubicRoot(-f9) : cubicRoot(f9);
            float f11 = (-f10) + (2.0f * cubicRoot3);
            if (f11 >= 0.0f && f11 <= 1.0f) {
                return Float.valueOf(f11);
            }
            float f12 = -(cubicRoot3 + f10);
            if (f12 < 0.0f || f12 > 1.0f) {
                return null;
            }
            return Float.valueOf(f12);
        } else {
            float f13 = -f8;
            float acos = acos(f9 / sqrt((f13 * f13) * f13));
            float sqrt3 = sqrt(f13) * 2.0f;
            float f14 = -f10;
            float cos = (cos(acos / 3.0f) * sqrt3) + f14;
            if (cos >= 0.0f && cos <= 1.0f) {
                return Float.valueOf(cos);
            }
            float cos2 = (cos((6.2831855f + acos) / 3.0f) * sqrt3) + f14;
            if (cos2 >= 0.0f && cos2 <= 1.0f) {
                return Float.valueOf(cos2);
            }
            float cos3 = f14 + (sqrt3 * cos((acos + 12.566371f) / 3.0f));
            if (cos3 < 0.0f || cos3 > 1.0f) {
                return null;
            }
            return Float.valueOf(cos3);
        }
    }

    public static Float solveQuadratic(float f, float f2, float f3) {
        float f4 = 2.0f * f;
        float f5 = -f2;
        float squared = squared(f2) - ((f * 4.0f) * f3);
        float sqrt = (sqrt(squared) + f5) / f4;
        if (sqrt >= 0.0f && sqrt <= 1.0f) {
            return Float.valueOf(sqrt);
        }
        float sqrt2 = (f5 - sqrt(squared)) / f4;
        if (sqrt2 < 0.0f || sqrt2 > 1.0f) {
            return null;
        }
        return Float.valueOf(sqrt2);
    }

    public static float cubicRoot(float f) {
        return (float) Math.pow((double) f, 0.3333333432674408d);
    }

    public static float sqrt(float f) {
        return (float) Math.sqrt((double) f);
    }

    public static float acos(float f) {
        return (float) Math.acos((double) f);
    }

    /* access modifiers changed from: private */
    public static class Sin {
        static final float[] table = new float[16384];

        private Sin() {
        }

        static {
            for (int i = 0; i < 16384; i++) {
                table[i] = (float) Math.sin((double) (((((float) i) + 0.5f) / 16384.0f) * 6.2831855f));
            }
            for (int i2 = 0; i2 < 360; i2 += 90) {
                float f = (float) i2;
                table[((int) (Calculator.degToIndex * f)) & Calculator.SIN_MASK] = (float) Math.sin((double) (f * 0.017453292f));
            }
        }
    }

    public static final float sin(float f) {
        return Sin.table[((int) (f * radToIndex)) & SIN_MASK];
    }

    public static final float cos(float f) {
        return Sin.table[((int) ((f + 1.5707964f) * radToIndex)) & SIN_MASK];
    }

    public static final float sinDeg(float f) {
        return Sin.table[((int) (f * degToIndex)) & SIN_MASK];
    }

    public static final float cosDeg(float f) {
        return Sin.table[((int) ((f + 90.0f) * degToIndex)) & SIN_MASK];
    }
}
