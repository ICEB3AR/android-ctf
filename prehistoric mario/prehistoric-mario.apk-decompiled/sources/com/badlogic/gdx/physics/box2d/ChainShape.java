package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Shape;

public class ChainShape extends Shape {
    private static float[] verts = new float[2];
    boolean isLooped = false;

    private native void jniCreateChain(long j, float[] fArr, int i, int i2);

    private native void jniCreateLoop(long j, float[] fArr, int i, int i2);

    private native void jniGetVertex(long j, int i, float[] fArr);

    private native int jniGetVertexCount(long j);

    private native void jniSetNextVertex(long j, float f, float f2);

    private native void jniSetPrevVertex(long j, float f, float f2);

    private native long newChainShape();

    public ChainShape() {
        this.addr = newChainShape();
    }

    ChainShape(long j) {
        this.addr = j;
    }

    @Override // com.badlogic.gdx.physics.box2d.Shape
    public Shape.Type getType() {
        return Shape.Type.Chain;
    }

    public void createLoop(float[] fArr) {
        jniCreateLoop(this.addr, fArr, 0, fArr.length / 2);
        this.isLooped = true;
    }

    public void createLoop(float[] fArr, int i, int i2) {
        jniCreateLoop(this.addr, fArr, i, i2 / 2);
        this.isLooped = true;
    }

    public void createLoop(Vector2[] vector2Arr) {
        float[] fArr = new float[(vector2Arr.length * 2)];
        int i = 0;
        int i2 = 0;
        while (i < vector2Arr.length * 2) {
            fArr[i] = vector2Arr[i2].x;
            fArr[i + 1] = vector2Arr[i2].y;
            i += 2;
            i2++;
        }
        jniCreateLoop(this.addr, fArr, 0, fArr.length / 2);
        this.isLooped = true;
    }

    public void createChain(float[] fArr) {
        jniCreateChain(this.addr, fArr, 0, fArr.length / 2);
        this.isLooped = false;
    }

    public void createChain(float[] fArr, int i, int i2) {
        jniCreateChain(this.addr, fArr, i, i2 / 2);
        this.isLooped = false;
    }

    public void createChain(Vector2[] vector2Arr) {
        float[] fArr = new float[(vector2Arr.length * 2)];
        int i = 0;
        int i2 = 0;
        while (i < vector2Arr.length * 2) {
            fArr[i] = vector2Arr[i2].x;
            fArr[i + 1] = vector2Arr[i2].y;
            i += 2;
            i2++;
        }
        jniCreateChain(this.addr, fArr, 0, vector2Arr.length);
        this.isLooped = false;
    }

    public void setPrevVertex(Vector2 vector2) {
        setPrevVertex(vector2.x, vector2.y);
    }

    public void setPrevVertex(float f, float f2) {
        jniSetPrevVertex(this.addr, f, f2);
    }

    public void setNextVertex(Vector2 vector2) {
        setNextVertex(vector2.x, vector2.y);
    }

    public void setNextVertex(float f, float f2) {
        jniSetNextVertex(this.addr, f, f2);
    }

    public int getVertexCount() {
        return jniGetVertexCount(this.addr);
    }

    public void getVertex(int i, Vector2 vector2) {
        jniGetVertex(this.addr, i, verts);
        float[] fArr = verts;
        vector2.x = fArr[0];
        vector2.y = fArr[1];
    }

    public boolean isLooped() {
        return this.isLooped;
    }
}
