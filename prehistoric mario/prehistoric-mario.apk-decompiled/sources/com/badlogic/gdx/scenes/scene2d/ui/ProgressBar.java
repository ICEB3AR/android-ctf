package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.Disableable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Pools;

public class ProgressBar extends Widget implements Disableable {
    private float animateDuration;
    private float animateFromValue;
    private Interpolation animateInterpolation;
    private float animateTime;
    boolean disabled;
    private float max;
    private float min;
    float position;
    private boolean round;
    private float stepSize;
    private ProgressBarStyle style;
    private float value;
    final boolean vertical;
    private Interpolation visualInterpolation;

    /* JADX WARNING: Illegal instructions before constructor call */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public ProgressBar(float r7, float r8, float r9, boolean r10, com.badlogic.gdx.scenes.scene2d.ui.Skin r11) {
        /*
            r6 = this;
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "default-"
            r0.append(r1)
            if (r10 == 0) goto L_0x000f
            java.lang.String r1 = "vertical"
            goto L_0x0011
        L_0x000f:
            java.lang.String r1 = "horizontal"
        L_0x0011:
            r0.append(r1)
            java.lang.String r0 = r0.toString()
            java.lang.Class<com.badlogic.gdx.scenes.scene2d.ui.ProgressBar$ProgressBarStyle> r1 = com.badlogic.gdx.scenes.scene2d.ui.ProgressBar.ProgressBarStyle.class
            java.lang.Object r11 = r11.get(r0, r1)
            r5 = r11
            com.badlogic.gdx.scenes.scene2d.ui.ProgressBar$ProgressBarStyle r5 = (com.badlogic.gdx.scenes.scene2d.ui.ProgressBar.ProgressBarStyle) r5
            r0 = r6
            r1 = r7
            r2 = r8
            r3 = r9
            r4 = r10
            r0.<init>(r1, r2, r3, r4, r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.ProgressBar.<init>(float, float, float, boolean, com.badlogic.gdx.scenes.scene2d.ui.Skin):void");
    }

    public ProgressBar(float f, float f2, float f3, boolean z, Skin skin, String str) {
        this(f, f2, f3, z, (ProgressBarStyle) skin.get(str, ProgressBarStyle.class));
    }

    public ProgressBar(float f, float f2, float f3, boolean z, ProgressBarStyle progressBarStyle) {
        this.animateInterpolation = Interpolation.linear;
        this.visualInterpolation = Interpolation.linear;
        this.round = true;
        if (f > f2) {
            throw new IllegalArgumentException("max must be > min. min,max: " + f + ", " + f2);
        } else if (f3 > 0.0f) {
            setStyle(progressBarStyle);
            this.min = f;
            this.max = f2;
            this.stepSize = f3;
            this.vertical = z;
            this.value = f;
            setSize(getPrefWidth(), getPrefHeight());
        } else {
            throw new IllegalArgumentException("stepSize must be > 0: " + f3);
        }
    }

    public void setStyle(ProgressBarStyle progressBarStyle) {
        if (progressBarStyle != null) {
            this.style = progressBarStyle;
            invalidateHierarchy();
            return;
        }
        throw new IllegalArgumentException("style cannot be null.");
    }

    public ProgressBarStyle getStyle() {
        return this.style;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void act(float f) {
        super.act(f);
        float f2 = this.animateTime;
        if (f2 > 0.0f) {
            this.animateTime = f2 - f;
            Stage stage = getStage();
            if (stage != null && stage.getActionsRequestRendering()) {
                Gdx.graphics.requestRendering();
            }
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        float f2;
        float f3;
        float f4;
        float f5;
        float f6;
        float f7;
        float f8;
        float f9;
        float f10;
        float f11;
        ProgressBarStyle progressBarStyle = this.style;
        boolean z = this.disabled;
        Drawable knobDrawable = getKnobDrawable();
        Drawable drawable = (!z || progressBarStyle.disabledBackground == null) ? progressBarStyle.background : progressBarStyle.disabledBackground;
        Drawable drawable2 = (!z || progressBarStyle.disabledKnobBefore == null) ? progressBarStyle.knobBefore : progressBarStyle.disabledKnobBefore;
        Drawable drawable3 = (!z || progressBarStyle.disabledKnobAfter == null) ? progressBarStyle.knobAfter : progressBarStyle.disabledKnobAfter;
        Color color = getColor();
        float x = getX();
        float y = getY();
        float width = getWidth();
        float height = getHeight();
        if (knobDrawable == null) {
            f2 = 0.0f;
        } else {
            f2 = knobDrawable.getMinHeight();
        }
        if (knobDrawable == null) {
            f3 = 0.0f;
        } else {
            f3 = knobDrawable.getMinWidth();
        }
        float visualPercent = getVisualPercent();
        batch.setColor(color.r, color.g, color.b, color.a * f);
        if (this.vertical) {
            if (drawable != null) {
                if (this.round) {
                    f10 = 0.0f;
                    drawable.draw(batch, (float) Math.round(((width - drawable.getMinWidth()) * 0.5f) + x), y, (float) Math.round(drawable.getMinWidth()), height);
                } else {
                    f10 = 0.0f;
                    drawable.draw(batch, (x + width) - (drawable.getMinWidth() * 0.5f), y, drawable.getMinWidth(), height);
                }
                f7 = drawable.getTopHeight();
                f9 = drawable.getBottomHeight();
                f8 = height - (f7 + f9);
            } else {
                f10 = 0.0f;
                f8 = height;
                f9 = 0.0f;
                f7 = 0.0f;
            }
            if (knobDrawable == null) {
                if (drawable2 == null) {
                    f11 = 0.0f;
                } else {
                    f11 = drawable2.getMinHeight() * 0.5f;
                }
                float f12 = f8 - f11;
                this.position = f12 * visualPercent;
                this.position = Math.min(f12, this.position);
            } else {
                f11 = f2 * 0.5f;
                float f13 = f8 - f2;
                this.position = f13 * visualPercent;
                this.position = Math.min(f13, this.position) + f9;
            }
            this.position = Math.max(Math.min(f10, f9), this.position);
            if (drawable2 != null) {
                if (this.round) {
                    drawable2.draw(batch, (float) Math.round(((width - drawable2.getMinWidth()) * 0.5f) + x), (float) Math.round(f7 + y), (float) Math.round(drawable2.getMinWidth()), (float) Math.round(this.position + f11));
                } else {
                    drawable2.draw(batch, x + ((width - drawable2.getMinWidth()) * 0.5f), y + f7, drawable2.getMinWidth(), this.position + f11);
                }
            }
            if (drawable3 != null) {
                if (this.round) {
                    drawable3.draw(batch, (float) Math.round(((width - drawable3.getMinWidth()) * 0.5f) + x), (float) Math.round(this.position + y + f11), (float) Math.round(drawable3.getMinWidth()), (float) Math.round((height - this.position) - f11));
                } else {
                    drawable3.draw(batch, x + ((width - drawable3.getMinWidth()) * 0.5f), this.position + y + f11, drawable3.getMinWidth(), (height - this.position) - f11);
                }
            }
            if (knobDrawable == null) {
                return;
            }
            if (this.round) {
                knobDrawable.draw(batch, (float) Math.round(x + ((width - f3) * 0.5f)), (float) Math.round(y + this.position), (float) Math.round(f3), (float) Math.round(f2));
            } else {
                knobDrawable.draw(batch, x + ((width - f3) * 0.5f), y + this.position, f3, f2);
            }
        } else {
            if (drawable != null) {
                if (this.round) {
                    drawable.draw(batch, x, (float) Math.round(((height - drawable.getMinHeight()) * 0.5f) + y), width, (float) Math.round(drawable.getMinHeight()));
                } else {
                    drawable.draw(batch, x, y + ((height - drawable.getMinHeight()) * 0.5f), width, drawable.getMinHeight());
                }
                f4 = drawable.getLeftWidth();
                f5 = width - (drawable.getRightWidth() + f4);
            } else {
                f5 = width;
                f4 = 0.0f;
            }
            if (knobDrawable == null) {
                if (drawable2 == null) {
                    f6 = 0.0f;
                } else {
                    f6 = drawable2.getMinWidth() * 0.5f;
                }
                float f14 = f5 - f6;
                this.position = f14 * visualPercent;
                this.position = Math.min(f14, this.position);
            } else {
                f6 = f3 * 0.5f;
                float f15 = f5 - f3;
                this.position = f15 * visualPercent;
                this.position = Math.min(f15, this.position) + f4;
            }
            this.position = Math.max(Math.min(0.0f, f4), this.position);
            if (drawable2 != null) {
                if (this.round) {
                    drawable2.draw(batch, (float) Math.round(f4 + x), (float) Math.round(((height - drawable2.getMinHeight()) * 0.5f) + y), (float) Math.round(this.position + f6), (float) Math.round(drawable2.getMinHeight()));
                } else {
                    drawable2.draw(batch, x + f4, y + ((height - drawable2.getMinHeight()) * 0.5f), this.position + f6, drawable2.getMinHeight());
                }
            }
            if (drawable3 != null) {
                if (this.round) {
                    drawable3.draw(batch, (float) Math.round(this.position + x + f6), (float) Math.round(((height - drawable3.getMinHeight()) * 0.5f) + y), (float) Math.round((width - this.position) - f6), (float) Math.round(drawable3.getMinHeight()));
                } else {
                    drawable3.draw(batch, this.position + x + f6, y + ((height - drawable3.getMinHeight()) * 0.5f), (width - this.position) - f6, drawable3.getMinHeight());
                }
            }
            if (knobDrawable == null) {
                return;
            }
            if (this.round) {
                knobDrawable.draw(batch, (float) Math.round(x + this.position), (float) Math.round(y + ((height - f2) * 0.5f)), (float) Math.round(f3), (float) Math.round(f2));
            } else {
                knobDrawable.draw(batch, x + this.position, y + ((height - f2) * 0.5f), f3, f2);
            }
        }
    }

    public float getValue() {
        return this.value;
    }

    public float getVisualValue() {
        float f = this.animateTime;
        if (f > 0.0f) {
            return this.animateInterpolation.apply(this.animateFromValue, this.value, 1.0f - (f / this.animateDuration));
        }
        return this.value;
    }

    public float getPercent() {
        float f = this.min;
        float f2 = this.max;
        if (f == f2) {
            return 0.0f;
        }
        return (this.value - f) / (f2 - f);
    }

    public float getVisualPercent() {
        if (this.min == this.max) {
            return 0.0f;
        }
        Interpolation interpolation = this.visualInterpolation;
        float visualValue = getVisualValue();
        float f = this.min;
        return interpolation.apply((visualValue - f) / (this.max - f));
    }

    /* access modifiers changed from: protected */
    public Drawable getKnobDrawable() {
        return (!this.disabled || this.style.disabledKnob == null) ? this.style.knob : this.style.disabledKnob;
    }

    /* access modifiers changed from: protected */
    public float getKnobPosition() {
        return this.position;
    }

    public boolean setValue(float f) {
        float clamp = clamp(((float) Math.round(f / this.stepSize)) * this.stepSize);
        float f2 = this.value;
        if (clamp == f2) {
            return false;
        }
        float visualValue = getVisualValue();
        this.value = clamp;
        ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent) Pools.obtain(ChangeListener.ChangeEvent.class);
        boolean fire = fire(changeEvent);
        if (fire) {
            this.value = f2;
        } else {
            float f3 = this.animateDuration;
            if (f3 > 0.0f) {
                this.animateFromValue = visualValue;
                this.animateTime = f3;
            }
        }
        Pools.free(changeEvent);
        return !fire;
    }

