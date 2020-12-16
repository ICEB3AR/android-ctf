package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;

public class IsometricStaggeredTiledMapRenderer extends BatchTiledMapRenderer {
    public IsometricStaggeredTiledMapRenderer(TiledMap tiledMap) {
        super(tiledMap);
    }

    public IsometricStaggeredTiledMapRenderer(TiledMap tiledMap, Batch batch) {
        super(tiledMap, batch);
    }

    public IsometricStaggeredTiledMapRenderer(TiledMap tiledMap, float f) {
        super(tiledMap, f);
    }

    public IsometricStaggeredTiledMapRenderer(TiledMap tiledMap, float f, Batch batch) {
        super(tiledMap, f, batch);
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapRenderer
    public void renderTileLayer(TiledMapTileLayer tiledMapTileLayer) {
        float f;
        float f2;
        float f3;
        int i;
        float f4;
        float f5;
        TiledMapTile tile;
        Color color = this.batch.getColor();
        float floatBits = Color.toFloatBits(color.r, color.g, color.b, color.a * tiledMapTileLayer.getOpacity());
        int width = tiledMapTileLayer.getWidth();
        int height = tiledMapTileLayer.getHeight();
        float renderOffsetX = tiledMapTileLayer.getRenderOffsetX() * this.unitScale;
        float f6 = (-tiledMapTileLayer.getRenderOffsetY()) * this.unitScale;
        float tileWidth = tiledMapTileLayer.getTileWidth() * this.unitScale;
        float tileHeight = tiledMapTileLayer.getTileHeight() * this.unitScale;
        float f7 = tileWidth * 0.5f;
        float f8 = 0.5f * tileHeight;
        int max = Math.max(0, (int) (((this.viewBounds.x - f7) - renderOffsetX) / tileWidth));
        int min = Math.min(width, (int) (((((this.viewBounds.x + this.viewBounds.width) + tileWidth) + f7) - renderOffsetX) / tileWidth));
        int max2 = Math.max(0, (int) (((this.viewBounds.y - tileHeight) - f6) / tileHeight));
        int min2 = Math.min(height, (int) ((((this.viewBounds.y + this.viewBounds.height) + tileHeight) - f6) / f8));
        int i2 = 1;
        int i3 = min2 - 1;
        while (i3 >= max2) {
            float f9 = i3 % 2 == i2 ? f7 : 0.0f;
            int i4 = min - 1;
            while (i4 >= max) {
                TiledMapTileLayer.Cell cell = tiledMapTileLayer.getCell(i4, i3);
                if (cell == null || (tile = cell.getTile()) == null) {
                    i = min;
                    f4 = renderOffsetX;
                    f5 = f6;
                    f3 = tileWidth;
                    f2 = f8;
                    f = f7;
                } else {
                    boolean flipHorizontally = cell.getFlipHorizontally();
                    boolean flipVertically = cell.getFlipVertically();
                    int rotation = cell.getRotation();
                    TextureRegion textureRegion = tile.getTextureRegion();
                    i = min;
                    float offsetX = ((((float) i4) * tileWidth) - f9) + (tile.getOffsetX() * this.unitScale) + renderOffsetX;
                    f4 = renderOffsetX;
                    float offsetY = (((float) i3) * f8) + (tile.getOffsetY() * this.unitScale) + f6;
                    f5 = f6;
                    float regionWidth = (((float) textureRegion.getRegionWidth()) * this.unitScale) + offsetX;
                    f3 = tileWidth;
                    float regionHeight = (((float) textureRegion.getRegionHeight()) * this.unitScale) + offsetY;
                    float u = textureRegion.getU();
                    float v2 = textureRegion.getV2();
                    float u2 = textureRegion.getU2();
                    float v = textureRegion.getV();
                    f2 = f8;
                    this.vertices[0] = offsetX;
                    this.vertices[1] = offsetY;
                    f = f7;
                    this.vertices[2] = floatBits;
                    this.vertices[3] = u;
                    this.vertices[4] = v2;
                    this.vertices[5] = offsetX;
                    this.vertices[6] = regionHeight;
                    this.vertices[7] = floatBits;
                    this.vertices[8] = u;
                    this.vertices[9] = v;
                    this.vertices[10] = regionWidth;
                    this.vertices[11] = regionHeight;
                    this.vertices[12] = floatBits;
                    this.vertices[13] = u2;
                    this.vertices[14] = v;
                    this.vertices[15] = regionWidth;
                    this.vertices[16] = offsetY;
                    this.vertices[17] = floatBits;
                    this.vertices[18] = u2;
                    this.vertices[19] = v2;
                    if (flipHorizontally) {
                        float f10 = this.vertices[3];
                        this.vertices[3] = this.vertices[13];
                        this.vertices[13] = f10;
                        float f11 = this.vertices[8];
                        this.vertices[8] = this.vertices[18];
                        this.vertices[18] = f11;
                    }
                    if (flipVertically) {
                        float f12 = this.vertices[4];
                        this.vertices[4] = this.vertices[14];
                        this.vertices[14] = f12;
                        float f13 = this.vertices[9];
                        this.vertices[9] = this.vertices[19];
                        this.vertices[19] = f13;
                    }
                    if (rotation != 0) {
                        if (rotation == 1) {
                            float f14 = this.vertices[4];
                            this.vertices[4] = this.vertices[9];
                            this.vertices[9] = this.vertices[14];
                            this.vertices[14] = this.vertices[19];
                            this.vertices[19] = f14;
                            float f15 = this.vertices[3];
                            this.vertices[3] = this.vertices[8];
                            this.vertices[8] = this.vertices[13];
                            this.vertices[13] = this.vertices[18];
                            this.vertices[18] = f15;
                        } else if (rotation == 2) {
                            float f16 = this.vertices[3];
                            this.vertices[3] = this.vertices[13];
                            this.vertices[13] = f16;
                            float f17 = this.vertices[8];
                            this.vertices[8] = this.vertices[18];
                            this.vertices[18] = f17;
                            float f18 = this.vertices[4];
                            this.vertices[4] = this.vertices[14];
                            this.vertices[14] = f18;
                            float f19 = this.vertices[9];
                            this.vertices[9] = this.vertices[19];
                            this.vertices[19] = f19;
                        } else if (rotation == 3) {
                            float f20 = this.vertices[4];
                            this.vertices[4] = this.vertices[19];
                            this.vertices[19] = this.vertices[14];
                            this.vertices[14] = this.vertices[9];
                            this.vertices[9] = f20;
                            float f21 = this.vertices[3];
                            this.vertices[3] = this.vertices[18];
                            this.vertices[18] = this.vertices[13];
                            this.vertices[13] = this.vertices[8];
                            this.vertices[8] = f21;
                        }
                    }
                    this.batch.draw(textureRegion.getTexture(), this.vertices, 0, 20);
                }
                i4--;
                f6 = f5;
                renderOffsetX = f4;
                min = i;
                tileWidth = f3;
                f8 = f2;
                f7 = f;
            }
            i3--;
            min = min;
            f8 = f8;
            i2 = 1;
        }
    }
}
