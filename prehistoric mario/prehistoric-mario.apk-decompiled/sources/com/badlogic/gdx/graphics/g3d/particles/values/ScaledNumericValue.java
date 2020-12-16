package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class ScaledNumericValue extends RangedNumericValue {
    private float highMax;
    private float highMin;
    private boolean relative = false;
    private float[] scaling = {1.0f};
    public float[] timeline = {0.0f};

    public float newHighValue() {
        float f = this.highMin;
        return f + ((this.highMax - f) * MathUtils.random());
    }

    public void setHigh(float f) {
        this.highMin = f;
        this.highMax = f;
    }

    public void setHigh(float f, float f2) {
        this.highMin = f;
        this.highMax = f2;
    }

    public float getHighMin() {
        return this.highMin;
    }

    public void setHighMin(float f) {
        this.highMin = f;
    }

    public float getHighMax() {
        return this.highMax;
    }

    public void setHighMax(float f) {
        this.highMax = f;
    }

    public float[] getScaling() {
        return this.scaling;
    }

    public void setScaling(float[] fArr) {
        this.scaling = fArr;
    }

    public float[] getTimeline() {
        return this.timeline;
    }

    public void setTimeline(float[] fArr) {
        this.timeline = fArr;
    }

    public boolean isRelative() {
        return this.relative;
    }

    public void setRelative(boolean z) {
        this.relative = z;
    }

    public float getScale(float f) {
        int length = this.timeline.length;
        int i = 1;
        while (true) {
            if (i >= length) {
                i = -1;
                break;
            } else if (this.timeline[i] > f) {
                break;
            } else {
                i++;
            }
        }
        if (i == -1) {
            return this.scaling[length - 1];
        }
        int i2 = i - 1;
        float[] fArr = this.scaling;
        float f2 = fArr[i2];
        float[] fArr2 = this.timeline;
        float f3 = fArr2[i2];
        return f2 + ((fArr[i] - f2) * ((f - f3) / (fArr2[i] - f3)));
    }

    public void load(ScaledNumericValue scaledNumericValue) {
        super.load((RangedNumericValue) scaledNumericValue);
        this.highMax = scaledNumericValue.highMax;
        this.highMin = scaledNumericValue.highMin;
        this.scaling = new float[scaledNumericValue.scaling.length];
        float[] fArr = scaledNumericValue.scaling;
        float[] fArr2 = this.scaling;
        System.arraycopy(fArr, 0, fArr2, 0, fArr2.length);
        this.timeline = new float[scaledNumericValue.timeline.length];
        float[] fArr3 = scaledNumericValue.timeline;
        float[] fArr4 = this.timeline;
        System.arraycopy(fArr3, 0, fArr4, 0, fArr4.length);
        this.relative = scaledNumericValue.relative;
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.RangedNumericValue, com.badlogic.gdx.graphics.g3d.particles.values.ParticleValue, com.badlogic.gdx.utils.Json.Serializable
    public void write(Json json) {
        super.write(json);
        json.writeValue("highMin", Float.valueOf(this.highMin));
        json.writeValue("highMax", Float.valueOf(this.highMax));
        json.writeValue("relative", Boolean.valueOf(this.relative));
        json.writeValue("scaling", this.scaling);
        json.writeValue("timeline", this.timeline);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.RangedNumericValue, com.badlogic.gdx.graphics.g3d.particles.values.ParticleValue, com.badlogic.gdx.utils.Json.Serializable
    public void read(Json json, JsonValue jsonValue) {
        super.read(json, jsonValue);
        this.highMin = ((Float) json.readValue("highMin", Float.TYPE, jsonValue)).floatValue();
        this.highMax = ((Float) json.readValue("highMax", Float.TYPE, jsonValue)).floatValue();
        this.relative = ((Boolean) json.readValue("relative", Boolean.TYPE, jsonValue)).booleanValue();
        this.scaling = (float[]) json.readValue("scaling", float[].class, jsonValue);
        this.timeline = (float[]) json.readValue("timeline", float[].class, jsonValue);
    }
}
