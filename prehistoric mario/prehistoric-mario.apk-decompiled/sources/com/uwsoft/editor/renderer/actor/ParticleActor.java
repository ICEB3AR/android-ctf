package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.ParticleEffect;
import com.badlogic.gdx.scenes.scene2d.Actor;

public class ParticleActor extends Actor {
    private float lastDelta = 0.0f;
    private ParticleEffect particleEffect;

    public ParticleActor(ParticleEffect particleEffect2) {
        setVisible(true);
        this.particleEffect = particleEffect2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setPosition(float f, float f2) {
        setX(f);
        setY(f2);
        this.particleEffect.setPosition(getX(), getY());
    }

    public void start() {
        this.particleEffect.reset();
        this.particleEffect.start();
    }

    public void stop() {
        for (int i = 0; i < this.particleEffect.getEmitters().size; i++) {
            this.particleEffect.getEmitters().get(i).setContinuous(false);
            this.particleEffect.getEmitters().get(i).allowCompletion();
        }
    }

    public ParticleEffect getParticleEffect() {
        return this.particleEffect;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void act(float f) {
        this.lastDelta = f;
        this.particleEffect.setPosition(getX(), getY());
    }

    public void fastForward(float f) {
        act(f);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        this.particleEffect.draw(batch, this.lastDelta);
    }
}
