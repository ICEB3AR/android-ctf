package com.badlogic.gdx.utils.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;

public final class Method {
    private final java.lang.reflect.Method method;

    Method(java.lang.reflect.Method method2) {
        this.method = method2;
    }

    public String getName() {
        return this.method.getName();
    }

    public Class getReturnType() {
        return this.method.getReturnType();
    }

    public Class[] getParameterTypes() {
        return this.method.getParameterTypes();
    }

    public Class getDeclaringClass() {
        return this.method.getDeclaringClass();
    }

    public boolean isAccessible() {
        return this.method.isAccessible();
    }

    public void setAccessible(boolean z) {
        this.method.setAccessible(z);
    }

    public boolean isAbstract() {
        return Modifier.isAbstract(this.method.getModifiers());
    }

    public boolean isDefaultAccess() {
        return !isPrivate() && !isProtected() && !isPublic();
    }

    public boolean isFinal() {
        return Modifier.isFinal(this.method.getModifiers());
    }

    public boolean isPrivate() {
        return Modifier.isPrivate(this.method.getModifiers());
    }

    public boolean isProtected() {
        return Modifier.isProtected(this.method.getModifiers());
    }

    public boolean isPublic() {
        return Modifier.isPublic(this.method.getModifiers());
    }

    public boolean isNative() {
        return Modifier.isNative(this.method.getModifiers());
    }

    public boolean isStatic() {
        return Modifier.isStatic(this.method.getModifiers());
    }

    public boolean isVarArgs() {
        return this.method.isVarArgs();
    }

    public Object invoke(Object obj, Object... objArr) throws ReflectionException {
        try {
            return this.method.invoke(obj, objArr);
        } catch (IllegalArgumentException e) {
            throw new ReflectionException("Illegal argument(s) supplied to method: " + getName(), e);
        } catch (IllegalAccessException e2) {
            throw new ReflectionException("Illegal access to method: " + getName(), e2);
        } catch (InvocationTargetException e3) {
            throw new ReflectionException("Exception occurred in method: " + getName(), e3);
        }
    }

    public boolean isAnnotationPresent(Class<? extends Annotation> cls) {
        return this.method.isAnnotationPresent(cls);
    }

    public Annotation[] getDeclaredAnnotations() {
        Annotation[] declaredAnnotations = this.method.getDeclaredAnnotations();
        Annotation[] annotationArr = new Annotation[declaredAnnotations.length];
        for (int i = 0; i < declaredAnnotations.length; i++) {
            annotationArr[i] = new Annotation(declaredAnnotations[i]);
        }
        return annotationArr;
    }

    public Annotation getDeclaredAnnotation(Class<? extends Annotation> cls) {
        Annotation[] declaredAnnotations = this.method.getDeclaredAnnotations();
        if (declaredAnnotations == null) {
            return null;
        }
        for (Annotation annotation : declaredAnnotations) {
            if (annotation.annotationType().equals(cls)) {
                return new Annotation(annotation);
            }
        }
        return null;
    }
}
