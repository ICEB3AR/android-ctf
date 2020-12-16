package com.badlogic.gdx.scenes.scene2d.ui;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.NinePatch;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.NinePatchDrawable;
import com.badlogic.gdx.scenes.scene2d.utils.TextureRegionDrawable;
import com.badlogic.gdx.scenes.scene2d.utils.TransformDrawable;
import com.badlogic.gdx.utils.Scaling;

public class Image extends Widget {
    private int align;
    private Drawable drawable;
    private float imageHeight;
    private float imageWidth;
    private float imageX;
    private float imageY;
    private Scaling scaling;

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getMinHeight() {
        return 0.0f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getMinWidth() {
        return 0.0f;
    }

    public Image() {
        this((Drawable) null);
    }

    public Image(NinePatch ninePatch) {
        this(new NinePatchDrawable(ninePatch), Scaling.stretch, 1);
    }

    public Image(TextureRegion textureRegion) {
        this(new TextureRegionDrawable(textureRegion), Scaling.stretch, 1);
    }

    public Image(Texture texture) {
        this(new TextureRegionDrawable(new TextureRegion(texture)));
    }

    public Image(Skin skin, String str) {
        this(skin.getDrawable(str), Scaling.stretch, 1);
    }

    public Image(Drawable drawable2) {
        this(drawable2, Scaling.stretch, 1);
    }

    public Image(Drawable drawable2, Scaling scaling2) {
        this(drawable2, scaling2, 1);
    }

    public Image(Drawable drawable2, Scaling scaling2, int i) {
        this.align = 1;
        setDrawable(drawable2);
        this.scaling = scaling2;
        this.align = i;
        setSize(getPrefWidth(), getPrefHeight());
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public void layout() {
        Drawable drawable2 = this.drawable;
        if (drawable2 != null) {
            float minWidth = drawable2.getMinWidth();
            float minHeight = this.drawable.getMinHeight();
            float width = getWidth();
            float height = getHeight();
            Vector2 apply = this.scaling.apply(minWidth, minHeight, width, height);
            this.imageWidth = apply.x;
            this.imageHeight = apply.y;
            int i = this.align;
            if ((i & 8) != 0) {
                this.imageX = 0.0f;
            } else if ((i & 16) != 0) {
                this.imageX = (float) ((int) (width - this.imageWidth));
            } else {
                this.imageX = (float) ((int) ((width / 2.0f) - (this.imageWidth / 2.0f)));
            }
            int i2 = this.align;
            if ((i2 & 2) != 0) {
                this.imageY = (float) ((int) (height - this.imageHeight));
            } else if ((i2 & 4) != 0) {
                this.imageY = 0.0f;
            } else {
                this.imageY = (float) ((int) ((height / 2.0f) - (this.imageHeight / 2.0f)));
            }
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        validate();
        Color color = getColor();
        batch.setColor(color.r, color.g, color.b, color.a * f);
        float x = getX();
        float y = getY();
        float scaleX = getScaleX();
        float scaleY = getScaleY();
        if (this.drawable instanceof TransformDrawable) {
            float rotation = getRotation();
            if (!(scaleX == 1.0f && scaleY == 1.0f && rotation == 0.0f)) {
                ((TransformDrawable) this.drawable).draw(batch, x + this.imageX, y + this.imageY, getOriginX() - this.imageX, getOriginY() - this.imageY, this.imageWidth, this.imageHeight, scaleX, scaleY, rotation);
                return;
            }
        }
        Drawable drawable2 = this.drawable;
        if (drawable2 != null) {
            drawable2.draw(batch, x + this.imageX, y + this.imageY, this.imageWidth * scaleX, this.imageHeight * scaleY);
        }
    }

    public void setDrawable(Skin skin, String str) {
        setDrawable(skin.getDrawable(str));
    }

    public void setDrawable(Drawable drawable2) {
        if (this.drawable != drawable2) {
            if (drawable2 == null) {
                invalidateHierarchy();
            } else if (!(getPrefWidth() == drawable2.getMinWidth() && getPrefHeight() == drawable2.getMinHeight())) {
                invalidateHierarchy();
            }
            this.drawable = drawable2;
        }
    }

    public Drawable getDrawable() {
        return this.drawable;
    }

    public void setScaling(Scaling scaling2) {
        if (scaling2 != null) {
            this.scaling = scaling2;
            invalidate();
            return;
        }
        throw new IllegalArgumentException("scaling cannot be null.");
    }

    public void setAlign(int i) {
        this.align = i;
        invalidate();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefWidth() {
        Drawable drawable2 = this.drawable;
        if (drawable2 != null) {
            return drawable2.getMinWidth();
        }
        return 0.0f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefHeight() {
        Drawable drawable2 = this.drawable;
        if (drawable2 != null) {
            return drawable2.getMinHeight();
        }
        return 0.0f;
    }

    public float getImageX() {
        return this.imageX;
    }

    public float getImageY() {
        return this.imageY;
    }

    public float getImageWidth() {
        return this.imageWidth;
    }

    public float getImageHeight() {
        return this.imageHeight;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public String toString() {
        String name = getName();
        if (name != null) {
            return name;
        }
        String name2 = getClass().getName();
        int lastIndexOf = name2.lastIndexOf(46);
        if (lastIndexOf != -1) {
            name2 = name2.substring(lastIndexOf + 1);
        }
        StringBuilder sb = new StringBuilder();
        sb.append(name2.indexOf(36) != -1 ? "Image " : BuildConfig.FLAVOR);
        sb.append(name2);
        sb.append(": ");
        sb.append(this.drawable);
        return sb.toString();
    }
}
