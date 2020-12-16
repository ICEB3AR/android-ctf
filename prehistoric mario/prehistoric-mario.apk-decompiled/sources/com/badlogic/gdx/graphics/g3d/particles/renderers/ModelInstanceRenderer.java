package com.badlogic.gdx.graphics.g3d.particles.renderers;

import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.ColorAttribute;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.batches.ModelInstanceParticleBatch;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;

public class ModelInstanceRenderer extends ParticleControllerRenderer<ModelInstanceControllerRenderData, ModelInstanceParticleBatch> {
    private boolean hasColor;
    private boolean hasRotation;
    private boolean hasScale;

    public ModelInstanceRenderer() {
        super(new ModelInstanceControllerRenderData());
    }

    public ModelInstanceRenderer(ModelInstanceParticleBatch modelInstanceParticleBatch) {
        this();
        setBatch(modelInstanceParticleBatch);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void allocateChannels() {
        ((ModelInstanceControllerRenderData) this.renderData).positionChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Position);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void init() {
        ((ModelInstanceControllerRenderData) this.renderData).modelInstanceChannel = (ParallelArray.ObjectChannel) this.controller.particles.getChannel(ParticleChannels.ModelInstance);
        ((ModelInstanceControllerRenderData) this.renderData).colorChannel = (ParallelArray.FloatChannel) this.controller.particles.getChannel(ParticleChannels.Color);
        ((ModelInstanceControllerRenderData) this.renderData).scaleChannel = (ParallelArray.FloatChannel) this.controller.particles.getChannel(ParticleChannels.Scale);
        ((ModelInstanceControllerRenderData) this.renderData).rotationChannel = (ParallelArray.FloatChannel) this.controller.particles.getChannel(ParticleChannels.Rotation3D);
        boolean z = true;
        this.hasColor = ((ModelInstanceControllerRenderData) this.renderData).colorChannel != null;
        this.hasScale = ((ModelInstanceControllerRenderData) this.renderData).scaleChannel != null;
        if (((ModelInstanceControllerRenderData) this.renderData).rotationChannel == null) {
            z = false;
        }
        this.hasRotation = z;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.renderers.ParticleControllerRenderer
    public void update() {
        float f;
        float f2;
        float f3;
        float f4;
        int i = this.controller.particles.size;
        int i2 = 0;
        int i3 = 0;
        while (i2 < i) {
            T t = ((ModelInstanceControllerRenderData) this.renderData).modelInstanceChannel.data[i2];
            float f5 = this.hasScale ? ((ModelInstanceControllerRenderData) this.renderData).scaleChannel.data[i2] : 1.0f;
            if (this.hasRotation) {
                int i4 = ((ModelInstanceControllerRenderData) this.renderData).rotationChannel.strideSize * i2;
                float f6 = ((ModelInstanceControllerRenderData) this.renderData).rotationChannel.data[i4 + 0];
                float f7 = ((ModelInstanceControllerRenderData) this.renderData).rotationChannel.data[i4 + 1];
                float f8 = ((ModelInstanceControllerRenderData) this.renderData).rotationChannel.data[i4 + 2];
                f = ((ModelInstanceControllerRenderData) this.renderData).rotationChannel.data[i4 + 3];
                f4 = f6;
                f3 = f7;
                f2 = f8;
            } else {
                f4 = 0.0f;
                f3 = 0.0f;
                f2 = 0.0f;
                f = 1.0f;
            }
            t.transform.set(((ModelInstanceControllerRenderData) this.renderData).positionChannel.data[i3 + 0], ((ModelInstanceControllerRenderData) this.renderData).positionChannel.data[i3 + 1], ((ModelInstanceControllerRenderData) this.renderData).positionChannel.data[i3 + 2], f4, f3, f2, f, f5, f5, f5);
            if (this.hasColor) {
                int i5 = ((ModelInstanceControllerRenderData) this.renderData).colorChannel.strideSize * i2;
                ColorAttribute colorAttribute = (ColorAttribute) t.materials.get(0).get(ColorAttribute.Diffuse);
                BlendingAttribute blendingAttribute = (BlendingAttribute) t.materials.get(0).get(BlendingAttribute.Type);
                colorAttribute.color.r = ((ModelInstanceControllerRenderData) this.renderData).colorChannel.data[i5 + 0];
                colorAttribute.color.g = ((ModelInstanceControllerRenderData) this.renderData).colorChannel.data[i5 + 1];
                colorAttribute.color.b = ((ModelInstanceControllerRenderData) this.renderData).colorChannel.data[i5 + 2];
                if (blendingAttribute != null) {
                    blendingAttribute.opacity = ((ModelInstanceControllerRenderData) this.renderData).colorChannel.data[i5 + 3];
                }
            }
            i2++;
            i3 += ((ModelInstanceControllerRenderData) this.renderData).positionChannel.strideSize;
        }
        super.update();
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public ParticleControllerComponent copy() {
        return new ModelInstanceRenderer((ModelInstanceParticleBatch) this.batch);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.renderers.ParticleControllerRenderer
    public boolean isCompatible(ParticleBatch<?> particleBatch) {
        return particleBatch instanceof ModelInstanceParticleBatch;
    }
}
