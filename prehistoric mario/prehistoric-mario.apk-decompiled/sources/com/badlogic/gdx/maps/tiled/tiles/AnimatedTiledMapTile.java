package com.badlogic.gdx.maps.tiled.tiles;

import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.MapObjects;
import com.badlogic.gdx.maps.MapProperties;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.TimeUtils;

public class AnimatedTiledMapTile implements TiledMapTile {
    private static final long initialTimeOffset = TimeUtils.millis();
    private static long lastTiledMapRenderTime;
    private int[] animationIntervals;
    private TiledMapTile.BlendMode blendMode = TiledMapTile.BlendMode.ALPHA;
    private int frameCount;
    private StaticTiledMapTile[] frameTiles;
    private int id;
    private int loopDuration;
    private MapObjects objects;
    private MapProperties properties;

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public int getId() {
        return this.id;
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public void setId(int i) {
        this.id = i;
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public TiledMapTile.BlendMode getBlendMode() {
        return this.blendMode;
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public void setBlendMode(TiledMapTile.BlendMode blendMode2) {
        this.blendMode = blendMode2;
    }

    public int getCurrentFrameIndex() {
        int i = (int) (lastTiledMapRenderTime % ((long) this.loopDuration));
        int i2 = 0;
        while (true) {
            int[] iArr = this.animationIntervals;
            if (i2 < iArr.length) {
                int i3 = iArr[i2];
                if (i <= i3) {
                    return i2;
                }
                i -= i3;
                i2++;
            } else {
                throw new GdxRuntimeException("Could not determine current animation frame in AnimatedTiledMapTile.  This should never happen.");
            }
        }
    }

    public TiledMapTile getCurrentFrame() {
        return this.frameTiles[getCurrentFrameIndex()];
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public TextureRegion getTextureRegion() {
        return getCurrentFrame().getTextureRegion();
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public void setTextureRegion(TextureRegion textureRegion) {
        throw new GdxRuntimeException("Cannot set the texture region of AnimatedTiledMapTile.");
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public float getOffsetX() {
        return getCurrentFrame().getOffsetX();
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public void setOffsetX(float f) {
        throw new GdxRuntimeException("Cannot set offset of AnimatedTiledMapTile.");
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public float getOffsetY() {
        return getCurrentFrame().getOffsetY();
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public void setOffsetY(float f) {
        throw new GdxRuntimeException("Cannot set offset of AnimatedTiledMapTile.");
    }

    public int[] getAnimationIntervals() {
        return this.animationIntervals;
    }

    public void setAnimationIntervals(int[] iArr) {
        if (iArr.length == this.animationIntervals.length) {
            this.animationIntervals = iArr;
            this.loopDuration = 0;
            for (int i = 0; i < iArr.length; i++) {
                this.loopDuration += iArr[i];
            }
            return;
        }
        throw new GdxRuntimeException("Cannot set " + iArr.length + " frame intervals. The given int[] must have a size of " + this.animationIntervals.length + ".");
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public MapProperties getProperties() {
        if (this.properties == null) {
            this.properties = new MapProperties();
        }
        return this.properties;
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapTile
    public MapObjects getObjects() {
        if (this.objects == null) {
            this.objects = new MapObjects();
        }
        return this.objects;
    }

    public static void updateAnimationBaseTime() {
        lastTiledMapRenderTime = TimeUtils.millis() - initialTimeOffset;
    }

    public AnimatedTiledMapTile(float f, Array<StaticTiledMapTile> array) {
        this.frameCount = 0;
        this.frameTiles = new StaticTiledMapTile[array.size];
        this.frameCount = array.size;
        int i = (int) (f * 1000.0f);
        this.loopDuration = array.size * i;
        this.animationIntervals = new int[array.size];
        for (int i2 = 0; i2 < array.size; i2++) {
            this.frameTiles[i2] = array.get(i2);
            this.animationIntervals[i2] = i;
        }
    }

    public AnimatedTiledMapTile(IntArray intArray, Array<StaticTiledMapTile> array) {
        this.frameCount = 0;
        this.frameTiles = new StaticTiledMapTile[array.size];
        this.frameCount = array.size;
        this.animationIntervals = intArray.toArray();
        this.loopDuration = 0;
        for (int i = 0; i < intArray.size; i++) {
            this.frameTiles[i] = array.get(i);
            this.loopDuration += intArray.get(i);
        }
    }

    public StaticTiledMapTile[] getFrameTiles() {
        return this.frameTiles;
    }
}
