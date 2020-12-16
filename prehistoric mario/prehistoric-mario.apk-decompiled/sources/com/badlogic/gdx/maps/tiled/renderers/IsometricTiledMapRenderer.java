package com.badlogic.gdx.maps.tiled.renderers;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.maps.tiled.TiledMap;
import com.badlogic.gdx.maps.tiled.TiledMapTile;
import com.badlogic.gdx.maps.tiled.TiledMapTileLayer;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;

public class IsometricTiledMapRenderer extends BatchTiledMapRenderer {
    private Vector2 bottomLeft = new Vector2();
    private Vector2 bottomRight = new Vector2();
    private Matrix4 invIsotransform;
    private Matrix4 isoTransform;
    private Vector3 screenPos = new Vector3();
    private Vector2 topLeft = new Vector2();
    private Vector2 topRight = new Vector2();

    public IsometricTiledMapRenderer(TiledMap tiledMap) {
        super(tiledMap);
        init();
    }

    public IsometricTiledMapRenderer(TiledMap tiledMap, Batch batch) {
        super(tiledMap, batch);
        init();
    }

    public IsometricTiledMapRenderer(TiledMap tiledMap, float f) {
        super(tiledMap, f);
        init();
    }

    public IsometricTiledMapRenderer(TiledMap tiledMap, float f, Batch batch) {
        super(tiledMap, f, batch);
        init();
    }

    private void init() {
        this.isoTransform = new Matrix4();
        this.isoTransform.idt();
        this.isoTransform.scale((float) (Math.sqrt(2.0d) / 2.0d), (float) (Math.sqrt(2.0d) / 4.0d), 1.0f);
        this.isoTransform.rotate(0.0f, 0.0f, 1.0f, -45.0f);
        this.invIsotransform = new Matrix4(this.isoTransform);
        this.invIsotransform.inv();
    }

    private Vector3 translateScreenToIso(Vector2 vector2) {
        this.screenPos.set(vector2.x, vector2.y, 0.0f);
        this.screenPos.mul(this.invIsotransform);
        return this.screenPos;
    }

