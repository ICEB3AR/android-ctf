package com.badlogic.gdx.maps;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;

public class MapObject {
    private Color color = Color.WHITE.cpy();
    private String name = BuildConfig.FLAVOR;
    private float opacity = 1.0f;
    private MapProperties properties = new MapProperties();
    private boolean visible = true;

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public Color getColor() {
        return this.color;
    }

    public void setColor(Color color2) {
        this.color = color2;
    }

    public float getOpacity() {
        return this.opacity;
    }

    public void setOpacity(float f) {
        this.opacity = f;
    }

    public boolean isVisible() {
        return this.visible;
    }

    public void setVisible(boolean z) {
        this.visible = z;
    }

    public MapProperties getProperties() {
        return this.properties;
    }
}
