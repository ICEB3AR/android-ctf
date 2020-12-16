package com.badlogic.gdx.math;

import com.badlogic.gdx.utils.NumberUtils;
import java.io.Serializable;

public class Quaternion implements Serializable {
    private static final long serialVersionUID = -7661875440774897168L;
    private static Quaternion tmp1 = new Quaternion(0.0f, 0.0f, 0.0f, 0.0f);
    private static Quaternion tmp2 = new Quaternion(0.0f, 0.0f, 0.0f, 0.0f);
    public float w;
    public float x;
    public float y;
    public float z;

    public static final float dot(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        return (f * f5) + (f2 * f6) + (f3 * f7) + (f4 * f8);
    }

    public static final float len2(float f, float f2, float f3, float f4) {
        return (f * f) + (f2 * f2) + (f3 * f3) + (f4 * f4);
    }

    public Quaternion(float f, float f2, float f3, float f4) {
        set(f, f2, f3, f4);
    }

    public Quaternion() {
        idt();
    }

    public Quaternion(Quaternion quaternion) {
        set(quaternion);
    }

    public Quaternion(Vector3 vector3, float f) {
        set(vector3, f);
    }

    public Quaternion set(float f, float f2, float f3, float f4) {
        this.x = f;
        this.y = f2;
        this.z = f3;
        this.w = f4;
        return this;
    }

    public Quaternion set(Quaternion quaternion) {
        return set(quaternion.x, quaternion.y, quaternion.z, quaternion.w);
    }

    public Quaternion set(Vector3 vector3, float f) {
        return setFromAxis(vector3.x, vector3.y, vector3.z, f);
    }

    public Quaternion cpy() {
        return new Quaternion(this);
    }

    public static final float len(float f, float f2, float f3, float f4) {
        return (float) Math.sqrt((double) ((f * f) + (f2 * f2) + (f3 * f3) + (f4 * f4)));
    }

    public float len() {
        float f = this.x;
        float f2 = this.y;
        float f3 = (f * f) + (f2 * f2);
        float f4 = this.z;
        float f5 = f3 + (f4 * f4);
        float f6 = this.w;
        return (float) Math.sqrt((double) (f5 + (f6 * f6)));
    }

    public String toString() {
        return "[" + this.x + "|" + this.y + "|" + this.z + "|" + this.w + "]";
    }

    public Quaternion setEulerAngles(float f, float f2, float f3) {
        return setEulerAnglesRad(f * 0.017453292f, f2 * 0.017453292f, f3 * 0.017453292f);
    }

    public Quaternion setEulerAnglesRad(float f, float f2, float f3) {
        double d = (double) (f3 * 0.5f);
        float sin = (float) Math.sin(d);
        float cos = (float) Math.cos(d);
        double d2 = (double) (f2 * 0.5f);
        float sin2 = (float) Math.sin(d2);
        float cos2 = (float) Math.cos(d2);
        double d3 = (double) (f * 0.5f);
        float sin3 = (float) Math.sin(d3);
        float cos3 = (float) Math.cos(d3);
        float f4 = cos3 * sin2;
        float f5 = sin3 * cos2;
        float f6 = cos3 * cos2;
        float f7 = sin3 * sin2;
        this.x = (f4 * cos) + (f5 * sin);
        this.y = (f5 * cos) - (f4 * sin);
        this.z = (f6 * sin) - (f7 * cos);
        this.w = (f6 * cos) + (f7 * sin);
        return this;
    }

    public int getGimbalPole() {
        float f = (this.y * this.x) + (this.z * this.w);
        if (f > 0.499f) {
            return 1;
        }
        return f < -0.499f ? -1 : 0;
    }

    public float getRollRad() {
        int gimbalPole = getGimbalPole();
        if (gimbalPole != 0) {
            return ((float) gimbalPole) * 2.0f * MathUtils.atan2(this.y, this.w);
        }
        float f = this.w;
        float f2 = this.z;
        float f3 = this.y;
        float f4 = this.x;
        return MathUtils.atan2(((f * f2) + (f3 * f4)) * 2.0f, 1.0f - (((f4 * f4) + (f2 * f2)) * 2.0f));
    }

