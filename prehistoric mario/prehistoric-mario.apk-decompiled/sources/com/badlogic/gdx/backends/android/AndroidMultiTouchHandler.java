package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.os.Build;
import android.view.MotionEvent;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.android.AndroidInput;

public class AndroidMultiTouchHandler implements AndroidTouchHandler {
    private int toGdxButton(int i) {
        if (i == 0 || i == 1) {
            return 0;
        }
        if (i == 2) {
            return 1;
        }
        if (i == 4) {
            return 2;
        }
        if (i == 8) {
            return 3;
        }
        return i == 16 ? 4 : -1;
    }

    @Override // com.badlogic.gdx.backends.android.AndroidTouchHandler
    public void onTouch(MotionEvent motionEvent, AndroidInput androidInput) {
        Throwable th;
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int action = motionEvent.getAction() & 255;
        int action2 = (motionEvent.getAction() & 65280) >> 8;
        int pointerId = motionEvent.getPointerId(action2);
        long nanoTime = System.nanoTime();
        synchronized (androidInput) {
            int i10 = 20;
            boolean z = false;
            switch (action) {
                case 0:
                case 5:
                    int freePointerIndex = androidInput.getFreePointerIndex();
                    if (freePointerIndex < 20) {
                        androidInput.realId[freePointerIndex] = pointerId;
                        int x = (int) motionEvent.getX(action2);
                        int y = (int) motionEvent.getY(action2);
                        if (Build.VERSION.SDK_INT >= 14) {
                            try {
                                i = toGdxButton(motionEvent.getButtonState());
                            } catch (Throwable th2) {
                                th = th2;
                                throw th;
                            }
                        } else {
                            i = 0;
                        }
                        if (i != -1) {
                            i4 = i;
                            i3 = x;
                            i2 = y;
                            postTouchEvent(androidInput, 0, x, y, freePointerIndex, i4, nanoTime);
                        } else {
                            i4 = i;
                            i3 = x;
                            i2 = y;
                        }
                        androidInput.touchX[freePointerIndex] = i3;
                        androidInput.touchY[freePointerIndex] = i2;
                        androidInput.deltaX[freePointerIndex] = 0;
                        androidInput.deltaY[freePointerIndex] = 0;
                        boolean[] zArr = androidInput.touched;
                        if (i4 != -1) {
                            z = true;
                        }
                        zArr[freePointerIndex] = z;
                        androidInput.button[freePointerIndex] = i4;
                        androidInput.pressure[freePointerIndex] = motionEvent.getPressure(action2);
                    }
                    Gdx.app.getGraphics().requestRendering();
                    return;
                case 1:
                case 4:
                case 6:
                    int lookUpPointerIndex = androidInput.lookUpPointerIndex(pointerId);
                    if (lookUpPointerIndex != -1) {
                        if (lookUpPointerIndex < 20) {
                            androidInput.realId[lookUpPointerIndex] = -1;
                            int x2 = (int) motionEvent.getX(action2);
                            int y2 = (int) motionEvent.getY(action2);
                            int i11 = androidInput.button[lookUpPointerIndex];
                            if (i11 != -1) {
                                i5 = x2;
                                postTouchEvent(androidInput, 1, x2, y2, lookUpPointerIndex, i11, nanoTime);
                            } else {
                                i5 = x2;
                            }
                            androidInput.touchX[lookUpPointerIndex] = i5;
                            androidInput.touchY[lookUpPointerIndex] = y2;
                            androidInput.deltaX[lookUpPointerIndex] = 0;
                            androidInput.deltaY[lookUpPointerIndex] = 0;
                            androidInput.touched[lookUpPointerIndex] = false;
                            androidInput.button[lookUpPointerIndex] = 0;
                            androidInput.pressure[lookUpPointerIndex] = 0.0f;
                        }
                    }
                    Gdx.app.getGraphics().requestRendering();
                    return;
                case 2:
                    int pointerCount = motionEvent.getPointerCount();
                    int i12 = 0;
                    while (true) {
                        if (i12 < pointerCount) {
                            int pointerId2 = motionEvent.getPointerId(i12);
                            int x3 = (int) motionEvent.getX(i12);
                            int y3 = (int) motionEvent.getY(i12);
                            int lookUpPointerIndex2 = androidInput.lookUpPointerIndex(pointerId2);
                            if (lookUpPointerIndex2 == -1) {
                                i6 = i12;
                            } else if (lookUpPointerIndex2 < i10) {
                                int i13 = androidInput.button[lookUpPointerIndex2];
                                if (i13 != -1) {
                                    i8 = lookUpPointerIndex2;
                                    i7 = y3;
                                    i6 = i12;
                                    i9 = x3;
                                    postTouchEvent(androidInput, 2, x3, y3, lookUpPointerIndex2, i13, nanoTime);
                                } else {
                                    i8 = lookUpPointerIndex2;
                                    i7 = y3;
                                    i6 = i12;
                                    i9 = x3;
                                    postTouchEvent(androidInput, 4, i9, i7, lookUpPointerIndex2, 0, nanoTime);
                                }
                                androidInput.deltaX[i8] = i9 - androidInput.touchX[i8];
                                androidInput.deltaY[i8] = i7 - androidInput.touchY[i8];
                                androidInput.touchX[i8] = i9;
                                androidInput.touchY[i8] = i7;
                                androidInput.pressure[i8] = motionEvent.getPressure(i6);
                            }
                            i12 = i6 + 1;
                            i10 = 20;
                        }
                    }
                    Gdx.app.getGraphics().requestRendering();
                    return;
                case 3:
                    for (int i14 = 0; i14 < androidInput.realId.length; i14++) {
                        try {
                            androidInput.realId[i14] = -1;
                            androidInput.touchX[i14] = 0;
                            androidInput.touchY[i14] = 0;
                            androidInput.deltaX[i14] = 0;
                            androidInput.deltaY[i14] = 0;
                            androidInput.touched[i14] = false;
                            androidInput.button[i14] = 0;
                            androidInput.pressure[i14] = 0.0f;
                        } catch (Throwable th3) {
                            th = th3;
                            throw th;
                        }
                    }
                    Gdx.app.getGraphics().requestRendering();
                    return;
                default:
                    Gdx.app.getGraphics().requestRendering();
                    return;
            }
        }
    }

    private void logAction(int i, int i2) {
        String str;
        if (i == 0) {
            str = "DOWN";
        } else if (i == 5) {
            str = "POINTER DOWN";
        } else if (i == 1) {
            str = "UP";
        } else if (i == 6) {
            str = "POINTER UP";
        } else if (i == 4) {
            str = "OUTSIDE";
        } else if (i == 3) {
            str = "CANCEL";
        } else if (i == 2) {
            str = "MOVE";
        } else {
            str = "UNKNOWN (" + i + ")";
        }
        Gdx.app.log("AndroidMultiTouchHandler", "action " + str + ", Android pointer id: " + i2);
    }

    private void postTouchEvent(AndroidInput androidInput, int i, int i2, int i3, int i4, int i5, long j) {
        AndroidInput.TouchEvent obtain = androidInput.usedTouchEvents.obtain();
        obtain.timeStamp = j;
        obtain.pointer = i4;
        obtain.x = i2;
        obtain.y = i3;
        obtain.type = i;
        obtain.button = i5;
        androidInput.touchEvents.add(obtain);
    }

    @Override // com.badlogic.gdx.backends.android.AndroidTouchHandler
    public boolean supportsMultitouch(Context context) {
        return context.getPackageManager().hasSystemFeature("android.hardware.touchscreen.multitouch");
    }
}
