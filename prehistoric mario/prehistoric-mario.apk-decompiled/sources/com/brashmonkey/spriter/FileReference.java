package com.brashmonkey.spriter;

public class FileReference {
    public int file;
    public int folder;

    public FileReference(int i, int i2) {
        set(i, i2);
    }

    public int hashCode() {
        return (this.folder * 10000) + this.file;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FileReference)) {
            return false;
        }
        FileReference fileReference = (FileReference) obj;
        if (this.file == fileReference.file && this.folder == fileReference.folder) {
            return true;
        }
        return false;
    }

    public void set(int i, int i2) {
        this.folder = i;
        this.file = i2;
    }

    public void set(FileReference fileReference) {
        set(fileReference.folder, fileReference.file);
    }

    public boolean hasFile() {
        return this.file != -1;
    }

    public boolean hasFolder() {
        return this.folder != -1;
    }

    public String toString() {
        return "[folder: " + this.folder + ", file: " + this.file + "]";
    }
}
