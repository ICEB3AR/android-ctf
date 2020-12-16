package com.badlogic.gdx.scenes.scene2d.actions;

import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Event;
import com.badlogic.gdx.scenes.scene2d.EventListener;
import com.badlogic.gdx.utils.reflect.ClassReflection;

public abstract class EventAction<T extends Event> extends Action {
    boolean active;
    final Class<? extends T> eventClass;
    private final EventListener listener = new EventListener() {
        /* class com.badlogic.gdx.scenes.scene2d.actions.EventAction.AnonymousClass1 */

        @Override // com.badlogic.gdx.scenes.scene2d.EventListener
        public boolean handle(Event event) {
            if (!EventAction.this.active || !ClassReflection.isInstance(EventAction.this.eventClass, event)) {
                return false;
            }
            EventAction eventAction = EventAction.this;
            eventAction.result = eventAction.handle(event);
            return EventAction.this.result;
        }
    };
    boolean result;

    public abstract boolean handle(T t);

    public EventAction(Class<? extends T> cls) {
        this.eventClass = cls;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public void restart() {
        this.result = false;
        this.active = false;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public void setTarget(Actor actor) {
        if (this.target != null) {
            this.target.removeListener(this.listener);
        }
        super.setTarget(actor);
        if (actor != null) {
            actor.addListener(this.listener);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Action
    public boolean act(float f) {
        this.active = true;
        return this.result;
    }

    public boolean isActive() {
        return this.active;
    }

    public void setActive(boolean z) {
        this.active = z;
    }
}
