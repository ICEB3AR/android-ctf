package com.badlogic.gdx.math;

import com.badlogic.gdx.math.Plane;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.math.collision.Ray;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.FloatArray;
import java.util.Arrays;
import java.util.List;

public final class Intersector {
    static Vector3 best = new Vector3();
    private static final Vector3 dir = new Vector3();
    private static final Vector2 e = new Vector2();
    private static final Vector2 ep1 = new Vector2();
    private static final Vector2 ep2 = new Vector2();
    private static final FloatArray floatArray = new FloatArray();
    private static final FloatArray floatArray2 = new FloatArray();
    private static final Vector3 i = new Vector3();
    static Vector3 intersection = new Vector3();
    private static final Vector2 ip = new Vector2();
    private static final Plane p = new Plane(new Vector3(), 0.0f);
    private static final Vector2 s = new Vector2();
    private static final Vector3 start = new Vector3();
    static Vector3 tmp = new Vector3();
    static Vector3 tmp1 = new Vector3();
    static Vector3 tmp2 = new Vector3();
    static Vector3 tmp3 = new Vector3();
    private static final Vector3 v0 = new Vector3();
    private static final Vector3 v1 = new Vector3();
    private static final Vector3 v2 = new Vector3();
    static Vector2 v2tmp = new Vector2();

    public static class MinimumTranslationVector {
        public float depth = 0.0f;
        public Vector2 normal = new Vector2();
    }

    static float det(float f, float f2, float f3, float f4) {
        return (f * f4) - (f2 * f3);
    }

    static double detd(double d, double d2, double d3, double d4) {
        return (d * d4) - (d2 * d3);
    }

    public static boolean isPointInTriangle(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8) {
        float f9 = f - f3;
        float f10 = f2 - f4;
        boolean z = ((f5 - f3) * f10) - ((f6 - f4) * f9) > 0.0f;
        if ((((f7 - f3) * f10) - ((f8 - f4) * f9) > 0.0f) == z) {
            return false;
        }
        return (((((f7 - f5) * (f2 - f6)) - ((f8 - f6) * (f - f5))) > 0.0f ? 1 : ((((f7 - f5) * (f2 - f6)) - ((f8 - f6) * (f - f5))) == 0.0f ? 0 : -1)) > 0) == z;
    }

    public static boolean isPointInTriangle(Vector3 vector3, Vector3 vector32, Vector3 vector33, Vector3 vector34) {
        v0.set(vector32).sub(vector3);
        v1.set(vector33).sub(vector3);
        v2.set(vector34).sub(vector3);
        float dot = v0.dot(v1);
        float dot2 = v0.dot(v2);
        float dot3 = v1.dot(v2);
        Vector3 vector35 = v2;
        if ((dot3 * dot2) - (vector35.dot(vector35) * dot) < 0.0f) {
            return false;
        }
        Vector3 vector36 = v1;
        if ((dot * dot3) - (dot2 * vector36.dot(vector36)) < 0.0f) {
            return false;
        }
        return true;
    }

    public static boolean isPointInTriangle(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24) {
        float f = vector2.x - vector22.x;
        float f2 = vector2.y - vector22.y;
        boolean z = ((vector23.x - vector22.x) * f2) - ((vector23.y - vector22.y) * f) > 0.0f;
        if ((((vector24.x - vector22.x) * f2) - ((vector24.y - vector22.y) * f) > 0.0f) == z) {
            return false;
        }
        return (((((vector24.x - vector23.x) * (vector2.y - vector23.y)) - ((vector24.y - vector23.y) * (vector2.x - vector23.x))) > 0.0f ? 1 : ((((vector24.x - vector23.x) * (vector2.y - vector23.y)) - ((vector24.y - vector23.y) * (vector2.x - vector23.x))) == 0.0f ? 0 : -1)) > 0) == z;
    }

    public static boolean intersectSegmentPlane(Vector3 vector3, Vector3 vector32, Plane plane, Vector3 vector33) {
        Vector3 sub = v0.set(vector32).sub(vector3);
        float dot = sub.dot(plane.getNormal());
        if (dot == 0.0f) {
            return false;
        }
        float f = (-(vector3.dot(plane.getNormal()) + plane.getD())) / dot;
        if (f < 0.0f || f > 1.0f) {
            return false;
        }
        vector33.set(vector3).add(sub.scl(f));
        return true;
    }

    public static int pointLineSide(Vector2 vector2, Vector2 vector22, Vector2 vector23) {
        return (int) Math.signum(((vector22.x - vector2.x) * (vector23.y - vector2.y)) - ((vector22.y - vector2.y) * (vector23.x - vector2.x)));
    }

    public static int pointLineSide(float f, float f2, float f3, float f4, float f5, float f6) {
        return (int) Math.signum(((f3 - f) * (f6 - f2)) - ((f4 - f2) * (f5 - f)));
    }

    public static boolean isPointInPolygon(Array<Vector2> array, Vector2 vector2) {
        float f = vector2.x;
        float f2 = vector2.y;
        int i2 = 0;
        Vector2 peek = array.peek();
        boolean z = false;
        while (i2 < array.size) {
            Vector2 vector22 = array.get(i2);
            if (((vector22.y < f2 && peek.y >= f2) || (peek.y < f2 && vector22.y >= f2)) && vector22.x + (((f2 - vector22.y) / (peek.y - vector22.y)) * (peek.x - vector22.x)) < f) {
                z = !z;
            }
            i2++;
            peek = vector22;
        }
        return z;
    }

