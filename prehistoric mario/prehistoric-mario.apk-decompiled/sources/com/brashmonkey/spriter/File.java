package com.brashmonkey.spriter;

public class File {
    public final int id;
    public final String name;
    public final Point pivot;
    public final Dimension size;

    File(int i, String str, Dimension dimension, Point point) {
        this.id = i;
        this.name = str;
        this.size = dimension;
        this.pivot = point;
    }

    public boolean isSprite() {
        return (this.pivot == null || this.size == null) ? false : true;
    }

    public String toString() {
        return getClass().getSimpleName() + "|[id: " + this.id + ", name: " + this.name + ", size: " + this.size + ", pivot: " + this.pivot;
    }
}
