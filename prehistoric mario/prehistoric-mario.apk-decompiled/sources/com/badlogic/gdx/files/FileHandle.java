package com.badlogic.gdx.files;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.RandomAccessFile;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;

public class FileHandle {
    protected File file;
    protected Files.FileType type;

    protected FileHandle() {
    }

    public FileHandle(String str) {
        this.file = new File(str);
        this.type = Files.FileType.Absolute;
    }

    public FileHandle(File file2) {
        this.file = file2;
        this.type = Files.FileType.Absolute;
    }

    protected FileHandle(String str, Files.FileType fileType) {
        this.type = fileType;
        this.file = new File(str);
    }

    protected FileHandle(File file2, Files.FileType fileType) {
        this.file = file2;
        this.type = fileType;
    }

    public String path() {
        return this.file.getPath().replace('\\', '/');
    }

    public String name() {
        return this.file.getName();
    }

    public String extension() {
        String name = this.file.getName();
        int lastIndexOf = name.lastIndexOf(46);
        if (lastIndexOf == -1) {
            return BuildConfig.FLAVOR;
        }
        return name.substring(lastIndexOf + 1);
    }

    public String nameWithoutExtension() {
        String name = this.file.getName();
        int lastIndexOf = name.lastIndexOf(46);
        if (lastIndexOf == -1) {
            return name;
        }
        return name.substring(0, lastIndexOf);
    }

    public String pathWithoutExtension() {
        String replace = this.file.getPath().replace('\\', '/');
        int lastIndexOf = replace.lastIndexOf(46);
        if (lastIndexOf == -1) {
            return replace;
        }
        return replace.substring(0, lastIndexOf);
    }

    public Files.FileType type() {
        return this.type;
    }

    public File file() {
        if (this.type == Files.FileType.External) {
            return new File(Gdx.files.getExternalStoragePath(), this.file.getPath());
        }
        return this.file;
    }

    public InputStream read() {
        if (this.type == Files.FileType.Classpath || ((this.type == Files.FileType.Internal && !file().exists()) || (this.type == Files.FileType.Local && !file().exists()))) {
            InputStream resourceAsStream = FileHandle.class.getResourceAsStream("/" + this.file.getPath().replace('\\', '/'));
            if (resourceAsStream != null) {
                return resourceAsStream;
            }
            throw new GdxRuntimeException("File not found: " + this.file + " (" + this.type + ")");
        }
        try {
            return new FileInputStream(file());
        } catch (Exception e) {
            if (file().isDirectory()) {
                throw new GdxRuntimeException("Cannot open a stream to a directory: " + this.file + " (" + this.type + ")", e);
            }
            throw new GdxRuntimeException("Error reading file: " + this.file + " (" + this.type + ")", e);
        }
    }

    public BufferedInputStream read(int i) {
        return new BufferedInputStream(read(), i);
    }

    public Reader reader() {
        return new InputStreamReader(read());
    }

    public Reader reader(String str) {
        InputStream read = read();
        try {
            return new InputStreamReader(read, str);
        } catch (UnsupportedEncodingException e) {
            StreamUtils.closeQuietly(read);
            throw new GdxRuntimeException("Error reading file: " + this, e);
        }
    }

    public BufferedReader reader(int i) {
        return new BufferedReader(new InputStreamReader(read()), i);
    }

    public BufferedReader reader(int i, String str) {
        try {
            return new BufferedReader(new InputStreamReader(read(), str), i);
        } catch (UnsupportedEncodingException e) {
            throw new GdxRuntimeException("Error reading file: " + this, e);
        }
    }

    public String readString() {
        return readString(null);
    }

