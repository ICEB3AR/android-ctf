package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.reflect.ArrayReflection;

public class Animation<T> {
    private float animationDuration;
    private float frameDuration;
    T[] keyFrames;
    private int lastFrameNumber;
    private float lastStateTime;
    private PlayMode playMode;

    public enum PlayMode {
        NORMAL,
        REVERSED,
        LOOP,
        LOOP_REVERSED,
        LOOP_PINGPONG,
        LOOP_RANDOM
    }

    /* JADX DEBUG: Multi-variable search result rejected for r3v0, resolved type: com.badlogic.gdx.graphics.g2d.Animation<T> */
    /* JADX WARN: Multi-variable type inference failed */
    public Animation(float f, Array<? extends T> array) {
        this.playMode = PlayMode.NORMAL;
        this.frameDuration = f;
        Object[] objArr = (Object[]) ArrayReflection.newInstance(array.items.getClass().getComponentType(), array.size);
        int i = array.size;
        for (int i2 = 0; i2 < i; i2++) {
            objArr[i2] = array.get(i2);
        }
        setKeyFrames(objArr);
    }

    public Animation(float f, Array<? extends T> array, PlayMode playMode2) {
        this(f, array);
        setPlayMode(playMode2);
    }

    public Animation(float f, T... tArr) {
        this.playMode = PlayMode.NORMAL;
        this.frameDuration = f;
        setKeyFrames(tArr);
    }

    public T getKeyFrame(float f, boolean z) {
        PlayMode playMode2 = this.playMode;
        if (!z || !(playMode2 == PlayMode.NORMAL || this.playMode == PlayMode.REVERSED)) {
            if (!(z || this.playMode == PlayMode.NORMAL || this.playMode == PlayMode.REVERSED)) {
                if (this.playMode == PlayMode.LOOP_REVERSED) {
                    this.playMode = PlayMode.REVERSED;
                } else {
                    this.playMode = PlayMode.LOOP;
                }
            }
        } else if (this.playMode == PlayMode.NORMAL) {
            this.playMode = PlayMode.LOOP;
        } else {
            this.playMode = PlayMode.LOOP_REVERSED;
        }
        T keyFrame = getKeyFrame(f);
        this.playMode = playMode2;
        return keyFrame;
    }

    public T getKeyFrame(float f) {
        return this.keyFrames[getKeyFrameIndex(f)];
    }

    public int getKeyFrameIndex(float f) {
        if (this.keyFrames.length == 1) {
            return 0;
        }
        int i = (int) (f / this.frameDuration);
        switch (this.playMode) {
            case NORMAL:
                i = Math.min(this.keyFrames.length - 1, i);
                break;
            case LOOP:
                i %= this.keyFrames.length;
                break;
            case LOOP_PINGPONG:
                T[] tArr = this.keyFrames;
                i %= (tArr.length * 2) - 2;
                if (i >= tArr.length) {
                    i = (tArr.length - 2) - (i - tArr.length);
                    break;
                }
                break;
            case LOOP_RANDOM:
                if (((int) (this.lastStateTime / this.frameDuration)) == i) {
                    i = this.lastFrameNumber;
                    break;
                } else {
                    i = MathUtils.random(this.keyFrames.length - 1);
                    break;
                }
            case REVERSED:
                i = Math.max((this.keyFrames.length - i) - 1, 0);
                break;
            case LOOP_REVERSED:
                T[] tArr2 = this.keyFrames;
                i = (tArr2.length - (i % tArr2.length)) - 1;
                break;
        }
        this.lastFrameNumber = i;
        this.lastStateTime = f;
        return i;
    }

    public T[] getKeyFrames() {
        return this.keyFrames;
    }

    /* access modifiers changed from: protected */
    public void setKeyFrames(T... tArr) {
        this.keyFrames = tArr;
        this.animationDuration = ((float) tArr.length) * this.frameDuration;
    }

    public PlayMode getPlayMode() {
        return this.playMode;
    }

    public void setPlayMode(PlayMode playMode2) {
        this.playMode = playMode2;
    }

    public boolean isAnimationFinished(float f) {
        return this.keyFrames.length - 1 < ((int) (f / this.frameDuration));
    }

    public void setFrameDuration(float f) {
        this.frameDuration = f;
        this.animationDuration = ((float) this.keyFrames.length) * f;
    }

    public float getFrameDuration() {
        return this.frameDuration;
    }

    public float getAnimationDuration() {
        return this.animationDuration;
    }
}
