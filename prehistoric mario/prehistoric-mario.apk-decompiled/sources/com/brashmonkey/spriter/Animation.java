package com.brashmonkey.spriter;

import com.brashmonkey.spriter.Mainline;
import com.brashmonkey.spriter.Timeline;
import java.util.HashMap;

public class Animation {
    Mainline.Key currentKey;
    public final int id;
    public final int length;
    public final boolean looping;
    public final Mainline mainline;
    public final String name;
    private final HashMap<String, Timeline> nameToTimeline;
    private boolean prepared;
    private int timelinePointer = 0;
    private final Timeline[] timelines;
    Timeline.Key[] tweenedKeys;
    Timeline.Key[] unmappedTweenedKeys;

    public Animation(Mainline mainline2, int i, String str, int i2, boolean z, int i3) {
        this.mainline = mainline2;
        this.id = i;
        this.name = str;
        this.length = i2;
        this.looping = z;
        this.timelines = new Timeline[i3];
        this.prepared = false;
        this.nameToTimeline = new HashMap<>();
    }

    public Timeline getTimeline(int i) {
        return this.timelines[i];
    }

    public Timeline getTimeline(String str) {
        return this.nameToTimeline.get(str);
    }

    /* access modifiers changed from: package-private */
    public void addTimeline(Timeline timeline) {
        Timeline[] timelineArr = this.timelines;
        int i = this.timelinePointer;
        this.timelinePointer = i + 1;
        timelineArr[i] = timeline;
        this.nameToTimeline.put(timeline.name, timeline);
    }

    public int timelines() {
        return this.timelines.length;
    }

    public String toString() {
        String str = (((getClass().getSimpleName() + "|[id: " + this.id + ", " + this.name + ", duration: " + this.length + ", is looping: " + this.looping) + "Mainline:\n") + this.mainline) + "Timelines\n";
        for (Timeline timeline : this.timelines) {
            str = str + timeline;
        }
        return str + "]";
    }

    public void update(int i, Timeline.Key.Bone bone) {
        if (!this.prepared) {
            throw new SpriterException("This animation is not ready yet to animate itself. Please call prepare()!");
        } else if (bone != null) {
            this.currentKey = this.mainline.getKeyBeforeTime(i);
            for (Timeline.Key key : this.unmappedTweenedKeys) {
                key.active = false;
            }
            for (Mainline.Key.BoneRef boneRef : this.currentKey.boneRefs) {
                update(boneRef, bone, i);
            }
            for (Mainline.Key.ObjectRef objectRef : this.currentKey.objectRefs) {
                update(objectRef, bone, i);
            }
        } else {
            throw new SpriterException("The root can not be null! Set a root bone to apply this animation relative to the root bone.");
        }
    }

    /* access modifiers changed from: protected */
    public void update(Mainline.Key.BoneRef boneRef, Timeline.Key.Bone bone, int i) {
        float f;
        boolean z = boneRef instanceof Mainline.Key.ObjectRef;
        Timeline timeline = getTimeline(boneRef.timeline);
        Timeline.Key key = timeline.getKey(boneRef.key);
        Timeline.Key key2 = timeline.getKey((boneRef.key + 1) % timeline.keys.length);
        int i2 = key.time;
        int i3 = key2.time;
        if (i3 < i2) {
            if (!this.looping) {
                key2 = key;
            } else {
                i3 = this.length;
            }
        }
        float f2 = (float) (i3 - i2);
        float f3 = ((float) (i - i2)) / f2;
        if (Float.isNaN(f3) || Float.isInfinite(f3)) {
            f3 = 1.0f;
        }
        if (this.currentKey.time > i2) {
            float f4 = ((float) (this.currentKey.time - i2)) / f2;
            if (Float.isNaN(f4) || Float.isInfinite(f4)) {
                f4 = 0.0f;
            }
            float f5 = ((float) (i - this.currentKey.time)) / ((float) (i3 - this.currentKey.time));
            if (Float.isNaN(f5) || Float.isInfinite(f5)) {
                f5 = 1.0f;
            }
            f = this.currentKey.curve.tween(f4, 1.0f, f5);
        } else {
            f = this.currentKey.curve.tween(0.0f, 1.0f, f3);
        }
        Timeline.Key.Object object = key.object();
        Timeline.Key.Object object2 = key2.object();
        Timeline.Key.Object object3 = this.tweenedKeys[boneRef.timeline].object();
        if (z) {
            tweenObject(object, object2, object3, f, key.curve, key.spin);
        } else {
            tweenBone(object, object2, object3, f, key.curve, key.spin);
        }
        this.unmappedTweenedKeys[boneRef.timeline].active = true;
        int i4 = boneRef.timeline;
        if (boneRef.parent != null) {
            bone = this.unmappedTweenedKeys[boneRef.parent.timeline].object();
        }
        unmapTimelineObject(i4, z, bone);
    }

    /* access modifiers changed from: package-private */
    public void unmapTimelineObject(int i, boolean z, Timeline.Key.Bone bone) {
        Timeline.Key.Object object = this.tweenedKeys[i].object();
        Timeline.Key.Object object2 = this.unmappedTweenedKeys[i].object();
        if (z) {
            object2.set(object);
        } else {
            object2.set((Timeline.Key.Bone) object);
        }
        object2.unmap(bone);
    }

    /* access modifiers changed from: protected */
    public void tweenBone(Timeline.Key.Bone bone, Timeline.Key.Bone bone2, Timeline.Key.Bone bone3, float f, Curve curve, int i) {
        bone3.angle = curve.tweenAngle(bone.angle, bone2.angle, f, i);
        curve.tweenPoint(bone.position, bone2.position, f, bone3.position);
        curve.tweenPoint(bone.scale, bone2.scale, f, bone3.scale);
        curve.tweenPoint(bone.pivot, bone2.pivot, f, bone3.pivot);
    }

    /* access modifiers changed from: protected */
    public void tweenObject(Timeline.Key.Object object, Timeline.Key.Object object2, Timeline.Key.Object object3, float f, Curve curve, int i) {
        tweenBone(object, object2, object3, f, curve, i);
        object3.alpha = curve.tweenAngle(object.alpha, object2.alpha, f);
        object3.ref.set(object.ref);
    }

    /* access modifiers changed from: package-private */
    public Timeline getSimilarTimeline(Timeline timeline) {
        Timeline timeline2 = getTimeline(timeline.name);
        return (timeline2 != null || timeline.id >= timelines()) ? timeline2 : getTimeline(timeline.id);
    }

    public void prepare() {
        if (!this.prepared) {
            Timeline[] timelineArr = this.timelines;
            this.tweenedKeys = new Timeline.Key[timelineArr.length];
            this.unmappedTweenedKeys = new Timeline.Key[timelineArr.length];
            int i = 0;
            while (true) {
                Timeline.Key[] keyArr = this.tweenedKeys;
                if (i >= keyArr.length) {
                    break;
                }
                keyArr[i] = new Timeline.Key(i);
                this.unmappedTweenedKeys[i] = new Timeline.Key(i);
                this.tweenedKeys[i].setObject(new Timeline.Key.Object(new Point(0.0f, 0.0f)));
                this.unmappedTweenedKeys[i].setObject(new Timeline.Key.Object(new Point(0.0f, 0.0f)));
                i++;
            }
            if (this.mainline.keys.length > 0) {
                this.currentKey = this.mainline.getKey(0);
            }
            this.prepared = true;
        }
    }
}
