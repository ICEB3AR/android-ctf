package com.brashmonkey.spriter;

import com.brashmonkey.spriter.Mainline;
import com.brashmonkey.spriter.Timeline;

public class TweenedAnimation extends Animation {
    private Animation anim1;
    private Animation anim2;
    Mainline.Key.BoneRef base = null;
    public Animation baseAnimation;
    public final Curve curve;
    public final Entity entity;
    public float spriteThreshold = 0.5f;
    public boolean tweenSprites = false;
    public float weight = 0.5f;

    public TweenedAnimation(Entity entity2) {
        super(new Mainline(0), -1, "__interpolatedAnimation__", 0, true, entity2.getAnimationWithMostTimelines().timelines());
        this.entity = entity2;
        this.curve = new Curve();
        setUpTimelines();
    }

    public Mainline.Key getCurrentKey() {
        return this.currentKey;
    }

    @Override // com.brashmonkey.spriter.Animation
    public void update(int i, Timeline.Key.Bone bone) {
        this.currentKey = (onFirstMainLine() ? this.anim1 : this.anim2).currentKey;
        for (Timeline.Key key : this.unmappedTweenedKeys) {
            key.active = false;
        }
        if (this.base != null) {
            Animation animation = onFirstMainLine() ? this.anim1 : this.anim2;
            Animation animation2 = this.baseAnimation;
            if (animation2 == null) {
                animation2 = onFirstMainLine() ? this.anim1 : this.anim2;
            }
            Mainline.Key.BoneRef[] boneRefArr = this.currentKey.boneRefs;
            for (Mainline.Key.BoneRef boneRef : boneRefArr) {
                Timeline similarTimeline = animation2.getSimilarTimeline(animation.getTimeline(boneRef.timeline));
                if (similarTimeline != null) {
                    Timeline.Key key2 = animation2.tweenedKeys[similarTimeline.id];
                    Timeline.Key key3 = animation2.unmappedTweenedKeys[similarTimeline.id];
                    this.tweenedKeys[boneRef.timeline].active = key2.active;
                    this.tweenedKeys[boneRef.timeline].object().set(key2.object());
                    this.unmappedTweenedKeys[boneRef.timeline].active = key3.active;
                    unmapTimelineObject(boneRef.timeline, false, boneRef.parent != null ? this.unmappedTweenedKeys[boneRef.parent.timeline].object() : bone);
                }
            }
        }
        tweenBoneRefs(this.base, bone);
        for (Mainline.Key.ObjectRef objectRef : this.currentKey.objectRefs) {
            update(objectRef, bone, 0);
        }
    }

    private void tweenBoneRefs(Mainline.Key.BoneRef boneRef, Timeline.Key.Bone bone) {
        int i = boneRef == null ? -1 : boneRef.id - 1;
        int length = this.currentKey.boneRefs.length;
        while (true) {
            i++;
            if (i < length) {
                Mainline.Key.BoneRef boneRef2 = this.currentKey.boneRefs[i];
                if (boneRef == boneRef2 || boneRef2.parent == boneRef) {
                    update(boneRef2, bone, 0);
                }
                if (boneRef == boneRef2.parent) {
                    tweenBoneRefs(boneRef2, bone);
                }
            } else {
                return;
            }
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.brashmonkey.spriter.Animation
    public void update(Mainline.Key.BoneRef boneRef, Timeline.Key.Bone bone, int i) {
        Timeline.Key.Object object;
        Timeline.Key.Object object2;
        boolean z = boneRef instanceof Mainline.Key.ObjectRef;
        Timeline timeline = onFirstMainLine() ? this.anim1.getTimeline(boneRef.timeline) : this.anim1.getSimilarTimeline(this.anim2.getTimeline(boneRef.timeline));
        Timeline similarTimeline = onFirstMainLine() ? this.anim2.getSimilarTimeline(timeline) : this.anim2.getTimeline(boneRef.timeline);
        Timeline timeline2 = super.getTimeline(onFirstMainLine() ? timeline.id : similarTimeline.id);
        Timeline.Key.Object object3 = null;
        Timeline.Key.Object object4 = timeline != null ? this.anim1.tweenedKeys[timeline.id].object() : null;
        Timeline.Key.Object object5 = similarTimeline != null ? this.anim2.tweenedKeys[similarTimeline.id].object() : null;
        if (timeline2 != null) {
            object3 = this.tweenedKeys[timeline2.id].object();
        }
        if (!z || (similarTimeline != null && this.tweenSprites)) {
            object2 = object4;
            object = object5;
        } else {
            object2 = !onFirstMainLine() ? object5 : object4;
            object = object2;
        }
        if (!(object == null || object3 == null || object2 == null)) {
            if (z) {
                tweenObject(object2, object, object3, this.weight, this.curve);
            } else {
                tweenBone(object2, object, object3, this.weight, this.curve);
            }
            this.unmappedTweenedKeys[timeline2.id].active = true;
        }
        if (this.unmappedTweenedKeys[boneRef.timeline].active) {
            unmapTimelineObject(timeline2.id, z, boneRef.parent != null ? this.unmappedTweenedKeys[boneRef.parent.timeline].object() : bone);
        }
    }

    private void tweenBone(Timeline.Key.Bone bone, Timeline.Key.Bone bone2, Timeline.Key.Bone bone3, float f, Curve curve2) {
        bone3.angle = curve2.tweenAngle(bone.angle, bone2.angle, f);
        curve2.tweenPoint(bone.position, bone2.position, f, bone3.position);
        curve2.tweenPoint(bone.scale, bone2.scale, f, bone3.scale);
        curve2.tweenPoint(bone.pivot, bone2.pivot, f, bone3.pivot);
    }

    private void tweenObject(Timeline.Key.Object object, Timeline.Key.Object object2, Timeline.Key.Object object3, float f, Curve curve2) {
        tweenBone(object, object2, object3, f, curve2);
        object3.alpha = curve2.tweenAngle(object.alpha, object2.alpha, f);
        object3.ref.set(object.ref);
    }

    public boolean onFirstMainLine() {
        return this.weight < this.spriteThreshold;
    }

    private void setUpTimelines() {
        Animation animationWithMostTimelines = this.entity.getAnimationWithMostTimelines();
        int timelines = animationWithMostTimelines.timelines();
        for (int i = 0; i < timelines; i++) {
            addTimeline(new Timeline(i, animationWithMostTimelines.getTimeline(i).name, animationWithMostTimelines.getTimeline(i).objectInfo, 1));
        }
        prepare();
    }

    public void setAnimations(Animation animation, Animation animation2) {
        boolean z = (animation instanceof TweenedAnimation) || (animation2 instanceof TweenedAnimation);
        if (animation != this.anim1 || animation2 != this.anim2) {
            if ((!this.entity.containsAnimation(animation) || !this.entity.containsAnimation(animation2)) && !z) {
                throw new SpriterException("Both animations have to be part of the same entity!");
            }
            this.anim1 = animation;
            this.anim2 = animation2;
        }
    }

    public Animation getFirstAnimation() {
        return this.anim1;
    }

    public Animation getSecondAnimation() {
        return this.anim2;
    }
}
