package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;

public class TiledDrawable extends TextureRegionDrawable {
    private static final Color temp = new Color();
    private final Color color = new Color(1.0f, 1.0f, 1.0f, 1.0f);

    public TiledDrawable() {
    }

    public TiledDrawable(TextureRegion textureRegion) {
        super(textureRegion);
    }

    public TiledDrawable(TextureRegionDrawable textureRegionDrawable) {
        super(textureRegionDrawable);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.TextureRegionDrawable, com.badlogic.gdx.scenes.scene2d.utils.Drawable, com.badlogic.gdx.scenes.scene2d.utils.BaseDrawable
    public void draw(Batch batch, float f, float f2, float f3, float f4) {
        float f5;
        Color color2 = batch.getColor();
        temp.set(color2);
        batch.setColor(color2.mul(this.color));
        TextureRegion region = getRegion();
        float regionWidth = (float) region.getRegionWidth();
        float regionHeight = (float) region.getRegionHeight();
        int i = (int) (f3 / regionWidth);
        int i2 = (int) (f4 / regionHeight);
        float f6 = f3 - (((float) i) * regionWidth);
        float f7 = f4 - (((float) i2) * regionHeight);
        float f8 = f;
        float f9 = f2;
        int i3 = 0;
        while (i3 < i) {
            float f10 = f2;
            for (int i4 = 0; i4 < i2; i4++) {
                batch.draw(region, f8, f10, regionWidth, regionHeight);
                f10 += regionHeight;
            }
            f8 += regionWidth;
            i3++;
            f9 = f10;
        }
        Texture texture = region.getTexture();
        float u = region.getU();
        float v2 = region.getV2();
        if (f6 > 0.0f) {
            float width = u + (f6 / ((float) texture.getWidth()));
            float v = region.getV();
            f5 = f2;
            int i5 = 0;
            while (i5 < i2) {
                batch.draw(texture, f8, f5, f6, regionHeight, u, v2, width, v);
                f5 += regionHeight;
                i5++;
                i2 = i2;
            }
            if (f7 > 0.0f) {
                batch.draw(texture, f8, f5, f6, f7, u, v2, width, v2 - (f7 / ((float) texture.getHeight())));
            }
        } else {
            f5 = f9;
        }
        if (f7 > 0.0f) {
            float u2 = region.getU2();
            float height = v2 - (f7 / ((float) texture.getHeight()));
            float f11 = f;
            for (int i6 = 0; i6 < i; i6++) {
                batch.draw(texture, f11, f5, regionWidth, f7, u, v2, u2, height);
                f11 += regionWidth;
            }
        }
        batch.setColor(temp);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.TextureRegionDrawable, com.badlogic.gdx.scenes.scene2d.utils.TransformDrawable
    public void draw(Batch batch, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9) {
        throw new UnsupportedOperationException();
    }

    public Color getColor() {
        return this.color;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.TextureRegionDrawable
    public TiledDrawable tint(Color color2) {
        TiledDrawable tiledDrawable = new TiledDrawable(this);
        tiledDrawable.color.set(color2);
        tiledDrawable.setLeftWidth(getLeftWidth());
        tiledDrawable.setRightWidth(getRightWidth());
        tiledDrawable.setTopHeight(getTopHeight());
        tiledDrawable.setBottomHeight(getBottomHeight());
        return tiledDrawable;
    }
}
