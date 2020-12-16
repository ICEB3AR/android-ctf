package com.brashmonkey.spriter;

public class Folder {
    private int filePointer = 0;
    final File[] files;
    public final int id;
    public final String name;

    Folder(int i, String str, int i2) {
        this.id = i;
        this.name = str;
        this.files = new File[i2];
    }

    /* access modifiers changed from: package-private */
    public void addFile(File file) {
        File[] fileArr = this.files;
        int i = this.filePointer;
        this.filePointer = i + 1;
        fileArr[i] = file;
    }

    public File getFile(int i) {
        return this.files[i];
    }

    public File getFile(String str) {
        int fileIndex = getFileIndex(str);
        if (fileIndex >= 0) {
            return getFile(fileIndex);
        }
        return null;
    }

    /* access modifiers changed from: package-private */
    public int getFileIndex(String str) {
        File[] fileArr = this.files;
        for (File file : fileArr) {
            if (file.name.equals(str)) {
                return file.id;
            }
        }
        return -1;
    }

    public String toString() {
        String str = getClass().getSimpleName() + "|[id: " + this.id + ", name: " + this.name;
        for (File file : this.files) {
            str = str + "\n" + file;
        }
        return str + "]";
    }
}
