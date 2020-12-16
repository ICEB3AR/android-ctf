package com.badlogic.gdx.math;

public class Polygon implements Shape2D {
    private Rectangle bounds;
    private boolean dirty;
    private float[] localVertices;
    private float originX;
    private float originY;
    private float rotation;
    private float scaleX;
    private float scaleY;
    private float[] worldVertices;
    private float x;
    private float y;

    public Polygon() {
        this.scaleX = 1.0f;
        this.scaleY = 1.0f;
        this.dirty = true;
        this.localVertices = new float[0];
    }

    public Polygon(float[] fArr) {
        this.scaleX = 1.0f;
        this.scaleY = 1.0f;
        this.dirty = true;
        if (fArr.length >= 6) {
            this.localVertices = fArr;
            return;
        }
        throw new IllegalArgumentException("polygons must contain at least 3 points.");
    }

    public float[] getVertices() {
        return this.localVertices;
    }

    public float[] getTransformedVertices() {
        if (!this.dirty) {
            return this.worldVertices;
        }
        this.dirty = false;
        float[] fArr = this.localVertices;
        float[] fArr2 = this.worldVertices;
        if (fArr2 == null || fArr2.length != fArr.length) {
            this.worldVertices = new float[fArr.length];
        }
        float[] fArr3 = this.worldVertices;
        float f = this.x;
        float f2 = this.y;
        float f3 = this.originX;
        float f4 = this.originY;
        float f5 = this.scaleX;
        float f6 = this.scaleY;
        boolean z = (f5 == 1.0f && f6 == 1.0f) ? false : true;
        float f7 = this.rotation;
        float cosDeg = MathUtils.cosDeg(f7);
        float sinDeg = MathUtils.sinDeg(f7);
        int length = fArr.length;
        for (int i = 0; i < length; i += 2) {
            float f8 = fArr[i] - f3;
            int i2 = i + 1;
            float f9 = fArr[i2] - f4;
            if (z) {
                f8 *= f5;
                f9 *= f6;
            }
            if (f7 != 0.0f) {
                f9 = (f8 * sinDeg) + (f9 * cosDeg);
                f8 = (cosDeg * f8) - (sinDeg * f9);
            }
            fArr3[i] = f8 + f + f3;
            fArr3[i2] = f2 + f9 + f4;
        }
        return fArr3;
    }

    public void setOrigin(float f, float f2) {
        this.originX = f;
        this.originY = f2;
        this.dirty = true;
    }

    public void setPosition(float f, float f2) {
        this.x = f;
        this.y = f2;
        this.dirty = true;
    }

    public void setVertices(float[] fArr) {
        if (fArr.length >= 6) {
            this.localVertices = fArr;
            this.dirty = true;
            return;
        }
        throw new IllegalArgumentException("polygons must contain at least 3 points.");
    }

    public void translate(float f, float f2) {
        this.x += f;
        this.y += f2;
        this.dirty = true;
    }

    public void setRotation(float f) {
        this.rotation = f;
        this.dirty = true;
    }

    public void rotate(float f) {
        this.rotation += f;
        this.dirty = true;
    }

    public void setScale(float f, float f2) {
        this.scaleX = f;
        this.scaleY = f2;
        this.dirty = true;
    }

    public void scale(float f) {
        this.scaleX += f;
        this.scaleY += f;
        this.dirty = true;
    }

    public void dirty() {
        this.dirty = true;
    }

    public float area() {
        float[] transformedVertices = getTransformedVertices();
        return GeometryUtils.polygonArea(transformedVertices, 0, transformedVertices.length);
    }

    public Rectangle getBoundingRectangle() {
        float[] transformedVertices = getTransformedVertices();
        float f = transformedVertices[0];
        float f2 = transformedVertices[1];
        float f3 = transformedVertices[0];
        float f4 = transformedVertices[1];
        int length = transformedVertices.length;
        for (int i = 2; i < length; i += 2) {
            if (f > transformedVertices[i]) {
                f = transformedVertices[i];
            }
            int i2 = i + 1;
            if (f2 > transformedVertices[i2]) {
                f2 = transformedVertices[i2];
            }
            if (f3 < transformedVertices[i]) {
                f3 = transformedVertices[i];
            }
            if (f4 < transformedVertices[i2]) {
                f4 = transformedVertices[i2];
            }
        }
        if (this.bounds == null) {
            this.bounds = new Rectangle();
        }
        Rectangle rectangle = this.bounds;
        rectangle.x = f;
        rectangle.y = f2;
        rectangle.width = f3 - f;
        rectangle.height = f4 - f2;
        return rectangle;
    }

    @Override // com.badlogic.gdx.math.Shape2D
    public boolean contains(float f, float f2) {
        float[] transformedVertices = getTransformedVertices();
        int length = transformedVertices.length;
        int i = 0;
        int i2 = 0;
        while (i < length) {
            float f3 = transformedVertices[i];
            float f4 = transformedVertices[i + 1];
            int i3 = i + 2;
            float f5 = transformedVertices[i3 % length];
            float f6 = transformedVertices[(i + 3) % length];
            if (((f4 <= f2 && f2 < f6) || (f6 <= f2 && f2 < f4)) && f < (((f5 - f3) / (f6 - f4)) * (f2 - f4)) + f3) {
                i2++;
            }
            i = i3;
        }
        return (i2 & 1) == 1;
    }

    @Override // com.badlogic.gdx.math.Shape2D
    public boolean contains(Vector2 vector2) {
        return contains(vector2.x, vector2.y);
    }

    public float getX() {
        return this.x;
    }

    public float getY() {
        return this.y;
    }

    public float getOriginX() {
        return this.originX;
    }

    public float getOriginY() {
        return this.originY;
    }

    public float getRotation() {
        return this.rotation;
    }

    public float getScaleX() {
        return this.scaleX;
    }

    public float getScaleY() {
        return this.scaleY;
    }
}
