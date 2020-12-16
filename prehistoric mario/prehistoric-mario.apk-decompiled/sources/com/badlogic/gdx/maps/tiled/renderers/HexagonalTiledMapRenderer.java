package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.maps.tiled.tiles.AnimatedTiledMapTile;

public class HexagonalTiledMapRenderer extends BatchTiledMapRenderer {
    private float hexSideLength = 0.0f;
    private boolean staggerAxisX = true;
    private boolean staggerIndexEven = false;

    public HexagonalTiledMapRenderer(TiledMap tiledMap) {
        super(tiledMap);
        init(tiledMap);
    }

    public HexagonalTiledMapRenderer(TiledMap tiledMap, float f) {
        super(tiledMap, f);
        init(tiledMap);
    }

    public HexagonalTiledMapRenderer(TiledMap tiledMap, Batch batch) {
        super(tiledMap, batch);
        init(tiledMap);
    }

    public HexagonalTiledMapRenderer(TiledMap tiledMap, float f, Batch batch) {
        super(tiledMap, f, batch);
        init(tiledMap);
    }

    private void init(TiledMap tiledMap) {
        String str = (String) tiledMap.getProperties().get("staggeraxis", String.class);
        if (str != null) {
            if (str.equals("x")) {
                this.staggerAxisX = true;
            } else {
                this.staggerAxisX = false;
            }
        }
        String str2 = (String) tiledMap.getProperties().get("staggerindex", String.class);
        if (str2 != null) {
            if (str2.equals("even")) {
                this.staggerIndexEven = true;
            } else {
                this.staggerIndexEven = false;
            }
        }
        Integer num = (Integer) tiledMap.getProperties().get("hexsidelength", Integer.class);
        if (num != null) {
            this.hexSideLength = (float) num.intValue();
        } else if (this.staggerAxisX) {
            Integer num2 = (Integer) tiledMap.getProperties().get("tilewidth", Integer.class);
            if (num2 != null) {
                this.hexSideLength = ((float) num2.intValue()) * 0.5f;
            } else {
                this.hexSideLength = ((TiledMapTileLayer) tiledMap.getLayers().get(0)).getTileWidth() * 0.5f;
            }
        } else {
            Integer num3 = (Integer) tiledMap.getProperties().get("tileheight", Integer.class);
            if (num3 != null) {
                this.hexSideLength = ((float) num3.intValue()) * 0.5f;
            } else {
                this.hexSideLength = ((TiledMapTileLayer) tiledMap.getLayers().get(0)).getTileHeight() * 0.5f;
            }
        }
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapRenderer
    public void renderTileLayer(TiledMapTileLayer tiledMapTileLayer) {
        TiledMapTileLayer tiledMapTileLayer2 = tiledMapTileLayer;
        Color color = this.batch.getColor();
        float floatBits = Color.toFloatBits(color.r, color.g, color.b, color.a * tiledMapTileLayer.getOpacity());
        int width = tiledMapTileLayer.getWidth();
        int height = tiledMapTileLayer.getHeight();
        float tileWidth = tiledMapTileLayer.getTileWidth() * this.unitScale;
        float tileHeight = tiledMapTileLayer.getTileHeight() * this.unitScale;
        float renderOffsetX = tiledMapTileLayer.getRenderOffsetX() * this.unitScale;
        float f = (-tiledMapTileLayer.getRenderOffsetY()) * this.unitScale;
        float f2 = this.hexSideLength * this.unitScale;
        boolean z = false;
        if (this.staggerAxisX) {
            float f3 = (tileWidth + f2) / 2.0f;
            float f4 = 0.5f * tileHeight;
            int max = Math.max(0, (int) (((this.viewBounds.y - f4) - renderOffsetX) / tileHeight));
            int min = Math.min(height, (int) ((((this.viewBounds.y + this.viewBounds.height) + tileHeight) - renderOffsetX) / tileHeight));
            int max2 = Math.max(0, (int) (((this.viewBounds.x - ((tileWidth - f2) / 2.0f)) - f) / f3));
            int min2 = Math.min(width, (int) ((((this.viewBounds.x + this.viewBounds.width) + f3) - f) / f3));
            boolean z2 = this.staggerIndexEven;
            int i = max2 % 2;
            if (i == 0) {
                z = true;
            }
            int i2 = z2 == z ? max2 + 1 : max2;
            if (this.staggerIndexEven != (i == 0)) {
                max2++;
            }
            int i3 = min - 1;
            while (i3 >= max) {
                int i4 = i2;
                while (i4 < min2) {
                    renderCell(tiledMapTileLayer2.getCell(i4, i3), (((float) i4) * f3) + renderOffsetX, (((float) i3) * tileHeight) + f4 + f, floatBits);
                    i4 += 2;
                    max = max;
                }
                for (int i5 = max2; i5 < min2; i5 += 2) {
                    renderCell(tiledMapTileLayer2.getCell(i5, i3), (((float) i5) * f3) + renderOffsetX, (((float) i3) * tileHeight) + f, floatBits);
                }
                i3--;
                max = max;
            }
            return;
        }
        float f5 = (tileHeight + f2) / 2.0f;
        float f6 = 0.5f * tileWidth;
        int max3 = Math.max(0, (int) (((this.viewBounds.y - ((tileHeight - f2) / 2.0f)) - renderOffsetX) / f5));
        int min3 = Math.min(height, (int) ((((this.viewBounds.y + this.viewBounds.height) + f5) - renderOffsetX) / f5));
        int max4 = Math.max(0, (int) (((this.viewBounds.x - f6) - f) / tileWidth));
        int min4 = Math.min(width, (int) ((((this.viewBounds.x + this.viewBounds.width) + tileWidth) - f) / tileWidth));
        int i6 = min3 - 1;
        while (i6 >= max3) {
            float f7 = (i6 % 2 == 0) == this.staggerIndexEven ? f6 : 0.0f;
            int i7 = max4;
            while (i7 < min4) {
                renderCell(tiledMapTileLayer2.getCell(i7, i6), (((float) i7) * tileWidth) + f7 + renderOffsetX, (((float) i6) * f5) + f, floatBits);
                i7++;
                tiledMapTileLayer2 = tiledMapTileLayer;
            }
            i6--;
            tiledMapTileLayer2 = tiledMapTileLayer;
        }
    }

    private void renderCell(TiledMapTileLayer.Cell cell, float f, float f2, float f3) {
        TiledMapTile tile;
        if (cell != null && (tile = cell.getTile()) != null && !(tile instanceof AnimatedTiledMapTile)) {
            boolean flipHorizontally = cell.getFlipHorizontally();
            boolean flipVertically = cell.getFlipVertically();
            int rotation = cell.getRotation();
            TextureRegion textureRegion = tile.getTextureRegion();
            float offsetX = f + (tile.getOffsetX() * this.unitScale);
            float offsetY = f2 + (tile.getOffsetY() * this.unitScale);
            float regionWidth = (((float) textureRegion.getRegionWidth()) * this.unitScale) + offsetX;
            float regionHeight = (((float) textureRegion.getRegionHeight()) * this.unitScale) + offsetY;
            float u = textureRegion.getU();
            float v2 = textureRegion.getV2();
            float u2 = textureRegion.getU2();
            float v = textureRegion.getV();
            this.vertices[0] = offsetX;
            this.vertices[1] = offsetY;
            this.vertices[2] = f3;
            this.vertices[3] = u;
            this.vertices[4] = v2;
            this.vertices[5] = offsetX;
            this.vertices[6] = regionHeight;
            this.vertices[7] = f3;
            this.vertices[8] = u;
            this.vertices[9] = v;
            this.vertices[10] = regionWidth;
            this.vertices[11] = regionHeight;
            this.vertices[12] = f3;
            this.vertices[13] = u2;
            this.vertices[14] = v;
            this.vertices[15] = regionWidth;
            this.vertices[16] = offsetY;
            this.vertices[17] = f3;
            this.vertices[18] = u2;
            this.vertices[19] = v2;
            if (flipHorizontally) {
                float f4 = this.vertices[3];
                this.vertices[3] = this.vertices[13];
                this.vertices[13] = f4;
                float f5 = this.vertices[8];
                this.vertices[8] = this.vertices[18];
                this.vertices[18] = f5;
            }
            if (flipVertically) {
                float f6 = this.vertices[4];
                this.vertices[4] = this.vertices[14];
                this.vertices[14] = f6;
                float f7 = this.vertices[9];
                this.vertices[9] = this.vertices[19];
                this.vertices[19] = f7;
            }
            if (rotation == 2) {
                float f8 = this.vertices[3];
                this.vertices[3] = this.vertices[13];
                this.vertices[13] = f8;
                float f9 = this.vertices[8];
                this.vertices[8] = this.vertices[18];
                this.vertices[18] = f9;
                float f10 = this.vertices[4];
                this.vertices[4] = this.vertices[14];
                this.vertices[14] = f10;
                float f11 = this.vertices[9];
                this.vertices[9] = this.vertices[19];
                this.vertices[19] = f11;
            }
            this.batch.draw(textureRegion.getTexture(), this.vertices, 0, 20);
        }
    }
}
