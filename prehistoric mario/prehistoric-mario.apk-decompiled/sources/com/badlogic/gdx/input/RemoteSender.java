package com.badlogic.gdx.input;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Input;
import com.badlogic.gdx.InputProcessor;
import java.io.DataOutputStream;
import java.net.Socket;

public class RemoteSender implements InputProcessor {
    public static final int ACCEL = 6;
    public static final int COMPASS = 7;
    public static final int GYRO = 9;
    public static final int KEY_DOWN = 0;
    public static final int KEY_TYPED = 2;
    public static final int KEY_UP = 1;
    public static final int SIZE = 8;
    public static final int TOUCH_DOWN = 3;
    public static final int TOUCH_DRAGGED = 5;
    public static final int TOUCH_UP = 4;
    private boolean connected = false;
    private DataOutputStream out;

    @Override // com.badlogic.gdx.InputProcessor
    public boolean mouseMoved(int i, int i2) {
        return false;
    }

    @Override // com.badlogic.gdx.InputProcessor
    public boolean scrolled(int i) {
        return false;
    }

    public RemoteSender(String str, int i) {
        try {
            Socket socket = new Socket(str, i);
            socket.setTcpNoDelay(true);
            socket.setSoTimeout(3000);
            this.out = new DataOutputStream(socket.getOutputStream());
            this.out.writeBoolean(Gdx.input.isPeripheralAvailable(Input.Peripheral.MultitouchScreen));
            this.connected = true;
            Gdx.input.setInputProcessor(this);
        } catch (Exception unused) {
            Application application = Gdx.app;
            application.log("RemoteSender", "couldn't connect to " + str + ":" + i);
        }
    }

