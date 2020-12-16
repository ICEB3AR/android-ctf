package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.g3d.ModelInstance;
import com.badlogic.gdx.graphics.g3d.model.Animation;
import com.badlogic.gdx.graphics.g3d.model.Node;
import com.badlogic.gdx.graphics.g3d.model.NodeAnimation;
import com.badlogic.gdx.graphics.g3d.model.NodeKeyframe;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.Pool;
import java.util.Iterator;

public class BaseAnimationController {
    private static final Transform tmpT = new Transform();
    private static final ObjectMap<Node, Transform> transforms = new ObjectMap<>();
    private boolean applying = false;
    public final ModelInstance target;
    private final Pool<Transform> transformPool = new Pool<Transform>() {
        /* class com.badlogic.gdx.graphics.g3d.utils.BaseAnimationController.AnonymousClass1 */

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.utils.Pool
        public Transform newObject() {
            return new Transform();
        }
    };

    public static final class Transform implements Pool.Poolable {
        public final Quaternion rotation = new Quaternion();
        public final Vector3 scale = new Vector3(1.0f, 1.0f, 1.0f);
        public final Vector3 translation = new Vector3();

        public Transform idt() {
            this.translation.set(0.0f, 0.0f, 0.0f);
            this.rotation.idt();
            this.scale.set(1.0f, 1.0f, 1.0f);
            return this;
        }

        public Transform set(Vector3 vector3, Quaternion quaternion, Vector3 vector32) {
            this.translation.set(vector3);
            this.rotation.set(quaternion);
            this.scale.set(vector32);
            return this;
        }

        public Transform set(Transform transform) {
            return set(transform.translation, transform.rotation, transform.scale);
        }

        public Transform lerp(Transform transform, float f) {
            return lerp(transform.translation, transform.rotation, transform.scale, f);
        }

        public Transform lerp(Vector3 vector3, Quaternion quaternion, Vector3 vector32, float f) {
            this.translation.lerp(vector3, f);
            this.rotation.slerp(quaternion, f);
            this.scale.lerp(vector32, f);
            return this;
        }

        public Matrix4 toMatrix4(Matrix4 matrix4) {
            return matrix4.set(this.translation, this.rotation, this.scale);
        }

        @Override // com.badlogic.gdx.utils.Pool.Poolable
        public void reset() {
            idt();
        }

        public String toString() {
            return this.translation.toString() + " - " + this.rotation.toString() + " - " + this.scale.toString();
        }
    }

    public BaseAnimationController(ModelInstance modelInstance) {
        this.target = modelInstance;
    }

    /* access modifiers changed from: protected */
    public void begin() {
        if (!this.applying) {
            this.applying = true;
            return;
        }
        throw new GdxRuntimeException("You must call end() after each call to being()");
    }

    /* access modifiers changed from: protected */
    public void apply(Animation animation, float f, float f2) {
        if (this.applying) {
            applyAnimation(transforms, this.transformPool, f2, animation, f);
            return;
        }
        throw new GdxRuntimeException("You must call begin() before adding an animation");
    }

    /* access modifiers changed from: protected */
    public void end() {
        if (this.applying) {
            ObjectMap.Entries<Node, Transform> it = transforms.entries().iterator();
            while (it.hasNext()) {
                ObjectMap.Entry entry = (ObjectMap.Entry) it.next();
                entry.value.toMatrix4(entry.key.localTransform);
                this.transformPool.free(entry.value);
            }
            transforms.clear();
            this.target.calculateTransforms();
            this.applying = false;
            return;
        }
        throw new GdxRuntimeException("You must call begin() first");
    }

    /* access modifiers changed from: protected */
    public void applyAnimation(Animation animation, float f) {
        if (!this.applying) {
            applyAnimation(null, null, 1.0f, animation, f);
            this.target.calculateTransforms();
            return;
        }
        throw new GdxRuntimeException("Call end() first");
    }

    /* access modifiers changed from: protected */
    public void applyAnimations(Animation animation, float f, Animation animation2, float f2, float f3) {
        if (animation2 == null || f3 == 0.0f) {
            applyAnimation(animation, f);
        } else if (animation == null || f3 == 1.0f) {
            applyAnimation(animation2, f2);
        } else if (!this.applying) {
            begin();
            apply(animation, f, 1.0f);
            apply(animation2, f2, f3);
            end();
        } else {
            throw new GdxRuntimeException("Call end() first");
        }
    }

    static final <T> int getFirstKeyframeIndexAtTime(Array<NodeKeyframe<T>> array, float f) {
        int i = array.size - 1;
        int i2 = 0;
        if (i > 0 && f >= array.get(0).keytime && f <= array.get(i).keytime) {
            while (i2 < i) {
                int i3 = (i2 + i) / 2;
                int i4 = i3 + 1;
                if (f > array.get(i4).keytime) {
                    i2 = i4;
                } else if (f >= array.get(i3).keytime) {
                    return i3;
                } else {
                    i = i3 - 1;
                }
            }
        }
        return i2;
    }

    private static final Vector3 getTranslationAtTime(NodeAnimation nodeAnimation, float f, Vector3 vector3) {
        if (nodeAnimation.translation == null) {
            return vector3.set(nodeAnimation.node.translation);
        }
        if (nodeAnimation.translation.size == 1) {
            return vector3.set((Vector3) nodeAnimation.translation.get(0).value);
        }
        int firstKeyframeIndexAtTime = getFirstKeyframeIndexAtTime(nodeAnimation.translation, f);
        NodeKeyframe<Vector3> nodeKeyframe = nodeAnimation.translation.get(firstKeyframeIndexAtTime);
        vector3.set((Vector3) nodeKeyframe.value);
        int i = firstKeyframeIndexAtTime + 1;
        if (i < nodeAnimation.translation.size) {
            NodeKeyframe<Vector3> nodeKeyframe2 = nodeAnimation.translation.get(i);
            vector3.lerp((Vector3) nodeKeyframe2.value, (f - nodeKeyframe.keytime) / (nodeKeyframe2.keytime - nodeKeyframe.keytime));
        }
        return vector3;
    }