    public float getRoll() {
        return getRollRad() * 57.295776f;
    }

    public float getPitchRad() {
        int gimbalPole = getGimbalPole();
        return gimbalPole == 0 ? (float) Math.asin((double) MathUtils.clamp(((this.w * this.x) - (this.z * this.y)) * 2.0f, -1.0f, 1.0f)) : ((float) gimbalPole) * 3.1415927f * 0.5f;
    }

    public float getPitch() {
        return getPitchRad() * 57.295776f;
    }

    public float getYawRad() {
        if (getGimbalPole() != 0) {
            return 0.0f;
        }
        float f = this.y;
        float f2 = this.x;
        return MathUtils.atan2(((this.w * f) + (this.z * f2)) * 2.0f, 1.0f - (((f * f) + (f2 * f2)) * 2.0f));
    }

    public float getYaw() {
        return getYawRad() * 57.295776f;
    }

    public float len2() {
        float f = this.x;
        float f2 = this.y;
        float f3 = (f * f) + (f2 * f2);
        float f4 = this.z;
        float f5 = f3 + (f4 * f4);
        float f6 = this.w;
        return f5 + (f6 * f6);
    }

    public Quaternion nor() {
        float len2 = len2();
        if (len2 != 0.0f && !MathUtils.isEqual(len2, 1.0f)) {
            float sqrt = (float) Math.sqrt((double) len2);
            this.w /= sqrt;
            this.x /= sqrt;
            this.y /= sqrt;
            this.z /= sqrt;
        }
        return this;
    }

    public Quaternion conjugate() {
        this.x = -this.x;
        this.y = -this.y;
        this.z = -this.z;
        return this;
    }

    public Vector3 transform(Vector3 vector3) {
        tmp2.set(this);
        tmp2.conjugate();
        tmp2.mulLeft(tmp1.set(vector3.x, vector3.y, vector3.z, 0.0f)).mulLeft(this);
        Quaternion quaternion = tmp2;
        vector3.x = quaternion.x;
        vector3.y = quaternion.y;
        vector3.z = quaternion.z;
        return vector3;
    }

    public Quaternion mul(Quaternion quaternion) {
        float f = this.w;
        float f2 = quaternion.x;
        float f3 = this.x;
        float f4 = quaternion.w;
        float f5 = this.y;
        float f6 = quaternion.z;
        float f7 = this.z;
        float f8 = quaternion.y;
        this.x = (((f * f2) + (f3 * f4)) + (f5 * f6)) - (f7 * f8);
        this.y = (((f * f8) + (f5 * f4)) + (f7 * f2)) - (f3 * f6);
        this.z = (((f * f6) + (f7 * f4)) + (f3 * f8)) - (f5 * f2);
        this.w = (((f * f4) - (f3 * f2)) - (f5 * f8)) - (f7 * f6);
        return this;
    }

    public Quaternion mul(float f, float f2, float f3, float f4) {
        float f5 = this.w;
        float f6 = this.x;
        float f7 = this.y;
        float f8 = this.z;
        this.x = (((f5 * f) + (f6 * f4)) + (f7 * f3)) - (f8 * f2);
        this.y = (((f5 * f2) + (f7 * f4)) + (f8 * f)) - (f6 * f3);
        this.z = (((f5 * f3) + (f8 * f4)) + (f6 * f2)) - (f7 * f);
        this.w = (((f5 * f4) - (f6 * f)) - (f7 * f2)) - (f8 * f3);
        return this;
    }

