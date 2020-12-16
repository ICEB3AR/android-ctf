package com.brashmonkey.spriter;

public class Interpolator {
    private static float bezier0(float f) {
        float f2 = f * f;
        return ((((-f2) * f) + (f2 * 3.0f)) - (f * 3.0f)) + 1.0f;
    }

    private static float bezier1(float f) {
        float f2 = f * f;
        float f3 = f * 3.0f;
        return ((f3 * f2) - (f2 * 6.0f)) + f3;
    }

    private static float bezier2(float f) {
        float f2 = f * f;
        return (-3.0f * f2 * f) + (f2 * 3.0f);
    }

    private static float bezier3(float f) {
        return f * f * f;
    }

    public static float linear(float f, float f2, float f3) {
        return f + ((f2 - f) * f3);
    }

    public static float linearAngle(float f, float f2, float f3) {
        return f + (Calculator.angleDifference(f2, f) * f3);
    }

    public static float quadratic(float f, float f2, float f3, float f4) {
        return linear(linear(f, f2, f4), linear(f2, f3, f4), f4);
    }

    public static float quadraticAngle(float f, float f2, float f3, float f4) {
        return linearAngle(linearAngle(f, f2, f4), linearAngle(f2, f3, f4), f4);
    }

    public static float cubic(float f, float f2, float f3, float f4, float f5) {
        return linear(quadratic(f, f2, f3, f5), quadratic(f2, f3, f4, f5), f5);
    }

    public static float cubicAngle(float f, float f2, float f3, float f4, float f5) {
        return linearAngle(quadraticAngle(f, f2, f3, f5), quadraticAngle(f2, f3, f4, f5), f5);
    }

    public static float quartic(float f, float f2, float f3, float f4, float f5, float f6) {
        return linear(cubic(f, f2, f3, f4, f6), cubic(f2, f3, f4, f5, f6), f6);
    }

    public static float quarticAngle(float f, float f2, float f3, float f4, float f5, float f6) {
        return linearAngle(cubicAngle(f, f2, f3, f4, f6), cubicAngle(f2, f3, f4, f5, f6), f6);
    }

    public static float quintic(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        return linear(quartic(f, f2, f3, f4, f5, f7), quartic(f2, f3, f4, f5, f6, f7), f7);
    }

    public static float quinticAngle(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        return linearAngle(quarticAngle(f, f2, f3, f4, f5, f7), quarticAngle(f2, f3, f4, f5, f6, f7), f7);
    }

    public static float bezier(float f, float f2, float f3, float f4, float f5) {
        return (bezier0(f) * f2) + (bezier1(f) * f3) + (bezier2(f) * f4) + (bezier3(f) * f5);
    }
}