    public static boolean isPointInPolygon(float[] fArr, int i2, int i3, float f, float f2) {
        float f3 = fArr[i2];
        float f4 = fArr[i2 + 1];
        int i4 = i2 + 3;
        int i5 = i2 + i3;
        float f5 = f4;
        boolean z = false;
        while (i4 < i5) {
            float f6 = fArr[i4];
            if ((f6 < f2 && f5 >= f2) || (f5 < f2 && f6 >= f2)) {
                float f7 = fArr[i4 - 1];
                if (f7 + (((f2 - f6) / (f5 - f6)) * (fArr[i4 - 3] - f7)) < f) {
                    z = !z;
                }
            }
            i4 += 2;
            f5 = f6;
        }
        return (((f4 >= f2 || f5 < f2) && (f5 >= f2 || f4 < f2)) || f3 + (((f2 - f4) / (f5 - f4)) * (fArr[i4 + -3] - f3)) >= f) ? z : !z;
    }

    public static boolean intersectPolygons(Polygon polygon, Polygon polygon2, Polygon polygon3) {
        boolean z = false;
        if (polygon.getVertices().length == 0 || polygon2.getVertices().length == 0) {
            return false;
        }
        Vector2 vector2 = ip;
        Vector2 vector22 = ep1;
        Vector2 vector23 = ep2;
        Vector2 vector24 = s;
        Vector2 vector25 = e;
        FloatArray floatArray3 = floatArray;
        FloatArray floatArray4 = floatArray2;
        floatArray3.clear();
        floatArray4.clear();
        floatArray4.addAll(polygon.getTransformedVertices());
        float[] transformedVertices = polygon2.getTransformedVertices();
        int length = transformedVertices.length - 2;
        int i2 = 0;
        while (i2 <= length) {
            vector22.set(transformedVertices[i2], transformedVertices[i2 + 1]);
            if (i2 < length) {
                vector23.set(transformedVertices[i2 + 2], transformedVertices[i2 + 3]);
            } else {
                char c = z ? 1 : 0;
                char c2 = z ? 1 : 0;
                char c3 = z ? 1 : 0;
                vector23.set(transformedVertices[c], transformedVertices[1]);
            }
            if (floatArray4.size == 0) {
                return z;
            }
            vector24.set(floatArray4.get(floatArray4.size - 2), floatArray4.get(floatArray4.size - 1));
            for (int i3 = 0; i3 < floatArray4.size; i3 += 2) {
                vector25.set(floatArray4.get(i3), floatArray4.get(i3 + 1));
                boolean z2 = pointLineSide(vector23, vector22, vector24) > 0;
                if (pointLineSide(vector23, vector22, vector25) > 0) {
                    if (!z2) {
                        intersectLines(vector24, vector25, vector22, vector23, vector2);
                        if (!(floatArray3.size >= 2 && floatArray3.get(floatArray3.size - 2) == vector2.x && floatArray3.get(floatArray3.size - 1) == vector2.y)) {
                            floatArray3.add(vector2.x);
                            floatArray3.add(vector2.y);
                        }
                    }
                    floatArray3.add(vector25.x);
                    floatArray3.add(vector25.y);
                } else if (z2) {
                    intersectLines(vector24, vector25, vector22, vector23, vector2);
                    floatArray3.add(vector2.x);
                    floatArray3.add(vector2.y);
                }
                vector24.set(vector25.x, vector25.y);
            }
            floatArray4.clear();
            floatArray4.addAll(floatArray3);
            floatArray3.clear();
            i2 += 2;
            z = false;
        }
        if (floatArray4.size == 0) {
            return false;
        }
        if (polygon3 != null) {
            if (polygon3.getVertices().length == floatArray4.size) {
                System.arraycopy(floatArray4.items, 0, polygon3.getVertices(), 0, floatArray4.size);
            } else {
                polygon3.setVertices(floatArray4.toArray());
            }
        }
        return true;
    }

    public static boolean intersectPolygons(FloatArray floatArray3, FloatArray floatArray4) {
        if (!isPointInPolygon(floatArray3.items, 0, floatArray3.size, floatArray4.items[0], floatArray4.items[1]) && !isPointInPolygon(floatArray4.items, 0, floatArray4.size, floatArray3.items[0], floatArray3.items[1])) {
            return intersectPolygonEdges(floatArray3, floatArray4);
        }
        return true;
    }

    public static boolean intersectPolygonEdges(FloatArray floatArray3, FloatArray floatArray4) {
        int i2 = floatArray3.size - 2;
        int i3 = floatArray4.size - 2;
        float[] fArr = floatArray3.items;
        float[] fArr2 = floatArray4.items;
        float f = fArr[i2];
        float f2 = fArr[i2 + 1];
        float f3 = f;
        int i4 = 0;
        while (i4 <= i2) {
            float f4 = fArr[i4];
            float f5 = fArr[i4 + 1];
            float f6 = fArr2[i3];
            float f7 = fArr2[i3 + 1];
            int i5 = 0;
            while (i5 <= i3) {
                float f8 = fArr2[i5];
                float f9 = fArr2[i5 + 1];
                if (intersectSegments(f3, f2, f4, f5, f6, f7, f8, f9, null)) {
                    return true;
                }
                i5 += 2;
                f6 = f8;
                f7 = f9;
            }
            i4 += 2;
            f3 = f4;
            f2 = f5;
        }
        return false;
    }

    public static float distanceLinePoint(float f, float f2, float f3, float f4, float f5, float f6) {
        float f7 = f3 - f;
        float f8 = f4 - f2;
        return Math.abs(((f5 - f) * f8) - ((f6 - f2) * f7)) / ((float) Math.sqrt((double) ((f7 * f7) + (f8 * f8))));
    }

