package com.badlogic.gdx.input;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.InputAdapter;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.utils.TimeUtils;
import com.badlogic.gdx.utils.Timer;

public class GestureDetector extends InputAdapter {
    private long gestureStartTime;
    private boolean inTapRectangle;
    private final Vector2 initialPointer1;
    private final Vector2 initialPointer2;
    private int lastTapButton;
    private int lastTapPointer;
    private long lastTapTime;
    private float lastTapX;
    private float lastTapY;
    final GestureListener listener;
    boolean longPressFired;
    private float longPressSeconds;
    private final Timer.Task longPressTask;
    private long maxFlingDelay;
    private boolean panning;
    private boolean pinching;
    Vector2 pointer1;
    private final Vector2 pointer2;
    private int tapCount;
    private long tapCountInterval;
    private float tapRectangleCenterX;
    private float tapRectangleCenterY;
    private float tapRectangleHeight;
    private float tapRectangleWidth;
    private final VelocityTracker tracker;

    public static class GestureAdapter implements GestureListener {
        @Override // com.badlogic.gdx.input.GestureDetector.GestureListener
        public boolean fling(float f, float f2, int i) {
            return false;
        }

        @Override // com.badlogic.gdx.input.GestureDetector.GestureListener
        public boolean longPress(float f, float f2) {
            return false;
        }

        @Override // com.badlogic.gdx.input.GestureDetector.GestureListener
        public boolean pan(float f, float f2, float f3, float f4) {
            return false;
        }

        @Override // com.badlogic.gdx.input.GestureDetector.GestureListener
        public boolean panStop(float f, float f2, int i, int i2) {
            return false;
        }

        @Override // com.badlogic.gdx.input.GestureDetector.GestureListener
        public boolean pinch(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24) {
            return false;
        }

        @Override // com.badlogic.gdx.input.GestureDetector.GestureListener
        public void pinchStop() {
        }

        @Override // com.badlogic.gdx.input.GestureDetector.GestureListener
        public boolean tap(float f, float f2, int i, int i2) {
            return false;
        }

        @Override // com.badlogic.gdx.input.GestureDetector.GestureListener
        public boolean touchDown(float f, float f2, int i, int i2) {
            return false;
        }

        @Override // com.badlogic.gdx.input.GestureDetector.GestureListener
        public boolean zoom(float f, float f2) {
            return false;
        }
    }

    public interface GestureListener {
        boolean fling(float f, float f2, int i);

        boolean longPress(float f, float f2);

        boolean pan(float f, float f2, float f3, float f4);

        boolean panStop(float f, float f2, int i, int i2);

        boolean pinch(Vector2 vector2, Vector2 vector22, Vector2 vector23, Vector2 vector24);

        void pinchStop();

        boolean tap(float f, float f2, int i, int i2);

        boolean touchDown(float f, float f2, int i, int i2);

        boolean zoom(float f, float f2);
    }

    public GestureDetector(GestureListener gestureListener) {
        this(20.0f, 0.4f, 1.1f, 0.15f, gestureListener);
    }

    public GestureDetector(float f, float f2, float f3, float f4, GestureListener gestureListener) {
        this(f, f, f2, f3, f4, gestureListener);
    }

