package com.badlogic.gdx.utils;

public class PerformanceCounters {
    private static final float nano2seconds = 1.0E-9f;
    public final Array<PerformanceCounter> counters = new Array<>();
    private long lastTick = 0;

    public PerformanceCounter add(String str, int i) {
        PerformanceCounter performanceCounter = new PerformanceCounter(str, i);
        this.counters.add(performanceCounter);
        return performanceCounter;
    }

    public PerformanceCounter add(String str) {
        PerformanceCounter performanceCounter = new PerformanceCounter(str);
        this.counters.add(performanceCounter);
        return performanceCounter;
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
        for (int i = 0; i < this.counters.size; i++) {
            this.counters.get(i).tick(f);
        }
    }

    public StringBuilder toString(StringBuilder stringBuilder) {
        stringBuilder.setLength(0);
        for (int i = 0; i < this.counters.size; i++) {
            if (i != 0) {
                stringBuilder.append("; ");
            }
            this.counters.get(i).toString(stringBuilder);
        }
        return stringBuilder;
    }
}