    public static float distanceSegmentPoint(float f, float f2, float f3, float f4, float f5, float f6) {
        return nearestSegmentPoint(f, f2, f3, f4, f5, f6, v2tmp).dst(f5, f6);
    }

    public static float distanceSegmentPoint(Vector2 vector2, Vector2 vector22, Vector2 vector23) {
        return nearestSegmentPoint(vector2, vector22, vector23, v2tmp).dst(vector23);
    }

    public static Vector2 nearestSegmentPoint(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24) {
        float dst2 = vector2.dst2(vector22);
        if (dst2 == 0.0f) {
            return vector24.set(vector2);
        }
        float f = (((vector23.x - vector2.x) * (vector22.x - vector2.x)) + ((vector23.y - vector2.y) * (vector22.y - vector2.y))) / dst2;
        if (f < 0.0f) {
            return vector24.set(vector2);
        }
        if (f > 1.0f) {
            return vector24.set(vector22);
        }
        return vector24.set(vector2.x + ((vector22.x - vector2.x) * f), vector2.y + (f * (vector22.y - vector2.y)));
    }

    public static Vector2 nearestSegmentPoint(float f, float f2, float f3, float f4, float f5, float f6, Vector2 vector2) {
        float f7 = f3 - f;
        float f8 = f4 - f2;
        float f9 = (f7 * f7) + (f8 * f8);
        if (f9 == 0.0f) {
            return vector2.set(f, f2);
        }
        float f10 = (((f5 - f) * f7) + ((f6 - f2) * f8)) / f9;
        if (f10 < 0.0f) {
            return vector2.set(f, f2);
        }
        if (f10 > 1.0f) {
            return vector2.set(f3, f4);
        }
        return vector2.set(f + (f7 * f10), f2 + (f10 * f8));
    }

    public static boolean intersectSegmentCircle(Vector2 vector2, Vector2 vector22, Vector2 vector23, float f) {
        tmp.set(vector22.x - vector2.x, vector22.y - vector2.y, 0.0f);
        tmp1.set(vector23.x - vector2.x, vector23.y - vector2.y, 0.0f);
        float len = tmp.len();
        float dot = tmp1.dot(tmp.nor());
        if (dot <= 0.0f) {
            tmp2.set(vector2.x, vector2.y, 0.0f);
        } else if (dot >= len) {
            tmp2.set(vector22.x, vector22.y, 0.0f);
        } else {
            tmp3.set(tmp.scl(dot));
            tmp2.set(tmp3.x + vector2.x, tmp3.y + vector2.y, 0.0f);
        }
        float f2 = vector23.x - tmp2.x;
        float f3 = vector23.y - tmp2.y;
        return (f2 * f2) + (f3 * f3) <= f;
    }

    public static float intersectSegmentCircleDisplace(Vector2 vector2, Vector2 vector22, Vector2 vector23, float f, Vector2 vector24) {
        float f2 = ((vector23.x - vector2.x) * (vector22.x - vector2.x)) + ((vector23.y - vector2.y) * (vector22.y - vector2.y));
        float dst = vector2.dst(vector22);
        float f3 = f2 / (dst * dst);
        if (f3 >= 0.0f && f3 <= 1.0f) {
            tmp.set(vector22.x, vector22.y, 0.0f).sub(vector2.x, vector2.y, 0.0f);
            tmp2.set(vector2.x, vector2.y, 0.0f).add(tmp.scl(f3));
            float dst2 = tmp2.dst(vector23.x, vector23.y, 0.0f);
            if (dst2 < f) {
                vector24.set(vector23).sub(tmp2.x, tmp2.y).nor();
                return dst2;
            }
        }
        return Float.POSITIVE_INFINITY;
    }

    public static float intersectRayRay(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24) {
        float f = vector23.x - vector2.x;
        float f2 = vector23.y - vector2.y;
        float f3 = (vector22.x * vector24.y) - (vector22.y * vector24.x);
        if (f3 == 0.0f) {
            return Float.POSITIVE_INFINITY;
        }
        return (f * (vector24.y / f3)) - (f2 * (vector24.x / f3));
    }

    public static boolean intersectRayPlane(Ray ray, Plane plane, Vector3 vector3) {
        float dot = ray.direction.dot(plane.getNormal());
        if (dot != 0.0f) {
            float f = (-(ray.origin.dot(plane.getNormal()) + plane.getD())) / dot;
            if (f < 0.0f) {
                return false;
            }
            if (vector3 != null) {
                vector3.set(ray.origin).add(v0.set(ray.direction).scl(f));
            }
            return true;
        } else if (plane.testPoint(ray.origin) != Plane.PlaneSide.OnPlane) {
            return false;
        } else {
            if (vector3 != null) {
                vector3.set(ray.origin);
            }
            return true;
        }
    }

    public static float intersectLinePlane(float f, float f2, float f3, float f4, float f5, float f6, Plane plane, Vector3 vector3) {
        Vector3 sub = tmp.set(f4, f5, f6).sub(f, f2, f3);
        Vector3 vector32 = tmp2.set(f, f2, f3);
        float dot = sub.dot(plane.getNormal());
        if (dot != 0.0f) {
            float f7 = (-(vector32.dot(plane.getNormal()) + plane.getD())) / dot;
            if (vector3 != null) {
                vector3.set(vector32).add(sub.scl(f7));
            }
            return f7;
        } else if (plane.testPoint(vector32) != Plane.PlaneSide.OnPlane) {
            return -1.0f;
        } else {
            if (vector3 != null) {
                vector3.set(vector32);
            }
            return 0.0f;
        }
    }

