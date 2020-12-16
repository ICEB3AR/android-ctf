package com.badlogic.gdx.backends.android;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;

public class AndroidFileHandle extends FileHandle {
    private final AssetManager assets;

    AndroidFileHandle(AssetManager assetManager, String str, Files.FileType fileType) {
        super(str.replace('\\', '/'), fileType);
        this.assets = assetManager;
    }

    AndroidFileHandle(AssetManager assetManager, File file, Files.FileType fileType) {
        super(file, fileType);
        this.assets = assetManager;
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public FileHandle child(String str) {
        String replace = str.replace('\\', '/');
        if (this.file.getPath().length() == 0) {
            return new AndroidFileHandle(this.assets, new File(replace), this.type);
        }
        return new AndroidFileHandle(this.assets, new File(this.file, replace), this.type);
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public FileHandle sibling(String str) {
        String replace = str.replace('\\', '/');
        if (this.file.getPath().length() != 0) {
            return Gdx.files.getFileHandle(new File(this.file.getParent(), replace).getPath(), this.type);
        }
        throw new GdxRuntimeException("Cannot get the sibling of the root.");
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public FileHandle parent() {
        File parentFile = this.file.getParentFile();
        if (parentFile == null) {
            if (this.type == Files.FileType.Absolute) {
                parentFile = new File("/");
            } else {
                parentFile = new File(BuildConfig.FLAVOR);
            }
        }
        return new AndroidFileHandle(this.assets, parentFile, this.type);
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public InputStream read() {
        if (this.type != Files.FileType.Internal) {
            return super.read();
        }
        try {
            return this.assets.open(this.file.getPath());
        } catch (IOException e) {
            throw new GdxRuntimeException("Error reading file: " + this.file + " (" + this.type + ")", e);
        }
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public ByteBuffer map(FileChannel.MapMode mapMode) {
        Throwable th;
        Exception e;
        if (this.type != Files.FileType.Internal) {
            return super.map(mapMode);
        }
        FileInputStream fileInputStream = null;
        try {
            AssetFileDescriptor assetFileDescriptor = getAssetFileDescriptor();
            long startOffset = assetFileDescriptor.getStartOffset();
            long declaredLength = assetFileDescriptor.getDeclaredLength();
            FileInputStream fileInputStream2 = new FileInputStream(assetFileDescriptor.getFileDescriptor());
            try {
                MappedByteBuffer map = fileInputStream2.getChannel().map(mapMode, startOffset, declaredLength);
                map.order(ByteOrder.nativeOrder());
                StreamUtils.closeQuietly(fileInputStream2);
                return map;
            } catch (Exception e2) {
                e = e2;
                fileInputStream = fileInputStream2;
                try {
                    throw new GdxRuntimeException("Error memory mapping file: " + this + " (" + this.type + ")", e);
                } catch (Throwable th2) {
                    th = th2;
                    StreamUtils.closeQuietly(fileInputStream);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                fileInputStream = fileInputStream2;
                StreamUtils.closeQuietly(fileInputStream);
                throw th;
            }
        } catch (Exception e3) {
            e = e3;
            throw new GdxRuntimeException("Error memory mapping file: " + this + " (" + this.type + ")", e);
        }
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public FileHandle[] list() {
        if (this.type != Files.FileType.Internal) {
            return super.list();
        }
        try {
            String[] list = this.assets.list(this.file.getPath());
            FileHandle[] fileHandleArr = new FileHandle[list.length];
            int length = fileHandleArr.length;
            for (int i = 0; i < length; i++) {
                fileHandleArr[i] = new AndroidFileHandle(this.assets, new File(this.file, list[i]), this.type);
            }
            return fileHandleArr;
        } catch (Exception e) {
            throw new GdxRuntimeException("Error listing children: " + this.file + " (" + this.type + ")", e);
        }
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public FileHandle[] list(FileFilter fileFilter) {
        if (this.type != Files.FileType.Internal) {
            return super.list(fileFilter);
        }
        try {
            String[] list = this.assets.list(this.file.getPath());
            FileHandle[] fileHandleArr = new FileHandle[list.length];
            int length = fileHandleArr.length;
            int i = 0;
            for (int i2 = 0; i2 < length; i2++) {
                AndroidFileHandle androidFileHandle = new AndroidFileHandle(this.assets, new File(this.file, list[i2]), this.type);
                if (fileFilter.accept(androidFileHandle.file())) {
                    fileHandleArr[i] = androidFileHandle;
                    i++;
                }
            }
            if (i >= list.length) {
                return fileHandleArr;
            }
            FileHandle[] fileHandleArr2 = new FileHandle[i];
            System.arraycopy(fileHandleArr, 0, fileHandleArr2, 0, i);
            return fileHandleArr2;
        } catch (Exception e) {
            throw new GdxRuntimeException("Error listing children: " + this.file + " (" + this.type + ")", e);
        }
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public FileHandle[] list(FilenameFilter filenameFilter) {
        if (this.type != Files.FileType.Internal) {
            return super.list(filenameFilter);
        }
        try {
            String[] list = this.assets.list(this.file.getPath());
            FileHandle[] fileHandleArr = new FileHandle[list.length];
            int length = fileHandleArr.length;
            int i = 0;
            for (int i2 = 0; i2 < length; i2++) {
                String str = list[i2];
                if (filenameFilter.accept(this.file, str)) {
                    fileHandleArr[i] = new AndroidFileHandle(this.assets, new File(this.file, str), this.type);
                    i++;
                }
            }
            if (i >= list.length) {
                return fileHandleArr;
            }
            FileHandle[] fileHandleArr2 = new FileHandle[i];
            System.arraycopy(fileHandleArr, 0, fileHandleArr2, 0, i);
            return fileHandleArr2;
        } catch (Exception e) {
            throw new GdxRuntimeException("Error listing children: " + this.file + " (" + this.type + ")", e);
        }
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public FileHandle[] list(String str) {
        if (this.type != Files.FileType.Internal) {
            return super.list(str);
        }
        try {
            String[] list = this.assets.list(this.file.getPath());
            FileHandle[] fileHandleArr = new FileHandle[list.length];
            int length = fileHandleArr.length;
            int i = 0;
            for (int i2 = 0; i2 < length; i2++) {
                String str2 = list[i2];
                if (str2.endsWith(str)) {
                    fileHandleArr[i] = new AndroidFileHandle(this.assets, new File(this.file, str2), this.type);
                    i++;
                }
            }
            if (i >= list.length) {
                return fileHandleArr;
            }
            FileHandle[] fileHandleArr2 = new FileHandle[i];
            System.arraycopy(fileHandleArr, 0, fileHandleArr2, 0, i);
            return fileHandleArr2;
        } catch (Exception e) {
            throw new GdxRuntimeException("Error listing children: " + this.file + " (" + this.type + ")", e);
        }
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public boolean isDirectory() {
        if (this.type != Files.FileType.Internal) {
            return super.isDirectory();
        }
        try {
            if (this.assets.list(this.file.getPath()).length > 0) {
                return true;
            }
            return false;
        } catch (IOException unused) {
            return false;
        }
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public boolean exists() {
        if (this.type != Files.FileType.Internal) {
            return super.exists();
        }
        String path = this.file.getPath();
        try {
            this.assets.open(path).close();
            return true;
        } catch (Exception unused) {
            try {
                if (this.assets.list(path).length > 0) {
                    return true;
                }
                return false;
            } catch (Exception unused2) {
                return false;
            }
        }
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public long length() {
        if (this.type == Files.FileType.Internal) {
            AssetFileDescriptor assetFileDescriptor = null;
            try {
                assetFileDescriptor = this.assets.openFd(this.file.getPath());
                long length = assetFileDescriptor.getLength();
                if (assetFileDescriptor != null) {
                    try {
                        assetFileDescriptor.close();
                    } catch (IOException unused) {
                    }
                }
                return length;
            } catch (IOException unused2) {
                if (assetFileDescriptor != null) {
                    try {
                        assetFileDescriptor.close();
                    } catch (IOException unused3) {
                    }
                }
            } catch (Throwable th) {
                if (assetFileDescriptor != null) {
                    try {
                        assetFileDescriptor.close();
                    } catch (IOException unused4) {
                    }
                }
                throw th;
            }
        }
        return super.length();
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public long lastModified() {
        return super.lastModified();
    }

    @Override // com.badlogic.gdx.files.FileHandle
    public File file() {
        if (this.type == Files.FileType.Local) {
            return new File(Gdx.files.getLocalStoragePath(), this.file.getPath());
        }
        return super.file();
    }

    public AssetFileDescriptor getAssetFileDescriptor() throws IOException {
        AssetManager assetManager = this.assets;
        if (assetManager != null) {
            return assetManager.openFd(path());
        }
        return null;
    }
}
