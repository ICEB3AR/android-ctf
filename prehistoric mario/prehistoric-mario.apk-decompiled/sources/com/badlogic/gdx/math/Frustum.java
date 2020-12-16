package com.badlogic.gdx.math;

import com.badlogic.gdx.math.Plane;
import com.badlogic.gdx.math.collision.BoundingBox;

public class Frustum {
    protected static final Vector3[] clipSpacePlanePoints = {new Vector3(-1.0f, -1.0f, -1.0f), new Vector3(1.0f, -1.0f, -1.0f), new Vector3(1.0f, 1.0f, -1.0f), new Vector3(-1.0f, 1.0f, -1.0f), new Vector3(-1.0f, -1.0f, 1.0f), new Vector3(1.0f, -1.0f, 1.0f), new Vector3(1.0f, 1.0f, 1.0f), new Vector3(-1.0f, 1.0f, 1.0f)};
    protected static final float[] clipSpacePlanePointsArray = new float[24];
    private static final Vector3 tmpV = new Vector3();
    public final Vector3[] planePoints;
    protected final float[] planePointsArray;
    public final Plane[] planes = new Plane[6];

    static {
        int i = 0;
        Vector3[] vector3Arr = clipSpacePlanePoints;
        int length = vector3Arr.length;
        int i2 = 0;
        while (i < length) {
            Vector3 vector3 = vector3Arr[i];
            int i3 = i2 + 1;
            clipSpacePlanePointsArray[i2] = vector3.x;
            int i4 = i3 + 1;
            clipSpacePlanePointsArray[i3] = vector3.y;
            clipSpacePlanePointsArray[i4] = vector3.z;
            i++;
            i2 = i4 + 1;
        }
    }

    public Frustum() {
        this.planePoints = new Vector3[]{new Vector3(), new Vector3(), new Vector3(), new Vector3(), new Vector3(), new Vector3(), new Vector3(), new Vector3()};
        this.planePointsArray = new float[24];
        for (int i = 0; i < 6; i++) {
            this.planes[i] = new Plane(new Vector3(), 0.0f);
        }
    }

    public void update(Matrix4 matrix4) {
        float[] fArr = clipSpacePlanePointsArray;
        System.arraycopy(fArr, 0, this.planePointsArray, 0, fArr.length);
        Matrix4.prj(matrix4.val, this.planePointsArray, 0, 8, 3);
        int i = 0;
        int i2 = 0;
        while (i < 8) {
            Vector3 vector3 = this.planePoints[i];
            float[] fArr2 = this.planePointsArray;
            int i3 = i2 + 1;
            vector3.x = fArr2[i2];
            int i4 = i3 + 1;
            vector3.y = fArr2[i3];
            vector3.z = fArr2[i4];
            i++;
            i2 = i4 + 1;
        }
        Plane plane = this.planes[0];
        Vector3[] vector3Arr = this.planePoints;
        plane.set(vector3Arr[1], vector3Arr[0], vector3Arr[2]);
        Plane plane2 = this.planes[1];
        Vector3[] vector3Arr2 = this.planePoints;
        plane2.set(vector3Arr2[4], vector3Arr2[5], vector3Arr2[7]);
        Plane plane3 = this.planes[2];
        Vector3[] vector3Arr3 = this.planePoints;
        plane3.set(vector3Arr3[0], vector3Arr3[4], vector3Arr3[3]);
        Plane plane4 = this.planes[3];
        Vector3[] vector3Arr4 = this.planePoints;
        plane4.set(vector3Arr4[5], vector3Arr4[1], vector3Arr4[6]);
        Plane plane5 = this.planes[4];
        Vector3[] vector3Arr5 = this.planePoints;
        plane5.set(vector3Arr5[2], vector3Arr5[3], vector3Arr5[6]);
        Plane plane6 = this.planes[5];
        Vector3[] vector3Arr6 = this.planePoints;
        plane6.set(vector3Arr6[4], vector3Arr6[0], vector3Arr6[1]);
    }

    public boolean pointInFrustum(Vector3 vector3) {
        int i = 0;
        while (true) {
            Plane[] planeArr = this.planes;
            if (i >= planeArr.length) {
                return true;
            }
            if (planeArr[i].testPoint(vector3) == Plane.PlaneSide.Back) {
                return false;
            }
            i++;
        }
    }