    private static final Quaternion getRotationAtTime(NodeAnimation nodeAnimation, float f, Quaternion quaternion) {
        if (nodeAnimation.rotation == null) {
            return quaternion.set(nodeAnimation.node.rotation);
        }
        if (nodeAnimation.rotation.size == 1) {
            return quaternion.set(nodeAnimation.rotation.get(0).value);
        }
        int firstKeyframeIndexAtTime = getFirstKeyframeIndexAtTime(nodeAnimation.rotation, f);
        NodeKeyframe<Quaternion> nodeKeyframe = nodeAnimation.rotation.get(firstKeyframeIndexAtTime);
        quaternion.set(nodeKeyframe.value);
        int i = firstKeyframeIndexAtTime + 1;
        if (i < nodeAnimation.rotation.size) {
            NodeKeyframe<Quaternion> nodeKeyframe2 = nodeAnimation.rotation.get(i);
            quaternion.slerp(nodeKeyframe2.value, (f - nodeKeyframe.keytime) / (nodeKeyframe2.keytime - nodeKeyframe.keytime));
        }
        return quaternion;
    }

    private static final Vector3 getScalingAtTime(NodeAnimation nodeAnimation, float f, Vector3 vector3) {
        if (nodeAnimation.scaling == null) {
            return vector3.set(nodeAnimation.node.scale);
        }
        if (nodeAnimation.scaling.size == 1) {
            return vector3.set((Vector3) nodeAnimation.scaling.get(0).value);
        }
        int firstKeyframeIndexAtTime = getFirstKeyframeIndexAtTime(nodeAnimation.scaling, f);
        NodeKeyframe<Vector3> nodeKeyframe = nodeAnimation.scaling.get(firstKeyframeIndexAtTime);
        vector3.set((Vector3) nodeKeyframe.value);
        int i = firstKeyframeIndexAtTime + 1;
        if (i < nodeAnimation.scaling.size) {
            NodeKeyframe<Vector3> nodeKeyframe2 = nodeAnimation.scaling.get(i);
            vector3.lerp((Vector3) nodeKeyframe2.value, (f - nodeKeyframe.keytime) / (nodeKeyframe2.keytime - nodeKeyframe.keytime));
        }
        return vector3;
    }

    private static final Transform getNodeAnimationTransform(NodeAnimation nodeAnimation, float f) {
        Transform transform = tmpT;
        getTranslationAtTime(nodeAnimation, f, transform.translation);
        getRotationAtTime(nodeAnimation, f, transform.rotation);
        getScalingAtTime(nodeAnimation, f, transform.scale);
        return transform;
    }

    private static final void applyNodeAnimationDirectly(NodeAnimation nodeAnimation, float f) {
        Node node = nodeAnimation.node;
        node.isAnimated = true;
        getNodeAnimationTransform(nodeAnimation, f).toMatrix4(node.localTransform);
    }

    private static final void applyNodeAnimationBlending(NodeAnimation nodeAnimation, ObjectMap<Node, Transform> objectMap, Pool<Transform> pool, float f, float f2) {
        Node node = nodeAnimation.node;
        node.isAnimated = true;
        Transform nodeAnimationTransform = getNodeAnimationTransform(nodeAnimation, f2);
        Transform transform = objectMap.get(node, null);
        if (transform != null) {
            if (f > 0.999999f) {
                transform.set(nodeAnimationTransform);
            } else {
                transform.lerp(nodeAnimationTransform, f);
            }
        } else if (f > 0.999999f) {
            objectMap.put(node, pool.obtain().set(nodeAnimationTransform));
        } else {
            objectMap.put(node, pool.obtain().set(node.translation, node.rotation, node.scale).lerp(nodeAnimationTransform, f));
        }
    }

    protected static void applyAnimation(ObjectMap<Node, Transform> objectMap, Pool<Transform> pool, float f, Animation animation, float f2) {
        if (objectMap == null) {
            Iterator<NodeAnimation> it = animation.nodeAnimations.iterator();
            while (it.hasNext()) {
                applyNodeAnimationDirectly(it.next(), f2);
            }
            return;
        }
        ObjectMap.Keys<Node> it2 = objectMap.keys().iterator();
        while (it2.hasNext()) {
            ((Node) it2.next()).isAnimated = false;
        }
        Iterator<NodeAnimation> it3 = animation.nodeAnimations.iterator();
        while (it3.hasNext()) {
            applyNodeAnimationBlending(it3.next(), objectMap, pool, f, f2);
        }
        ObjectMap.Entries<Node, Transform> it4 = objectMap.entries().iterator();
        while (it4.hasNext()) {
            ObjectMap.Entry entry = (ObjectMap.Entry) it4.next();
            if (!entry.key.isAnimated) {
                entry.key.isAnimated = true;
                entry.value.lerp(entry.key.translation, entry.key.rotation, entry.key.scale, f);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void removeAnimation(Animation animation) {
        Iterator<NodeAnimation> it = animation.nodeAnimations.iterator();
        while (it.hasNext()) {
            it.next().node.isAnimated = false;
        }
    }
}