    public void sendUpdate() {
        synchronized (this) {
            if (this.connected) {
                try {
                    this.out.writeInt(6);
                    this.out.writeFloat(Gdx.input.getAccelerometerX());
                    this.out.writeFloat(Gdx.input.getAccelerometerY());
                    this.out.writeFloat(Gdx.input.getAccelerometerZ());
                    this.out.writeInt(7);
                    this.out.writeFloat(Gdx.input.getAzimuth());
                    this.out.writeFloat(Gdx.input.getPitch());
                    this.out.writeFloat(Gdx.input.getRoll());
                    this.out.writeInt(8);
                    this.out.writeFloat((float) Gdx.graphics.getWidth());
                    this.out.writeFloat((float) Gdx.graphics.getHeight());
                    this.out.writeInt(9);
                    this.out.writeFloat(Gdx.input.getGyroscopeX());
                    this.out.writeFloat(Gdx.input.getGyroscopeY());
                    this.out.writeFloat(Gdx.input.getGyroscopeZ());
                } catch (Throwable unused) {
                    this.out = null;
                    this.connected = false;
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:?, code lost:
        r2.connected = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:?, code lost:
        r2.out.writeInt(0);
        r2.out.writeInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0014, code lost:
        monitor-enter(r2);
     */
    @Override // com.badlogic.gdx.InputProcessor
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean keyDown(int r3) {
        /*
            r2 = this;
            monitor-enter(r2)
            boolean r0 = r2.connected     // Catch:{ all -> 0x001c }
            r1 = 0
            if (r0 != 0) goto L_0x0008
            monitor-exit(r2)     // Catch:{ all -> 0x001c }
            return r1
        L_0x0008:
            monitor-exit(r2)     // Catch:{ all -> 0x001c }
            java.io.DataOutputStream r0 = r2.out     // Catch:{ Throwable -> 0x0014 }
            r0.writeInt(r1)     // Catch:{ Throwable -> 0x0014 }
            java.io.DataOutputStream r0 = r2.out     // Catch:{ Throwable -> 0x0014 }
            r0.writeInt(r3)     // Catch:{ Throwable -> 0x0014 }
            goto L_0x0018
        L_0x0014:
            monitor-enter(r2)
            r2.connected = r1     // Catch:{ all -> 0x0019 }
            monitor-exit(r2)     // Catch:{ all -> 0x0019 }
        L_0x0018:
            return r1
        L_0x0019:
            r3 = move-exception
            monitor-exit(r2)     // Catch:{ all -> 0x0019 }
            throw r3
        L_0x001c:
            r3 = move-exception
            monitor-exit(r2)
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.input.RemoteSender.keyDown(int):boolean");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:?, code lost:
        r3.connected = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:?, code lost:
        r3.out.writeInt(1);
        r3.out.writeInt(r4);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0015, code lost:
        monitor-enter(r3);
     */
    @Override // com.badlogic.gdx.InputProcessor
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean keyUp(int r4) {
        /*
            r3 = this;
            monitor-enter(r3)
            boolean r0 = r3.connected     // Catch:{ all -> 0x001d }
            r1 = 0
            if (r0 != 0) goto L_0x0008
            monitor-exit(r3)     // Catch:{ all -> 0x001d }
            return r1
        L_0x0008:
            monitor-exit(r3)     // Catch:{ all -> 0x001d }
            java.io.DataOutputStream r0 = r3.out     // Catch:{ Throwable -> 0x0015 }
            r2 = 1
            r0.writeInt(r2)     // Catch:{ Throwable -> 0x0015 }
            java.io.DataOutputStream r0 = r3.out     // Catch:{ Throwable -> 0x0015 }
            r0.writeInt(r4)     // Catch:{ Throwable -> 0x0015 }
            goto L_0x0019
        L_0x0015:
            monitor-enter(r3)
            r3.connected = r1     // Catch:{ all -> 0x001a }
            monitor-exit(r3)     // Catch:{ all -> 0x001a }
        L_0x0019:
            return r1
        L_0x001a:
            r4 = move-exception
            monitor-exit(r3)     // Catch:{ all -> 0x001a }
            throw r4
        L_0x001d:
            r4 = move-exception
            monitor-exit(r3)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.input.RemoteSender.keyUp(int):boolean");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:?, code lost:
        r3.connected = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:?, code lost:
        r3.out.writeInt(2);
        r3.out.writeChar(r4);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0015, code lost:
        monitor-enter(r3);
     */
    @Override // com.badlogic.gdx.InputProcessor
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean keyTyped(char r4) {
        /*
            r3 = this;
            monitor-enter(r3)
            boolean r0 = r3.connected     // Catch:{ all -> 0x001d }
            r1 = 0
            if (r0 != 0) goto L_0x0008
            monitor-exit(r3)     // Catch:{ all -> 0x001d }
            return r1
        L_0x0008:
            monitor-exit(r3)     // Catch:{ all -> 0x001d }
            java.io.DataOutputStream r0 = r3.out     // Catch:{ Throwable -> 0x0015 }
            r2 = 2
            r0.writeInt(r2)     // Catch:{ Throwable -> 0x0015 }
            java.io.DataOutputStream r0 = r3.out     // Catch:{ Throwable -> 0x0015 }
            r0.writeChar(r4)     // Catch:{ Throwable -> 0x0015 }
            goto L_0x0019
        L_0x0015:
            monitor-enter(r3)
            r3.connected = r1     // Catch:{ all -> 0x001a }
            monitor-exit(r3)     // Catch:{ all -> 0x001a }
        L_0x0019:
            return r1
        L_0x001a:
            r4 = move-exception
            monitor-exit(r3)     // Catch:{ all -> 0x001a }
            throw r4
        L_0x001d:
            r4 = move-exception
            monitor-exit(r3)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.input.RemoteSender.keyTyped(char):boolean");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:?, code lost:
        r2.connected = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:?, code lost:
        r2.out.writeInt(3);
        r2.out.writeInt(r3);
        r2.out.writeInt(r4);
        r2.out.writeInt(r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x001f, code lost:
        monitor-enter(r2);
     */
    @Override // com.badlogic.gdx.InputProcessor
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean touchDown(int r3, int r4, int r5, int r6) {
        /*
            r2 = this;
            monitor-enter(r2)
            boolean r6 = r2.connected     // Catch:{ all -> 0x0027 }
            r0 = 0
            if (r6 != 0) goto L_0x0008
            monitor-exit(r2)     // Catch:{ all -> 0x0027 }
            return r0
        L_0x0008:
            monitor-exit(r2)     // Catch:{ all -> 0x0027 }
            java.io.DataOutputStream r6 = r2.out     // Catch:{ Throwable -> 0x001f }
            r1 = 3
            r6.writeInt(r1)     // Catch:{ Throwable -> 0x001f }
            java.io.DataOutputStream r6 = r2.out     // Catch:{ Throwable -> 0x001f }
            r6.writeInt(r3)     // Catch:{ Throwable -> 0x001f }
            java.io.DataOutputStream r3 = r2.out     // Catch:{ Throwable -> 0x001f }
            r3.writeInt(r4)     // Catch:{ Throwable -> 0x001f }
            java.io.DataOutputStream r3 = r2.out     // Catch:{ Throwable -> 0x001f }
            r3.writeInt(r5)     // Catch:{ Throwable -> 0x001f }
            goto L_0x0023
        L_0x001f:
            monitor-enter(r2)
            r2.connected = r0     // Catch:{ all -> 0x0024 }
            monitor-exit(r2)     // Catch:{ all -> 0x0024 }
        L_0x0023:
            return r0
        L_0x0024:
            r3 = move-exception
            monitor-exit(r2)     // Catch:{ all -> 0x0024 }
            throw r3
        L_0x0027:
            r3 = move-exception
            monitor-exit(r2)
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.input.RemoteSender.touchDown(int, int, int, int):boolean");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:?, code lost:
        r2.connected = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:?, code lost:
        r2.out.writeInt(4);
        r2.out.writeInt(r3);
        r2.out.writeInt(r4);
        r2.out.writeInt(r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x001f, code lost:
        monitor-enter(r2);
     */
    @Override // com.badlogic.gdx.InputProcessor
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean touchUp(int r3, int r4, int r5, int r6) {
        /*
            r2 = this;
            monitor-enter(r2)
            boolean r6 = r2.connected     // Catch:{ all -> 0x0027 }
            r0 = 0
            if (r6 != 0) goto L_0x0008
            monitor-exit(r2)     // Catch:{ all -> 0x0027 }
            return r0
        L_0x0008:
            monitor-exit(r2)     // Catch:{ all -> 0x0027 }
            java.io.DataOutputStream r6 = r2.out     // Catch:{ Throwable -> 0x001f }
            r1 = 4
            r6.writeInt(r1)     // Catch:{ Throwable -> 0x001f }
            java.io.DataOutputStream r6 = r2.out     // Catch:{ Throwable -> 0x001f }
            r6.writeInt(r3)     // Catch:{ Throwable -> 0x001f }
            java.io.DataOutputStream r3 = r2.out     // Catch:{ Throwable -> 0x001f }
            r3.writeInt(r4)     // Catch:{ Throwable -> 0x001f }
            java.io.DataOutputStream r3 = r2.out     // Catch:{ Throwable -> 0x001f }
            r3.writeInt(r5)     // Catch:{ Throwable -> 0x001f }
            goto L_0x0023
        L_0x001f:
            monitor-enter(r2)
            r2.connected = r0     // Catch:{ all -> 0x0024 }
            monitor-exit(r2)     // Catch:{ all -> 0x0024 }
        L_0x0023:
            return r0
        L_0x0024:
            r3 = move-exception
            monitor-exit(r2)     // Catch:{ all -> 0x0024 }
            throw r3
        L_0x0027:
            r3 = move-exception
            monitor-exit(r2)
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.input.RemoteSender.touchUp(int, int, int, int):boolean");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:?, code lost:
        r3.connected = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:?, code lost:
        r3.out.writeInt(5);
        r3.out.writeInt(r4);
        r3.out.writeInt(r5);
        r3.out.writeInt(r6);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x001f, code lost:
        monitor-enter(r3);
     */
    @Override // com.badlogic.gdx.InputProcessor
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean touchDragged(int r4, int r5, int r6) {
        /*
            r3 = this;
            monitor-enter(r3)
            boolean r0 = r3.connected     // Catch:{ all -> 0x0027 }
            r1 = 0
            if (r0 != 0) goto L_0x0008
            monitor-exit(r3)     // Catch:{ all -> 0x0027 }
            return r1
        L_0x0008:
            monitor-exit(r3)     // Catch:{ all -> 0x0027 }
            java.io.DataOutputStream r0 = r3.out     // Catch:{ Throwable -> 0x001f }
            r2 = 5
            r0.writeInt(r2)     // Catch:{ Throwable -> 0x001f }
            java.io.DataOutputStream r0 = r3.out     // Catch:{ Throwable -> 0x001f }
            r0.writeInt(r4)     // Catch:{ Throwable -> 0x001f }
            java.io.DataOutputStream r4 = r3.out     // Catch:{ Throwable -> 0x001f }
            r4.writeInt(r5)     // Catch:{ Throwable -> 0x001f }
            java.io.DataOutputStream r4 = r3.out     // Catch:{ Throwable -> 0x001f }
            r4.writeInt(r6)     // Catch:{ Throwable -> 0x001f }
            goto L_0x0023
        L_0x001f:
            monitor-enter(r3)
            r3.connected = r1     // Catch:{ all -> 0x0024 }
            monitor-exit(r3)     // Catch:{ all -> 0x0024 }
        L_0x0023:
            return r1
        L_0x0024:
            r4 = move-exception
            monitor-exit(r3)     // Catch:{ all -> 0x0024 }
            throw r4
        L_0x0027:
            r4 = move-exception
            monitor-exit(r3)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.input.RemoteSender.touchDragged(int, int, int):boolean");
    }

    public boolean isConnected() {
        boolean z;
        synchronized (this) {
            z = this.connected;
        }
        return z;
    }
}