    public GestureDetector(float f, float f2, float f3, float f4, float f5, GestureListener gestureListener) {
        this.tracker = new VelocityTracker();
        this.pointer1 = new Vector2();
        this.pointer2 = new Vector2();
        this.initialPointer1 = new Vector2();
        this.initialPointer2 = new Vector2();
        this.longPressTask = new Timer.Task() {
            /* class com.badlogic.gdx.input.GestureDetector.AnonymousClass1 */

            @Override // com.badlogic.gdx.utils.Timer.Task
            public void run() {
                if (!GestureDetector.this.longPressFired) {
                    GestureDetector gestureDetector = GestureDetector.this;
                    gestureDetector.longPressFired = gestureDetector.listener.longPress(GestureDetector.this.pointer1.x, GestureDetector.this.pointer1.y);
                }
            }
        };
        if (gestureListener != null) {
            this.tapRectangleWidth = f;
            this.tapRectangleHeight = f2;
            this.tapCountInterval = (long) (f3 * 1.0E9f);
            this.longPressSeconds = f4;
            this.maxFlingDelay = (long) (f5 * 1.0E9f);
            this.listener = gestureListener;
            return;
        }
        throw new IllegalArgumentException("listener cannot be null.");
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean touchDown(int i, int i2, int i3, int i4) {
        return touchDown((float) i, (float) i2, i3, i4);
    }

    public boolean touchDown(float f, float f2, int i, int i2) {
        if (i > 1) {
            return false;
        }
        if (i == 0) {
            this.pointer1.set(f, f2);
            this.gestureStartTime = Gdx.input.getCurrentEventTime();
            this.tracker.start(f, f2, this.gestureStartTime);
            if (Gdx.input.isTouched(1)) {
                this.inTapRectangle = false;
                this.pinching = true;
                this.initialPointer1.set(this.pointer1);
                this.initialPointer2.set(this.pointer2);
                this.longPressTask.cancel();
            } else {
                this.inTapRectangle = true;
                this.pinching = false;
                this.longPressFired = false;
                this.tapRectangleCenterX = f;
                this.tapRectangleCenterY = f2;
                if (!this.longPressTask.isScheduled()) {
                    Timer.schedule(this.longPressTask, this.longPressSeconds);
                }
            }
        } else {
            this.pointer2.set(f, f2);
            this.inTapRectangle = false;
            this.pinching = true;
            this.initialPointer1.set(this.pointer1);
            this.initialPointer2.set(this.pointer2);
            this.longPressTask.cancel();
        }
        return this.listener.touchDown(f, f2, i, i2);
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean touchDragged(int i, int i2, int i3) {
        return touchDragged((float) i, (float) i2, i3);
    }

    public boolean touchDragged(float f, float f2, int i) {
        if (i > 1 || this.longPressFired) {
            return false;
        }
        if (i == 0) {
            this.pointer1.set(f, f2);
        } else {
            this.pointer2.set(f, f2);
        }
        if (this.pinching) {
            GestureListener gestureListener = this.listener;
            if (gestureListener == null) {
                return false;
            }
            boolean pinch = gestureListener.pinch(this.initialPointer1, this.initialPointer2, this.pointer1, this.pointer2);
            if (this.listener.zoom(this.initialPointer1.dst(this.initialPointer2), this.pointer1.dst(this.pointer2)) || pinch) {
                return true;
            }
            return false;
        }
        this.tracker.update(f, f2, Gdx.input.getCurrentEventTime());
        if (this.inTapRectangle && !isWithinTapRectangle(f, f2, this.tapRectangleCenterX, this.tapRectangleCenterY)) {
            this.longPressTask.cancel();
            this.inTapRectangle = false;
        }
        if (this.inTapRectangle) {
            return false;
        }
        this.panning = true;
        return this.listener.pan(f, f2, this.tracker.deltaX, this.tracker.deltaY);
    }

    @Override // com.badlogic.gdx.InputAdapter, com.badlogic.gdx.InputProcessor
    public boolean touchUp(int i, int i2, int i3, int i4) {
        return touchUp((float) i, (float) i2, i3, i4);
    }

    public boolean touchUp(float f, float f2, int i, int i2) {
        if (i > 1) {
            return false;
        }
        if (this.inTapRectangle && !isWithinTapRectangle(f, f2, this.tapRectangleCenterX, this.tapRectangleCenterY)) {
            this.inTapRectangle = false;
        }
        boolean z = this.panning;
        this.panning = false;
        this.longPressTask.cancel();
        if (this.longPressFired) {
            return false;
        }
        if (this.inTapRectangle) {
            if (this.lastTapButton != i2 || this.lastTapPointer != i || TimeUtils.nanoTime() - this.lastTapTime > this.tapCountInterval || !isWithinTapRectangle(f, f2, this.lastTapX, this.lastTapY)) {
                this.tapCount = 0;
            }
            this.tapCount++;
            this.lastTapTime = TimeUtils.nanoTime();
            this.lastTapX = f;
            this.lastTapY = f2;
            this.lastTapButton = i2;
            this.lastTapPointer = i;
            this.gestureStartTime = 0;
            return this.listener.tap(f, f2, this.tapCount, i2);
        } else if (this.pinching) {
            this.pinching = false;
            this.listener.pinchStop();
            this.panning = true;
            if (i == 0) {
                this.tracker.start(this.pointer2.x, this.pointer2.y, Gdx.input.getCurrentEventTime());
            } else {
                this.tracker.start(this.pointer1.x, this.pointer1.y, Gdx.input.getCurrentEventTime());
            }
            return false;
        } else {
            boolean panStop = (!z || this.panning) ? false : this.listener.panStop(f, f2, i, i2);
            this.gestureStartTime = 0;
            long currentEventTime = Gdx.input.getCurrentEventTime();
            if (currentEventTime - this.tracker.lastTime >= this.maxFlingDelay) {
                return panStop;
            }
            this.tracker.update(f, f2, currentEventTime);
            return this.listener.fling(this.tracker.getVelocityX(), this.tracker.getVelocityY(), i2) || panStop;
        }
    }

    public void cancel() {
        this.longPressTask.cancel();
        this.longPressFired = true;
    }

    public boolean isLongPressed() {
        return isLongPressed(this.longPressSeconds);
    }

    public boolean isLongPressed(float f) {
        if (this.gestureStartTime != 0 && TimeUtils.nanoTime() - this.gestureStartTime > ((long) (f * 1.0E9f))) {
            return true;
        }
        return false;
    }

    public boolean isPanning() {
        return this.panning;
    }

    public void reset() {
        this.gestureStartTime = 0;
        this.panning = false;
        this.inTapRectangle = false;
        this.tracker.lastTime = 0;
    }

    private boolean isWithinTapRectangle(float f, float f2, float f3, float f4) {
        return Math.abs(f - f3) < this.tapRectangleWidth && Math.abs(f2 - f4) < this.tapRectangleHeight;
    }

    public void invalidateTapSquare() {
        this.inTapRectangle = false;
    }

    public void setTapSquareSize(float f) {
        setTapRectangleSize(f, f);
    }

    public void setTapRectangleSize(float f, float f2) {
        this.tapRectangleWidth = f;
        this.tapRectangleHeight = f2;
    }

    public void setTapCountInterval(float f) {
        this.tapCountInterval = (long) (f * 1.0E9f);
    }

    public void setLongPressSeconds(float f) {
        this.longPressSeconds = f;
    }

    public void setMaxFlingDelay(long j) {
        this.maxFlingDelay = j;
    }

    /* access modifiers changed from: package-private */
    public static class VelocityTracker {
        float deltaX;
        float deltaY;
        long lastTime;
        float lastX;
        float lastY;
        long[] meanTime;
        float[] meanX;
        float[] meanY;
        int numSamples;
        int sampleSize = 10;

        VelocityTracker() {
            int i = this.sampleSize;
            this.meanX = new float[i];
            this.meanY = new float[i];
            this.meanTime = new long[i];
        }

        public void start(float f, float f2, long j) {
            this.lastX = f;
            this.lastY = f2;
            this.deltaX = 0.0f;
            this.deltaY = 0.0f;
            this.numSamples = 0;
            for (int i = 0; i < this.sampleSize; i++) {
                this.meanX[i] = 0.0f;
                this.meanY[i] = 0.0f;
                this.meanTime[i] = 0;
            }
            this.lastTime = j;
        }

        public void update(float f, float f2, long j) {
            this.deltaX = f - this.lastX;
            this.deltaY = f2 - this.lastY;
            this.lastX = f;
            this.lastY = f2;
            long j2 = j - this.lastTime;
            this.lastTime = j;
            int i = this.numSamples;
            int i2 = i % this.sampleSize;
            this.meanX[i2] = this.deltaX;
            this.meanY[i2] = this.deltaY;
            this.meanTime[i2] = j2;
            this.numSamples = i + 1;
        }

        public float getVelocityX() {
            float average = getAverage(this.meanX, this.numSamples);
            float average2 = ((float) getAverage(this.meanTime, this.numSamples)) / 1.0E9f;
            if (average2 == 0.0f) {
                return 0.0f;
            }
            return average / average2;
        }

        public float getVelocityY() {
            float average = getAverage(this.meanY, this.numSamples);
            float average2 = ((float) getAverage(this.meanTime, this.numSamples)) / 1.0E9f;
            if (average2 == 0.0f) {
                return 0.0f;
            }
            return average / average2;
        }

        private float getAverage(float[] fArr, int i) {
            int min = Math.min(this.sampleSize, i);
            float f = 0.0f;
            for (int i2 = 0; i2 < min; i2++) {
                f += fArr[i2];
            }
            return f / ((float) min);
        }

        private long getAverage(long[] jArr, int i) {
            int min = Math.min(this.sampleSize, i);
            long j = 0;
            for (int i2 = 0; i2 < min; i2++) {
                j += jArr[i2];
            }
            if (min == 0) {
                return 0;
            }
            return j / ((long) min);
        }

        private float getSum(float[] fArr, int i) {
            int min = Math.min(this.sampleSize, i);
            float f = 0.0f;
            for (int i2 = 0; i2 < min; i2++) {
                f += fArr[i2];
            }
            if (min == 0) {
                return 0.0f;
            }
            return f;
        }
    }
}
