package com.badlogic.gdx.math;

public abstract class Interpolation {
    public static final Bounce bounce = new Bounce(4);
    public static final BounceIn bounceIn = new BounceIn(4);
    public static final BounceOut bounceOut = new BounceOut(4);
    public static final Interpolation circle = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass12 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            if (f <= 0.5f) {
                float f2 = f * 2.0f;
                return (1.0f - ((float) Math.sqrt((double) (1.0f - (f2 * f2))))) / 2.0f;
            }
            float f3 = (f - 1.0f) * 2.0f;
            return (((float) Math.sqrt((double) (1.0f - (f3 * f3)))) + 1.0f) / 2.0f;
        }
    };
    public static final Interpolation circleIn = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass13 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return 1.0f - ((float) Math.sqrt((double) (1.0f - (f * f))));
        }
    };
    public static final Interpolation circleOut = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass14 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            float f2 = f - 1.0f;
            return (float) Math.sqrt((double) (1.0f - (f2 * f2)));
        }
    };
    public static final Elastic elastic = new Elastic(2.0f, 10.0f, 7, 1.0f);
    public static final ElasticIn elasticIn = new ElasticIn(2.0f, 10.0f, 6, 1.0f);
    public static final ElasticOut elasticOut = new ElasticOut(2.0f, 10.0f, 7, 1.0f);
    public static final Exp exp10 = new Exp(2.0f, 10.0f);
    public static final ExpIn exp10In = new ExpIn(2.0f, 10.0f);
    public static final ExpOut exp10Out = new ExpOut(2.0f, 10.0f);
    public static final Exp exp5 = new Exp(2.0f, 5.0f);
    public static final ExpIn exp5In = new ExpIn(2.0f, 5.0f);
    public static final ExpOut exp5Out = new ExpOut(2.0f, 5.0f);
    public static final Interpolation fade = smoother;
    public static final PowOut fastSlow = pow2Out;
    public static final Interpolation linear = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass1 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return f;
        }
    };
    public static final Pow pow2 = new Pow(2);
    public static final PowIn pow2In = new PowIn(2);
    public static final Interpolation pow2InInverse = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass5 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return (float) Math.sqrt((double) f);
        }
    };
    public static final PowOut pow2Out = new PowOut(2);
    public static final Interpolation pow2OutInverse = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass6 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return 1.0f - ((float) Math.sqrt((double) (-(f - 1.0f))));
        }
    };
    public static final Pow pow3 = new Pow(3);
    public static final PowIn pow3In = new PowIn(3);
    public static final Interpolation pow3InInverse = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass7 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return (float) Math.cbrt((double) f);
        }
    };
    public static final PowOut pow3Out = new PowOut(3);
    public static final Interpolation pow3OutInverse = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass8 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return 1.0f - ((float) Math.cbrt((double) (-(f - 1.0f))));
        }
    };
    public static final Pow pow4 = new Pow(4);
    public static final PowIn pow4In = new PowIn(4);
    public static final PowOut pow4Out = new PowOut(4);
    public static final Pow pow5 = new Pow(5);
    public static final PowIn pow5In = new PowIn(5);
    public static final PowOut pow5Out = new PowOut(5);
    public static final Interpolation sine = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass9 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return (1.0f - MathUtils.cos(f * 3.1415927f)) / 2.0f;
        }
    };
    public static final Interpolation sineIn = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass10 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return 1.0f - MathUtils.cos((f * 3.1415927f) / 2.0f);
        }
    };
    public static final Interpolation sineOut = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass11 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return MathUtils.sin((f * 3.1415927f) / 2.0f);
        }
    };
    public static final PowIn slowFast = pow2In;
    public static final Interpolation smooth = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass2 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return f * f * (3.0f - (f * 2.0f));
        }
    };
    public static final Interpolation smooth2 = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass3 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            float f2 = f * f * (3.0f - (f * 2.0f));
            return f2 * f2 * (3.0f - (f2 * 2.0f));
        }
    };
    public static final Interpolation smoother = new Interpolation() {
        /* class com.badlogic.gdx.math.Interpolation.AnonymousClass4 */

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return f * f * f * ((f * ((6.0f * f) - 15.0f)) + 10.0f);
        }
    };
    public static final Swing swing = new Swing(1.5f);
    public static final SwingIn swingIn = new SwingIn(2.0f);
    public static final SwingOut swingOut = new SwingOut(2.0f);

    public abstract float apply(float f);

    public float apply(float f, float f2, float f3) {
        return f + ((f2 - f) * apply(f3));
    }

    public static class Pow extends Interpolation {
        final int power;

        public Pow(int i) {
            this.power = i;
        }

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            if (f <= 0.5f) {
                return ((float) Math.pow((double) (f * 2.0f), (double) this.power)) / 2.0f;
            }
            float pow = (float) Math.pow((double) ((f - 1.0f) * 2.0f), (double) this.power);
            int i = 2;
            if (this.power % 2 == 0) {
                i = -2;
            }
            return (pow / ((float) i)) + 1.0f;
        }
    }

    public static class PowIn extends Pow {
        public PowIn(int i) {
            super(i);
        }

        @Override // com.badlogic.gdx.math.Interpolation.Pow, com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return (float) Math.pow((double) f, (double) this.power);
        }
    }

    public static class PowOut extends Pow {
        public PowOut(int i) {
            super(i);
        }

        @Override // com.badlogic.gdx.math.Interpolation.Pow, com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return (((float) Math.pow((double) (f - 1.0f), (double) this.power)) * ((float) (this.power % 2 == 0 ? -1 : 1))) + 1.0f;
        }
    }

    public static class Exp extends Interpolation {
        final float min;
        final float power;
        final float scale = (1.0f / (1.0f - this.min));
        final float value;

        public Exp(float f, float f2) {
            this.value = f;
            this.power = f2;
            this.min = (float) Math.pow((double) f, (double) (-f2));
        }

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            float pow;
            if (f <= 0.5f) {
                pow = (((float) Math.pow((double) this.value, (double) (this.power * ((f * 2.0f) - 1.0f)))) - this.min) * this.scale;
            } else {
                pow = 2.0f - ((((float) Math.pow((double) this.value, (double) ((-this.power) * ((f * 2.0f) - 1.0f)))) - this.min) * this.scale);
            }
            return pow / 2.0f;
        }
    }

    public static class ExpIn extends Exp {
        public ExpIn(float f, float f2) {
            super(f, f2);
        }

        @Override // com.badlogic.gdx.math.Interpolation.Exp, com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return (((float) Math.pow((double) this.value, (double) (this.power * (f - 1.0f)))) - this.min) * this.scale;
        }
    }

    public static class ExpOut extends Exp {
        public ExpOut(float f, float f2) {
            super(f, f2);
        }

        @Override // com.badlogic.gdx.math.Interpolation.Exp, com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return 1.0f - ((((float) Math.pow((double) this.value, (double) ((-this.power) * f))) - this.min) * this.scale);
        }
    }

    public static class Elastic extends Interpolation {
        final float bounces;
        final float power;
        final float scale;
        final float value;

        public Elastic(float f, float f2, int i, float f3) {
            this.value = f;
            this.power = f2;
            this.scale = f3;
            this.bounces = ((float) i) * 3.1415927f * ((float) (i % 2 == 0 ? 1 : -1));
        }

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            if (f <= 0.5f) {
                float f2 = f * 2.0f;
                return ((((float) Math.pow((double) this.value, (double) (this.power * (f2 - 1.0f)))) * MathUtils.sin(f2 * this.bounces)) * this.scale) / 2.0f;
            }
            float f3 = (1.0f - f) * 2.0f;
            return 1.0f - (((((float) Math.pow((double) this.value, (double) (this.power * (f3 - 1.0f)))) * MathUtils.sin(f3 * this.bounces)) * this.scale) / 2.0f);
        }
    }

    public static class ElasticIn extends Elastic {
        public ElasticIn(float f, float f2, int i, float f3) {
            super(f, f2, i, f3);
        }

        @Override // com.badlogic.gdx.math.Interpolation.Elastic, com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            if (((double) f) >= 0.99d) {
                return 1.0f;
            }
            return ((float) Math.pow((double) this.value, (double) (this.power * (f - 1.0f)))) * MathUtils.sin(f * this.bounces) * this.scale;
        }
    }

    public static class ElasticOut extends Elastic {
        public ElasticOut(float f, float f2, int i, float f3) {
            super(f, f2, i, f3);
        }

        @Override // com.badlogic.gdx.math.Interpolation.Elastic, com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            if (f == 0.0f) {
                return 0.0f;
            }
            float f2 = 1.0f - f;
            return 1.0f - ((((float) Math.pow((double) this.value, (double) (this.power * (f2 - 1.0f)))) * MathUtils.sin(f2 * this.bounces)) * this.scale);
        }
    }

    public static class Bounce extends BounceOut {
        public Bounce(float[] fArr, float[] fArr2) {
            super(fArr, fArr2);
        }

        public Bounce(int i) {
            super(i);
        }

        private float out(float f) {
            float f2 = (this.widths[0] / 2.0f) + f;
            if (f2 < this.widths[0]) {
                return (f2 / (this.widths[0] / 2.0f)) - 1.0f;
            }
            return super.apply(f);
        }

        @Override // com.badlogic.gdx.math.Interpolation.BounceOut, com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            if (f <= 0.5f) {
                return (1.0f - out(1.0f - (f * 2.0f))) / 2.0f;
            }
            return (out((f * 2.0f) - 1.0f) / 2.0f) + 0.5f;
        }
    }

    public static class BounceOut extends Interpolation {
        final float[] heights;
        final float[] widths;

        public BounceOut(float[] fArr, float[] fArr2) {
            if (fArr.length == fArr2.length) {
                this.widths = fArr;
                this.heights = fArr2;
                return;
            }
            throw new IllegalArgumentException("Must be the same number of widths and heights.");
        }

        public BounceOut(int i) {
            if (i < 2 || i > 5) {
                throw new IllegalArgumentException("bounces cannot be < 2 or > 5: " + i);
            }
            this.widths = new float[i];
            this.heights = new float[i];
            float[] fArr = this.heights;
            fArr[0] = 1.0f;
            if (i == 2) {
                float[] fArr2 = this.widths;
                fArr2[0] = 0.6f;
                fArr2[1] = 0.4f;
                fArr[1] = 0.33f;
            } else if (i == 3) {
                float[] fArr3 = this.widths;
                fArr3[0] = 0.4f;
                fArr3[1] = 0.4f;
                fArr3[2] = 0.2f;
                fArr[1] = 0.33f;
                fArr[2] = 0.1f;
            } else if (i == 4) {
                float[] fArr4 = this.widths;
                fArr4[0] = 0.34f;
                fArr4[1] = 0.34f;
                fArr4[2] = 0.2f;
                fArr4[3] = 0.15f;
                fArr[1] = 0.26f;
                fArr[2] = 0.11f;
                fArr[3] = 0.03f;
            } else if (i == 5) {
                float[] fArr5 = this.widths;
                fArr5[0] = 0.3f;
                fArr5[1] = 0.3f;
                fArr5[2] = 0.2f;
                fArr5[3] = 0.1f;
                fArr5[4] = 0.1f;
                fArr[1] = 0.45f;
                fArr[2] = 0.3f;
                fArr[3] = 0.15f;
                fArr[4] = 0.06f;
            }
            float[] fArr6 = this.widths;
            fArr6[0] = fArr6[0] * 2.0f;
        }

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            if (f == 1.0f) {
                return 1.0f;
            }
            float[] fArr = this.widths;
            int i = 0;
            float f2 = f + (fArr[0] / 2.0f);
            int length = fArr.length;
            float f3 = 0.0f;
            float f4 = 0.0f;
            while (true) {
                if (i >= length) {
                    break;
                }
                f4 = this.widths[i];
                if (f2 <= f4) {
                    f3 = this.heights[i];
                    break;
                }
                f2 -= f4;
                i++;
            }
            float f5 = f2 / f4;
            float f6 = (4.0f / f4) * f3 * f5;
            return 1.0f - ((f6 - (f5 * f6)) * f4);
        }
    }

    public static class BounceIn extends BounceOut {
        public BounceIn(float[] fArr, float[] fArr2) {
            super(fArr, fArr2);
        }

        public BounceIn(int i) {
            super(i);
        }

        @Override // com.badlogic.gdx.math.Interpolation.BounceOut, com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            return 1.0f - super.apply(1.0f - f);
        }
    }

    public static class Swing extends Interpolation {
        private final float scale;

        public Swing(float f) {
            this.scale = f * 2.0f;
        }

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            if (f <= 0.5f) {
                float f2 = f * 2.0f;
                float f3 = this.scale;
                return ((f2 * f2) * (((1.0f + f3) * f2) - f3)) / 2.0f;
            }
            float f4 = (f - 1.0f) * 2.0f;
            float f5 = this.scale;
            return (((f4 * f4) * (((f5 + 1.0f) * f4) + f5)) / 2.0f) + 1.0f;
        }
    }

    public static class SwingOut extends Interpolation {
        private final float scale;

        public SwingOut(float f) {
            this.scale = f;
        }

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            float f2 = f - 1.0f;
            float f3 = this.scale;
            return (f2 * f2 * (((f3 + 1.0f) * f2) + f3)) + 1.0f;
        }
    }

    public static class SwingIn extends Interpolation {
        private final float scale;

        public SwingIn(float f) {
            this.scale = f;
        }

        @Override // com.badlogic.gdx.math.Interpolation
        public float apply(float f) {
            float f2 = this.scale;
            return f * f * (((1.0f + f2) * f) - f2);
        }
    }
}
