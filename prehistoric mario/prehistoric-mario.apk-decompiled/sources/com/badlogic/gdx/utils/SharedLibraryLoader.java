package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.UUID;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class SharedLibraryLoader {
    public static String abi = (System.getProperty("sun.arch.abi") != null ? System.getProperty("sun.arch.abi") : BuildConfig.FLAVOR);
    public static boolean is64Bit;
    public static boolean isARM = System.getProperty("os.arch").startsWith("arm");
    public static boolean isAndroid;
    public static boolean isIos;
    public static boolean isLinux;
    public static boolean isMac;
    public static boolean isWindows;
    private static final HashSet<String> loadedLibraries = new HashSet<>();
    private String nativesJar;

    static {
        isWindows = System.getProperty("os.name").contains("Windows");
        isLinux = System.getProperty("os.name").contains("Linux");
        isMac = System.getProperty("os.name").contains("Mac");
        isIos = false;
        isAndroid = false;
        is64Bit = System.getProperty("os.arch").equals("amd64") || System.getProperty("os.arch").equals("x86_64");
        boolean equals = "iOS".equals(System.getProperty("moe.platform.name"));
        String property = System.getProperty("java.runtime.name");
        if (property != null && property.contains("Android Runtime")) {
            isAndroid = true;
            isWindows = false;
            isLinux = false;
            isMac = false;
            is64Bit = false;
        }
        if (equals || (!isAndroid && !isWindows && !isLinux && !isMac)) {
            isIos = true;
            isAndroid = false;
            isWindows = false;
            isLinux = false;
            isMac = false;
            is64Bit = false;
        }
    }

    public SharedLibraryLoader() {
    }

    public SharedLibraryLoader(String str) {
        this.nativesJar = str;
    }

    public String crc(InputStream inputStream) {
        if (inputStream != null) {
            CRC32 crc32 = new CRC32();
            byte[] bArr = new byte[StreamUtils.DEFAULT_BUFFER_SIZE];
            while (true) {
                try {
                    int read = inputStream.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    crc32.update(bArr, 0, read);
                } catch (Exception unused) {
                } catch (Throwable th) {
                    StreamUtils.closeQuietly(inputStream);
                    throw th;
                }
            }
            StreamUtils.closeQuietly(inputStream);
            return Long.toString(crc32.getValue(), 16);
        }
        throw new IllegalArgumentException("input cannot be null.");
    }

    public String mapLibraryName(String str) {
        String str2;
        if (isWindows) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(is64Bit ? "64.dll" : ".dll");
            return sb.toString();
        } else if (isLinux) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("lib");
            sb2.append(str);
            if (isARM) {
                str2 = "arm" + abi;
            } else {
                str2 = BuildConfig.FLAVOR;
            }
            sb2.append(str2);
            sb2.append(is64Bit ? "64.so" : ".so");
            return sb2.toString();
        } else if (!isMac) {
            return str;
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("lib");
            sb3.append(str);
            sb3.append(is64Bit ? "64.dylib" : ".dylib");
            return sb3.toString();
        }
    }

    public void load(String str) {
        if (!isIos) {
            synchronized (SharedLibraryLoader.class) {
                if (!isLoaded(str)) {
                    String mapLibraryName = mapLibraryName(str);
                    try {
                        if (isAndroid) {
                            System.loadLibrary(mapLibraryName);
                        } else {
                            loadFile(mapLibraryName);
                        }
                        setLoaded(str);
                    } catch (Throwable th) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Couldn't load shared library '");
                        sb.append(mapLibraryName);
                        sb.append("' for target: ");
                        sb.append(System.getProperty("os.name"));
                        sb.append(is64Bit ? ", 64-bit" : ", 32-bit");
                        throw new GdxRuntimeException(sb.toString(), th);
                    }
                }
            }
        }
    }

    private InputStream readFile(String str) {
        String str2 = this.nativesJar;
        if (str2 == null) {
            InputStream resourceAsStream = SharedLibraryLoader.class.getResourceAsStream("/" + str);
            if (resourceAsStream != null) {
                return resourceAsStream;
            }
            throw new GdxRuntimeException("Unable to read file for extraction: " + str);
        }
        try {
            ZipFile zipFile = new ZipFile(str2);
            ZipEntry entry = zipFile.getEntry(str);
            if (entry != null) {
                return zipFile.getInputStream(entry);
            }
            throw new GdxRuntimeException("Couldn't find '" + str + "' in JAR: " + this.nativesJar);
        } catch (IOException e) {
            throw new GdxRuntimeException("Error reading '" + str + "' in JAR: " + this.nativesJar, e);
        }
    }

    public File extractFile(String str, String str2) throws IOException {
        try {
            String crc = crc(readFile(str));
            if (str2 == null) {
                str2 = crc;
            }
            File extractedFile = getExtractedFile(str2, new File(str).getName());
            if (extractedFile == null) {
                extractedFile = getExtractedFile(UUID.randomUUID().toString(), new File(str).getName());
                if (extractedFile == null) {
                    throw new GdxRuntimeException("Unable to find writable path to extract file. Is the user home directory writable?");
                }
            }
            return extractFile(str, crc, extractedFile);
        } catch (RuntimeException e) {
            File file = new File(System.getProperty("java.library.path"), str);
            if (file.exists()) {
                return file;
            }
            throw e;
        }
    }

    public void extractFileTo(String str, File file) throws IOException {
        extractFile(str, crc(readFile(str)), new File(file, new File(str).getName()));
    }

    private File getExtractedFile(String str, String str2) {
        File file = new File(System.getProperty("java.io.tmpdir") + "/libgdx" + System.getProperty("user.name") + "/" + str, str2);
        if (canWrite(file)) {
            return file;
        }
        try {
            File createTempFile = File.createTempFile(str, null);
            if (createTempFile.delete()) {
                File file2 = new File(createTempFile, str2);
                if (canWrite(file2)) {
                    return file2;
                }
            }
        } catch (IOException unused) {
        }
        File file3 = new File(System.getProperty("user.home") + "/.libgdx/" + str, str2);
        if (canWrite(file3)) {
            return file3;
        }
        File file4 = new File(".temp/" + str, str2);
        if (canWrite(file4)) {
            return file4;
        }
        if (System.getenv("APP_SANDBOX_CONTAINER_ID") != null) {
            return file;
        }
        return null;
    }

    private boolean canWrite(File file) {
        File parentFile = file.getParentFile();
        if (!file.exists()) {
            parentFile.mkdirs();
            if (!parentFile.isDirectory()) {
                return false;
            }
        } else if (!file.canWrite() || !canExecute(file)) {
            return false;
        } else {
            file = new File(parentFile, UUID.randomUUID().toString());
        }
        try {
            new FileOutputStream(file).close();
            if (!canExecute(file)) {
                return false;
            }
            file.delete();
            return true;
        } catch (Throwable unused) {
            return false;
        } finally {
            file.delete();
        }
    }

    private boolean canExecute(File file) {
        try {
            Method method = File.class.getMethod("canExecute", new Class[0]);
            if (((Boolean) method.invoke(file, new Object[0])).booleanValue()) {
                return true;
            }
            File.class.getMethod("setExecutable", Boolean.TYPE, Boolean.TYPE).invoke(file, true, false);
            return ((Boolean) method.invoke(file, new Object[0])).booleanValue();
        } catch (Exception unused) {
            return false;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x003c A[LOOP:0: B:16:0x002e->B:21:0x003c, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x0035 A[EDGE_INSN: B:40:0x0035->B:19:0x0035 ?: BREAK  , SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private java.io.File extractFile(java.lang.String r7, java.lang.String r8, java.io.File r9) throws java.io.IOException {
        /*
        // Method dump skipped, instructions count: 136
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.SharedLibraryLoader.extractFile(java.lang.String, java.lang.String, java.io.File):java.io.File");
    }

    private void loadFile(String str) {
        String crc = crc(readFile(str));
        String name = new File(str).getName();
        Throwable loadFile = loadFile(str, crc, new File(System.getProperty("java.io.tmpdir") + "/libgdx" + System.getProperty("user.name") + "/" + crc, name));
        if (loadFile != null) {
            try {
                File createTempFile = File.createTempFile(crc, null);
                if (createTempFile.delete() && loadFile(str, crc, createTempFile) == null) {
                    return;
                }
            } catch (Throwable unused) {
            }
            if (loadFile(str, crc, new File(System.getProperty("user.home") + "/.libgdx/" + crc, name)) != null) {
                if (loadFile(str, crc, new File(".temp/" + crc, name)) != null) {
                    File file = new File(System.getProperty("java.library.path"), str);
                    if (file.exists()) {
                        System.load(file.getAbsolutePath());
                        return;
                    }
                    throw new GdxRuntimeException(loadFile);
                }
            }
        }
    }

    private Throwable loadFile(String str, String str2, File file) {
        try {
            System.load(extractFile(str, str2, file).getAbsolutePath());
            return null;
        } catch (Throwable th) {
            return th;
        }
    }

    public static synchronized void setLoaded(String str) {
        synchronized (SharedLibraryLoader.class) {
            loadedLibraries.add(str);
        }
    }

    public static synchronized boolean isLoaded(String str) {
        boolean contains;
        synchronized (SharedLibraryLoader.class) {
            contains = loadedLibraries.contains(str);
        }
        return contains;
    }
}
