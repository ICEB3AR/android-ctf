package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.utils.ScissorStack;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.DelayedRemovalArray;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.SnapshotArray;
import com.badlogic.gdx.utils.reflect.ClassReflection;

public class Actor {
    private final Array<Action> actions = new Array<>(0);
    private final DelayedRemovalArray<EventListener> captureListeners = new DelayedRemovalArray<>(0);
    final Color color = new Color(1.0f, 1.0f, 1.0f, 1.0f);
    private boolean debug;
    float height;
    private final DelayedRemovalArray<EventListener> listeners = new DelayedRemovalArray<>(0);
    private String name;
    float originX;
    float originY;
    Group parent;
    float rotation;
    float scaleX = 1.0f;
    float scaleY = 1.0f;
    private Stage stage;
    private Touchable touchable = Touchable.enabled;
    private Object userObject;
    private boolean visible = true;
    float width;
    float x;
    float y;

    public void draw(Batch batch, float f) {
    }

    /* access modifiers changed from: protected */
    public void positionChanged() {
    }

    /* access modifiers changed from: protected */
    public void rotationChanged() {
    }

    /* access modifiers changed from: protected */
    public void sizeChanged() {
    }

    public void act(float f) {
        int i;
        Array<Action> array = this.actions;
        if (array.size != 0) {
            Stage stage2 = this.stage;
            if (stage2 != null && stage2.getActionsRequestRendering()) {
                Gdx.graphics.requestRendering();
            }
            int i2 = 0;
            while (i2 < array.size) {
                try {
                    Action action = array.get(i2);
                    if (action.act(f) && i2 < array.size) {
                        if (array.get(i2) == action) {
                            i = i2;
                        } else {
                            i = array.indexOf(action, true);
                        }
                        if (i != -1) {
                            array.removeIndex(i);
                            action.setActor(null);
                            i2--;
                        }
                    }
                    i2++;
                } catch (RuntimeException e) {
                    String actor = toString();
                    throw new RuntimeException("Actor: " + actor.substring(0, Math.min(actor.length(), 128)), e);
                }
            }
        }
    }

    public boolean fire(Event event) {
        boolean isCancelled;
        if (event.getStage() == null) {
            event.setStage(getStage());
        }
        event.setTarget(this);
        Array array = (Array) Pools.obtain(Array.class);
        for (Group group = this.parent; group != null; group = group.parent) {
            array.add(group);
        }
        try {
            T[] tArr = array.items;
            int i = array.size - 1;
            while (true) {
                if (i < 0) {
                    notify(event, true);
                    if (!event.isStopped()) {
                        notify(event, false);
                        if (!event.getBubbles()) {
                            isCancelled = event.isCancelled();
                        } else if (!event.isStopped()) {
                            int i2 = array.size;
                            int i3 = 0;
                            while (true) {
                                if (i3 >= i2) {
                                    isCancelled = event.isCancelled();
                                    break;
                                }
                                tArr[i3].notify(event, false);
                                if (event.isStopped()) {
                                    isCancelled = event.isCancelled();
                                    break;
                                }
                                i3++;
                            }
                        } else {
                            isCancelled = event.isCancelled();
                        }
                    } else {
                        isCancelled = event.isCancelled();
                    }
                } else {
                    tArr[i].notify(event, true);
                    if (event.isStopped()) {
                        isCancelled = event.isCancelled();
                        break;
                    }
                    i--;
                }
            }
            return isCancelled;
        } finally {
            array.clear();
            Pools.free(array);
        }
    }

