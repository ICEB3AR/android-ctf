package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public final class RectangleSpawnShapeValue extends PrimitiveSpawnShapeValue {
    public RectangleSpawnShapeValue(RectangleSpawnShapeValue rectangleSpawnShapeValue) {
        super(rectangleSpawnShapeValue);
        load(rectangleSpawnShapeValue);
    }

    public RectangleSpawnShapeValue() {
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public void spawnAux(Vector3 vector3, float f) {
        float f2;
        float f3;
        float f4;
        float f5;
        float f6;
        float f7;
        float scale = this.spawnWidth + (this.spawnWidthDiff * this.spawnWidthValue.getScale(f));
        float scale2 = this.spawnHeight + (this.spawnHeightDiff * this.spawnHeightValue.getScale(f));
        float scale3 = this.spawnDepth + (this.spawnDepthDiff * this.spawnDepthValue.getScale(f));
        if (this.edges) {
            int random = MathUtils.random(-1, 1);
            if (random == -1) {
                float f8 = MathUtils.random(1) == 0 ? (-scale) / 2.0f : scale / 2.0f;
                if (f8 == 0.0f) {
                    f7 = MathUtils.random(1) == 0 ? (-scale2) / 2.0f : scale2 / 2.0f;
                    f3 = MathUtils.random(1) == 0 ? (-scale3) / 2.0f : scale3 / 2.0f;
                } else {
                    f7 = MathUtils.random(scale2) - (scale2 / 2.0f);
                    f3 = MathUtils.random(scale3) - (scale3 / 2.0f);
                }
                f6 = f7;
                f4 = f8;
            } else if (random == 0) {
                float f9 = MathUtils.random(1) == 0 ? (-scale3) / 2.0f : scale3 / 2.0f;
                if (f9 == 0.0f) {
                    if (MathUtils.random(1) == 0) {
                        scale2 = -scale2;
                    }
                    f5 = scale2 / 2.0f;
                    if (MathUtils.random(1) == 0) {
                        scale = -scale;
                    }
                    f4 = scale / 2.0f;
                } else {
                    f5 = MathUtils.random(scale2) - (scale2 / 2.0f);
                    f4 = MathUtils.random(scale) - (scale / 2.0f);
                }
                f6 = f5;
                f3 = f9;
            } else {
                f2 = MathUtils.random(1) == 0 ? (-scale2) / 2.0f : scale2 / 2.0f;
                if (f2 == 0.0f) {
                    if (MathUtils.random(1) == 0) {
                        scale = -scale;
                    }
                    f4 = scale / 2.0f;
                    f3 = MathUtils.random(1) == 0 ? (-scale3) / 2.0f : scale3 / 2.0f;
                } else {
                    f4 = MathUtils.random(scale) - (scale / 2.0f);
                    f3 = MathUtils.random(scale3) - (scale3 / 2.0f);
                }
                vector3.x = f4;
                vector3.y = f2;
                vector3.z = f3;
                return;
            }
            f2 = f6;
            vector3.x = f4;
            vector3.y = f2;
            vector3.z = f3;
            return;
        }
        vector3.x = MathUtils.random(scale) - (scale / 2.0f);
        vector3.y = MathUtils.random(scale2) - (scale2 / 2.0f);
        vector3.z = MathUtils.random(scale3) - (scale3 / 2.0f);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public SpawnShapeValue copy() {
        return new RectangleSpawnShapeValue(this);
    }
}
