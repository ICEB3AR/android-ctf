package com.badlogic.gdx.backends.android;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Build;
import android.os.Handler;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Graphics;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.utils.IntSet;
import com.badlogic.gdx.utils.Pool;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class AndroidInput implements Input, View.OnKeyListener, View.OnTouchListener {
    public static final int NUM_TOUCHES = 20;
    public static final int SUPPORTED_KEYS = 260;
    final float[] R;
    public boolean accelerometerAvailable;
    private SensorEventListener accelerometerListener;
    protected final float[] accelerometerValues;
    final Application app;
    private float azimuth;
    int[] button = new int[20];
    private boolean compassAvailable;
    private SensorEventListener compassListener;
    private final AndroidApplicationConfiguration config;
    final Context context;
    private long currentEventTimeStamp;
    int[] deltaX = new int[20];
    int[] deltaY = new int[20];
    public boolean gyroscopeAvailable;
    private SensorEventListener gyroscopeListener;
    protected final float[] gyroscopeValues;
    private Handler handle;
    final boolean hasMultitouch;
    private float inclination;
    private boolean[] justPressedButtons;
    private boolean[] justPressedKeys;
    private boolean justTouched;
    private int keyCount;
    ArrayList<KeyEvent> keyEvents = new ArrayList<>();
    private boolean keyJustPressed;
    ArrayList<View.OnKeyListener> keyListeners = new ArrayList<>();
    boolean keyboardAvailable;
    private boolean[] keys;
    private IntSet keysToCatch;
    protected final float[] magneticFieldValues;
    private SensorManager manager;
    protected final Input.Orientation nativeOrientation;
    private final AndroidOnscreenKeyboard onscreenKeyboard;
    final float[] orientation;
    private float pitch;
    float[] pressure = new float[20];
    private InputProcessor processor;
    int[] realId = new int[20];
    boolean requestFocus;
    private float roll;
    private boolean rotationVectorAvailable;
    private SensorEventListener rotationVectorListener;
    protected final float[] rotationVectorValues;
    private int sleepTime;
    private String text;
    private Input.TextInputListener textListener;
    ArrayList<TouchEvent> touchEvents = new ArrayList<>();
    protected final AndroidTouchHandler touchHandler;
    int[] touchX = new int[20];
    int[] touchY = new int[20];
    boolean[] touched = new boolean[20];
    Pool<KeyEvent> usedKeyEvents = new Pool<KeyEvent>(16, 1000) {
        /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass1 */

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.utils.Pool
        public KeyEvent newObject() {
            return new KeyEvent();
        }
    };
    Pool<TouchEvent> usedTouchEvents = new Pool<TouchEvent>(16, 1000) {
        /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass2 */

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.utils.Pool
        public TouchEvent newObject() {
            return new TouchEvent();
        }
    };
    protected final Vibrator vibrator;

    @Override // com.badlogic.gdx.Input
    public int getMaxPointers() {
        return 20;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isCursorCatched() {
        return false;
    }

    @Override // com.badlogic.gdx.Input
    public void setCursorCatched(boolean z) {
    }

    @Override // com.badlogic.gdx.Input
    public void setCursorPosition(int i, int i2) {
    }

    /* access modifiers changed from: package-private */
    public static class KeyEvent {
        static final int KEY_DOWN = 0;
        static final int KEY_TYPED = 2;
        static final int KEY_UP = 1;
        char keyChar;
        int keyCode;
        long timeStamp;
        int type;

        KeyEvent() {
        }
    }

    /* access modifiers changed from: package-private */
    public static class TouchEvent {
        static final int TOUCH_DOWN = 0;
        static final int TOUCH_DRAGGED = 2;
        static final int TOUCH_MOVED = 4;
        static final int TOUCH_SCROLLED = 3;
        static final int TOUCH_UP = 1;
        int button;
        int pointer;
        int scrollAmount;
        long timeStamp;
        int type;
        int x;
        int y;

        TouchEvent() {
        }
    }

    public AndroidInput(Application application, Context context2, Object obj, AndroidApplicationConfiguration androidApplicationConfiguration) {
        int i = 0;
        this.keyCount = 0;
        this.keys = new boolean[SUPPORTED_KEYS];
        this.keyJustPressed = false;
        this.justPressedKeys = new boolean[SUPPORTED_KEYS];
        this.justPressedButtons = new boolean[20];
        this.accelerometerAvailable = false;
        this.accelerometerValues = new float[3];
        this.gyroscopeAvailable = false;
        this.gyroscopeValues = new float[3];
        this.text = null;
        this.textListener = null;
        this.sleepTime = 0;
        this.keysToCatch = new IntSet();
        this.compassAvailable = false;
        this.rotationVectorAvailable = false;
        this.magneticFieldValues = new float[3];
        this.rotationVectorValues = new float[3];
        this.azimuth = 0.0f;
        this.pitch = 0.0f;
        this.roll = 0.0f;
        this.inclination = 0.0f;
        this.justTouched = false;
        this.currentEventTimeStamp = 0;
        this.requestFocus = true;
        this.R = new float[9];
        this.orientation = new float[3];
        if (obj instanceof View) {
            View view = (View) obj;
            view.setOnKeyListener(this);
            view.setOnTouchListener(this);
            view.setFocusable(true);
            view.setFocusableInTouchMode(true);
            view.requestFocus();
        }
        this.config = androidApplicationConfiguration;
        this.onscreenKeyboard = new AndroidOnscreenKeyboard(context2, new Handler(), this);
        while (true) {
            int[] iArr = this.realId;
            if (i >= iArr.length) {
                break;
            }
            iArr[i] = -1;
            i++;
        }
        this.handle = new Handler();
        this.app = application;
        this.context = context2;
        this.sleepTime = androidApplicationConfiguration.touchSleepTime;
        this.touchHandler = new AndroidMultiTouchHandler();
        this.hasMultitouch = this.touchHandler.supportsMultitouch(context2);
        this.vibrator = (Vibrator) context2.getSystemService("vibrator");
        int rotation = getRotation();
        Graphics.DisplayMode displayMode = this.app.getGraphics().getDisplayMode();
        if (((rotation == 0 || rotation == 180) && displayMode.width >= displayMode.height) || ((rotation == 90 || rotation == 270) && displayMode.width <= displayMode.height)) {
            this.nativeOrientation = Input.Orientation.Landscape;
        } else {
            this.nativeOrientation = Input.Orientation.Portrait;
        }
        this.keysToCatch.add(255);
    }

    @Override // com.badlogic.gdx.Input
    public float getAccelerometerX() {
        return this.accelerometerValues[0];
    }

    @Override // com.badlogic.gdx.Input
    public float getAccelerometerY() {
        return this.accelerometerValues[1];
    }

    @Override // com.badlogic.gdx.Input
    public float getAccelerometerZ() {
        return this.accelerometerValues[2];
    }

    @Override // com.badlogic.gdx.Input
    public float getGyroscopeX() {
        return this.gyroscopeValues[0];
    }

    @Override // com.badlogic.gdx.Input
    public float getGyroscopeY() {
        return this.gyroscopeValues[1];
    }

    @Override // com.badlogic.gdx.Input
    public float getGyroscopeZ() {
        return this.gyroscopeValues[2];
    }

    @Override // com.badlogic.gdx.Input
    public void getTextInput(final Input.TextInputListener textInputListener, final String str, final String str2, final String str3) {
        this.handle.post(new Runnable() {
            /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass3 */

            public void run() {
                AlertDialog.Builder builder = new AlertDialog.Builder(AndroidInput.this.context);
                builder.setTitle(str);
                final EditText editText = new EditText(AndroidInput.this.context);
                editText.setHint(str3);
                editText.setText(str2);
                editText.setSingleLine();
                builder.setView(editText);
                builder.setPositiveButton(AndroidInput.this.context.getString(17039370), new DialogInterface.OnClickListener() {
                    /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass3.AnonymousClass1 */

                    public void onClick(DialogInterface dialogInterface, int i) {
                        Gdx.app.postRunnable(new Runnable() {
                            /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass3.AnonymousClass1.AnonymousClass1 */

                            public void run() {
                                textInputListener.input(editText.getText().toString());
                            }
                        });
                    }
                });
                builder.setNegativeButton(AndroidInput.this.context.getString(17039360), new DialogInterface.OnClickListener() {
                    /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass3.AnonymousClass2 */

                    public void onClick(DialogInterface dialogInterface, int i) {
                        Gdx.app.postRunnable(new Runnable() {
                            /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass3.AnonymousClass2.AnonymousClass1 */

                            public void run() {
                                textInputListener.canceled();
                            }
                        });
                    }
                });
                builder.setOnCancelListener(new DialogInterface.OnCancelListener() {
                    /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass3.AnonymousClass3 */

                    public void onCancel(DialogInterface dialogInterface) {
                        Gdx.app.postRunnable(new Runnable() {
                            /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass3.AnonymousClass3.AnonymousClass1 */

                            public void run() {
                                textInputListener.canceled();
                            }
                        });
                    }
                });
                builder.show();
            }
        });
    }

    @Override // com.badlogic.gdx.Input
    public int getX() {
        int i;
        synchronized (this) {
            i = this.touchX[0];
        }
        return i;
    }

    @Override // com.badlogic.gdx.Input
    public int getY() {
        int i;
        synchronized (this) {
            i = this.touchY[0];
        }
        return i;
    }

    @Override // com.badlogic.gdx.Input
    public int getX(int i) {
        int i2;
        synchronized (this) {
            i2 = this.touchX[i];
        }
        return i2;
    }

    @Override // com.badlogic.gdx.Input
    public int getY(int i) {
        int i2;
        synchronized (this) {
            i2 = this.touchY[i];
        }
        return i2;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isTouched(int i) {
        boolean z;
        synchronized (this) {
            z = this.touched[i];
        }
        return z;
    }

    @Override // com.badlogic.gdx.Input
    public float getPressure() {
        return getPressure(0);
    }

    @Override // com.badlogic.gdx.Input
    public float getPressure(int i) {
        return this.pressure[i];
    }

    @Override // com.badlogic.gdx.Input
    public synchronized boolean isKeyPressed(int i) {
        boolean z = false;
        if (i == -1) {
            if (this.keyCount > 0) {
                z = true;
            }
            return z;
        } else if (i < 0 || i >= 260) {
            return false;
        } else {
            return this.keys[i];
        }
    }

    @Override // com.badlogic.gdx.Input
    public synchronized boolean isKeyJustPressed(int i) {
        if (i == -1) {
            return this.keyJustPressed;
        } else if (i < 0 || i >= 260) {
            return false;
        } else {
            return this.justPressedKeys[i];
        }
    }

    @Override // com.badlogic.gdx.Input
    public boolean isTouched() {
        synchronized (this) {
            if (this.hasMultitouch) {
                for (int i = 0; i < 20; i++) {
                    if (this.touched[i]) {
                        return true;
                    }
                }
            }
            return this.touched[0];
        }
    }

    @Override // com.badlogic.gdx.Input
    public void setInputProcessor(InputProcessor inputProcessor) {
        synchronized (this) {
            this.processor = inputProcessor;
        }
    }

    /* access modifiers changed from: package-private */
    public void processEvents() {
        synchronized (this) {
            if (this.justTouched) {
                this.justTouched = false;
                for (int i = 0; i < this.justPressedButtons.length; i++) {
                    this.justPressedButtons[i] = false;
                }
            }
            if (this.keyJustPressed) {
                this.keyJustPressed = false;
                for (int i2 = 0; i2 < this.justPressedKeys.length; i2++) {
                    this.justPressedKeys[i2] = false;
                }
            }
            if (this.processor != null) {
                InputProcessor inputProcessor = this.processor;
                int size = this.keyEvents.size();
                for (int i3 = 0; i3 < size; i3++) {
                    KeyEvent keyEvent = this.keyEvents.get(i3);
                    this.currentEventTimeStamp = keyEvent.timeStamp;
                    int i4 = keyEvent.type;
                    if (i4 == 0) {
                        inputProcessor.keyDown(keyEvent.keyCode);
                        this.keyJustPressed = true;
                        this.justPressedKeys[keyEvent.keyCode] = true;
                    } else if (i4 == 1) {
                        inputProcessor.keyUp(keyEvent.keyCode);
                    } else if (i4 == 2) {
                        inputProcessor.keyTyped(keyEvent.keyChar);
                    }
                    this.usedKeyEvents.free(keyEvent);
                }
                int size2 = this.touchEvents.size();
                for (int i5 = 0; i5 < size2; i5++) {
                    TouchEvent touchEvent = this.touchEvents.get(i5);
                    this.currentEventTimeStamp = touchEvent.timeStamp;
                    int i6 = touchEvent.type;
                    if (i6 == 0) {
                        inputProcessor.touchDown(touchEvent.x, touchEvent.y, touchEvent.pointer, touchEvent.button);
                        this.justTouched = true;
                        this.justPressedButtons[touchEvent.button] = true;
                    } else if (i6 == 1) {
                        inputProcessor.touchUp(touchEvent.x, touchEvent.y, touchEvent.pointer, touchEvent.button);
                    } else if (i6 == 2) {
                        inputProcessor.touchDragged(touchEvent.x, touchEvent.y, touchEvent.pointer);
                    } else if (i6 == 3) {
                        inputProcessor.scrolled(touchEvent.scrollAmount);
                    } else if (i6 == 4) {
                        inputProcessor.mouseMoved(touchEvent.x, touchEvent.y);
                    }
                    this.usedTouchEvents.free(touchEvent);
                }
            } else {
                int size3 = this.touchEvents.size();
                for (int i7 = 0; i7 < size3; i7++) {
                    TouchEvent touchEvent2 = this.touchEvents.get(i7);
                    if (touchEvent2.type == 0) {
                        this.justTouched = true;
                    }
                    this.usedTouchEvents.free(touchEvent2);
                }
                int size4 = this.keyEvents.size();
                for (int i8 = 0; i8 < size4; i8++) {
                    this.usedKeyEvents.free(this.keyEvents.get(i8));
                }
            }
            if (this.touchEvents.isEmpty()) {
                for (int i9 = 0; i9 < this.deltaX.length; i9++) {
                    this.deltaX[0] = 0;
                    this.deltaY[0] = 0;
                }
            }
            this.keyEvents.clear();
            this.touchEvents.clear();
        }
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (this.requestFocus && view != null) {
            view.setFocusableInTouchMode(true);
            view.requestFocus();
            this.requestFocus = false;
        }
        this.touchHandler.onTouch(motionEvent, this);
        int i = this.sleepTime;
        if (i != 0) {
            try {
                Thread.sleep((long) i);
            } catch (InterruptedException unused) {
            }
        }
        return true;
    }

    public void onTap(int i, int i2) {
        postTap(i, i2);
    }

    public void onDrop(int i, int i2) {
        postTap(i, i2);
    }

    /* access modifiers changed from: protected */
    public void postTap(int i, int i2) {
        synchronized (this) {
            TouchEvent obtain = this.usedTouchEvents.obtain();
            obtain.timeStamp = System.nanoTime();
            obtain.pointer = 0;
            obtain.x = i;
            obtain.y = i2;
            obtain.type = 0;
            this.touchEvents.add(obtain);
            TouchEvent obtain2 = this.usedTouchEvents.obtain();
            obtain2.timeStamp = System.nanoTime();
            obtain2.pointer = 0;
            obtain2.x = i;
            obtain2.y = i2;
            obtain2.type = 1;
            this.touchEvents.add(obtain2);
        }
        Gdx.app.getGraphics().requestRendering();
    }

    public boolean onKey(View view, int i, android.view.KeyEvent keyEvent) {
        int size = this.keyListeners.size();
        for (int i2 = 0; i2 < size; i2++) {
            if (this.keyListeners.get(i2).onKey(view, i, keyEvent)) {
                return true;
            }
        }
        if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() > 0) {
            return this.keysToCatch.contains(i);
        }
        synchronized (this) {
            if (keyEvent.getKeyCode() == 0 && keyEvent.getAction() == 2) {
                String characters = keyEvent.getCharacters();
                for (int i3 = 0; i3 < characters.length(); i3++) {
                    KeyEvent obtain = this.usedKeyEvents.obtain();
                    obtain.timeStamp = System.nanoTime();
                    obtain.keyCode = 0;
                    obtain.keyChar = characters.charAt(i3);
                    obtain.type = 2;
                    this.keyEvents.add(obtain);
                }
                return false;
            }
            char unicodeChar = (char) keyEvent.getUnicodeChar();
            if (i == 67) {
                unicodeChar = '\b';
            }
            if (keyEvent.getKeyCode() >= 0) {
                if (keyEvent.getKeyCode() < 260) {
                    int action = keyEvent.getAction();
                    if (action == 0) {
                        KeyEvent obtain2 = this.usedKeyEvents.obtain();
                        obtain2.timeStamp = System.nanoTime();
                        obtain2.keyChar = 0;
                        obtain2.keyCode = keyEvent.getKeyCode();
                        obtain2.type = 0;
                        if (i == 4 && keyEvent.isAltPressed()) {
                            obtain2.keyCode = 255;
                            i = 255;
                        }
                        this.keyEvents.add(obtain2);
                        if (!this.keys[obtain2.keyCode]) {
                            this.keyCount++;
                            this.keys[obtain2.keyCode] = true;
                        }
                    } else if (action == 1) {
                        long nanoTime = System.nanoTime();
                        KeyEvent obtain3 = this.usedKeyEvents.obtain();
                        obtain3.timeStamp = nanoTime;
                        obtain3.keyChar = 0;
                        obtain3.keyCode = keyEvent.getKeyCode();
                        obtain3.type = 1;
                        if (i == 4 && keyEvent.isAltPressed()) {
                            obtain3.keyCode = 255;
                            i = 255;
                        }
                        this.keyEvents.add(obtain3);
                        KeyEvent obtain4 = this.usedKeyEvents.obtain();
                        obtain4.timeStamp = nanoTime;
                        obtain4.keyChar = unicodeChar;
                        obtain4.keyCode = 0;
                        obtain4.type = 2;
                        this.keyEvents.add(obtain4);
                        if (i == 255) {
                            if (this.keys[255]) {
                                this.keyCount--;
                                this.keys[255] = false;
                            }
                        } else if (this.keys[keyEvent.getKeyCode()]) {
                            this.keyCount--;
                            this.keys[keyEvent.getKeyCode()] = false;
                        }
                    }
                    this.app.getGraphics().requestRendering();
                    return this.keysToCatch.contains(i);
                }
            }
            return false;
        }
    }

    @Override // com.badlogic.gdx.Input
    public void setOnscreenKeyboardVisible(final boolean z) {
        this.handle.post(new Runnable() {
            /* class com.badlogic.gdx.backends.android.AndroidInput.AnonymousClass4 */

            public void run() {
                InputMethodManager inputMethodManager = (InputMethodManager) AndroidInput.this.context.getSystemService("input_method");
                if (z) {
                    View view = ((AndroidGraphics) AndroidInput.this.app.getGraphics()).getView();
                    view.setFocusable(true);
                    view.setFocusableInTouchMode(true);
                    inputMethodManager.showSoftInput(((AndroidGraphics) AndroidInput.this.app.getGraphics()).getView(), 0);
                    return;
                }
                inputMethodManager.hideSoftInputFromWindow(((AndroidGraphics) AndroidInput.this.app.getGraphics()).getView().getWindowToken(), 0);
            }
        });
    }

    @Override // com.badlogic.gdx.Input
    public void setCatchBackKey(boolean z) {
        setCatchKey(4, z);
    }

    @Override // com.badlogic.gdx.Input
    public boolean isCatchBackKey() {
        return this.keysToCatch.contains(4);
    }

    @Override // com.badlogic.gdx.Input
    public void setCatchMenuKey(boolean z) {
        setCatchKey(82, z);
    }

    @Override // com.badlogic.gdx.Input
    public boolean isCatchMenuKey() {
        return this.keysToCatch.contains(82);
    }

    @Override // com.badlogic.gdx.Input
    public void setCatchKey(int i, boolean z) {
        if (!z) {
            this.keysToCatch.remove(i);
        } else if (z) {
            this.keysToCatch.add(i);
        }
    }

    @Override // com.badlogic.gdx.Input
    public boolean isCatchKey(int i) {
        return this.keysToCatch.contains(this.keyCount);
    }

    @Override // com.badlogic.gdx.Input
    public void vibrate(int i) {
        if (Build.VERSION.SDK_INT >= 26) {
            this.vibrator.vibrate(VibrationEffect.createOneShot((long) i, -1));
        } else {
            this.vibrator.vibrate((long) i);
        }
    }

    @Override // com.badlogic.gdx.Input
    public void vibrate(long[] jArr, int i) {
        if (Build.VERSION.SDK_INT >= 26) {
            this.vibrator.vibrate(VibrationEffect.createWaveform(jArr, i));
        } else {
            this.vibrator.vibrate(jArr, i);
        }
    }

    @Override // com.badlogic.gdx.Input
    public void cancelVibrate() {
        this.vibrator.cancel();
    }

    @Override // com.badlogic.gdx.Input
    public boolean justTouched() {
        return this.justTouched;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isButtonPressed(int i) {
        synchronized (this) {
            boolean z = true;
            if (this.hasMultitouch) {
                for (int i2 = 0; i2 < 20; i2++) {
                    if (this.touched[i2] && this.button[i2] == i) {
                        return true;
                    }
                }
            }
            if (!this.touched[0] || this.button[0] != i) {
                z = false;
            }
            return z;
        }
    }

    @Override // com.badlogic.gdx.Input
    public boolean isButtonJustPressed(int i) {
        if (i < 0 || i > 20) {
            return false;
        }
        return this.justPressedButtons[i];
    }

    private void updateOrientation() {
        if (this.rotationVectorAvailable) {
            SensorManager.getRotationMatrixFromVector(this.R, this.rotationVectorValues);
        } else if (!SensorManager.getRotationMatrix(this.R, null, this.accelerometerValues, this.magneticFieldValues)) {
            return;
        }
        SensorManager.getOrientation(this.R, this.orientation);
        this.azimuth = (float) Math.toDegrees((double) this.orientation[0]);
        this.pitch = (float) Math.toDegrees((double) this.orientation[1]);
        this.roll = (float) Math.toDegrees((double) this.orientation[2]);
    }

    @Override // com.badlogic.gdx.Input
    public void getRotationMatrix(float[] fArr) {
        if (this.rotationVectorAvailable) {
            SensorManager.getRotationMatrixFromVector(fArr, this.rotationVectorValues);
        } else {
            SensorManager.getRotationMatrix(fArr, null, this.accelerometerValues, this.magneticFieldValues);
        }
    }

    @Override // com.badlogic.gdx.Input
    public float getAzimuth() {
        if (!this.compassAvailable && !this.rotationVectorAvailable) {
            return 0.0f;
        }
        updateOrientation();
        return this.azimuth;
    }

    @Override // com.badlogic.gdx.Input
    public float getPitch() {
        if (!this.compassAvailable && !this.rotationVectorAvailable) {
            return 0.0f;
        }
        updateOrientation();
        return this.pitch;
    }

    @Override // com.badlogic.gdx.Input
    public float getRoll() {
        if (!this.compassAvailable && !this.rotationVectorAvailable) {
            return 0.0f;
        }
        updateOrientation();
        return this.roll;
    }

    /* access modifiers changed from: package-private */
    public void registerSensorListeners() {
        if (this.config.useAccelerometer) {
            this.manager = (SensorManager) this.context.getSystemService("sensor");
            if (this.manager.getSensorList(1).isEmpty()) {
                this.accelerometerAvailable = false;
            } else {
                this.accelerometerListener = new SensorListener();
                this.accelerometerAvailable = this.manager.registerListener(this.accelerometerListener, this.manager.getSensorList(1).get(0), this.config.sensorDelay);
            }
        } else {
            this.accelerometerAvailable = false;
        }
        if (this.config.useGyroscope) {
            this.manager = (SensorManager) this.context.getSystemService("sensor");
            if (this.manager.getSensorList(4).isEmpty()) {
                this.gyroscopeAvailable = false;
            } else {
                this.gyroscopeListener = new SensorListener();
                this.gyroscopeAvailable = this.manager.registerListener(this.gyroscopeListener, this.manager.getSensorList(4).get(0), this.config.sensorDelay);
            }
        } else {
            this.gyroscopeAvailable = false;
        }
        this.rotationVectorAvailable = false;
        if (this.config.useRotationVectorSensor) {
            if (this.manager == null) {
                this.manager = (SensorManager) this.context.getSystemService("sensor");
            }
            List<Sensor> sensorList = this.manager.getSensorList(11);
            if (!sensorList.isEmpty()) {
                this.rotationVectorListener = new SensorListener();
                Iterator<Sensor> it = sensorList.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Sensor next = it.next();
                    if (next.getVendor().equals("Google Inc.") && next.getVersion() == 3) {
                        this.rotationVectorAvailable = this.manager.registerListener(this.rotationVectorListener, next, this.config.sensorDelay);
                        break;
                    }
                }
                if (!this.rotationVectorAvailable) {
                    this.rotationVectorAvailable = this.manager.registerListener(this.rotationVectorListener, sensorList.get(0), this.config.sensorDelay);
                }
            }
        }
        if (!this.config.useCompass || this.rotationVectorAvailable) {
            this.compassAvailable = false;
        } else {
            if (this.manager == null) {
                this.manager = (SensorManager) this.context.getSystemService("sensor");
            }
            Sensor defaultSensor = this.manager.getDefaultSensor(2);
            if (defaultSensor != null) {
                this.compassAvailable = this.accelerometerAvailable;
                if (this.compassAvailable) {
                    this.compassListener = new SensorListener();
                    this.compassAvailable = this.manager.registerListener(this.compassListener, defaultSensor, this.config.sensorDelay);
                }
            } else {
                this.compassAvailable = false;
            }
        }
        Gdx.app.log("AndroidInput", "sensor listener setup");
    }

    /* access modifiers changed from: package-private */
    public void unregisterSensorListeners() {
        SensorManager sensorManager = this.manager;
        if (sensorManager != null) {
            SensorEventListener sensorEventListener = this.accelerometerListener;
            if (sensorEventListener != null) {
                sensorManager.unregisterListener(sensorEventListener);
                this.accelerometerListener = null;
            }
            SensorEventListener sensorEventListener2 = this.gyroscopeListener;
            if (sensorEventListener2 != null) {
                this.manager.unregisterListener(sensorEventListener2);
                this.gyroscopeListener = null;
            }
            SensorEventListener sensorEventListener3 = this.rotationVectorListener;
            if (sensorEventListener3 != null) {
                this.manager.unregisterListener(sensorEventListener3);
                this.rotationVectorListener = null;
            }
            SensorEventListener sensorEventListener4 = this.compassListener;
            if (sensorEventListener4 != null) {
                this.manager.unregisterListener(sensorEventListener4);
                this.compassListener = null;
            }
            this.manager = null;
        }
        Gdx.app.log("AndroidInput", "sensor listener tear down");
    }

    @Override // com.badlogic.gdx.Input
    public InputProcessor getInputProcessor() {
        return this.processor;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isPeripheralAvailable(Input.Peripheral peripheral) {
        if (peripheral == Input.Peripheral.Accelerometer) {
            return this.accelerometerAvailable;
        }
        if (peripheral == Input.Peripheral.Gyroscope) {
            return this.gyroscopeAvailable;
        }
        if (peripheral == Input.Peripheral.Compass) {
            return this.compassAvailable;
        }
        if (peripheral == Input.Peripheral.HardwareKeyboard) {
            return this.keyboardAvailable;
        }
        if (peripheral == Input.Peripheral.OnscreenKeyboard) {
            return true;
        }
        if (peripheral == Input.Peripheral.Vibrator) {
            if (Build.VERSION.SDK_INT >= 11) {
                Vibrator vibrator2 = this.vibrator;
                if (vibrator2 == null || !vibrator2.hasVibrator()) {
                    return false;
                }
                return true;
            } else if (this.vibrator != null) {
                return true;
            } else {
                return false;
            }
        } else if (peripheral == Input.Peripheral.MultitouchScreen) {
            return this.hasMultitouch;
        } else {
            if (peripheral == Input.Peripheral.RotationVector) {
                return this.rotationVectorAvailable;
            }
            if (peripheral == Input.Peripheral.Pressure) {
                return true;
            }
            return false;
        }
    }

    public int getFreePointerIndex() {
        int length = this.realId.length;
        for (int i = 0; i < length; i++) {
            if (this.realId[i] == -1) {
                return i;
            }
        }
        this.realId = resize(this.realId);
        this.touchX = resize(this.touchX);
        this.touchY = resize(this.touchY);
        this.deltaX = resize(this.deltaX);
        this.deltaY = resize(this.deltaY);
        this.touched = resize(this.touched);
        this.button = resize(this.button);
        return length;
    }

    private int[] resize(int[] iArr) {
        int[] iArr2 = new int[(iArr.length + 2)];
        System.arraycopy(iArr, 0, iArr2, 0, iArr.length);
        return iArr2;
    }

    private boolean[] resize(boolean[] zArr) {
        boolean[] zArr2 = new boolean[(zArr.length + 2)];
        System.arraycopy(zArr, 0, zArr2, 0, zArr.length);
        return zArr2;
    }

    public int lookUpPointerIndex(int i) {
        int length = this.realId.length;
        for (int i2 = 0; i2 < length; i2++) {
            if (this.realId[i2] == i) {
                return i2;
            }
        }
        StringBuilder sb = new StringBuilder();
        for (int i3 = 0; i3 < length; i3++) {
            sb.append(i3 + ":" + this.realId[i3] + " ");
        }
        Application application = Gdx.app;
        application.log("AndroidInput", "Pointer ID lookup failed: " + i + ", " + sb.toString());
        return -1;
    }

    @Override // com.badlogic.gdx.Input
    public int getRotation() {
        int i;
        Context context2 = this.context;
        if (context2 instanceof Activity) {
            i = ((Activity) context2).getWindowManager().getDefaultDisplay().getRotation();
        } else {
            i = ((WindowManager) context2.getSystemService("window")).getDefaultDisplay().getRotation();
        }
        if (i == 0) {
            return 0;
        }
        if (i == 1) {
            return 90;
        }
        if (i != 2) {
            return i != 3 ? 0 : 270;
        }
        return 180;
    }

    @Override // com.badlogic.gdx.Input
    public Input.Orientation getNativeOrientation() {
        return this.nativeOrientation;
    }

    @Override // com.badlogic.gdx.Input
    public int getDeltaX() {
        return this.deltaX[0];
    }

    @Override // com.badlogic.gdx.Input
    public int getDeltaX(int i) {
        return this.deltaX[i];
    }

    @Override // com.badlogic.gdx.Input
    public int getDeltaY() {
        return this.deltaY[0];
    }

    @Override // com.badlogic.gdx.Input
    public int getDeltaY(int i) {
        return this.deltaY[i];
    }

    @Override // com.badlogic.gdx.Input
    public long getCurrentEventTime() {
        return this.currentEventTimeStamp;
    }

    public void addKeyListener(View.OnKeyListener onKeyListener) {
        this.keyListeners.add(onKeyListener);
    }

    public void onPause() {
        unregisterSensorListeners();
        Arrays.fill(this.realId, -1);
        Arrays.fill(this.touched, false);
    }

    public void onResume() {
        registerSensorListeners();
    }

    /* access modifiers changed from: private */
    public class SensorListener implements SensorEventListener {
        public void onAccuracyChanged(Sensor sensor, int i) {
        }

        public SensorListener() {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            if (sensorEvent.sensor.getType() == 1) {
                if (AndroidInput.this.nativeOrientation == Input.Orientation.Portrait) {
                    System.arraycopy(sensorEvent.values, 0, AndroidInput.this.accelerometerValues, 0, AndroidInput.this.accelerometerValues.length);
                } else {
                    AndroidInput.this.accelerometerValues[0] = sensorEvent.values[1];
                    AndroidInput.this.accelerometerValues[1] = -sensorEvent.values[0];
                    AndroidInput.this.accelerometerValues[2] = sensorEvent.values[2];
                }
            }
            if (sensorEvent.sensor.getType() == 2) {
                System.arraycopy(sensorEvent.values, 0, AndroidInput.this.magneticFieldValues, 0, AndroidInput.this.magneticFieldValues.length);
            }
            if (sensorEvent.sensor.getType() == 4) {
                if (AndroidInput.this.nativeOrientation == Input.Orientation.Portrait) {
                    System.arraycopy(sensorEvent.values, 0, AndroidInput.this.gyroscopeValues, 0, AndroidInput.this.gyroscopeValues.length);
                } else {
                    AndroidInput.this.gyroscopeValues[0] = sensorEvent.values[1];
                    AndroidInput.this.gyroscopeValues[1] = -sensorEvent.values[0];
                    AndroidInput.this.gyroscopeValues[2] = sensorEvent.values[2];
                }
            }
            if (sensorEvent.sensor.getType() != 11) {
                return;
            }
            if (AndroidInput.this.nativeOrientation == Input.Orientation.Portrait) {
                System.arraycopy(sensorEvent.values, 0, AndroidInput.this.rotationVectorValues, 0, AndroidInput.this.rotationVectorValues.length);
                return;
            }
            AndroidInput.this.rotationVectorValues[0] = sensorEvent.values[1];
            AndroidInput.this.rotationVectorValues[1] = -sensorEvent.values[0];
            AndroidInput.this.rotationVectorValues[2] = sensorEvent.values[2];
        }
    }
}
