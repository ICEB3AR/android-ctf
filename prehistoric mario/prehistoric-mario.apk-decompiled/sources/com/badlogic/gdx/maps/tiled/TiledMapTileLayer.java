package com.badlogic.gdx.maps.tiled;

import com.badlogic.gdx.maps.MapLayer;
import java.lang.reflect.Array;

public class TiledMapTileLayer extends MapLayer {
    private Cell[][] cells;
    private int height;
    private float tileHeight;
    private float tileWidth;
    private int width;

    public int getWidth() {
        return this.width;
    }

    public int getHeight() {
        return this.height;
    }

    public float getTileWidth() {
        return this.tileWidth;
    }

    public float getTileHeight() {
        return this.tileHeight;
    }

    public TiledMapTileLayer(int i, int i2, int i3, int i4) {
        this.width = i;
        this.height = i2;
        this.tileWidth = (float) i3;
        this.tileHeight = (float) i4;
        this.cells = (Cell[][]) Array.newInstance(Cell.class, i, i2);
    }

    public Cell getCell(int i, int i2) {
        if (i < 0 || i >= this.width || i2 < 0 || i2 >= this.height) {
            return null;
        }
        return this.cells[i][i2];
    }

    public void setCell(int i, int i2, Cell cell) {
        if (i >= 0 && i < this.width && i2 >= 0 && i2 < this.height) {
            this.cells[i][i2] = cell;
        }
    }

    public static class Cell {
        public static final int ROTATE_0 = 0;
        public static final int ROTATE_180 = 2;
        public static final int ROTATE_270 = 3;
        public static final int ROTATE_90 = 1;
        private boolean flipHorizontally;
        private boolean flipVertically;
        private int rotation;
        private TiledMapTile tile;

        public TiledMapTile getTile() {
            return this.tile;
        }

        public Cell setTile(TiledMapTile tiledMapTile) {
            this.tile = tiledMapTile;
            return this;
        }

        public boolean getFlipHorizontally() {
            return this.flipHorizontally;
        }

        public Cell setFlipHorizontally(boolean z) {
            this.flipHorizontally = z;
            return this;
        }

        public boolean getFlipVertically() {
            return this.flipVertically;
        }

        public Cell setFlipVertically(boolean z) {
            this.flipVertically = z;
            return this;
        }

        public int getRotation() {
            return this.rotation;
        }

        public Cell setRotation(int i) {
            this.rotation = i;
            return this;
        }
    }
}
