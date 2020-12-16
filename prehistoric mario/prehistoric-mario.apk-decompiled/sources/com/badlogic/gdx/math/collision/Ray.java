package com.badlogic.gdx.math.collision;

import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import java.io.Serializable;

public class Ray implements Serializable {
    private static final long serialVersionUID = -620692054835390878L;
    static Vector3 tmp = new Vector3();
    public final Vector3 direction = new Vector3();
    public final Vector3 origin = new Vector3();

    public Ray() {
    }

    public Ray(Vector3 vector3, Vector3 vector32) {
        this.origin.set(vector3);
        this.direction.set(vector32).nor();
    }

    public Ray cpy() {
        return new Ray(this.origin, this.direction);
    }

    public Vector3 getEndPoint(Vector3 vector3, float f) {
        return vector3.set(this.direction).scl(f).add(this.origin);
    }

    public Ray mul(Matrix4 matrix4) {
        tmp.set(this.origin).add(this.direction);
        tmp.mul(matrix4);
        this.origin.mul(matrix4);
        this.direction.set(tmp.sub(this.origin));
        return this;
    }

    public String toString() {
        return "ray [" + this.origin + ":" + this.direction + "]";
    }

    public Ray set(Vector3 vector3, Vector3 vector32) {
        this.origin.set(vector3);
        this.direction.set(vector32);
        return this;
    }

    public Ray set(float f, float f2, float f3, float f4, float f5, float f6) {
        this.origin.set(f, f2, f3);
        this.direction.set(f4, f5, f6);
        return this;
    }

    public Ray set(Ray ray) {
        this.origin.set(ray.origin);
        this.direction.set(ray.direction);
        return this;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null || obj.getClass() != getClass()) {
            return false;
        }
        Ray ray = (Ray) obj;
        if (!this.direction.equals(ray.direction) || !this.origin.equals(ray.origin)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        return ((this.direction.hashCode() + 73) * 73) + this.origin.hashCode();
    }
}
