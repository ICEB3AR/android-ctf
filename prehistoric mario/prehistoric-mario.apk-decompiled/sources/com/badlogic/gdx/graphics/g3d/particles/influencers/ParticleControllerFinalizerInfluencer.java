package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleController;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class ParticleControllerFinalizerInfluencer extends Influencer {
    ParallelArray.ObjectChannel<ParticleController> controllerChannel;
    boolean hasRotation;
    boolean hasScale;
    ParallelArray.FloatChannel positionChannel;
    ParallelArray.FloatChannel rotationChannel;
    ParallelArray.FloatChannel scaleChannel;

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void init() {
        this.controllerChannel = (ParallelArray.ObjectChannel) this.controller.particles.getChannel(ParticleChannels.ParticleController);
        if (this.controllerChannel != null) {
            this.scaleChannel = (ParallelArray.FloatChannel) this.controller.particles.getChannel(ParticleChannels.Scale);
            this.rotationChannel = (ParallelArray.FloatChannel) this.controller.particles.getChannel(ParticleChannels.Rotation3D);
            boolean z = true;
            this.hasScale = this.scaleChannel != null;
            if (this.rotationChannel == null) {
                z = false;
            }
            this.hasRotation = z;
            return;
        }
        throw new GdxRuntimeException("ParticleController channel not found, specify an influencer which will allocate it please.");
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void allocateChannels() {
        this.positionChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Position);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void update() {
        float f;
        float f2;
        float f3;
        float f4;
        int i = this.controller.particles.size;
        int i2 = 0;
        int i3 = 0;
        while (i2 < i) {
            T t = this.controllerChannel.data[i2];
            float f5 = this.hasScale ? this.scaleChannel.data[i2] : 1.0f;
            if (this.hasRotation) {
                int i4 = this.rotationChannel.strideSize * i2;
                float f6 = this.rotationChannel.data[i4 + 0];
                float f7 = this.rotationChannel.data[i4 + 1];
                float f8 = this.rotationChannel.data[i4 + 2];
                f = this.rotationChannel.data[i4 + 3];
                f4 = f6;
                f3 = f7;
                f2 = f8;
            } else {
                f4 = 0.0f;
                f3 = 0.0f;
                f2 = 0.0f;
                f = 1.0f;
            }
            t.setTransform(this.positionChannel.data[i3 + 0], this.positionChannel.data[i3 + 1], this.positionChannel.data[i3 + 2], f4, f3, f2, f, f5);
            t.update();
            i2++;
            i3 += this.positionChannel.strideSize;
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public ParticleControllerFinalizerInfluencer copy() {
        return new ParticleControllerFinalizerInfluencer();
    }
}
