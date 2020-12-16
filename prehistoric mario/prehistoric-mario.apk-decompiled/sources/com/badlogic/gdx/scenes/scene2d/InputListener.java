package com.badlogic.gdx.scenes.scene2d;

import com.badlogic.gdx.math.Vector2;

public class InputListener implements EventListener {
    private static final Vector2 tmpCoords = new Vector2();

    public void enter(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
    }

    public void exit(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
    }

    public boolean keyDown(InputEvent inputEvent, int i) {
        return false;
    }

    public boolean keyTyped(InputEvent inputEvent, char c) {
        return false;
    }

    public boolean keyUp(InputEvent inputEvent, int i) {
        return false;
    }

    public boolean mouseMoved(InputEvent inputEvent, float f, float f2) {
        return false;
    }

    public boolean scrolled(InputEvent inputEvent, float f, float f2, int i) {
        return false;
    }

    public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
        return false;
    }

    public void touchDragged(InputEvent inputEvent, float f, float f2, int i) {
    }

    public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
    }

    @Override // com.badlogic.gdx.scenes.scene2d.EventListener
    public boolean handle(Event event) {
        if (!(event instanceof InputEvent)) {
            return false;
        }
        InputEvent inputEvent = (InputEvent) event;
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$scenes$scene2d$InputEvent$Type[inputEvent.getType().ordinal()];
        if (i == 1) {
            return keyDown(inputEvent, inputEvent.getKeyCode());
        }
        if (i == 2) {
            return keyUp(inputEvent, inputEvent.getKeyCode());
        }
        if (i == 3) {
            return keyTyped(inputEvent, inputEvent.getCharacter());
        }
        inputEvent.toCoordinates(inputEvent.getListenerActor(), tmpCoords);
        switch (inputEvent.getType()) {
            case touchDown:
                return touchDown(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getPointer(), inputEvent.getButton());
            case touchUp:
                touchUp(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getPointer(), inputEvent.getButton());
                return true;
            case touchDragged:
                touchDragged(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getPointer());
                return true;
            case mouseMoved:
                return mouseMoved(inputEvent, tmpCoords.x, tmpCoords.y);
            case scrolled:
                return scrolled(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getScrollAmount());
            case enter:
                enter(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getPointer(), inputEvent.getRelatedActor());
                return false;
            case exit:
                exit(inputEvent, tmpCoords.x, tmpCoords.y, inputEvent.getPointer(), inputEvent.getRelatedActor());
                return false;
            default:
                return false;
        }
    }
}