    public String readString(String str) {
        InputStreamReader inputStreamReader;
        StringBuilder sb = new StringBuilder(estimateLength());
        if (str == null) {
            try {
                inputStreamReader = new InputStreamReader(read());
            } catch (IOException e) {
                throw new GdxRuntimeException("Error reading layout file: " + this, e);
            } catch (Throwable th) {
                StreamUtils.closeQuietly(null);
                throw th;
            }
        } else {
            inputStreamReader = new InputStreamReader(read(), str);
        }
        char[] cArr = new char[256];
        while (true) {
            int read = inputStreamReader.read(cArr);
            if (read == -1) {
                StreamUtils.closeQuietly(inputStreamReader);
                return sb.toString();
            }
            sb.append(cArr, 0, read);
        }
    }

    public byte[] readBytes() {
        InputStream read = read();
        try {
            byte[] copyStreamToByteArray = StreamUtils.copyStreamToByteArray(read, estimateLength());
            StreamUtils.closeQuietly(read);
            return copyStreamToByteArray;
        } catch (IOException e) {
            throw new GdxRuntimeException("Error reading file: " + this, e);
        } catch (Throwable th) {
            StreamUtils.closeQuietly(read);
            throw th;
        }
    }

    private int estimateLength() {
        int length = (int) length();
        return length != 0 ? length : GL20.GL_NEVER;
    }

    public int readBytes(byte[] bArr, int i, int i2) {
        InputStream read = read();
        int i3 = 0;
        while (true) {
            try {
                int read2 = read.read(bArr, i + i3, i2 - i3);
                if (read2 <= 0) {
                    StreamUtils.closeQuietly(read);
                    return i3 - i;
                }
                i3 += read2;
            } catch (IOException e) {
                throw new GdxRuntimeException("Error reading file: " + this, e);
            } catch (Throwable th) {
                StreamUtils.closeQuietly(read);
                throw th;
            }
        }
    }

    public ByteBuffer map() {
        return map(FileChannel.MapMode.READ_ONLY);
    }

    public ByteBuffer map(FileChannel.MapMode mapMode) {
        Throwable th;
        Exception e;
        if (this.type != Files.FileType.Classpath) {
            RandomAccessFile randomAccessFile = null;
            try {
                RandomAccessFile randomAccessFile2 = new RandomAccessFile(this.file, mapMode == FileChannel.MapMode.READ_ONLY ? "r" : "rw");
                try {
                    MappedByteBuffer map = randomAccessFile2.getChannel().map(mapMode, 0, this.file.length());
                    map.order(ByteOrder.nativeOrder());
                    StreamUtils.closeQuietly(randomAccessFile2);
                    return map;
                } catch (Exception e2) {
                    e = e2;
                    randomAccessFile = randomAccessFile2;
                    try {
                        throw new GdxRuntimeException("Error memory mapping file: " + this + " (" + this.type + ")", e);
                    } catch (Throwable th2) {
                        th = th2;
                        StreamUtils.closeQuietly(randomAccessFile);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    randomAccessFile = randomAccessFile2;
                    StreamUtils.closeQuietly(randomAccessFile);
                    throw th;
                }
            } catch (Exception e3) {
                e = e3;
                throw new GdxRuntimeException("Error memory mapping file: " + this + " (" + this.type + ")", e);
            }
        } else {
            throw new GdxRuntimeException("Cannot map a classpath file: " + this);
        }
    }

    public OutputStream write(boolean z) {
        if (this.type == Files.FileType.Classpath) {
            throw new GdxRuntimeException("Cannot write to a classpath file: " + this.file);
        } else if (this.type != Files.FileType.Internal) {
            parent().mkdirs();
            try {
                return new FileOutputStream(file(), z);
            } catch (Exception e) {
                if (file().isDirectory()) {
                    throw new GdxRuntimeException("Cannot open a stream to a directory: " + this.file + " (" + this.type + ")", e);
                }
                throw new GdxRuntimeException("Error writing file: " + this.file + " (" + this.type + ")", e);
            }
        } else {
            throw new GdxRuntimeException("Cannot write to an internal file: " + this.file);
        }
    }

    public OutputStream write(boolean z, int i) {
        return new BufferedOutputStream(write(z), i);
    }

    public void write(InputStream inputStream, boolean z) {
        OutputStream outputStream = null;
        try {
            outputStream = write(z);
            StreamUtils.copyStream(inputStream, outputStream);
            StreamUtils.closeQuietly(inputStream);
            StreamUtils.closeQuietly(outputStream);
        } catch (Exception e) {
            throw new GdxRuntimeException("Error stream writing to file: " + this.file + " (" + this.type + ")", e);
        } catch (Throwable th) {
            StreamUtils.closeQuietly(inputStream);
            StreamUtils.closeQuietly(outputStream);
            throw th;
        }
    }

    public Writer writer(boolean z) {
        return writer(z, null);
    }

    public Writer writer(boolean z, String str) {
        if (this.type == Files.FileType.Classpath) {
            throw new GdxRuntimeException("Cannot write to a classpath file: " + this.file);
        } else if (this.type != Files.FileType.Internal) {
            parent().mkdirs();
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(file(), z);
                if (str == null) {
                    return new OutputStreamWriter(fileOutputStream);
                }
                return new OutputStreamWriter(fileOutputStream, str);
            } catch (IOException e) {
                if (file().isDirectory()) {
                    throw new GdxRuntimeException("Cannot open a stream to a directory: " + this.file + " (" + this.type + ")", e);
                }
                throw new GdxRuntimeException("Error writing file: " + this.file + " (" + this.type + ")", e);
            }
        } else {
            throw new GdxRuntimeException("Cannot write to an internal file: " + this.file);
        }
    }