    public Quaternion mulLeft(Quaternion quaternion) {
        float f = quaternion.w;
        float f2 = this.x;
        float f3 = quaternion.x;
        float f4 = this.w;
        float f5 = quaternion.y;
        float f6 = this.z;
        float f7 = quaternion.z;
        float f8 = this.y;
        this.x = (((f * f2) + (f3 * f4)) + (f5 * f6)) - (f7 * f8);
        this.y = (((f * f8) + (f5 * f4)) + (f7 * f2)) - (f3 * f6);
        this.z = (((f * f6) + (f7 * f4)) + (f3 * f8)) - (f5 * f2);
        this.w = (((f * f4) - (f3 * f2)) - (f5 * f8)) - (f7 * f6);
        return this;
    }

    public Quaternion mulLeft(float f, float f2, float f3, float f4) {
        float f5 = this.x;
        float f6 = this.w;
        float f7 = this.z;
        float f8 = this.y;
        this.x = (((f4 * f5) + (f * f6)) + (f2 * f7)) - (f3 * f8);
        this.y = (((f4 * f8) + (f2 * f6)) + (f3 * f5)) - (f * f7);
        this.z = (((f4 * f7) + (f3 * f6)) + (f * f8)) - (f2 * f5);
        this.w = (((f4 * f6) - (f * f5)) - (f2 * f8)) - (f3 * f7);
        return this;
    }

    public Quaternion add(Quaternion quaternion) {
        this.x += quaternion.x;
        this.y += quaternion.y;
        this.z += quaternion.z;
        this.w += quaternion.w;
        return this;
    }

    public Quaternion add(float f, float f2, float f3, float f4) {
        this.x += f;
        this.y += f2;
        this.z += f3;
        this.w += f4;
        return this;
    }

    public void toMatrix(float[] fArr) {
        float f = this.x;
        float f2 = f * f;
        float f3 = this.y;
        float f4 = f * f3;
        float f5 = this.z;
        float f6 = f * f5;
        float f7 = this.w;
        float f8 = f * f7;
        float f9 = f3 * f3;
        float f10 = f3 * f5;
        float f11 = f3 * f7;
        float f12 = f5 * f5;
        float f13 = f5 * f7;
        fArr[0] = 1.0f - ((f9 + f12) * 2.0f);
        fArr[4] = (f4 - f13) * 2.0f;
        fArr[8] = (f6 + f11) * 2.0f;
        fArr[12] = 0.0f;
        fArr[1] = (f4 + f13) * 2.0f;
        fArr[5] = 1.0f - ((f12 + f2) * 2.0f);
        fArr[9] = (f10 - f8) * 2.0f;
        fArr[13] = 0.0f;
        fArr[2] = (f6 - f11) * 2.0f;
        fArr[6] = (f10 + f8) * 2.0f;
        fArr[10] = 1.0f - ((f2 + f9) * 2.0f);
        fArr[14] = 0.0f;
        fArr[3] = 0.0f;
        fArr[7] = 0.0f;
        fArr[11] = 0.0f;
        fArr[15] = 1.0f;
    }

    public Quaternion idt() {
        return set(0.0f, 0.0f, 0.0f, 1.0f);
    }

    public boolean isIdentity() {
        return MathUtils.isZero(this.x) && MathUtils.isZero(this.y) && MathUtils.isZero(this.z) && MathUtils.isEqual(this.w, 1.0f);
    }

    public boolean isIdentity(float f) {
        return MathUtils.isZero(this.x, f) && MathUtils.isZero(this.y, f) && MathUtils.isZero(this.z, f) && MathUtils.isEqual(this.w, 1.0f, f);
    }

    public Quaternion setFromAxis(Vector3 vector3, float f) {
        return setFromAxis(vector3.x, vector3.y, vector3.z, f);
    }

    public Quaternion setFromAxisRad(Vector3 vector3, float f) {
        return setFromAxisRad(vector3.x, vector3.y, vector3.z, f);
    }

    public Quaternion setFromAxis(float f, float f2, float f3, float f4) {
        return setFromAxisRad(f, f2, f3, f4 * 0.017453292f);
    }

