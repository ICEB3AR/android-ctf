package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;

public class Tooltip<T extends Actor> extends InputListener {
    static Vector2 tmp = new Vector2();
    boolean always;
    final Container<T> container;
    boolean instant;
    private final TooltipManager manager;
    Actor targetActor;

    public Tooltip(T t) {
        this(t, TooltipManager.getInstance());
    }

    public Tooltip(T t, TooltipManager tooltipManager) {
        this.manager = tooltipManager;
        this.container = new Container(t) {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Tooltip.AnonymousClass1 */

            @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
            public void act(float f) {
                super.act(f);
                if (Tooltip.this.targetActor != null && Tooltip.this.targetActor.getStage() == null) {
                    remove();
                }
            }
        };
        this.container.setTouchable(Touchable.disabled);
    }

    public TooltipManager getManager() {
        return this.manager;
    }

    public Container<T> getContainer() {
        return this.container;
    }

    public void setActor(T t) {
        this.container.setActor(t);
    }

    public T getActor() {
        return this.container.getActor();
    }

    public void setInstant(boolean z) {
        this.instant = z;
    }

    public void setAlways(boolean z) {
        this.always = z;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.InputListener
    public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
        if (this.instant) {
            this.container.toFront();
            return false;
        }
        this.manager.touchDown(this);
        return false;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.InputListener
    public boolean mouseMoved(InputEvent inputEvent, float f, float f2) {
        if (this.container.hasParent()) {
            return false;
        }
        setContainerPosition(inputEvent.getListenerActor(), f, f2);
        return true;
    }

    private void setContainerPosition(Actor actor, float f, float f2) {
        this.targetActor = actor;
        Stage stage = actor.getStage();
        if (stage != null) {
            this.container.pack();
            float f3 = this.manager.offsetX;
            float f4 = this.manager.offsetY;
            float f5 = this.manager.edgeDistance;
            float f6 = f + f3;
            Vector2 localToStageCoordinates = actor.localToStageCoordinates(tmp.set(f6, (f2 - f4) - this.container.getHeight()));
            if (localToStageCoordinates.y < f5) {
                localToStageCoordinates = actor.localToStageCoordinates(tmp.set(f6, f2 + f4));
            }
            if (localToStageCoordinates.x < f5) {
                localToStageCoordinates.x = f5;
            }
            if (localToStageCoordinates.x + this.container.getWidth() > stage.getWidth() - f5) {
                localToStageCoordinates.x = (stage.getWidth() - f5) - this.container.getWidth();
            }
            if (localToStageCoordinates.y + this.container.getHeight() > stage.getHeight() - f5) {
                localToStageCoordinates.y = (stage.getHeight() - f5) - this.container.getHeight();
            }
            this.container.setPosition(localToStageCoordinates.x, localToStageCoordinates.y);
            Vector2 localToStageCoordinates2 = actor.localToStageCoordinates(tmp.set(actor.getWidth() / 2.0f, actor.getHeight() / 2.0f));
            localToStageCoordinates2.sub(this.container.getX(), this.container.getY());
            this.container.setOrigin(localToStageCoordinates2.x, localToStageCoordinates2.y);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.InputListener
    public void enter(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
        if (i == -1 && !Gdx.input.isTouched()) {
            Actor listenerActor = inputEvent.getListenerActor();
            if (actor == null || !actor.isDescendantOf(listenerActor)) {
                setContainerPosition(listenerActor, f, f2);
                this.manager.enter(this);
            }
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.InputListener
    public void exit(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
        if (actor == null || !actor.isDescendantOf(inputEvent.getListenerActor())) {
            hide();
        }
    }

    public void hide() {
        this.manager.hide(this);
    }
}
