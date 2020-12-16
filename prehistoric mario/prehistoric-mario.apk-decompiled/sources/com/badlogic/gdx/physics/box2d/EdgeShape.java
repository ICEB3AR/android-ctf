package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Shape;

public class EdgeShape extends Shape {
    static final float[] vertex = new float[2];

    private native void jniGetVertex0(long j, float[] fArr);

    private native void jniGetVertex1(long j, float[] fArr);

    private native void jniGetVertex2(long j, float[] fArr);

    private native void jniGetVertex3(long j, float[] fArr);

    private native boolean jniHasVertex0(long j);

    private native boolean jniHasVertex3(long j);

    private native void jniSet(long j, float f, float f2, float f3, float f4);

    private native void jniSetHasVertex0(long j, boolean z);

    private native void jniSetHasVertex3(long j, boolean z);

    private native void jniSetVertex0(long j, float f, float f2);

    private native void jniSetVertex3(long j, float f, float f2);

    private native long newEdgeShape();

    public EdgeShape() {
        this.addr = newEdgeShape();
    }

    EdgeShape(long j) {
        this.addr = j;
    }

    public void set(Vector2 vector2, Vector2 vector22) {
        set(vector2.x, vector2.y, vector22.x, vector22.y);
    }

    public void set(float f, float f2, float f3, float f4) {
        jniSet(this.addr, f, f2, f3, f4);
    }

    public void getVertex1(Vector2 vector2) {
        jniGetVertex1(this.addr, vertex);
        float[] fArr = vertex;
        vector2.x = fArr[0];
        vector2.y = fArr[1];
    }

    public void getVertex2(Vector2 vector2) {
        jniGetVertex2(this.addr, vertex);
        float[] fArr = vertex;
        vector2.x = fArr[0];
        vector2.y = fArr[1];
    }

    public void getVertex0(Vector2 vector2) {
        jniGetVertex0(this.addr, vertex);
        float[] fArr = vertex;
        vector2.x = fArr[0];
        vector2.y = fArr[1];
    }

    public void setVertex0(Vector2 vector2) {
        jniSetVertex0(this.addr, vector2.x, vector2.y);
    }

    public void setVertex0(float f, float f2) {
        jniSetVertex0(this.addr, f, f2);
    }

    public void getVertex3(Vector2 vector2) {
        jniGetVertex3(this.addr, vertex);
        float[] fArr = vertex;
        vector2.x = fArr[0];
        vector2.y = fArr[1];
    }

    public void setVertex3(Vector2 vector2) {
        jniSetVertex3(this.addr, vector2.x, vector2.y);
    }

    public void setVertex3(float f, float f2) {
        jniSetVertex3(this.addr, f, f2);
    }

    public boolean hasVertex0() {
        return jniHasVertex0(this.addr);
    }

    public void setHasVertex0(boolean z) {
        jniSetHasVertex0(this.addr, z);
    }

    public boolean hasVertex3() {
        return jniHasVertex3(this.addr);
    }

    public void setHasVertex3(boolean z) {
        jniSetHasVertex3(this.addr, z);
    }

    @Override // com.badlogic.gdx.physics.box2d.Shape
    public Shape.Type getType() {
        return Shape.Type.Edge;
    }
}
