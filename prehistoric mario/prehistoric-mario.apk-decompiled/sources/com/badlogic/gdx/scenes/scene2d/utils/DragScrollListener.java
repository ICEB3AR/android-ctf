package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.ui.ScrollPane;
import com.badlogic.gdx.utils.Timer;

public class DragScrollListener extends DragListener {
    static final Vector2 tmpCoords = new Vector2();
    Interpolation interpolation = Interpolation.exp5In;
    float maxSpeed = 75.0f;
    float minSpeed = 15.0f;
    long rampTime = 1750;
    private ScrollPane scroll;
    private Timer.Task scrollDown;
    private Timer.Task scrollUp;
    long startTime;
    float tickSecs = 0.05f;

    public DragScrollListener(final ScrollPane scrollPane) {
        this.scroll = scrollPane;
        this.scrollUp = new Timer.Task() {
            /* class com.badlogic.gdx.scenes.scene2d.utils.DragScrollListener.AnonymousClass1 */

            @Override // com.badlogic.gdx.utils.Timer.Task
            public void run() {
                DragScrollListener.this.scroll(scrollPane.getScrollY() - DragScrollListener.this.getScrollPixels());
            }
        };
        this.scrollDown = new Timer.Task() {
            /* class com.badlogic.gdx.scenes.scene2d.utils.DragScrollListener.AnonymousClass2 */

            @Override // com.badlogic.gdx.utils.Timer.Task
            public void run() {
                DragScrollListener.this.scroll(scrollPane.getScrollY() + DragScrollListener.this.getScrollPixels());
            }
        };
    }

    public void setup(float f, float f2, float f3, float f4) {
        this.minSpeed = f;
        this.maxSpeed = f2;
        this.tickSecs = f3;
        this.rampTime = (long) (f4 * 1000.0f);
    }

    /* access modifiers changed from: package-private */
    public float getScrollPixels() {
        return this.interpolation.apply(this.minSpeed, this.maxSpeed, Math.min(1.0f, ((float) (System.currentTimeMillis() - this.startTime)) / ((float) this.rampTime)));
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.DragListener
    public void drag(InputEvent inputEvent, float f, float f2, int i) {
        inputEvent.getListenerActor().localToActorCoordinates(this.scroll, tmpCoords.set(f, f2));
        if (tmpCoords.y >= this.scroll.getHeight()) {
            this.scrollDown.cancel();
            if (!this.scrollUp.isScheduled()) {
                this.startTime = System.currentTimeMillis();
                Timer.Task task = this.scrollUp;
                float f3 = this.tickSecs;
                Timer.schedule(task, f3, f3);
            }
        } else if (tmpCoords.y < 0.0f) {
            this.scrollUp.cancel();
            if (!this.scrollDown.isScheduled()) {
                this.startTime = System.currentTimeMillis();
                Timer.Task task2 = this.scrollDown;
                float f4 = this.tickSecs;
                Timer.schedule(task2, f4, f4);
            }
        } else {
            this.scrollUp.cancel();
            this.scrollDown.cancel();
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.DragListener
    public void dragStop(InputEvent inputEvent, float f, float f2, int i) {
        this.scrollUp.cancel();
        this.scrollDown.cancel();
    }

    /* access modifiers changed from: protected */
    public void scroll(float f) {
        this.scroll.setScrollY(f);
    }
}
