package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class EllipseShapeBuilder extends BaseShapeBuilder {
    public static void build(MeshPartBuilder meshPartBuilder, float f, int i, float f2, float f3, float f4, float f5, float f6, float f7) {
        build(meshPartBuilder, f, i, f2, f3, f4, f5, f6, f7, 0.0f, 360.0f);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, int i, Vector3 vector3, Vector3 vector32) {
        build(meshPartBuilder, f, i, vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, int i, Vector3 vector3, Vector3 vector32, Vector3 vector33, Vector3 vector34) {
        build(meshPartBuilder, f, i, vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z, vector33.x, vector33.y, vector33.z, vector34.x, vector34.y, vector34.z);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, int i, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12, float f13) {
        build(meshPartBuilder, f, i, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, 0.0f, 360.0f);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, int i, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9) {
        float f10 = f * 2.0f;
        build(meshPartBuilder, f10, f10, i, f2, f3, f4, f5, f6, f7, f8, f9);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, int i, Vector3 vector3, Vector3 vector32, float f2, float f3) {
        build(meshPartBuilder, f, i, vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z, f2, f3);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, int i, Vector3 vector3, Vector3 vector32, Vector3 vector33, Vector3 vector34, float f2, float f3) {
        build(meshPartBuilder, f, i, vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z, vector33.x, vector33.y, vector33.z, vector34.x, vector34.y, vector34.z, f2, f3);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, int i, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12, float f13, float f14, float f15) {
        float f16 = f * 2.0f;
        build(meshPartBuilder, f16, f16, 0.0f, 0.0f, i, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, int i, float f3, float f4, float f5, float f6, float f7, float f8) {
        build(meshPartBuilder, f, f2, i, f3, f4, f5, f6, f7, f8, 0.0f, 360.0f);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, int i, Vector3 vector3, Vector3 vector32) {
        build(meshPartBuilder, f, f2, i, vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, int i, Vector3 vector3, Vector3 vector32, Vector3 vector33, Vector3 vector34) {
        build(meshPartBuilder, f, f2, i, vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z, vector33.x, vector33.y, vector33.z, vector34.x, vector34.y, vector34.z);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, int i, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12, float f13, float f14) {
        build(meshPartBuilder, f, f2, i, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, 0.0f, 360.0f);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, int i, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10) {
        build(meshPartBuilder, f, f2, 0.0f, 0.0f, i, f3, f4, f5, f6, f7, f8, f9, f10);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, int i, Vector3 vector3, Vector3 vector32, float f3, float f4) {
        build(meshPartBuilder, f, f2, 0.0f, 0.0f, i, vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z, f3, f4);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, int i, Vector3 vector3, Vector3 vector32, Vector3 vector33, Vector3 vector34, float f3, float f4) {
        build(meshPartBuilder, f, f2, 0.0f, 0.0f, i, vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z, vector33.x, vector33.y, vector33.z, vector34.x, vector34.y, vector34.z, f3, f4);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, int i, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12, float f13, float f14, float f15, float f16) {
        build(meshPartBuilder, f, f2, 0.0f, 0.0f, i, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, float f3, float f4, int i, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12) {
        tmpV1.set(f8, f9, f10).crs(0.0f, 0.0f, 1.0f);
        tmpV2.set(f8, f9, f10).crs(0.0f, 1.0f, 0.0f);
        if (tmpV2.len2() > tmpV1.len2()) {
            tmpV1.set(tmpV2);
        }
        tmpV2.set(tmpV1.nor()).crs(f8, f9, f10).nor();
        build(meshPartBuilder, f, f2, f3, f4, i, f5, f6, f7, f8, f9, f10, tmpV1.x, tmpV1.y, tmpV1.z, tmpV2.x, tmpV2.y, tmpV2.z, f11, f12);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, float f3, float f4, int i, float f5, float f6, float f7, float f8, float f9, float f10) {
        build(meshPartBuilder, f, f2, f3, f4, i, f5, f6, f7, f8, f9, f10, 0.0f, 360.0f);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, float f3, float f4, int i, Vector3 vector3, Vector3 vector32) {
        build(meshPartBuilder, f, f2, f3, f4, i, vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z, 0.0f, 360.0f);
    }

    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, float f3, float f4, int i, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12, float f13, float f14, float f15, float f16, float f17, float f18) {
        Vector3 vector3;
        Vector3 vector32;
        short s;
        short s2;
        short s3;
        if (f3 <= 0.0f || f4 <= 0.0f) {
            meshPartBuilder.ensureVertices(i + 2);
            meshPartBuilder.ensureTriangleIndices(i);
        } else if (f3 == f && f4 == f2) {
            int i2 = i + 1;
            meshPartBuilder.ensureVertices(i2);
            meshPartBuilder.ensureIndices(i2);
            if (meshPartBuilder.getPrimitiveType() != 1) {
                throw new GdxRuntimeException("Incorrect primitive type : expect GL_LINES because innerWidth == width && innerHeight == height");
            }
        } else {
            int i3 = i + 1;
            meshPartBuilder.ensureVertices(i3 * 2);
            meshPartBuilder.ensureRectangleIndices(i3);
        }
        float f19 = f17 * 0.017453292f;
        float f20 = ((f18 - f17) * 0.017453292f) / ((float) i);
        Vector3 scl = tmpV1.set(f11, f12, f13).scl(f * 0.5f);
        Vector3 scl2 = tmpV2.set(f14, f15, f16).scl(f2 * 0.5f);
        Vector3 scl3 = tmpV3.set(f11, f12, f13).scl(f3 * 0.5f);
        Vector3 scl4 = tmpV4.set(f14, f15, f16).scl(f4 * 0.5f);
        MeshPartBuilder.VertexInfo vertexInfo = vertTmp3.set(null, null, null, null);
        vertexInfo.hasNormal = true;
        vertexInfo.hasPosition = true;
        vertexInfo.hasUV = true;
        vertexInfo.uv.set(0.5f, 0.5f);
        vertexInfo.position.set(f5, f6, f7);
        vertexInfo.normal.set(f8, f9, f10);
        MeshPartBuilder.VertexInfo vertexInfo2 = vertTmp4.set(null, null, null, null);
        vertexInfo2.hasNormal = true;
        vertexInfo2.hasPosition = true;
        vertexInfo2.hasUV = true;
        vertexInfo2.uv.set(0.5f, 0.5f);
        vertexInfo2.position.set(f5, f6, f7);
        vertexInfo2.normal.set(f8, f9, f10);
        short vertex = meshPartBuilder.vertex(vertexInfo2);
        float f21 = (f3 / f) * 0.5f;
        float f22 = (f4 / f2) * 0.5f;
        int i4 = i;
        int i5 = 0;
        short s4 = 0;
        short s5 = 0;
        short s6 = 0;
        while (i5 <= i4) {
            float f23 = f19 + (((float) i5) * f20);
            float cos = MathUtils.cos(f23);
            float sin = MathUtils.sin(f23);
            vertexInfo2.position.set(f5, f6, f7).add((scl.x * cos) + (scl2.x * sin), (scl.y * cos) + (scl2.y * sin), (scl.z * cos) + (scl2.z * sin));
            vertexInfo2.uv.set((cos * 0.5f) + 0.5f, (sin * 0.5f) + 0.5f);
            short vertex2 = meshPartBuilder.vertex(vertexInfo2);
            if (f3 <= 0.0f || f4 <= 0.0f) {
                vector32 = scl4;
                vector3 = scl2;
                s3 = s5;
                s2 = s6;
                if (i5 != 0) {
                    s = vertex;
                    meshPartBuilder.triangle(vertex2, s4, s);
                    s5 = s3;
                    s6 = s2;
                    i5++;
                    f22 = f22;
                    f21 = f21;
                    s4 = vertex2;
                    scl4 = vector32;
                    i4 = i;
                    vertex = s;
                    scl2 = vector3;
                }
            } else if (f3 == f && f4 == f2) {
                if (i5 != 0) {
                    meshPartBuilder.line(vertex2, s4);
                }
                vector32 = scl4;
                vector3 = scl2;
                s3 = s5;
                s2 = s6;
            } else {
                vector32 = scl4;
                vector3 = scl2;
                vertexInfo.position.set(f5, f6, f7).add((scl3.x * cos) + (vector32.x * sin), (scl3.y * cos) + (vector32.y * sin), (scl3.z * cos) + (vector32.z * sin));
                vertexInfo.uv.set((f21 * cos) + 0.5f, (f22 * sin) + 0.5f);
                short vertex3 = meshPartBuilder.vertex(vertexInfo);
                if (i5 != 0) {
                    meshPartBuilder.rect(vertex3, vertex2, s6, s5);
                }
                s5 = vertex3;
                s6 = vertex2;
                s = vertex;
                i5++;
                f22 = f22;
                f21 = f21;
                s4 = vertex2;
                scl4 = vector32;
                i4 = i;
                vertex = s;
                scl2 = vector3;
            }
            s = vertex;
            s5 = s3;
            s6 = s2;
            i5++;
            f22 = f22;
            f21 = f21;
            s4 = vertex2;
            scl4 = vector32;
            i4 = i;
            vertex = s;
            scl2 = vector3;
        }
    }
}
