package com.uwsoft.editor.renderer.data;

import com.badlogic.gdx.math.Vector2;

public class MeshVO {
    public PhysicsBodyDataVO initialProperties;
    public Vector2[][] minPolygonData;

    public MeshVO clone() {
        MeshVO meshVO = new MeshVO();
        Vector2[][] vector2Arr = new Vector2[this.minPolygonData.length][];
        int i = 0;
        while (true) {
            Vector2[][] vector2Arr2 = this.minPolygonData;
            if (i >= vector2Arr2.length) {
                break;
            }
            vector2Arr[i] = new Vector2[vector2Arr2[i].length];
            int i2 = 0;
            while (true) {
                Vector2[][] vector2Arr3 = this.minPolygonData;
                if (i2 >= vector2Arr3[i].length) {
                    break;
                }
                vector2Arr[i][i2] = vector2Arr3[i][i2].cpy();
                i2++;
            }
            i++;
        }
        meshVO.minPolygonData = vector2Arr;
        PhysicsBodyDataVO physicsBodyDataVO = this.initialProperties;
        if (physicsBodyDataVO != null) {
            meshVO.initialProperties = new PhysicsBodyDataVO(physicsBodyDataVO);
        }
        return meshVO;
    }
}