    public boolean notify(Event event, boolean z) {
        if (event.getTarget() != null) {
            DelayedRemovalArray<EventListener> delayedRemovalArray = z ? this.captureListeners : this.listeners;
            if (delayedRemovalArray.size == 0) {
                return event.isCancelled();
            }
            event.setListenerActor(this);
            event.setCapture(z);
            if (event.getStage() == null) {
                event.setStage(this.stage);
            }
            try {
                delayedRemovalArray.begin();
                int i = delayedRemovalArray.size;
                for (int i2 = 0; i2 < i; i2++) {
                    EventListener eventListener = delayedRemovalArray.get(i2);
                    if (eventListener.handle(event)) {
                        event.handle();
                        if (event instanceof InputEvent) {
                            InputEvent inputEvent = (InputEvent) event;
                            if (inputEvent.getType() == InputEvent.Type.touchDown) {
                                event.getStage().addTouchFocus(eventListener, this, inputEvent.getTarget(), inputEvent.getPointer(), inputEvent.getButton());
                            }
                        }
                    }
                }
                delayedRemovalArray.end();
                return event.isCancelled();
            } catch (RuntimeException e) {
                String actor = toString();
                throw new RuntimeException("Actor: " + actor.substring(0, Math.min(actor.length(), 128)), e);
            }
        } else {
            throw new IllegalArgumentException("The event target cannot be null.");
        }
    }

    public Actor hit(float f, float f2, boolean z) {
        if ((!z || this.touchable == Touchable.enabled) && isVisible() && f >= 0.0f && f < this.width && f2 >= 0.0f && f2 < this.height) {
            return this;
        }
        return null;
    }

    public boolean remove() {
        Group group = this.parent;
        if (group != null) {
            return group.removeActor(this, true);
        }
        return false;
    }

    public boolean addListener(EventListener eventListener) {
        if (eventListener == null) {
            throw new IllegalArgumentException("listener cannot be null.");
        } else if (this.listeners.contains(eventListener, true)) {
            return false;
        } else {
            this.listeners.add(eventListener);
            return true;
        }
    }

    public boolean removeListener(EventListener eventListener) {
        if (eventListener != null) {
            return this.listeners.removeValue(eventListener, true);
        }
        throw new IllegalArgumentException("listener cannot be null.");
    }

    public DelayedRemovalArray<EventListener> getListeners() {
        return this.listeners;
    }

    public boolean addCaptureListener(EventListener eventListener) {
        if (eventListener != null) {
            if (!this.captureListeners.contains(eventListener, true)) {
                this.captureListeners.add(eventListener);
            }
            return true;
        }
        throw new IllegalArgumentException("listener cannot be null.");
    }

    public boolean removeCaptureListener(EventListener eventListener) {
        if (eventListener != null) {
            return this.captureListeners.removeValue(eventListener, true);
        }
        throw new IllegalArgumentException("listener cannot be null.");
    }

    public DelayedRemovalArray<EventListener> getCaptureListeners() {
        return this.captureListeners;
    }

    public void addAction(Action action) {
        action.setActor(this);
        this.actions.add(action);
        Stage stage2 = this.stage;
        if (stage2 != null && stage2.getActionsRequestRendering()) {
            Gdx.graphics.requestRendering();
        }
    }

    public void removeAction(Action action) {
        if (this.actions.removeValue(action, true)) {
            action.setActor(null);
        }
    }

    public Array<Action> getActions() {
        return this.actions;
    }

    public boolean hasActions() {
        return this.actions.size > 0;
    }

    public void clearActions() {
        for (int i = this.actions.size - 1; i >= 0; i--) {
            this.actions.get(i).setActor(null);
        }
        this.actions.clear();
    }

    public void clearListeners() {
        this.listeners.clear();
        this.captureListeners.clear();
    }

    public void clear() {
        clearActions();
        clearListeners();
    }

    public Stage getStage() {
        return this.stage;
    }

    /* access modifiers changed from: protected */
    public void setStage(Stage stage2) {
        this.stage = stage2;
    }

    public boolean isDescendantOf(Actor actor) {
        if (actor != null) {
            Actor actor2 = this;
            while (actor2 != actor) {
                actor2 = actor2.parent;
                if (actor2 == null) {
                    return false;
                }
            }
            return true;
        }
        throw new IllegalArgumentException("actor cannot be null.");
    }

    public boolean isAscendantOf(Actor actor) {
        if (actor != null) {
            while (actor != this) {
                actor = actor.parent;
                if (actor == null) {
                    return false;
                }
            }
            return true;
        }
        throw new IllegalArgumentException("actor cannot be null.");
    }

