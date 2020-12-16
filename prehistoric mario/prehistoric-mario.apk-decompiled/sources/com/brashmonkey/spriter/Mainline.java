package com.brashmonkey.spriter;

public class Mainline {
    private int keyPointer = 0;
    final Key[] keys;

    public Mainline(int i) {
        this.keys = new Key[i];
    }

    public String toString() {
        String str = getClass().getSimpleName() + "|";
        for (Key key : this.keys) {
            str = str + "\n" + key;
        }
        return str + "]";
    }

    public void addKey(Key key) {
        Key[] keyArr = this.keys;
        int i = this.keyPointer;
        this.keyPointer = i + 1;
        keyArr[i] = key;
    }

    public Key getKey(int i) {
        return this.keys[i];
    }

    public Key getKeyBeforeTime(int i) {
        Key[] keyArr = this.keys;
        int i2 = 0;
        Key key = keyArr[0];
        int length = keyArr.length;
        while (i2 < length) {
            Key key2 = keyArr[i2];
            if (key2.time > i) {
                break;
            }
            i2++;
            key = key2;
        }
        return key;
    }

    public static class Key {
        private int bonePointer = 0;
        final BoneRef[] boneRefs;
        public final Curve curve;
        public final int id;
        private int objectPointer = 0;
        final ObjectRef[] objectRefs;
        public final int time;

        public Key(int i, int i2, Curve curve2, int i3, int i4) {
            this.id = i;
            this.time = i2;
            this.curve = curve2;
            this.boneRefs = new BoneRef[i3];
            this.objectRefs = new ObjectRef[i4];
        }

        public void addBoneRef(BoneRef boneRef) {
            BoneRef[] boneRefArr = this.boneRefs;
            int i = this.bonePointer;
            this.bonePointer = i + 1;
            boneRefArr[i] = boneRef;
        }

        public void addObjectRef(ObjectRef objectRef) {
            ObjectRef[] objectRefArr = this.objectRefs;
            int i = this.objectPointer;
            this.objectPointer = i + 1;
            objectRefArr[i] = objectRef;
        }

        public BoneRef getBoneRef(int i) {
            if (i < 0) {
                return null;
            }
            BoneRef[] boneRefArr = this.boneRefs;
            if (i >= boneRefArr.length) {
                return null;
            }
            return boneRefArr[i];
        }

        public ObjectRef getObjectRef(int i) {
            if (i < 0) {
                return null;
            }
            ObjectRef[] objectRefArr = this.objectRefs;
            if (i >= objectRefArr.length) {
                return null;
            }
            return objectRefArr[i];
        }

        public BoneRef getBoneRef(BoneRef boneRef) {
            return getBoneRefTimeline(boneRef.timeline);
        }

        public BoneRef getBoneRefTimeline(int i) {
            BoneRef[] boneRefArr = this.boneRefs;
            for (BoneRef boneRef : boneRefArr) {
                if (boneRef.timeline == i) {
                    return boneRef;
                }
            }
            return null;
        }

        public ObjectRef getObjectRef(ObjectRef objectRef) {
            return getObjectRefTimeline(objectRef.timeline);
        }

        public ObjectRef getObjectRefTimeline(int i) {
            ObjectRef[] objectRefArr = this.objectRefs;
            for (ObjectRef objectRef : objectRefArr) {
                if (objectRef.timeline == i) {
                    return objectRef;
                }
            }
            return null;
        }

        public String toString() {
            String str = getClass().getSimpleName() + "|[id:" + this.id + ", time: " + this.time + ", curve: [" + this.curve + "]";
            for (BoneRef boneRef : this.boneRefs) {
                str = str + "\n" + boneRef;
            }
            for (ObjectRef objectRef : this.objectRefs) {
                str = str + "\n" + objectRef;
            }
            return str + "]";
        }

        public static class BoneRef {
            public final int id;
            public final int key;
            public final BoneRef parent;
            public final int timeline;

            public BoneRef(int i, int i2, int i3, BoneRef boneRef) {
                this.id = i;
                this.timeline = i2;
                this.key = i3;
                this.parent = boneRef;
            }

            public String toString() {
                BoneRef boneRef = this.parent;
                int i = boneRef != null ? boneRef.id : -1;
                return getClass().getSimpleName() + "|id: " + this.id + ", parent:" + i + ", timeline: " + this.timeline + ", key: " + this.key;
            }
        }

        public static class ObjectRef extends BoneRef implements Comparable<ObjectRef> {
            public final int zIndex;

            public ObjectRef(int i, int i2, int i3, BoneRef boneRef, int i4) {
                super(i, i2, i3, boneRef);
                this.zIndex = i4;
            }

            @Override // com.brashmonkey.spriter.Mainline.Key.BoneRef
            public String toString() {
                return super.toString() + ", z_index: " + this.zIndex;
            }

            public int compareTo(ObjectRef objectRef) {
                return (int) Math.signum((float) (this.zIndex - objectRef.zIndex));
            }
        }
    }
}
