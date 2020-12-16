package com.brashmonkey.spriter;

import java.util.ArrayList;

public class Data {
    final Entity[] entities;
    private int entityPointer = 0;
    private int folderPointer = 0;
    final Folder[] folders;
    public final String generator;
    public final String generatorVersion;
    public final String scmlVersion;

    Data(String str, String str2, String str3, int i, int i2) {
        this.scmlVersion = str;
        this.generator = str2;
        this.generatorVersion = str3;
        this.folders = new Folder[i];
        this.entities = new Entity[i2];
    }

    /* access modifiers changed from: package-private */
    public void addFolder(Folder folder) {
        Folder[] folderArr = this.folders;
        int i = this.folderPointer;
        this.folderPointer = i + 1;
        folderArr[i] = folder;
    }

    /* access modifiers changed from: package-private */
    public void addEntity(Entity entity) {
        Entity[] entityArr = this.entities;
        int i = this.entityPointer;
        this.entityPointer = i + 1;
        entityArr[i] = entity;
    }

    public Folder getFolder(String str) {
        int folderIndex = getFolderIndex(str);
        if (folderIndex >= 0) {
            return getFolder(folderIndex);
        }
        return null;
    }

    /* access modifiers changed from: package-private */
    public int getFolderIndex(String str) {
        Folder[] folderArr = this.folders;
        for (Folder folder : folderArr) {
            if (folder.name.equals(str)) {
                return folder.id;
            }
        }
        return -1;
    }

    /* access modifiers changed from: package-private */
    public Folder getFolder(int i) {
        return this.folders[i];
    }

    public Entity getEntity(int i) {
        return this.entities[i];
    }

    public Entity getEntity(String str) {
        int entityIndex = getEntityIndex(str);
        if (entityIndex >= 0) {
            return getEntity(entityIndex);
        }
        return null;
    }

    /* access modifiers changed from: package-private */
    public int getEntityIndex(String str) {
        Entity[] entityArr = this.entities;
        for (Entity entity : entityArr) {
            if (entity.name.equals(str)) {
                return entity.id;
            }
        }
        return -1;
    }

    public File getFile(Folder folder, int i) {
        return folder.getFile(i);
    }

    public File getFile(int i, int i2) {
        return getFile(getFolder(i), i2);
    }

    public File getFile(FileReference fileReference) {
        return getFile(fileReference.folder, fileReference.file);
    }

    public String toString() {
        String str = getClass().getSimpleName() + "|[Version: " + this.scmlVersion + ", Generator: " + this.generator + " (" + this.generatorVersion + ")]";
        for (Folder folder : this.folders) {
            str = str + "\n" + folder;
        }
        for (Entity entity : this.entities) {
            str = str + "\n" + entity;
        }
        return str + "]";
    }

    public ArrayList<String> getEntities() {
        ArrayList<String> arrayList = new ArrayList<>(this.entities.length);
        int i = 0;
        while (true) {
            Entity[] entityArr = this.entities;
            if (i >= entityArr.length) {
                return arrayList;
            }
            arrayList.add(entityArr[i].name);
            i++;
        }
    }
}
