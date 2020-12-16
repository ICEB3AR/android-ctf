package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ResourceData;
import com.badlogic.gdx.graphics.g3d.particles.values.PointSpawnShapeValue;
import com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class SpawnInfluencer extends Influencer {
    ParallelArray.FloatChannel positionChannel;
    public SpawnShapeValue spawnShapeValue;

    public SpawnInfluencer() {
        this.spawnShapeValue = new PointSpawnShapeValue();
    }

    public SpawnInfluencer(SpawnShapeValue spawnShapeValue2) {
        this.spawnShapeValue = spawnShapeValue2;
    }

    public SpawnInfluencer(SpawnInfluencer spawnInfluencer) {
        this.spawnShapeValue = spawnInfluencer.spawnShapeValue.copy();
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void init() {
        this.spawnShapeValue.init();
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void allocateChannels() {
        this.positionChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Position);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void start() {
        this.spawnShapeValue.start();
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void activateParticles(int i, int i2) {
        int i3 = i * this.positionChannel.strideSize;
        int i4 = (i2 * this.positionChannel.strideSize) + i3;
        while (i3 < i4) {
            this.spawnShapeValue.spawn(TMP_V1, this.controller.emitter.percent);
            TMP_V1.mul(this.controller.transform);
            this.positionChannel.data[i3 + 0] = TMP_V1.x;
            this.positionChannel.data[i3 + 1] = TMP_V1.y;
            this.positionChannel.data[i3 + 2] = TMP_V1.z;
            i3 += this.positionChannel.strideSize;
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public SpawnInfluencer copy() {
        return new SpawnInfluencer(this);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
    public void write(Json json) {
        json.writeValue("spawnShape", this.spawnShapeValue, SpawnShapeValue.class);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
    public void read(Json json, JsonValue jsonValue) {
        this.spawnShapeValue = (SpawnShapeValue) json.readValue("spawnShape", SpawnShapeValue.class, jsonValue);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void save(AssetManager assetManager, ResourceData resourceData) {
        this.spawnShapeValue.save(assetManager, resourceData);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ResourceData.Configurable, com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void load(AssetManager assetManager, ResourceData resourceData) {
        this.spawnShapeValue.load(assetManager, resourceData);
    }
}
