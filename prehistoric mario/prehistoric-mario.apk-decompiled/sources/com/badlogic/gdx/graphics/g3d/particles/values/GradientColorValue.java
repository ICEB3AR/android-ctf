package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonValue;

public class GradientColorValue extends ParticleValue {
    private static float[] temp = new float[3];
    private float[] colors = {1.0f, 1.0f, 1.0f};
    public float[] timeline = {0.0f};

    public float[] getTimeline() {
        return this.timeline;
    }

    public void setTimeline(float[] fArr) {
        this.timeline = fArr;
    }

    public float[] getColors() {
        return this.colors;
    }

    public void setColors(float[] fArr) {
        this.colors = fArr;
    }

    public float[] getColor(float f) {
        getColor(f, temp, 0);
        return temp;
    }

    public void getColor(float f, float[] fArr, int i) {
        float[] fArr2 = this.timeline;
        int length = fArr2.length;
        int i2 = 0;
        int i3 = 1;
        while (true) {
            if (i3 >= length) {
                i3 = -1;
                break;
            } else if (fArr2[i3] > f) {
                break;
            } else {
                i3++;
                i2 = i3;
            }
        }
        float f2 = fArr2[i2];
        int i4 = i2 * 3;
        float[] fArr3 = this.colors;
        float f3 = fArr3[i4];
        float f4 = fArr3[i4 + 1];
        float f5 = fArr3[i4 + 2];
        if (i3 == -1) {
            fArr[i] = f3;
            fArr[i + 1] = f4;
            fArr[i + 2] = f5;
            return;
        }
        float f6 = (f - f2) / (fArr2[i3] - f2);
        int i5 = i3 * 3;
        fArr[i] = f3 + ((fArr3[i5] - f3) * f6);
        fArr[i + 1] = f4 + ((fArr3[i5 + 1] - f4) * f6);
        fArr[i + 2] = f5 + ((fArr3[i5 + 2] - f5) * f6);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.ParticleValue, com.badlogic.gdx.utils.Json.Serializable
    public void write(Json json) {
        super.write(json);
        json.writeValue("colors", this.colors);
        json.writeValue("timeline", this.timeline);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.ParticleValue, com.badlogic.gdx.utils.Json.Serializable
    public void read(Json json, JsonValue jsonValue) {
        super.read(json, jsonValue);
        this.colors = (float[]) json.readValue("colors", float[].class, jsonValue);
        this.timeline = (float[]) json.readValue("timeline", float[].class, jsonValue);
    }

    public void load(GradientColorValue gradientColorValue) {
        super.load((ParticleValue) gradientColorValue);
        this.colors = new float[gradientColorValue.colors.length];
        float[] fArr = gradientColorValue.colors;
        float[] fArr2 = this.colors;
        System.arraycopy(fArr, 0, fArr2, 0, fArr2.length);
        this.timeline = new float[gradientColorValue.timeline.length];
        float[] fArr3 = gradientColorValue.timeline;
        float[] fArr4 = this.timeline;
        System.arraycopy(fArr3, 0, fArr4, 0, fArr4.length);
    }
}