    public <T extends Actor> T firstAscendant(Class<T> cls) {
        if (cls != null) {
            Group group = (T) this;
            while (!ClassReflection.isInstance(cls, group)) {
                group = group.parent;
                if (group == null) {
                    return null;
                }
            }
            return group;
        }
        throw new IllegalArgumentException("actor cannot be null.");
    }

    public boolean hasParent() {
        return this.parent != null;
    }

    public Group getParent() {
        return this.parent;
    }

    /* access modifiers changed from: protected */
    public void setParent(Group group) {
        this.parent = group;
    }

    public boolean isTouchable() {
        return this.touchable == Touchable.enabled;
    }

    public Touchable getTouchable() {
        return this.touchable;
    }

    public void setTouchable(Touchable touchable2) {
        this.touchable = touchable2;
    }

    public boolean isVisible() {
        return this.visible;
    }

    public void setVisible(boolean z) {
        this.visible = z;
    }

    public boolean ancestorsVisible() {
        Actor actor = this;
        while (actor.isVisible()) {
            actor = actor.parent;
            if (actor == null) {
                return true;
            }
        }
        return false;
    }

    public boolean hasKeyboardFocus() {
        Stage stage2 = getStage();
        return stage2 != null && stage2.getKeyboardFocus() == this;
    }

    public boolean hasScrollFocus() {
        Stage stage2 = getStage();
        return stage2 != null && stage2.getScrollFocus() == this;
    }

