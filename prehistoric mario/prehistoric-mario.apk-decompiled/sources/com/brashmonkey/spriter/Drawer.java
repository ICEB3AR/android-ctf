package com.brashmonkey.spriter;

import com.brashmonkey.spriter.Entity;
import com.brashmonkey.spriter.Timeline;
import java.util.Iterator;

public abstract class Drawer<R> {
    protected Loader<R> loader;
    public float pointRadius = 5.0f;

    public abstract void circle(float f, float f2, float f3);

    public abstract void draw(Timeline.Key.Object object);

    public abstract void line(float f, float f2, float f3, float f4);

    public abstract void rectangle(float f, float f2, float f3, float f4);

    public abstract void setColor(float f, float f2, float f3, float f4);

    public Drawer(Loader<R> loader2) {
        this.loader = loader2;
    }

    public void setLoader(Loader<R> loader2) {
        if (loader2 != null) {
            this.loader = loader2;
            return;
        }
        throw new SpriterException("The loader instance can not be null!");
    }

    public void drawBones(Player player) {
        setColor(1.0f, 0.0f, 0.0f, 1.0f);
        Iterator<Timeline.Key.Bone> boneIterator = player.boneIterator();
        while (boneIterator.hasNext()) {
            Timeline.Key.Bone next = boneIterator.next();
            if (player.getKeyFor(next).active) {
                drawBone(next, player.getObjectInfoFor(next).size);
            }
        }
    }

    public void drawBone(Timeline.Key.Bone bone, Dimension dimension) {
        float f = dimension.height / 2.0f;
        float cos = bone.position.x + (((float) Math.cos(Math.toRadians((double) bone.angle))) * dimension.height);
        float sin = bone.position.y + (((float) Math.sin(Math.toRadians((double) bone.angle))) * dimension.height);
        float cos2 = ((float) Math.cos(Math.toRadians((double) (bone.angle + 90.0f)))) * f * bone.scale.y;
        float sin2 = ((float) Math.sin(Math.toRadians((double) (bone.angle + 90.0f)))) * f * bone.scale.y;
        float cos3 = bone.position.x + (((float) Math.cos(Math.toRadians((double) bone.angle))) * dimension.width * bone.scale.x);
        float sin3 = bone.position.y + (((float) Math.sin(Math.toRadians((double) bone.angle))) * dimension.width * bone.scale.x);
        float f2 = cos + cos2;
        float f3 = sin + sin2;
        line(bone.position.x, bone.position.y, f2, f3);
        line(f2, f3, cos3, sin3);
        float f4 = cos - cos2;
        float f5 = sin - sin2;
        line(bone.position.x, bone.position.y, f4, f5);
        line(f4, f5, cos3, sin3);
        line(bone.position.x, bone.position.y, cos3, sin3);
    }

    public void drawBoxes(Player player) {
        setColor(0.0f, 1.0f, 0.0f, 1.0f);
        drawBoneBoxes(player);
        drawObjectBoxes(player);
        drawPoints(player);
    }

    public void drawBoneBoxes(Player player) {
        drawBoneBoxes(player, player.boneIterator());
    }

    public void drawBoneBoxes(Player player, Iterator<Timeline.Key.Bone> it) {
        while (it.hasNext()) {
            drawBox(player.getBox(it.next()));
        }
    }

    public void drawObjectBoxes(Player player) {
        drawObjectBoxes(player, player.objectIterator());
    }

    public void drawObjectBoxes(Player player, Iterator<Timeline.Key.Object> it) {
        while (it.hasNext()) {
            drawBox(player.getBox(it.next()));
        }
    }

    public void drawPoints(Player player) {
        drawPoints(player, player.objectIterator());
    }

    public void drawPoints(Player player, Iterator<Timeline.Key.Object> it) {
        while (it.hasNext()) {
            Timeline.Key.Object next = it.next();
            if (player.getObjectInfoFor(next).type == Entity.ObjectType.Point) {
                float f = next.position.x;
                double cos = Math.cos(Math.toRadians((double) next.angle));
                double d = (double) this.pointRadius;
                Double.isNaN(d);
                float f2 = f + ((float) (cos * d));
                float f3 = next.position.y;
                double sin = Math.sin(Math.toRadians((double) next.angle));
                double d2 = (double) this.pointRadius;
                Double.isNaN(d2);
                circle(next.position.x, next.position.y, this.pointRadius);
                line(next.position.x, next.position.y, f2, f3 + ((float) (sin * d2)));
            }
        }
    }

    public void draw(Player player) {
        draw(player, player.characterMaps);
    }

    public void draw(Player player, Entity.CharacterMap[] characterMapArr) {
        draw(player.objectIterator(), characterMapArr);
    }

    public void draw(Iterator<Timeline.Key.Object> it, Entity.CharacterMap[] characterMapArr) {
        while (it.hasNext()) {
            Timeline.Key.Object next = it.next();
            if (next.ref.hasFile()) {
                if (characterMapArr != null) {
                    for (Entity.CharacterMap characterMap : characterMapArr) {
                        if (characterMap != null) {
                            next.ref.set(characterMap.get(next.ref));
                        }
                    }
                }
                draw(next);
            }
        }
    }

    public void drawBox(Box box) {
        line(box.points[0].x, box.points[0].y, box.points[1].x, box.points[1].y);
        line(box.points[1].x, box.points[1].y, box.points[3].x, box.points[3].y);
        line(box.points[3].x, box.points[3].y, box.points[2].x, box.points[2].y);
        line(box.points[2].x, box.points[2].y, box.points[0].x, box.points[0].y);
    }

    public void drawRectangle(Rectangle rectangle) {
        rectangle(rectangle.left, rectangle.bottom, rectangle.size.width, rectangle.size.height);
    }
}
