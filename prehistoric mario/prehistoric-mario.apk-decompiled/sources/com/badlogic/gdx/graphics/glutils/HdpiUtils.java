package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;

public class HdpiUtils {
    private static HdpiMode mode = HdpiMode.Logical;

    public static void setMode(HdpiMode hdpiMode) {
        mode = hdpiMode;
    }

    public static void glScissor(int i, int i2, int i3, int i4) {
        if (mode != HdpiMode.Logical || (Gdx.graphics.getWidth() == Gdx.graphics.getBackBufferWidth() && Gdx.graphics.getHeight() == Gdx.graphics.getBackBufferHeight())) {
            Gdx.gl.glScissor(i, i2, i3, i4);
        } else {
            Gdx.gl.glScissor(toBackBufferX(i), toBackBufferY(i2), toBackBufferX(i3), toBackBufferY(i4));
        }
    }

    public static void glViewport(int i, int i2, int i3, int i4) {
        if (mode != HdpiMode.Logical || (Gdx.graphics.getWidth() == Gdx.graphics.getBackBufferWidth() && Gdx.graphics.getHeight() == Gdx.graphics.getBackBufferHeight())) {
            Gdx.gl.glViewport(i, i2, i3, i4);
        } else {
            Gdx.gl.glViewport(toBackBufferX(i), toBackBufferY(i2), toBackBufferX(i3), toBackBufferY(i4));
        }
    }

    public static int toLogicalX(int i) {
        return (int) (((float) (i * Gdx.graphics.getWidth())) / ((float) Gdx.graphics.getBackBufferWidth()));
    }

    public static int toLogicalY(int i) {
        return (int) (((float) (i * Gdx.graphics.getHeight())) / ((float) Gdx.graphics.getBackBufferHeight()));
    }

    public static int toBackBufferX(int i) {
        return (int) (((float) (i * Gdx.graphics.getBackBufferWidth())) / ((float) Gdx.graphics.getWidth()));
    }

    public static int toBackBufferY(int i) {
        return (int) (((float) (i * Gdx.graphics.getBackBufferHeight())) / ((float) Gdx.graphics.getHeight()));
    }
}
