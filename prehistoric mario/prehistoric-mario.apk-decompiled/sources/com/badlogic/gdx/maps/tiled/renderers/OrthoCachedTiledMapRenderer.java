package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteCache;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.MapLayer;
import com.badlogic.gdx.maps.MapLayers;
import com.badlogic.gdx.maps.MapObject;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapImageLayer;
import com.badlogic.gdx.maps.tiled.TiledMapRenderer;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.utils.Disposable;
import java.util.Iterator;

public class OrthoCachedTiledMapRenderer implements TiledMapRenderer, Disposable {
    protected static final int NUM_VERTICES = 20;
    private static final float tolerance = 1.0E-5f;
    protected boolean blending;
    protected final Rectangle cacheBounds;
    protected boolean cached;
    protected boolean canCacheMoreE;
    protected boolean canCacheMoreN;
    protected boolean canCacheMoreS;
    protected boolean canCacheMoreW;
    protected int count;
    protected final TiledMap map;
    protected float maxTileHeight;
    protected float maxTileWidth;
    protected float overCache;
    protected final SpriteCache spriteCache;
    protected float unitScale;
    protected final float[] vertices;
    protected final Rectangle viewBounds;

    @Override // com.badlogic.gdx.maps.tiled.TiledMapRenderer
    public void renderObject(MapObject mapObject) {
    }

    public OrthoCachedTiledMapRenderer(TiledMap tiledMap) {
        this(tiledMap, 1.0f, 2000);
    }

    public OrthoCachedTiledMapRenderer(TiledMap tiledMap, float f) {
        this(tiledMap, f, 2000);
    }

    public OrthoCachedTiledMapRenderer(TiledMap tiledMap, float f, int i) {
        this.vertices = new float[20];
        this.viewBounds = new Rectangle();
        this.cacheBounds = new Rectangle();
        this.overCache = 0.5f;
        this.map = tiledMap;
        this.unitScale = f;
        this.spriteCache = new SpriteCache(i, true);
    }

    @Override // com.badlogic.gdx.maps.MapRenderer
    public void setView(OrthographicCamera orthographicCamera) {
        this.spriteCache.setProjectionMatrix(orthographicCamera.combined);
        float f = (orthographicCamera.viewportWidth * orthographicCamera.zoom) + (this.maxTileWidth * 2.0f * this.unitScale);
        float f2 = (orthographicCamera.viewportHeight * orthographicCamera.zoom) + (this.maxTileHeight * 2.0f * this.unitScale);
        this.viewBounds.set(orthographicCamera.position.x - (f / 2.0f), orthographicCamera.position.y - (f2 / 2.0f), f, f2);
        if ((this.canCacheMoreW && this.viewBounds.x < this.cacheBounds.x - tolerance) || ((this.canCacheMoreS && this.viewBounds.y < this.cacheBounds.y - tolerance) || ((this.canCacheMoreE && this.viewBounds.x + this.viewBounds.width > this.cacheBounds.x + this.cacheBounds.width + tolerance) || (this.canCacheMoreN && this.viewBounds.y + this.viewBounds.height > this.cacheBounds.y + this.cacheBounds.height + tolerance)))) {
            this.cached = false;
        }
    }

    @Override // com.badlogic.gdx.maps.MapRenderer
    public void setView(Matrix4 matrix4, float f, float f2, float f3, float f4) {
        this.spriteCache.setProjectionMatrix(matrix4);
        float f5 = this.maxTileWidth;
        float f6 = this.unitScale;
        float f7 = f - (f5 * f6);
        float f8 = this.maxTileHeight;
        this.viewBounds.set(f7, f2 - (f8 * f6), f3 + (f5 * 2.0f * f6), f4 + (f8 * 2.0f * f6));
        if ((this.canCacheMoreW && this.viewBounds.x < this.cacheBounds.x - tolerance) || ((this.canCacheMoreS && this.viewBounds.y < this.cacheBounds.y - tolerance) || ((this.canCacheMoreE && this.viewBounds.x + this.viewBounds.width > this.cacheBounds.x + this.cacheBounds.width + tolerance) || (this.canCacheMoreN && this.viewBounds.y + this.viewBounds.height > this.cacheBounds.y + this.cacheBounds.height + tolerance)))) {
            this.cached = false;
        }
    }

