package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputAdapter;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.ui.Table;
import com.badlogic.gdx.scenes.scene2d.utils.FocusListener;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.Scaling;
import com.badlogic.gdx.utils.SnapshotArray;
import com.badlogic.gdx.utils.viewport.ScalingViewport;
import com.badlogic.gdx.utils.viewport.Viewport;

public class Stage extends InputAdapter implements Disposable {
    static boolean debug;
    private boolean actionsRequestRendering;
    private final Batch batch;
    private boolean debugAll;
    private final Color debugColor;
    private boolean debugInvisible;
    private boolean debugParentUnderMouse;
    private ShapeRenderer debugShapes;
    private Table.Debug debugTableUnderMouse;
    private boolean debugUnderMouse;
    private Actor keyboardFocus;
    private Actor mouseOverActor;
    private int mouseScreenX;
    private int mouseScreenY;
    private boolean ownsBatch;
    private final Actor[] pointerOverActors;
    private final int[] pointerScreenX;
    private final int[] pointerScreenY;
    private final boolean[] pointerTouched;
    private Group root;
    private Actor scrollFocus;
    private final Vector2 tempCoords;
    final SnapshotArray<TouchFocus> touchFocuses;
    private Viewport viewport;

    public Stage() {
        this(new ScalingViewport(Scaling.stretch, (float) Gdx.graphics.getWidth(), (float) Gdx.graphics.getHeight(), new OrthographicCamera()), new SpriteBatch());
        this.ownsBatch = true;
    }

    public Stage(Viewport viewport2) {
        this(viewport2, new SpriteBatch());
        this.ownsBatch = true;
    }

    public Stage(Viewport viewport2, Batch batch2) {
        this.tempCoords = new Vector2();
        this.pointerOverActors = new Actor[20];
        this.pointerTouched = new boolean[20];
        this.pointerScreenX = new int[20];
        this.pointerScreenY = new int[20];
        this.touchFocuses = new SnapshotArray<>(true, 4, TouchFocus.class);
        this.actionsRequestRendering = true;
        this.debugTableUnderMouse = Table.Debug.none;
        this.debugColor = new Color(0.0f, 1.0f, 0.0f, 0.85f);
        if (viewport2 == null) {
            throw new IllegalArgumentException("viewport cannot be null.");
        } else if (batch2 != null) {
            this.viewport = viewport2;
            this.batch = batch2;
            this.root = new Group();
            this.root.setStage(this);
            viewport2.update(Gdx.graphics.getWidth(), Gdx.graphics.getHeight(), true);
        } else {
            throw new IllegalArgumentException("batch cannot be null.");
        }
    }

    public void draw() {
        Camera camera = this.viewport.getCamera();
        camera.update();
        if (this.root.isVisible()) {
            Batch batch2 = this.batch;
            batch2.setProjectionMatrix(camera.combined);
            batch2.begin();
            this.root.draw(batch2, 1.0f);
            batch2.end();
            if (debug) {
                drawDebug();
            }
        }
    }

    private void drawDebug() {
        if (this.debugShapes == null) {
            this.debugShapes = new ShapeRenderer();
            this.debugShapes.setAutoShapeType(true);
        }
        if (this.debugUnderMouse || this.debugParentUnderMouse || this.debugTableUnderMouse != Table.Debug.none) {
            screenToStageCoordinates(this.tempCoords.set((float) Gdx.input.getX(), (float) Gdx.input.getY()));
            Actor hit = hit(this.tempCoords.x, this.tempCoords.y, true);
            if (hit != null) {
                if (this.debugParentUnderMouse && hit.parent != null) {
                    hit = hit.parent;
                }
                if (this.debugTableUnderMouse == Table.Debug.none) {
                    hit.setDebug(true);
                } else {
                    while (hit != null && !(hit instanceof Table)) {
                        hit = hit.parent;
                    }
                    if (hit != null) {
                        ((Table) hit).debug(this.debugTableUnderMouse);
                    } else {
                        return;
                    }
                }
                if (this.debugAll && (hit instanceof Group)) {
                    ((Group) hit).debugAll();
                }
                disableDebug(this.root, hit);
            } else {
                return;
            }
        } else if (this.debugAll) {
            this.root.debugAll();
        }
        Gdx.gl.glEnable(GL20.GL_BLEND);
        this.debugShapes.setProjectionMatrix(this.viewport.getCamera().combined);
        this.debugShapes.begin();
        this.root.drawDebug(this.debugShapes);
        this.debugShapes.end();
        Gdx.gl.glDisable(GL20.GL_BLEND);
    }

