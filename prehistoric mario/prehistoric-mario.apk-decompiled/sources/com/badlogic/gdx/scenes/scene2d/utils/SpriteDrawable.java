package com.badlogic.gdx.scenes.scene2d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;

public class SpriteDrawable extends BaseDrawable implements TransformDrawable {
    private static final Color temp = new Color();
    private Sprite sprite;

    public SpriteDrawable() {
    }

    public SpriteDrawable(Sprite sprite2) {
        setSprite(sprite2);
    }

    public SpriteDrawable(SpriteDrawable spriteDrawable) {
        super(spriteDrawable);
        setSprite(spriteDrawable.sprite);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Drawable, com.badlogic.gdx.scenes.scene2d.utils.BaseDrawable
    public void draw(Batch batch, float f, float f2, float f3, float f4) {
        Color color = this.sprite.getColor();
        temp.set(color);
        this.sprite.setColor(color.mul(batch.getColor()));
        this.sprite.setRotation(0.0f);
        this.sprite.setScale(1.0f, 1.0f);
        this.sprite.setBounds(f, f2, f3, f4);
        this.sprite.draw(batch);
        this.sprite.setColor(temp);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.TransformDrawable
    public void draw(Batch batch, float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9) {
        Color color = this.sprite.getColor();
        temp.set(color);
        this.sprite.setColor(color.mul(batch.getColor()));
        this.sprite.setOrigin(f3, f4);
        this.sprite.setRotation(f9);
        this.sprite.setScale(f7, f8);
        this.sprite.setBounds(f, f2, f5, f6);
        this.sprite.draw(batch);
        this.sprite.setColor(temp);
    }

    public void setSprite(Sprite sprite2) {
        this.sprite = sprite2;
        setMinWidth(sprite2.getWidth());
        setMinHeight(sprite2.getHeight());
    }

    public Sprite getSprite() {
        return this.sprite;
    }

    public SpriteDrawable tint(Color color) {
        Sprite sprite2;
        Sprite sprite3 = this.sprite;
        if (sprite3 instanceof TextureAtlas.AtlasSprite) {
            sprite2 = new TextureAtlas.AtlasSprite((TextureAtlas.AtlasSprite) sprite3);
        } else {
            sprite2 = new Sprite(sprite3);
        }
        sprite2.setColor(color);
        sprite2.setSize(getMinWidth(), getMinHeight());
        SpriteDrawable spriteDrawable = new SpriteDrawable(sprite2);
        spriteDrawable.setLeftWidth(getLeftWidth());
        spriteDrawable.setRightWidth(getRightWidth());
        spriteDrawable.setTopHeight(getTopHeight());
        spriteDrawable.setBottomHeight(getBottomHeight());
        return spriteDrawable;
    }
}
