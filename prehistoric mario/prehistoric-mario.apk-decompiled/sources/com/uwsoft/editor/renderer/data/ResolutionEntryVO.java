package com.uwsoft.editor.renderer.data;

public class ResolutionEntryVO {
    public int base;
    public int height;
    public String name;
    public int width;

    public String toString() {
        return this.width + "x" + this.height + " (" + this.name + ")";
    }
}