    public boolean pointInFrustum(float f, float f2, float f3) {
        int i = 0;
        while (true) {
            Plane[] planeArr = this.planes;
            if (i >= planeArr.length) {
                return true;
            }
            if (planeArr[i].testPoint(f, f2, f3) == Plane.PlaneSide.Back) {
                return false;
            }
            i++;
        }
    }

    public boolean sphereInFrustum(Vector3 vector3, float f) {
        for (int i = 0; i < 6; i++) {
            if ((this.planes[i].normal.x * vector3.x) + (this.planes[i].normal.y * vector3.y) + (this.planes[i].normal.z * vector3.z) < (-f) - this.planes[i].d) {
                return false;
            }
        }
        return true;
    }

    public boolean sphereInFrustum(float f, float f2, float f3, float f4) {
        for (int i = 0; i < 6; i++) {
            if ((this.planes[i].normal.x * f) + (this.planes[i].normal.y * f2) + (this.planes[i].normal.z * f3) < (-f4) - this.planes[i].d) {
                return false;
            }
        }
        return true;
    }

    public boolean sphereInFrustumWithoutNearFar(Vector3 vector3, float f) {
        for (int i = 2; i < 6; i++) {
            if ((this.planes[i].normal.x * vector3.x) + (this.planes[i].normal.y * vector3.y) + (this.planes[i].normal.z * vector3.z) < (-f) - this.planes[i].d) {
                return false;
            }
        }
        return true;
    }

    public boolean sphereInFrustumWithoutNearFar(float f, float f2, float f3, float f4) {
        for (int i = 2; i < 6; i++) {
            if ((this.planes[i].normal.x * f) + (this.planes[i].normal.y * f2) + (this.planes[i].normal.z * f3) < (-f4) - this.planes[i].d) {
                return false;
            }
        }
        return true;
    }

    public boolean boundsInFrustum(BoundingBox boundingBox) {
        int length = this.planes.length;
        for (int i = 0; i < length; i++) {
            if (this.planes[i].testPoint(boundingBox.getCorner000(tmpV)) == Plane.PlaneSide.Back && this.planes[i].testPoint(boundingBox.getCorner001(tmpV)) == Plane.PlaneSide.Back && this.planes[i].testPoint(boundingBox.getCorner010(tmpV)) == Plane.PlaneSide.Back && this.planes[i].testPoint(boundingBox.getCorner011(tmpV)) == Plane.PlaneSide.Back && this.planes[i].testPoint(boundingBox.getCorner100(tmpV)) == Plane.PlaneSide.Back && this.planes[i].testPoint(boundingBox.getCorner101(tmpV)) == Plane.PlaneSide.Back && this.planes[i].testPoint(boundingBox.getCorner110(tmpV)) == Plane.PlaneSide.Back && this.planes[i].testPoint(boundingBox.getCorner111(tmpV)) == Plane.PlaneSide.Back) {
                return false;
            }
        }
        return true;
    }

    public boolean boundsInFrustum(Vector3 vector3, Vector3 vector32) {
        return boundsInFrustum(vector3.x, vector3.y, vector3.z, vector32.x / 2.0f, vector32.y / 2.0f, vector32.z / 2.0f);
    }

    public boolean boundsInFrustum(float f, float f2, float f3, float f4, float f5, float f6) {
        int length = this.planes.length;
        for (int i = 0; i < length; i++) {
            float f7 = f + f4;
            float f8 = f2 + f5;
            float f9 = f3 + f6;
            if (this.planes[i].testPoint(f7, f8, f9) == Plane.PlaneSide.Back) {
                float f10 = f3 - f6;
                if (this.planes[i].testPoint(f7, f8, f10) != Plane.PlaneSide.Back) {
                    continue;
                } else {
                    float f11 = f2 - f5;
                    if (this.planes[i].testPoint(f7, f11, f9) == Plane.PlaneSide.Back && this.planes[i].testPoint(f7, f11, f10) == Plane.PlaneSide.Back) {
                        float f12 = f - f4;
                        if (this.planes[i].testPoint(f12, f8, f9) == Plane.PlaneSide.Back && this.planes[i].testPoint(f12, f8, f10) == Plane.PlaneSide.Back && this.planes[i].testPoint(f12, f11, f9) == Plane.PlaneSide.Back && this.planes[i].testPoint(f12, f11, f10) == Plane.PlaneSide.Back) {
                            return false;
                        }
                    }
                }
            }
        }
        return true;
    }
}
