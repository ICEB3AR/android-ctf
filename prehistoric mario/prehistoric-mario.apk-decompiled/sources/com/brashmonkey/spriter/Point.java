package com.brashmonkey.spriter;

public class Point {
    public float x;
    public float y;

    public Point() {
        this(0.0f, 0.0f);
    }

    public Point(Point point) {
        this(point.x, point.y);
    }

    public Point(float f, float f2) {
        set(f, f2);
    }

    public Point set(float f, float f2) {
        this.x = f;
        this.y = f2;
        return this;
    }

    public Point translate(float f, float f2) {
        return set(this.x + f, this.y + f2);
    }

    public Point scale(float f, float f2) {
        return set(this.x * f, this.y * f2);
    }

    public Point set(Point point) {
        return set(point.x, point.y);
    }

    public Point translate(Point point) {
        return translate(point.x, point.y);
    }

    public Point scale(Point point) {
        return scale(point.x, point.y);
    }

    public Point rotate(float f) {
        if (!(this.x == 0.0f && this.y == 0.0f)) {
            float cosDeg = Calculator.cosDeg(f);
            float sinDeg = Calculator.sinDeg(f);
            float f2 = this.x;
            float f3 = this.y;
            this.x = (f2 * cosDeg) - (f3 * sinDeg);
            this.y = (f2 * sinDeg) + (f3 * cosDeg);
        }
        return this;
    }

    public Point copy() {
        return new Point(this.x, this.y);
    }

    public String toString() {
        return "[" + this.x + "," + this.y + "]";
    }
}
