package com.badlogic.gdx.utils.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public final class ClassReflection {
    public static Class forName(String str) throws ReflectionException {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new ReflectionException("Class not found: " + str, e);
        }
    }

    public static String getSimpleName(Class cls) {
        return cls.getSimpleName();
    }

    public static boolean isInstance(Class cls, Object obj) {
        return cls.isInstance(obj);
    }

    public static boolean isAssignableFrom(Class cls, Class cls2) {
        return cls.isAssignableFrom(cls2);
    }

    public static boolean isMemberClass(Class cls) {
        return cls.isMemberClass();
    }

    public static boolean isStaticClass(Class cls) {
        return Modifier.isStatic(cls.getModifiers());
    }

    public static boolean isArray(Class cls) {
        return cls.isArray();
    }

    public static boolean isPrimitive(Class cls) {
        return cls.isPrimitive();
    }

    public static boolean isEnum(Class cls) {
        return cls.isEnum();
    }

    public static boolean isAnnotation(Class cls) {
        return cls.isAnnotation();
    }

    public static boolean isInterface(Class cls) {
        return cls.isInterface();
    }

    public static boolean isAbstract(Class cls) {
        return Modifier.isAbstract(cls.getModifiers());
    }

    public static <T> T newInstance(Class<T> cls) throws ReflectionException {
        try {
            return cls.newInstance();
        } catch (InstantiationException e) {
            throw new ReflectionException("Could not instantiate instance of class: " + cls.getName(), e);
        } catch (IllegalAccessException e2) {
            throw new ReflectionException("Could not instantiate instance of class: " + cls.getName(), e2);
        }
    }

    public static Class getComponentType(Class cls) {
        return cls.getComponentType();
    }

    public static Constructor[] getConstructors(Class cls) {
        Constructor<?>[] constructors = cls.getConstructors();
        Constructor[] constructorArr = new Constructor[constructors.length];
        int length = constructors.length;
        for (int i = 0; i < length; i++) {
            constructorArr[i] = new Constructor(constructors[i]);
        }
        return constructorArr;
    }

    public static Constructor getConstructor(Class cls, Class... clsArr) throws ReflectionException {
        try {
            return new Constructor(cls.getConstructor(clsArr));
        } catch (SecurityException e) {
            throw new ReflectionException("Security violation occurred while getting constructor for class: '" + cls.getName() + "'.", e);
        } catch (NoSuchMethodException e2) {
            throw new ReflectionException("Constructor not found for class: " + cls.getName(), e2);
        }
    }

    public static Constructor getDeclaredConstructor(Class cls, Class... clsArr) throws ReflectionException {
        try {
            return new Constructor(cls.getDeclaredConstructor(clsArr));
        } catch (SecurityException e) {
            throw new ReflectionException("Security violation while getting constructor for class: " + cls.getName(), e);
        } catch (NoSuchMethodException e2) {
            throw new ReflectionException("Constructor not found for class: " + cls.getName(), e2);
        }
    }

    public static Object[] getEnumConstants(Class cls) {
        return cls.getEnumConstants();
    }

    public static Method[] getMethods(Class cls) {
        Method[] methods = cls.getMethods();
        Method[] methodArr = new Method[methods.length];
        int length = methods.length;
        for (int i = 0; i < length; i++) {
            methodArr[i] = new Method(methods[i]);
        }
        return methodArr;
    }

    public static Method getMethod(Class cls, String str, Class... clsArr) throws ReflectionException {
        try {
            return new Method(cls.getMethod(str, clsArr));
        } catch (SecurityException e) {
            throw new ReflectionException("Security violation while getting method: " + str + ", for class: " + cls.getName(), e);
        } catch (NoSuchMethodException e2) {
            throw new ReflectionException("Method not found: " + str + ", for class: " + cls.getName(), e2);
        }
    }

    public static Method[] getDeclaredMethods(Class cls) {
        Method[] declaredMethods = cls.getDeclaredMethods();
        Method[] methodArr = new Method[declaredMethods.length];
        int length = declaredMethods.length;
        for (int i = 0; i < length; i++) {
            methodArr[i] = new Method(declaredMethods[i]);
        }
        return methodArr;
    }

    public static Method getDeclaredMethod(Class cls, String str, Class... clsArr) throws ReflectionException {
        try {
            return new Method(cls.getDeclaredMethod(str, clsArr));
        } catch (SecurityException e) {
            throw new ReflectionException("Security violation while getting method: " + str + ", for class: " + cls.getName(), e);
        } catch (NoSuchMethodException e2) {
            throw new ReflectionException("Method not found: " + str + ", for class: " + cls.getName(), e2);
        }
    }

    public static Field[] getFields(Class cls) {
        Field[] fields = cls.getFields();
        Field[] fieldArr = new Field[fields.length];
        int length = fields.length;
        for (int i = 0; i < length; i++) {
            fieldArr[i] = new Field(fields[i]);
        }
        return fieldArr;
    }

    public static Field getField(Class cls, String str) throws ReflectionException {
        try {
            return new Field(cls.getField(str));
        } catch (SecurityException e) {
            throw new ReflectionException("Security violation while getting field: " + str + ", for class: " + cls.getName(), e);
        } catch (NoSuchFieldException e2) {
            throw new ReflectionException("Field not found: " + str + ", for class: " + cls.getName(), e2);
        }
    }

    public static Field[] getDeclaredFields(Class cls) {
        Field[] declaredFields = cls.getDeclaredFields();
        Field[] fieldArr = new Field[declaredFields.length];
        int length = declaredFields.length;
        for (int i = 0; i < length; i++) {
            fieldArr[i] = new Field(declaredFields[i]);
        }
        return fieldArr;
    }

    public static Field getDeclaredField(Class cls, String str) throws ReflectionException {
        try {
            return new Field(cls.getDeclaredField(str));
        } catch (SecurityException e) {
            throw new ReflectionException("Security violation while getting field: " + str + ", for class: " + cls.getName(), e);
        } catch (NoSuchFieldException e2) {
            throw new ReflectionException("Field not found: " + str + ", for class: " + cls.getName(), e2);
        }
    }

    public static boolean isAnnotationPresent(Class cls, Class<? extends Annotation> cls2) {
        return cls.isAnnotationPresent(cls2);
    }

    public static Annotation[] getAnnotations(Class cls) {
        Annotation[] annotations = cls.getAnnotations();
        Annotation[] annotationArr = new Annotation[annotations.length];
        for (int i = 0; i < annotations.length; i++) {
            annotationArr[i] = new Annotation(annotations[i]);
        }
        return annotationArr;
    }

    public static Annotation getAnnotation(Class cls, Class<? extends Annotation> cls2) {
        Annotation annotation = cls.getAnnotation(cls2);
        if (annotation != null) {
            return new Annotation(annotation);
        }
        return null;
    }

    public static Annotation[] getDeclaredAnnotations(Class cls) {
        Annotation[] declaredAnnotations = cls.getDeclaredAnnotations();
        Annotation[] annotationArr = new Annotation[declaredAnnotations.length];
        for (int i = 0; i < declaredAnnotations.length; i++) {
            annotationArr[i] = new Annotation(declaredAnnotations[i]);
        }
        return annotationArr;
    }

    public static Annotation getDeclaredAnnotation(Class cls, Class<? extends Annotation> cls2) {
        Annotation[] declaredAnnotations = cls.getDeclaredAnnotations();
        for (Annotation annotation : declaredAnnotations) {
            if (annotation.annotationType().equals(cls2)) {
                return new Annotation(annotation);
            }
        }
        return null;
    }

    public static Class[] getInterfaces(Class cls) {
        return cls.getInterfaces();
    }
}
