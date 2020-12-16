package com.badlogic.gdx.graphics.g2d;

public class PolygonRegion {
    final TextureRegion region;
    final float[] textureCoords;
    final short[] triangles;
    final float[] vertices;

    public PolygonRegion(TextureRegion textureRegion, float[] fArr, short[] sArr) {
        this.region = textureRegion;
        this.vertices = fArr;
        this.triangles = sArr;
        float[] fArr2 = new float[fArr.length];
        this.textureCoords = fArr2;
        float f = textureRegion.u;
        float f2 = textureRegion.v;
        float f3 = textureRegion.u2 - f;
        float f4 = textureRegion.v2 - f2;
        int i = textureRegion.regionWidth;
        int i2 = textureRegion.regionHeight;
        int length = fArr.length;
        for (int i3 = 0; i3 < length; i3 += 2) {
            fArr2[i3] = ((fArr[i3] / ((float) i)) * f3) + f;
            int i4 = i3 + 1;
            fArr2[i4] = ((1.0f - (fArr[i4] / ((float) i2))) * f4) + f2;
        }
    }

    public float[] getVertices() {
        return this.vertices;
    }

    public short[] getTriangles() {
        return this.triangles;
    }

    public float[] getTextureCoords() {
        return this.textureCoords;
    }

    public TextureRegion getRegion() {
        return this.region;
    }
}
