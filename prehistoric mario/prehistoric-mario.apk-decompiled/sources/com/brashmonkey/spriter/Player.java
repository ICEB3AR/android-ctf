package com.brashmonkey.spriter;

import com.brashmonkey.spriter.Entity;
import com.brashmonkey.spriter.Mainline;
import com.brashmonkey.spriter.Timeline;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class Player {
    private float angle;
    Animation animation;
    public final List<Attachment> attachments = new ArrayList();
    private BoneIterator boneIterator = new BoneIterator();
    public Entity.CharacterMap[] characterMaps;
    public boolean copyObjects = true;
    private Mainline.Key currentKey;
    private boolean dirty = true;
    protected Entity entity;
    private List<PlayerListener> listeners = new ArrayList();
    private final HashMap<Timeline.Key.Object, Timeline.Key> objToTimeline = new HashMap<>();
    private ObjectIterator objectIterator = new ObjectIterator();
    private final Point pivot = new Point(0.0f, 0.0f);
    private final Point position = new Point(0.0f, 0.0f);
    public final Box prevBBox = new Box();
    private Mainline.Key prevKey;
    private Rectangle rect = new Rectangle(0.0f, 0.0f, 0.0f, 0.0f);
    Timeline.Key.Bone root = new Timeline.Key.Bone(new Point(0.0f, 0.0f));
    public int speed = 15;
    private Timeline.Key[] tempTweenedKeys;
    private Timeline.Key[] tempUnmappedTweenedKeys;
    int time;
    Timeline.Key[] tweenedKeys;
    Timeline.Key[] unmappedTweenedKeys;

    public interface PlayerListener {
        void animationChanged(Animation animation, Animation animation2);

        void animationFinished(Animation animation);

        void mainlineKeyChanged(Mainline.Key key, Mainline.Key key2);

        void postProcess(Player player);

        void preProcess(Player player);
    }

    public Player(Entity entity2) {
        setEntity(entity2);
    }

    public void update() {
        for (PlayerListener playerListener : this.listeners) {
            playerListener.preProcess(this);
        }
        if (this.dirty) {
            updateRoot();
        }
        this.animation.update(this.time, this.root);
        this.currentKey = this.animation.currentKey;
        if (this.prevKey != this.currentKey) {
            for (PlayerListener playerListener2 : this.listeners) {
                playerListener2.mainlineKeyChanged(this.prevKey, this.currentKey);
            }
            this.prevKey = this.currentKey;
        }
        if (this.copyObjects) {
            this.tweenedKeys = this.tempTweenedKeys;
            this.unmappedTweenedKeys = this.tempUnmappedTweenedKeys;
            copyObjects();
        } else {
            this.tweenedKeys = this.animation.tweenedKeys;
            this.unmappedTweenedKeys = this.animation.unmappedTweenedKeys;
        }
        for (Attachment attachment : this.attachments) {
            attachment.update();
        }
        for (PlayerListener playerListener3 : this.listeners) {
            playerListener3.postProcess(this);
        }
        increaseTime();
    }

    private void copyObjects() {
        for (int i = 0; i < this.animation.tweenedKeys.length; i++) {
            this.tweenedKeys[i].active = this.animation.tweenedKeys[i].active;
            this.unmappedTweenedKeys[i].active = this.animation.unmappedTweenedKeys[i].active;
            this.tweenedKeys[i].object().set(this.animation.tweenedKeys[i].object());
            this.unmappedTweenedKeys[i].object().set(this.animation.unmappedTweenedKeys[i].object());
        }
    }

    private void increaseTime() {
        this.time += this.speed;
        if (this.time > this.animation.length) {
            this.time -= this.animation.length;
            for (PlayerListener playerListener : this.listeners) {
                playerListener.animationFinished(this.animation);
            }
        }
        if (this.time < 0) {
            for (PlayerListener playerListener2 : this.listeners) {
                playerListener2.animationFinished(this.animation);
            }
            this.time += this.animation.length;
        }
    }

    private void updateRoot() {
        Timeline.Key.Bone bone = this.root;
        bone.angle = this.angle;
        bone.position.set(this.pivot);
        this.root.position.rotate(this.angle);
        this.root.position.translate(this.position);
        this.dirty = false;
    }

    public Timeline.Key.Bone getBone(int i) {
        return this.unmappedTweenedKeys[getCurrentKey().getBoneRef(i).timeline].object();
    }

    public Timeline.Key.Object getObject(int i) {
        return this.unmappedTweenedKeys[getCurrentKey().getObjectRef(i).timeline].object();
    }

    public int getBoneIndex(String str) {
        Mainline.Key.BoneRef[] boneRefArr = getCurrentKey().boneRefs;
        for (Mainline.Key.BoneRef boneRef : boneRefArr) {
            if (this.animation.getTimeline(boneRef.timeline).name.equals(str)) {
                return boneRef.id;
            }
        }
        return -1;
    }

    public Timeline.Key.Bone getBone(String str) {
        return this.unmappedTweenedKeys[this.animation.getTimeline(str).id].object();
    }

    public Mainline.Key.BoneRef getBoneRef(Timeline.Key.Bone bone) {
        return getCurrentKey().getBoneRefTimeline(this.objToTimeline.get(bone).id);
    }

    public int getObjectIndex(String str) {
        Mainline.Key.ObjectRef[] objectRefArr = getCurrentKey().objectRefs;
        for (Mainline.Key.ObjectRef objectRef : objectRefArr) {
            if (this.animation.getTimeline(objectRef.timeline).name.equals(str)) {
                return objectRef.id;
            }
        }
        return -1;
    }

    public Timeline.Key.Object getObject(String str) {
        return this.unmappedTweenedKeys[this.animation.getTimeline(str).id].object();
    }

    public Mainline.Key.ObjectRef getObjectRef(Timeline.Key.Object object) {
        return getCurrentKey().getObjectRefTimeline(this.objToTimeline.get(object).id);
    }

    public String getNameFor(Timeline.Key.Bone bone) {
        return this.animation.getTimeline(this.objToTimeline.get(bone).id).name;
    }

    public Entity.ObjectInfo getObjectInfoFor(Timeline.Key.Bone bone) {
        return this.animation.getTimeline(this.objToTimeline.get(bone).id).objectInfo;
    }

    public Timeline.Key getKeyFor(Timeline.Key.Bone bone) {
        return this.objToTimeline.get(bone);
    }

    public Box getBox(Timeline.Key.Bone bone) {
        this.prevBBox.calcFor(bone, getObjectInfoFor(bone));
        return this.prevBBox;
    }

    public boolean collidesFor(Timeline.Key.Bone bone, float f, float f2) {
        Entity.ObjectInfo objectInfoFor = getObjectInfoFor(bone);
        this.prevBBox.calcFor(bone, objectInfoFor);
        return this.prevBBox.collides(bone, objectInfoFor, f, f2);
    }

    public boolean collidesFor(Timeline.Key.Bone bone, Point point) {
        return collidesFor(bone, point.x, point.y);
    }

    public boolean collidesFor(Timeline.Key.Bone bone, Rectangle rectangle) {
        this.prevBBox.calcFor(bone, getObjectInfoFor(bone));
        return this.prevBBox.isInside(rectangle);
    }

    public void setBone(String str, float f, float f2, float f3, float f4, float f5) {
        int boneIndex = getBoneIndex(str);
        if (boneIndex != -1) {
            Mainline.Key.BoneRef boneRef = getCurrentKey().getBoneRef(boneIndex);
            getBone(boneIndex).set(f, f2, f3, f4, f5, 0.0f, 0.0f);
            unmapObjects(boneRef);
            return;
        }
        throw new SpriterException("No bone found of name \"" + str + "\"");
    }

    public void setBone(String str, Point point, float f, Point point2) {
        setBone(str, point.x, point.y, f, point2.x, point2.y);
    }

    public void setBone(String str, float f, float f2, float f3) {
        Timeline.Key.Bone bone = getBone(str);
        setBone(str, f, f2, f3, bone.scale.x, bone.scale.y);
    }

    public void setBone(String str, Point point, float f) {
        Timeline.Key.Bone bone = getBone(str);
        setBone(str, point.x, point.y, f, bone.scale.x, bone.scale.y);
    }

    public void setBone(String str, float f, float f2) {
        setBone(str, f, f2, getBone(str).angle);
    }

    public void setBone(String str, Point point) {
        setBone(str, point.x, point.y);
    }

    public void setBone(String str, float f) {
        Timeline.Key.Bone bone = getBone(str);
        setBone(str, bone.position.x, bone.position.y, f);
    }

    public void setBone(String str, Timeline.Key.Bone bone) {
        setBone(str, bone.position, bone.angle, bone.scale);
    }

    public void setObject(String str, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, int i, int i2) {
        int objectIndex = getObjectIndex(str);
        if (objectIndex != -1) {
            Mainline.Key.ObjectRef objectRef = getCurrentKey().getObjectRef(objectIndex);
            getObject(objectIndex).set(f, f2, f3, f4, f5, f6, f7, f8, i, i2);
            unmapObjects(objectRef);
            return;
        }
        throw new SpriterException("No object found for name \"" + str + "\"");
    }

    public void setObject(String str, Point point, float f, Point point2, Point point3, float f2, FileReference fileReference) {
        setObject(str, point.x, point.y, f, point2.x, point2.y, point3.x, point3.y, f2, fileReference.folder, fileReference.file);
    }

    public void setObject(String str, float f, float f2, float f3, float f4, float f5) {
        Timeline.Key.Object object = getObject(str);
        setObject(str, f, f2, f3, f4, f5, object.pivot.x, object.pivot.y, object.alpha, object.ref.folder, object.ref.file);
    }

    public void setObject(String str, float f, float f2, float f3) {
        Timeline.Key.Object object = getObject(str);
        setObject(str, f, f2, f3, object.scale.x, object.scale.y);
    }

    public void setObject(String str, Point point, float f) {
        Timeline.Key.Object object = getObject(str);
        setObject(str, point.x, point.y, f, object.scale.x, object.scale.y);
    }

    public void setObject(String str, float f, float f2) {
        setObject(str, f, f2, getObject(str).angle);
    }

    public void setObject(String str, Point point) {
        setObject(str, point.x, point.y);
    }

    public void setObject(String str, float f) {
        Timeline.Key.Object object = getObject(str);
        setObject(str, object.position.x, object.position.y, f);
    }

    public void setObject(String str, float f, int i, int i2) {
        Timeline.Key.Object object = getObject(str);
        setObject(str, object.position.x, object.position.y, object.angle, object.scale.x, object.scale.y, object.pivot.x, object.pivot.y, f, i, i2);
    }

    public void setObject(String str, Timeline.Key.Object object) {
        setObject(str, object.position, object.angle, object.scale, object.pivot, object.alpha, object.ref);
    }

    public void unmapObjects(Mainline.Key.BoneRef boneRef) {
        int i = boneRef == null ? -1 : boneRef.id - 1;
        while (true) {
            i++;
            if (i >= getCurrentKey().boneRefs.length) {
                break;
            }
            Mainline.Key.BoneRef boneRef2 = getCurrentKey().getBoneRef(i);
            if (boneRef2.parent == boneRef || boneRef == null) {
                Timeline.Key.Bone object = boneRef2.parent == null ? this.root : this.unmappedTweenedKeys[boneRef2.parent.timeline].object();
                this.unmappedTweenedKeys[boneRef2.timeline].object().set(this.tweenedKeys[boneRef2.timeline].object());
                this.unmappedTweenedKeys[boneRef2.timeline].object().unmap(object);
                unmapObjects(boneRef2);
            }
        }
        Mainline.Key.ObjectRef[] objectRefArr = getCurrentKey().objectRefs;
        for (Mainline.Key.ObjectRef objectRef : objectRefArr) {
            if (objectRef.parent == boneRef || boneRef == null) {
                Timeline.Key.Bone object2 = objectRef.parent == null ? this.root : this.unmappedTweenedKeys[objectRef.parent.timeline].object();
                this.unmappedTweenedKeys[objectRef.timeline].object().set(this.tweenedKeys[objectRef.timeline].object());
                this.unmappedTweenedKeys[objectRef.timeline].object().unmap(object2);
            }
        }
    }

    public void setEntity(Entity entity2) {
        if (entity2 != null) {
            this.entity = entity2;
            int timelines = entity2.getAnimationWithMostTimelines().timelines();
            this.tweenedKeys = new Timeline.Key[timelines];
            this.unmappedTweenedKeys = new Timeline.Key[timelines];
            for (int i = 0; i < timelines; i++) {
                Timeline.Key key = new Timeline.Key(i);
                Timeline.Key key2 = new Timeline.Key(i);
                key.setObject(new Timeline.Key.Object(new Point(0.0f, 0.0f)));
                key2.setObject(new Timeline.Key.Object(new Point(0.0f, 0.0f)));
                this.tweenedKeys[i] = key;
                this.unmappedTweenedKeys[i] = key2;
                this.objToTimeline.put(key2.object(), key2);
            }
            this.tempTweenedKeys = this.tweenedKeys;
            this.tempUnmappedTweenedKeys = this.unmappedTweenedKeys;
            setAnimation(entity2.getAnimation(0));
            return;
        }
        throw new SpriterException("entity can not be null!");
    }

    public Entity getEntity() {
        return this.entity;
    }

    public void setAnimation(Animation animation2) {
        Animation animation3 = this.animation;
        if (animation2 != animation3) {
            if (animation2 == null) {
                throw new SpriterException("animation can not be null!");
            } else if (this.entity.containsAnimation(animation2) || animation2.id == -1) {
                if (animation2 != this.animation) {
                    this.time = 0;
                }
                this.animation = animation2;
                int i = this.time;
                this.time = 0;
                update();
                this.time = i;
                for (PlayerListener playerListener : this.listeners) {
                    playerListener.animationChanged(animation3, animation2);
                }
            } else {
                throw new SpriterException("animation has to be in the same entity as the current set one!");
            }
        }
    }

    public void setAnimation(String str) {
        setAnimation(this.entity.getAnimation(str));
    }

    public void setAnimation(int i) {
        setAnimation(this.entity.getAnimation(i));
    }

    public Animation getAnimation() {
        return this.animation;
    }

    public Rectangle getBoundingRectangle(Mainline.Key.BoneRef boneRef) {
        Timeline.Key.Bone object = boneRef == null ? this.root : this.unmappedTweenedKeys[boneRef.timeline].object();
        this.rect.set(object.position.x, object.position.y, object.position.x, object.position.y);
        calcBoundingRectangle(boneRef);
        this.rect.calculateSize();
        return this.rect;
    }

    public Rectangle getBoudingRectangle(Timeline.Key.Bone bone) {
        return getBoundingRectangle(bone == null ? null : getBoneRef(bone));
    }

    private void calcBoundingRectangle(Mainline.Key.BoneRef boneRef) {
        Mainline.Key.BoneRef[] boneRefArr = getCurrentKey().boneRefs;
        for (Mainline.Key.BoneRef boneRef2 : boneRefArr) {
            if (boneRef2.parent == boneRef || boneRef == null) {
                this.prevBBox.calcFor(this.unmappedTweenedKeys[boneRef2.timeline].object(), this.animation.getTimeline(boneRef2.timeline).objectInfo);
                Rectangle.setBiggerRectangle(this.rect, this.prevBBox.getBoundingRect(), this.rect);
                calcBoundingRectangle(boneRef2);
            }
        }
        Mainline.Key.ObjectRef[] objectRefArr = getCurrentKey().objectRefs;
        for (Mainline.Key.ObjectRef objectRef : objectRefArr) {
            if (objectRef.parent == boneRef) {
                this.prevBBox.calcFor(this.unmappedTweenedKeys[objectRef.timeline].object(), this.animation.getTimeline(objectRef.timeline).objectInfo);
                Rectangle.setBiggerRectangle(this.rect, this.prevBBox.getBoundingRect(), this.rect);
            }
        }
    }

    public Mainline.Key getCurrentKey() {
        return this.currentKey;
    }

    public int getTime() {
        return this.time;
    }

    public Player setTime(int i) {
        this.time = i;
        int i2 = this.speed;
        this.speed = 0;
        increaseTime();
        this.speed = i2;
        return this;
    }

    public Player setScale(float f) {
        this.root.scale.set(((float) flippedX()) * f, f * ((float) flippedY()));
        return this;
    }

    public Player scale(float f) {
        this.root.scale.scale(f, f);
        return this;
    }

    public float getScale() {
        return this.root.scale.x;
    }

    public Player flip(boolean z, boolean z2) {
        if (z) {
            flipX();
        }
        if (z2) {
            flipY();
        }
        return this;
    }

    public Player flipX() {
        this.root.scale.x *= -1.0f;
        return this;
    }

    public Player flipY() {
        this.root.scale.y *= -1.0f;
        return this;
    }

    public int flippedX() {
        return (int) Math.signum(this.root.scale.x);
    }

    public int flippedY() {
        return (int) Math.signum(this.root.scale.y);
    }

    public Player setPosition(float f, float f2) {
        this.dirty = true;
        this.position.set(f, f2);
        return this;
    }

    public Player setPosition(Point point) {
        return setPosition(point.x, point.y);
    }

    public Player translatePosition(float f, float f2) {
        return setPosition(this.position.x + f, this.position.y + f2);
    }

    public Player translate(Point point) {
        return translatePosition(point.x, point.y);
    }

    public float getX() {
        return this.position.x;
    }

    public float getY() {
        return this.position.y;
    }

    public Player setAngle(float f) {
        this.dirty = true;
        this.angle = f;
        return this;
    }

    public Player rotate(float f) {
        return setAngle(f + this.angle);
    }

    public float getAngle() {
        return this.angle;
    }

    public Player setPivot(float f, float f2) {
        this.dirty = true;
        this.pivot.set(f, f2);
        return this;
    }

    public Player setPivot(Point point) {
        return setPivot(point.x, point.y);
    }

    public Player translatePivot(float f, float f2) {
        return setPivot(this.pivot.x + f, this.pivot.y + f2);
    }

    public Player translatePivot(Point point) {
        return translatePivot(point.x, point.y);
    }

    public float getPivotX() {
        return this.pivot.x;
    }

    public float getPivotY() {
        return this.pivot.y;
    }

    public void addListener(PlayerListener playerListener) {
        this.listeners.add(playerListener);
    }

    public void removeListener(PlayerListener playerListener) {
        this.listeners.remove(playerListener);
    }

    public Iterator<Timeline.Key.Bone> boneIterator() {
        return boneIterator(getCurrentKey().boneRefs[0]);
    }

    public Iterator<Timeline.Key.Bone> boneIterator(Mainline.Key.BoneRef boneRef) {
        this.boneIterator.index = boneRef.id;
        return this.boneIterator;
    }

    public Iterator<Timeline.Key.Object> objectIterator() {
        return objectIterator(getCurrentKey().objectRefs[0]);
    }

    public Iterator<Timeline.Key.Object> objectIterator(Mainline.Key.ObjectRef objectRef) {
        this.objectIterator.index = objectRef.id;
        return this.objectIterator;
    }

    /* access modifiers changed from: package-private */
    public class ObjectIterator implements Iterator<Timeline.Key.Object> {
        int index = 0;

        ObjectIterator() {
        }

        public boolean hasNext() {
            return this.index < Player.this.getCurrentKey().objectRefs.length;
        }

        @Override // java.util.Iterator
        public Timeline.Key.Object next() {
            Timeline.Key[] keyArr = Player.this.unmappedTweenedKeys;
            Mainline.Key.ObjectRef[] objectRefArr = Player.this.getCurrentKey().objectRefs;
            int i = this.index;
            this.index = i + 1;
            return keyArr[objectRefArr[i].timeline].object();
        }

        public void remove() {
            throw new SpriterException("remove() is not supported by this iterator!");
        }
    }

    /* access modifiers changed from: package-private */
    public class BoneIterator implements Iterator<Timeline.Key.Bone> {
        int index = 0;

        BoneIterator() {
        }

        public boolean hasNext() {
            return this.index < Player.this.getCurrentKey().boneRefs.length;
        }

        @Override // java.util.Iterator
        public Timeline.Key.Bone next() {
            Timeline.Key[] keyArr = Player.this.unmappedTweenedKeys;
            Mainline.Key.BoneRef[] boneRefArr = Player.this.getCurrentKey().boneRefs;
            int i = this.index;
            this.index = i + 1;
            return keyArr[boneRefArr[i].timeline].object();
        }

        public void remove() {
            throw new SpriterException("remove() is not supported by this iterator!");
        }
    }

    public static abstract class Attachment extends Timeline.Key.Bone {
        private float angleTemp;
        private Timeline.Key.Bone parent;
        private final Point positionTemp = new Point();
        private final Point scaleTemp = new Point();

        /* access modifiers changed from: protected */
        public abstract void setAngle(float f);

        /* access modifiers changed from: protected */
        public abstract void setPosition(float f, float f2);

        /* access modifiers changed from: protected */
        public abstract void setScale(float f, float f2);

        public Attachment(Timeline.Key.Bone bone) {
            setParent(bone);
        }

        public void setParent(Timeline.Key.Bone bone) {
            if (bone != null) {
                this.parent = bone;
                return;
            }
            throw new SpriterException("The parent cannot be null!");
        }

        public Timeline.Key.Bone getParent() {
            return this.parent;
        }

        /* access modifiers changed from: package-private */
        public final void update() {
            this.positionTemp.set(this.position);
            this.scaleTemp.set(this.scale);
            this.angleTemp = this.angle;
            super.unmap(this.parent);
            setPosition(this.position.x, this.position.y);
            setScale(this.scale.x, this.scale.y);
            setAngle(this.angle);
            this.position.set(this.positionTemp);
            this.scale.set(this.scaleTemp);
            this.angle = this.angleTemp;
        }
    }
}
