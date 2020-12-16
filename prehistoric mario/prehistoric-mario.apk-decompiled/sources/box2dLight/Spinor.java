package box2dLight;

import com.badlogic.gdx.utils.StringBuilder;

public class Spinor {
    private static final float COSINE_THRESHOLD = 0.001f;
    float complex;
    float real;

    public Spinor() {
    }

    public Spinor(float f) {
        set(f);
    }

    public Spinor(Spinor spinor) {
        set(spinor);
    }

    public Spinor(float f, float f2) {
        set(f, f2);
    }

    public Spinor set(float f) {
        double d = (double) (f / 2.0f);
        set((float) Math.cos(d), (float) Math.sin(d));
        return this;
    }

    public Spinor set(Spinor spinor) {
        set(spinor.real, spinor.complex);
        return this;
    }

    public Spinor set(float f, float f2) {
        this.real = f;
        this.complex = f2;
        return this;
    }

    public Spinor scale(float f) {
        this.real *= f;
        this.complex *= f;
        return this;
    }

    public Spinor invert() {
        this.complex = -this.complex;
        scale(len2());
        return this;
    }

    public Spinor add(Spinor spinor) {
        this.real += spinor.real;
        this.complex += spinor.complex;
        return this;
    }

    public Spinor add(float f) {
        double d = (double) this.real;
        double d2 = (double) (f / 2.0f);
        double cos = Math.cos(d2);
        Double.isNaN(d);
        this.real = (float) (d + cos);
        double d3 = (double) this.complex;
        double sin = Math.sin(d2);
        Double.isNaN(d3);
        this.complex = (float) (d3 + sin);
        return this;
    }

    public Spinor sub(Spinor spinor) {
        this.real -= spinor.real;
        this.complex -= spinor.complex;
        return this;
    }

    public Spinor sub(float f) {
        double d = (double) this.real;
        double d2 = (double) (f / 2.0f);
        double cos = Math.cos(d2);
        Double.isNaN(d);
        this.real = (float) (d - cos);
        double d3 = (double) this.complex;
        double sin = Math.sin(d2);
        Double.isNaN(d3);
        this.complex = (float) (d3 - sin);
        return this;
    }

    public float len() {
        float f = this.real;
        float f2 = this.complex;
        return (float) Math.sqrt((double) ((f * f) + (f2 * f2)));
    }

    public float len2() {
        float f = this.real;
        float f2 = this.complex;
        return (f * f) + (f2 * f2);
    }

    public Spinor mul(Spinor spinor) {
        float f = this.real;
        float f2 = spinor.real;
        float f3 = this.complex;
        float f4 = spinor.complex;
        set((f * f2) - (f3 * f4), (f * f4) + (f3 * f2));
        return this;
    }

    public Spinor nor() {
        float len = len();
        this.real /= len;
        this.complex /= len;
        return this;
    }

    public float angle() {
        return ((float) Math.atan2((double) this.complex, (double) this.real)) * 2.0f;
    }

    public Spinor lerp(Spinor spinor, float f, Spinor spinor2) {
        scale(1.0f - f);
        spinor2.set(spinor).scale(f);
        add(spinor2);
        nor();
        return this;
    }

    public Spinor slerp(Spinor spinor, float f) {
        float f2;
        float f3 = this.real;
        float f4 = spinor.real;
        float f5 = this.complex;
        float f6 = spinor.complex;
        float f7 = (f3 * f4) + (f5 * f6);
        if (f7 < 0.0f) {
            f7 = -f7;
            f6 = -f6;
            f4 = -f4;
        }
        if (1.0f - f7 > COSINE_THRESHOLD) {
            float acos = (float) Math.acos((double) f7);
            float sin = (float) Math.sin((double) acos);
            f2 = ((float) Math.sin((double) ((1.0f - f) * acos))) / sin;
            f = ((float) Math.sin((double) (f * acos))) / sin;
        } else {
            f2 = 1.0f - f;
        }
        this.complex = (this.complex * f2) + (f6 * f);
        this.real = (f2 * this.real) + (f * f4);
        return this;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        float angle = angle();
        stringBuilder.append("radians: ");
        stringBuilder.append(angle);
        stringBuilder.append(", degrees: ");
        stringBuilder.append(angle * 57.295776f);
        return stringBuilder.toString();
    }
}
