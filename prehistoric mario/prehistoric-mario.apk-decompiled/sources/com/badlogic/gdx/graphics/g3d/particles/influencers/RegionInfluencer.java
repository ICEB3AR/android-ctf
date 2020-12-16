package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class RegionInfluencer extends Influencer {
    ParallelArray.FloatChannel regionChannel;
    public Array<AspectTextureRegion> regions;

    public static class Single extends RegionInfluencer {
        public Single() {
        }

        public Single(Single single) {
            super(single);
        }

        public Single(TextureRegion textureRegion) {
            super(textureRegion);
        }

        public Single(Texture texture) {
            super(texture);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void init() {
            int i = 0;
            T t = this.regions.items[0];
            int i2 = this.controller.emitter.maxParticleCount * this.regionChannel.strideSize;
            while (i < i2) {
                this.regionChannel.data[i + 0] = t.u;
                this.regionChannel.data[i + 1] = t.v;
                this.regionChannel.data[i + 2] = t.u2;
                this.regionChannel.data[i + 3] = t.v2;
                this.regionChannel.data[i + 4] = 0.5f;
                this.regionChannel.data[i + 5] = t.halfInvAspectRatio;
                i += this.regionChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Single copy() {
            return new Single(this);
        }
    }

    public static class Random extends RegionInfluencer {
        public Random() {
        }

        public Random(Random random) {
            super(random);
        }

        public Random(TextureRegion textureRegion) {
            super(textureRegion);
        }

        public Random(Texture texture) {
            super(texture);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void activateParticles(int i, int i2) {
            int i3 = i * this.regionChannel.strideSize;
            int i4 = (i2 * this.regionChannel.strideSize) + i3;
            while (i3 < i4) {
                AspectTextureRegion aspectTextureRegion = (AspectTextureRegion) this.regions.random();
                this.regionChannel.data[i3 + 0] = aspectTextureRegion.u;
                this.regionChannel.data[i3 + 1] = aspectTextureRegion.v;
                this.regionChannel.data[i3 + 2] = aspectTextureRegion.u2;
                this.regionChannel.data[i3 + 3] = aspectTextureRegion.v2;
                this.regionChannel.data[i3 + 4] = 0.5f;
                this.regionChannel.data[i3 + 5] = aspectTextureRegion.halfInvAspectRatio;
                i3 += this.regionChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Random copy() {
            return new Random(this);
        }
    }

    public static class Animated extends RegionInfluencer {
        ParallelArray.FloatChannel lifeChannel;

        public Animated() {
        }

        public Animated(Animated animated) {
            super(animated);
        }

        public Animated(TextureRegion textureRegion) {
            super(textureRegion);
        }

        public Animated(Texture texture) {
            super(texture);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.RegionInfluencer
        public void allocateChannels() {
            RegionInfluencer.super.allocateChannels();
            this.lifeChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Life);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void update() {
            int i = this.controller.particles.size * this.regionChannel.strideSize;
            int i2 = 2;
            int i3 = 0;
            while (i3 < i) {
                AspectTextureRegion aspectTextureRegion = (AspectTextureRegion) this.regions.get((int) (this.lifeChannel.data[i2] * ((float) (this.regions.size - 1))));
                this.regionChannel.data[i3 + 0] = aspectTextureRegion.u;
                this.regionChannel.data[i3 + 1] = aspectTextureRegion.v;
                this.regionChannel.data[i3 + 2] = aspectTextureRegion.u2;
                this.regionChannel.data[i3 + 3] = aspectTextureRegion.v2;
                this.regionChannel.data[i3 + 4] = 0.5f;
                this.regionChannel.data[i3 + 5] = aspectTextureRegion.halfInvAspectRatio;
                i3 += this.regionChannel.strideSize;
                i2 += this.lifeChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Animated copy() {
            return new Animated(this);
        }
    }

    public static class AspectTextureRegion {
        public float halfInvAspectRatio;
        public float u;
        public float u2;
        public float v;
        public float v2;

        public AspectTextureRegion() {
        }

        public AspectTextureRegion(AspectTextureRegion aspectTextureRegion) {
            set(aspectTextureRegion);
        }

        public AspectTextureRegion(TextureRegion textureRegion) {
            set(textureRegion);
        }

        public void set(TextureRegion textureRegion) {
            this.u = textureRegion.getU();
            this.v = textureRegion.getV();
            this.u2 = textureRegion.getU2();
            this.v2 = textureRegion.getV2();
            this.halfInvAspectRatio = (((float) textureRegion.getRegionHeight()) / ((float) textureRegion.getRegionWidth())) * 0.5f;
        }

        public void set(AspectTextureRegion aspectTextureRegion) {
            this.u = aspectTextureRegion.u;
            this.v = aspectTextureRegion.v;
            this.u2 = aspectTextureRegion.u2;
            this.v2 = aspectTextureRegion.v2;
            this.halfInvAspectRatio = aspectTextureRegion.halfInvAspectRatio;
        }
    }

    public RegionInfluencer(int i) {
        this.regions = new Array<>(false, i, AspectTextureRegion.class);
    }

    public RegionInfluencer() {
        this(1);
        AspectTextureRegion aspectTextureRegion = new AspectTextureRegion();
        aspectTextureRegion.v = 0.0f;
        aspectTextureRegion.u = 0.0f;
        aspectTextureRegion.v2 = 1.0f;
        aspectTextureRegion.u2 = 1.0f;
        aspectTextureRegion.halfInvAspectRatio = 0.5f;
        this.regions.add(aspectTextureRegion);
    }

    public RegionInfluencer(TextureRegion... textureRegionArr) {
        this.regions = new Array<>(false, textureRegionArr.length, AspectTextureRegion.class);
        add(textureRegionArr);
    }

    public RegionInfluencer(Texture texture) {
        this(new TextureRegion(texture));
    }

    public RegionInfluencer(RegionInfluencer regionInfluencer) {
        this(regionInfluencer.regions.size);
        this.regions.ensureCapacity(regionInfluencer.regions.size);
        for (int i = 0; i < regionInfluencer.regions.size; i++) {
            this.regions.add(new AspectTextureRegion(regionInfluencer.regions.get(i)));
        }
    }

    public void add(TextureRegion... textureRegionArr) {
        this.regions.ensureCapacity(textureRegionArr.length);
        for (TextureRegion textureRegion : textureRegionArr) {
            this.regions.add(new AspectTextureRegion(textureRegion));
        }
    }

    public void clear() {
        this.regions.clear();
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void allocateChannels() {
        this.regionChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.TextureRegion);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
    public void write(Json json) {
        json.writeValue("regions", this.regions, Array.class, AspectTextureRegion.class);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
    public void read(Json json, JsonValue jsonValue) {
        this.regions.clear();
        this.regions.addAll((Array) json.readValue("regions", Array.class, AspectTextureRegion.class, jsonValue));
    }
}
