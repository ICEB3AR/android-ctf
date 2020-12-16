package com.brashmonkey.spriter;

import com.alles.platformer.BuildConfig;
import java.io.File;
import java.util.HashMap;

public abstract class Loader<R> {
    protected Data data;
    private boolean disposed;
    protected final HashMap<FileReference, R> resources;
    protected String root = BuildConfig.FLAVOR;

    /* access modifiers changed from: protected */
    public void beginLoading() {
    }

    /* access modifiers changed from: protected */
    public void finishLoading() {
    }

    /* access modifiers changed from: protected */
    public abstract R loadResource(FileReference fileReference);

    public Loader(Data data2) {
        this.data = data2;
        this.resources = new HashMap<>(100);
    }

    public void load(String str) {
        this.root = str;
        beginLoading();
        Folder[] folderArr = this.data.folders;
        for (Folder folder : folderArr) {
            for (File file : folder.files) {
                FileReference fileReference = new FileReference(folder.id, file.id);
                this.resources.put(fileReference, loadResource(fileReference));
            }
        }
        this.disposed = false;
        finishLoading();
    }

    public void load(File file) {
        load(file.getParent());
    }

    public R get(FileReference fileReference) {
        return this.resources.get(fileReference);
    }

    public void dispose() {
        this.resources.clear();
        this.data = null;
        this.root = BuildConfig.FLAVOR;
        this.disposed = true;
    }

    public boolean isDisposed() {
        return this.disposed;
    }
}
