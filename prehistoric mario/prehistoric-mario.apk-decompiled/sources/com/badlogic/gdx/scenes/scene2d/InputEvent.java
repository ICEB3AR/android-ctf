package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.math.Vector2;

public class InputEvent extends Event {
    private int button;
    private char character;
    private int keyCode;
    private int pointer;
    private Actor relatedActor;
    private int scrollAmount;
    private float stageX;
    private float stageY;
    private Type type;

    public enum Type {
        touchDown,
        touchUp,
        touchDragged,
        mouseMoved,
        enter,
        exit,
        scrolled,
        keyDown,
        keyUp,
        keyTyped
    }

    @Override // com.badlogic.gdx.utils.Pool.Poolable, com.badlogic.gdx.scenes.scene2d.Event
    public void reset() {
        super.reset();
        this.relatedActor = null;
        this.button = -1;
    }

    public float getStageX() {
        return this.stageX;
    }

    public void setStageX(float f) {
        this.stageX = f;
    }

    public float getStageY() {
        return this.stageY;
    }

    public void setStageY(float f) {
        this.stageY = f;
    }

    public Type getType() {
        return this.type;
    }

    public void setType(Type type2) {
        this.type = type2;
    }

    public int getPointer() {
        return this.pointer;
    }

    public void setPointer(int i) {
        this.pointer = i;
    }

    public int getButton() {
        return this.button;
    }

    public void setButton(int i) {
        this.button = i;
    }

    public int getKeyCode() {
        return this.keyCode;
    }

    public void setKeyCode(int i) {
        this.keyCode = i;
    }

    public char getCharacter() {
        return this.character;
    }

    public void setCharacter(char c) {
        this.character = c;
    }

    public int getScrollAmount() {
        return this.scrollAmount;
    }

    public void setScrollAmount(int i) {
        this.scrollAmount = i;
    }

    public Actor getRelatedActor() {
        return this.relatedActor;
    }

    public void setRelatedActor(Actor actor) {
        this.relatedActor = actor;
    }

    public Vector2 toCoordinates(Actor actor, Vector2 vector2) {
        vector2.set(this.stageX, this.stageY);
        actor.stageToLocalCoordinates(vector2);
        return vector2;
    }

    public boolean isTouchFocusCancel() {
        return this.stageX == -2.14748365E9f || this.stageY == -2.14748365E9f;
    }

    public String toString() {
        return this.type.toString();
    }
}
