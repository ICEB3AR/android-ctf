package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.graphics.g3d.particles.values.PrimitiveSpawnShapeValue;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public final class EllipseSpawnShapeValue extends PrimitiveSpawnShapeValue {
    PrimitiveSpawnShapeValue.SpawnSide side = PrimitiveSpawnShapeValue.SpawnSide.both;

    public EllipseSpawnShapeValue(EllipseSpawnShapeValue ellipseSpawnShapeValue) {
        super(ellipseSpawnShapeValue);
        load(ellipseSpawnShapeValue);
    }

    public EllipseSpawnShapeValue() {
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public void spawnAux(Vector3 vector3, float f) {
        float f2;
        float f3;
        float f4;
        float f5;
        float scale = this.spawnWidth + (this.spawnWidthDiff * this.spawnWidthValue.getScale(f));
        float scale2 = this.spawnHeight + (this.spawnHeightDiff * this.spawnHeightValue.getScale(f));
        float scale3 = this.spawnDepth + (this.spawnDepthDiff * this.spawnDepthValue.getScale(f));
        if (this.side == PrimitiveSpawnShapeValue.SpawnSide.top) {
            f2 = 3.1415927f;
        } else {
            f2 = this.side == PrimitiveSpawnShapeValue.SpawnSide.bottom ? -3.1415927f : 6.2831855f;
        }
        float random = MathUtils.random(0.0f, f2);
        if (!this.edges) {
            f5 = MathUtils.random(scale / 2.0f);
            f4 = MathUtils.random(scale2 / 2.0f);
            f3 = MathUtils.random(scale3 / 2.0f);
        } else if (scale == 0.0f) {
            vector3.set(0.0f, (scale2 / 2.0f) * MathUtils.sin(random), (scale3 / 2.0f) * MathUtils.cos(random));
            return;
        } else if (scale2 == 0.0f) {
            vector3.set((scale / 2.0f) * MathUtils.cos(random), 0.0f, (scale3 / 2.0f) * MathUtils.sin(random));
            return;
        } else if (scale3 == 0.0f) {
            vector3.set((scale / 2.0f) * MathUtils.cos(random), (scale2 / 2.0f) * MathUtils.sin(random), 0.0f);
            return;
        } else {
            f5 = scale / 2.0f;
            f4 = scale2 / 2.0f;
            f3 = scale3 / 2.0f;
        }
        float random2 = MathUtils.random(-1.0f, 1.0f);
        float sqrt = (float) Math.sqrt((double) (1.0f - (random2 * random2)));
        vector3.set(f5 * sqrt * MathUtils.cos(random), f4 * sqrt * MathUtils.sin(random), f3 * random2);
    }

    public PrimitiveSpawnShapeValue.SpawnSide getSide() {
        return this.side;
    }

    public void setSide(PrimitiveSpawnShapeValue.SpawnSide spawnSide) {
        this.side = spawnSide;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue, com.badlogic.gdx.graphics.g3d.particles.values.ParticleValue, com.badlogic.gdx.graphics.g3d.particles.values.PrimitiveSpawnShapeValue
    public void load(ParticleValue particleValue) {
        super.load(particleValue);
        this.side = ((EllipseSpawnShapeValue) particleValue).side;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public SpawnShapeValue copy() {
        return new EllipseSpawnShapeValue(this);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue, com.badlogic.gdx.graphics.g3d.particles.values.ParticleValue, com.badlogic.gdx.graphics.g3d.particles.values.PrimitiveSpawnShapeValue, com.badlogic.gdx.utils.Json.Serializable
    public void write(Json json) {
        super.write(json);
        json.writeValue("side", this.side);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue, com.badlogic.gdx.graphics.g3d.particles.values.ParticleValue, com.badlogic.gdx.graphics.g3d.particles.values.PrimitiveSpawnShapeValue, com.badlogic.gdx.utils.Json.Serializable
    public void read(Json json, JsonValue jsonValue) {
        super.read(json, jsonValue);
        this.side = (PrimitiveSpawnShapeValue.SpawnSide) json.readValue("side", PrimitiveSpawnShapeValue.SpawnSide.class, jsonValue);
    }
}
