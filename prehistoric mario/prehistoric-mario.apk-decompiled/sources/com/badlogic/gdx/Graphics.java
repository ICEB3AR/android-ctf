package com.badlogic.gdx;

import com.badlogic.gdx.graphics.Cursor;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.glutils.GLVersion;

public interface Graphics {

    public enum GraphicsType {
        AndroidGL,
        LWJGL,
        WebGL,
        iOSGL,
        JGLFW,
        Mock,
        LWJGL3
    }

    int getBackBufferHeight();

    int getBackBufferWidth();

    BufferFormat getBufferFormat();

    float getDeltaTime();

    float getDensity();

    DisplayMode getDisplayMode();

    DisplayMode getDisplayMode(Monitor monitor);

    DisplayMode[] getDisplayModes();

    DisplayMode[] getDisplayModes(Monitor monitor);

    long getFrameId();

    int getFramesPerSecond();

    GL20 getGL20();

    GL30 getGL30();

    GLVersion getGLVersion();

    int getHeight();

    Monitor getMonitor();

    Monitor[] getMonitors();

    float getPpcX();

    float getPpcY();

    float getPpiX();

    float getPpiY();

    Monitor getPrimaryMonitor();

    float getRawDeltaTime();

    GraphicsType getType();

    int getWidth();

    boolean isContinuousRendering();

    boolean isFullscreen();

    boolean isGL30Available();

    Cursor newCursor(Pixmap pixmap, int i, int i2);

    void requestRendering();

    void setContinuousRendering(boolean z);

    void setCursor(Cursor cursor);

    boolean setFullscreenMode(DisplayMode displayMode);

    void setGL20(GL20 gl20);

    void setGL30(GL30 gl30);

    void setResizable(boolean z);

    void setSystemCursor(Cursor.SystemCursor systemCursor);

    void setTitle(String str);

    void setUndecorated(boolean z);

    void setVSync(boolean z);

    boolean setWindowedMode(int i, int i2);

    boolean supportsDisplayModeChange();

    boolean supportsExtension(String str);

    public static class DisplayMode {
        public final int bitsPerPixel;
        public final int height;
        public final int refreshRate;
        public final int width;

        protected DisplayMode(int i, int i2, int i3, int i4) {
            this.width = i;
            this.height = i2;
            this.refreshRate = i3;
            this.bitsPerPixel = i4;
        }

        public String toString() {
            return this.width + "x" + this.height + ", bpp: " + this.bitsPerPixel + ", hz: " + this.refreshRate;
        }
    }

    public static class Monitor {
        public final String name;
        public final int virtualX;
        public final int virtualY;

        protected Monitor(int i, int i2, String str) {
            this.virtualX = i;
            this.virtualY = i2;
            this.name = str;
        }
    }

    public static class BufferFormat {
        public final int a;
        public final int b;
        public final boolean coverageSampling;
        public final int depth;
        public final int g;
        public final int r;
        public final int samples;
        public final int stencil;

        public BufferFormat(int i, int i2, int i3, int i4, int i5, int i6, int i7, boolean z) {
            this.r = i;
            this.g = i2;
            this.b = i3;
            this.a = i4;
            this.depth = i5;
            this.stencil = i6;
            this.samples = i7;
            this.coverageSampling = z;
        }

        public String toString() {
            return "r: " + this.r + ", g: " + this.g + ", b: " + this.b + ", a: " + this.a + ", depth: " + this.depth + ", stencil: " + this.stencil + ", num samples: " + this.samples + ", coverage sampling: " + this.coverageSampling;
        }
    }
}
