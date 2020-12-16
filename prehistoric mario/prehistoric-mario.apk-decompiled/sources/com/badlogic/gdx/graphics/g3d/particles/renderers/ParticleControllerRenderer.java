package com.badlogic.gdx.graphics.g3d.particles.renderers;

import com.badlogic.gdx.graphics.g3d.particles.ParticleController;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;
import com.badlogic.gdx.graphics.g3d.particles.renderers.ParticleControllerRenderData;

public abstract class ParticleControllerRenderer<D extends ParticleControllerRenderData, T extends ParticleBatch<D>> extends ParticleControllerComponent {
    protected T batch;
    protected D renderData;

    public abstract boolean isCompatible(ParticleBatch<?> particleBatch);

    protected ParticleControllerRenderer() {
    }

    protected ParticleControllerRenderer(D d) {
        this.renderData = d;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void update() {
        this.batch.draw(this.renderData);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r2v0, resolved type: com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch<?> */
    /* JADX WARN: Multi-variable type inference failed */
    public boolean setBatch(ParticleBatch<?> particleBatch) {
        if (!isCompatible(particleBatch)) {
            return false;
        }
        this.batch = particleBatch;
        return true;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void set(ParticleController particleController) {
        super.set(particleController);
        D d = this.renderData;
        if (d != null) {
            d.controller = this.controller;
        }
    }
}
