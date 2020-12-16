package com.badlogic.gdx.math;

public class Polyline implements Shape2D {
    private boolean calculateLength;
    private boolean calculateScaledLength;
    private boolean dirty;
    private float length;
    private float[] localVertices;
    private float originX;
    private float originY;
    private float rotation;
    private float scaleX;
    private float scaleY;
    private float scaledLength;
    private float[] worldVertices;
    private float x;
    private float y;

    @Override // com.badlogic.gdx.math.Shape2D
    public boolean contains(float f, float f2) {
        return false;
    }

    @Override // com.badlogic.gdx.math.Shape2D
    public boolean contains(Vector2 vector2) {
        return false;
    }

    public Polyline() {
        this.scaleX = 1.0f;
        this.scaleY = 1.0f;
        this.calculateScaledLength = true;
        this.calculateLength = true;
        this.dirty = true;
        this.localVertices = new float[0];
    }

    public Polyline(float[] fArr) {
        this.scaleX = 1.0f;
        this.scaleY = 1.0f;
        this.calculateScaledLength = true;
        this.calculateLength = true;
        this.dirty = true;
        if (fArr.length >= 4) {
            this.localVertices = fArr;
            return;
        }
        throw new IllegalArgumentException("polylines must contain at least 2 points.");
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
        if (fArr2 == null || fArr2.length < fArr.length) {
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
        int length2 = fArr.length;
        for (int i = 0; i < length2; i += 2) {
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

    public float getLength() {
        if (!this.calculateLength) {
            return this.length;
        }
        int i = 0;
        this.calculateLength = false;
        this.length = 0.0f;
        int length2 = this.localVertices.length - 2;
        while (i < length2) {
            float[] fArr = this.localVertices;
            int i2 = i + 2;
            float f = fArr[i2] - fArr[i];
            float f2 = fArr[i + 1] - fArr[i + 3];
            this.length += (float) Math.sqrt((double) ((f * f) + (f2 * f2)));
            i = i2;
        }
        return this.length;
    }

    public float getScaledLength() {
        if (!this.calculateScaledLength) {
            return this.scaledLength;
        }
        int i = 0;
        this.calculateScaledLength = false;
        this.scaledLength = 0.0f;
        int length2 = this.localVertices.length - 2;
        while (i < length2) {
            float[] fArr = this.localVertices;
            int i2 = i + 2;
            float f = fArr[i2];
            float f2 = this.scaleX;
            float f3 = (f * f2) - (fArr[i] * f2);
            float f4 = fArr[i + 1];
            float f5 = this.scaleY;
            float f6 = (f4 * f5) - (fArr[i + 3] * f5);
            this.scaledLength += (float) Math.sqrt((double) ((f3 * f3) + (f6 * f6)));
            i = i2;
        }
        return this.scaledLength;
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
        if (fArr.length >= 4) {
            this.localVertices = fArr;
            this.dirty = true;
            return;
        }
        throw new IllegalArgumentException("polylines must contain at least 2 points.");
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
        this.calculateScaledLength = true;
    }

    public void scale(float f) {
        this.scaleX += f;
        this.scaleY += f;
        this.dirty = true;
        this.calculateScaledLength = true;
    }

    public void calculateLength() {
        this.calculateLength = true;
    }

    public void calculateScaledLength() {
        this.calculateScaledLength = true;
    }

    public void dirty() {
        this.dirty = true;
    }

    public void translate(float f, float f2) {
        this.x += f;
        this.y += f2;
        this.dirty = true;
    }
}
