package com.badlogic.gdx.graphics.g3d.particles;

import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.RenderableProvider;
import com.badlogic.gdx.graphics.g3d.particles.batches.ParticleBatch;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public final class ParticleSystem implements RenderableProvider {
    private static ParticleSystem instance;
    private Array<ParticleBatch<?>> batches = new Array<>();
    private Array<ParticleEffect> effects = new Array<>();

    public static ParticleSystem get() {
        if (instance == null) {
            instance = new ParticleSystem();
        }
        return instance;
    }

    public void add(ParticleBatch<?> particleBatch) {
        this.batches.add(particleBatch);
    }

    public void add(ParticleEffect particleEffect) {
        this.effects.add(particleEffect);
    }

    public void remove(ParticleEffect particleEffect) {
        this.effects.removeValue(particleEffect, true);
    }

    public void removeAll() {
        this.effects.clear();
    }

    public void update() {
        Iterator<ParticleEffect> it = this.effects.iterator();
        while (it.hasNext()) {
            it.next().update();
        }
    }

    public void updateAndDraw() {
        Iterator<ParticleEffect> it = this.effects.iterator();
        while (it.hasNext()) {
            ParticleEffect next = it.next();
            next.update();
            next.draw();
        }
    }

    public void update(float f) {
        Iterator<ParticleEffect> it = this.effects.iterator();
        while (it.hasNext()) {
            it.next().update(f);
        }
    }

    public void updateAndDraw(float f) {
        Iterator<ParticleEffect> it = this.effects.iterator();
        while (it.hasNext()) {
            ParticleEffect next = it.next();
            next.update(f);
            next.draw();
        }
    }

    public void begin() {
        Iterator<ParticleBatch<?>> it = this.batches.iterator();
        while (it.hasNext()) {
            it.next().begin();
        }
    }

    public void draw() {
        Iterator<ParticleEffect> it = this.effects.iterator();
        while (it.hasNext()) {
            it.next().draw();
        }
    }

    public void end() {
        Iterator<ParticleBatch<?>> it = this.batches.iterator();
        while (it.hasNext()) {
            it.next().end();
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.RenderableProvider
    public void getRenderables(Array<Renderable> array, Pool<Renderable> pool) {
        Iterator<ParticleBatch<?>> it = this.batches.iterator();
        while (it.hasNext()) {
            it.next().getRenderables(array, pool);
        }
    }

    public Array<ParticleBatch<?>> getBatches() {
        return this.batches;
    }
}