    public void writeString(String str, boolean z) {
        writeString(str, z, null);
    }

    public void writeString(String str, boolean z, String str2) {
        Writer writer = null;
        try {
            writer = writer(z, str2);
            writer.write(str);
            StreamUtils.closeQuietly(writer);
        } catch (Exception e) {
            throw new GdxRuntimeException("Error writing file: " + this.file + " (" + this.type + ")", e);
        } catch (Throwable th) {
            StreamUtils.closeQuietly(writer);
            throw th;
        }
    }

    public void writeBytes(byte[] bArr, boolean z) {
        OutputStream write = write(z);
        try {
            write.write(bArr);
            StreamUtils.closeQuietly(write);
        } catch (IOException e) {
            throw new GdxRuntimeException("Error writing file: " + this.file + " (" + this.type + ")", e);
        } catch (Throwable th) {
            StreamUtils.closeQuietly(write);
            throw th;
        }
    }

    public void writeBytes(byte[] bArr, int i, int i2, boolean z) {
        OutputStream write = write(z);
        try {
            write.write(bArr, i, i2);
            StreamUtils.closeQuietly(write);
        } catch (IOException e) {
            throw new GdxRuntimeException("Error writing file: " + this.file + " (" + this.type + ")", e);
        } catch (Throwable th) {
            StreamUtils.closeQuietly(write);
            throw th;
        }
    }

    public FileHandle[] list() {
        if (this.type != Files.FileType.Classpath) {
            String[] list = file().list();
            if (list == null) {
                return new FileHandle[0];
            }
            FileHandle[] fileHandleArr = new FileHandle[list.length];
            int length = list.length;
            for (int i = 0; i < length; i++) {
                fileHandleArr[i] = child(list[i]);
            }
            return fileHandleArr;
        }
        throw new GdxRuntimeException("Cannot list a classpath directory: " + this.file);
    }

    public FileHandle[] list(FileFilter fileFilter) {
        if (this.type != Files.FileType.Classpath) {
            String[] list = file().list();
            if (list == null) {
                return new FileHandle[0];
            }
            FileHandle[] fileHandleArr = new FileHandle[list.length];
            int i = 0;
            for (String str : list) {
                FileHandle child = child(str);
                if (fileFilter.accept(child.file())) {
                    fileHandleArr[i] = child;
                    i++;
                }
            }
            if (i >= list.length) {
                return fileHandleArr;
            }
            FileHandle[] fileHandleArr2 = new FileHandle[i];
            System.arraycopy(fileHandleArr, 0, fileHandleArr2, 0, i);
            return fileHandleArr2;
        }
        throw new GdxRuntimeException("Cannot list a classpath directory: " + this.file);
    }

