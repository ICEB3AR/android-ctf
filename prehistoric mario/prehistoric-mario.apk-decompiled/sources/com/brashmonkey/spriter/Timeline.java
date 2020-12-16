package com.brashmonkey.spriter;

import com.brashmonkey.spriter.Entity;

public class Timeline {
    public final int id;
    private int keyPointer = 0;
    public final Key[] keys;
    public final String name;
    public final Entity.ObjectInfo objectInfo;

    Timeline(int i, String str, Entity.ObjectInfo objectInfo2, int i2) {
        this.id = i;
        this.name = str;
        this.objectInfo = objectInfo2;
        this.keys = new Key[i2];
    }

    /* access modifiers changed from: package-private */
    public void addKey(Key key) {
        Key[] keyArr = this.keys;
        int i = this.keyPointer;
        this.keyPointer = i + 1;
        keyArr[i] = key;
    }

    public Key getKey(int i) {
        return this.keys[i];
    }

    public String toString() {
        String str = getClass().getSimpleName() + "|[id:" + this.id + ", name: " + this.name + ", object_info: " + this.objectInfo;
        for (Key key : this.keys) {
            str = str + "\n" + key;
        }
        return str + "]";
    }

    public static class Key {
        public boolean active;
        public final Curve curve;
        public final int id;
        private Object object;
        public final int spin;
        public int time;

        public Key(int i, int i2, int i3, Curve curve2) {
            this.id = i;
            this.time = i2;
            this.spin = i3;
            this.curve = curve2;
        }

        public Key(int i, int i2, int i3) {
            this(i, i2, 1, new Curve());
        }

        public Key(int i, int i2) {
            this(i, i2, 1);
        }

        public Key(int i) {
            this(i, 0);
        }

        public void setObject(Object object2) {
            if (object2 != null) {
                this.object = object2;
                return;
            }
            throw new IllegalArgumentException("object can not be null!");
        }

        public Object object() {
            return this.object;
        }

        public String toString() {
            return getClass().getSimpleName() + "|[id: " + this.id + ", time: " + this.time + ", spin: " + this.spin + "\ncurve: " + this.curve + "\nobject:" + this.object + "]";
        }

        public static class Bone {
            public float angle;
            public final Point pivot;
            public final Point position;
            public final Point scale;

            public Bone(Point point, Point point2, Point point3, float f) {
                this.position = new Point(point);
                this.scale = new Point(point2);
                this.angle = f;
                this.pivot = new Point(point3);
            }

            public Bone(Bone bone) {
                this(bone.position, bone.scale, bone.pivot, bone.angle);
            }

            public Bone(Point point) {
                this(point, new Point(1.0f, 1.0f), new Point(0.0f, 1.0f), 0.0f);
            }

            public Bone() {
                this(new Point());
            }

            public boolean isBone() {
                return !(this instanceof Object);
            }

            public void set(Bone bone) {
                set(bone.position, bone.angle, bone.scale, bone.pivot);
            }

            public void set(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
                this.angle = f3;
                this.position.set(f, f2);
                this.scale.set(f4, f5);
                this.pivot.set(f6, f7);
            }

            public void set(Point point, float f, Point point2, Point point3) {
                set(point.x, point.y, f, point2.x, point2.y, point3.x, point3.y);
            }

            public void unmap(Bone bone) {
                this.angle *= Math.signum(bone.scale.x) * Math.signum(bone.scale.y);
                this.angle += bone.angle;
                this.scale.scale(bone.scale);
                this.position.scale(bone.scale);
                this.position.rotate(bone.angle);
                this.position.translate(bone.position);
            }

            public void map(Bone bone) {
                this.position.translate(-bone.position.x, -bone.position.y);
                this.position.rotate(-bone.angle);
                this.position.scale(1.0f / bone.scale.x, 1.0f / bone.scale.y);
                this.scale.scale(1.0f / bone.scale.x, 1.0f / bone.scale.y);
                this.angle -= bone.angle;
                this.angle *= Math.signum(bone.scale.x) * Math.signum(bone.scale.y);
            }

            public String toString() {
                return getClass().getSimpleName() + "|position: " + this.position + ", scale: " + this.scale + ", angle: " + this.angle;
            }
        }

        public static class Object extends Bone {
            public float alpha;
            public final FileReference ref;

            public Object(Point point, Point point2, Point point3, float f, float f2, FileReference fileReference) {
                super(point, point2, point3, f);
                this.alpha = f2;
                this.ref = fileReference;
            }

            public Object(Point point) {
                this(point, new Point(1.0f, 1.0f), new Point(0.0f, 1.0f), 0.0f, 1.0f, new FileReference(-1, -1));
            }

            public Object(Object object) {
                this(object.position.copy(), object.scale.copy(), object.pivot.copy(), object.angle, object.alpha, object.ref);
            }

            public Object() {
                this(new Point());
            }

            public void set(Object object) {
                set(object.position, object.angle, object.scale, object.pivot, object.alpha, object.ref);
            }

            public void set(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, int i, int i2) {
                super.set(f, f2, f3, f4, f5, f6, f7);
                this.alpha = f8;
                FileReference fileReference = this.ref;
                fileReference.folder = i;
                fileReference.file = i2;
            }

            public void set(Point point, float f, Point point2, Point point3, float f2, FileReference fileReference) {
                set(point.x, point.y, f, point2.x, point2.y, point3.x, point3.y, f2, fileReference.folder, fileReference.file);
            }

            @Override // com.brashmonkey.spriter.Timeline.Key.Bone
            public String toString() {
                return super.toString() + ", pivot: " + this.pivot + ", alpha: " + this.alpha + ", reference: " + this.ref;
            }
        }
    }
}