    /* access modifiers changed from: protected */
    public float clamp(float f) {
        return MathUtils.clamp(f, this.min, this.max);
    }

    public void setRange(float f, float f2) {
        if (f <= f2) {
            this.min = f;
            this.max = f2;
            float f3 = this.value;
            if (f3 < f) {
                setValue(f);
            } else if (f3 > f2) {
                setValue(f2);
            }
        } else {
            throw new IllegalArgumentException("min must be <= max: " + f + " <= " + f2);
        }
    }

    public void setStepSize(float f) {
        if (f > 0.0f) {
            this.stepSize = f;
            return;
        }
        throw new IllegalArgumentException("steps must be > 0: " + f);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefWidth() {
        float f;
        if (!this.vertical) {
            return 140.0f;
        }
        Drawable knobDrawable = getKnobDrawable();
        Drawable drawable = (!this.disabled || this.style.disabledBackground == null) ? this.style.background : this.style.disabledBackground;
        float f2 = 0.0f;
        if (knobDrawable == null) {
            f = 0.0f;
        } else {
            f = knobDrawable.getMinWidth();
        }
        if (drawable != null) {
            f2 = drawable.getMinWidth();
        }
        return Math.max(f, f2);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefHeight() {
        float f;
        if (this.vertical) {
            return 140.0f;
        }
        Drawable knobDrawable = getKnobDrawable();
        Drawable drawable = (!this.disabled || this.style.disabledBackground == null) ? this.style.background : this.style.disabledBackground;
        float f2 = 0.0f;
        if (knobDrawable == null) {
            f = 0.0f;
        } else {
            f = knobDrawable.getMinHeight();
        }
        if (drawable != null) {
            f2 = drawable.getMinHeight();
        }
        return Math.max(f, f2);
    }

    public float getMinValue() {
        return this.min;
    }

    public float getMaxValue() {
        return this.max;
    }

    public float getStepSize() {
        return this.stepSize;
    }

    public void setAnimateDuration(float f) {
        this.animateDuration = f;
    }

    public void setAnimateInterpolation(Interpolation interpolation) {
        if (interpolation != null) {
            this.animateInterpolation = interpolation;
            return;
        }
        throw new IllegalArgumentException("animateInterpolation cannot be null.");
    }

    public void setVisualInterpolation(Interpolation interpolation) {
        this.visualInterpolation = interpolation;
    }

    public void setRound(boolean z) {
        this.round = z;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public void setDisabled(boolean z) {
        this.disabled = z;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public boolean isDisabled() {
        return this.disabled;
    }

    public boolean isVertical() {
        return this.vertical;
    }

    public static class ProgressBarStyle {
        public Drawable background;
        public Drawable disabledBackground;
        public Drawable disabledKnob;
        public Drawable disabledKnobAfter;
        public Drawable disabledKnobBefore;
        public Drawable knob;
        public Drawable knobAfter;
        public Drawable knobBefore;

        public ProgressBarStyle() {
        }

        public ProgressBarStyle(Drawable drawable, Drawable drawable2) {
            this.background = drawable;
            this.knob = drawable2;
        }

        public ProgressBarStyle(ProgressBarStyle progressBarStyle) {
            this.background = progressBarStyle.background;
            this.disabledBackground = progressBarStyle.disabledBackground;
            this.knob = progressBarStyle.knob;
            this.disabledKnob = progressBarStyle.disabledKnob;
            this.knobBefore = progressBarStyle.knobBefore;
            this.knobAfter = progressBarStyle.knobAfter;
            this.disabledKnobBefore = progressBarStyle.disabledKnobBefore;
            this.disabledKnobAfter = progressBarStyle.disabledKnobAfter;
        }
    }
}
