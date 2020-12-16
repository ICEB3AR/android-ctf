package com.brashmonkey.spriter;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Spriter {
    private static Drawer<?> drawer;
    private static Object[] drawerDependencies = new Object[1];
    private static Class<?>[] drawerTypes = new Class[1];
    private static final HashMap<Entity, Loader> entityToLoader = new HashMap<>();
    private static boolean initialized = false;
    private static final HashMap<String, Data> loadedData = new HashMap<>();
    private static Class<? extends Loader> loaderClass;
    private static Object[] loaderDependencies = new Object[1];
    private static Class<?>[] loaderTypes = new Class[1];
    private static final List<Loader> loaders = new ArrayList();
    private static final List<Player> players = new ArrayList();

    static {
        loaderTypes[0] = Data.class;
        drawerTypes[0] = Loader.class;
    }

    public static void setLoaderDependencies(Object... objArr) {
        if (objArr != null) {
            loaderDependencies = new Object[(objArr.length + 1)];
            int i = 0;
            System.arraycopy(objArr, 0, loaderDependencies, 1, objArr.length);
            loaderTypes = new Class[(objArr.length + 1)];
            loaderTypes[0] = Data.class;
            while (i < objArr.length) {
                int i2 = i + 1;
                loaderTypes[i2] = objArr[i].getClass();
                i = i2;
            }
        }
    }

    public static void setDrawerDependencies(Object... objArr) {
        if (objArr != null) {
            drawerDependencies = new Object[(objArr.length + 1)];
            Object[] objArr2 = drawerDependencies;
            objArr2[0] = null;
            System.arraycopy(objArr, 0, objArr2, 1, objArr.length);
            drawerTypes = new Class[(objArr.length + 1)];
            drawerTypes[0] = Loader.class;
            for (int i = 0; i < objArr.length; i++) {
                if (objArr[i] != null) {
                    drawerTypes[i + 1] = objArr[i].getClass();
                }
            }
        }
    }

    public static void init(Class<? extends Loader> cls, Class<? extends Drawer> cls2) {
        loaderClass = cls;
        try {
            drawer = (Drawer) cls2.getDeclaredConstructor(drawerTypes).newInstance(drawerDependencies);
        } catch (Exception e) {
            e.printStackTrace();
        }
        initialized = drawer != null;
    }

    public static void load(String str) {
        load(new File(str));
    }

    public static void load(File file) {
        try {
            load(new FileInputStream(file), file.getPath().replaceAll("\\\\", "/"));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void load(InputStream inputStream, String str) {
        Data data = new SCMLReader(inputStream).data;
        loadedData.put(str, data);
        loaderDependencies[0] = data;
        try {
            Loader loader = (Loader) loaderClass.getDeclaredConstructor(loaderTypes).newInstance(loaderDependencies);
            loader.load(new File(str));
            loaders.add(loader);
            for (Entity entity : data.entities) {
                entityToLoader.put(entity, loader);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Player newPlayer(String str, int i) {
        return newPlayer(str, i, Player.class);
    }

    public static Player newPlayer(String str, int i, Class<? extends Player> cls) {
        if (loadedData.containsKey(str)) {
            try {
                Player player = (Player) cls.getDeclaredConstructor(Entity.class).newInstance(loadedData.get(str).getEntity(i));
                players.add(player);
                return player;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        } else {
            throw new SpriterException("You have to load \"" + str + "\" before using it!");
        }
    }

    public static Player newPlayer(String str, String str2) {
        if (loadedData.containsKey(str)) {
            return newPlayer(str, loadedData.get(str).getEntityIndex(str2));
        }
        throw new SpriterException("You have to load \"" + str + "\" before using it!");
    }

    public static Loader<?> getLoader(String str) {
        return entityToLoader.get(getData(str).getEntity(0));
    }

    public static void updateAndDraw() {
        if (initialized) {
            for (Player player : players) {
                player.update();
                drawer.loader = entityToLoader.get(player.getEntity());
                drawer.draw(player);
            }
            return;
        }
        throw new SpriterException("Call init() before updating!");
    }

    public static void update() {
        if (initialized) {
            for (Player player : players) {
                player.update();
            }
            return;
        }
        throw new SpriterException("Call init() before updating!");
    }

    public static void draw() {
        if (initialized) {
            for (Player player : players) {
                drawer.loader = entityToLoader.get(player.getEntity());
                drawer.draw(player);
            }
            return;
        }
        throw new SpriterException("Call init() before drawing!");
    }

    public static Drawer drawer() {
        return drawer;
    }

    public static Data getData(String str) {
        return loadedData.get(str);
    }

    public static int players() {
        return players.size();
    }

    public static void dispose() {
        drawer = null;
        drawerDependencies = new Object[1];
        drawerTypes = new Class[1];
        drawerTypes[0] = Loader.class;
        entityToLoader.clear();
        for (Loader loader : loaders) {
            loader.dispose();
        }
        loaders.clear();
        loadedData.clear();
        loaderClass = null;
        loaderTypes = new Class[1];
        loaderTypes[0] = Data.class;
        loaderDependencies = new Object[1];
        players.clear();
        initialized = false;
    }
}
