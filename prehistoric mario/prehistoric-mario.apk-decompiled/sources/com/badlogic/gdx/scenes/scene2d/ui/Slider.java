package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.ui.ProgressBar;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Pools;

public class Slider extends ProgressBar {
    int draggingPointer;
    boolean mouseOver;
    private float[] snapValues;
    private float threshold;
    private Interpolation visualInterpolationInverse;

    /* JADX WARNING: Illegal instructions before constructor call */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public Slider(float r7, float r8, float r9, boolean r10, com.badlogic.gdx.scenes.scene2d.ui.Skin r11) {
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
            java.lang.Class<com.badlogic.gdx.scenes.scene2d.ui.Slider$SliderStyle> r1 = com.badlogic.gdx.scenes.scene2d.ui.Slider.SliderStyle.class
            java.lang.Object r11 = r11.get(r0, r1)
            r5 = r11
            com.badlogic.gdx.scenes.scene2d.ui.Slider$SliderStyle r5 = (com.badlogic.gdx.scenes.scene2d.ui.Slider.SliderStyle) r5
            r0 = r6
            r1 = r7
            r2 = r8
            r3 = r9
            r4 = r10
            r0.<init>(r1, r2, r3, r4, r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.Slider.<init>(float, float, float, boolean, com.badlogic.gdx.scenes.scene2d.ui.Skin):void");
    }

    public Slider(float f, float f2, float f3, boolean z, Skin skin, String str) {
        this(f, f2, f3, z, (SliderStyle) skin.get(str, SliderStyle.class));
    }

    public Slider(float f, float f2, float f3, boolean z, SliderStyle sliderStyle) {
        super(f, f2, f3, z, sliderStyle);
        this.draggingPointer = -1;
        this.visualInterpolationInverse = Interpolation.linear;
        addListener(new InputListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Slider.AnonymousClass1 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                if (Slider.this.disabled || Slider.this.draggingPointer != -1) {
                    return false;
                }
                Slider slider = Slider.this;
                slider.draggingPointer = i;
                slider.calculatePositionAndValue(f, f2);
                return true;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                if (i == Slider.this.draggingPointer) {
                    Slider.this.draggingPointer = -1;
                    if (inputEvent.isTouchFocusCancel() || !Slider.this.calculatePositionAndValue(f, f2)) {
                        ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent) Pools.obtain(ChangeListener.ChangeEvent.class);
                        Slider.this.fire(changeEvent);
                        Pools.free(changeEvent);
                    }
                }
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchDragged(InputEvent inputEvent, float f, float f2, int i) {
                Slider.this.calculatePositionAndValue(f, f2);
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void enter(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
                if (i == -1) {
                    Slider.this.mouseOver = true;
                }
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void exit(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
                if (i == -1) {
                    Slider.this.mouseOver = false;
                }
            }
        });
    }

    public void setStyle(SliderStyle sliderStyle) {
        if (sliderStyle == null) {
            throw new NullPointerException("style cannot be null");
        } else if (sliderStyle instanceof SliderStyle) {
            super.setStyle((ProgressBar.ProgressBarStyle) sliderStyle);
        } else {
            throw new IllegalArgumentException("style must be a SliderStyle.");
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.ProgressBar
    public SliderStyle getStyle() {
        return (SliderStyle) super.getStyle();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.ProgressBar
    public Drawable getKnobDrawable() {
        SliderStyle style = getStyle();
        if (this.disabled && style.disabledKnob != null) {
            return style.disabledKnob;
        }
        if (!isDragging() || style.knobDown == null) {
            return (!this.mouseOver || style.knobOver == null) ? style.knob : style.knobOver;
        }
        return style.knobDown;
    }

    /* access modifiers changed from: package-private */
    public boolean calculatePositionAndValue(float f, float f2) {
        float f3;
        float f4;
        float f5;
        SliderStyle style = getStyle();
        Drawable knobDrawable = getKnobDrawable();
        Drawable drawable = (!this.disabled || style.disabledBackground == null) ? style.background : style.disabledBackground;
        float f6 = this.position;
        float minValue = getMinValue();
        float maxValue = getMaxValue();
        if (this.vertical) {
            float height = (getHeight() - drawable.getTopHeight()) - drawable.getBottomHeight();
            if (knobDrawable == null) {
                f5 = 0.0f;
            } else {
                f5 = knobDrawable.getMinHeight();
            }
            this.position = (f2 - drawable.getBottomHeight()) - (0.5f * f5);
            float f7 = height - f5;
            f3 = minValue + ((maxValue - minValue) * this.visualInterpolationInverse.apply(this.position / f7));
            this.position = Math.max(Math.min(0.0f, drawable.getBottomHeight()), this.position);
            this.position = Math.min(f7, this.position);
        } else {
            float width = (getWidth() - drawable.getLeftWidth()) - drawable.getRightWidth();
            if (knobDrawable == null) {
                f4 = 0.0f;
            } else {
                f4 = knobDrawable.getMinWidth();
            }
            this.position = (f - drawable.getLeftWidth()) - (0.5f * f4);
            float f8 = width - f4;
            f3 = minValue + ((maxValue - minValue) * this.visualInterpolationInverse.apply(this.position / f8));
            this.position = Math.max(Math.min(0.0f, drawable.getLeftWidth()), this.position);
            this.position = Math.min(f8, this.position);
        }
        float snap = (Gdx.input.isKeyPressed(59) || Gdx.input.isKeyPressed(60)) ? f3 : snap(f3);
        boolean value = setValue(snap);
        if (snap == f3) {
            this.position = f6;
        }
        return value;
    }

    /* access modifiers changed from: protected */
    public float snap(float f) {
        float[] fArr = this.snapValues;
        if (fArr == null || fArr.length == 0) {
            return f;
        }
        int i = 0;
        float f2 = -1.0f;
        float f3 = 0.0f;
        while (true) {
            float[] fArr2 = this.snapValues;
            if (i >= fArr2.length) {
                break;
            }
            float f4 = fArr2[i];
            float abs = Math.abs(f - f4);
            if (abs <= this.threshold && (f2 == -1.0f || abs < f2)) {
                f3 = f4;
                f2 = abs;
            }
            i++;
        }
        return f2 == -1.0f ? f : f3;
    }

    public void setSnapToValues(float[] fArr, float f) {
        this.snapValues = fArr;
        this.threshold = f;
    }

    public boolean isDragging() {
        return this.draggingPointer != -1;
    }

    public void setVisualInterpolationInverse(Interpolation interpolation) {
        this.visualInterpolationInverse = interpolation;
    }

    public static class SliderStyle extends ProgressBar.ProgressBarStyle {
        public Drawable knobDown;
        public Drawable knobOver;

        public SliderStyle() {
        }

        public SliderStyle(Drawable drawable, Drawable drawable2) {
            super(drawable, drawable2);
        }

        public SliderStyle(SliderStyle sliderStyle) {
            super(sliderStyle);
            this.knobOver = sliderStyle.knobOver;
            this.knobDown = sliderStyle.knobDown;
        }
    }
}