    @Override // com.badlogic.gdx.maps.MapRenderer
    public void render() {
        if (!this.cached) {
            this.cached = true;
            this.count = 0;
            this.spriteCache.clear();
            float f = this.viewBounds.width * this.overCache;
            float f2 = this.viewBounds.height * this.overCache;
            this.cacheBounds.x = this.viewBounds.x - f;
            this.cacheBounds.y = this.viewBounds.y - f2;
            this.cacheBounds.width = this.viewBounds.width + (f * 2.0f);
            this.cacheBounds.height = this.viewBounds.height + (f2 * 2.0f);
            Iterator<MapLayer> it = this.map.getLayers().iterator();
            while (it.hasNext()) {
                MapLayer next = it.next();
                this.spriteCache.beginCache();
                if (next instanceof TiledMapTileLayer) {
                    renderTileLayer((TiledMapTileLayer) next);
                } else if (next instanceof TiledMapImageLayer) {
                    renderImageLayer((TiledMapImageLayer) next);
                }
                this.spriteCache.endCache();
            }
        }
        if (this.blending) {
            Gdx.gl.glEnable(GL20.GL_BLEND);
            Gdx.gl.glBlendFunc(GL20.GL_SRC_ALPHA, GL20.GL_ONE_MINUS_SRC_ALPHA);
        }
        this.spriteCache.begin();
        MapLayers layers = this.map.getLayers();
        int count2 = layers.getCount();
        for (int i = 0; i < count2; i++) {
            MapLayer mapLayer = layers.get(i);
            if (mapLayer.isVisible()) {
                this.spriteCache.draw(i);
                renderObjects(mapLayer);
            }
        }
        this.spriteCache.end();
        if (this.blending) {
            Gdx.gl.glDisable(GL20.GL_BLEND);
        }
    }

