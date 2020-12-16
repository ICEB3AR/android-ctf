package com.badlogic.gdx.math.collision;

import com.badlogic.gdx.math.Vector3;
import java.io.Serializable;

public class Segment implements Serializable {
    private static final long serialVersionUID = 2739667069736519602L;
    public final Vector3 a = new Vector3();
    public final Vector3 b = new Vector3();

    public Segment(Vector3 vector3, Vector3 vector32) {
        this.a.set(vector3);
        this.b.set(vector32);
    }

    public Segment(float f, float f2, float f3, float f4, float f5, float f6) {
        this.a.set(f, f2, f3);
        this.b.set(f4, f5, f6);
    }

    public float len() {
        return this.a.dst(this.b);
    }

    public float len2() {
        return this.a.dst2(this.b);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || obj.getClass() != getClass()) {
            return false;
        }
        Segment segment = (Segment) obj;
        if (!this.a.equals(segment.a) || !this.b.equals(segment.b)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        return ((this.a.hashCode() + 71) * 71) + this.b.hashCode();
    }
}
