package com.brashmonkey.spriter;

import com.brashmonkey.spriter.Mainline;
import com.brashmonkey.spriter.Timeline;
import java.util.HashMap;
import java.util.Map;

public abstract class IKResolver {
    protected HashMap<IKObject, Mainline.Key.BoneRef> ikMap = new HashMap<>();
    protected Player player;
    protected float tolerance = 5.0f;

    /* access modifiers changed from: protected */
    public abstract void resolve(float f, float f2, int i, Mainline.Key.BoneRef boneRef);

    public IKResolver(Player player2) {
        setPlayer(player2);
    }

    public void setPlayer(Player player2) {
        if (player2 != null) {
            this.player = player2;
            return;
        }
        throw new SpriterException("player cannot be null!");
    }

    public Player getPlayer() {
        return this.player;
    }

    public void resolve() {
        for (Map.Entry<IKObject, Mainline.Key.BoneRef> entry : this.ikMap.entrySet()) {
            for (int i = 0; i < entry.getKey().iterations; i++) {
                resolve(entry.getKey().x, entry.getKey().y, entry.getKey().chainLength, entry.getValue());
            }
        }
    }

    public void mapIKObject(IKObject iKObject, Mainline.Key.BoneRef boneRef) {
        this.ikMap.put(iKObject, boneRef);
    }

    public void mapIKObject(IKObject iKObject, Timeline.Key.Bone bone) {
        this.ikMap.put(iKObject, this.player.getBoneRef(bone));
    }

    public void unmapIKObject(IKObject iKObject) {
        this.ikMap.remove(iKObject);
    }

    public float getTolerance() {
        return this.tolerance;
    }

    public void setTolerance(float f) {
        this.tolerance = f;
    }
}