    @Override // com.badlogic.gdx.maps.tiled.TiledMapRenderer
    public void renderTileLayer(TiledMapTileLayer tiledMapTileLayer) {
        float f;
        float f2;
        float f3;
        int i;
        TiledMapTile tile;
        Color color = this.batch.getColor();
        float floatBits = Color.toFloatBits(color.r, color.g, color.b, color.a * tiledMapTileLayer.getOpacity());
        float tileWidth = tiledMapTileLayer.getTileWidth() * this.unitScale;
        float tileHeight = tiledMapTileLayer.getTileHeight() * this.unitScale;
        float renderOffsetX = tiledMapTileLayer.getRenderOffsetX() * this.unitScale;
        float f4 = (-tiledMapTileLayer.getRenderOffsetY()) * this.unitScale;
        float f5 = tileWidth * 0.5f;
        float f6 = tileHeight * 0.5f;
        this.topRight.set((this.viewBounds.x + this.viewBounds.width) - renderOffsetX, this.viewBounds.y - f4);
        this.bottomLeft.set(this.viewBounds.x - renderOffsetX, (this.viewBounds.y + this.viewBounds.height) - f4);
        this.topLeft.set(this.viewBounds.x - renderOffsetX, this.viewBounds.y - f4);
        this.bottomRight.set((this.viewBounds.x + this.viewBounds.width) - renderOffsetX, (this.viewBounds.y + this.viewBounds.height) - f4);
        int i2 = ((int) (translateScreenToIso(this.topLeft).y / tileWidth)) - 2;
        int i3 = ((int) (translateScreenToIso(this.bottomRight).y / tileWidth)) + 2;
        int i4 = ((int) (translateScreenToIso(this.bottomLeft).x / tileWidth)) - 2;
        int i5 = ((int) (translateScreenToIso(this.topRight).x / tileWidth)) + 2;
        while (i3 >= i2) {
            int i6 = i4;
            while (i6 <= i5) {
                float f7 = (float) i6;
                float f8 = (float) i3;
                float f9 = (f7 * f5) + (f8 * f5);
                float f10 = (f8 * f6) - (f7 * f6);
                TiledMapTileLayer.Cell cell = tiledMapTileLayer.getCell(i6, i3);
                if (cell == null || (tile = cell.getTile()) == null) {
                    i = i5;
                    f3 = f6;
                    f2 = renderOffsetX;
                    f = f4;
                } else {
                    boolean flipHorizontally = cell.getFlipHorizontally();
                    boolean flipVertically = cell.getFlipVertically();
                    int rotation = cell.getRotation();
                    TextureRegion textureRegion = tile.getTextureRegion();
                    float offsetX = f9 + (tile.getOffsetX() * this.unitScale) + renderOffsetX;
                    float offsetY = tile.getOffsetY();
                    i = i5;
                    float f11 = f10 + (offsetY * this.unitScale) + f4;
                    float regionWidth = (((float) textureRegion.getRegionWidth()) * this.unitScale) + offsetX;
                    f3 = f6;
                    float regionHeight = (((float) textureRegion.getRegionHeight()) * this.unitScale) + f11;
                    float u = textureRegion.getU();
                    float v2 = textureRegion.getV2();
                    float u2 = textureRegion.getU2();
                    float v = textureRegion.getV();
                    f2 = renderOffsetX;
                    f = f4;
                    this.vertices[0] = offsetX;
                    this.vertices[1] = f11;
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
                    this.vertices[16] = f11;
                    this.vertices[17] = floatBits;
                    this.vertices[18] = u2;
                    this.vertices[19] = v2;
                    if (flipHorizontally) {
                        float f12 = this.vertices[3];
                        this.vertices[3] = this.vertices[13];
                        this.vertices[13] = f12;
                        float f13 = this.vertices[8];
                        this.vertices[8] = this.vertices[18];
                        this.vertices[18] = f13;
                    }
                    if (flipVertically) {
                        float f14 = this.vertices[4];
                        this.vertices[4] = this.vertices[14];
                        this.vertices[14] = f14;
                        float f15 = this.vertices[9];
                        this.vertices[9] = this.vertices[19];
                        this.vertices[19] = f15;
                    }
                    if (rotation != 0) {
                        if (rotation == 1) {
                            float f16 = this.vertices[4];
                            this.vertices[4] = this.vertices[9];
                            this.vertices[9] = this.vertices[14];
                            this.vertices[14] = this.vertices[19];
                            this.vertices[19] = f16;
                            float f17 = this.vertices[3];
                            this.vertices[3] = this.vertices[8];
                            this.vertices[8] = this.vertices[13];
                            this.vertices[13] = this.vertices[18];
                            this.vertices[18] = f17;
                        } else if (rotation == 2) {
                            float f18 = this.vertices[3];
                            this.vertices[3] = this.vertices[13];
                            this.vertices[13] = f18;
                            float f19 = this.vertices[8];
                            this.vertices[8] = this.vertices[18];
                            this.vertices[18] = f19;
                            float f20 = this.vertices[4];
                            this.vertices[4] = this.vertices[14];
                            this.vertices[14] = f20;
                            float f21 = this.vertices[9];
                            this.vertices[9] = this.vertices[19];
                            this.vertices[19] = f21;
                        } else if (rotation == 3) {
                            float f22 = this.vertices[4];
                            this.vertices[4] = this.vertices[19];
                            this.vertices[19] = this.vertices[14];
                            this.vertices[14] = this.vertices[9];
                            this.vertices[9] = f22;
                            float f23 = this.vertices[3];
                            this.vertices[3] = this.vertices[18];
                            this.vertices[18] = this.vertices[13];
                            this.vertices[13] = this.vertices[8];
                            this.vertices[8] = f23;
                        }
                    }
                    this.batch.draw(textureRegion.getTexture(), this.vertices, 0, 20);
                }
                i6++;
                i5 = i;
                f6 = f3;
                renderOffsetX = f2;
                f4 = f;
            }
            i3--;
            i5 = i5;
        }
    }
}
