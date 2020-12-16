package com.uwsoft.editor.renderer.resources;

public class FontSizePair {
    public String fontName;
    public int fontSize;

    public FontSizePair(String str, int i) {
        this.fontName = str;
        this.fontSize = i;
    }

    public boolean equals(Object obj) {
        FontSizePair fontSizePair = (FontSizePair) obj;
        return fontSizePair.fontName.equals(this.fontName) && fontSizePair.fontSize == this.fontSize;
    }

    public String toString() {
        return this.fontName + "_" + this.fontSize;
    }

    public int hashCode() {
        return (this.fontName + "_" + this.fontSize).hashCode();
    }
}
