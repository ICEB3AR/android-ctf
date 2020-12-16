package com.badlogic.gdx.backends.android;

import android.view.MotionEvent;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.android.AndroidInput;

public class AndroidMouseHandler {
    private int deltaX = 0;
    private int deltaY = 0;

    public boolean onGenericMotion(MotionEvent motionEvent, AndroidInput androidInput) {
        if ((motionEvent.getSource() & 2) == 0) {
            return false;
        }
        int action = motionEvent.getAction() & 255;
        long nanoTime = System.nanoTime();
        synchronized (androidInput) {
            if (action == 7) {
                int x = (int) motionEvent.getX();
                int y = (int) motionEvent.getY();
                if (!(x == this.deltaX && y == this.deltaY)) {
                    postTouchEvent(androidInput, 4, x, y, 0, nanoTime);
                    this.deltaX = x;
                    this.deltaY = y;
                }
            } else if (action == 8) {
                postTouchEvent(androidInput, 3, 0, 0, (int) (-Math.signum(motionEvent.getAxisValue(9))), nanoTime);
            }
        }
        Gdx.app.getGraphics().requestRendering();
        return true;
    }

    private void logAction(int i) {
        String str;
        if (i == 9) {
            str = "HOVER_ENTER";
        } else if (i == 7) {
            str = "HOVER_MOVE";
        } else if (i == 10) {
            str = "HOVER_EXIT";
        } else if (i == 8) {
            str = "SCROLL";
        } else {
            str = "UNKNOWN (" + i + ")";
        }
        Gdx.app.log("AndroidMouseHandler", "action " + str);
    }

    private void postTouchEvent(AndroidInput androidInput, int i, int i2, int i3, int i4, long j) {
        AndroidInput.TouchEvent obtain = androidInput.usedTouchEvents.obtain();
        obtain.timeStamp = j;
        obtain.x = i2;
        obtain.y = i3;
        obtain.type = i;
        obtain.scrollAmount = i4;
        androidInput.touchEvents.add(obtain);
    }
}
