package com.badlogic.gdx.graphics.g3d.particles.influencers;

import com.badlogic.gdx.graphics.g3d.particles.ParallelArray;
import com.badlogic.gdx.graphics.g3d.particles.ParticleChannels;
import com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent;
import com.badlogic.gdx.graphics.g3d.particles.values.ScaledNumericValue;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public abstract class DynamicsModifier extends Influencer {
    protected static final Quaternion TMP_Q = new Quaternion();
    protected static final Vector3 TMP_V1 = new Vector3();
    protected static final Vector3 TMP_V2 = new Vector3();
    protected static final Vector3 TMP_V3 = new Vector3();
    public boolean isGlobal = false;
    protected ParallelArray.FloatChannel lifeChannel;

    public static class FaceDirection extends DynamicsModifier {
        ParallelArray.FloatChannel accellerationChannel;
        ParallelArray.FloatChannel rotationChannel;

        public FaceDirection() {
        }

        public FaceDirection(FaceDirection faceDirection) {
            super(faceDirection);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void allocateChannels() {
            this.rotationChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Rotation3D);
            this.accellerationChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Acceleration);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void update() {
            int i = 0;
            int i2 = (this.controller.particles.size * this.rotationChannel.strideSize) + 0;
            int i3 = 0;
            while (i < i2) {
                Vector3 nor = TMP_V1.set(this.accellerationChannel.data[i3 + 0], this.accellerationChannel.data[i3 + 1], this.accellerationChannel.data[i3 + 2]).nor();
                Vector3 nor2 = TMP_V2.set(TMP_V1).crs(Vector3.Y).nor().crs(TMP_V1).nor();
                Vector3 nor3 = TMP_V3.set(nor2).crs(nor).nor();
                TMP_Q.setFromAxes(false, nor3.x, nor2.x, nor.x, nor3.y, nor2.y, nor.y, nor3.z, nor2.z, nor.z);
                this.rotationChannel.data[i + 0] = TMP_Q.x;
                this.rotationChannel.data[i + 1] = TMP_Q.y;
                this.rotationChannel.data[i + 2] = TMP_Q.z;
                this.rotationChannel.data[i + 3] = TMP_Q.w;
                i += this.rotationChannel.strideSize;
                i3 += this.accellerationChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public ParticleControllerComponent copy() {
            return new FaceDirection(this);
        }
    }

    public static abstract class Strength extends DynamicsModifier {
        protected ParallelArray.FloatChannel strengthChannel;
        public ScaledNumericValue strengthValue = new ScaledNumericValue();

        public Strength() {
        }

        public Strength(Strength strength) {
            super(strength);
            this.strengthValue.load(strength.strengthValue);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void allocateChannels() {
            DynamicsModifier.super.allocateChannels();
            ParticleChannels.Interpolation.id = this.controller.particleChannels.newId();
            this.strengthChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Interpolation);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void activateParticles(int i, int i2) {
            int i3 = i * this.strengthChannel.strideSize;
            int i4 = (i2 * this.strengthChannel.strideSize) + i3;
            while (i3 < i4) {
                float newLowValue = this.strengthValue.newLowValue();
                float newHighValue = this.strengthValue.newHighValue();
                if (!this.strengthValue.isRelative()) {
                    newHighValue -= newLowValue;
                }
                this.strengthChannel.data[i3 + 0] = newLowValue;
                this.strengthChannel.data[i3 + 1] = newHighValue;
                i3 += this.strengthChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void write(Json json) {
            DynamicsModifier.super.write(json);
            json.writeValue("strengthValue", this.strengthValue);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void read(Json json, JsonValue jsonValue) {
            DynamicsModifier.super.read(json, jsonValue);
            this.strengthValue = (ScaledNumericValue) json.readValue("strengthValue", ScaledNumericValue.class, jsonValue);
        }
    }

    public static abstract class Angular extends Strength {
        protected ParallelArray.FloatChannel angularChannel;
        public ScaledNumericValue phiValue = new ScaledNumericValue();
        public ScaledNumericValue thetaValue = new ScaledNumericValue();

        public Angular() {
        }

        public Angular(Angular angular) {
            super(angular);
            this.thetaValue.load(angular.thetaValue);
            this.phiValue.load(angular.phiValue);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void allocateChannels() {
            super.allocateChannels();
            ParticleChannels.Interpolation4.id = this.controller.particleChannels.newId();
            this.angularChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Interpolation4);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength
        public void activateParticles(int i, int i2) {
            super.activateParticles(i, i2);
            int i3 = i * this.angularChannel.strideSize;
            int i4 = (i2 * this.angularChannel.strideSize) + i3;
            while (i3 < i4) {
                float newLowValue = this.thetaValue.newLowValue();
                float newHighValue = this.thetaValue.newHighValue();
                if (!this.thetaValue.isRelative()) {
                    newHighValue -= newLowValue;
                }
                this.angularChannel.data[i3 + 0] = newLowValue;
                this.angularChannel.data[i3 + 1] = newHighValue;
                float newLowValue2 = this.phiValue.newLowValue();
                float newHighValue2 = this.phiValue.newHighValue();
                if (!this.phiValue.isRelative()) {
                    newHighValue2 -= newLowValue2;
                }
                this.angularChannel.data[i3 + 2] = newLowValue2;
                this.angularChannel.data[i3 + 3] = newHighValue2;
                i3 += this.angularChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength, com.badlogic.gdx.utils.Json.Serializable, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void write(Json json) {
            super.write(json);
            json.writeValue("thetaValue", this.thetaValue);
            json.writeValue("phiValue", this.phiValue);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength, com.badlogic.gdx.utils.Json.Serializable, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void read(Json json, JsonValue jsonValue) {
            super.read(json, jsonValue);
            this.thetaValue = (ScaledNumericValue) json.readValue("thetaValue", ScaledNumericValue.class, jsonValue);
            this.phiValue = (ScaledNumericValue) json.readValue("phiValue", ScaledNumericValue.class, jsonValue);
        }
    }

    public static class Rotational2D extends Strength {
        ParallelArray.FloatChannel rotationalVelocity2dChannel;

        public Rotational2D() {
        }

        public Rotational2D(Rotational2D rotational2D) {
            super(rotational2D);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void allocateChannels() {
            super.allocateChannels();
            this.rotationalVelocity2dChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.AngularVelocity2D);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void update() {
            int i = 0;
            int i2 = (this.controller.particles.size * this.rotationalVelocity2dChannel.strideSize) + 0;
            int i3 = 0;
            int i4 = 2;
            while (i < i2) {
                float[] fArr = this.rotationalVelocity2dChannel.data;
                fArr[i] = fArr[i] + this.strengthChannel.data[i3 + 0] + (this.strengthChannel.data[i3 + 1] * this.strengthValue.getScale(this.lifeChannel.data[i4]));
                i3 += this.strengthChannel.strideSize;
                i += this.rotationalVelocity2dChannel.strideSize;
                i4 += this.lifeChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Rotational2D copy() {
            return new Rotational2D(this);
        }
    }

    public static class Rotational3D extends Angular {
        ParallelArray.FloatChannel rotationChannel;
        ParallelArray.FloatChannel rotationalForceChannel;

        public Rotational3D() {
        }

        public Rotational3D(Rotational3D rotational3D) {
            super(rotational3D);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Angular, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void allocateChannels() {
            super.allocateChannels();
            this.rotationChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Rotation3D);
            this.rotationalForceChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.AngularVelocity3D);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void update() {
            int i = this.controller.particles.size * this.rotationalForceChannel.strideSize;
            int i2 = 2;
            int i3 = 0;
            int i4 = 0;
            int i5 = 0;
            while (i3 < i) {
                float f = this.lifeChannel.data[i2];
                float scale = this.strengthChannel.data[i4 + 0] + (this.strengthChannel.data[i4 + 1] * this.strengthValue.getScale(f));
                float scale2 = this.angularChannel.data[i5 + 2] + (this.angularChannel.data[i5 + 3] * this.phiValue.getScale(f));
                float scale3 = this.angularChannel.data[i5 + 0] + (this.angularChannel.data[i5 + 1] * this.thetaValue.getScale(f));
                float cosDeg = MathUtils.cosDeg(scale3);
                float sinDeg = MathUtils.sinDeg(scale3);
                float cosDeg2 = MathUtils.cosDeg(scale2);
                float sinDeg2 = MathUtils.sinDeg(scale2);
                TMP_V3.set(cosDeg * sinDeg2, cosDeg2, sinDeg * sinDeg2);
                TMP_V3.scl(scale * 0.017453292f);
                float[] fArr = this.rotationalForceChannel.data;
                int i6 = i3 + 0;
                fArr[i6] = fArr[i6] + TMP_V3.x;
                float[] fArr2 = this.rotationalForceChannel.data;
                int i7 = i3 + 1;
                fArr2[i7] = fArr2[i7] + TMP_V3.y;
                float[] fArr3 = this.rotationalForceChannel.data;
                int i8 = i3 + 2;
                fArr3[i8] = fArr3[i8] + TMP_V3.z;
                i4 += this.strengthChannel.strideSize;
                i3 += this.rotationalForceChannel.strideSize;
                i5 += this.angularChannel.strideSize;
                i2 += this.lifeChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public Rotational3D copy() {
            return new Rotational3D(this);
        }
    }

    public static class CentripetalAcceleration extends Strength {
        ParallelArray.FloatChannel accelerationChannel;
        ParallelArray.FloatChannel positionChannel;

        public CentripetalAcceleration() {
        }

        public CentripetalAcceleration(CentripetalAcceleration centripetalAcceleration) {
            super(centripetalAcceleration);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void allocateChannels() {
            super.allocateChannels();
            this.accelerationChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Acceleration);
            this.positionChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Position);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void update() {
            float f;
            float f2;
            float f3 = 0.0f;
            if (!this.isGlobal) {
                float[] fArr = this.controller.transform.val;
                f3 = fArr[12];
                f = fArr[13];
                f2 = fArr[14];
            } else {
                f2 = 0.0f;
                f = 0.0f;
            }
            int i = this.controller.particles.size;
            int i2 = 0;
            int i3 = 0;
            int i4 = 2;
            int i5 = 0;
            int i6 = 0;
            while (i2 < i) {
                TMP_V3.set(this.positionChannel.data[i5 + 0] - f3, this.positionChannel.data[i5 + 1] - f, this.positionChannel.data[i5 + 2] - f2).nor().scl(this.strengthChannel.data[i3 + 0] + (this.strengthChannel.data[i3 + 1] * this.strengthValue.getScale(this.lifeChannel.data[i4])));
                float[] fArr2 = this.accelerationChannel.data;
                int i7 = i6 + 0;
                fArr2[i7] = fArr2[i7] + TMP_V3.x;
                float[] fArr3 = this.accelerationChannel.data;
                int i8 = i6 + 1;
                fArr3[i8] = fArr3[i8] + TMP_V3.y;
                float[] fArr4 = this.accelerationChannel.data;
                int i9 = i6 + 2;
                fArr4[i9] = fArr4[i9] + TMP_V3.z;
                i2++;
                i5 += this.positionChannel.strideSize;
                i3 += this.strengthChannel.strideSize;
                i6 += this.accelerationChannel.strideSize;
                i4 += this.lifeChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public CentripetalAcceleration copy() {
            return new CentripetalAcceleration(this);
        }
    }

    public static class PolarAcceleration extends Angular {
        ParallelArray.FloatChannel directionalVelocityChannel;

        public PolarAcceleration() {
        }

        public PolarAcceleration(PolarAcceleration polarAcceleration) {
            super(polarAcceleration);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Angular, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void allocateChannels() {
            super.allocateChannels();
            this.directionalVelocityChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Acceleration);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void update() {
            int i = 0;
            int i2 = (this.controller.particles.size * this.directionalVelocityChannel.strideSize) + 0;
            int i3 = 2;
            int i4 = 0;
            int i5 = 0;
            while (i < i2) {
                float f = this.lifeChannel.data[i3];
                float scale = this.strengthChannel.data[i4 + 0] + (this.strengthChannel.data[i4 + 1] * this.strengthValue.getScale(f));
                float scale2 = this.angularChannel.data[i5 + 2] + (this.angularChannel.data[i5 + 3] * this.phiValue.getScale(f));
                float scale3 = this.angularChannel.data[i5 + 0] + (this.angularChannel.data[i5 + 1] * this.thetaValue.getScale(f));
                float cosDeg = MathUtils.cosDeg(scale3);
                float sinDeg = MathUtils.sinDeg(scale3);
                float cosDeg2 = MathUtils.cosDeg(scale2);
                float sinDeg2 = MathUtils.sinDeg(scale2);
                TMP_V3.set(cosDeg * sinDeg2, cosDeg2, sinDeg * sinDeg2).nor().scl(scale);
                float[] fArr = this.directionalVelocityChannel.data;
                int i6 = i + 0;
                fArr[i6] = fArr[i6] + TMP_V3.x;
                float[] fArr2 = this.directionalVelocityChannel.data;
                int i7 = i + 1;
                fArr2[i7] = fArr2[i7] + TMP_V3.y;
                float[] fArr3 = this.directionalVelocityChannel.data;
                int i8 = i + 2;
                fArr3[i8] = fArr3[i8] + TMP_V3.z;
                i4 += this.strengthChannel.strideSize;
                i += this.directionalVelocityChannel.strideSize;
                i5 += this.angularChannel.strideSize;
                i3 += this.lifeChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public PolarAcceleration copy() {
            return new PolarAcceleration(this);
        }
    }

    public static class TangentialAcceleration extends Angular {
        ParallelArray.FloatChannel directionalVelocityChannel;
        ParallelArray.FloatChannel positionChannel;

        public TangentialAcceleration() {
        }

        public TangentialAcceleration(TangentialAcceleration tangentialAcceleration) {
            super(tangentialAcceleration);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Angular, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void allocateChannels() {
            super.allocateChannels();
            this.directionalVelocityChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Acceleration);
            this.positionChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Position);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void update() {
            int i = 0;
            int i2 = (this.controller.particles.size * this.directionalVelocityChannel.strideSize) + 0;
            int i3 = 2;
            int i4 = 0;
            int i5 = 0;
            int i6 = 0;
            while (i < i2) {
                float f = this.lifeChannel.data[i3];
                float scale = this.strengthChannel.data[i4 + 0] + (this.strengthChannel.data[i4 + 1] * this.strengthValue.getScale(f));
                float scale2 = this.angularChannel.data[i5 + 2] + (this.angularChannel.data[i5 + 3] * this.phiValue.getScale(f));
                float scale3 = this.angularChannel.data[i5 + 0] + (this.angularChannel.data[i5 + 1] * this.thetaValue.getScale(f));
                float cosDeg = MathUtils.cosDeg(scale3);
                float sinDeg = MathUtils.sinDeg(scale3);
                float cosDeg2 = MathUtils.cosDeg(scale2);
                float sinDeg2 = MathUtils.sinDeg(scale2);
                TMP_V3.set(cosDeg * sinDeg2, cosDeg2, sinDeg * sinDeg2).crs(this.positionChannel.data[i6 + 0], this.positionChannel.data[i6 + 1], this.positionChannel.data[i6 + 2]).nor().scl(scale);
                float[] fArr = this.directionalVelocityChannel.data;
                int i7 = i + 0;
                fArr[i7] = fArr[i7] + TMP_V3.x;
                float[] fArr2 = this.directionalVelocityChannel.data;
                int i8 = i + 1;
                fArr2[i8] = fArr2[i8] + TMP_V3.y;
                float[] fArr3 = this.directionalVelocityChannel.data;
                int i9 = i + 2;
                fArr3[i9] = fArr3[i9] + TMP_V3.z;
                i4 += this.strengthChannel.strideSize;
                i += this.directionalVelocityChannel.strideSize;
                i5 += this.angularChannel.strideSize;
                i3 += this.lifeChannel.strideSize;
                i6 += this.positionChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public TangentialAcceleration copy() {
            return new TangentialAcceleration(this);
        }
    }

    public static class BrownianAcceleration extends Strength {
        ParallelArray.FloatChannel accelerationChannel;

        public BrownianAcceleration() {
        }

        public BrownianAcceleration(BrownianAcceleration brownianAcceleration) {
            super(brownianAcceleration);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier.Strength, com.badlogic.gdx.graphics.g3d.particles.influencers.DynamicsModifier
        public void allocateChannels() {
            super.allocateChannels();
            this.accelerationChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Acceleration);
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public void update() {
            int i = this.controller.particles.size;
            int i2 = 0;
            int i3 = 0;
            int i4 = 2;
            int i5 = 0;
            while (i2 < i) {
                TMP_V3.set(MathUtils.random(-1.0f, 1.0f), MathUtils.random(-1.0f, 1.0f), MathUtils.random(-1.0f, 1.0f)).nor().scl(this.strengthChannel.data[i3 + 0] + (this.strengthChannel.data[i3 + 1] * this.strengthValue.getScale(this.lifeChannel.data[i4])));
                float[] fArr = this.accelerationChannel.data;
                int i6 = i5 + 0;
                fArr[i6] = fArr[i6] + TMP_V3.x;
                float[] fArr2 = this.accelerationChannel.data;
                int i7 = i5 + 1;
                fArr2[i7] = fArr2[i7] + TMP_V3.y;
                float[] fArr3 = this.accelerationChannel.data;
                int i8 = i5 + 2;
                fArr3[i8] = fArr3[i8] + TMP_V3.z;
                i2++;
                i3 += this.strengthChannel.strideSize;
                i5 += this.accelerationChannel.strideSize;
                i4 += this.lifeChannel.strideSize;
            }
        }

        @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
        public BrownianAcceleration copy() {
            return new BrownianAcceleration(this);
        }
    }

    public DynamicsModifier() {
    }

    public DynamicsModifier(DynamicsModifier dynamicsModifier) {
        this.isGlobal = dynamicsModifier.isGlobal;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent
    public void allocateChannels() {
        this.lifeChannel = (ParallelArray.FloatChannel) this.controller.particles.addChannel(ParticleChannels.Life);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
    public void write(Json json) {
        super.write(json);
        json.writeValue("isGlobal", Boolean.valueOf(this.isGlobal));
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.ParticleControllerComponent, com.badlogic.gdx.utils.Json.Serializable
    public void read(Json json, JsonValue jsonValue) {
        super.read(json, jsonValue);
        this.isGlobal = ((Boolean) json.readValue("isGlobal", Boolean.TYPE, jsonValue)).booleanValue();
    }
}