    public static boolean intersectRayTriangle(Ray ray, Vector3 vector3, Vector3 vector32, Vector3 vector33, Vector3 vector34) {
        Vector3 sub = v0.set(vector32).sub(vector3);
        Vector3 sub2 = v1.set(vector33).sub(vector3);
        Vector3 crs = v2.set(ray.direction).crs(sub2);
        float dot = sub.dot(crs);
        if (MathUtils.isZero(dot)) {
            p.set(vector3, vector32, vector33);
            if (p.testPoint(ray.origin) != Plane.PlaneSide.OnPlane || !isPointInTriangle(ray.origin, vector3, vector32, vector33)) {
                return false;
            }
            if (vector34 != null) {
                vector34.set(ray.origin);
            }
            return true;
        }
        float f = 1.0f / dot;
        Vector3 sub3 = i.set(ray.origin).sub(vector3);
        float dot2 = sub3.dot(crs) * f;
        if (dot2 >= 0.0f && dot2 <= 1.0f) {
            Vector3 crs2 = sub3.crs(sub);
            float dot3 = ray.direction.dot(crs2) * f;
            if (dot3 >= 0.0f && dot2 + dot3 <= 1.0f) {
                float dot4 = sub2.dot(crs2) * f;
                if (dot4 < 0.0f) {
                    return false;
                }
                if (vector34 != null) {
                    if (dot4 <= 1.0E-6f) {
                        vector34.set(ray.origin);
                    } else {
                        ray.getEndPoint(vector34, dot4);
                    }
                }
                return true;
            }
        }
        return false;
    }

