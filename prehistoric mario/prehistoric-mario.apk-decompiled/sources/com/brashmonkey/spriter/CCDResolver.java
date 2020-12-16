package com.brashmonkey.spriter;

import com.brashmonkey.spriter.Mainline;
import com.brashmonkey.spriter.Timeline;

public class CCDResolver extends IKResolver {
    public CCDResolver(Player player) {
        super(player);
    }

    @Override // com.brashmonkey.spriter.IKResolver
    public void resolve(float f, float f2, int i, Mainline.Key.BoneRef boneRef) {
        Timeline.Key.Object object;
        Timeline.Key.Object object2;
        Timeline timeline = this.player.animation.getTimeline(boneRef.timeline);
        Timeline.Key key = this.player.tweenedKeys[boneRef.timeline];
        Timeline.Key key2 = this.player.unmappedTweenedKeys[boneRef.timeline];
        Timeline.Key.Object object3 = key.object();
        Timeline.Key.Object object4 = key2.object();
        float f3 = (timeline.objectInfo != null ? timeline.objectInfo.size.width : 200.0f) * object4.scale.x;
        float cos = object4.position.x + (((float) Math.cos(Math.toRadians((double) object4.angle))) * f3);
        float sin = object4.position.y + (((float) Math.sin(Math.toRadians((double) object4.angle))) * f3);
        if (Calculator.distanceBetween(cos, sin, f, f2) > this.tolerance) {
            object3.angle = Calculator.angleBetween(object4.position.x, object4.position.y, f, f2);
            if (Math.signum(this.player.root.scale.x) == -1.0f) {
                object3.angle += 180.0f;
            }
            Mainline.Key.BoneRef boneRef2 = boneRef.parent;
            if (boneRef2 != null) {
                object2 = this.player.tweenedKeys[boneRef2.timeline].object();
                object = this.player.unmappedTweenedKeys[boneRef2.timeline].object();
                object3.angle -= object.angle;
            } else {
                object2 = null;
                object = null;
            }
            this.player.unmapObjects(null);
            int i2 = 0;
            while (i2 < i && boneRef2 != null && Calculator.distanceBetween(cos, sin, f, f2) > this.tolerance) {
                object2.angle += Calculator.angleDifference(Calculator.angleBetween(object.position.x, object.position.y, f, f2), Calculator.angleBetween(object.position.x, object.position.y, cos, sin));
                boneRef2 = boneRef2.parent;
                if (boneRef2 == null || i2 >= i - 1) {
                    object2 = null;
                } else {
                    Timeline.Key.Object object5 = this.player.tweenedKeys[boneRef2.timeline].object();
                    Timeline.Key.Object object6 = this.player.unmappedTweenedKeys[boneRef2.timeline].object();
                    object5.angle -= object6.angle;
                    object = object6;
                    object2 = object5;
                }
                this.player.unmapObjects(null);
                cos = object4.position.x + (((float) Math.cos(Math.toRadians((double) object4.angle))) * f3);
                i2++;
                sin = object4.position.y + (((float) Math.sin(Math.toRadians((double) object4.angle))) * f3);
            }
        }
    }
}
