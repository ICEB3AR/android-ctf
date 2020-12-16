package com.brashmonkey.spriter;

public class Dimension {
    public float height;
    public float width;

    public Dimension(float f, float f2) {
        set(f, f2);
    }

    public Dimension(Dimension dimension) {
        set(dimension);
    }

    public void set(float f, float f2) {
        this.width = f;
        this.height = f2;
    }

    public void set(Dimension dimension) {
        set(dimension.width, dimension.height);
    }

    public String toString() {
        return "[" + this.width + "x" + this.height + "]";
    }
}