    public static boolean intersectRaySphere(Ray ray, Vector3 vector3, float f, Vector3 vector32) {
        float dot = ray.direction.dot(vector3.x - ray.origin.x, vector3.y - ray.origin.y, vector3.z - ray.origin.z);
        if (dot < 0.0f) {
            return false;
        }
        float dst2 = vector3.dst2(ray.origin.x + (ray.direction.x * dot), ray.origin.y + (ray.direction.y * dot), ray.origin.z + (ray.direction.z * dot));
        float f2 = f * f;
        if (dst2 > f2) {
            return false;
        }
        if (vector32 == null) {
            return true;
        }
        vector32.set(ray.direction).scl(dot - ((float) Math.sqrt((double) (f2 - dst2)))).add(ray.origin);
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:115:0x02c5  */
    /* JADX WARNING: Removed duplicated region for block: B:116:0x02cc  */
    /* JADX WARNING: Removed duplicated region for block: B:121:0x02e6  */
    /* JADX WARNING: Removed duplicated region for block: B:122:0x02ed  */
    /* JADX WARNING: Removed duplicated region for block: B:127:0x0307  */
    /* JADX WARNING: Removed duplicated region for block: B:128:0x030e  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00a3  */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x0112  */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x0181  */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x01f0  */
    /* JADX WARNING: Removed duplicated region for block: B:99:0x025f  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean intersectRayBounds(com.badlogic.gdx.math.collision.Ray r7, com.badlogic.gdx.math.collision.BoundingBox r8, com.badlogic.gdx.math.Vector3 r9) {
        /*
        // Method dump skipped, instructions count: 799
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.math.Intersector.intersectRayBounds(com.badlogic.gdx.math.collision.Ray, com.badlogic.gdx.math.collision.BoundingBox, com.badlogic.gdx.math.Vector3):boolean");
    }

    public static boolean intersectRayBoundsFast(Ray ray, BoundingBox boundingBox) {
        return intersectRayBoundsFast(ray, boundingBox.getCenter(tmp1), boundingBox.getDimensions(tmp2));
    }

    public static boolean intersectRayBoundsFast(Ray ray, Vector3 vector3, Vector3 vector32) {
        float f = 1.0f / ray.direction.x;
        float f2 = 1.0f / ray.direction.y;
        float f3 = 1.0f / ray.direction.z;
        float f4 = ((vector3.x - (vector32.x * 0.5f)) - ray.origin.x) * f;
        float f5 = f * ((vector3.x + (vector32.x * 0.5f)) - ray.origin.x);
        if (f4 <= f5) {
            f4 = f5;
            f5 = f4;
        }
        float f6 = ((vector3.y - (vector32.y * 0.5f)) - ray.origin.y) * f2;
        float f7 = f2 * ((vector3.y + (vector32.y * 0.5f)) - ray.origin.y);
        if (f6 <= f7) {
            f6 = f7;
            f7 = f6;
        }
        float f8 = ((vector3.z - (vector32.z * 0.5f)) - ray.origin.z) * f3;
        float f9 = ((vector3.z + (vector32.z * 0.5f)) - ray.origin.z) * f3;
        if (f8 <= f9) {
            f8 = f9;
            f9 = f8;
        }
        float max = Math.max(Math.max(f5, f7), f9);
        float min = Math.min(Math.min(f4, f6), f8);
        return min >= 0.0f && min >= max;
    }

    public static boolean intersectRayTriangles(Ray ray, float[] fArr, Vector3 vector3) {
        if (fArr.length % 9 == 0) {
            boolean z = false;
            float f = Float.MAX_VALUE;
            for (int i2 = 0; i2 < fArr.length; i2 += 9) {
                if (intersectRayTriangle(ray, tmp1.set(fArr[i2], fArr[i2 + 1], fArr[i2 + 2]), tmp2.set(fArr[i2 + 3], fArr[i2 + 4], fArr[i2 + 5]), tmp3.set(fArr[i2 + 6], fArr[i2 + 7], fArr[i2 + 8]), tmp)) {
                    float dst2 = ray.origin.dst2(tmp);
                    if (dst2 < f) {
                        best.set(tmp);
                        f = dst2;
                        z = true;
                    }
                }
            }
            if (!z) {
                return false;
            }
            if (vector3 != null) {
                vector3.set(best);
            }
            return true;
        }
        throw new RuntimeException("triangles array size is not a multiple of 9");
    }

    public static boolean intersectRayTriangles(Ray ray, float[] fArr, short[] sArr, int i2, Vector3 vector3) {
        if (sArr.length % 3 == 0) {
            boolean z = false;
            float f = Float.MAX_VALUE;
            for (int i3 = 0; i3 < sArr.length; i3 += 3) {
                int i4 = sArr[i3] * i2;
                int i5 = sArr[i3 + 1] * i2;
                int i6 = sArr[i3 + 2] * i2;
                if (intersectRayTriangle(ray, tmp1.set(fArr[i4], fArr[i4 + 1], fArr[i4 + 2]), tmp2.set(fArr[i5], fArr[i5 + 1], fArr[i5 + 2]), tmp3.set(fArr[i6], fArr[i6 + 1], fArr[i6 + 2]), tmp)) {
                    float dst2 = ray.origin.dst2(tmp);
                    if (dst2 < f) {
                        best.set(tmp);
                        f = dst2;
                        z = true;
                    }
                }
            }
            if (!z) {
                return false;
            }
            if (vector3 != null) {
                vector3.set(best);
            }
            return true;
        }
        throw new RuntimeException("triangle list size is not a multiple of 3");
    }

    public static boolean intersectRayTriangles(Ray ray, List<Vector3> list, Vector3 vector3) {
        if (list.size() % 3 == 0) {
            boolean z = false;
            float f = Float.MAX_VALUE;
            for (int i2 = 0; i2 < list.size(); i2 += 3) {
                if (intersectRayTriangle(ray, list.get(i2), list.get(i2 + 1), list.get(i2 + 2), tmp)) {
                    float dst2 = ray.origin.dst2(tmp);
                    if (dst2 < f) {
                        best.set(tmp);
                        f = dst2;
                        z = true;
                    }
                }
            }
            if (!z) {
                return false;
            }
            if (vector3 != null) {
                vector3.set(best);
            }
            return true;
        }
        throw new RuntimeException("triangle list size is not a multiple of 3");
    }

    public static boolean intersectLines(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24, Vector2 vector25) {
        float f = vector2.x;
        float f2 = vector2.y;
        float f3 = vector22.x;
        float f4 = vector22.y;
        float f5 = vector23.x;
        float f6 = vector23.y;
        float f7 = vector24.x;
        float f8 = vector24.y - f6;
        float f9 = f3 - f;
        float f10 = f7 - f5;
        float f11 = f4 - f2;
        float f12 = (f8 * f9) - (f10 * f11);
        if (f12 == 0.0f) {
            return false;
        }
        if (vector25 == null) {
            return true;
        }
        float f13 = ((f10 * (f2 - f6)) - (f8 * (f - f5))) / f12;
        vector25.set(f + (f9 * f13), f2 + (f11 * f13));
        return true;
    }

    public static boolean intersectLines(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, Vector2 vector2) {
        float f9 = f8 - f6;
        float f10 = f3 - f;
        float f11 = f7 - f5;
        float f12 = f4 - f2;
        float f13 = (f9 * f10) - (f11 * f12);
        if (f13 == 0.0f) {
            return false;
        }
        if (vector2 == null) {
            return true;
        }
        float f14 = ((f11 * (f2 - f6)) - (f9 * (f - f5))) / f13;
        vector2.set(f + (f10 * f14), f2 + (f12 * f14));
        return true;
    }

    public static boolean intersectLinePolygon(Vector2 vector2, Vector2 vector22, Polygon polygon) {
        float[] transformedVertices = polygon.getTransformedVertices();
        float f = vector2.x;
        float f2 = vector2.y;
        float f3 = vector22.x;
        float f4 = vector22.y;
        int length = transformedVertices.length;
        float f5 = transformedVertices[length - 2];
        float f6 = transformedVertices[length - 1];
        float f7 = f5;
        int i2 = 0;
        while (i2 < length) {
            float f8 = transformedVertices[i2];
            float f9 = transformedVertices[i2 + 1];
            float f10 = f9 - f6;
            float f11 = f8 - f7;
            float f12 = ((f3 - f) * f10) - ((f4 - f2) * f11);
            if (f12 != 0.0f) {
                float f13 = ((f11 * (f2 - f6)) - (f10 * (f - f7))) / f12;
                if (f13 >= 0.0f && f13 <= 1.0f) {
                    return true;
                }
            }
            i2 += 2;
            f7 = f8;
            f6 = f9;
        }
        return false;
    }

    public static boolean intersectRectangles(Rectangle rectangle, Rectangle rectangle2, Rectangle rectangle3) {
        if (!rectangle.overlaps(rectangle2)) {
            return false;
        }
        rectangle3.x = Math.max(rectangle.x, rectangle2.x);
        rectangle3.width = Math.min(rectangle.x + rectangle.width, rectangle2.x + rectangle2.width) - rectangle3.x;
        rectangle3.y = Math.max(rectangle.y, rectangle2.y);
        rectangle3.height = Math.min(rectangle.y + rectangle.height, rectangle2.y + rectangle2.height) - rectangle3.y;
        return true;
    }

    public static boolean intersectSegmentRectangle(float f, float f2, float f3, float f4, Rectangle rectangle) {
        float f5 = rectangle.x + rectangle.width;
        float f6 = rectangle.y + rectangle.height;
        if (!intersectSegments(f, f2, f3, f4, rectangle.x, rectangle.y, rectangle.x, f6, null) && !intersectSegments(f, f2, f3, f4, rectangle.x, rectangle.y, f5, rectangle.y, null) && !intersectSegments(f, f2, f3, f4, f5, rectangle.y, f5, f6, null) && !intersectSegments(f, f2, f3, f4, rectangle.x, f6, f5, f6, null)) {
            return rectangle.contains(f, f2);
        }
        return true;
    }

    public static boolean intersectSegmentRectangle(Vector2 vector2, Vector2 vector22, Rectangle rectangle) {
        return intersectSegmentRectangle(vector2.x, vector2.y, vector22.x, vector22.y, rectangle);
    }

    public static boolean intersectSegmentPolygon(Vector2 vector2, Vector2 vector22, Polygon polygon) {
        float[] transformedVertices = polygon.getTransformedVertices();
        float f = vector2.x;
        float f2 = vector2.y;
        float f3 = vector22.x;
        float f4 = vector22.y;
        int length = transformedVertices.length;
        float f5 = transformedVertices[length - 2];
        float f6 = transformedVertices[length - 1];
        float f7 = f5;
        int i2 = 0;
        while (i2 < length) {
            float f8 = transformedVertices[i2];
            float f9 = transformedVertices[i2 + 1];
            float f10 = f9 - f6;
            float f11 = f3 - f;
            float f12 = f8 - f7;
            float f13 = f4 - f2;
            float f14 = (f10 * f11) - (f12 * f13);
            if (f14 != 0.0f) {
                float f15 = f2 - f6;
                float f16 = f - f7;
                float f17 = ((f12 * f15) - (f10 * f16)) / f14;
                if (f17 >= 0.0f && f17 <= 1.0f) {
                    float f18 = ((f11 * f15) - (f13 * f16)) / f14;
                    if (f18 >= 0.0f && f18 <= 1.0f) {
                        return true;
                    }
                }
            }
            i2 += 2;
            f7 = f8;
            f6 = f9;
        }
        return false;
    }

    public static boolean intersectSegments(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24, Vector2 vector25) {
        float f = vector2.x;
        float f2 = vector2.y;
        float f3 = vector22.x;
        float f4 = vector22.y;
        float f5 = vector23.x;
        float f6 = vector23.y;
        float f7 = vector24.x;
        float f8 = vector24.y - f6;
        float f9 = f3 - f;
        float f10 = f7 - f5;
        float f11 = f4 - f2;
        float f12 = (f8 * f9) - (f10 * f11);
        if (f12 == 0.0f) {
            return false;
        }
        float f13 = f2 - f6;
        float f14 = f - f5;
        float f15 = ((f10 * f13) - (f8 * f14)) / f12;
        if (f15 >= 0.0f && f15 <= 1.0f) {
            float f16 = ((f13 * f9) - (f14 * f11)) / f12;
            if (f16 >= 0.0f && f16 <= 1.0f) {
                if (vector25 == null) {
                    return true;
                }
                vector25.set(f + (f9 * f15), f2 + (f11 * f15));
                return true;
            }
        }
        return false;
    }

    public static boolean intersectSegments(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, Vector2 vector2) {
        float f9 = f8 - f6;
        float f10 = f3 - f;
        float f11 = f7 - f5;
        float f12 = f4 - f2;
        float f13 = (f9 * f10) - (f11 * f12);
        if (f13 == 0.0f) {
            return false;
        }
        float f14 = f2 - f6;
        float f15 = f - f5;
        float f16 = ((f11 * f14) - (f9 * f15)) / f13;
        if (f16 >= 0.0f && f16 <= 1.0f) {
            float f17 = ((f14 * f10) - (f15 * f12)) / f13;
            if (f17 >= 0.0f && f17 <= 1.0f) {
                if (vector2 == null) {
                    return true;
                }
                vector2.set(f + (f10 * f16), f2 + (f12 * f16));
                return true;
            }
        }
        return false;
    }

    public static boolean overlaps(Circle circle, Circle circle2) {
        return circle.overlaps(circle2);
    }

    public static boolean overlaps(Rectangle rectangle, Rectangle rectangle2) {
        return rectangle.overlaps(rectangle2);
    }

    public static boolean overlaps(Circle circle, Rectangle rectangle) {
        float f = circle.x;
        float f2 = circle.y;
        if (circle.x < rectangle.x) {
            f = rectangle.x;
        } else if (circle.x > rectangle.x + rectangle.width) {
            f = rectangle.x + rectangle.width;
        }
        if (circle.y < rectangle.y) {
            f2 = rectangle.y;
        } else if (circle.y > rectangle.y + rectangle.height) {
            f2 = rectangle.y + rectangle.height;
        }
        float f3 = f - circle.x;
        float f4 = f2 - circle.y;
        return (f3 * f3) + (f4 * f4) < circle.radius * circle.radius;
    }

    public static boolean overlapConvexPolygons(Polygon polygon, Polygon polygon2) {
        return overlapConvexPolygons(polygon, polygon2, (MinimumTranslationVector) null);
    }

    public static boolean overlapConvexPolygons(Polygon polygon, Polygon polygon2, MinimumTranslationVector minimumTranslationVector) {
        return overlapConvexPolygons(polygon.getTransformedVertices(), polygon2.getTransformedVertices(), minimumTranslationVector);
    }

    public static boolean overlapConvexPolygons(float[] fArr, float[] fArr2, MinimumTranslationVector minimumTranslationVector) {
        return overlapConvexPolygons(fArr, 0, fArr.length, fArr2, 0, fArr2.length, minimumTranslationVector);
    }

    public static boolean overlapConvexPolygons(float[] fArr, int i2, int i3, float[] fArr2, int i4, int i5, MinimumTranslationVector minimumTranslationVector) {
        int i6 = i2 + i3;
        int i7 = i4 + i5;
        float f = Float.MAX_VALUE;
        int i8 = i2;
        float f2 = 0.0f;
        float f3 = 0.0f;
        while (true) {
            char c = 1;
            if (i8 < i6) {
                float f4 = fArr[i8];
                float f5 = fArr[i8 + 1];
                int i9 = i8 + 2;
                float f6 = fArr[i9 % i3];
                float f7 = fArr[(i8 + 3) % i3];
                float f8 = f5 - f7;
                float f9 = -(f4 - f6);
                float sqrt = (float) Math.sqrt((double) ((f8 * f8) + (f9 * f9)));
                float f10 = f8 / sqrt;
                float f11 = f9 / sqrt;
                float f12 = (fArr[0] * f10) + (fArr[1] * f11);
                float f13 = f12;
                for (int i10 = i2; i10 < i6; i10 += 2) {
                    float f14 = (fArr[i10] * f10) + (fArr[i10 + 1] * f11);
                    if (f14 < f13) {
                        f13 = f14;
                    } else if (f14 > f12) {
                        f12 = f14;
                    }
                }
                float f15 = (fArr2[0] * f10) + (fArr2[1] * f11);
                int i11 = i4;
                float f16 = f15;
                int i12 = 0;
                while (i11 < i7) {
                    int i13 = i11 + 1;
                    i12 -= pointLineSide(f4, f5, f6, f7, fArr2[i11], fArr2[i13]);
                    float f17 = (f10 * fArr2[i11]) + (f11 * fArr2[i13]);
                    if (f17 < f16) {
                        f15 = f15;
                        f16 = f17;
                    } else if (f17 > f15) {
                        f16 = f16;
                        f15 = f17;
                    } else {
                        f16 = f16;
                        f15 = f15;
                    }
                    i11 += 2;
                    f10 = f10;
                    f11 = f11;
                    f12 = f12;
                    f13 = f13;
                    f2 = f2;
                    f3 = f3;
                    f4 = f4;
                    f7 = f7;
                }
                if ((f13 > f16 || f12 < f16) && (f16 > f13 || f15 < f13)) {
                    return false;
                }
                float min = Math.min(f12, f15) - Math.max(f13, f16);
                if ((f13 < f16 && f12 > f15) || (f16 < f13 && f15 > f12)) {
                    float abs = Math.abs(f13 - f16);
                    float abs2 = Math.abs(f12 - f15);
                    min = abs < abs2 ? min + abs : min + abs2;
                }
                if (min < f) {
                    float f18 = i12 >= 0 ? f10 : -f10;
                    f = min;
                    f3 = i12 >= 0 ? f11 : -f11;
                    f2 = f18;
                } else {
                    f2 = f2;
                    f3 = f3;
                }
                i8 = i9;
            } else {
                int i14 = i4;
                float f19 = f;
                float f20 = f2;
                float f21 = f3;
                while (i14 < i7) {
                    float f22 = fArr2[i14];
                    float f23 = fArr2[i14 + 1];
                    int i15 = i14 + 2;
                    float f24 = fArr2[i15 % i5];
                    float f25 = fArr2[(i14 + 3) % i5];
                    float f26 = f23 - f25;
                    float f27 = -(f22 - f24);
                    float sqrt2 = (float) Math.sqrt((double) ((f26 * f26) + (f27 * f27)));
                    float f28 = f26 / sqrt2;
                    float f29 = f27 / sqrt2;
                    float f30 = (fArr[0] * f28) + (fArr[c] * f29);
                    int i16 = i2;
                    float f31 = f30;
                    int i17 = 0;
                    while (i16 < i6) {
                        int i18 = i16 + 1;
                        float f32 = (fArr[i16] * f28) + (fArr[i18] * f29);
                        i17 -= pointLineSide(f22, f23, f24, f25, fArr[i16], fArr[i18]);
                        if (f32 < f31) {
                            f30 = f30;
                            f31 = f32;
                        } else if (f32 > f30) {
                            f31 = f31;
                            f30 = f32;
                        } else {
                            f31 = f31;
                            f30 = f30;
                        }
                        i16 += 2;
                        f29 = f29;
                        f28 = f28;
                        f22 = f22;
                        i6 = i6;
                        f25 = f25;
                    }
                    float f33 = (f28 * fArr2[0]) + (f29 * fArr2[1]);
                    float f34 = f33;
                    for (int i19 = i4; i19 < i7; i19 += 2) {
                        float f35 = (fArr2[i19] * f28) + (f29 * fArr2[i19 + 1]);
                        if (f35 < f33) {
                            f33 = f35;
                        } else if (f35 > f34) {
                            f34 = f35;
                        }
                    }
                    if ((f31 > f33 || f30 < f33) && (f33 > f31 || f34 < f31)) {
                        return false;
                    }
                    float min2 = Math.min(f30, f34) - Math.max(f31, f33);
                    if ((f31 < f33 && f30 > f34) || (f33 < f31 && f34 > f30)) {
                        float abs3 = Math.abs(f31 - f33);
                        float abs4 = Math.abs(f30 - f34);
                        min2 = abs3 < abs4 ? min2 + abs3 : min2 + abs4;
                    }
                    if (min2 < f19) {
                        float f36 = i17 < 0 ? f28 : -f28;
                        f19 = min2;
                        f21 = i17 < 0 ? f29 : -f29;
                        f20 = f36;
                    }
                    i14 = i15;
                    i6 = i6;
                    c = 1;
                }
                if (minimumTranslationVector == null) {
                    return true;
                }
                minimumTranslationVector.normal.set(f20, f21);
                minimumTranslationVector.depth = f19;
                return true;
            }
        }
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v14, resolved type: boolean */
    /* JADX WARN: Multi-variable type inference failed */
    public static void splitTriangle(float[] fArr, Plane plane, SplitTriangle splitTriangle) {
        int i2;
        int i3;
        int i4;
        int length = fArr.length / 3;
        boolean z = plane.testPoint(fArr[0], fArr[1], fArr[2]) == Plane.PlaneSide.Back ? 1 : 0;
        boolean z2 = plane.testPoint(fArr[length + 0], fArr[length + 1], fArr[length + 2]) == Plane.PlaneSide.Back ? 1 : 0;
        int i5 = length * 2;
        int i6 = plane.testPoint(fArr[i5 + 0], fArr[i5 + 1], fArr[i5 + 2]) == Plane.PlaneSide.Back ? 1 : 0;
        splitTriangle.reset();
        if (z == z2 && z2 == i6) {
            splitTriangle.total = 1;
            if (z != 0) {
                splitTriangle.numBack = 1;
                System.arraycopy(fArr, 0, splitTriangle.back, 0, fArr.length);
                return;
            }
            splitTriangle.numFront = 1;
            System.arraycopy(fArr, 0, splitTriangle.front, 0, fArr.length);
            return;
        }
        splitTriangle.total = 3;
        splitTriangle.numFront = (!z) + (!z2) + (i6 ^ 1);
        splitTriangle.numBack = splitTriangle.total - splitTriangle.numFront;
        splitTriangle.setSide(!z);
        if (z != z2) {
            i3 = i6;
            i2 = i5;
            splitEdge(fArr, 0, length, length, plane, splitTriangle.edgeSplit, 0);
            splitTriangle.add(fArr, 0, length);
            splitTriangle.add(splitTriangle.edgeSplit, 0, length);
            splitTriangle.setSide(!splitTriangle.getSide());
            splitTriangle.add(splitTriangle.edgeSplit, 0, length);
        } else {
            i3 = i6;
            i2 = i5;
            splitTriangle.add(fArr, 0, length);
        }
        int i7 = length + length;
        if (z2 != i3) {
            i4 = i7;
            splitEdge(fArr, length, i7, length, plane, splitTriangle.edgeSplit, 0);
            splitTriangle.add(fArr, length, length);
            splitTriangle.add(splitTriangle.edgeSplit, 0, length);
            splitTriangle.setSide(!splitTriangle.getSide());
            splitTriangle.add(splitTriangle.edgeSplit, 0, length);
        } else {
            i4 = i7;
            splitTriangle.add(fArr, length, length);
        }
        if (i3 != z) {
            splitEdge(fArr, i4, 0, length, plane, splitTriangle.edgeSplit, 0);
            splitTriangle.add(fArr, i4, length);
            splitTriangle.add(splitTriangle.edgeSplit, 0, length);
            splitTriangle.setSide(!splitTriangle.getSide());
            splitTriangle.add(splitTriangle.edgeSplit, 0, length);
        } else {
            splitTriangle.add(fArr, i4, length);
        }
        if (splitTriangle.numFront == 2) {
            System.arraycopy(splitTriangle.front, i2, splitTriangle.front, length * 3, i2);
            System.arraycopy(splitTriangle.front, 0, splitTriangle.front, length * 5, length);
            return;
        }
        System.arraycopy(splitTriangle.back, i2, splitTriangle.back, length * 3, i2);
        System.arraycopy(splitTriangle.back, 0, splitTriangle.back, length * 5, length);
    }

    private static void splitEdge(float[] fArr, int i2, int i3, int i4, Plane plane, float[] fArr2, int i5) {
        float intersectLinePlane = intersectLinePlane(fArr[i2], fArr[i2 + 1], fArr[i2 + 2], fArr[i3], fArr[i3 + 1], fArr[i3 + 2], plane, intersection);
        fArr2[i5 + 0] = intersection.x;
        fArr2[i5 + 1] = intersection.y;
        fArr2[i5 + 2] = intersection.z;
        for (int i6 = 3; i6 < i4; i6++) {
            float f = fArr[i2 + i6];
            fArr2[i5 + i6] = f + ((fArr[i3 + i6] - f) * intersectLinePlane);
        }
    }

    public static class SplitTriangle {
        public float[] back;
        int backOffset = 0;
        float[] edgeSplit;
        public float[] front;
        boolean frontCurrent = false;
        int frontOffset = 0;
        public int numBack;
        public int numFront;
        public int total;

        public SplitTriangle(int i) {
            int i2 = i * 3 * 2;
            this.front = new float[i2];
            this.back = new float[i2];
            this.edgeSplit = new float[i];
        }

        public String toString() {
            return "SplitTriangle [front=" + Arrays.toString(this.front) + ", back=" + Arrays.toString(this.back) + ", numFront=" + this.numFront + ", numBack=" + this.numBack + ", total=" + this.total + "]";
        }

        /* access modifiers changed from: package-private */
        public void setSide(boolean z) {
            this.frontCurrent = z;
        }

        /* access modifiers changed from: package-private */
        public boolean getSide() {
            return this.frontCurrent;
        }

        /* access modifiers changed from: package-private */
        public void add(float[] fArr, int i, int i2) {
            if (this.frontCurrent) {
                System.arraycopy(fArr, i, this.front, this.frontOffset, i2);
                this.frontOffset += i2;
                return;
            }
            System.arraycopy(fArr, i, this.back, this.backOffset, i2);
            this.backOffset += i2;
        }

        /* access modifiers changed from: package-private */
        public void reset() {
            this.frontCurrent = false;
            this.frontOffset = 0;
            this.backOffset = 0;
            this.numFront = 0;
            this.numBack = 0;
            this.total = 0;
        }
    }
}
