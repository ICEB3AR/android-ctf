package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.utils.ShortArray;

public class SphereShapeBuilder extends BaseShapeBuilder {
    private static final Matrix3 normalTransform = new Matrix3();
    private static final ShortArray tmpIndices = new ShortArray();

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, float f3, int i, int i2) {
        build(meshPartBuilder, f, f2, f3, i, i2, 0.0f, 360.0f, 0.0f, 180.0f);
    }

    @Deprecated
    public static void build(MeshPartBuilder meshPartBuilder, Matrix4 matrix4, float f, float f2, float f3, int i, int i2) {
        build(meshPartBuilder, matrix4, f, f2, f3, i, i2, 0.0f, 360.0f, 0.0f, 180.0f);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, float f3, int i, int i2, float f4, float f5, float f6, float f7) {
        build(meshPartBuilder, matTmp1.idt(), f, f2, f3, i, i2, f4, f5, f6, f7);
    }

    @Deprecated
    public static void build(MeshPartBuilder meshPartBuilder, Matrix4 matrix4, float f, float f2, float f3, int i, int i2, float f4, float f5, float f6, float f7) {
        float f8;
        int i3 = i;
        int i4 = i2;
        float f9 = f * 0.5f;
        float f10 = f2 * 0.5f;
        float f11 = 0.5f * f3;
        float f12 = f4 * 0.017453292f;
        float f13 = (float) i3;
        float f14 = ((f5 - f4) * 0.017453292f) / f13;
        float f15 = f6 * 0.017453292f;
        float f16 = (float) i4;
        float f17 = ((f7 - f6) * 0.017453292f) / f16;
        float f18 = 1.0f / f13;
        float f19 = 1.0f / f16;
        MeshPartBuilder.VertexInfo vertexInfo = vertTmp3.set(null, null, null, null);
        vertexInfo.hasNormal = true;
        vertexInfo.hasPosition = true;
        vertexInfo.hasUV = true;
        normalTransform.set(matrix4);
        int i5 = i3 + 3;
        tmpIndices.clear();
        tmpIndices.ensureCapacity(i3 * 2);
        tmpIndices.size = i5;
        int i6 = i3 + 1;
        meshPartBuilder.ensureVertices((i4 + 1) * i6);
        meshPartBuilder.ensureRectangleIndices(i3);
        int i7 = 0;
        int i8 = 0;
        while (i7 <= i4) {
            float f20 = (float) i7;
            float f21 = f15 + (f17 * f20);
            float f22 = f20 * f19;
            float sin = MathUtils.sin(f21);
            float cos = MathUtils.cos(f21) * f10;
            int i9 = i8;
            int i10 = 0;
            while (i10 <= i3) {
                float f23 = (float) i10;
                float f24 = f12 + (f14 * f23);
                vertexInfo.position.set(MathUtils.cos(f24) * f9 * sin, cos, MathUtils.sin(f24) * f11 * sin);
                vertexInfo.normal.set(vertexInfo.position).mul(normalTransform).nor();
                vertexInfo.position.mul(matrix4);
                vertexInfo.uv.set(1.0f - (f23 * f18), f22);
                tmpIndices.set(i9, meshPartBuilder.vertex(vertexInfo));
                int i11 = i9 + i5;
                if (i7 <= 0 || i10 <= 0) {
                    f8 = f22;
                } else {
                    f8 = f22;
                    meshPartBuilder.rect(tmpIndices.get(i9), tmpIndices.get((i11 - 1) % i5), tmpIndices.get((i11 - (i3 + 2)) % i5), tmpIndices.get((i11 - i6) % i5));
                }
                i9 = (i9 + 1) % tmpIndices.size;
                i10++;
                f12 = f12;
                i3 = i;
                f17 = f17;
                f22 = f8;
                f11 = f11;
                f9 = f9;
            }
            i7++;
            f19 = f19;
            i3 = i;
            i4 = i2;
            i8 = i9;
            f10 = f10;
            f9 = f9;
            f15 = f15;
        }
    }
}
