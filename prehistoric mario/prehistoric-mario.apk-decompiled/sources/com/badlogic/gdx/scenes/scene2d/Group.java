package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Affine2;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.utils.Cullable;
import com.badlogic.gdx.utils.SnapshotArray;
import java.util.Iterator;

public class Group extends Actor implements Cullable {
    private static final Vector2 tmp = new Vector2();
    final SnapshotArray<Actor> children = new SnapshotArray<>(true, 4, Actor.class);
    private final Matrix4 computedTransform = new Matrix4();
    private Rectangle cullingArea;
    private final Matrix4 oldTransform = new Matrix4();
    boolean transform = true;
    private final Affine2 worldTransform = new Affine2();

    /* access modifiers changed from: protected */
    public void childrenChanged() {
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void act(float f) {
        super.act(f);
        Actor[] begin = this.children.begin();
        int i = this.children.size;
        for (int i2 = 0; i2 < i; i2++) {
            begin[i2].act(f);
        }
        this.children.end();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        if (this.transform) {
            applyTransform(batch, computeTransform());
        }
        drawChildren(batch, f);
        if (this.transform) {
            resetTransform(batch);
        }
    }

    /* access modifiers changed from: protected */
    public void drawChildren(Batch batch, float f) {
        float f2;
        float f3 = this.color.a * f;
        SnapshotArray<Actor> snapshotArray = this.children;
        Actor[] begin = snapshotArray.begin();
        Rectangle rectangle = this.cullingArea;
        int i = 0;
        if (rectangle != null) {
            float f4 = rectangle.x;
            float f5 = rectangle.width + f4;
            float f6 = rectangle.y;
            float f7 = rectangle.height + f6;
            if (this.transform) {
                int i2 = snapshotArray.size;
                while (i < i2) {
                    Actor actor = begin[i];
                    if (actor.isVisible()) {
                        float f8 = actor.x;
                        float f9 = actor.y;
                        if (f8 <= f5 && f9 <= f7 && f8 + actor.width >= f4 && f9 + actor.height >= f6) {
                            actor.draw(batch, f3);
                        }
                    }
                    i++;
                }
            } else {
                float f10 = this.x;
                float f11 = this.y;
                this.x = 0.0f;
                this.y = 0.0f;
                int i3 = snapshotArray.size;
                while (i < i3) {
                    Actor actor2 = begin[i];
                    if (actor2.isVisible()) {
                        float f12 = actor2.x;
                        float f13 = actor2.y;
                        if (f12 <= f5 && f13 <= f7) {
                            f2 = f7;
                            if (actor2.width + f12 >= f4 && actor2.height + f13 >= f6) {
                                actor2.x = f12 + f10;
                                actor2.y = f13 + f11;
                                actor2.draw(batch, f3);
                                actor2.x = f12;
                                actor2.y = f13;
                            }
                            i++;
                            f7 = f2;
                        }
                    }
                    f2 = f7;
                    i++;
                    f7 = f2;
                }
                this.x = f10;
                this.y = f11;
            }
        } else if (this.transform) {
            int i4 = snapshotArray.size;
            while (i < i4) {
                Actor actor3 = begin[i];
                if (actor3.isVisible()) {
                    actor3.draw(batch, f3);
                }
                i++;
            }
        } else {
            float f14 = this.x;
            float f15 = this.y;
            this.x = 0.0f;
            this.y = 0.0f;
            int i5 = snapshotArray.size;
            while (i < i5) {
                Actor actor4 = begin[i];
                if (actor4.isVisible()) {
                    float f16 = actor4.x;
                    float f17 = actor4.y;
                    actor4.x = f16 + f14;
                    actor4.y = f17 + f15;
                    actor4.draw(batch, f3);
                    actor4.x = f16;
                    actor4.y = f17;
                }
                i++;
            }
            this.x = f14;
            this.y = f15;
        }
        snapshotArray.end();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void drawDebug(ShapeRenderer shapeRenderer) {
        drawDebugBounds(shapeRenderer);
        if (this.transform) {
            applyTransform(shapeRenderer, computeTransform());
        }
        drawDebugChildren(shapeRenderer);
        if (this.transform) {
            resetTransform(shapeRenderer);
        }
    }

    /* access modifiers changed from: protected */
    public void drawDebugChildren(ShapeRenderer shapeRenderer) {
        SnapshotArray<Actor> snapshotArray = this.children;
        Actor[] begin = snapshotArray.begin();
        int i = 0;
        if (this.transform) {
            int i2 = snapshotArray.size;
            while (i < i2) {
                Actor actor = begin[i];
                if (actor.isVisible() && (actor.getDebug() || (actor instanceof Group))) {
                    actor.drawDebug(shapeRenderer);
                }
                i++;
            }
            shapeRenderer.flush();
        } else {
            float f = this.x;
            float f2 = this.y;
            this.x = 0.0f;
            this.y = 0.0f;
            int i3 = snapshotArray.size;
            while (i < i3) {
                Actor actor2 = begin[i];
                if (actor2.isVisible() && (actor2.getDebug() || (actor2 instanceof Group))) {
                    float f3 = actor2.x;
                    float f4 = actor2.y;
                    actor2.x = f3 + f;
                    actor2.y = f4 + f2;
                    actor2.drawDebug(shapeRenderer);
                    actor2.x = f3;
                    actor2.y = f4;
                }
                i++;
            }
            this.x = f;
            this.y = f2;
        }
        snapshotArray.end();
    }

    /* access modifiers changed from: protected */
    public Matrix4 computeTransform() {
        Affine2 affine2 = this.worldTransform;
        float f = this.originX;
        float f2 = this.originY;
        affine2.setToTrnRotScl(this.x + f, this.y + f2, this.rotation, this.scaleX, this.scaleY);
        if (!(f == 0.0f && f2 == 0.0f)) {
            affine2.translate(-f, -f2);
        }
        Group group = this.parent;
        while (group != null && !group.transform) {
            group = group.parent;
        }
        if (group != null) {
            affine2.preMul(group.worldTransform);
        }
        this.computedTransform.set(affine2);
        return this.computedTransform;
    }

    /* access modifiers changed from: protected */
    public void applyTransform(Batch batch, Matrix4 matrix4) {
        this.oldTransform.set(batch.getTransformMatrix());
        batch.setTransformMatrix(matrix4);
    }

    /* access modifiers changed from: protected */
    public void resetTransform(Batch batch) {
        batch.setTransformMatrix(this.oldTransform);
    }

    /* access modifiers changed from: protected */
    public void applyTransform(ShapeRenderer shapeRenderer, Matrix4 matrix4) {
        this.oldTransform.set(shapeRenderer.getTransformMatrix());
        shapeRenderer.setTransformMatrix(matrix4);
        shapeRenderer.flush();
    }

    /* access modifiers changed from: protected */
    public void resetTransform(ShapeRenderer shapeRenderer) {
        shapeRenderer.setTransformMatrix(this.oldTransform);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Cullable
    public void setCullingArea(Rectangle rectangle) {
        this.cullingArea = rectangle;
    }

    public Rectangle getCullingArea() {
        return this.cullingArea;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public Actor hit(float f, float f2, boolean z) {
        if ((z && getTouchable() == Touchable.disabled) || !isVisible()) {
            return null;
        }
        Vector2 vector2 = tmp;
        Actor[] actorArr = (Actor[]) this.children.items;
        for (int i = this.children.size - 1; i >= 0; i--) {
            Actor actor = actorArr[i];
            actor.parentToLocalCoordinates(vector2.set(f, f2));
            Actor hit = actor.hit(vector2.x, vector2.y, z);
            if (hit != null) {
                return hit;
            }
        }
        return super.hit(f, f2, z);
    }

    public void addActor(Actor actor) {
        if (actor.parent != null) {
            if (actor.parent != this) {
                actor.parent.removeActor(actor, false);
            } else {
                return;
            }
        }
        this.children.add(actor);
        actor.setParent(this);
        actor.setStage(getStage());
        childrenChanged();
    }

    public void addActorAt(int i, Actor actor) {
        if (actor.parent != null) {
            if (actor.parent != this) {
                actor.parent.removeActor(actor, false);
            } else {
                return;
            }
        }
        if (i >= this.children.size) {
            this.children.add(actor);
        } else {
            this.children.insert(i, actor);
        }
        actor.setParent(this);
        actor.setStage(getStage());
        childrenChanged();
    }

    public void addActorBefore(Actor actor, Actor actor2) {
        if (actor2.parent != null) {
            if (actor2.parent != this) {
                actor2.parent.removeActor(actor2, false);
            } else {
                return;
            }
        }
        this.children.insert(this.children.indexOf(actor, true), actor2);
        actor2.setParent(this);
        actor2.setStage(getStage());
        childrenChanged();
    }

    public void addActorAfter(Actor actor, Actor actor2) {
        if (actor2.parent != null) {
            if (actor2.parent != this) {
                actor2.parent.removeActor(actor2, false);
            } else {
                return;
            }
        }
        int indexOf = this.children.indexOf(actor, true);
        if (indexOf == this.children.size) {
            this.children.add(actor2);
        } else {
            this.children.insert(indexOf + 1, actor2);
        }
        actor2.setParent(this);
        actor2.setStage(getStage());
        childrenChanged();
    }

    public boolean removeActor(Actor actor) {
        return removeActor(actor, true);
    }

    public boolean removeActor(Actor actor, boolean z) {
        Stage stage;
        if (!this.children.removeValue(actor, true)) {
            return false;
        }
        if (z && (stage = getStage()) != null) {
            stage.unfocus(actor);
        }
        actor.setParent(null);
        actor.setStage(null);
        childrenChanged();
        return true;
    }

    public void clearChildren() {
        Actor[] begin = this.children.begin();
        int i = this.children.size;
        for (int i2 = 0; i2 < i; i2++) {
            Actor actor = begin[i2];
            actor.setStage(null);
            actor.setParent(null);
        }
        this.children.end();
        this.children.clear();
        childrenChanged();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void clear() {
        super.clear();
        clearChildren();
    }

    public <T extends Actor> T findActor(String str) {
        T t;
        SnapshotArray<Actor> snapshotArray = this.children;
        int i = snapshotArray.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (str.equals(snapshotArray.get(i2).getName())) {
                return (T) snapshotArray.get(i2);
            }
        }
        int i3 = snapshotArray.size;
        for (int i4 = 0; i4 < i3; i4++) {
            Actor actor = snapshotArray.get(i4);
            if ((actor instanceof Group) && (t = (T) ((Group) actor).findActor(str)) != null) {
                return t;
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setStage(Stage stage) {
        super.setStage(stage);
        Actor[] actorArr = (Actor[]) this.children.items;
        int i = this.children.size;
        for (int i2 = 0; i2 < i; i2++) {
            actorArr[i2].setStage(stage);
        }
    }

    public boolean swapActor(int i, int i2) {
        int i3 = this.children.size;
        if (i < 0 || i >= i3 || i2 < 0 || i2 >= i3) {
            return false;
        }
        this.children.swap(i, i2);
        return true;
    }

    public boolean swapActor(Actor actor, Actor actor2) {
        int indexOf = this.children.indexOf(actor, true);
        int indexOf2 = this.children.indexOf(actor2, true);
        if (indexOf == -1 || indexOf2 == -1) {
            return false;
        }
        this.children.swap(indexOf, indexOf2);
        return true;
    }

    public Actor getChild(int i) {
        return this.children.get(i);
    }

    public SnapshotArray<Actor> getChildren() {
        return this.children;
    }

    public boolean hasChildren() {
        return this.children.size > 0;
    }

    public void setTransform(boolean z) {
        this.transform = z;
    }

    public boolean isTransform() {
        return this.transform;
    }

    public Vector2 localToDescendantCoordinates(Actor actor, Vector2 vector2) {
        Group group = actor.parent;
        if (group != null) {
            if (group != this) {
                localToDescendantCoordinates(group, vector2);
            }
            actor.parentToLocalCoordinates(vector2);
            return vector2;
        }
        throw new IllegalArgumentException("Child is not a descendant: " + actor);
    }

    public void setDebug(boolean z, boolean z2) {
        setDebug(z);
        if (z2) {
            Iterator<Actor> it = this.children.iterator();
            while (it.hasNext()) {
                Actor next = it.next();
                if (next instanceof Group) {
                    ((Group) next).setDebug(z, z2);
                } else {
                    next.setDebug(z);
                }
            }
        }
    }

    public Group debugAll() {
        setDebug(true, true);
        return this;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        toString(sb, 1);
        sb.setLength(sb.length() - 1);
        return sb.toString();
    }

    /* access modifiers changed from: package-private */
    public void toString(StringBuilder sb, int i) {
        sb.append(super.toString());
        sb.append('\n');
        Actor[] begin = this.children.begin();
        int i2 = this.children.size;
        for (int i3 = 0; i3 < i2; i3++) {
            for (int i4 = 0; i4 < i; i4++) {
                sb.append("|  ");
            }
            Actor actor = begin[i3];
            if (actor instanceof Group) {
                ((Group) actor).toString(sb, i + 1);
            } else {
                sb.append(actor);
                sb.append('\n');
            }
        }
        this.children.end();
    }
}