    public FileHandle[] list(FilenameFilter filenameFilter) {
        if (this.type != Files.FileType.Classpath) {
            File file2 = file();
            String[] list = file2.list();
            if (list == null) {
                return new FileHandle[0];
            }
            FileHandle[] fileHandleArr = new FileHandle[list.length];
            int i = 0;
            for (String str : list) {
                if (filenameFilter.accept(file2, str)) {
                    fileHandleArr[i] = child(str);
                    i++;
                }
            }
            if (i >= list.length) {
                return fileHandleArr;
            }
            FileHandle[] fileHandleArr2 = new FileHandle[i];
            System.arraycopy(fileHandleArr, 0, fileHandleArr2, 0, i);
            return fileHandleArr2;
        }
        throw new GdxRuntimeException("Cannot list a classpath directory: " + this.file);
    }

    public FileHandle[] list(String str) {
        if (this.type != Files.FileType.Classpath) {
            String[] list = file().list();
            if (list == null) {
                return new FileHandle[0];
            }
            FileHandle[] fileHandleArr = new FileHandle[list.length];
            int i = 0;
            for (String str2 : list) {
                if (str2.endsWith(str)) {
                    fileHandleArr[i] = child(str2);
                    i++;
                }
            }
            if (i >= list.length) {
                return fileHandleArr;
            }
            FileHandle[] fileHandleArr2 = new FileHandle[i];
            System.arraycopy(fileHandleArr, 0, fileHandleArr2, 0, i);
            return fileHandleArr2;
        }
        throw new GdxRuntimeException("Cannot list a classpath directory: " + this.file);
    }

    public boolean isDirectory() {
        if (this.type == Files.FileType.Classpath) {
            return false;
        }
        return file().isDirectory();
    }

    public FileHandle child(String str) {
        if (this.file.getPath().length() == 0) {
            return new FileHandle(new File(str), this.type);
        }
        return new FileHandle(new File(this.file, str), this.type);
    }

    public FileHandle sibling(String str) {
        if (this.file.getPath().length() != 0) {
            return new FileHandle(new File(this.file.getParent(), str), this.type);
        }
        throw new GdxRuntimeException("Cannot get the sibling of the root.");
    }

    public FileHandle parent() {
        File parentFile = this.file.getParentFile();
        if (parentFile == null) {
            if (this.type == Files.FileType.Absolute) {
                parentFile = new File("/");
            } else {
                parentFile = new File(BuildConfig.FLAVOR);
            }
        }
        return new FileHandle(parentFile, this.type);
    }

