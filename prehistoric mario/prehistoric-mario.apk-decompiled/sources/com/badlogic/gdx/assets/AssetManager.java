package com.badlogic.gdx.assets;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.assets.loaders.AssetLoader;
import com.badlogic.gdx.assets.loaders.BitmapFontLoader;
import com.badlogic.gdx.assets.loaders.CubemapLoader;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.I18NBundleLoader;
import com.badlogic.gdx.assets.loaders.MusicLoader;
import com.badlogic.gdx.assets.loaders.ParticleEffectLoader;
import com.badlogic.gdx.assets.loaders.PixmapLoader;
import com.badlogic.gdx.assets.loaders.ShaderProgramLoader;
import com.badlogic.gdx.assets.loaders.SkinLoader;
import com.badlogic.gdx.assets.loaders.SoundLoader;
import com.badlogic.gdx.assets.loaders.TextureAtlasLoader;
import com.badlogic.gdx.assets.loaders.TextureLoader;
import com.badlogic.gdx.assets.loaders.resolvers.InternalFileHandleResolver;
import com.badlogic.gdx.audio.Music;
import com.badlogic.gdx.audio.Sound;
import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.ParticleEffect;
import com.badlogic.gdx.graphics.g2d.PolygonRegion;
import com.badlogic.gdx.graphics.g2d.PolygonRegionLoader;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.loader.G3dModelLoader;
import com.badlogic.gdx.graphics.g3d.loader.ObjLoader;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.scenes.scene2d.ui.Skin;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.I18NBundle;
import com.badlogic.gdx.utils.JsonReader;
import com.badlogic.gdx.utils.Logger;
import com.badlogic.gdx.utils.ObjectIntMap;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.ObjectSet;
import com.badlogic.gdx.utils.TimeUtils;
import com.badlogic.gdx.utils.UBJsonReader;
import com.badlogic.gdx.utils.async.AsyncExecutor;
import com.badlogic.gdx.utils.async.ThreadUtils;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import java.util.Iterator;
import java.util.Stack;

public class AssetManager implements Disposable {
    final ObjectMap<String, Array<String>> assetDependencies;
    final ObjectMap<String, Class> assetTypes;
    final ObjectMap<Class, ObjectMap<String, RefCountedContainer>> assets;
    final AsyncExecutor executor;
    final ObjectSet<String> injected;
    AssetErrorListener listener;
    final Array<AssetDescriptor> loadQueue;
    int loaded;
    final ObjectMap<Class, ObjectMap<String, AssetLoader>> loaders;
    Logger log;
    int peakTasks;
    final FileHandleResolver resolver;
    final Stack<AssetLoadingTask> tasks;
    int toLoad;

    public AssetManager() {
        this(new InternalFileHandleResolver());
    }

    public AssetManager(FileHandleResolver fileHandleResolver) {
        this(fileHandleResolver, true);
    }

