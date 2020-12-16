package com.brashmonkey.spriter;

public class Curve {
    public final Constraints constraints;
    private float lastCubicSolution;
    public Curve subCurve;
    private Type type;

    public enum Type {
        Instant,
        Linear,
        Quadratic,
        Cubic,
        Quartic,
        Quintic,
        Bezier
    }

    public static Type getType(String str) {
        if (str.equals("instant")) {
            return Type.Instant;
        }
        if (str.equals("quadratic")) {
            return Type.Quadratic;
        }
        if (str.equals("cubic")) {
            return Type.Cubic;
        }
        if (str.equals("quartic")) {
            return Type.Quartic;
        }
        if (str.equals("quintic")) {
            return Type.Quintic;
        }
        if (str.equals("bezier")) {
            return Type.Bezier;
        }
        return Type.Linear;
    }

    public Curve() {
        this(Type.Linear);
    }

    public Curve(Type type2) {
        this(type2, null);
    }

    public Curve(Type type2, Curve curve) {
        this.constraints = new Constraints(0.0f, 0.0f, 0.0f, 0.0f);
        this.lastCubicSolution = 0.0f;
        setType(type2);
        this.subCurve = curve;
    }

    public void setType(Type type2) {
        if (type2 != null) {
            this.type = type2;
            return;
        }
        throw new SpriterException("The type of a curve cannot be null!");
    }

    public Type getType() {
        return this.type;
    }

    public float tween(float f, float f2, float f3) {
        float tweenSub = tweenSub(0.0f, 1.0f, f3);
        switch (this.type) {
            case Instant:
                return f;
            case Linear:
                return Interpolator.linear(f, f2, tweenSub);
            case Quadratic:
                return Interpolator.quadratic(f, Interpolator.linear(f, f2, this.constraints.c1), f2, tweenSub);
            case Cubic:
                return Interpolator.cubic(f, Interpolator.linear(f, f2, this.constraints.c1), Interpolator.linear(f, f2, this.constraints.c2), f2, tweenSub);
            case Quartic:
                return Interpolator.quartic(f, Interpolator.linear(f, f2, this.constraints.c1), Interpolator.linear(f, f2, this.constraints.c2), Interpolator.linear(f, f2, this.constraints.c3), f2, tweenSub);
            case Quintic:
                return Interpolator.quintic(f, Interpolator.linear(f, f2, this.constraints.c1), Interpolator.linear(f, f2, this.constraints.c2), Interpolator.linear(f, f2, this.constraints.c3), Interpolator.linear(f, f2, this.constraints.c4), f2, tweenSub);
            case Bezier:
                Float solveCubic = Calculator.solveCubic(((this.constraints.c1 - this.constraints.c3) * 3.0f) + 1.0f, (this.constraints.c3 - (this.constraints.c1 * 2.0f)) * 3.0f, this.constraints.c1 * 3.0f, -tweenSub);
                if (solveCubic == null) {
                    solveCubic = Float.valueOf(this.lastCubicSolution);
                } else {
                    this.lastCubicSolution = solveCubic.floatValue();
                }
                return Interpolator.linear(f, f2, Interpolator.bezier(solveCubic.floatValue(), 0.0f, this.constraints.c2, this.constraints.c4, 1.0f));
            default:
                return Interpolator.linear(f, f2, tweenSub);
        }
    }

    public void tweenPoint(Point point, Point point2, float f, Point point3) {
        point3.set(tween(point.x, point2.x, f), tween(point.y, point2.y, f));
    }

    private float tweenSub(float f, float f2, float f3) {
        Curve curve = this.subCurve;
        return curve != null ? curve.tween(f, f2, f3) : f3;
    }

    public float tweenAngle(float f, float f2, float f3, int i) {
        if (i > 0) {
            if (f2 - f < 0.0f) {
                f2 += 360.0f;
            }
        } else if (i >= 0) {
            return f;
        } else {
            if (f2 - f > 0.0f) {
                f2 -= 360.0f;
            }
        }
        return tween(f, f2, f3);
    }

    public float tweenAngle(float f, float f2, float f3) {
        float tweenSub = tweenSub(0.0f, 1.0f, f3);
        switch (this.type) {
            case Instant:
                return f;
            case Linear:
                return Interpolator.linearAngle(f, f2, tweenSub);
            case Quadratic:
                return Interpolator.quadraticAngle(f, Interpolator.linearAngle(f, f2, this.constraints.c1), f2, tweenSub);
            case Cubic:
                return Interpolator.cubicAngle(f, Interpolator.linearAngle(f, f2, this.constraints.c1), Interpolator.linearAngle(f, f2, this.constraints.c2), f2, tweenSub);
            case Quartic:
                return Interpolator.quarticAngle(f, Interpolator.linearAngle(f, f2, this.constraints.c1), Interpolator.linearAngle(f, f2, this.constraints.c2), Interpolator.linearAngle(f, f2, this.constraints.c3), f2, tweenSub);
            case Quintic:
                return Interpolator.quinticAngle(f, Interpolator.linearAngle(f, f2, this.constraints.c1), Interpolator.linearAngle(f, f2, this.constraints.c2), Interpolator.linearAngle(f, f2, this.constraints.c3), Interpolator.linearAngle(f, f2, this.constraints.c4), f2, tweenSub);
            case Bezier:
                Float solveCubic = Calculator.solveCubic(((this.constraints.c1 - this.constraints.c3) * 3.0f) + 1.0f, (this.constraints.c3 - (this.constraints.c1 * 2.0f)) * 3.0f, this.constraints.c1 * 3.0f, -tweenSub);
                if (solveCubic == null) {
                    solveCubic = Float.valueOf(this.lastCubicSolution);
                } else {
                    this.lastCubicSolution = solveCubic.floatValue();
                }
                return Interpolator.linearAngle(f, f2, Interpolator.bezier(solveCubic.floatValue(), 0.0f, this.constraints.c2, this.constraints.c4, 1.0f));
            default:
                return Interpolator.linearAngle(f, f2, tweenSub);
        }
    }

    public String toString() {
        return getClass().getSimpleName() + "|[" + this.type + ":" + this.constraints + ", subCurve: " + this.subCurve + "]";
    }

    public static class Constraints {
        public float c1;
        public float c2;
        public float c3;
        public float c4;

        public Constraints(float f, float f2, float f3, float f4) {
            set(f, f2, f3, f4);
        }

        public void set(float f, float f2, float f3, float f4) {
            this.c1 = f;
            this.c2 = f2;
            this.c3 = f3;
            this.c4 = f4;
        }

        public String toString() {
            return getClass().getSimpleName() + "| [c1:" + this.c1 + ", c2:" + this.c2 + ", c3:" + this.c3 + ", c4:" + this.c4 + "]";
        }
    }
}
