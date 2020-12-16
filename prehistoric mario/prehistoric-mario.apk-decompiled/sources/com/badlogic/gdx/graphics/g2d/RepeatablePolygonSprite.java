package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.EarClippingTriangulator;
import com.badlogic.gdx.math.Intersector;
import com.badlogic.gdx.math.Polygon;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.Array;

public class RepeatablePolygonSprite {
    private Color color = Color.WHITE;
    private int cols;
    private float density;
    private boolean dirty = true;
    private float gridHeight;
    private float gridWidth;
    private Array<short[]> indices = new Array<>();
    private Vector2 offset = new Vector2();
    private Array<float[]> parts = new Array<>();
    private TextureRegion region;
    private int rows;
    private Array<float[]> vertices = new Array<>();
    public float x = 0.0f;
    public float y = 0.0f;

    public void setPolygon(TextureRegion textureRegion, float[] fArr) {
        setPolygon(textureRegion, fArr, -1.0f);
    }

    public void setPolygon(TextureRegion textureRegion, float[] fArr, float f) {
        this.region = textureRegion;
        Polygon polygon = new Polygon(offset(fArr));
        Polygon polygon2 = new Polygon();
        Polygon polygon3 = new Polygon();
        EarClippingTriangulator earClippingTriangulator = new EarClippingTriangulator();
        Rectangle boundingRectangle = polygon.getBoundingRectangle();
        float width = f == -1.0f ? boundingRectangle.getWidth() / ((float) textureRegion.getRegionWidth()) : f;
        float regionHeight = ((float) textureRegion.getRegionHeight()) / ((float) textureRegion.getRegionWidth());
        this.cols = (int) Math.ceil((double) width);
        this.gridWidth = boundingRectangle.getWidth() / width;
        this.gridHeight = regionHeight * this.gridWidth;
        this.rows = (int) Math.ceil((double) (boundingRectangle.getHeight() / this.gridHeight));
        for (int i = 0; i < this.cols; i++) {
            int i2 = 0;
            while (i2 < this.rows) {
                float f2 = (float) i;
                float f3 = this.gridWidth;
                float f4 = (float) i2;
                float f5 = this.gridHeight;
                i2++;
                float f6 = (float) i2;
                float f7 = (float) (i + 1);
                polygon2.setVertices(new float[]{f2 * f3, f4 * f5, f2 * f3, f6 * f5, f7 * f3, f6 * f5, f7 * f3, f4 * f5});
                Intersector.intersectPolygons(polygon, polygon2, polygon3);
                float[] vertices2 = polygon3.getVertices();
                if (vertices2.length > 0) {
                    this.parts.add(snapToGrid(vertices2));
                    this.indices.add(earClippingTriangulator.computeTriangles(vertices2).toArray());
                } else {
                    this.parts.add(null);
                }
            }
        }
        buildVertices();
    }

    private float[] snapToGrid(float[] fArr) {
        for (int i = 0; i < fArr.length; i += 2) {
            float f = (fArr[i] / this.gridWidth) % 1.0f;
            int i2 = i + 1;
            float f2 = (fArr[i2] / this.gridHeight) % 1.0f;
            if (f > 0.99f || f < 0.01f) {
                float f3 = this.gridWidth;
                fArr[i] = f3 * ((float) Math.round(fArr[i] / f3));
            }
            if (f2 > 0.99f || f2 < 0.01f) {
                float f4 = this.gridHeight;
                fArr[i2] = f4 * ((float) Math.round(fArr[i2] / f4));
            }
        }
        return fArr;
    }

    private float[] offset(float[] fArr) {
        this.offset.set(fArr[0], fArr[1]);
        for (int i = 0; i < fArr.length - 1; i += 2) {
            if (this.offset.x > fArr[i]) {
                this.offset.x = fArr[i];
            }
            int i2 = i + 1;
            if (this.offset.y > fArr[i2]) {
                this.offset.y = fArr[i2];
            }
        }
        for (int i3 = 0; i3 < fArr.length; i3 += 2) {
            fArr[i3] = fArr[i3] - this.offset.x;
            int i4 = i3 + 1;
            fArr[i4] = fArr[i4] - this.offset.y;
        }
        return fArr;
    }

    private void buildVertices() {
        this.vertices.clear();
        for (int i = 0; i < this.parts.size; i++) {
            float[] fArr = this.parts.get(i);
            if (fArr != null) {
                float[] fArr2 = new float[((fArr.length * 5) / 2)];
                int i2 = this.rows;
                int i3 = i / i2;
                int i4 = i % i2;
                int i5 = 0;
                int i6 = 0;
                while (i5 < fArr.length) {
                    int i7 = i6 + 1;
                    fArr2[i6] = fArr[i5] + this.offset.x + this.x;
                    int i8 = i7 + 1;
                    int i9 = i5 + 1;
                    fArr2[i7] = fArr[i9] + this.offset.y + this.y;
                    int i10 = i8 + 1;
                    fArr2[i8] = this.color.toFloatBits();
                    float f = fArr[i5];
                    float f2 = this.gridWidth;
                    float f3 = (f % f2) / f2;
                    float f4 = fArr[i9];
                    float f5 = this.gridHeight;
                    float f6 = (f4 % f5) / f5;
                    if (fArr[i5] == ((float) i3) * f2) {
                        f3 = 0.0f;
                    }
                    float f7 = 1.0f;
                    if (fArr[i5] == ((float) (i3 + 1)) * this.gridWidth) {
                        f3 = 1.0f;
                    }
                    float f8 = fArr[i9] == ((float) i4) * this.gridHeight ? 0.0f : f6;
                    if (fArr[i9] != ((float) (i4 + 1)) * this.gridHeight) {
                        f7 = f8;
                    }
                    float u = this.region.getU() + ((this.region.getU2() - this.region.getU()) * f3);
                    float v = this.region.getV() + ((this.region.getV2() - this.region.getV()) * f7);
                    int i11 = i10 + 1;
                    fArr2[i10] = u;
                    fArr2[i11] = v;
                    i5 += 2;
                    i6 = i11 + 1;
                }
                this.vertices.add(fArr2);
            }
        }
        this.dirty = false;
    }

    public void draw(PolygonSpriteBatch polygonSpriteBatch) {
        if (this.dirty) {
            buildVertices();
        }
        for (int i = 0; i < this.vertices.size; i++) {
            polygonSpriteBatch.draw(this.region.getTexture(), this.vertices.get(i), 0, this.vertices.get(i).length, this.indices.get(i), 0, this.indices.get(i).length);
        }
    }

    public void setColor(Color color2) {
        this.color = color2;
        this.dirty = true;
    }

    public void setPosition(float f, float f2) {
        this.x = f;
        this.y = f2;
        this.dirty = true;
    }
}
