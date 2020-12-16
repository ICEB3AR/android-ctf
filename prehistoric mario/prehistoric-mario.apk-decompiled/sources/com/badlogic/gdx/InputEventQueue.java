package com.badlogic.gdx;

import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.TimeUtils;

public class InputEventQueue implements InputProcessor {
    private static final int KEY_DOWN = 0;
    private static final int KEY_TYPED = 2;
    private static final int KEY_UP = 1;
    private static final int MOUSE_MOVED = 6;
    private static final int SCROLLED = 7;
    private static final int SKIP = -1;
    private static final int TOUCH_DOWN = 3;
    private static final int TOUCH_DRAGGED = 5;
    private static final int TOUCH_UP = 4;
    private long currentEventTime;
    private final IntArray processingQueue = new IntArray();
    private InputProcessor processor;
    private final IntArray queue = new IntArray();

    public InputEventQueue() {
    }

    public InputEventQueue(InputProcessor inputProcessor) {
        this.processor = inputProcessor;
    }

    public void setProcessor(InputProcessor inputProcessor) {
        this.processor = inputProcessor;
    }

    public InputProcessor getProcessor() {
        return this.processor;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0024, code lost:
        if (r2 >= r3) goto L_0x00b9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0026, code lost:
        r4 = r2 + 1;
        r2 = r0[r2];
        r5 = r4 + 1;
        r4 = r5 + 1;
        r12.currentEventTime = (((long) r0[r4]) << 32) | (((long) r0[r5]) & 4294967295L);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0040, code lost:
        switch(r2) {
            case -1: goto L_0x00b3;
            case 0: goto L_0x00aa;
            case 1: goto L_0x00a1;
            case 2: goto L_0x0098;
            case 3: goto L_0x0083;
            case 4: goto L_0x006f;
            case 5: goto L_0x005e;
            case 6: goto L_0x0051;
            case 7: goto L_0x0049;
            default: goto L_0x0043;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0048, code lost:
        throw new java.lang.RuntimeException();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0049, code lost:
        r2 = r4 + 1;
        r1.scrolled(r0[r4]);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0051, code lost:
        r2 = r4 + 1;
        r1.mouseMoved(r0[r4], r0[r2]);
        r2 = r2 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x005e, code lost:
        r2 = r4 + 1;
        r5 = r2 + 1;
        r1.touchDragged(r0[r4], r0[r2], r0[r5]);
        r2 = r5 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x006f, code lost:
        r2 = r4 + 1;
        r5 = r2 + 1;
        r6 = r5 + 1;
        r7 = r6 + 1;
        r1.touchUp(r0[r4], r0[r2], r0[r5], r0[r6]);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0083, code lost:
        r2 = r4 + 1;
        r5 = r2 + 1;
        r6 = r5 + 1;
        r7 = r6 + 1;
        r1.touchDown(r0[r4], r0[r2], r0[r5], r0[r6]);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0096, code lost:
        r2 = r7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0098, code lost:
        r2 = r4 + 1;
        r1.keyTyped((char) r0[r4]);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x00a1, code lost:
        r2 = r4 + 1;
        r1.keyUp(r0[r4]);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x00aa, code lost:
        r2 = r4 + 1;
        r1.keyDown(r0[r4]);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x00b3, code lost:
        r2 = r4 + r0[r4];
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x00b9, code lost:
        r12.processingQueue.clear();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x00be, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0019, code lost:
        r0 = r12.processingQueue.items;
        r1 = r12.processor;
        r2 = 0;
        r3 = r12.processingQueue.size;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void drain() {
        /*
        // Method dump skipped, instructions count: 218
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.InputEventQueue.drain():void");
    }

    private synchronized int next(int i, int i2) {
        int[] iArr = this.queue.items;
        int i3 = this.queue.size;
        while (i2 < i3) {
            int i4 = iArr[i2];
            if (i4 == i) {
                return i2;
            }
            int i5 = i2 + 3;
            switch (i4) {
                case -1:
                    i2 = i5 + iArr[i5];
                    break;
                case 0:
                case 1:
                case 2:
                case 7:
                    i2 = i5 + 1;
                    break;
                case 3:
                case 4:
                    i2 = i5 + 4;
                    break;
                case 5:
                    i2 = i5 + 3;
                    break;
                case 6:
                    i2 = i5 + 2;
                    break;
                default:
                    throw new RuntimeException();
            }
        }
        return -1;
    }

    private void queueTime() {
        long nanoTime = TimeUtils.nanoTime();
        this.queue.add((int) (nanoTime >> 32));
        this.queue.add((int) nanoTime);
    }

    @Override // com.badlogic.gdx.InputProcessor
    public synchronized boolean keyDown(int i) {
        this.queue.add(0);
        queueTime();
        this.queue.add(i);
        return false;
    }

    @Override // com.badlogic.gdx.InputProcessor
    public synchronized boolean keyUp(int i) {
        this.queue.add(1);
        queueTime();
        this.queue.add(i);
        return false;
    }

    @Override // com.badlogic.gdx.InputProcessor
    public synchronized boolean keyTyped(char c) {
        this.queue.add(2);
        queueTime();
        this.queue.add(c);
        return false;
    }

    @Override // com.badlogic.gdx.InputProcessor
    public synchronized boolean touchDown(int i, int i2, int i3, int i4) {
        this.queue.add(3);
        queueTime();
        this.queue.add(i);
        this.queue.add(i2);
        this.queue.add(i3);
        this.queue.add(i4);
        return false;
    }

    @Override // com.badlogic.gdx.InputProcessor
    public synchronized boolean touchUp(int i, int i2, int i3, int i4) {
        this.queue.add(4);
        queueTime();
        this.queue.add(i);
        this.queue.add(i2);
        this.queue.add(i3);
        this.queue.add(i4);
        return false;
    }

    @Override // com.badlogic.gdx.InputProcessor
    public synchronized boolean touchDragged(int i, int i2, int i3) {
        int next = next(5, 0);
        while (next >= 0) {
            if (this.queue.get(next + 5) == i3) {
                this.queue.set(next, -1);
                this.queue.set(next + 3, 3);
            }
            next = next(5, next + 6);
        }
        this.queue.add(5);
        queueTime();
        this.queue.add(i);
        this.queue.add(i2);
        this.queue.add(i3);
        return false;
    }

    @Override // com.badlogic.gdx.InputProcessor
    public synchronized boolean mouseMoved(int i, int i2) {
        int next = next(6, 0);
        while (next >= 0) {
            this.queue.set(next, -1);
            this.queue.set(next + 3, 2);
            next = next(6, next + 5);
        }
        this.queue.add(6);
        queueTime();
        this.queue.add(i);
        this.queue.add(i2);
        return false;
    }

    @Override // com.badlogic.gdx.InputProcessor
    public synchronized boolean scrolled(int i) {
        this.queue.add(7);
        queueTime();
        this.queue.add(i);
        return false;
    }

    public long getCurrentEventTime() {
        return this.currentEventTime;
    }
}
