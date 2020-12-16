package com.badlogic.gdx.math;

import com.badlogic.gdx.graphics.GL20;
import java.util.Random;

public final class MathUtils {
    private static final double BIG_ENOUGH_CEIL = 16384.999999999996d;
    private static final double BIG_ENOUGH_FLOOR = 16384.0d;
    private static final int BIG_ENOUGH_INT = 16384;
    private static final double BIG_ENOUGH_ROUND = 16384.5d;
    private static final double CEIL = 0.9999999d;
    public static final float E = 2.7182817f;
    public static final float FLOAT_ROUNDING_ERROR = 1.0E-6f;
    public static final float PI = 3.1415927f;
    public static final float PI2 = 6.2831855f;
    private static final int SIN_BITS = 14;
    private static final int SIN_COUNT = 16384;
    private static final int SIN_MASK = 16383;
    private static final float degFull = 360.0f;
    public static final float degRad = 0.017453292f;
    private static final float degToIndex = 45.511112f;
    public static final float degreesToRadians = 0.017453292f;
    public static final float nanoToSec = 1.0E-9f;
    public static final float radDeg = 57.295776f;
    private static final float radFull = 6.2831855f;
    private static final float radToIndex = 2607.5945f;
    public static final float radiansToDegrees = 57.295776f;
    public static Random random = new RandomXS128();

    public static double clamp(double d, double d2, double d3) {
        return d < d2 ? d2 : d > d3 ? d3 : d;
    }

    public static float clamp(float f, float f2, float f3) {
        return f < f2 ? f2 : f > f3 ? f3 : f;
    }

    public static int clamp(int i, int i2, int i3) {
        return i < i2 ? i2 : i > i3 ? i3 : i;
    }

    public static long clamp(long j, long j2, long j3) {
        return j < j2 ? j2 : j > j3 ? j3 : j;
    }

    public static short clamp(short s, short s2, short s3) {
        return s < s2 ? s2 : s > s3 ? s3 : s;
    }

    public static int floorPositive(float f) {
        return (int) f;
    }

    public static boolean isPowerOfTwo(int i) {
        return i != 0 && (i & (i + -1)) == 0;
    }

    public static float lerp(float f, float f2, float f3) {
        return f + ((f2 - f) * f3);
    }

    public static float lerpAngle(float f, float f2, float f3) {
        return ((f + ((((((f2 - f) + 6.2831855f) + 3.1415927f) % 6.2831855f) - 3.1415927f) * f3)) + 6.2831855f) % 6.2831855f;
    }

    public static float lerpAngleDeg(float f, float f2, float f3) {
        return ((f + ((((((f2 - f) + degFull) + 180.0f) % degFull) - 180.0f) * f3)) + degFull) % degFull;
    }

    public static float map(float f, float f2, float f3, float f4, float f5) {
        return f3 + (((f5 - f) * (f4 - f3)) / (f2 - f));
    }

    public static int nextPowerOfTwo(int i) {
        if (i == 0) {
            return 1;
        }
        int i2 = i - 1;
        int i3 = i2 | (i2 >> 1);
        int i4 = i3 | (i3 >> 2);
        int i5 = i4 | (i4 >> 4);
        int i6 = i5 | (i5 >> 8);
        return (i6 | (i6 >> 16)) + 1;
    }

    public static float norm(float f, float f2, float f3) {
        return (f3 - f) / (f2 - f);
    }

    public static int roundPositive(float f) {
        return (int) (f + 0.5f);
    }

    /* access modifiers changed from: private */
    public static class Sin {
        static final float[] table = new float[GL20.GL_COLOR_BUFFER_BIT];

        private Sin() {
        }

        static {
            for (int i = 0; i < 16384; i++) {
                table[i] = (float) Math.sin((double) (((((float) i) + 0.5f) / 16384.0f) * 6.2831855f));
            }
            for (int i2 = 0; i2 < 360; i2 += 90) {
                float f = (float) i2;
                table[((int) (MathUtils.degToIndex * f)) & MathUtils.SIN_MASK] = (float) Math.sin((double) (f * 0.017453292f));
            }
        }
    }

    public static float sin(float f) {
        return Sin.table[((int) (f * radToIndex)) & SIN_MASK];
    }

