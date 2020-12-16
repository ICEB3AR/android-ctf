package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.Input;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ObjectMap;

public class DragAndDrop {
    static final Vector2 tmpVector = new Vector2();
    int activePointer = -1;
    private int button;
    boolean cancelTouchFocus = true;
    Actor dragActor;
    float dragActorX = 0.0f;
    float dragActorY = 0.0f;
    Source dragSource;
    int dragTime = Input.Keys.F7;
    long dragValidTime;
    boolean isValidTarget;
    boolean keepWithinStage = true;
    Payload payload;
    final ObjectMap<Source, DragListener> sourceListeners = new ObjectMap<>();
    private float tapSquareSize = 8.0f;
    Target target;
    final Array<Target> targets = new Array<>();
    float touchOffsetX;
    float touchOffsetY;

    public void addSource(final Source source) {
        AnonymousClass1 r0 = new DragListener() {
            /* class com.badlogic.gdx.scenes.scene2d.utils.DragAndDrop.AnonymousClass1 */

            @Override // com.badlogic.gdx.scenes.scene2d.utils.DragListener
            public void dragStart(InputEvent inputEvent, float f, float f2, int i) {
                Stage stage;
                if (DragAndDrop.this.activePointer != -1) {
                    inputEvent.stop();
                    return;
                }
                DragAndDrop dragAndDrop = DragAndDrop.this;
                dragAndDrop.activePointer = i;
                dragAndDrop.dragValidTime = System.currentTimeMillis() + ((long) DragAndDrop.this.dragTime);
                DragAndDrop dragAndDrop2 = DragAndDrop.this;
                Source source = source;
                dragAndDrop2.dragSource = source;
                dragAndDrop2.payload = source.dragStart(inputEvent, getTouchDownX(), getTouchDownY(), i);
                inputEvent.stop();
                if (DragAndDrop.this.cancelTouchFocus && DragAndDrop.this.payload != null && (stage = source.getActor().getStage()) != null) {
                    stage.cancelTouchFocusExcept(this, source.getActor());
                }
            }

            /* JADX WARNING: Removed duplicated region for block: B:22:0x008c  */
            /* JADX WARNING: Removed duplicated region for block: B:27:0x00a5  */
            /* JADX WARNING: Removed duplicated region for block: B:30:0x00c1  */
            /* JADX WARNING: Removed duplicated region for block: B:36:0x00d7  */
            /* JADX WARNING: Removed duplicated region for block: B:39:0x00e3 A[RETURN] */
            /* JADX WARNING: Removed duplicated region for block: B:40:0x00e4  */
            @Override // com.badlogic.gdx.scenes.scene2d.utils.DragListener
            /* Code decompiled incorrectly, please refer to instructions dump. */
            public void drag(com.badlogic.gdx.scenes.scene2d.InputEvent r13, float r14, float r15, int r16) {
                /*
                // Method dump skipped, instructions count: 319
                */
                throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.utils.DragAndDrop.AnonymousClass1.drag(com.badlogic.gdx.scenes.scene2d.InputEvent, float, float, int):void");
            }

            @Override // com.badlogic.gdx.scenes.scene2d.utils.DragListener
            public void dragStop(InputEvent inputEvent, float f, float f2, int i) {
                if (i == DragAndDrop.this.activePointer) {
                    DragAndDrop dragAndDrop = DragAndDrop.this;
                    dragAndDrop.activePointer = -1;
                    if (dragAndDrop.payload != null) {
                        if (System.currentTimeMillis() < DragAndDrop.this.dragValidTime) {
                            DragAndDrop.this.isValidTarget = false;
                        }
                        if (DragAndDrop.this.dragActor != null) {
                            DragAndDrop.this.dragActor.remove();
                        }
                        if (DragAndDrop.this.isValidTarget) {
                            DragAndDrop.this.target.actor.stageToLocalCoordinates(DragAndDrop.tmpVector.set(inputEvent.getStageX() + DragAndDrop.this.touchOffsetX, inputEvent.getStageY() + DragAndDrop.this.touchOffsetY));
                            DragAndDrop.this.target.drop(source, DragAndDrop.this.payload, DragAndDrop.tmpVector.x, DragAndDrop.tmpVector.y, i);
                        }
                        source.dragStop(inputEvent, f, f2, i, DragAndDrop.this.payload, DragAndDrop.this.isValidTarget ? DragAndDrop.this.target : null);
                        if (DragAndDrop.this.target != null) {
                            DragAndDrop.this.target.reset(source, DragAndDrop.this.payload);
                        }
                        DragAndDrop dragAndDrop2 = DragAndDrop.this;
                        dragAndDrop2.dragSource = null;
                        dragAndDrop2.payload = null;
                        dragAndDrop2.target = null;
                        dragAndDrop2.isValidTarget = false;
                        dragAndDrop2.dragActor = null;
                    }
                }
            }
        };
        r0.setTapSquareSize(this.tapSquareSize);
        r0.setButton(this.button);
        source.actor.addCaptureListener(r0);
        this.sourceListeners.put(source, r0);
    }

