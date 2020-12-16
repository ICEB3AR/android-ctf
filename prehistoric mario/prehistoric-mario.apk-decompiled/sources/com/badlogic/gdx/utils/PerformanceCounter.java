package com.badlogic.gdx.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.FloatCounter;

public class PerformanceCounter {
    private static final float nano2seconds = 1.0E-9f;
    public float current;
    private long lastTick;
    public final FloatCounter load;
    public final String name;
    private long startTime;
    public final FloatCounter time;
    public boolean valid;

    public PerformanceCounter(String str) {
        this(str, 5);
    }

    public PerformanceCounter(String str, int i) {
        this.startTime = 0;
        this.lastTick = 0;
        this.current = 0.0f;
        this.valid = false;
        this.name = str;
        this.time = new FloatCounter(i);
        this.load = new FloatCounter(1);
    }

    public void tick() {
        long nanoTime = TimeUtils.nanoTime();
        long j = this.lastTick;
        if (j > 0) {
            tick(((float) (nanoTime - j)) * 1.0E-9f);
        }
        this.lastTick = nanoTime;
    }

    public void tick(float f) {
        float f2;
        if (!this.valid) {
            Gdx.app.error("PerformanceCounter", "Invalid data, check if you called PerformanceCounter#stop()");
            return;
        }
        this.time.put(this.current);
        if (f == 0.0f) {
            f2 = 0.0f;
        } else {
            f2 = this.current / f;
        }
        FloatCounter floatCounter = this.load;
        if (f <= 1.0f) {
            f2 = (f2 * f) + ((1.0f - f) * floatCounter.latest);
        }
        floatCounter.put(f2);
        this.current = 0.0f;
        this.valid = false;
    }

    public void start() {
        this.startTime = TimeUtils.nanoTime();
        this.valid = false;
    }

    public void stop() {
        if (this.startTime > 0) {
            this.current += ((float) (TimeUtils.nanoTime() - this.startTime)) * 1.0E-9f;
            this.startTime = 0;
            this.valid = true;
        }
    }

    public void reset() {
        this.time.reset();
        this.load.reset();
        this.startTime = 0;
        this.lastTick = 0;
        this.current = 0.0f;
        this.valid = false;
    }

    public String toString() {
        return toString(new StringBuilder()).toString();
    }

    public StringBuilder toString(StringBuilder stringBuilder) {
        stringBuilder.append(this.name).append(": [time: ").append(this.time.value).append(", load: ").append(this.load.value).append("]");
        return stringBuilder;
    }
}