    public boolean isTouchFocusTarget() {
        Stage stage2 = getStage();
        if (stage2 == null) {
            return false;
        }
        int i = stage2.touchFocuses.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (stage2.touchFocuses.get(i2).target == this) {
                return true;
            }
        }
        return false;
    }

    public boolean isTouchFocusListener() {
        Stage stage2 = getStage();
        if (stage2 == null) {
            return false;
        }
        int i = stage2.touchFocuses.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (stage2.touchFocuses.get(i2).listenerActor == this) {
                return true;
            }
        }
        return false;
    }

    public Object getUserObject() {
        return this.userObject;
    }

    public void setUserObject(Object obj) {
        this.userObject = obj;
    }

    public float getX() {
        return this.x;
    }

    public float getX(int i) {
        float f;
        float f2 = this.x;
        if ((i & 16) != 0) {
            f = this.width;
        } else if ((i & 8) != 0) {
            return f2;
        } else {
            f = this.width / 2.0f;
        }
        return f2 + f;
    }

    public void setX(float f) {
        if (this.x != f) {
            this.x = f;
            positionChanged();
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x0018  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setX(float r2, int r3) {
        /*
            r1 = this;
            r0 = r3 & 16
            if (r0 == 0) goto L_0x0008
            float r3 = r1.width
        L_0x0006:
            float r2 = r2 - r3
            goto L_0x0012
        L_0x0008:
            r3 = r3 & 8
            if (r3 != 0) goto L_0x0012
            float r3 = r1.width
            r0 = 1073741824(0x40000000, float:2.0)
            float r3 = r3 / r0
            goto L_0x0006
        L_0x0012:
            float r3 = r1.x
            int r3 = (r3 > r2 ? 1 : (r3 == r2 ? 0 : -1))
            if (r3 == 0) goto L_0x001d
            r1.x = r2
            r1.positionChanged()
        L_0x001d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.Actor.setX(float, int):void");
    }

    public float getY() {
        return this.y;
    }

    public void setY(float f) {
        if (this.y != f) {
            this.y = f;
            positionChanged();
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x0018  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setY(float r2, int r3) {
        /*
            r1 = this;
            r0 = r3 & 2
            if (r0 == 0) goto L_0x0008
            float r3 = r1.height
        L_0x0006:
            float r2 = r2 - r3
            goto L_0x0012
        L_0x0008:
            r3 = r3 & 4
            if (r3 != 0) goto L_0x0012
            float r3 = r1.height
            r0 = 1073741824(0x40000000, float:2.0)
            float r3 = r3 / r0
            goto L_0x0006
        L_0x0012:
            float r3 = r1.y
            int r3 = (r3 > r2 ? 1 : (r3 == r2 ? 0 : -1))
            if (r3 == 0) goto L_0x001d
            r1.y = r2
            r1.positionChanged()
        L_0x001d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.Actor.setY(float, int):void");
    }

    public float getY(int i) {
        float f;
        float f2 = this.y;
        if ((i & 2) != 0) {
            f = this.height;
        } else if ((i & 4) != 0) {
            return f2;
        } else {
            f = this.height / 2.0f;
        }
        return f2 + f;
    }

    public void setPosition(float f, float f2) {
        if (this.x != f || this.y != f2) {
            this.x = f;
            this.y = f2;
            positionChanged();
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x001a  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0028  */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x0016  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setPosition(float r3, float r4, int r5) {
        /*
            r2 = this;
            r0 = r5 & 16
            r1 = 1073741824(0x40000000, float:2.0)
            if (r0 == 0) goto L_0x000a
            float r0 = r2.width
        L_0x0008:
            float r3 = r3 - r0
            goto L_0x0012
        L_0x000a:
            r0 = r5 & 8
            if (r0 != 0) goto L_0x0012
            float r0 = r2.width
            float r0 = r0 / r1
            goto L_0x0008
        L_0x0012:
            r0 = r5 & 2
            if (r0 == 0) goto L_0x001a
            float r5 = r2.height
        L_0x0018:
            float r4 = r4 - r5
            goto L_0x0022
        L_0x001a:
            r5 = r5 & 4
            if (r5 != 0) goto L_0x0022
            float r5 = r2.height
            float r5 = r5 / r1
            goto L_0x0018
        L_0x0022:
            float r5 = r2.x
            int r5 = (r5 > r3 ? 1 : (r5 == r3 ? 0 : -1))
            if (r5 != 0) goto L_0x002e
            float r5 = r2.y
            int r5 = (r5 > r4 ? 1 : (r5 == r4 ? 0 : -1))
            if (r5 == 0) goto L_0x0035
        L_0x002e:
            r2.x = r3
            r2.y = r4
            r2.positionChanged()
        L_0x0035:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.Actor.setPosition(float, float, int):void");
    }

    public void moveBy(float f, float f2) {
        if (f != 0.0f || f2 != 0.0f) {
            this.x += f;
            this.y += f2;
            positionChanged();
        }
    }

    public float getWidth() {
        return this.width;
    }

    public void setWidth(float f) {
        if (this.width != f) {
            this.width = f;
            sizeChanged();
        }
    }

    public float getHeight() {
        return this.height;
    }

    public void setHeight(float f) {
        if (this.height != f) {
            this.height = f;
            sizeChanged();
        }
    }

    public float getTop() {
        return this.y + this.height;
    }

    public float getRight() {
        return this.x + this.width;
    }

    public void setSize(float f, float f2) {
        if (this.width != f || this.height != f2) {
            this.width = f;
            this.height = f2;
            sizeChanged();
        }
    }

    public void sizeBy(float f) {
        if (f != 0.0f) {
            this.width += f;
            this.height += f;
            sizeChanged();
        }
    }

    public void sizeBy(float f, float f2) {
        if (f != 0.0f || f2 != 0.0f) {
            this.width += f;
            this.height += f2;
            sizeChanged();
        }
    }

    public void setBounds(float f, float f2, float f3, float f4) {
        if (!(this.x == f && this.y == f2)) {
            this.x = f;
            this.y = f2;
            positionChanged();
        }
        if (this.width != f3 || this.height != f4) {
            this.width = f3;
            this.height = f4;
            sizeChanged();
        }
    }

    public float getOriginX() {
        return this.originX;
    }

    public void setOriginX(float f) {
        this.originX = f;
    }

    public float getOriginY() {
        return this.originY;
    }

    public void setOriginY(float f) {
        this.originY = f;
    }

    public void setOrigin(float f, float f2) {
        this.originX = f;
        this.originY = f2;
    }

    public void setOrigin(int i) {
        if ((i & 8) != 0) {
            this.originX = 0.0f;
        } else if ((i & 16) != 0) {
            this.originX = this.width;
        } else {
            this.originX = this.width / 2.0f;
        }
        if ((i & 4) != 0) {
            this.originY = 0.0f;
        } else if ((i & 2) != 0) {
            this.originY = this.height;
        } else {
            this.originY = this.height / 2.0f;
        }
    }

    public float getScaleX() {
        return this.scaleX;
    }

    public void setScaleX(float f) {
        this.scaleX = f;
    }

    public float getScaleY() {
        return this.scaleY;
    }

    public void setScaleY(float f) {
        this.scaleY = f;
    }

    public void setScale(float f) {
        this.scaleX = f;
        this.scaleY = f;
    }

    public void setScale(float f, float f2) {
        this.scaleX = f;
        this.scaleY = f2;
    }

    public void scaleBy(float f) {
        this.scaleX += f;
        this.scaleY += f;
    }

    public void scaleBy(float f, float f2) {
        this.scaleX += f;
        this.scaleY += f2;
    }

    public float getRotation() {
        return this.rotation;
    }

    public void setRotation(float f) {
        if (this.rotation != f) {
            this.rotation = f;
            rotationChanged();
        }
    }

    public void rotateBy(float f) {
        if (f != 0.0f) {
            this.rotation = (this.rotation + f) % 360.0f;
            rotationChanged();
        }
    }

    public void setColor(Color color2) {
        this.color.set(color2);
    }

    public void setColor(float f, float f2, float f3, float f4) {
        this.color.set(f, f2, f3, f4);
    }

    public Color getColor() {
        return this.color;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void toFront() {
        setZIndex(Integer.MAX_VALUE);
    }

    public void toBack() {
        setZIndex(0);
    }

    public boolean setZIndex(int i) {
        if (i >= 0) {
            Group group = this.parent;
            if (group == null) {
                return false;
            }
            SnapshotArray<Actor> snapshotArray = group.children;
            if (snapshotArray.size == 1) {
                return false;
            }
            int min = Math.min(i, snapshotArray.size - 1);
            if (snapshotArray.get(min) == this || !snapshotArray.removeValue(this, true)) {
                return false;
            }
            snapshotArray.insert(min, this);
            return true;
        }
        throw new IllegalArgumentException("ZIndex cannot be < 0.");
    }

    public int getZIndex() {
        Group group = this.parent;
        if (group == null) {
            return -1;
        }
        return group.children.indexOf(this, true);
    }

    public boolean clipBegin() {
        return clipBegin(this.x, this.y, this.width, this.height);
    }

    public boolean clipBegin(float f, float f2, float f3, float f4) {
        Stage stage2;
        if (f3 <= 0.0f || f4 <= 0.0f || (stage2 = this.stage) == null) {
            return false;
        }
        Rectangle rectangle = Rectangle.tmp;
        rectangle.x = f;
        rectangle.y = f2;
        rectangle.width = f3;
        rectangle.height = f4;
        Rectangle rectangle2 = (Rectangle) Pools.obtain(Rectangle.class);
        stage2.calculateScissors(rectangle, rectangle2);
        if (ScissorStack.pushScissors(rectangle2)) {
            return true;
        }
        Pools.free(rectangle2);
        return false;
    }

    public void clipEnd() {
        Pools.free(ScissorStack.popScissors());
    }

    public Vector2 screenToLocalCoordinates(Vector2 vector2) {
        Stage stage2 = this.stage;
        if (stage2 == null) {
            return vector2;
        }
        return stageToLocalCoordinates(stage2.screenToStageCoordinates(vector2));
    }

    public Vector2 stageToLocalCoordinates(Vector2 vector2) {
        Group group = this.parent;
        if (group != null) {
            group.stageToLocalCoordinates(vector2);
        }
        parentToLocalCoordinates(vector2);
        return vector2;
    }

    public Vector2 parentToLocalCoordinates(Vector2 vector2) {
        float f = this.rotation;
        float f2 = this.scaleX;
        float f3 = this.scaleY;
        float f4 = this.x;
        float f5 = this.y;
        if (f != 0.0f) {
            double d = (double) (f * 0.017453292f);
            float cos = (float) Math.cos(d);
            float sin = (float) Math.sin(d);
            float f6 = this.originX;
            float f7 = this.originY;
            float f8 = (vector2.x - f4) - f6;
            float f9 = (vector2.y - f5) - f7;
            vector2.x = (((f8 * cos) + (f9 * sin)) / f2) + f6;
            vector2.y = (((f8 * (-sin)) + (f9 * cos)) / f3) + f7;
        } else if (f2 == 1.0f && f3 == 1.0f) {
            vector2.x -= f4;
            vector2.y -= f5;
        } else {
            float f10 = this.originX;
            float f11 = this.originY;
            vector2.x = (((vector2.x - f4) - f10) / f2) + f10;
            vector2.y = (((vector2.y - f5) - f11) / f3) + f11;
        }
        return vector2;
    }

    public Vector2 localToScreenCoordinates(Vector2 vector2) {
        Stage stage2 = this.stage;
        if (stage2 == null) {
            return vector2;
        }
        return stage2.stageToScreenCoordinates(localToAscendantCoordinates(null, vector2));
    }

    public Vector2 localToStageCoordinates(Vector2 vector2) {
        return localToAscendantCoordinates(null, vector2);
    }

    public Vector2 localToParentCoordinates(Vector2 vector2) {
        float f = -this.rotation;
        float f2 = this.scaleX;
        float f3 = this.scaleY;
        float f4 = this.x;
        float f5 = this.y;
        if (f != 0.0f) {
            double d = (double) (f * 0.017453292f);
            float cos = (float) Math.cos(d);
            float sin = (float) Math.sin(d);
            float f6 = this.originX;
            float f7 = this.originY;
            float f8 = (vector2.x - f6) * f2;
            float f9 = (vector2.y - f7) * f3;
            vector2.x = (f8 * cos) + (f9 * sin) + f6 + f4;
            vector2.y = (f8 * (-sin)) + (f9 * cos) + f7 + f5;
        } else if (f2 == 1.0f && f3 == 1.0f) {
            vector2.x += f4;
            vector2.y += f5;
        } else {
            float f10 = this.originX;
            float f11 = this.originY;
            vector2.x = ((vector2.x - f10) * f2) + f10 + f4;
            vector2.y = ((vector2.y - f11) * f3) + f11 + f5;
        }
        return vector2;
    }

    public Vector2 localToAscendantCoordinates(Actor actor, Vector2 vector2) {
        Actor actor2 = this;
        do {
            actor2.localToParentCoordinates(vector2);
            actor2 = actor2.parent;
            if (actor2 != actor) {
                break;
                break;
            }
            break;
        } while (actor2 != null);
        return vector2;
    }

    public Vector2 localToActorCoordinates(Actor actor, Vector2 vector2) {
        localToStageCoordinates(vector2);
        return actor.stageToLocalCoordinates(vector2);
    }

    public void drawDebug(ShapeRenderer shapeRenderer) {
        drawDebugBounds(shapeRenderer);
    }

    /* access modifiers changed from: protected */
    public void drawDebugBounds(ShapeRenderer shapeRenderer) {
        if (this.debug) {
            shapeRenderer.set(ShapeRenderer.ShapeType.Line);
            Stage stage2 = this.stage;
            if (stage2 != null) {
                shapeRenderer.setColor(stage2.getDebugColor());
            }
            shapeRenderer.rect(this.x, this.y, this.originX, this.originY, this.width, this.height, this.scaleX, this.scaleY, this.rotation);
        }
    }

    public void setDebug(boolean z) {
        this.debug = z;
        if (z) {
            Stage.debug = true;
        }
    }

    public boolean getDebug() {
        return this.debug;
    }

    public Actor debug() {
        setDebug(true);
        return this;
    }

    public String toString() {
        String str = this.name;
        if (str != null) {
            return str;
        }
        String name2 = getClass().getName();
        int lastIndexOf = name2.lastIndexOf(46);
        return lastIndexOf != -1 ? name2.substring(lastIndexOf + 1) : name2;
    }
}