    private void disableDebug(Actor actor, Actor actor2) {
        if (actor != actor2) {
            actor.setDebug(false);
            if (actor instanceof Group) {
                SnapshotArray<Actor> snapshotArray = ((Group) actor).children;
                int i = snapshotArray.size;
                for (int i2 = 0; i2 < i; i2++) {
                    disableDebug(snapshotArray.get(i2), actor2);
                }
            }
        }
    }

    public void act() {
        act(Math.min(Gdx.graphics.getDeltaTime(), 0.033333335f));
    }

    /* JADX DEBUG: Multi-variable search result rejected for r3v1, resolved type: com.badlogic.gdx.scenes.scene2d.ui.ImageButton */
    /* JADX WARN: Multi-variable type inference failed */
    public void act(float f) {
        int length = this.pointerOverActors.length;
        for (int i = 0; i < length; i++) {
            Actor[] actorArr = this.pointerOverActors;
            Actor actor = actorArr[i];
            if (this.pointerTouched[i]) {
                actorArr[i] = fireEnterAndExit(actor, this.pointerScreenX[i], this.pointerScreenY[i], i);
            } else if (actor != null) {
                actorArr[i] = null;
                screenToStageCoordinates(this.tempCoords.set((float) this.pointerScreenX[i], (float) this.pointerScreenY[i]));
                InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
                inputEvent.setType(InputEvent.Type.exit);
                inputEvent.setStage(this);
                inputEvent.setStageX(this.tempCoords.x);
                inputEvent.setStageY(this.tempCoords.y);
                inputEvent.setRelatedActor(actor);
                inputEvent.setPointer(i);
                actor.fire(inputEvent);
                Pools.free(inputEvent);
            }
        }
        Application.ApplicationType type = Gdx.app.getType();
        if (type == Application.ApplicationType.Desktop || type == Application.ApplicationType.Applet || type == Application.ApplicationType.WebGL) {
            this.mouseOverActor = fireEnterAndExit(this.mouseOverActor, this.mouseScreenX, this.mouseScreenY, -1);
        }
        this.root.act(f);
    }

