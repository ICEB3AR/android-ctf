package com.badlogic.gdx.utils;

public class Pools {
    private static final ObjectMap<Class, Pool> typePools = new ObjectMap<>();

    public static <T> Pool<T> get(Class<T> cls, int i) {
        Pool<T> pool = typePools.get(cls);
        if (pool != null) {
            return pool;
        }
        ReflectionPool reflectionPool = new ReflectionPool(cls, 4, i);
        typePools.put(cls, reflectionPool);
        return reflectionPool;
    }

    public static <T> Pool<T> get(Class<T> cls) {
        return get(cls, 100);
    }

    public static <T> void set(Class<T> cls, Pool<T> pool) {
        typePools.put(cls, pool);
    }

    public static <T> T obtain(Class<T> cls) {
        return (T) get(cls).obtain();
    }

    public static void free(Object obj) {
        if (obj != null) {
            Pool pool = typePools.get(obj.getClass());
            if (pool != null) {
                pool.free(obj);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Object cannot be null.");
    }

    public static void freeAll(Array array) {
        freeAll(array, false);
    }

    public static void freeAll(Array array, boolean z) {
        if (array != null) {
            int i = array.size;
            Pool pool = null;
            for (int i2 = 0; i2 < i; i2++) {
                Object obj = array.get(i2);
                if (!(obj == null || (pool == null && (pool = typePools.get(obj.getClass())) == null))) {
                    pool.free(obj);
                    if (!z) {
                        pool = null;
                    }
                }
            }
            return;
        }
        throw new IllegalArgumentException("Objects cannot be null.");
    }

    private Pools() {
    }
}
