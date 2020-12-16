package com.badlogic.gdx.input;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.InputProcessor;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.DataInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class RemoteInput implements Runnable, Input {
    public static int DEFAULT_PORT = 8190;
    private static final int MAX_TOUCHES = 20;
    private float[] accel;
    private float[] compass;
    private boolean connected;
    int[] deltaX;
    int[] deltaY;
    private float[] gyrate;
    public final String[] ips;
    boolean[] isTouched;
    boolean[] justPressedKeys;
    boolean justTouched;
    int keyCount;
    boolean keyJustPressed;
    boolean[] keys;
    private RemoteInputListener listener;
    private boolean multiTouch;
    private final int port;
    InputProcessor processor;
    private float remoteHeight;
    private float remoteWidth;
    private ServerSocket serverSocket;
    int[] touchX;
    int[] touchY;

    public interface RemoteInputListener {
        void onConnected();

        void onDisconnected();
    }

    @Override // com.badlogic.gdx.Input
    public void cancelVibrate() {
    }

    @Override // com.badlogic.gdx.Input
    public long getCurrentEventTime() {
        return 0;
    }

    @Override // com.badlogic.gdx.Input
    public int getMaxPointers() {
        return 20;
    }

    @Override // com.badlogic.gdx.Input
    public int getRotation() {
        return 0;
    }

    @Override // com.badlogic.gdx.Input
    public void getRotationMatrix(float[] fArr) {
    }

    @Override // com.badlogic.gdx.Input
    public boolean isCatchBackKey() {
        return false;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isCatchKey(int i) {
        return false;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isCatchMenuKey() {
        return false;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isCursorCatched() {
        return false;
    }

    @Override // com.badlogic.gdx.Input
    public void setCatchBackKey(boolean z) {
    }

    @Override // com.badlogic.gdx.Input
    public void setCatchKey(int i, boolean z) {
    }

    @Override // com.badlogic.gdx.Input
    public void setCatchMenuKey(boolean z) {
    }

    @Override // com.badlogic.gdx.Input
    public void setCursorCatched(boolean z) {
    }

    @Override // com.badlogic.gdx.Input
    public void setCursorPosition(int i, int i2) {
    }

    @Override // com.badlogic.gdx.Input
    public void setOnscreenKeyboardVisible(boolean z) {
    }

    @Override // com.badlogic.gdx.Input
    public void vibrate(int i) {
    }

    @Override // com.badlogic.gdx.Input
    public void vibrate(long[] jArr, int i) {
    }

    class KeyEvent {
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

    class TouchEvent {
        static final int TOUCH_DOWN = 0;
        static final int TOUCH_DRAGGED = 2;
        static final int TOUCH_UP = 1;
        int pointer;
        long timeStamp;
        int type;
        int x;
        int y;

        TouchEvent() {
        }
    }

    class EventTrigger implements Runnable {
        KeyEvent keyEvent;
        TouchEvent touchEvent;

        public EventTrigger(TouchEvent touchEvent2, KeyEvent keyEvent2) {
            this.touchEvent = touchEvent2;
            this.keyEvent = keyEvent2;
        }

        public void run() {
            RemoteInput remoteInput = RemoteInput.this;
            remoteInput.justTouched = false;
            if (remoteInput.keyJustPressed) {
                RemoteInput.this.keyJustPressed = false;
                for (int i = 0; i < RemoteInput.this.justPressedKeys.length; i++) {
                    RemoteInput.this.justPressedKeys[i] = false;
                }
            }
            if (RemoteInput.this.processor != null) {
                TouchEvent touchEvent2 = this.touchEvent;
                if (touchEvent2 != null) {
                    int i2 = touchEvent2.type;
                    if (i2 == 0) {
                        RemoteInput.this.deltaX[this.touchEvent.pointer] = 0;
                        RemoteInput.this.deltaY[this.touchEvent.pointer] = 0;
                        RemoteInput.this.processor.touchDown(this.touchEvent.x, this.touchEvent.y, this.touchEvent.pointer, 0);
                        RemoteInput.this.isTouched[this.touchEvent.pointer] = true;
                        RemoteInput.this.justTouched = true;
                    } else if (i2 == 1) {
                        RemoteInput.this.deltaX[this.touchEvent.pointer] = 0;
                        RemoteInput.this.deltaY[this.touchEvent.pointer] = 0;
                        RemoteInput.this.processor.touchUp(this.touchEvent.x, this.touchEvent.y, this.touchEvent.pointer, 0);
                        RemoteInput.this.isTouched[this.touchEvent.pointer] = false;
                    } else if (i2 == 2) {
                        RemoteInput.this.deltaX[this.touchEvent.pointer] = this.touchEvent.x - RemoteInput.this.touchX[this.touchEvent.pointer];
                        RemoteInput.this.deltaY[this.touchEvent.pointer] = this.touchEvent.y - RemoteInput.this.touchY[this.touchEvent.pointer];
                        RemoteInput.this.processor.touchDragged(this.touchEvent.x, this.touchEvent.y, this.touchEvent.pointer);
                    }
                    RemoteInput.this.touchX[this.touchEvent.pointer] = this.touchEvent.x;
                    RemoteInput.this.touchY[this.touchEvent.pointer] = this.touchEvent.y;
                }
                KeyEvent keyEvent2 = this.keyEvent;
                if (keyEvent2 != null) {
                    int i3 = keyEvent2.type;
                    if (i3 == 0) {
                        RemoteInput.this.processor.keyDown(this.keyEvent.keyCode);
                        if (!RemoteInput.this.keys[this.keyEvent.keyCode]) {
                            RemoteInput.this.keyCount++;
                            RemoteInput.this.keys[this.keyEvent.keyCode] = true;
                        }
                        RemoteInput remoteInput2 = RemoteInput.this;
                        remoteInput2.keyJustPressed = true;
                        remoteInput2.justPressedKeys[this.keyEvent.keyCode] = true;
                    } else if (i3 == 1) {
                        RemoteInput.this.processor.keyUp(this.keyEvent.keyCode);
                        if (RemoteInput.this.keys[this.keyEvent.keyCode]) {
                            RemoteInput.this.keyCount--;
                            RemoteInput.this.keys[this.keyEvent.keyCode] = false;
                        }
                    } else if (i3 == 2) {
                        RemoteInput.this.processor.keyTyped(this.keyEvent.keyChar);
                    }
                }
            } else {
                TouchEvent touchEvent3 = this.touchEvent;
                if (touchEvent3 != null) {
                    int i4 = touchEvent3.type;
                    if (i4 == 0) {
                        RemoteInput.this.deltaX[this.touchEvent.pointer] = 0;
                        RemoteInput.this.deltaY[this.touchEvent.pointer] = 0;
                        RemoteInput.this.isTouched[this.touchEvent.pointer] = true;
                        RemoteInput.this.justTouched = true;
                    } else if (i4 == 1) {
                        RemoteInput.this.deltaX[this.touchEvent.pointer] = 0;
                        RemoteInput.this.deltaY[this.touchEvent.pointer] = 0;
                        RemoteInput.this.isTouched[this.touchEvent.pointer] = false;
                    } else if (i4 == 2) {
                        RemoteInput.this.deltaX[this.touchEvent.pointer] = this.touchEvent.x - RemoteInput.this.touchX[this.touchEvent.pointer];
                        RemoteInput.this.deltaY[this.touchEvent.pointer] = this.touchEvent.y - RemoteInput.this.touchY[this.touchEvent.pointer];
                    }
                    RemoteInput.this.touchX[this.touchEvent.pointer] = this.touchEvent.x;
                    RemoteInput.this.touchY[this.touchEvent.pointer] = this.touchEvent.y;
                }
                KeyEvent keyEvent3 = this.keyEvent;
                if (keyEvent3 != null) {
                    if (keyEvent3.type == 0) {
                        if (!RemoteInput.this.keys[this.keyEvent.keyCode]) {
                            RemoteInput.this.keyCount++;
                            RemoteInput.this.keys[this.keyEvent.keyCode] = true;
                        }
                        RemoteInput remoteInput3 = RemoteInput.this;
                        remoteInput3.keyJustPressed = true;
                        remoteInput3.justPressedKeys[this.keyEvent.keyCode] = true;
                    }
                    if (this.keyEvent.type == 1 && RemoteInput.this.keys[this.keyEvent.keyCode]) {
                        RemoteInput.this.keyCount--;
                        RemoteInput.this.keys[this.keyEvent.keyCode] = false;
                    }
                }
            }
        }
    }

    public RemoteInput() {
        this(DEFAULT_PORT);
    }

    public RemoteInput(RemoteInputListener remoteInputListener) {
        this(DEFAULT_PORT, remoteInputListener);
    }

    public RemoteInput(int i) {
        this(i, null);
    }

    public RemoteInput(int i, RemoteInputListener remoteInputListener) {
        this.accel = new float[3];
        this.gyrate = new float[3];
        this.compass = new float[3];
        this.multiTouch = false;
        this.remoteWidth = 0.0f;
        this.remoteHeight = 0.0f;
        this.connected = false;
        this.keyCount = 0;
        this.keys = new boolean[256];
        this.keyJustPressed = false;
        this.justPressedKeys = new boolean[256];
        this.deltaX = new int[20];
        this.deltaY = new int[20];
        this.touchX = new int[20];
        this.touchY = new int[20];
        this.isTouched = new boolean[20];
        this.justTouched = false;
        this.processor = null;
        this.listener = remoteInputListener;
        try {
            this.port = i;
            this.serverSocket = new ServerSocket(i);
            Thread thread = new Thread(this);
            thread.setDaemon(true);
            thread.start();
            InetAddress[] allByName = InetAddress.getAllByName(InetAddress.getLocalHost().getHostName());
            this.ips = new String[allByName.length];
            for (int i2 = 0; i2 < allByName.length; i2++) {
                this.ips[i2] = allByName[i2].getHostAddress();
            }
        } catch (Exception e) {
            throw new GdxRuntimeException("Couldn't open listening socket at port '" + i + "'", e);
        }
    }

    public void run() {
        KeyEvent keyEvent;
        TouchEvent touchEvent;
        while (true) {
            try {
                this.connected = false;
                break;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (this.listener != null) {
            this.listener.onDisconnected();
        }
        System.out.println("listening, port " + this.port);
        Socket accept = this.serverSocket.accept();
        accept.setTcpNoDelay(true);
        accept.setSoTimeout(3000);
        this.connected = true;
        if (this.listener != null) {
            this.listener.onConnected();
        }
        DataInputStream dataInputStream = new DataInputStream(accept.getInputStream());
        this.multiTouch = dataInputStream.readBoolean();
        while (true) {
            TouchEvent touchEvent2 = null;
            switch (dataInputStream.readInt()) {
                case 0:
                    keyEvent = new KeyEvent();
                    keyEvent.keyCode = dataInputStream.readInt();
                    keyEvent.type = 0;
                    break;
                case 1:
                    keyEvent = new KeyEvent();
                    keyEvent.keyCode = dataInputStream.readInt();
                    keyEvent.type = 1;
                    break;
                case 2:
                    keyEvent = new KeyEvent();
                    keyEvent.keyChar = dataInputStream.readChar();
                    keyEvent.type = 2;
                    break;
                case 3:
                    touchEvent = new TouchEvent();
                    touchEvent.x = (int) ((((float) dataInputStream.readInt()) / this.remoteWidth) * ((float) Gdx.graphics.getWidth()));
                    touchEvent.y = (int) ((((float) dataInputStream.readInt()) / this.remoteHeight) * ((float) Gdx.graphics.getHeight()));
                    touchEvent.pointer = dataInputStream.readInt();
                    touchEvent.type = 0;
                    touchEvent2 = touchEvent;
                    keyEvent = null;
                    break;
                case 4:
                    touchEvent = new TouchEvent();
                    touchEvent.x = (int) ((((float) dataInputStream.readInt()) / this.remoteWidth) * ((float) Gdx.graphics.getWidth()));
                    touchEvent.y = (int) ((((float) dataInputStream.readInt()) / this.remoteHeight) * ((float) Gdx.graphics.getHeight()));
                    touchEvent.pointer = dataInputStream.readInt();
                    touchEvent.type = 1;
                    touchEvent2 = touchEvent;
                    keyEvent = null;
                    break;
                case 5:
                    touchEvent = new TouchEvent();
                    touchEvent.x = (int) ((((float) dataInputStream.readInt()) / this.remoteWidth) * ((float) Gdx.graphics.getWidth()));
                    touchEvent.y = (int) ((((float) dataInputStream.readInt()) / this.remoteHeight) * ((float) Gdx.graphics.getHeight()));
                    touchEvent.pointer = dataInputStream.readInt();
                    touchEvent.type = 2;
                    touchEvent2 = touchEvent;
                    keyEvent = null;
                    break;
                case 6:
                    this.accel[0] = dataInputStream.readFloat();
                    this.accel[1] = dataInputStream.readFloat();
                    this.accel[2] = dataInputStream.readFloat();
                    keyEvent = null;
                    break;
                case 7:
                    this.compass[0] = dataInputStream.readFloat();
                    this.compass[1] = dataInputStream.readFloat();
                    this.compass[2] = dataInputStream.readFloat();
                    keyEvent = null;
                    break;
                case 8:
                    this.remoteWidth = dataInputStream.readFloat();
                    this.remoteHeight = dataInputStream.readFloat();
                    keyEvent = null;
                    break;
                case 9:
                    this.gyrate[0] = dataInputStream.readFloat();
                    this.gyrate[1] = dataInputStream.readFloat();
                    this.gyrate[2] = dataInputStream.readFloat();
                    keyEvent = null;
                    break;
                default:
                    keyEvent = null;
                    break;
            }
            Gdx.app.postRunnable(new EventTrigger(touchEvent2, keyEvent));
        }
    }

    public boolean isConnected() {
        return this.connected;
    }

    @Override // com.badlogic.gdx.Input
    public float getAccelerometerX() {
        return this.accel[0];
    }

    @Override // com.badlogic.gdx.Input
    public float getAccelerometerY() {
        return this.accel[1];
    }

    @Override // com.badlogic.gdx.Input
    public float getAccelerometerZ() {
        return this.accel[2];
    }

    @Override // com.badlogic.gdx.Input
    public float getGyroscopeX() {
        return this.gyrate[0];
    }

    @Override // com.badlogic.gdx.Input
    public float getGyroscopeY() {
        return this.gyrate[1];
    }

    @Override // com.badlogic.gdx.Input
    public float getGyroscopeZ() {
        return this.gyrate[2];
    }

    @Override // com.badlogic.gdx.Input
    public int getX() {
        return this.touchX[0];
    }

    @Override // com.badlogic.gdx.Input
    public int getX(int i) {
        return this.touchX[i];
    }

    @Override // com.badlogic.gdx.Input
    public int getY() {
        return this.touchY[0];
    }

    @Override // com.badlogic.gdx.Input
    public int getY(int i) {
        return this.touchY[i];
    }

    @Override // com.badlogic.gdx.Input
    public boolean isTouched() {
        return this.isTouched[0];
    }

    @Override // com.badlogic.gdx.Input
    public boolean justTouched() {
        return this.justTouched;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isTouched(int i) {
        return this.isTouched[i];
    }

    @Override // com.badlogic.gdx.Input
    public float getPressure() {
        return getPressure(0);
    }

    @Override // com.badlogic.gdx.Input
    public float getPressure(int i) {
        return isTouched(i) ? 1.0f : 0.0f;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isButtonPressed(int i) {
        if (i != 0) {
            return false;
        }
        int i2 = 0;
        while (true) {
            boolean[] zArr = this.isTouched;
            if (i2 >= zArr.length) {
                return false;
            }
            if (zArr[i2]) {
                return true;
            }
            i2++;
        }
    }

    @Override // com.badlogic.gdx.Input
    public boolean isButtonJustPressed(int i) {
        return i == 0 && this.justTouched;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isKeyPressed(int i) {
        if (i == -1) {
            return this.keyCount > 0;
        }
        if (i < 0 || i > 255) {
            return false;
        }
        return this.keys[i];
    }

    @Override // com.badlogic.gdx.Input
    public boolean isKeyJustPressed(int i) {
        if (i == -1) {
            return this.keyJustPressed;
        }
        if (i < 0 || i > 255) {
            return false;
        }
        return this.justPressedKeys[i];
    }

    @Override // com.badlogic.gdx.Input
    public void getTextInput(Input.TextInputListener textInputListener, String str, String str2, String str3) {
        Gdx.app.getInput().getTextInput(textInputListener, str, str2, str3);
    }

    @Override // com.badlogic.gdx.Input
    public float getAzimuth() {
        return this.compass[0];
    }

    @Override // com.badlogic.gdx.Input
    public float getPitch() {
        return this.compass[1];
    }

    @Override // com.badlogic.gdx.Input
    public float getRoll() {
        return this.compass[2];
    }

    @Override // com.badlogic.gdx.Input
    public void setInputProcessor(InputProcessor inputProcessor) {
        this.processor = inputProcessor;
    }

    @Override // com.badlogic.gdx.Input
    public InputProcessor getInputProcessor() {
        return this.processor;
    }

    public String[] getIPs() {
        return this.ips;
    }

    @Override // com.badlogic.gdx.Input
    public boolean isPeripheralAvailable(Input.Peripheral peripheral) {
        if (peripheral == Input.Peripheral.Accelerometer || peripheral == Input.Peripheral.Compass) {
            return true;
        }
        if (peripheral == Input.Peripheral.MultitouchScreen) {
            return this.multiTouch;
        }
        return false;
    }

    @Override // com.badlogic.gdx.Input
    public Input.Orientation getNativeOrientation() {
        return Input.Orientation.Landscape;
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
}