    public AssetManager(FileHandleResolver fileHandleResolver, boolean z) {
        this.assets = new ObjectMap<>();
        this.assetTypes = new ObjectMap<>();
        this.assetDependencies = new ObjectMap<>();
        this.injected = new ObjectSet<>();
        this.loaders = new ObjectMap<>();
        this.loadQueue = new Array<>();
        this.tasks = new Stack<>();
        this.listener = null;
        this.loaded = 0;
        this.toLoad = 0;
        this.peakTasks = 0;
        this.log = new Logger("AssetManager", 0);
        this.resolver = fileHandleResolver;
        if (z) {
            setLoader(BitmapFont.class, new BitmapFontLoader(fileHandleResolver));
            setLoader(Music.class, new MusicLoader(fileHandleResolver));
            setLoader(Pixmap.class, new PixmapLoader(fileHandleResolver));
            setLoader(Sound.class, new SoundLoader(fileHandleResolver));
            setLoader(TextureAtlas.class, new TextureAtlasLoader(fileHandleResolver));
            setLoader(Texture.class, new TextureLoader(fileHandleResolver));
            setLoader(Skin.class, new SkinLoader(fileHandleResolver));
            setLoader(ParticleEffect.class, new ParticleEffectLoader(fileHandleResolver));
            setLoader(com.badlogic.gdx.graphics.g3d.particles.ParticleEffect.class, new com.badlogic.gdx.graphics.g3d.particles.ParticleEffectLoader(fileHandleResolver));
            setLoader(PolygonRegion.class, new PolygonRegionLoader(fileHandleResolver));
            setLoader(I18NBundle.class, new I18NBundleLoader(fileHandleResolver));
            setLoader(Model.class, ".g3dj", new G3dModelLoader(new JsonReader(), fileHandleResolver));
            setLoader(Model.class, ".g3db", new G3dModelLoader(new UBJsonReader(), fileHandleResolver));
            setLoader(Model.class, ".obj", new ObjLoader(fileHandleResolver));
            setLoader(ShaderProgram.class, new ShaderProgramLoader(fileHandleResolver));
            setLoader(Cubemap.class, new CubemapLoader(fileHandleResolver));
        }
        this.executor = new AsyncExecutor(1, "AssetManager");
    }

    public FileHandleResolver getFileHandleResolver() {
        return this.resolver;
    }

    public synchronized <T> T get(String str) {
        T t;
        Class<T> cls = this.assetTypes.get(str);
        if (cls != null) {
            ObjectMap<String, RefCountedContainer> objectMap = this.assets.get(cls);
            if (objectMap != null) {
                RefCountedContainer refCountedContainer = objectMap.get(str);
                if (refCountedContainer != null) {
                    t = (T) refCountedContainer.getObject(cls);
                    if (t == null) {
                        throw new GdxRuntimeException("Asset not loaded: " + str);
                    }
                } else {
                    throw new GdxRuntimeException("Asset not loaded: " + str);
                }
            } else {
                throw new GdxRuntimeException("Asset not loaded: " + str);
            }
        } else {
            throw new GdxRuntimeException("Asset not loaded: " + str);
        }
        return t;
    }