    public Quaternion setFromAxisRad(float f, float f2, float f3, float f4) {
        float len = Vector3.len(f, f2, f3);
        if (len == 0.0f) {
            return idt();
        }
        float f5 = 1.0f / len;
        double d = (double) ((f4 < 0.0f ? 6.2831855f - ((-f4) % 6.2831855f) : f4 % 6.2831855f) / 2.0f);
        float sin = (float) Math.sin(d);
        return set(f * f5 * sin, f2 * f5 * sin, f5 * f3 * sin, (float) Math.cos(d)).nor();
    }

    public Quaternion setFromMatrix(boolean z2, Matrix4 matrix4) {
        return setFromAxes(z2, matrix4.val[0], matrix4.val[4], matrix4.val[8], matrix4.val[1], matrix4.val[5], matrix4.val[9], matrix4.val[2], matrix4.val[6], matrix4.val[10]);
    }

    public Quaternion setFromMatrix(Matrix4 matrix4) {
        return setFromMatrix(false, matrix4);
    }

    public Quaternion setFromMatrix(boolean z2, Matrix3 matrix3) {
        return setFromAxes(z2, matrix3.val[0], matrix3.val[3], matrix3.val[6], matrix3.val[1], matrix3.val[4], matrix3.val[7], matrix3.val[2], matrix3.val[5], matrix3.val[8]);
    }

    public Quaternion setFromMatrix(Matrix3 matrix3) {
        return setFromMatrix(false, matrix3);
    }

    public Quaternion setFromAxes(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9) {
        return setFromAxes(false, f, f2, f3, f4, f5, f6, f7, f8, f9);
    }

    public Quaternion setFromAxes(boolean z2, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9) {
        if (z2) {
            float len = 1.0f / Vector3.len(f, f2, f3);
            float len2 = 1.0f / Vector3.len(f4, f5, f6);
            float len3 = 1.0f / Vector3.len(f7, f8, f9);
            f *= len;
            f2 *= len;
            f3 *= len;
            f4 *= len2;
            f5 *= len2;
            f6 *= len2;
            f7 *= len3;
            f8 *= len3;
            f9 *= len3;
        }
        float f10 = f + f5 + f9;
        if (f10 >= 0.0f) {
            float sqrt = (float) Math.sqrt((double) (f10 + 1.0f));
            this.w = sqrt * 0.5f;
            float f11 = 0.5f / sqrt;
            this.x = (f8 - f6) * f11;
            this.y = (f3 - f7) * f11;
            this.z = (f4 - f2) * f11;
        } else if (f > f5 && f > f9) {
            double d = (double) f;
            Double.isNaN(d);
            double d2 = (double) f5;
            Double.isNaN(d2);
            double d3 = (d + 1.0d) - d2;
            double d4 = (double) f9;
            Double.isNaN(d4);
            float sqrt2 = (float) Math.sqrt(d3 - d4);
            this.x = sqrt2 * 0.5f;
            float f12 = 0.5f / sqrt2;
            this.y = (f4 + f2) * f12;
            this.z = (f3 + f7) * f12;
            this.w = (f8 - f6) * f12;
        } else if (f5 > f9) {
            double d5 = (double) f5;
            Double.isNaN(d5);
            double d6 = (double) f;
            Double.isNaN(d6);
            double d7 = (d5 + 1.0d) - d6;
            double d8 = (double) f9;
            Double.isNaN(d8);
            float sqrt3 = (float) Math.sqrt(d7 - d8);
            this.y = sqrt3 * 0.5f;
            float f13 = 0.5f / sqrt3;
            this.x = (f4 + f2) * f13;
            this.z = (f8 + f6) * f13;
            this.w = (f3 - f7) * f13;
        } else {
            double d9 = (double) f9;
            Double.isNaN(d9);
            double d10 = (double) f;
            Double.isNaN(d10);
            double d11 = (d9 + 1.0d) - d10;
            double d12 = (double) f5;
            Double.isNaN(d12);
            float sqrt4 = (float) Math.sqrt(d11 - d12);
            this.z = sqrt4 * 0.5f;
            float f14 = 0.5f / sqrt4;
            this.x = (f3 + f7) * f14;
            this.y = (f8 + f6) * f14;
            this.w = (f4 - f2) * f14;
        }
        return this;
    }

