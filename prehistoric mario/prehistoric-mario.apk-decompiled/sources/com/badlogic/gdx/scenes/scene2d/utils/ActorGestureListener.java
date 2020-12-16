package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.input.GestureDetector;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Event;
import com.badlogic.gdx.scenes.scene2d.EventListener;
import com.badlogic.gdx.scenes.scene2d.InputEvent;

public class ActorGestureListener implements EventListener {
    static final Vector2 tmpCoords = new Vector2();
    static final Vector2 tmpCoords2 = new Vector2();
    Actor actor;
    private final GestureDetector detector;
    InputEvent event;
    Actor touchDownTarget;

    public void fling(InputEvent inputEvent, float f, float f2, int i) {
    }

    public boolean longPress(Actor actor2, float f, float f2) {
        return false;
    }

    public void pan(InputEvent inputEvent, float f, float f2, float f3, float f4) {
    }

    public void pinch(InputEvent inputEvent, Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24) {
    }

    public void tap(InputEvent inputEvent, float f, float f2, int i, int i2) {
    }

    public void touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
    }

    public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
    }

    public void zoom(InputEvent inputEvent, float f, float f2) {
    }

    public ActorGestureListener() {
        this(20.0f, 0.4f, 1.1f, 0.15f);
    }

    public ActorGestureListener(float f, float f2, float f3, float f4) {
        this.detector = new GestureDetector(f, f2, f3, f4, new GestureDetector.GestureAdapter() {
            /* class com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener.AnonymousClass1 */
            private final Vector2 initialPointer1 = new Vector2();
            private final Vector2 initialPointer2 = new Vector2();
            private final Vector2 pointer1 = new Vector2();
            private final Vector2 pointer2 = new Vector2();

            @Override // com.badlogic.gdx.input.GestureDetector.GestureListener, com.badlogic.gdx.input.GestureDetector.GestureAdapter
            public boolean tap(float f, float f2, int i, int i2) {
                ActorGestureListener.this.actor.stageToLocalCoordinates(ActorGestureListener.tmpCoords.set(f, f2));
                ActorGestureListener actorGestureListener = ActorGestureListener.this;
                actorGestureListener.tap(actorGestureListener.event, ActorGestureListener.tmpCoords.x, ActorGestureListener.tmpCoords.y, i, i2);
                return true;
            }

            @Override // com.badlogic.gdx.input.GestureDetector.GestureListener, com.badlogic.gdx.input.GestureDetector.GestureAdapter
            public boolean longPress(float f, float f2) {
                ActorGestureListener.this.actor.stageToLocalCoordinates(ActorGestureListener.tmpCoords.set(f, f2));
                ActorGestureListener actorGestureListener = ActorGestureListener.this;
                return actorGestureListener.longPress(actorGestureListener.actor, ActorGestureListener.tmpCoords.x, ActorGestureListener.tmpCoords.y);
            }

            @Override // com.badlogic.gdx.input.GestureDetector.GestureListener, com.badlogic.gdx.input.GestureDetector.GestureAdapter
            public boolean fling(float f, float f2, int i) {
                stageToLocalAmount(ActorGestureListener.tmpCoords.set(f, f2));
                ActorGestureListener actorGestureListener = ActorGestureListener.this;
                actorGestureListener.fling(actorGestureListener.event, ActorGestureListener.tmpCoords.x, ActorGestureListener.tmpCoords.y, i);
                return true;
            }

            @Override // com.badlogic.gdx.input.GestureDetector.GestureListener, com.badlogic.gdx.input.GestureDetector.GestureAdapter
            public boolean pan(float f, float f2, float f3, float f4) {
                stageToLocalAmount(ActorGestureListener.tmpCoords.set(f3, f4));
                float f5 = ActorGestureListener.tmpCoords.x;
                float f6 = ActorGestureListener.tmpCoords.y;
                ActorGestureListener.this.actor.stageToLocalCoordinates(ActorGestureListener.tmpCoords.set(f, f2));
                ActorGestureListener actorGestureListener = ActorGestureListener.this;
                actorGestureListener.pan(actorGestureListener.event, ActorGestureListener.tmpCoords.x, ActorGestureListener.tmpCoords.y, f5, f6);
                return true;
            }

            @Override // com.badlogic.gdx.input.GestureDetector.GestureListener, com.badlogic.gdx.input.GestureDetector.GestureAdapter
            public boolean zoom(float f, float f2) {
                ActorGestureListener actorGestureListener = ActorGestureListener.this;
                actorGestureListener.zoom(actorGestureListener.event, f, f2);
                return true;
            }

            @Override // com.badlogic.gdx.input.GestureDetector.GestureListener, com.badlogic.gdx.input.GestureDetector.GestureAdapter
            public boolean pinch(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24) {
                ActorGestureListener.this.actor.stageToLocalCoordinates(this.initialPointer1.set(vector2));
                ActorGestureListener.this.actor.stageToLocalCoordinates(this.initialPointer2.set(vector22));
                ActorGestureListener.this.actor.stageToLocalCoordinates(this.pointer1.set(vector23));
                ActorGestureListener.this.actor.stageToLocalCoordinates(this.pointer2.set(vector24));
                ActorGestureListener actorGestureListener = ActorGestureListener.this;
                actorGestureListener.pinch(actorGestureListener.event, this.initialPointer1, this.initialPointer2, this.pointer1, this.pointer2);
                return true;
            }

            private void stageToLocalAmount(Vector2 vector2) {
                ActorGestureListener.this.actor.stageToLocalCoordinates(vector2);
                vector2.sub(ActorGestureListener.this.actor.stageToLocalCoordinates(ActorGestureListener.tmpCoords2.set(0.0f, 0.0f)));
            }
        });
    }

    @Override // com.badlogic.gdx.scenes.scene2d.EventListener
    public boolean handle(Event event2) {
        if (!(event2 instanceof InputEvent)) {
            return false;
        }
        InputEvent inputEvent = (InputEvent) event2;
        int i = AnonymousClass2.$SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type[inputEvent.getType().ordinal()];
        if (i == 1) {
            this.actor = inputEvent.getListenerActor();
            this.touchDownTarget = inputEvent.getTarget();
            this.detector.touchDown(inputEvent.getStageX(), inputEvent.getStageY(), inputEvent.getPointer(), inputEvent.getButton());
            this.actor.stageToLocalCoordinates(tmpCoords.set(inputEvent.getStageX(), inputEvent.getStageY()));
            touchDown(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getPointer(), inputEvent.getButton());
            return true;
        } else if (i != 2) {
            if (i != 3) {
                return false;
            }
            this.event = inputEvent;
            this.actor = inputEvent.getListenerActor();
            this.detector.touchDragged(inputEvent.getStageX(), inputEvent.getStageY(), inputEvent.getPointer());
            return true;
        } else if (inputEvent.isTouchFocusCancel()) {
            this.detector.reset();
            return false;
        } else {
            this.event = inputEvent;
            this.actor = inputEvent.getListenerActor();
            this.detector.touchUp(inputEvent.getStageX(), inputEvent.getStageY(), inputEvent.getPointer(), inputEvent.getButton());
            this.actor.stageToLocalCoordinates(tmpCoords.set(inputEvent.getStageX(), inputEvent.getStageY()));
            touchUp(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getPointer(), inputEvent.getButton());
            return true;
        }
    }

    /* renamed from: com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener$2  reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type = new int[InputEvent.Type.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(8:0|1|2|3|4|5|6|8) */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:5:0x001f */
        static {
            /*
                com.badlogic.gdx.scenes.scene2d.InputEvent$Type[] r0 = com.badlogic.gdx.scenes.scene2d.InputEvent.Type.values()
                int r0 = r0.length
                int[] r0 = new int[r0]
                com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener.AnonymousClass2.$SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type = r0
                int[] r0 = com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener.AnonymousClass2.$SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type     // Catch:{ NoSuchFieldError -> 0x0014 }
                com.badlogic.gdx.scenes.scene2d.InputEvent$Type r1 = com.badlogic.gdx.scenes.scene2d.InputEvent.Type.touchDown     // Catch:{ NoSuchFieldError -> 0x0014 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0014 }
                r2 = 1
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0014 }
            L_0x0014:
                int[] r0 = com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener.AnonymousClass2.$SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type     // Catch:{ NoSuchFieldError -> 0x001f }
                com.badlogic.gdx.scenes.scene2d.InputEvent$Type r1 = com.badlogic.gdx.scenes.scene2d.InputEvent.Type.touchUp     // Catch:{ NoSuchFieldError -> 0x001f }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x001f }
                r2 = 2
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x001f }
            L_0x001f:
                int[] r0 = com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener.AnonymousClass2.$SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type     // Catch:{ NoSuchFieldError -> 0x002a }
                com.badlogic.gdx.scenes.scene2d.InputEvent$Type r1 = com.badlogic.gdx.scenes.scene2d.InputEvent.Type.touchDragged     // Catch:{ NoSuchFieldError -> 0x002a }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x002a }
                r2 = 3
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x002a }
            L_0x002a:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.utils.ActorGestureListener.AnonymousClass2.<clinit>():void");
        }
    }

    public GestureDetector getGestureDetector() {
        return this.detector;
    }

    public Actor getTouchDownTarget() {
        return this.touchDownTarget;
    }
}