    public synchronized <T> T get(String str, Class<T> cls) {
        T t;
        ObjectMap<String, RefCountedContainer> objectMap = this.assets.get(cls);
        if (objectMap != null) {
            RefCountedContainer refCountedContainer = objectMap.get(str);
            if (refCountedContainer != null) {
                t = (T) refCountedContainer.getObject(cls);
                if (t == null) {
                    throw new GdxRuntimeException("Asset not loaded: " + str);
                }
            } else {
                throw new GdxRuntimeException("Asset not loaded: " + str);
            }
        } else {
            throw new GdxRuntimeException("Asset not loaded: " + str);
        }
        return t;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r4v0, resolved type: com.badlogic.gdx.utils.Array<T> */
    /* JADX WARN: Multi-variable type inference failed */
    public synchronized <T> Array<T> getAll(Class<T> cls, Array<T> array) {
        ObjectMap<String, RefCountedContainer> objectMap = this.assets.get(cls);
        if (objectMap != null) {
            ObjectMap.Entries<String, RefCountedContainer> it = objectMap.entries().iterator();
            while (it.hasNext()) {
                array.add(((ObjectMap.Entry) it.next()).value.getObject(cls));
            }
        }
        return array;
    }

    public synchronized <T> T get(AssetDescriptor<T> assetDescriptor) {
        return (T) get(assetDescriptor.fileName, assetDescriptor.type);
    }

    public synchronized boolean contains(String str) {
        if (this.tasks.size() > 0 && this.tasks.firstElement().assetDesc.fileName.equals(str)) {
            return true;
        }
        for (int i = 0; i < this.loadQueue.size; i++) {
            if (this.loadQueue.get(i).fileName.equals(str)) {
                return true;
            }
        }
        return isLoaded(str);
    }

    public synchronized boolean contains(String str, Class cls) {
        if (this.tasks.size() > 0) {
            AssetDescriptor assetDescriptor = this.tasks.firstElement().assetDesc;
            if (assetDescriptor.type == cls && assetDescriptor.fileName.equals(str)) {
                return true;
            }
        }
        for (int i = 0; i < this.loadQueue.size; i++) {
            AssetDescriptor assetDescriptor2 = this.loadQueue.get(i);
            if (assetDescriptor2.type == cls && assetDescriptor2.fileName.equals(str)) {
                return true;
            }
        }
        return isLoaded(str, cls);
    }

    public synchronized void unload(String str) {
        if (this.tasks.size() > 0) {
            AssetLoadingTask firstElement = this.tasks.firstElement();
            if (firstElement.assetDesc.fileName.equals(str)) {
                firstElement.cancel = true;
                this.log.info("Unload (from tasks): " + str);
                return;
            }
        }
        int i = 0;
        while (true) {
            if (i >= this.loadQueue.size) {
                i = -1;
                break;
            } else if (this.loadQueue.get(i).fileName.equals(str)) {
                break;
            } else {
                i++;
            }
        }
        if (i != -1) {
            this.toLoad--;
            this.loadQueue.removeIndex(i);
            this.log.info("Unload (from queue): " + str);
            return;
        }
        Class cls = this.assetTypes.get(str);
        if (cls != null) {
            RefCountedContainer refCountedContainer = this.assets.get(cls).get(str);
            refCountedContainer.decRefCount();
            if (refCountedContainer.getRefCount() <= 0) {
                this.log.info("Unload (dispose): " + str);
                if (refCountedContainer.getObject(Object.class) instanceof Disposable) {
                    ((Disposable) refCountedContainer.getObject(Object.class)).dispose();
                }
                this.assetTypes.remove(str);
                this.assets.get(cls).remove(str);
            } else {
                this.log.info("Unload (decrement): " + str);
            }
            Array<String> array = this.assetDependencies.get(str);
            if (array != null) {
                Iterator<String> it = array.iterator();
                while (it.hasNext()) {
                    String next = it.next();
                    if (isLoaded(next)) {
                        unload(next);
                    }
                }
            }
            if (refCountedContainer.getRefCount() <= 0) {
                this.assetDependencies.remove(str);
            }
            return;
        }
        throw new GdxRuntimeException("Asset not loaded: " + str);
    }

    /* JADX WARNING: Removed duplicated region for block: B:10:0x0020  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized <T> boolean containsAsset(T r6) {
        /*
            r5 = this;
            monitor-enter(r5)
            com.badlogic.gdx.utils.ObjectMap<java.lang.Class, com.badlogic.gdx.utils.ObjectMap<java.lang.String, com.badlogic.gdx.assets.RefCountedContainer>> r0 = r5.assets     // Catch:{ all -> 0x003f }
            java.lang.Class r1 = r6.getClass()     // Catch:{ all -> 0x003f }
            java.lang.Object r0 = r0.get(r1)     // Catch:{ all -> 0x003f }
            com.badlogic.gdx.utils.ObjectMap r0 = (com.badlogic.gdx.utils.ObjectMap) r0     // Catch:{ all -> 0x003f }
            r1 = 0
            if (r0 != 0) goto L_0x0012
            monitor-exit(r5)
            return r1
        L_0x0012:
            com.badlogic.gdx.utils.ObjectMap$Keys r2 = r0.keys()
            com.badlogic.gdx.utils.ObjectMap$Keys r2 = r2.iterator()
        L_0x001a:
            boolean r3 = r2.hasNext()
            if (r3 == 0) goto L_0x003d
            java.lang.Object r3 = r2.next()
            java.lang.String r3 = (java.lang.String) r3
            java.lang.Object r3 = r0.get(r3)
            com.badlogic.gdx.assets.RefCountedContainer r3 = (com.badlogic.gdx.assets.RefCountedContainer) r3
            java.lang.Class<java.lang.Object> r4 = java.lang.Object.class
            java.lang.Object r3 = r3.getObject(r4)
            if (r3 == r6) goto L_0x003a
            boolean r3 = r6.equals(r3)
            if (r3 == 0) goto L_0x001a
        L_0x003a:
            r6 = 1
            monitor-exit(r5)
            return r6
        L_0x003d:
            monitor-exit(r5)
            return r1
        L_0x003f:
            r6 = move-exception
            monitor-exit(r5)
            goto L_0x0043
        L_0x0042:
            throw r6
        L_0x0043:
            goto L_0x0042
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.assets.AssetManager.containsAsset(java.lang.Object):boolean");
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x000b A[LOOP:0: B:3:0x000b->B:23:0x000b, LOOP_END, SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:8:0x002d  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized <T> java.lang.String getAssetFileName(T r7) {
        /*
            r6 = this;
            monitor-enter(r6)
            com.badlogic.gdx.utils.ObjectMap<java.lang.Class, com.badlogic.gdx.utils.ObjectMap<java.lang.String, com.badlogic.gdx.assets.RefCountedContainer>> r0 = r6.assets     // Catch:{ all -> 0x004c }
            com.badlogic.gdx.utils.ObjectMap$Keys r0 = r0.keys()     // Catch:{ all -> 0x004c }
            com.badlogic.gdx.utils.ObjectMap$Keys r0 = r0.iterator()     // Catch:{ all -> 0x004c }
        L_0x000b:
            boolean r1 = r0.hasNext()     // Catch:{ all -> 0x004c }
            if (r1 == 0) goto L_0x0049
            java.lang.Object r1 = r0.next()     // Catch:{ all -> 0x004c }
            java.lang.Class r1 = (java.lang.Class) r1     // Catch:{ all -> 0x004c }
            com.badlogic.gdx.utils.ObjectMap<java.lang.Class, com.badlogic.gdx.utils.ObjectMap<java.lang.String, com.badlogic.gdx.assets.RefCountedContainer>> r2 = r6.assets     // Catch:{ all -> 0x004c }
            java.lang.Object r1 = r2.get(r1)     // Catch:{ all -> 0x004c }
            com.badlogic.gdx.utils.ObjectMap r1 = (com.badlogic.gdx.utils.ObjectMap) r1     // Catch:{ all -> 0x004c }
            com.badlogic.gdx.utils.ObjectMap$Keys r2 = r1.keys()     // Catch:{ all -> 0x004c }
            com.badlogic.gdx.utils.ObjectMap$Keys r2 = r2.iterator()     // Catch:{ all -> 0x004c }
        L_0x0027:
            boolean r3 = r2.hasNext()     // Catch:{ all -> 0x004c }
            if (r3 == 0) goto L_0x000b
            java.lang.Object r3 = r2.next()     // Catch:{ all -> 0x004c }
            java.lang.String r3 = (java.lang.String) r3     // Catch:{ all -> 0x004c }
            java.lang.Object r4 = r1.get(r3)     // Catch:{ all -> 0x004c }
            com.badlogic.gdx.assets.RefCountedContainer r4 = (com.badlogic.gdx.assets.RefCountedContainer) r4     // Catch:{ all -> 0x004c }
            java.lang.Class<java.lang.Object> r5 = java.lang.Object.class
            java.lang.Object r4 = r4.getObject(r5)     // Catch:{ all -> 0x004c }
            if (r4 == r7) goto L_0x0047
            boolean r4 = r7.equals(r4)     // Catch:{ all -> 0x004c }
            if (r4 == 0) goto L_0x0027
        L_0x0047:
            monitor-exit(r6)
            return r3
        L_0x0049:
            r7 = 0
            monitor-exit(r6)
            return r7
        L_0x004c:
            r7 = move-exception
            monitor-exit(r6)
            goto L_0x0050
        L_0x004f:
            throw r7
        L_0x0050:
            goto L_0x004f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.assets.AssetManager.getAssetFileName(java.lang.Object):java.lang.String");
    }

    public synchronized boolean isLoaded(AssetDescriptor assetDescriptor) {
        return isLoaded(assetDescriptor.fileName);
    }

    public synchronized boolean isLoaded(String str) {
        if (str == null) {
            return false;
        }
        return this.assetTypes.containsKey(str);
    }

    public synchronized boolean isLoaded(String str, Class cls) {
        ObjectMap<String, RefCountedContainer> objectMap = this.assets.get(cls);
        boolean z = false;
        if (objectMap == null) {
            return false;
        }
        RefCountedContainer refCountedContainer = objectMap.get(str);
        if (refCountedContainer == null) {
            return false;
        }
        if (refCountedContainer.getObject(cls) != null) {
            z = true;
        }
        return z;
    }

    public <T> AssetLoader getLoader(Class<T> cls) {
        return getLoader(cls, null);
    }

    public <T> AssetLoader getLoader(Class<T> cls, String str) {
        ObjectMap<String, AssetLoader> objectMap = this.loaders.get(cls);
        V v = null;
        if (objectMap != null && objectMap.size >= 1) {
            if (str == null) {
                return objectMap.get(BuildConfig.FLAVOR);
            }
            int i = -1;
            ObjectMap.Entries<String, AssetLoader> it = objectMap.entries().iterator();
            while (it.hasNext()) {
                ObjectMap.Entry entry = (ObjectMap.Entry) it.next();
                if (entry.key.length() > i && str.endsWith(entry.key)) {
                    v = entry.value;
                    i = entry.key.length();
                }
            }
        }
        return v;
    }

    public synchronized <T> void load(String str, Class<T> cls) {
        load(str, cls, null);
    }

    public synchronized <T> void load(String str, Class<T> cls, AssetLoaderParameters<T> assetLoaderParameters) {
        if (getLoader(cls, str) != null) {
            if (this.loadQueue.size == 0) {
                this.loaded = 0;
                this.toLoad = 0;
                this.peakTasks = 0;
            }
            for (int i = 0; i < this.loadQueue.size; i++) {
                AssetDescriptor assetDescriptor = this.loadQueue.get(i);
                if (assetDescriptor.fileName.equals(str)) {
                    if (!assetDescriptor.type.equals(cls)) {
                        throw new GdxRuntimeException("Asset with name '" + str + "' already in preload queue, but has different type (expected: " + ClassReflection.getSimpleName(cls) + ", found: " + ClassReflection.getSimpleName(assetDescriptor.type) + ")");
                    }
                }
            }
            for (int i2 = 0; i2 < this.tasks.size(); i2++) {
                AssetDescriptor assetDescriptor2 = this.tasks.get(i2).assetDesc;
                if (assetDescriptor2.fileName.equals(str)) {
                    if (!assetDescriptor2.type.equals(cls)) {
                        throw new GdxRuntimeException("Asset with name '" + str + "' already in task list, but has different type (expected: " + ClassReflection.getSimpleName(cls) + ", found: " + ClassReflection.getSimpleName(assetDescriptor2.type) + ")");
                    }
                }
            }
            Class cls2 = this.assetTypes.get(str);
            if (cls2 != null) {
                if (!cls2.equals(cls)) {
                    throw new GdxRuntimeException("Asset with name '" + str + "' already loaded, but has different type (expected: " + ClassReflection.getSimpleName(cls) + ", found: " + ClassReflection.getSimpleName(cls2) + ")");
                }
            }
            this.toLoad++;
            AssetDescriptor assetDescriptor3 = new AssetDescriptor(str, cls, assetLoaderParameters);
            this.loadQueue.add(assetDescriptor3);
            this.log.debug("Queued: " + assetDescriptor3);
        } else {
            throw new GdxRuntimeException("No loader for type: " + ClassReflection.getSimpleName(cls));
        }
    }

    public synchronized void load(AssetDescriptor assetDescriptor) {
        load(assetDescriptor.fileName, assetDescriptor.type, assetDescriptor.params);
    }

    public synchronized boolean update() {
        boolean z = false;
        try {
            if (this.tasks.size() == 0) {
                while (this.loadQueue.size != 0 && this.tasks.size() == 0) {
                    nextTask();
                }
                if (this.tasks.size() == 0) {
                    return true;
                }
            }
            if (updateTask() && this.loadQueue.size == 0 && this.tasks.size() == 0) {
                z = true;
            }
            return z;
        } catch (Throwable th) {
            handleTaskError(th);
            if (this.loadQueue.size == 0) {
                z = true;
            }
            return z;
        }
    }

    public boolean update(int i) {
        boolean update;
        long millis = TimeUtils.millis() + ((long) i);
        while (true) {
            update = update();
            if (update || TimeUtils.millis() > millis) {
                return update;
            }
            ThreadUtils.yield();
        }
        return update;
    }

    public synchronized boolean isFinished() {
        return this.loadQueue.size == 0 && this.tasks.size() == 0;
    }

    public void finishLoading() {
        this.log.debug("Waiting for loading to complete...");
        while (!update()) {
            ThreadUtils.yield();
        }
        this.log.debug("Loading complete.");
    }

    public <T> T finishLoadingAsset(AssetDescriptor assetDescriptor) {
        return (T) finishLoadingAsset(assetDescriptor.fileName);
    }

    public <T> T finishLoadingAsset(String str) {
        ObjectMap<String, RefCountedContainer> objectMap;
        RefCountedContainer refCountedContainer;
        T t;
        Logger logger = this.log;
        logger.debug("Waiting for asset to be loaded: " + str);
        while (true) {
            synchronized (this) {
                Class<T> cls = this.assetTypes.get(str);
                if (cls == null || (objectMap = this.assets.get(cls)) == null || (refCountedContainer = objectMap.get(str)) == null || (t = (T) refCountedContainer.getObject(cls)) == null) {
                    update();
                } else {
                    Logger logger2 = this.log;
                    logger2.debug("Asset loaded: " + str);
                    return t;
                }
            }
            ThreadUtils.yield();
        }
    }

    /* access modifiers changed from: package-private */
    public synchronized void injectDependencies(String str, Array<AssetDescriptor> array) {
        ObjectSet<String> objectSet = this.injected;
        Iterator<AssetDescriptor> it = array.iterator();
        while (it.hasNext()) {
            AssetDescriptor next = it.next();
            if (!objectSet.contains(next.fileName)) {
                objectSet.add(next.fileName);
                injectDependency(str, next);
            }
        }
        objectSet.clear(32);
    }

    private synchronized void injectDependency(String str, AssetDescriptor assetDescriptor) {
        Array<String> array = this.assetDependencies.get(str);
        if (array == null) {
            array = new Array<>();
            this.assetDependencies.put(str, array);
        }
        array.add(assetDescriptor.fileName);
        if (isLoaded(assetDescriptor.fileName)) {
            Logger logger = this.log;
            logger.debug("Dependency already loaded: " + assetDescriptor);
            this.assets.get(this.assetTypes.get(assetDescriptor.fileName)).get(assetDescriptor.fileName).incRefCount();
            incrementRefCountedDependencies(assetDescriptor.fileName);
        } else {
            Logger logger2 = this.log;
            logger2.info("Loading dependency: " + assetDescriptor);
            addTask(assetDescriptor);
        }
    }

    private void nextTask() {
        AssetDescriptor removeIndex = this.loadQueue.removeIndex(0);
        if (isLoaded(removeIndex.fileName)) {
            this.log.debug("Already loaded: " + removeIndex);
            this.assets.get(this.assetTypes.get(removeIndex.fileName)).get(removeIndex.fileName).incRefCount();
            incrementRefCountedDependencies(removeIndex.fileName);
            if (!(removeIndex.params == null || removeIndex.params.loadedCallback == null)) {
                removeIndex.params.loadedCallback.finishedLoading(this, removeIndex.fileName, removeIndex.type);
            }
            this.loaded++;
            return;
        }
        this.log.info("Loading: " + removeIndex);
        addTask(removeIndex);
    }

    private void addTask(AssetDescriptor assetDescriptor) {
        AssetLoader loader = getLoader(assetDescriptor.type, assetDescriptor.fileName);
        if (loader != null) {
            this.tasks.push(new AssetLoadingTask(this, assetDescriptor, loader, this.executor));
            this.peakTasks++;
            return;
        }
        throw new GdxRuntimeException("No loader for type: " + ClassReflection.getSimpleName(assetDescriptor.type));
    }

    /* access modifiers changed from: protected */
    public <T> void addAsset(String str, Class<T> cls, T t) {
        this.assetTypes.put(str, cls);
        ObjectMap<String, RefCountedContainer> objectMap = this.assets.get(cls);
        if (objectMap == null) {
            objectMap = new ObjectMap<>();
            this.assets.put(cls, objectMap);
        }
        objectMap.put(str, new RefCountedContainer(t));
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0022  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0096 A[RETURN] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean updateTask() {
        /*
        // Method dump skipped, instructions count: 151
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.assets.AssetManager.updateTask():boolean");
    }

    /* access modifiers changed from: protected */
    public void taskFailed(AssetDescriptor assetDescriptor, RuntimeException runtimeException) {
        throw runtimeException;
    }

    private void incrementRefCountedDependencies(String str) {
        Array<String> array = this.assetDependencies.get(str);
        if (array != null) {
            Iterator<String> it = array.iterator();
            while (it.hasNext()) {
                String next = it.next();
                this.assets.get(this.assetTypes.get(next)).get(next).incRefCount();
                incrementRefCountedDependencies(next);
            }
        }
    }

    private void handleTaskError(Throwable th) {
        this.log.error("Error loading asset.", th);
        if (!this.tasks.isEmpty()) {
            AssetLoadingTask pop = this.tasks.pop();
            AssetDescriptor assetDescriptor = pop.assetDesc;
            if (pop.dependenciesLoaded && pop.dependencies != null) {
                Iterator<AssetDescriptor> it = pop.dependencies.iterator();
                while (it.hasNext()) {
                    unload(it.next().fileName);
                }
            }
            this.tasks.clear();
            AssetErrorListener assetErrorListener = this.listener;
            if (assetErrorListener != null) {
                assetErrorListener.error(assetDescriptor, th);
                return;
            }
            throw new GdxRuntimeException(th);
        }
        throw new GdxRuntimeException(th);
    }

    public synchronized <T, P extends AssetLoaderParameters<T>> void setLoader(Class<T> cls, AssetLoader<T, P> assetLoader) {
        setLoader(cls, null, assetLoader);
    }

    public synchronized <T, P extends AssetLoaderParameters<T>> void setLoader(Class<T> cls, String str, AssetLoader<T, P> assetLoader) {
        if (cls == null) {
            throw new IllegalArgumentException("type cannot be null.");
        } else if (assetLoader != null) {
            Logger logger = this.log;
            logger.debug("Loader set: " + ClassReflection.getSimpleName(cls) + " -> " + ClassReflection.getSimpleName(assetLoader.getClass()));
            ObjectMap<String, AssetLoader> objectMap = this.loaders.get(cls);
            if (objectMap == null) {
                ObjectMap<Class, ObjectMap<String, AssetLoader>> objectMap2 = this.loaders;
                ObjectMap<String, AssetLoader> objectMap3 = new ObjectMap<>();
                objectMap2.put(cls, objectMap3);
                objectMap = objectMap3;
            }
            if (str == null) {
                str = BuildConfig.FLAVOR;
            }
            objectMap.put(str, assetLoader);
        } else {
            throw new IllegalArgumentException("loader cannot be null.");
        }
    }

    public synchronized int getLoadedAssets() {
        return this.assetTypes.size;
    }

    public synchronized int getQueuedAssets() {
        return this.loadQueue.size + this.tasks.size();
    }

    public synchronized float getProgress() {
        if (this.toLoad == 0) {
            return 1.0f;
        }
        float f = (float) this.loaded;
        if (this.peakTasks > 0) {
            f += ((float) (this.peakTasks - this.tasks.size())) / ((float) this.peakTasks);
        }
        return Math.min(1.0f, f / ((float) this.toLoad));
    }

    public synchronized void setErrorListener(AssetErrorListener assetErrorListener) {
        this.listener = assetErrorListener;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public synchronized void dispose() {
        this.log.debug("Disposing.");
        clear();
        this.executor.dispose();
    }

    public synchronized void clear() {
        this.loadQueue.clear();
        while (!update()) {
        }
        ObjectIntMap objectIntMap = new ObjectIntMap();
        while (this.assetTypes.size > 0) {
            objectIntMap.clear();
            Array<String> array = this.assetTypes.keys().toArray();
            Iterator<String> it = array.iterator();
            while (it.hasNext()) {
                objectIntMap.put(it.next(), 0);
            }
            Iterator<String> it2 = array.iterator();
            while (it2.hasNext()) {
                Array<String> array2 = this.assetDependencies.get(it2.next());
                if (array2 != null) {
                    Iterator<String> it3 = array2.iterator();
                    while (it3.hasNext()) {
                        String next = it3.next();
                        objectIntMap.put(next, objectIntMap.get(next, 0) + 1);
                    }
                }
            }
            Iterator<String> it4 = array.iterator();
            while (it4.hasNext()) {
                String next2 = it4.next();
                if (objectIntMap.get(next2, 0) == 0) {
                    unload(next2);
                }
            }
        }
        this.assets.clear();
        this.assetTypes.clear();
        this.assetDependencies.clear();
        this.loaded = 0;
        this.toLoad = 0;
        this.peakTasks = 0;
        this.loadQueue.clear();
        this.tasks.clear();
    }

    public Logger getLogger() {
        return this.log;
    }

    public void setLogger(Logger logger) {
        this.log = logger;
    }

    public synchronized int getReferenceCount(String str) {
        Class cls;
        cls = this.assetTypes.get(str);
        if (cls != null) {
        } else {
            throw new GdxRuntimeException("Asset not loaded: " + str);
        }
        return this.assets.get(cls).get(str).getRefCount();
    }

    public synchronized void setReferenceCount(String str, int i) {
        Class cls = this.assetTypes.get(str);
        if (cls != null) {
            this.assets.get(cls).get(str).setRefCount(i);
        } else {
            throw new GdxRuntimeException("Asset not loaded: " + str);
        }
    }

    public synchronized String getDiagnostics() {
        StringBuilder sb;
        sb = new StringBuilder(256);
        ObjectMap.Keys<String> it = this.assetTypes.keys().iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            if (sb.length() > 0) {
                sb.append("\n");
            }
            sb.append(str);
            sb.append(", ");
            Class cls = this.assetTypes.get(str);
            Array<String> array = this.assetDependencies.get(str);
            sb.append(ClassReflection.getSimpleName(cls));
            sb.append(", refs: ");
            sb.append(this.assets.get(cls).get(str).getRefCount());
            if (array != null) {
                sb.append(", deps: [");
                Iterator<String> it2 = array.iterator();
                while (it2.hasNext()) {
                    sb.append(it2.next());
                    sb.append(",");
                }
                sb.append("]");
            }
        }
        return sb.toString();
    }

    public synchronized Array<String> getAssetNames() {
        return this.assetTypes.keys().toArray();
    }

    public synchronized Array<String> getDependencies(String str) {
        return this.assetDependencies.get(str);
    }

    public synchronized Class getAssetType(String str) {
        return this.assetTypes.get(str);
    }
}