    @Override // com.badlogic.gdx.maps.MapRenderer
    public void render(int[] iArr) {
        if (!this.cached) {
            this.cached = true;
            this.count = 0;
            this.spriteCache.clear();
            float f = this.viewBounds.width * this.overCache;
            float f2 = this.viewBounds.height * this.overCache;
            this.cacheBounds.x = this.viewBounds.x - f;
            this.cacheBounds.y = this.viewBounds.y - f2;
            this.cacheBounds.width = this.viewBounds.width + (f * 2.0f);
            this.cacheBounds.height = this.viewBounds.height + (f2 * 2.0f);
            Iterator<MapLayer> it = this.map.getLayers().iterator();
            while (it.hasNext()) {
                MapLayer next = it.next();
                this.spriteCache.beginCache();
                if (next instanceof TiledMapTileLayer) {
                    renderTileLayer((TiledMapTileLayer) next);
                } else if (next instanceof TiledMapImageLayer) {
                    renderImageLayer((TiledMapImageLayer) next);
                }
                this.spriteCache.endCache();
            }
        }
        if (this.blending) {
            Gdx.gl.glEnable(GL20.GL_BLEND);
            Gdx.gl.glBlendFunc(GL20.GL_SRC_ALPHA, GL20.GL_ONE_MINUS_SRC_ALPHA);
        }
        this.spriteCache.begin();
        MapLayers layers = this.map.getLayers();
        for (int i : iArr) {
            MapLayer mapLayer = layers.get(i);
            if (mapLayer.isVisible()) {
                this.spriteCache.draw(i);
                renderObjects(mapLayer);
            }
        }
        this.spriteCache.end();
        if (this.blending) {
            Gdx.gl.glDisable(GL20.GL_BLEND);
        }
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapRenderer
    public void renderObjects(MapLayer mapLayer) {
        Iterator<MapObject> it = mapLayer.getObjects().iterator();
        while (it.hasNext()) {
            renderObject(it.next());
        }
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapRenderer
    public void renderTileLayer(TiledMapTileLayer tiledMapTileLayer) {
        int i;
        float f;
        float f2;
        float f3;
        int i2;
        int i3;
        float f4;
        TiledMapTile tile;
        float floatBits = Color.toFloatBits(1.0f, 1.0f, 1.0f, tiledMapTileLayer.getOpacity());
        int width = tiledMapTileLayer.getWidth();
        int height = tiledMapTileLayer.getHeight();
        float tileWidth = tiledMapTileLayer.getTileWidth() * this.unitScale;
        float tileHeight = tiledMapTileLayer.getTileHeight() * this.unitScale;
        float renderOffsetX = tiledMapTileLayer.getRenderOffsetX() * this.unitScale;
        float f5 = (-tiledMapTileLayer.getRenderOffsetY()) * this.unitScale;
        int max = Math.max(0, (int) ((this.cacheBounds.x - renderOffsetX) / tileWidth));
        int min = Math.min(width, (int) ((((this.cacheBounds.x + this.cacheBounds.width) + tileWidth) - renderOffsetX) / tileWidth));
        int max2 = Math.max(0, (int) ((this.cacheBounds.y - f5) / tileHeight));
        int min2 = Math.min(height, (int) ((((this.cacheBounds.y + this.cacheBounds.height) + tileHeight) - f5) / tileHeight));
        int i4 = 1;
        this.canCacheMoreN = min2 < height;
        this.canCacheMoreE = min < width;
        this.canCacheMoreW = max > 0;
        this.canCacheMoreS = max2 > 0;
        float[] fArr = this.vertices;
        while (min2 >= max2) {
            int i5 = max;
            while (i5 < min) {
                TiledMapTileLayer.Cell cell = tiledMapTileLayer.getCell(i5, min2);
                if (cell == null || (tile = cell.getTile()) == null) {
                    f2 = tileWidth;
                    f3 = tileHeight;
                    f4 = renderOffsetX;
                    f = f5;
                    i2 = max;
                    i = min;
                    i3 = max2;
                } else {
                    this.count += i4;
                    boolean flipHorizontally = cell.getFlipHorizontally();
                    boolean flipVertically = cell.getFlipVertically();
                    int rotation = cell.getRotation();
                    TextureRegion textureRegion = tile.getTextureRegion();
                    Texture texture = textureRegion.getTexture();
                    i2 = max;
                    f2 = tileWidth;
                    float offsetX = (((float) i5) * tileWidth) + (tile.getOffsetX() * this.unitScale) + renderOffsetX;
                    f3 = tileHeight;
                    float offsetY = (((float) min2) * tileHeight) + (tile.getOffsetY() * this.unitScale) + f5;
                    f4 = renderOffsetX;
                    float regionWidth = (((float) textureRegion.getRegionWidth()) * this.unitScale) + offsetX;
                    f = f5;
                    float regionHeight = (((float) textureRegion.getRegionHeight()) * this.unitScale) + offsetY;
                    float width2 = 0.5f / ((float) texture.getWidth());
                    i = min;
                    float height2 = 0.5f / ((float) texture.getHeight());
                    float u = textureRegion.getU() + width2;
                    float v2 = textureRegion.getV2() - height2;
                    float u2 = textureRegion.getU2() - width2;
                    float v = textureRegion.getV() + height2;
                    fArr[0] = offsetX;
                    fArr[1] = offsetY;
                    i3 = max2;
                    fArr[2] = floatBits;
                    fArr[3] = u;
                    fArr[4] = v2;
                    fArr[5] = offsetX;
                    fArr[6] = regionHeight;
                    fArr[7] = floatBits;
                    fArr[8] = u;
                    fArr[9] = v;
                    fArr[10] = regionWidth;
                    fArr[11] = regionHeight;
                    fArr[12] = floatBits;
                    fArr[13] = u2;
                    fArr[14] = v;
                    fArr[15] = regionWidth;
                    fArr[16] = offsetY;
                    fArr[17] = floatBits;
                    fArr[18] = u2;
                    fArr[19] = v2;
                    if (flipHorizontally) {
                        float f6 = fArr[3];
                        fArr[3] = fArr[13];
                        fArr[13] = f6;
                        float f7 = fArr[8];
                        fArr[8] = fArr[18];
                        fArr[18] = f7;
                    }
                    if (flipVertically) {
                        float f8 = fArr[4];
                        fArr[4] = fArr[14];
                        fArr[14] = f8;
                        float f9 = fArr[9];
                        fArr[9] = fArr[19];
                        fArr[19] = f9;
                    }
                    if (rotation != 0) {
                        if (rotation == 1) {
                            float f10 = fArr[4];
                            fArr[4] = fArr[9];
                            fArr[9] = fArr[14];
                            fArr[14] = fArr[19];
                            fArr[19] = f10;
                            float f11 = fArr[3];
                            fArr[3] = fArr[8];
                            fArr[8] = fArr[13];
                            fArr[13] = fArr[18];
                            fArr[18] = f11;
                        } else if (rotation == 2) {
                            float f12 = fArr[3];
                            fArr[3] = fArr[13];
                            fArr[13] = f12;
                            float f13 = fArr[8];
                            fArr[8] = fArr[18];
                            fArr[18] = f13;
                            float f14 = fArr[4];
                            fArr[4] = fArr[14];
                            fArr[14] = f14;
                            float f15 = fArr[9];
                            fArr[9] = fArr[19];
                            fArr[19] = f15;
                        } else if (rotation == 3) {
                            float f16 = fArr[4];
                            fArr[4] = fArr[19];
                            fArr[19] = fArr[14];
                            fArr[14] = fArr[9];
                            fArr[9] = f16;
                            float f17 = fArr[3];
                            fArr[3] = fArr[18];
                            fArr[18] = fArr[13];
                            fArr[13] = fArr[8];
                            fArr[8] = f17;
                        }
                    }
                    this.spriteCache.add(texture, fArr, 0, 20);
                }
                i5++;
                renderOffsetX = f4;
                max2 = i3;
                max = i2;
                tileHeight = f3;
                tileWidth = f2;
                f5 = f;
                min = i;
                i4 = 1;
            }
            min2--;
            renderOffsetX = renderOffsetX;
            f5 = f5;
            i4 = 1;
        }
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapRenderer
    public void renderImageLayer(TiledMapImageLayer tiledMapImageLayer) {
        float floatBits = Color.toFloatBits(1.0f, 1.0f, 1.0f, tiledMapImageLayer.getOpacity());
        float[] fArr = this.vertices;
        TextureRegion textureRegion = tiledMapImageLayer.getTextureRegion();
        if (textureRegion != null) {
            float x = tiledMapImageLayer.getX();
            float y = tiledMapImageLayer.getY();
            float f = this.unitScale;
            float f2 = x * f;
            float f3 = y * f;
            float regionWidth = (((float) textureRegion.getRegionWidth()) * this.unitScale) + f2;
            float regionHeight = (((float) textureRegion.getRegionHeight()) * this.unitScale) + f3;
            float u = textureRegion.getU();
            float v2 = textureRegion.getV2();
            float u2 = textureRegion.getU2();
            float v = textureRegion.getV();
            fArr[0] = f2;
            fArr[1] = f3;
            fArr[2] = floatBits;
            fArr[3] = u;
            fArr[4] = v2;
            fArr[5] = f2;
            fArr[6] = regionHeight;
            fArr[7] = floatBits;
            fArr[8] = u;
            fArr[9] = v;
            fArr[10] = regionWidth;
            fArr[11] = regionHeight;
            fArr[12] = floatBits;
            fArr[13] = u2;
            fArr[14] = v;
            fArr[15] = regionWidth;
            fArr[16] = f3;
            fArr[17] = floatBits;
            fArr[18] = u2;
            fArr[19] = v2;
            this.spriteCache.add(textureRegion.getTexture(), fArr, 0, 20);
        }
    }

    public void invalidateCache() {
        this.cached = false;
    }

    public boolean isCached() {
        return this.cached;
    }

    public void setOverCache(float f) {
        this.overCache = f;
    }

    public void setMaxTileSize(float f, float f2) {
        this.maxTileWidth = f;
        this.maxTileHeight = f2;
    }

    public void setBlending(boolean z) {
        this.blending = z;
    }

    public SpriteCache getSpriteCache() {
        return this.spriteCache;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.spriteCache.dispose();
    }
}
