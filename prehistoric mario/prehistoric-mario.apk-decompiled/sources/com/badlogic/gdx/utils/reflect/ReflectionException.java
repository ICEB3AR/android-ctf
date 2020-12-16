package com.badlogic.gdx.utils.reflect;

public class ReflectionException extends Exception {
    public ReflectionException() {
    }

    public ReflectionException(String str) {
        super(str);
    }

    public ReflectionException(Throwable th) {
        super(th);
    }

    public ReflectionException(String str, Throwable th) {
        super(str, th);
    }
}