    public Quaternion setFromCross(Vector3 vector3, Vector3 vector32) {
        return setFromAxisRad((vector3.y * vector32.z) - (vector3.z * vector32.y), (vector3.z * vector32.x) - (vector3.x * vector32.z), (vector3.x * vector32.y) - (vector3.y * vector32.x), (float) Math.acos((double) MathUtils.clamp(vector3.dot(vector32), -1.0f, 1.0f)));
    }

    public Quaternion setFromCross(float f, float f2, float f3, float f4, float f5, float f6) {
        return setFromAxisRad((f2 * f6) - (f3 * f5), (f3 * f4) - (f6 * f), (f * f5) - (f2 * f4), (float) Math.acos((double) MathUtils.clamp(Vector3.dot(f, f2, f3, f4, f5, f6), -1.0f, 1.0f)));
    }

    public Quaternion slerp(Quaternion quaternion, float f) {
        float f2 = (this.x * quaternion.x) + (this.y * quaternion.y) + (this.z * quaternion.z) + (this.w * quaternion.w);
        float f3 = f2 < 0.0f ? -f2 : f2;
        float f4 = 1.0f - f;
        if (((double) (1.0f - f3)) > 0.1d) {
            float acos = (float) Math.acos((double) f3);
            float sin = 1.0f / ((float) Math.sin((double) acos));
            f4 = ((float) Math.sin((double) (f4 * acos))) * sin;
            f = ((float) Math.sin((double) (f * acos))) * sin;
        }
        if (f2 < 0.0f) {
            f = -f;
        }
        this.x = (this.x * f4) + (quaternion.x * f);
        this.y = (this.y * f4) + (quaternion.y * f);
        this.z = (this.z * f4) + (quaternion.z * f);
        this.w = (f4 * this.w) + (f * quaternion.w);
        return this;
    }

    public Quaternion slerp(Quaternion[] quaternionArr) {
        float length = 1.0f / ((float) quaternionArr.length);
        set(quaternionArr[0]).exp(length);
        for (int i = 1; i < quaternionArr.length; i++) {
            mul(tmp1.set(quaternionArr[i]).exp(length));
        }
        nor();
        return this;
    }

    public Quaternion slerp(Quaternion[] quaternionArr, float[] fArr) {
        set(quaternionArr[0]).exp(fArr[0]);
        for (int i = 1; i < quaternionArr.length; i++) {
            mul(tmp1.set(quaternionArr[i]).exp(fArr[i]));
        }
        nor();
        return this;
    }

    public Quaternion exp(float f) {
        float f2;
        float len = len();
        double d = (double) len;
        float pow = (float) Math.pow(d, (double) f);
        float acos = (float) Math.acos((double) (this.w / len));
        if (((double) Math.abs(acos)) < 0.001d) {
            f2 = (pow * f) / len;
        } else {
            double d2 = (double) pow;
            double sin = Math.sin((double) (f * acos));
            Double.isNaN(d2);
            double d3 = d2 * sin;
            double sin2 = Math.sin((double) acos);
            Double.isNaN(d);
            f2 = (float) (d3 / (d * sin2));
        }
        double d4 = (double) pow;
        double cos = Math.cos((double) (f * acos));
        Double.isNaN(d4);
        this.w = (float) (d4 * cos);
        this.x *= f2;
        this.y *= f2;
        this.z *= f2;
        nor();
        return this;
    }

