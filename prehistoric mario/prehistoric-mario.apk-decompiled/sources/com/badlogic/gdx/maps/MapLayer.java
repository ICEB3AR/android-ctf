package com.badlogic.gdx.maps;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class MapLayer {
    private String name = BuildConfig.FLAVOR;
    private MapObjects objects = new MapObjects();
    private float offsetX;
    private float offsetY;
    private float opacity = 1.0f;
    private MapLayer parent;
    private MapProperties properties = new MapProperties();
    private boolean renderOffsetDirty = true;
    private float renderOffsetX;
    private float renderOffsetY;
    private boolean visible = true;

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public float getOpacity() {
        return this.opacity;
    }

    public void setOpacity(float f) {
        this.opacity = f;
    }

    public float getOffsetX() {
        return this.offsetX;
    }

    public void setOffsetX(float f) {
        this.offsetX = f;
        invalidateRenderOffset();
    }

    public float getOffsetY() {
        return this.offsetY;
    }

    public void setOffsetY(float f) {
        this.offsetY = f;
        invalidateRenderOffset();
    }

    public float getRenderOffsetX() {
        if (this.renderOffsetDirty) {
            calculateRenderOffsets();
        }
        return this.renderOffsetX;
    }

    public float getRenderOffsetY() {
        if (this.renderOffsetDirty) {
            calculateRenderOffsets();
        }
        return this.renderOffsetY;
    }

    public void invalidateRenderOffset() {
        this.renderOffsetDirty = true;
    }

    public MapLayer getParent() {
        return this.parent;
    }

    public void setParent(MapLayer mapLayer) {
        if (mapLayer != this) {
            this.parent = mapLayer;
            return;
        }
        throw new GdxRuntimeException("Can't set self as the parent");
    }

    public MapObjects getObjects() {
        return this.objects;
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

    /* access modifiers changed from: protected */
    public void calculateRenderOffsets() {
        MapLayer mapLayer = this.parent;
        if (mapLayer != null) {
            mapLayer.calculateRenderOffsets();
            this.renderOffsetX = this.parent.getRenderOffsetX() + this.offsetX;
            this.renderOffsetY = this.parent.getRenderOffsetY() + this.offsetY;
        } else {
            this.renderOffsetX = this.offsetX;
            this.renderOffsetY = this.offsetY;
        }
        this.renderOffsetDirty = false;
    }
}
