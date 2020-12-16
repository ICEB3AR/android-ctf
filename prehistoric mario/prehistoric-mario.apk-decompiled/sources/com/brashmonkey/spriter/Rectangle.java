package com.brashmonkey.spriter;

public class Rectangle {
    public float bottom;
    public float left;
    public float right;
    public final Dimension size;
    public float top;

    public Rectangle(float f, float f2, float f3, float f4) {
        set(f, f2, f3, f4);
        this.size = new Dimension(0.0f, 0.0f);
        calculateSize();
    }

    public Rectangle(Rectangle rectangle) {
        this(rectangle.left, rectangle.top, rectangle.right, rectangle.bottom);
    }

    public boolean isInside(float f, float f2) {
        return f >= this.left && f <= this.right && f2 <= this.top && f2 >= this.bottom;
    }

    public boolean isInside(Point point) {
        return isInside(point.x, point.y);
    }

    public void calculateSize() {
        this.size.set(this.right - this.left, this.top - this.bottom);
    }

    public void set(Rectangle rectangle) {
        if (rectangle != null) {
            this.bottom = rectangle.bottom;
            this.left = rectangle.left;
            this.right = rectangle.right;
            this.top = rectangle.top;
            calculateSize();
        }
    }

    public void set(float f, float f2, float f3, float f4) {
        this.left = f;
        this.top = f2;
        this.right = f3;
        this.bottom = f4;
    }

    public static boolean areIntersecting(Rectangle rectangle, Rectangle rectangle2) {
        return rectangle.isInside(rectangle2.left, rectangle2.top) || rectangle.isInside(rectangle2.right, rectangle2.top) || rectangle.isInside(rectangle2.left, rectangle2.bottom) || rectangle.isInside(rectangle2.right, rectangle2.bottom);
    }

    public static void setBiggerRectangle(Rectangle rectangle, Rectangle rectangle2, Rectangle rectangle3) {
        rectangle3.left = Math.min(rectangle.left, rectangle2.left);
        rectangle3.bottom = Math.min(rectangle.bottom, rectangle2.bottom);
        rectangle3.right = Math.max(rectangle.right, rectangle2.right);
        rectangle3.top = Math.max(rectangle.top, rectangle2.top);
    }
}
