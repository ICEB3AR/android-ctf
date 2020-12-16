package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public final class CylinderSpawnShapeValue extends PrimitiveSpawnShapeValue {
    public CylinderSpawnShapeValue(CylinderSpawnShapeValue cylinderSpawnShapeValue) {
        super(cylinderSpawnShapeValue);
        load(cylinderSpawnShapeValue);
    }

    public CylinderSpawnShapeValue() {
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public void spawnAux(Vector3 vector3, float f) {
        float f2;
        float scale = this.spawnWidth + (this.spawnWidthDiff * this.spawnWidthValue.getScale(f));
        float scale2 = this.spawnHeight + (this.spawnHeightDiff * this.spawnHeightValue.getScale(f));
        float scale3 = this.spawnDepth + (this.spawnDepthDiff * this.spawnDepthValue.getScale(f));
        float random = MathUtils.random(scale2) - (scale2 / 2.0f);
        if (this.edges) {
            f2 = scale / 2.0f;
        } else {
            f2 = MathUtils.random(scale) / 2.0f;
            scale3 = MathUtils.random(scale3);
        }
        float f3 = scale3 / 2.0f;
        boolean z = false;
        float f4 = 0.0f;
        boolean z2 = f2 == 0.0f;
        if (f3 == 0.0f) {
            z = true;
        }
        if (!z2 && !z) {
            f4 = MathUtils.random(360.0f);
        } else if (z2) {
            f4 = MathUtils.random(1) == 0 ? -90.0f : 90.0f;
        } else if (z && MathUtils.random(1) != 0) {
            f4 = 180.0f;
        }
        vector3.set(f2 * MathUtils.cosDeg(f4), random, f3 * MathUtils.sinDeg(f4));
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public SpawnShapeValue copy() {
        return new CylinderSpawnShapeValue(this);
    }
}
