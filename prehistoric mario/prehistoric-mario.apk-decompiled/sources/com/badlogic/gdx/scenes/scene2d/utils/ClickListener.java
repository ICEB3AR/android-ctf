package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.utils.TimeUtils;

public class ClickListener extends InputListener {
    public static float visualPressedDuration = 0.1f;
    private int button;
    private boolean cancelled;
    private long lastTapTime;
    private boolean over;
    private boolean pressed;
    private int pressedButton = -1;
    private int pressedPointer = -1;
    private int tapCount;
    private long tapCountInterval = 400000000;
    private float tapSquareSize = 14.0f;
    private float touchDownX = -1.0f;
    private float touchDownY = -1.0f;
    private long visualPressedTime;

    public void clicked(InputEvent inputEvent, float f, float f2) {
    }

    public ClickListener() {
    }

    public ClickListener(int i) {
        this.button = i;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.InputListener
    public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
        int i3;
        if (this.pressed) {
            return false;
        }
        if (i == 0 && (i3 = this.button) != -1 && i2 != i3) {
            return false;
        }
        this.pressed = true;
        this.pressedPointer = i;
        this.pressedButton = i2;
        this.touchDownX = f;
        this.touchDownY = f2;
        setVisualPressed(true);
        return true;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.InputListener
    public void touchDragged(InputEvent inputEvent, float f, float f2, int i) {
        if (i == this.pressedPointer && !this.cancelled) {
            this.pressed = isOver(inputEvent.getListenerActor(), f, f2);
            if (!this.pressed) {
                invalidateTapSquare();
            }
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.InputListener
    public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
        int i3;
        if (i == this.pressedPointer) {
            if (!this.cancelled) {
                boolean isOver = isOver(inputEvent.getListenerActor(), f, f2);
                if (isOver && i == 0 && (i3 = this.button) != -1 && i2 != i3) {
                    isOver = false;
                }
                if (isOver) {
                    long nanoTime = TimeUtils.nanoTime();
                    if (nanoTime - this.lastTapTime > this.tapCountInterval) {
                        this.tapCount = 0;
                    }
                    this.tapCount++;
                    this.lastTapTime = nanoTime;
                    clicked(inputEvent, f, f2);
                }
            }
            this.pressed = false;
            this.pressedPointer = -1;
            this.pressedButton = -1;
            this.cancelled = false;
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.InputListener
    public void enter(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
        if (i == -1 && !this.cancelled) {
            this.over = true;
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.InputListener
    public void exit(InputEvent inputEvent, float f, float f2, int i, Actor actor) {
        if (i == -1 && !this.cancelled) {
            this.over = false;
        }
    }

    public void cancel() {
        if (this.pressedPointer != -1) {
            this.cancelled = true;
            this.pressed = false;
        }
    }

    public boolean isOver(Actor actor, float f, float f2) {
        Actor hit = actor.hit(f, f2, true);
        if (hit == null || !hit.isDescendantOf(actor)) {
            return inTapSquare(f, f2);
        }
        return true;
    }

    public boolean inTapSquare(float f, float f2) {
        if ((this.touchDownX != -1.0f || this.touchDownY != -1.0f) && Math.abs(f - this.touchDownX) < this.tapSquareSize && Math.abs(f2 - this.touchDownY) < this.tapSquareSize) {
            return true;
        }
        return false;
    }

    public boolean inTapSquare() {
        return this.touchDownX != -1.0f;
    }

    public void invalidateTapSquare() {
        this.touchDownX = -1.0f;
        this.touchDownY = -1.0f;
    }

    public boolean isPressed() {
        return this.pressed;
    }

    public boolean isVisualPressed() {
        if (this.pressed) {
            return true;
        }
        long j = this.visualPressedTime;
        if (j <= 0) {
            return false;
        }
        if (j > TimeUtils.millis()) {
            return true;
        }
        this.visualPressedTime = 0;
        return false;
    }

    public void setVisualPressed(boolean z) {
        if (z) {
            this.visualPressedTime = TimeUtils.millis() + ((long) (visualPressedDuration * 1000.0f));
        } else {
            this.visualPressedTime = 0;
        }
    }

    public boolean isOver() {
        return this.over || this.pressed;
    }

    public void setTapSquareSize(float f) {
        this.tapSquareSize = f;
    }

    public float getTapSquareSize() {
        return this.tapSquareSize;
    }

    public void setTapCountInterval(float f) {
        this.tapCountInterval = (long) (f * 1.0E9f);
    }

    public int getTapCount() {
        return this.tapCount;
    }

    public void setTapCount(int i) {
        this.tapCount = i;
    }

    public float getTouchDownX() {
        return this.touchDownX;
    }

    public float getTouchDownY() {
        return this.touchDownY;
    }

    public int getPressedButton() {
        return this.pressedButton;
    }

    public int getPressedPointer() {
        return this.pressedPointer;
    }

    public int getButton() {
        return this.button;
    }

    public void setButton(int i) {
        this.button = i;
    }
}
