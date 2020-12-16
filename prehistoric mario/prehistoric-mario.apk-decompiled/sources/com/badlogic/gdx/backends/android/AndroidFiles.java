package com.badlogic.gdx.backends.android;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.res.AssetManager;
import android.os.Environment;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.io.IOException;

public class AndroidFiles implements Files {
    protected final AssetManager assets;
    private ZipResourceFile expansionFile = null;
    protected final String localpath;
    protected final String sdcard = (Environment.getExternalStorageDirectory().getAbsolutePath() + "/");

    @Override // com.badlogic.gdx.Files
    public boolean isLocalStorageAvailable() {
        return true;
    }

    public AndroidFiles(AssetManager assetManager) {
        this.assets = assetManager;
        this.localpath = this.sdcard;
    }

    public AndroidFiles(AssetManager assetManager, String str) {
        this.assets = assetManager;
        if (!str.endsWith("/")) {
            str = str + "/";
        }
        this.localpath = str;
    }

    @Override // com.badlogic.gdx.Files
    public FileHandle getFileHandle(String str, Files.FileType fileType) {
        AndroidFileHandle androidFileHandle = new AndroidFileHandle(fileType == Files.FileType.Internal ? this.assets : null, str, fileType);
        return (this.expansionFile == null || fileType != Files.FileType.Internal) ? androidFileHandle : getZipFileHandleIfExists(androidFileHandle, str);
    }

    private FileHandle getZipFileHandleIfExists(FileHandle fileHandle, String str) {
        try {
            this.assets.open(str).close();
            return fileHandle;
        } catch (Exception unused) {
            AndroidZipFileHandle androidZipFileHandle = new AndroidZipFileHandle(str);
            return (androidZipFileHandle.isDirectory() && !androidZipFileHandle.exists()) ? fileHandle : androidZipFileHandle;
        }
    }

    @Override // com.badlogic.gdx.Files
    public FileHandle classpath(String str) {
        return new AndroidFileHandle((AssetManager) null, str, Files.FileType.Classpath);
    }

    @Override // com.badlogic.gdx.Files
    public FileHandle internal(String str) {
        AndroidFileHandle androidFileHandle = new AndroidFileHandle(this.assets, str, Files.FileType.Internal);
        return this.expansionFile != null ? getZipFileHandleIfExists(androidFileHandle, str) : androidFileHandle;
    }

    @Override // com.badlogic.gdx.Files
    public FileHandle external(String str) {
        return new AndroidFileHandle((AssetManager) null, str, Files.FileType.External);
    }

    @Override // com.badlogic.gdx.Files
    public FileHandle absolute(String str) {
        return new AndroidFileHandle((AssetManager) null, str, Files.FileType.Absolute);
    }

    @Override // com.badlogic.gdx.Files
    public FileHandle local(String str) {
        return new AndroidFileHandle((AssetManager) null, str, Files.FileType.Local);
    }

    @Override // com.badlogic.gdx.Files
    public String getExternalStoragePath() {
        return this.sdcard;
    }

    @Override // com.badlogic.gdx.Files
    public boolean isExternalStorageAvailable() {
        return Environment.getExternalStorageState().equals("mounted");
    }

    @Override // com.badlogic.gdx.Files
    public String getLocalStoragePath() {
        return this.localpath;
    }

    public boolean setAPKExpansion(int i, int i2) {
        Context context;
        try {
            if (Gdx.app instanceof Activity) {
                context = ((Activity) Gdx.app).getBaseContext();
            } else if (Gdx.app instanceof Fragment) {
                context = ((Fragment) Gdx.app).getActivity().getBaseContext();
            } else {
                throw new GdxRuntimeException("APK expansion not supported for application type");
            }
            this.expansionFile = APKExpansionSupport.getAPKExpansionZipFile(context, i, i2);
            return this.expansionFile != null;
        } catch (IOException unused) {
            throw new GdxRuntimeException("APK expansion main version " + i + " or patch version " + i2 + " couldn't be opened!");
        }
    }

    public ZipResourceFile getExpansionFile() {
        return this.expansionFile;
    }
}
