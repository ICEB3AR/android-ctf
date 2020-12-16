package com.badlogic.gdx.math;

public final class WindowedMean {
    int added_values = 0;
    boolean dirty = true;
    int last_value;
    float mean = 0.0f;
    float[] values;

    public WindowedMean(int i) {
        this.values = new float[i];
    }

    public boolean hasEnoughData() {
        return this.added_values >= this.values.length;
    }

    public void clear() {
        int i = 0;
        this.added_values = 0;
        this.last_value = 0;
        while (true) {
            float[] fArr = this.values;
            if (i < fArr.length) {
                fArr[i] = 0.0f;
                i++;
            } else {
                this.dirty = true;
                return;
            }
        }
    }

    public void addValue(float f) {
        int i = this.added_values;
        if (i < this.values.length) {
            this.added_values = i + 1;
        }
        float[] fArr = this.values;
        int i2 = this.last_value;
        this.last_value = i2 + 1;
        fArr[i2] = f;
        if (this.last_value > fArr.length - 1) {
            this.last_value = 0;
        }
        this.dirty = true;
    }

    public float getMean() {
        float[] fArr;
        if (!hasEnoughData()) {
            return 0.0f;
        }
        if (this.dirty) {
            int i = 0;
            float f = 0.0f;
            while (true) {
                fArr = this.values;
                if (i >= fArr.length) {
                    break;
                }
                f += fArr[i];
                i++;
            }
            this.mean = f / ((float) fArr.length);
            this.dirty = false;
        }
        return this.mean;
    }

    public float getOldest() {
        int i = this.added_values;
        float[] fArr = this.values;
        return i < fArr.length ? fArr[0] : fArr[this.last_value];
    }

    public float getLatest() {
        float[] fArr = this.values;
        int i = this.last_value;
        if (i - 1 == -1) {
            i = fArr.length;
        }
        return fArr[i - 1];
    }

    public float standardDeviation() {
        float f = 0.0f;
        if (!hasEnoughData()) {
            return 0.0f;
        }
        float mean2 = getMean();
        int i = 0;
        while (true) {
            float[] fArr = this.values;
            if (i >= fArr.length) {
                return (float) Math.sqrt((double) (f / ((float) fArr.length)));
            }
            f += (fArr[i] - mean2) * (fArr[i] - mean2);
            i++;
        }
    }

    public float getLowest() {
        float f = Float.MAX_VALUE;
        int i = 0;
        while (true) {
            float[] fArr = this.values;
            if (i >= fArr.length) {
                return f;
            }
            f = Math.min(f, fArr[i]);
            i++;
        }
    }

    public float getHighest() {
        float f = Float.MIN_NORMAL;
        int i = 0;
        while (true) {
            float[] fArr = this.values;
            if (i >= fArr.length) {
                return f;
            }
            f = Math.max(f, fArr[i]);
            i++;
        }
    }

    public int getValueCount() {
        return this.added_values;
    }

    public int getWindowSize() {
        return this.values.length;
    }

    public float[] getWindowValues() {
        float[] fArr = new float[this.added_values];
        if (hasEnoughData()) {
            for (int i = 0; i < fArr.length; i++) {
                float[] fArr2 = this.values;
                fArr[i] = fArr2[(this.last_value + i) % fArr2.length];
            }
        } else {
            System.arraycopy(this.values, 0, fArr, 0, this.added_values);
        }
        return fArr;
    }
}