    public void mkdirs() {
        if (this.type == Files.FileType.Classpath) {
            throw new GdxRuntimeException("Cannot mkdirs with a classpath file: " + this.file);
        } else if (this.type != Files.FileType.Internal) {
            file().mkdirs();
        } else {
            throw new GdxRuntimeException("Cannot mkdirs with an internal file: " + this.file);
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: com.badlogic.gdx.files.FileHandle$1  reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$badlogic$gdx$Files$FileType = new int[Files.FileType.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(10:0|1|2|3|4|5|6|7|8|10) */
        /* JADX WARNING: Can't wrap try/catch for region: R(8:0|1|2|3|4|5|6|(3:7|8|10)) */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:5:0x001f */
        /* JADX WARNING: Missing exception handler attribute for start block: B:7:0x002a */
        static {
            /*
                com.badlogic.gdx.Files$FileType[] r0 = com.badlogic.gdx.Files.FileType.values()
                int r0 = r0.length
                int[] r0 = new int[r0]
                com.badlogic.gdx.files.FileHandle.AnonymousClass1.$SwitchMap$com$badlogic$gdx$Files$FileType = r0
                int[] r0 = com.badlogic.gdx.files.FileHandle.AnonymousClass1.$SwitchMap$com$badlogic$gdx$Files$FileType     // Catch:{ NoSuchFieldError -> 0x0014 }
                com.badlogic.gdx.Files$FileType r1 = com.badlogic.gdx.Files.FileType.Internal     // Catch:{ NoSuchFieldError -> 0x0014 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0014 }
                r2 = 1
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0014 }
            L_0x0014:
                int[] r0 = com.badlogic.gdx.files.FileHandle.AnonymousClass1.$SwitchMap$com$badlogic$gdx$Files$FileType     // Catch:{ NoSuchFieldError -> 0x001f }
                com.badlogic.gdx.Files$FileType r1 = com.badlogic.gdx.Files.FileType.Classpath     // Catch:{ NoSuchFieldError -> 0x001f }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x001f }
                r2 = 2
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x001f }
            L_0x001f:
                int[] r0 = com.badlogic.gdx.files.FileHandle.AnonymousClass1.$SwitchMap$com$badlogic$gdx$Files$FileType     // Catch:{ NoSuchFieldError -> 0x002a }
                com.badlogic.gdx.Files$FileType r1 = com.badlogic.gdx.Files.FileType.Absolute     // Catch:{ NoSuchFieldError -> 0x002a }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x002a }
                r2 = 3
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x002a }
            L_0x002a:
                int[] r0 = com.badlogic.gdx.files.FileHandle.AnonymousClass1.$SwitchMap$com$badlogic$gdx$Files$FileType     // Catch:{ NoSuchFieldError -> 0x0035 }
                com.badlogic.gdx.Files$FileType r1 = com.badlogic.gdx.Files.FileType.External     // Catch:{ NoSuchFieldError -> 0x0035 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0035 }
                r2 = 4
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0035 }
            L_0x0035:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.files.FileHandle.AnonymousClass1.<clinit>():void");
        }
    }

    public boolean exists() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$Files$FileType[this.type.ordinal()];
        if (i != 1) {
            if (i != 2) {
                return file().exists();
            }
        } else if (file().exists()) {
            return true;
        }
        if (FileHandle.class.getResource("/" + this.file.getPath().replace('\\', '/')) != null) {
            return true;
        }
        return false;
    }

    public boolean delete() {
        if (this.type == Files.FileType.Classpath) {
            throw new GdxRuntimeException("Cannot delete a classpath file: " + this.file);
        } else if (this.type != Files.FileType.Internal) {
            return file().delete();
        } else {
            throw new GdxRuntimeException("Cannot delete an internal file: " + this.file);
        }
    }

    public boolean deleteDirectory() {
        if (this.type == Files.FileType.Classpath) {
            throw new GdxRuntimeException("Cannot delete a classpath file: " + this.file);
        } else if (this.type != Files.FileType.Internal) {
            return deleteDirectory(file());
        } else {
            throw new GdxRuntimeException("Cannot delete an internal file: " + this.file);
        }
    }

    public void emptyDirectory() {
        emptyDirectory(false);
    }

    public void emptyDirectory(boolean z) {
        if (this.type == Files.FileType.Classpath) {
            throw new GdxRuntimeException("Cannot delete a classpath file: " + this.file);
        } else if (this.type != Files.FileType.Internal) {
            emptyDirectory(file(), z);
        } else {
            throw new GdxRuntimeException("Cannot delete an internal file: " + this.file);
        }
    }

    public void copyTo(FileHandle fileHandle) {
        if (!isDirectory()) {
            if (fileHandle.isDirectory()) {
                fileHandle = fileHandle.child(name());
            }
            copyFile(this, fileHandle);
            return;
        }
        if (!fileHandle.exists()) {
            fileHandle.mkdirs();
            if (!fileHandle.isDirectory()) {
                throw new GdxRuntimeException("Destination directory cannot be created: " + fileHandle);
            }
        } else if (!fileHandle.isDirectory()) {
            throw new GdxRuntimeException("Destination exists but is not a directory: " + fileHandle);
        }
        copyDirectory(this, fileHandle.child(name()));
    }

    public void moveTo(FileHandle fileHandle) {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$Files$FileType[this.type.ordinal()];
        if (i == 1) {
            throw new GdxRuntimeException("Cannot move an internal file: " + this.file);
        } else if (i == 2) {
            throw new GdxRuntimeException("Cannot move a classpath file: " + this.file);
        } else if ((i != 3 && i != 4) || !file().renameTo(fileHandle.file())) {
            copyTo(fileHandle);
            delete();
            if (exists() && isDirectory()) {
                deleteDirectory();
            }
        }
    }

    /* JADX INFO: finally extract failed */
    public long length() {
        if (this.type != Files.FileType.Classpath && (this.type != Files.FileType.Internal || this.file.exists())) {
            return file().length();
        }
        InputStream read = read();
        try {
            long available = (long) read.available();
            StreamUtils.closeQuietly(read);
            return available;
        } catch (Exception unused) {
            StreamUtils.closeQuietly(read);
            return 0;
        } catch (Throwable th) {
            StreamUtils.closeQuietly(read);
            throw th;
        }
    }

    public long lastModified() {
        return file().lastModified();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FileHandle)) {
            return false;
        }
        FileHandle fileHandle = (FileHandle) obj;
        if (this.type != fileHandle.type || !path().equals(fileHandle.path())) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        return ((37 + this.type.hashCode()) * 67) + path().hashCode();
    }

    public String toString() {
        return this.file.getPath().replace('\\', '/');
    }

    public static FileHandle tempFile(String str) {
        try {
            return new FileHandle(File.createTempFile(str, null));
        } catch (IOException e) {
            throw new GdxRuntimeException("Unable to create temp file.", e);
        }
    }

    public static FileHandle tempDirectory(String str) {
        try {
            File createTempFile = File.createTempFile(str, null);
            if (!createTempFile.delete()) {
                throw new IOException("Unable to delete temp file: " + createTempFile);
            } else if (createTempFile.mkdir()) {
                return new FileHandle(createTempFile);
            } else {
                throw new IOException("Unable to create temp directory: " + createTempFile);
            }
        } catch (IOException e) {
            throw new GdxRuntimeException("Unable to create temp file.", e);
        }
    }

    private static void emptyDirectory(File file2, boolean z) {
        File[] listFiles;
        if (file2.exists() && (listFiles = file2.listFiles()) != null) {
            int length = listFiles.length;
            for (int i = 0; i < length; i++) {
                if (!listFiles[i].isDirectory()) {
                    listFiles[i].delete();
                } else if (z) {
                    emptyDirectory(listFiles[i], true);
                } else {
                    deleteDirectory(listFiles[i]);
                }
            }
        }
    }

    private static boolean deleteDirectory(File file2) {
        emptyDirectory(file2, false);
        return file2.delete();
    }

    private static void copyFile(FileHandle fileHandle, FileHandle fileHandle2) {
        try {
            fileHandle2.write(fileHandle.read(), false);
        } catch (Exception e) {
            throw new GdxRuntimeException("Error copying source file: " + fileHandle.file + " (" + fileHandle.type + ")\nTo destination: " + fileHandle2.file + " (" + fileHandle2.type + ")", e);
        }
    }

    private static void copyDirectory(FileHandle fileHandle, FileHandle fileHandle2) {
        fileHandle2.mkdirs();
        FileHandle[] list = fileHandle.list();
        for (FileHandle fileHandle3 : list) {
            FileHandle child = fileHandle2.child(fileHandle3.name());
            if (fileHandle3.isDirectory()) {
                copyDirectory(fileHandle3, child);
            } else {
                copyFile(fileHandle3, child);
            }
        }
    }
}
