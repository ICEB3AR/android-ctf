package com.badlogic.gdx.backends.android.surfaceview;

import android.view.View;
import com.badlogic.gdx.backends.android.surfaceview.ResolutionStrategy;

public class RatioResolutionStrategy implements ResolutionStrategy {
    private final float ratio;

    public RatioResolutionStrategy(float f) {
        this.ratio = f;
    }

    public RatioResolutionStrategy(float f, float f2) {
        this.ratio = f / f2;
    }

    @Override // com.badlogic.gdx.backends.android.surfaceview.ResolutionStrategy
    public ResolutionStrategy.MeasuredDimension calcMeasures(int i, int i2) {
        int size = View.MeasureSpec.getSize(i);
        int size2 = View.MeasureSpec.getSize(i2);
        float f = this.ratio;
        float f2 = (float) size;
        float f3 = (float) size2;
        if (f2 / f3 < f) {
            size2 = Math.round(f2 / f);
        } else {
            size = Math.round(f3 * f);
        }
        return new ResolutionStrategy.MeasuredDimension(size, size2);
    }
}
