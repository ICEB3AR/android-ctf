package com.badlogic.gdx.utils;

import com.badlogic.gdx.math.Vector2;

public enum Scaling {
    fit,
    fill,
    fillX,
    fillY,
    stretch,
    stretchX,
    stretchY,
    none;
    
    private static final Vector2 temp = new Vector2();

    public Vector2 apply(float f, float f2, float f3, float f4) {
        switch (this) {
            case fit:
                float f5 = f4 / f3 > f2 / f ? f3 / f : f4 / f2;
                Vector2 vector2 = temp;
                vector2.x = f * f5;
                vector2.y = f2 * f5;
                break;
            case fill:
                float f6 = f4 / f3 < f2 / f ? f3 / f : f4 / f2;
                Vector2 vector22 = temp;
                vector22.x = f * f6;
                vector22.y = f2 * f6;
                break;
            case fillX:
                float f7 = f3 / f;
                Vector2 vector23 = temp;
                vector23.x = f * f7;
                vector23.y = f2 * f7;
                break;
            case fillY:
                float f8 = f4 / f2;
                Vector2 vector24 = temp;
                vector24.x = f * f8;
                vector24.y = f2 * f8;
                break;
            case stretch:
                Vector2 vector25 = temp;
                vector25.x = f3;
                vector25.y = f4;
                break;
            case stretchX:
                Vector2 vector26 = temp;
                vector26.x = f3;
                vector26.y = f2;
                break;
            case stretchY:
                Vector2 vector27 = temp;
                vector27.x = f;
                vector27.y = f4;
                break;
            case none:
                Vector2 vector28 = temp;
                vector28.x = f;
                vector28.y = f2;
                break;
        }
        return temp;
    }
}
