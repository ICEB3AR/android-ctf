package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.GL20;

public class SerializationException extends RuntimeException {
    private StringBuilder trace;

    public SerializationException() {
    }

    public SerializationException(String str, Throwable th) {
        super(str, th);
    }

    public SerializationException(String str) {
        super(str);
    }

    public SerializationException(Throwable th) {
        super(BuildConfig.FLAVOR, th);
    }

    public boolean causedBy(Class cls) {
        return causedBy(this, cls);
    }

    private boolean causedBy(Throwable th, Class cls) {
        Throwable cause = th.getCause();
        if (cause == null || cause == th) {
            return false;
        }
        if (cls.isAssignableFrom(cause.getClass())) {
            return true;
        }
        return causedBy(cause, cls);
    }

    public String getMessage() {
        if (this.trace == null) {
            return super.getMessage();
        }
        StringBuilder stringBuilder = new StringBuilder((int) GL20.GL_NEVER);
        stringBuilder.append(super.getMessage());
        if (stringBuilder.length() > 0) {
            stringBuilder.append('\n');
        }
        stringBuilder.append("Serialization trace:");
        stringBuilder.append(this.trace);
        return stringBuilder.toString();
    }

    public void addTrace(String str) {
        if (str != null) {
            if (this.trace == null) {
                this.trace = new StringBuilder((int) GL20.GL_NEVER);
            }
            this.trace.append('\n');
            this.trace.append(str);
            return;
        }
        throw new IllegalArgumentException("info cannot be null.");
    }
}