    public void removeSource(Source source) {
        source.actor.removeCaptureListener(this.sourceListeners.remove(source));
    }

    public void addTarget(Target target2) {
        this.targets.add(target2);
    }

    public void removeTarget(Target target2) {
        this.targets.removeValue(target2, true);
    }

    public void clear() {
        this.targets.clear();
        ObjectMap.Entries<Source, DragListener> it = this.sourceListeners.entries().iterator();
        while (it.hasNext()) {
            ObjectMap.Entry entry = (ObjectMap.Entry) it.next();
            entry.key.actor.removeCaptureListener(entry.value);
        }
        this.sourceListeners.clear();
    }

    public void cancelTouchFocusExcept(Source source) {
        Stage stage;
        DragListener dragListener = this.sourceListeners.get(source);
        if (dragListener != null && (stage = source.getActor().getStage()) != null) {
            stage.cancelTouchFocusExcept(dragListener, source.getActor());
        }
    }

    public void setTapSquareSize(float f) {
        this.tapSquareSize = f;
    }

    public void setButton(int i) {
        this.button = i;
    }

    public void setDragActorPosition(float f, float f2) {
        this.dragActorX = f;
        this.dragActorY = f2;
    }

    public void setTouchOffset(float f, float f2) {
        this.touchOffsetX = f;
        this.touchOffsetY = f2;
    }

    public boolean isDragging() {
        return this.payload != null;
    }

    public Actor getDragActor() {
        return this.dragActor;
    }

    public Payload getDragPayload() {
        return this.payload;
    }

    public Source getDragSource() {
        return this.dragSource;
    }

    public void setDragTime(int i) {
        this.dragTime = i;
    }

    public int getDragTime() {
        return this.dragTime;
    }

    public boolean isDragValid() {
        return this.payload != null && System.currentTimeMillis() >= this.dragValidTime;
    }

    public void setCancelTouchFocus(boolean z) {
        this.cancelTouchFocus = z;
    }

    public void setKeepWithinStage(boolean z) {
        this.keepWithinStage = z;
    }

    public static abstract class Source {
        final Actor actor;

        public void drag(InputEvent inputEvent, float f, float f2, int i) {
        }

        public abstract Payload dragStart(InputEvent inputEvent, float f, float f2, int i);

        public void dragStop(InputEvent inputEvent, float f, float f2, int i, Payload payload, Target target) {
        }

        public Source(Actor actor2) {
            if (actor2 != null) {
                this.actor = actor2;
                return;
            }
            throw new IllegalArgumentException("actor cannot be null.");
        }

        public Actor getActor() {
            return this.actor;
        }
    }

    public static abstract class Target {
        final Actor actor;

        public abstract boolean drag(Source source, Payload payload, float f, float f2, int i);

        public abstract void drop(Source source, Payload payload, float f, float f2, int i);

        public void reset(Source source, Payload payload) {
        }

        public Target(Actor actor2) {
            if (actor2 != null) {
                this.actor = actor2;
                Stage stage = actor2.getStage();
                if (stage != null && actor2 == stage.getRoot()) {
                    throw new IllegalArgumentException("The stage root cannot be a drag and drop target.");
                }
                return;
            }
            throw new IllegalArgumentException("actor cannot be null.");
        }

        public Actor getActor() {
            return this.actor;
        }
    }

    public static class Payload {
        Actor dragActor;
        Actor invalidDragActor;
        Object object;
        Actor validDragActor;

        public void setDragActor(Actor actor) {
            this.dragActor = actor;
        }

        public Actor getDragActor() {
            return this.dragActor;
        }

        public void setValidDragActor(Actor actor) {
            this.validDragActor = actor;
        }

        public Actor getValidDragActor() {
            return this.validDragActor;
        }

        public void setInvalidDragActor(Actor actor) {
            this.invalidDragActor = actor;
        }

        public Actor getInvalidDragActor() {
            return this.invalidDragActor;
        }

        public Object getObject() {
            return this.object;
        }

        public void setObject(Object obj) {
            this.object = obj;
        }
    }
}
