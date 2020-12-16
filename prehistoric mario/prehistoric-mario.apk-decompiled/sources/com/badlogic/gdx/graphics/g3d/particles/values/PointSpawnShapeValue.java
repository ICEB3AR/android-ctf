package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.Vector3;

public final class PointSpawnShapeValue extends PrimitiveSpawnShapeValue {
    public PointSpawnShapeValue(PointSpawnShapeValue pointSpawnShapeValue) {
        super(pointSpawnShapeValue);
        load(pointSpawnShapeValue);
    }

    public PointSpawnShapeValue() {
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public void spawnAux(Vector3 vector3, float f) {
        vector3.x = this.spawnWidth + (this.spawnWidthDiff * this.spawnWidthValue.getScale(f));
        vector3.y = this.spawnHeight + (this.spawnHeightDiff * this.spawnHeightValue.getScale(f));
        vector3.z = this.spawnDepth + (this.spawnDepthDiff * this.spawnDepthValue.getScale(f));
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public SpawnShapeValue copy() {
        return new PointSpawnShapeValue(this);
    }
}