    public int hashCode() {
        return ((((((NumberUtils.floatToRawIntBits(this.w) + 31) * 31) + NumberUtils.floatToRawIntBits(this.x)) * 31) + NumberUtils.floatToRawIntBits(this.y)) * 31) + NumberUtils.floatToRawIntBits(this.z);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof Quaternion)) {
            return false;
        }
        Quaternion quaternion = (Quaternion) obj;
        if (NumberUtils.floatToRawIntBits(this.w) == NumberUtils.floatToRawIntBits(quaternion.w) && NumberUtils.floatToRawIntBits(this.x) == NumberUtils.floatToRawIntBits(quaternion.x) && NumberUtils.floatToRawIntBits(this.y) == NumberUtils.floatToRawIntBits(quaternion.y) && NumberUtils.floatToRawIntBits(this.z) == NumberUtils.floatToRawIntBits(quaternion.z)) {
            return true;
        }
        return false;
    }

    public float dot(Quaternion quaternion) {
        return (this.x * quaternion.x) + (this.y * quaternion.y) + (this.z * quaternion.z) + (this.w * quaternion.w);
    }

    public float dot(float f, float f2, float f3, float f4) {
        return (this.x * f) + (this.y * f2) + (this.z * f3) + (this.w * f4);
    }

    public Quaternion mul(float f) {
        this.x *= f;
        this.y *= f;
        this.z *= f;
        this.w *= f;
        return this;
    }

    public float getAxisAngle(Vector3 vector3) {
        return getAxisAngleRad(vector3) * 57.295776f;
    }

    public float getAxisAngleRad(Vector3 vector3) {
        if (this.w > 1.0f) {
            nor();
        }
        float acos = (float) (Math.acos((double) this.w) * 2.0d);
        float f = this.w;
        double sqrt = Math.sqrt((double) (1.0f - (f * f)));
        if (sqrt < 9.999999974752427E-7d) {
            vector3.x = this.x;
            vector3.y = this.y;
            vector3.z = this.z;
        } else {
            double d = (double) this.x;
            Double.isNaN(d);
            vector3.x = (float) (d / sqrt);
            double d2 = (double) this.y;
            Double.isNaN(d2);
            vector3.y = (float) (d2 / sqrt);
            double d3 = (double) this.z;
            Double.isNaN(d3);
            vector3.z = (float) (d3 / sqrt);
        }
        return acos;
    }

    public float getAngleRad() {
        float f = this.w;
        if (f > 1.0f) {
            f /= len();
        }
        return (float) (Math.acos((double) f) * 2.0d);
    }

    public float getAngle() {
        return getAngleRad() * 57.295776f;
    }

    public void getSwingTwist(float f, float f2, float f3, Quaternion quaternion, Quaternion quaternion2) {
        float dot = Vector3.dot(this.x, this.y, this.z, f, f2, f3);
        quaternion2.set(f * dot, f2 * dot, f3 * dot, this.w).nor();
        if (dot < 0.0f) {
            quaternion2.mul(-1.0f);
        }
        quaternion.set(quaternion2).conjugate().mulLeft(this);
    }

    public void getSwingTwist(Vector3 vector3, Quaternion quaternion, Quaternion quaternion2) {
        getSwingTwist(vector3.x, vector3.y, vector3.z, quaternion, quaternion2);
    }

    public float getAngleAroundRad(float f, float f2, float f3) {
        float dot = Vector3.dot(this.x, this.y, this.z, f, f2, f3);
        float len2 = len2(f * dot, f2 * dot, f3 * dot, this.w);
        if (MathUtils.isZero(len2)) {
            return 0.0f;
        }
        double d = (double) (dot < 0.0f ? -this.w : this.w);
        double sqrt = Math.sqrt((double) len2);
        Double.isNaN(d);
        return (float) (Math.acos((double) MathUtils.clamp((float) (d / sqrt), -1.0f, 1.0f)) * 2.0d);
    }

    public float getAngleAroundRad(Vector3 vector3) {
        return getAngleAroundRad(vector3.x, vector3.y, vector3.z);
    }

    public float getAngleAround(float f, float f2, float f3) {
        return getAngleAroundRad(f, f2, f3) * 57.295776f;
    }

    public float getAngleAround(Vector3 vector3) {
        return getAngleAround(vector3.x, vector3.y, vector3.z);
    }
}
