package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;

public class OrthogonalTiledMapRenderer extends BatchTiledMapRenderer {
    public OrthogonalTiledMapRenderer(TiledMap tiledMap) {
        super(tiledMap);
    }

    public OrthogonalTiledMapRenderer(TiledMap tiledMap, Batch batch) {
        super(tiledMap, batch);
    }

    public OrthogonalTiledMapRenderer(TiledMap tiledMap, float f) {
        super(tiledMap, f);
    }

    public OrthogonalTiledMapRenderer(TiledMap tiledMap, float f, Batch batch) {
        super(tiledMap, f, batch);
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapRenderer
    public void renderTileLayer(TiledMapTileLayer tiledMapTileLayer) {
        int i;
        int i2;
        float f;
        int i3;
        Color color = this.batch.getColor();
        float floatBits = Color.toFloatBits(color.r, color.g, color.b, color.a * tiledMapTileLayer.getOpacity());
        int width = tiledMapTileLayer.getWidth();
        int height = tiledMapTileLayer.getHeight();
        float tileWidth = tiledMapTileLayer.getTileWidth() * this.unitScale;
        float tileHeight = tiledMapTileLayer.getTileHeight() * this.unitScale;
        float renderOffsetX = tiledMapTileLayer.getRenderOffsetX() * this.unitScale;
        float f2 = (-tiledMapTileLayer.getRenderOffsetY()) * this.unitScale;
        int max = Math.max(0, (int) ((this.viewBounds.x - renderOffsetX) / tileWidth));
        int min = Math.min(width, (int) ((((this.viewBounds.x + this.viewBounds.width) + tileWidth) - renderOffsetX) / tileWidth));
        int max2 = Math.max(0, (int) ((this.viewBounds.y - f2) / tileHeight));
        int min2 = Math.min(height, (int) ((((this.viewBounds.y + this.viewBounds.height) + tileHeight) - f2) / tileHeight));
        float f3 = (((float) min2) * tileHeight) + f2;
        float f4 = (((float) max) * tileWidth) + renderOffsetX;
        float[] fArr = this.vertices;
        while (min2 >= max2) {
            float f5 = f4;
            int i4 = max;
            while (i4 < min) {
                TiledMapTileLayer.Cell cell = tiledMapTileLayer.getCell(i4, min2);
                if (cell == null) {
                    f5 += tileWidth;
                    i3 = min;
                    f = f4;
                    i2 = max;
                    i = max2;
                } else {
                    TiledMapTile tile = cell.getTile();
                    if (tile != null) {
                        boolean flipHorizontally = cell.getFlipHorizontally();
                        boolean flipVertically = cell.getFlipVertically();
                        int rotation = cell.getRotation();
                        TextureRegion textureRegion = tile.getTextureRegion();
                        float offsetX = f5 + (tile.getOffsetX() * this.unitScale);
                        float offsetY = tile.getOffsetY();
                        i3 = min;
                        float f6 = (offsetY * this.unitScale) + f3;
                        f = f4;
                        float regionWidth = offsetX + (((float) textureRegion.getRegionWidth()) * this.unitScale);
                        i2 = max;
                        float regionHeight = (((float) textureRegion.getRegionHeight()) * this.unitScale) + f6;
                        float u = textureRegion.getU();
                        float v2 = textureRegion.getV2();
                        float u2 = textureRegion.getU2();
                        float v = textureRegion.getV();
                        fArr[0] = offsetX;
                        i = max2;
                        fArr[1] = f6;
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
                        fArr[16] = f6;
                        fArr[17] = floatBits;
                        fArr[18] = u2;
                        fArr[19] = v2;
                        if (flipHorizontally) {
                            float f7 = fArr[3];
                            fArr[3] = fArr[13];
                            fArr[13] = f7;
                            float f8 = fArr[8];
                            fArr[8] = fArr[18];
                            fArr[18] = f8;
                        }
                        if (flipVertically) {
                            float f9 = fArr[4];
                            fArr[4] = fArr[14];
                            fArr[14] = f9;
                            float f10 = fArr[9];
                            fArr[9] = fArr[19];
                            fArr[19] = f10;
                        }
                        if (rotation != 0) {
                            if (rotation == 1) {
                                float f11 = fArr[4];
                                fArr[4] = fArr[9];
                                fArr[9] = fArr[14];
                                fArr[14] = fArr[19];
                                fArr[19] = f11;
                                float f12 = fArr[3];
                                fArr[3] = fArr[8];
                                fArr[8] = fArr[13];
                                fArr[13] = fArr[18];
                                fArr[18] = f12;
                            } else if (rotation == 2) {
                                float f13 = fArr[3];
                                fArr[3] = fArr[13];
                                fArr[13] = f13;
                                float f14 = fArr[8];
                                fArr[8] = fArr[18];
                                fArr[18] = f14;
                                float f15 = fArr[4];
                                fArr[4] = fArr[14];
                                fArr[14] = f15;
                                float f16 = fArr[9];
                                fArr[9] = fArr[19];
                                fArr[19] = f16;
                            } else if (rotation == 3) {
                                float f17 = fArr[4];
                                fArr[4] = fArr[19];
                                fArr[19] = fArr[14];
                                fArr[14] = fArr[9];
                                fArr[9] = f17;
                                float f18 = fArr[3];
                                fArr[3] = fArr[18];
                                fArr[18] = fArr[13];
                                fArr[13] = fArr[8];
                                fArr[8] = f18;
                            }
                        }
                        this.batch.draw(textureRegion.getTexture(), fArr, 0, 20);
                    } else {
                        i3 = min;
                        f = f4;
                        i2 = max;
                        i = max2;
                    }
                    f5 += tileWidth;
                }
                i4++;
                min = i3;
                f4 = f;
                max = i2;
                max2 = i;
            }
            f3 -= tileHeight;
            min2--;
        }
    }
}
