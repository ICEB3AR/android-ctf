package com.brashmonkey.spriter;

import com.brashmonkey.spriter.Entity;
import com.brashmonkey.spriter.Timeline;

public class Box {
    public final Point[] points = new Point[4];
    private Rectangle rect;

    public Box() {
        for (int i = 0; i < 4; i++) {
            this.points[i] = new Point(0.0f, 0.0f);
        }
        this.rect = new Rectangle(0.0f, 0.0f, 0.0f, 0.0f);
    }

    public void calcFor(Timeline.Key.Bone bone, Entity.ObjectInfo objectInfo) {
        float f = objectInfo.size.width * bone.scale.x;
        float f2 = objectInfo.size.height * bone.scale.y;
        float f3 = bone.pivot.x * f;
        float f4 = bone.pivot.y * f2;
        float f5 = -f3;
        float f6 = -f4;
        this.points[0].set(f5, f6);
        float f7 = f - f3;
        this.points[1].set(f7, f6);
        float f8 = f2 - f4;
        this.points[2].set(f5, f8);
        this.points[3].set(f7, f8);
        for (int i = 0; i < 4; i++) {
            this.points[i].rotate(bone.angle);
        }
        for (int i2 = 0; i2 < 4; i2++) {
            this.points[i2].translate(bone.position);
        }
    }

    public boolean collides(Timeline.Key.Bone bone, Entity.ObjectInfo objectInfo, float f, float f2) {
        float f3 = objectInfo.size.width * bone.scale.x;
        float f4 = objectInfo.size.height * bone.scale.y;
        float f5 = bone.pivot.x * f3;
        float f6 = bone.pivot.y * f4;
        Point point = new Point(f - bone.position.x, f2 - bone.position.y);
        point.rotate(-bone.angle);
        return point.x >= (-f5) && point.x <= f3 - f5 && point.y >= (-f6) && point.y <= f4 - f6;
    }

    public boolean isInside(Rectangle rectangle) {
        boolean z = false;
        for (Point point : this.points) {
            z |= rectangle.isInside(point);
        }
        return z;
    }

    public Rectangle getBoundingRect() {
        this.rect.set(this.points[0].x, this.points[0].y, this.points[0].x, this.points[0].y);
        this.rect.left = Math.min(Math.min(Math.min(Math.min(this.points[0].x, this.points[1].x), this.points[2].x), this.points[3].x), this.rect.left);
        this.rect.right = Math.max(Math.max(Math.max(Math.max(this.points[0].x, this.points[1].x), this.points[2].x), this.points[3].x), this.rect.right);
        this.rect.top = Math.max(Math.max(Math.max(Math.max(this.points[0].y, this.points[1].y), this.points[2].y), this.points[3].y), this.rect.top);
        this.rect.bottom = Math.min(Math.min(Math.min(Math.min(this.points[0].y, this.points[1].y), this.points[2].y), this.points[3].y), this.rect.bottom);
        return this.rect;
    }
}
