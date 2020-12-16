package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.values.GradientColorValue;
import com.badlogic.gdx.graphics.g3d.particles.values.ScaledNumericValue;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class ColorInfluencer extends Influencer {
    ParallelArray.FloatChannel colorChannel;

    public static class Random extends ColorInfluencer {
        ParallelArray.FloatChannel colorChannel;

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.ColorInfluencer
        public void allocateChannels() {
            this.colorChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Color);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void activateParticles(int i, int i2) {
            int i3 = i * this.colorChannel.strideSize;
            int i4 = (i2 * this.colorChannel.strideSize) + i3;
            while (i3 < i4) {
                this.colorChannel.data[i3 + 0] = MathUtils.random();
                this.colorChannel.data[i3 + 1] = MathUtils.random();
                this.colorChannel.data[i3 + 2] = MathUtils.random();
                this.colorChannel.data[i3 + 3] = MathUtils.random();
                i3 += this.colorChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Random copy() {
            return new Random();
        }
    }

    public static class Single extends ColorInfluencer {
        ParallelArray.FloatChannel alphaInterpolationChannel;
        public ScaledNumericValue alphaValue;
        public GradientColorValue colorValue;
        ParallelArray.FloatChannel lifeChannel;

        public Single() {
            this.colorValue = new GradientColorValue();
            this.alphaValue = new ScaledNumericValue();
            this.alphaValue.setHigh(1.0f);
        }

        public Single(Single single) {
            this();
            set(single);
        }

        public void set(Single single) {
            this.colorValue.load(single.colorValue);
            this.alphaValue.load(single.alphaValue);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.ColorInfluencer
        public void allocateChannels() {
            ColorInfluencer.super.allocateChannels();
            ParticleChannels.Interpolation.id = this.controller.particleChannels.newId();
            this.alphaInterpolationChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Interpolation);
            this.lifeChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Life);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void activateParticles(int i, int i2) {
            int i3 = this.colorChannel.strideSize * i;
            int i4 = this.alphaInterpolationChannel.strideSize * i;
            int i5 = (i * this.lifeChannel.strideSize) + 2;
            int i6 = (i2 * this.colorChannel.strideSize) + i3;
            while (i3 < i6) {
                float newLowValue = this.alphaValue.newLowValue();
                float newHighValue = this.alphaValue.newHighValue() - newLowValue;
                this.colorValue.getColor(0.0f, this.colorChannel.data, i3);
                this.colorChannel.data[i3 + 3] = (this.alphaValue.getScale(this.lifeChannel.data[i5]) * newHighValue) + newLowValue;
                this.alphaInterpolationChannel.data[i4 + 0] = newLowValue;
                this.alphaInterpolationChannel.data[i4 + 1] = newHighValue;
                i3 += this.colorChannel.strideSize;
                i4 += this.alphaInterpolationChannel.strideSize;
                i5 += this.lifeChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void update() {
            int i = 0;
            int i2 = (this.controller.particles.size * this.colorChannel.strideSize) + 0;
            int i3 = 2;
            int i4 = 0;
            while (i < i2) {
                float f = this.lifeChannel.data[i3];
                this.colorValue.getColor(f, this.colorChannel.data, i);
                this.colorChannel.data[i + 3] = this.alphaInterpolationChannel.data[i4 + 0] + (this.alphaInterpolationChannel.data[i4 + 1] * this.alphaValue.getScale(f));
                i += this.colorChannel.strideSize;
                i4 += this.alphaInterpolationChannel.strideSize;
                i3 += this.lifeChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Single copy() {
            return new Single(this);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
        public void write(Json json) {
            json.writeValue("alpha", this.alphaValue);
            json.writeValue("color", this.colorValue);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
        public void read(Json json, JsonValue jsonValue) {
            this.alphaValue = (ScaledNumericValue) json.readValue("alpha", ScaledNumericValue.class, jsonValue);
            this.colorValue = (GradientColorValue) json.readValue("color", GradientColorValue.class, jsonValue);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void allocateChannels() {
        this.colorChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Color);
    }
}
