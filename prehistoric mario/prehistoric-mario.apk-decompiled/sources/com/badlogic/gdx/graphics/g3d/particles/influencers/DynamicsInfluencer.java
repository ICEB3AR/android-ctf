package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleController;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;
import java.util.Arrays;

public class DynamicsInfluencer extends Influencer {
    private ParallelArray.FloatChannel accellerationChannel;
    private ParallelArray.FloatChannel angularVelocityChannel;
    boolean has2dAngularVelocity;
    boolean has3dAngularVelocity;
    boolean hasAcceleration;
    private ParallelArray.FloatChannel positionChannel;
    private ParallelArray.FloatChannel previousPositionChannel;
    private ParallelArray.FloatChannel rotationChannel;
    public Array<DynamicsModifier> velocities;

    public DynamicsInfluencer() {
        this.velocities = new Array<>(true, 3, DynamicsModifier.class);
    }

    public DynamicsInfluencer(DynamicsModifier... dynamicsModifierArr) {
        this.velocities = new Array<>(true, dynamicsModifierArr.length, DynamicsModifier.class);
        for (DynamicsModifier dynamicsModifier : dynamicsModifierArr) {
            this.velocities.add((DynamicsModifier) dynamicsModifier.copy());
        }
    }

    public DynamicsInfluencer(DynamicsInfluencer dynamicsInfluencer) {
        this((DynamicsModifier[]) dynamicsInfluencer.velocities.toArray(DynamicsModifier.class));
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void allocateChannels() {
        boolean z = false;
        for (int i = 0; i < this.velocities.size; i++) {
            this.velocities.items[i].allocateChannels();
        }
        this.accellerationChannel = (ParallelArray.FloatChannel) this.controller.particles.getChannel(ParticleChannels.Acceleration);
        this.hasAcceleration = this.accellerationChannel != null;
        if (this.hasAcceleration) {
            this.positionChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Position);
            this.previousPositionChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.PreviousPosition);
        }
        this.angularVelocityChannel = (ParallelArray.FloatChannel) this.controller.particles.getChannel(ParticleChannels.AngularVelocity2D);
        this.has2dAngularVelocity = this.angularVelocityChannel != null;
        if (this.has2dAngularVelocity) {
            this.rotationChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Rotation2D);
            this.has3dAngularVelocity = false;
            return;
        }
        this.angularVelocityChannel = (ParallelArray.FloatChannel) this.controller.particles.getChannel(ParticleChannels.AngularVelocity3D);
        if (this.angularVelocityChannel != null) {
            z = true;
        }
        this.has3dAngularVelocity = z;
        if (this.has3dAngularVelocity) {
            this.rotationChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Rotation3D);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void set(ParticleController particleController) {
        super.set(particleController);
        for (int i = 0; i < this.velocities.size; i++) {
            this.velocities.items[i].set(particleController);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void init() {
        for (int i = 0; i < this.velocities.size; i++) {
            this.velocities.items[i].init();
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void activateParticles(int i, int i2) {
        if (this.hasAcceleration) {
            int i3 = this.positionChannel.strideSize * i;
            int i4 = (this.positionChannel.strideSize * i2) + i3;
            while (i3 < i4) {
                int i5 = i3 + 0;
                this.previousPositionChannel.data[i5] = this.positionChannel.data[i5];
                int i6 = i3 + 1;
                this.previousPositionChannel.data[i6] = this.positionChannel.data[i6];
                int i7 = i3 + 2;
                this.previousPositionChannel.data[i7] = this.positionChannel.data[i7];
                i3 += this.positionChannel.strideSize;
            }
        }
        if (this.has2dAngularVelocity) {
            int i8 = this.rotationChannel.strideSize * i;
            int i9 = (this.rotationChannel.strideSize * i2) + i8;
            while (i8 < i9) {
                this.rotationChannel.data[i8 + 0] = 1.0f;
                this.rotationChannel.data[i8 + 1] = 0.0f;
                i8 += this.rotationChannel.strideSize;
            }
        } else if (this.has3dAngularVelocity) {
            int i10 = this.rotationChannel.strideSize * i;
            int i11 = (this.rotationChannel.strideSize * i2) + i10;
            while (i10 < i11) {
                this.rotationChannel.data[i10 + 0] = 0.0f;
                this.rotationChannel.data[i10 + 1] = 0.0f;
                this.rotationChannel.data[i10 + 2] = 0.0f;
                this.rotationChannel.data[i10 + 3] = 1.0f;
                i10 += this.rotationChannel.strideSize;
            }
        }
        for (int i12 = 0; i12 < this.velocities.size; i12++) {
            this.velocities.items[i12].activateParticles(i, i2);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void update() {
        int i = 0;
        if (this.hasAcceleration) {
            Arrays.fill(this.accellerationChannel.data, 0, this.controller.particles.size * this.accellerationChannel.strideSize, 0.0f);
        }
        if (this.has2dAngularVelocity || this.has3dAngularVelocity) {
            Arrays.fill(this.angularVelocityChannel.data, 0, this.controller.particles.size * this.angularVelocityChannel.strideSize, 0.0f);
        }
        for (int i2 = 0; i2 < this.velocities.size; i2++) {
            this.velocities.items[i2].update();
        }
        if (this.hasAcceleration) {
            int i3 = 0;
            int i4 = 0;
            while (i3 < this.controller.particles.size) {
                int i5 = i4 + 0;
                float f = this.positionChannel.data[i5];
                int i6 = i4 + 1;
                float f2 = this.positionChannel.data[i6];
                int i7 = i4 + 2;
                float f3 = this.positionChannel.data[i7];
                this.positionChannel.data[i5] = ((f * 2.0f) - this.previousPositionChannel.data[i5]) + (this.accellerationChannel.data[i5] * this.controller.deltaTimeSqr);
                this.positionChannel.data[i6] = ((f2 * 2.0f) - this.previousPositionChannel.data[i6]) + (this.accellerationChannel.data[i6] * this.controller.deltaTimeSqr);
                this.positionChannel.data[i7] = ((2.0f * f3) - this.previousPositionChannel.data[i7]) + (this.accellerationChannel.data[i7] * this.controller.deltaTimeSqr);
                this.previousPositionChannel.data[i5] = f;
                this.previousPositionChannel.data[i6] = f2;
                this.previousPositionChannel.data[i7] = f3;
                i3++;
                i4 += this.positionChannel.strideSize;
            }
        }
        if (this.has2dAngularVelocity) {
            int i8 = 0;
            while (i < this.controller.particles.size) {
                float f4 = this.angularVelocityChannel.data[i] * this.controller.deltaTime;
                if (f4 != 0.0f) {
                    float cosDeg = MathUtils.cosDeg(f4);
                    float sinDeg = MathUtils.sinDeg(f4);
                    int i9 = i8 + 0;
                    float f5 = this.rotationChannel.data[i9];
                    int i10 = i8 + 1;
                    float f6 = this.rotationChannel.data[i10];
                    this.rotationChannel.data[i9] = (f5 * cosDeg) - (f6 * sinDeg);
                    this.rotationChannel.data[i10] = (f6 * cosDeg) + (f5 * sinDeg);
                }
                i++;
                i8 += this.rotationChannel.strideSize;
            }
        } else if (this.has3dAngularVelocity) {
            int i11 = 0;
            int i12 = 0;
            while (i < this.controller.particles.size) {
                float f7 = this.angularVelocityChannel.data[i11 + 0];
                float f8 = this.angularVelocityChannel.data[i11 + 1];
                float f9 = this.angularVelocityChannel.data[i11 + 2];
                int i13 = i12 + 0;
                float f10 = this.rotationChannel.data[i13];
                int i14 = i12 + 1;
                float f11 = this.rotationChannel.data[i14];
                int i15 = i12 + 2;
                float f12 = this.rotationChannel.data[i15];
                int i16 = i12 + 3;
                float f13 = this.rotationChannel.data[i16];
                TMP_Q.set(f7, f8, f9, 0.0f).mul(f10, f11, f12, f13).mul(this.controller.deltaTime * 0.5f).add(f10, f11, f12, f13).nor();
                this.rotationChannel.data[i13] = TMP_Q.x;
                this.rotationChannel.data[i14] = TMP_Q.y;
                this.rotationChannel.data[i15] = TMP_Q.z;
                this.rotationChannel.data[i16] = TMP_Q.w;
                i++;
                i12 += this.rotationChannel.strideSize;
                i11 += this.angularVelocityChannel.strideSize;
            }
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public DynamicsInfluencer copy() {
        return new DynamicsInfluencer(this);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
    public void write(Json json) {
        json.writeValue("velocities", this.velocities, Array.class, DynamicsModifier.class);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
    public void read(Json json, JsonValue jsonValue) {
        this.velocities.addAll((Array) json.readValue("velocities", Array.class, DynamicsModifier.class, jsonValue));
    }
}
