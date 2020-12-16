package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Pool;

public class ParticleEffectPool extends Pool<PooledEffect> {
    private final ParticleEffect effect;

    public ParticleEffectPool(ParticleEffect particleEffect, int i, int i2) {
        super(i, i2);
        this.effect = particleEffect;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.utils.Pool
    public PooledEffect newObject() {
        PooledEffect pooledEffect = new PooledEffect(this.effect);
        pooledEffect.start();
        return pooledEffect;
    }

    public void free(PooledEffect pooledEffect) {
        super.free((Object) pooledEffect);
        pooledEffect.reset(false);
        if (!(pooledEffect.xSizeScale == this.effect.xSizeScale && pooledEffect.ySizeScale == this.effect.ySizeScale && pooledEffect.motionScale == this.effect.motionScale)) {
            Array<ParticleEmitter> emitters = pooledEffect.getEmitters();
            Array<ParticleEmitter> emitters2 = this.effect.getEmitters();
            for (int i = 0; i < emitters.size; i++) {
                ParticleEmitter particleEmitter = emitters.get(i);
                ParticleEmitter particleEmitter2 = emitters2.get(i);
                particleEmitter.matchSize(particleEmitter2);
                particleEmitter.matchMotion(particleEmitter2);
            }
            pooledEffect.xSizeScale = this.effect.xSizeScale;
            pooledEffect.ySizeScale = this.effect.ySizeScale;
            pooledEffect.motionScale = this.effect.motionScale;
        }
    }

    public class PooledEffect extends ParticleEffect {
        PooledEffect(ParticleEffect particleEffect) {
            super(particleEffect);
        }

        public void free() {
            ParticleEffectPool.this.free(this);
        }
    }
}
