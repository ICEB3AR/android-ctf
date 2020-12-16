package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;

public class ScaleInfluencer extends SimpleInfluencer {
    public ScaleInfluencer() {
        this.valueChannelDescriptor = ParticleChannels.Scale;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.SimpleInfluencer
    public void activateParticles(int i, int i2) {
        if (this.value.isRelative()) {
            int i3 = this.valueChannel.strideSize * i;
            int i4 = i * this.interpolationChannel.strideSize;
            int i5 = (i2 * this.valueChannel.strideSize) + i3;
            while (i3 < i5) {
                float newLowValue = this.value.newLowValue() * this.controller.scale.x;
                float newHighValue = this.value.newHighValue() * this.controller.scale.x;
                this.interpolationChannel.data[i4 + 0] = newLowValue;
                this.interpolationChannel.data[i4 + 1] = newHighValue;
                this.valueChannel.data[i3] = newLowValue + (newHighValue * this.value.getScale(0.0f));
                i3 += this.valueChannel.strideSize;
                i4 += this.interpolationChannel.strideSize;
            }
            return;
        }
        int i6 = this.valueChannel.strideSize * i;
        int i7 = i * this.interpolationChannel.strideSize;
        int i8 = (i2 * this.valueChannel.strideSize) + i6;
        while (i6 < i8) {
            float newLowValue2 = this.value.newLowValue() * this.controller.scale.x;
            float newHighValue2 = (this.value.newHighValue() * this.controller.scale.x) - newLowValue2;
            this.interpolationChannel.data[i7 + 0] = newLowValue2;
            this.interpolationChannel.data[i7 + 1] = newHighValue2;
            this.valueChannel.data[i6] = newLowValue2 + (newHighValue2 * this.value.getScale(0.0f));
            i6 += this.valueChannel.strideSize;
            i7 += this.interpolationChannel.strideSize;
        }
    }

    public ScaleInfluencer(ScaleInfluencer scaleInfluencer) {
        super(scaleInfluencer);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public ParticleControllerComponent copy() {
        return new ScaleInfluencer(this);
    }
}
