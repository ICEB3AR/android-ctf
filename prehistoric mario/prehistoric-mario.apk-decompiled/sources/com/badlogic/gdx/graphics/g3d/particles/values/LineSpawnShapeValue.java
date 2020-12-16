package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public final class LineSpawnShapeValue extends PrimitiveSpawnShapeValue {
    public LineSpawnShapeValue(LineSpawnShapeValue lineSpawnShapeValue) {
        super(lineSpawnShapeValue);
        load(lineSpawnShapeValue);
    }

    public LineSpawnShapeValue() {
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public void spawnAux(Vector3 vector3, float f) {
        float scale = this.spawnWidth + (this.spawnWidthDiff * this.spawnWidthValue.getScale(f));
        float scale2 = this.spawnHeight + (this.spawnHeightDiff * this.spawnHeightValue.getScale(f));
        float random = MathUtils.random();
        vector3.x = scale * random;
        vector3.y = scale2 * random;
        vector3.z = random * (this.spawnDepth + (this.spawnDepthDiff * this.spawnDepthValue.getScale(f)));
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public SpawnShapeValue copy() {
        return new LineSpawnShapeValue(this);
    }
}
