package com.badlogic.gdx.utils.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public final class Field {
    private final java.lang.reflect.Field field;

    Field(java.lang.reflect.Field field2) {
        this.field = field2;
    }

    public String getName() {
        return this.field.getName();
    }

    public Class getType() {
        return this.field.getType();
    }

    public Class getDeclaringClass() {
        return this.field.getDeclaringClass();
    }

    public boolean isAccessible() {
        return this.field.isAccessible();
    }

    public void setAccessible(boolean z) {
        this.field.setAccessible(z);
    }

    public boolean isDefaultAccess() {
        return !isPrivate() && !isProtected() && !isPublic();
    }

    public boolean isFinal() {
        return Modifier.isFinal(this.field.getModifiers());
    }

    public boolean isPrivate() {
        return Modifier.isPrivate(this.field.getModifiers());
    }

    public boolean isProtected() {
        return Modifier.isProtected(this.field.getModifiers());
    }

    public boolean isPublic() {
        return Modifier.isPublic(this.field.getModifiers());
    }

    public boolean isStatic() {
        return Modifier.isStatic(this.field.getModifiers());
    }

    public boolean isTransient() {
        return Modifier.isTransient(this.field.getModifiers());
    }

    public boolean isVolatile() {
        return Modifier.isVolatile(this.field.getModifiers());
    }

    public boolean isSynthetic() {
        return this.field.isSynthetic();
    }

    public Class getElementType(int i) {
        Type genericType = this.field.getGenericType();
        if (!(genericType instanceof ParameterizedType)) {
            return null;
        }
        Type[] actualTypeArguments = ((ParameterizedType) genericType).getActualTypeArguments();
        if (actualTypeArguments.length - 1 < i) {
            return null;
        }
        Type type = actualTypeArguments[i];
        if (type instanceof Class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            return (Class) ((ParameterizedType) type).getRawType();
        }
        if (!(type instanceof GenericArrayType)) {
            return null;
        }
        Type genericComponentType = ((GenericArrayType) type).getGenericComponentType();
        if (genericComponentType instanceof Class) {
            return ArrayReflection.newInstance((Class) genericComponentType, 0).getClass();
        }
        return null;
    }

    public boolean isAnnotationPresent(Class<? extends Annotation> cls) {
        return this.field.isAnnotationPresent(cls);
    }

    public Annotation[] getDeclaredAnnotations() {
        Annotation[] declaredAnnotations = this.field.getDeclaredAnnotations();
        Annotation[] annotationArr = new Annotation[declaredAnnotations.length];
        for (int i = 0; i < declaredAnnotations.length; i++) {
            annotationArr[i] = new Annotation(declaredAnnotations[i]);
        }
        return annotationArr;
    }

    public Annotation getDeclaredAnnotation(Class<? extends Annotation> cls) {
        Annotation[] declaredAnnotations = this.field.getDeclaredAnnotations();
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

    public Object get(Object obj) throws ReflectionException {
        try {
            return this.field.get(obj);
        } catch (IllegalArgumentException e) {
            throw new ReflectionException("Object is not an instance of " + getDeclaringClass(), e);
        } catch (IllegalAccessException e2) {
            throw new ReflectionException("Illegal access to field: " + getName(), e2);
        }
    }

    public void set(Object obj, Object obj2) throws ReflectionException {
        try {
            this.field.set(obj, obj2);
        } catch (IllegalArgumentException e) {
            throw new ReflectionException("Argument not valid for field: " + getName(), e);
        } catch (IllegalAccessException e2) {
            throw new ReflectionException("Illegal access to field: " + getName(), e2);
        }
    }
}