    private Actor fireEnterAndExit(Actor actor, int i, int i2, int i3) {
        screenToStageCoordinates(this.tempCoords.set((float) i, (float) i2));
        Actor hit = hit(this.tempCoords.x, this.tempCoords.y, true);
        if (hit == actor) {
            return actor;
        }
        if (actor != null) {
            InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
            inputEvent.setStage(this);
            inputEvent.setStageX(this.tempCoords.x);
            inputEvent.setStageY(this.tempCoords.y);
            inputEvent.setPointer(i3);
            inputEvent.setType(InputEvent.Type.exit);
            inputEvent.setRelatedActor(hit);
            actor.fire(inputEvent);
            Pools.free(inputEvent);
        }
        if (hit != null) {
            InputEvent inputEvent2 = (InputEvent) Pools.obtain(InputEvent.class);
            inputEvent2.setStage(this);
            inputEvent2.setStageX(this.tempCoords.x);
            inputEvent2.setStageY(this.tempCoords.y);
            inputEvent2.setPointer(i3);
            inputEvent2.setType(InputEvent.Type.enter);
            inputEvent2.setRelatedActor(actor);
            hit.fire(inputEvent2);
            Pools.free(inputEvent2);
        }
        return hit;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean touchDown(int i, int i2, int i3, int i4) {
        if (!isInsideViewport(i, i2)) {
            return false;
        }
        this.pointerTouched[i3] = true;
        this.pointerScreenX[i3] = i;
        this.pointerScreenY[i3] = i2;
        screenToStageCoordinates(this.tempCoords.set((float) i, (float) i2));
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setType(InputEvent.Type.touchDown);
        inputEvent.setStage(this);
        inputEvent.setStageX(this.tempCoords.x);
        inputEvent.setStageY(this.tempCoords.y);
        inputEvent.setPointer(i3);
        inputEvent.setButton(i4);
        Actor hit = hit(this.tempCoords.x, this.tempCoords.y, true);
        if (hit != null) {
            hit.fire(inputEvent);
        } else if (this.root.getTouchable() == Touchable.enabled) {
            this.root.fire(inputEvent);
        }
        boolean isHandled = inputEvent.isHandled();
        Pools.free(inputEvent);
        return isHandled;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean touchDragged(int i, int i2, int i3) {
        this.pointerScreenX[i3] = i;
        this.pointerScreenY[i3] = i2;
        this.mouseScreenX = i;
        this.mouseScreenY = i2;
        if (this.touchFocuses.size == 0) {
            return false;
        }
        screenToStageCoordinates(this.tempCoords.set((float) i, (float) i2));
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setType(InputEvent.Type.touchDragged);
        inputEvent.setStage(this);
        inputEvent.setStageX(this.tempCoords.x);
        inputEvent.setStageY(this.tempCoords.y);
        inputEvent.setPointer(i3);
        SnapshotArray<TouchFocus> snapshotArray = this.touchFocuses;
        TouchFocus[] begin = snapshotArray.begin();
        int i4 = snapshotArray.size;
        for (int i5 = 0; i5 < i4; i5++) {
            TouchFocus touchFocus = begin[i5];
            if (touchFocus.pointer == i3 && snapshotArray.contains(touchFocus, true)) {
                inputEvent.setTarget(touchFocus.target);
                inputEvent.setListenerActor(touchFocus.listenerActor);
                if (touchFocus.listener.handle(inputEvent)) {
                    inputEvent.handle();
                }
            }
        }
        snapshotArray.end();
        boolean isHandled = inputEvent.isHandled();
        Pools.free(inputEvent);
        return isHandled;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean touchUp(int i, int i2, int i3, int i4) {
        this.pointerTouched[i3] = false;
        this.pointerScreenX[i3] = i;
        this.pointerScreenY[i3] = i2;
        if (this.touchFocuses.size == 0) {
            return false;
        }
        screenToStageCoordinates(this.tempCoords.set((float) i, (float) i2));
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setType(InputEvent.Type.touchUp);
        inputEvent.setStage(this);
        inputEvent.setStageX(this.tempCoords.x);
        inputEvent.setStageY(this.tempCoords.y);
        inputEvent.setPointer(i3);
        inputEvent.setButton(i4);
        SnapshotArray<TouchFocus> snapshotArray = this.touchFocuses;
        TouchFocus[] begin = snapshotArray.begin();
        int i5 = snapshotArray.size;
        for (int i6 = 0; i6 < i5; i6++) {
            TouchFocus touchFocus = begin[i6];
            if (touchFocus.pointer == i3 && touchFocus.button == i4 && snapshotArray.removeValue(touchFocus, true)) {
                inputEvent.setTarget(touchFocus.target);
                inputEvent.setListenerActor(touchFocus.listenerActor);
                if (touchFocus.listener.handle(inputEvent)) {
                    inputEvent.handle();
                }
                Pools.free(touchFocus);
            }
        }
        snapshotArray.end();
        boolean isHandled = inputEvent.isHandled();
        Pools.free(inputEvent);
        return isHandled;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean mouseMoved(int i, int i2) {
        this.mouseScreenX = i;
        this.mouseScreenY = i2;
        if (!isInsideViewport(i, i2)) {
            return false;
        }
        screenToStageCoordinates(this.tempCoords.set((float) i, (float) i2));
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setStage(this);
        inputEvent.setType(InputEvent.Type.mouseMoved);
        inputEvent.setStageX(this.tempCoords.x);
        inputEvent.setStageY(this.tempCoords.y);
        Actor hit = hit(this.tempCoords.x, this.tempCoords.y, true);
        if (hit == null) {
            hit = this.root;
        }
        hit.fire(inputEvent);
        boolean isHandled = inputEvent.isHandled();
        Pools.free(inputEvent);
        return isHandled;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean scrolled(int i) {
        Actor actor = this.scrollFocus;
        if (actor == null) {
            actor = this.root;
        }
        screenToStageCoordinates(this.tempCoords.set((float) this.mouseScreenX, (float) this.mouseScreenY));
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setStage(this);
        inputEvent.setType(InputEvent.Type.scrolled);
        inputEvent.setScrollAmount(i);
        inputEvent.setStageX(this.tempCoords.x);
        inputEvent.setStageY(this.tempCoords.y);
        actor.fire(inputEvent);
        boolean isHandled = inputEvent.isHandled();
        Pools.free(inputEvent);
        return isHandled;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean keyDown(int i) {
        Actor actor = this.keyboardFocus;
        if (actor == null) {
            actor = this.root;
        }
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setStage(this);
        inputEvent.setType(InputEvent.Type.keyDown);
        inputEvent.setKeyCode(i);
        actor.fire(inputEvent);
        boolean isHandled = inputEvent.isHandled();
        Pools.free(inputEvent);
        return isHandled;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean keyUp(int i) {
        Actor actor = this.keyboardFocus;
        if (actor == null) {
            actor = this.root;
        }
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setStage(this);
        inputEvent.setType(InputEvent.Type.keyUp);
        inputEvent.setKeyCode(i);
        actor.fire(inputEvent);
        boolean isHandled = inputEvent.isHandled();
        Pools.free(inputEvent);
        return isHandled;
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean keyTyped(char c) {
        Actor actor = this.keyboardFocus;
        if (actor == null) {
            actor = this.root;
        }
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setStage(this);
        inputEvent.setType(InputEvent.Type.keyTyped);
        inputEvent.setCharacter(c);
        actor.fire(inputEvent);
        boolean isHandled = inputEvent.isHandled();
        Pools.free(inputEvent);
        return isHandled;
    }

    public void addTouchFocus(EventListener eventListener, Actor actor, Actor actor2, int i, int i2) {
        TouchFocus touchFocus = (TouchFocus) Pools.obtain(TouchFocus.class);
        touchFocus.listenerActor = actor;
        touchFocus.target = actor2;
        touchFocus.listener = eventListener;
        touchFocus.pointer = i;
        touchFocus.button = i2;
        this.touchFocuses.add(touchFocus);
    }

    public void removeTouchFocus(EventListener eventListener, Actor actor, Actor actor2, int i, int i2) {
        SnapshotArray<TouchFocus> snapshotArray = this.touchFocuses;
        for (int i3 = snapshotArray.size - 1; i3 >= 0; i3--) {
            TouchFocus touchFocus = snapshotArray.get(i3);
            if (touchFocus.listener == eventListener && touchFocus.listenerActor == actor && touchFocus.target == actor2 && touchFocus.pointer == i && touchFocus.button == i2) {
                snapshotArray.removeIndex(i3);
                Pools.free(touchFocus);
            }
        }
    }

    public void cancelTouchFocus(Actor actor) {
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setStage(this);
        inputEvent.setType(InputEvent.Type.touchUp);
        inputEvent.setStageX(-2.14748365E9f);
        inputEvent.setStageY(-2.14748365E9f);
        SnapshotArray<TouchFocus> snapshotArray = this.touchFocuses;
        TouchFocus[] begin = snapshotArray.begin();
        int i = snapshotArray.size;
        for (int i2 = 0; i2 < i; i2++) {
            TouchFocus touchFocus = begin[i2];
            if (touchFocus.listenerActor == actor && snapshotArray.removeValue(touchFocus, true)) {
                inputEvent.setTarget(touchFocus.target);
                inputEvent.setListenerActor(touchFocus.listenerActor);
                inputEvent.setPointer(touchFocus.pointer);
                inputEvent.setButton(touchFocus.button);
                touchFocus.listener.handle(inputEvent);
            }
        }
        snapshotArray.end();
        Pools.free(inputEvent);
    }

    public void cancelTouchFocus() {
        cancelTouchFocusExcept(null, null);
    }

    public void cancelTouchFocusExcept(EventListener eventListener, Actor actor) {
        InputEvent inputEvent = (InputEvent) Pools.obtain(InputEvent.class);
        inputEvent.setStage(this);
        inputEvent.setType(InputEvent.Type.touchUp);
        inputEvent.setStageX(-2.14748365E9f);
        inputEvent.setStageY(-2.14748365E9f);
        SnapshotArray<TouchFocus> snapshotArray = this.touchFocuses;
        TouchFocus[] begin = snapshotArray.begin();
        int i = snapshotArray.size;
        for (int i2 = 0; i2 < i; i2++) {
            TouchFocus touchFocus = begin[i2];
            if (!(touchFocus.listener == eventListener && touchFocus.listenerActor == actor) && snapshotArray.removeValue(touchFocus, true)) {
                inputEvent.setTarget(touchFocus.target);
                inputEvent.setListenerActor(touchFocus.listenerActor);
                inputEvent.setPointer(touchFocus.pointer);
                inputEvent.setButton(touchFocus.button);
                touchFocus.listener.handle(inputEvent);
            }
        }
        snapshotArray.end();
        Pools.free(inputEvent);
    }

    public void addActor(Actor actor) {
        this.root.addActor(actor);
    }

    public void addAction(Action action) {
        this.root.addAction(action);
    }

    public Array<Actor> getActors() {
        return this.root.children;
    }

    public boolean addListener(EventListener eventListener) {
        return this.root.addListener(eventListener);
    }

    public boolean removeListener(EventListener eventListener) {
        return this.root.removeListener(eventListener);
    }

    public boolean addCaptureListener(EventListener eventListener) {
        return this.root.addCaptureListener(eventListener);
    }

    public boolean removeCaptureListener(EventListener eventListener) {
        return this.root.removeCaptureListener(eventListener);
    }

    public void clear() {
        unfocusAll();
        this.root.clear();
    }

    public void unfocusAll() {
        setScrollFocus(null);
        setKeyboardFocus(null);
        cancelTouchFocus();
    }

    public void unfocus(Actor actor) {
        cancelTouchFocus(actor);
        Actor actor2 = this.scrollFocus;
        if (actor2 != null && actor2.isDescendantOf(actor)) {
            setScrollFocus(null);
        }
        Actor actor3 = this.keyboardFocus;
        if (actor3 != null && actor3.isDescendantOf(actor)) {
            setKeyboardFocus(null);
        }
    }

    public boolean setKeyboardFocus(Actor actor) {
        if (this.keyboardFocus == actor) {
            return true;
        }
        FocusListener.FocusEvent focusEvent = (FocusListener.FocusEvent) Pools.obtain(FocusListener.FocusEvent.class);
        focusEvent.setStage(this);
        focusEvent.setType(FocusListener.FocusEvent.Type.keyboard);
        Actor actor2 = this.keyboardFocus;
        if (actor2 != null) {
            focusEvent.setFocused(false);
            focusEvent.setRelatedActor(actor);
            actor2.fire(focusEvent);
        }
        boolean z = !focusEvent.isCancelled();
        if (z) {
            this.keyboardFocus = actor;
            if (actor != null) {
                focusEvent.setFocused(true);
                focusEvent.setRelatedActor(actor2);
                actor.fire(focusEvent);
                z = !focusEvent.isCancelled();
                if (!z) {
                    this.keyboardFocus = actor2;
                }
            }
        }
        Pools.free(focusEvent);
        return z;
    }

    public Actor getKeyboardFocus() {
        return this.keyboardFocus;
    }

    public boolean setScrollFocus(Actor actor) {
        if (this.scrollFocus == actor) {
            return true;
        }
        FocusListener.FocusEvent focusEvent = (FocusListener.FocusEvent) Pools.obtain(FocusListener.FocusEvent.class);
        focusEvent.setStage(this);
        focusEvent.setType(FocusListener.FocusEvent.Type.scroll);
        Actor actor2 = this.scrollFocus;
        if (actor2 != null) {
            focusEvent.setFocused(false);
            focusEvent.setRelatedActor(actor);
            actor2.fire(focusEvent);
        }
        boolean z = !focusEvent.isCancelled();
        if (z) {
            this.scrollFocus = actor;
            if (actor != null) {
                focusEvent.setFocused(true);
                focusEvent.setRelatedActor(actor2);
                actor.fire(focusEvent);
                z = !focusEvent.isCancelled();
                if (!z) {
                    this.scrollFocus = actor2;
                }
            }
        }
        Pools.free(focusEvent);
        return z;
    }

    public Actor getScrollFocus() {
        return this.scrollFocus;
    }

    public Batch getBatch() {
        return this.batch;
    }

    public Viewport getViewport() {
        return this.viewport;
    }

    public void setViewport(Viewport viewport2) {
        this.viewport = viewport2;
    }

    public float getWidth() {
        return this.viewport.getWorldWidth();
    }

    public float getHeight() {
        return this.viewport.getWorldHeight();
    }

    public Camera getCamera() {
        return this.viewport.getCamera();
    }

    public Group getRoot() {
        return this.root;
    }

    public void setRoot(Group group) {
        if (group.parent != null) {
            group.parent.removeActor(group, false);
        }
        this.root = group;
        group.setParent(null);
        group.setStage(this);
    }

    public Actor hit(float f, float f2, boolean z) {
        this.root.parentToLocalCoordinates(this.tempCoords.set(f, f2));
        return this.root.hit(this.tempCoords.x, this.tempCoords.y, z);
    }

    public Vector2 screenToStageCoordinates(Vector2 vector2) {
        this.viewport.unproject(vector2);
        return vector2;
    }

    public Vector2 stageToScreenCoordinates(Vector2 vector2) {
        this.viewport.project(vector2);
        vector2.y = ((float) this.viewport.getScreenHeight()) - vector2.y;
        return vector2;
    }

    public Vector2 toScreenCoordinates(Vector2 vector2, Matrix4 matrix4) {
        return this.viewport.toScreenCoordinates(vector2, matrix4);
    }

    public void calculateScissors(Rectangle rectangle, Rectangle rectangle2) {
        Matrix4 matrix4;
        ShapeRenderer shapeRenderer = this.debugShapes;
        if (shapeRenderer == null || !shapeRenderer.isDrawing()) {
            matrix4 = this.batch.getTransformMatrix();
        } else {
            matrix4 = this.debugShapes.getTransformMatrix();
        }
        this.viewport.calculateScissors(matrix4, rectangle, rectangle2);
    }

    public void setActionsRequestRendering(boolean z) {
        this.actionsRequestRendering = z;
    }

    public boolean getActionsRequestRendering() {
        return this.actionsRequestRendering;
    }

    public Color getDebugColor() {
        return this.debugColor;
    }

    public void setDebugInvisible(boolean z) {
        this.debugInvisible = z;
    }

    public void setDebugAll(boolean z) {
        if (this.debugAll != z) {
            this.debugAll = z;
            if (z) {
                debug = true;
            } else {
                this.root.setDebug(false, true);
            }
        }
    }

    public boolean isDebugAll() {
        return this.debugAll;
    }

    public void setDebugUnderMouse(boolean z) {
        if (this.debugUnderMouse != z) {
            this.debugUnderMouse = z;
            if (z) {
                debug = true;
            } else {
                this.root.setDebug(false, true);
            }
        }
    }

    public void setDebugParentUnderMouse(boolean z) {
        if (this.debugParentUnderMouse != z) {
            this.debugParentUnderMouse = z;
            if (z) {
                debug = true;
            } else {
                this.root.setDebug(false, true);
            }
        }
    }

    public void setDebugTableUnderMouse(Table.Debug debug2) {
        if (debug2 == null) {
            debug2 = Table.Debug.none;
        }
        if (this.debugTableUnderMouse != debug2) {
            this.debugTableUnderMouse = debug2;
            if (debug2 != Table.Debug.none) {
                debug = true;
            } else {
                this.root.setDebug(false, true);
            }
        }
    }

    public void setDebugTableUnderMouse(boolean z) {
        setDebugTableUnderMouse(z ? Table.Debug.all : Table.Debug.none);
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        clear();
        if (this.ownsBatch) {
            this.batch.dispose();
        }
    }

    /* access modifiers changed from: protected */
    public boolean isInsideViewport(int i, int i2) {
        int screenX = this.viewport.getScreenX();
        int screenWidth = this.viewport.getScreenWidth() + screenX;
        int screenY = this.viewport.getScreenY();
        int screenHeight = this.viewport.getScreenHeight() + screenY;
        int height = (Gdx.graphics.getHeight() - 1) - i2;
        return i >= screenX && i < screenWidth && height >= screenY && height < screenHeight;
    }

    public static final class TouchFocus implements Pool.Poolable {
        int button;
        EventListener listener;
        Actor listenerActor;
        int pointer;
        Actor target;

        @Override // com.badlogic.gdx.utils.Pool.Poolable
        public void reset() {
            this.listenerActor = null;
            this.listener = null;
            this.target = null;
        }
    }
}