    public static float cos(float f) {
        return Sin.table[((int) ((f + 1.5707964f) * radToIndex)) & SIN_MASK];
    }

    public static float sinDeg(float f) {
        return Sin.table[((int) (f * degToIndex)) & SIN_MASK];
    }

    public static float cosDeg(float f) {
        return Sin.table[((int) ((f + 90.0f) * degToIndex)) & SIN_MASK];
    }

    public static float atan2(float f, float f2) {
        if (f2 != 0.0f) {
            float f3 = f / f2;
            float f4 = 3.1415927f;
            if (Math.abs(f3) < 1.0f) {
                float f5 = f3 / (((0.28f * f3) * f3) + 1.0f);
                if (f2 >= 0.0f) {
                    return f5;
                }
                if (f < 0.0f) {
                    f4 = -3.1415927f;
                }
                return f5 + f4;
            }
            float f6 = 1.5707964f - (f3 / ((f3 * f3) + 0.28f));
            return f < 0.0f ? f6 - 3.1415927f : f6;
        } else if (f > 0.0f) {
            return 1.5707964f;
        } else {
            return f == 0.0f ? 0.0f : -1.5707964f;
        }
    }

    public static int random(int i) {
        return random.nextInt(i + 1);
    }

    public static int random(int i, int i2) {
        return i + random.nextInt((i2 - i) + 1);
    }

    public static long random(long j) {
        double nextDouble = random.nextDouble();
        double d = (double) j;
        Double.isNaN(d);
        return (long) (nextDouble * d);
    }

    public static long random(long j, long j2) {
        double nextDouble = random.nextDouble();
        double d = (double) (j2 - j);
        Double.isNaN(d);
        return j + ((long) (nextDouble * d));
    }

    public static boolean randomBoolean() {
        return random.nextBoolean();
    }

    public static boolean randomBoolean(float f) {
        return random() < f;
    }

    public static float random() {
        return random.nextFloat();
    }

    public static float random(float f) {
        return random.nextFloat() * f;
    }

    public static float random(float f, float f2) {
        return f + (random.nextFloat() * (f2 - f));
    }

    public static int randomSign() {
        return (random.nextInt() >> 31) | 1;
    }

    public static float randomTriangular() {
        return random.nextFloat() - random.nextFloat();
    }

    public static float randomTriangular(float f) {
        return (random.nextFloat() - random.nextFloat()) * f;
    }

    public static float randomTriangular(float f, float f2) {
        return randomTriangular(f, f2, (f + f2) * 0.5f);
    }

    public static float randomTriangular(float f, float f2, float f3) {
        float nextFloat = random.nextFloat();
        float f4 = f2 - f;
        float f5 = f3 - f;
        if (nextFloat <= f5 / f4) {
            return f + ((float) Math.sqrt((double) (nextFloat * f4 * f5)));
        }
        return f2 - ((float) Math.sqrt((double) (((1.0f - nextFloat) * f4) * (f2 - f3))));
    }

    public static int floor(float f) {
        double d = (double) f;
        Double.isNaN(d);
        return ((int) (d + BIG_ENOUGH_FLOOR)) - 16384;
    }

    public static int ceil(float f) {
        double d = (double) f;
        Double.isNaN(d);
        return 16384 - ((int) (BIG_ENOUGH_FLOOR - d));
    }

    public static int ceilPositive(float f) {
        double d = (double) f;
        Double.isNaN(d);
        return (int) (d + CEIL);
    }

    public static int round(float f) {
        double d = (double) f;
        Double.isNaN(d);
        return ((int) (d + BIG_ENOUGH_ROUND)) - 16384;
    }

    public static boolean isZero(float f) {
        return Math.abs(f) <= 1.0E-6f;
    }

    public static boolean isZero(float f, float f2) {
        return Math.abs(f) <= f2;
    }

    public static boolean isEqual(float f, float f2) {
        return Math.abs(f - f2) <= 1.0E-6f;
    }

    public static boolean isEqual(float f, float f2, float f3) {
        return Math.abs(f - f2) <= f3;
    }

    public static float log(float f, float f2) {
        return (float) (Math.log((double) f2) / Math.log((double) f));
    }

    public static float log2(float f) {
        return log(2.0f, f);
    }
}
