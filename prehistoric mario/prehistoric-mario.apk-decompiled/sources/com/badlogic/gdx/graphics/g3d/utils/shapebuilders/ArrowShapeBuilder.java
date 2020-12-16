package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;

public class ArrowShapeBuilder extends BaseShapeBuilder {
    public static void build(MeshPartBuilder meshPartBuilder, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, int i) {
        Vector3 vector3 = obtainV3().set(f, f2, f3);
        Vector3 vector32 = obtainV3().set(f4, f5, f6);
        float dst = vector3.dst(vector32);
        float f9 = dst * f7;
        double d = (double) f9;
        double sqrt = Math.sqrt(0.3333333432674408d);
        Double.isNaN(d);
        float f10 = ((float) (d * sqrt)) * 2.0f;
        float f11 = dst - f9;
        float f12 = f10 * f8;
        Vector3 nor = obtainV3().set(vector32).sub(vector3).nor();
        Vector3 crs = obtainV3().set(nor).crs(Vector3.Z);
        if (crs.isZero()) {
            crs.set(Vector3.X);
        }
        crs.crs(nor).nor();
        Vector3 nor2 = obtainV3().set(nor).crs(crs).nor();
        Vector3 nor3 = obtainV3().set(vector32).sub(vector3).nor();
        Matrix4 vertexTransform = meshPartBuilder.getVertexTransform(obtainM4());
        Matrix4 obtainM4 = obtainM4();
        float[] fArr = obtainM4.val;
        fArr[0] = nor2.x;
        fArr[4] = nor.x;
        fArr[8] = crs.x;
        fArr[1] = nor2.y;
        fArr[5] = nor.y;
        fArr[9] = crs.y;
        fArr[2] = nor2.z;
        fArr[6] = nor.z;
        fArr[10] = crs.z;
        Matrix4 obtainM42 = obtainM4();
        obtainM4.setTranslation(obtainV3().set(nor3).scl(f11 / 2.0f).add(f, f2, f3));
        meshPartBuilder.setVertexTransform(obtainM42.set(obtainM4).mul(vertexTransform));
        CylinderShapeBuilder.build(meshPartBuilder, f12, f11, f12, i);
        obtainM4.setTranslation(obtainV3().set(nor3).scl(f11).add(f, f2, f3));
        meshPartBuilder.setVertexTransform(obtainM42.set(obtainM4).mul(vertexTransform));
        ConeShapeBuilder.build(meshPartBuilder, f10, f9, f10, i);
        meshPartBuilder.setVertexTransform(vertexTransform);
        freeAll();
    }
}