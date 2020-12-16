package com.badlogic.gdx.assets;

import com.badlogic.gdx.assets.loaders.AssetLoader;
import com.badlogic.gdx.assets.loaders.AsynchronousAssetLoader;
import com.badlogic.gdx.assets.loaders.SynchronousAssetLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.TimeUtils;
import com.badlogic.gdx.utils.async.AsyncExecutor;
import com.badlogic.gdx.utils.async.AsyncResult;
import com.badlogic.gdx.utils.async.AsyncTask;

/* access modifiers changed from: package-private */
public class AssetLoadingTask implements AsyncTask<Void> {
    volatile Object asset = null;
    final AssetDescriptor assetDesc;
    volatile boolean asyncDone = false;
    volatile boolean cancel = false;
    volatile Array<AssetDescriptor> dependencies;
    volatile boolean dependenciesLoaded = false;
    volatile AsyncResult<Void> depsFuture = null;
    final AsyncExecutor executor;
    volatile AsyncResult<Void> loadFuture = null;
    final AssetLoader loader;
    AssetManager manager;
    final long startTime;
    int ticks = 0;

    public AssetLoadingTask(AssetManager assetManager, AssetDescriptor assetDescriptor, AssetLoader assetLoader, AsyncExecutor asyncExecutor) {
        this.manager = assetManager;
        this.assetDesc = assetDescriptor;
        this.loader = assetLoader;
        this.executor = asyncExecutor;
        this.startTime = assetManager.log.getLevel() == 3 ? TimeUtils.nanoTime() : 0;
    }

    @Override // com.badlogic.gdx.utils.async.AsyncTask
    public Void call() throws Exception {
        AsynchronousAssetLoader asynchronousAssetLoader = (AsynchronousAssetLoader) this.loader;
        if (!this.dependenciesLoaded) {
            this.dependencies = asynchronousAssetLoader.getDependencies(this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
            if (this.dependencies != null) {
                removeDuplicates(this.dependencies);
                this.manager.injectDependencies(this.assetDesc.fileName, this.dependencies);
                return null;
            }
            asynchronousAssetLoader.loadAsync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
            this.asyncDone = true;
            return null;
        }
        asynchronousAssetLoader.loadAsync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
        return null;
    }

    public boolean update() {
        this.ticks++;
        if (this.loader instanceof SynchronousAssetLoader) {
            handleSyncLoader();
        } else {
            handleAsyncLoader();
        }
        if (this.asset != null) {
            return true;
        }
        return false;
    }

    private void handleSyncLoader() {
        SynchronousAssetLoader synchronousAssetLoader = (SynchronousAssetLoader) this.loader;
        if (!this.dependenciesLoaded) {
            this.dependenciesLoaded = true;
            this.dependencies = synchronousAssetLoader.getDependencies(this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
            if (this.dependencies == null) {
                this.asset = synchronousAssetLoader.load(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
                return;
            }
            removeDuplicates(this.dependencies);
            this.manager.injectDependencies(this.assetDesc.fileName, this.dependencies);
            return;
        }
        this.asset = synchronousAssetLoader.load(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
    }

    private void handleAsyncLoader() {
        AsynchronousAssetLoader asynchronousAssetLoader = (AsynchronousAssetLoader) this.loader;
        if (!this.dependenciesLoaded) {
            if (this.depsFuture == null) {
                this.depsFuture = this.executor.submit(this);
            } else if (this.depsFuture.isDone()) {
                try {
                    this.depsFuture.get();
                    this.dependenciesLoaded = true;
                    if (this.asyncDone) {
                        this.asset = asynchronousAssetLoader.loadSync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
                    }
                } catch (Exception e) {
                    throw new GdxRuntimeException("Couldn't load dependencies of asset: " + this.assetDesc.fileName, e);
                }
            }
        } else if (this.loadFuture == null && !this.asyncDone) {
            this.loadFuture = this.executor.submit(this);
        } else if (this.asyncDone) {
            this.asset = asynchronousAssetLoader.loadSync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
        } else if (this.loadFuture.isDone()) {
            try {
                this.loadFuture.get();
                this.asset = asynchronousAssetLoader.loadSync(this.manager, this.assetDesc.fileName, resolve(this.loader, this.assetDesc), this.assetDesc.params);
            } catch (Exception e2) {
                throw new GdxRuntimeException("Couldn't load asset: " + this.assetDesc.fileName, e2);
            }
        }
    }

    private FileHandle resolve(AssetLoader assetLoader, AssetDescriptor assetDescriptor) {
        if (assetDescriptor.file == null) {
            assetDescriptor.file = assetLoader.resolve(assetDescriptor.fileName);
        }
        return assetDescriptor.file;
    }

    public Object getAsset() {
        return this.asset;
    }

    private void removeDuplicates(Array<AssetDescriptor> array) {
        boolean z = array.ordered;
        array.ordered = true;
        for (int i = 0; i < array.size; i++) {
            String str = array.get(i).fileName;
            Class<T> cls = array.get(i).type;
            for (int i2 = array.size - 1; i2 > i; i2--) {
                if (cls == array.get(i2).type && str.equals(array.get(i2).fileName)) {
                    array.removeIndex(i2);
                }
            }
        }
        array.ordered = z;
    }
}
