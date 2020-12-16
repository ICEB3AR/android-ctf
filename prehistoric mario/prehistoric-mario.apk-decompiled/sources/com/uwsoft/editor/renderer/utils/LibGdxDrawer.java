package com.uwsoft.editor.renderer.utils;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.brashmonkey.spriter.Drawer;
import com.brashmonkey.spriter.Loader;
import com.brashmonkey.spriter.Player;
import com.brashmonkey.spriter.Timeline;

public class LibGdxDrawer extends Drawer<Sprite> {
    Batch batch;
    ShapeRenderer renderer;

    public LibGdxDrawer(Loader<Sprite> loader, ShapeRenderer shapeRenderer) {
        super(loader);
        this.renderer = shapeRenderer;
    }

    @Override // com.brashmonkey.spriter.Drawer
    public void setColor(float f, float f2, float f3, float f4) {
        this.renderer.setColor(f, f2, f3, f4);
    }

    @Override // com.brashmonkey.spriter.Drawer
    public void rectangle(float f, float f2, float f3, float f4) {
        this.renderer.rect(f, f2, f3, f4);
    }

    @Override // com.brashmonkey.spriter.Drawer
    public void line(float f, float f2, float f3, float f4) {
        this.renderer.line(f, f2, f3, f4);
    }

    @Override // com.brashmonkey.spriter.Drawer
    public void circle(float f, float f2, float f3) {
        this.renderer.circle(f, f2, f3);
    }

    public void beforeDraw(Player player, Batch batch2) {
        this.batch = batch2;
        draw(player);
    }

    @Override // com.brashmonkey.spriter.Drawer
    public void draw(Timeline.Key.Object object) {
        Sprite sprite = (Sprite) this.loader.get(object.ref);
        float width = sprite.getWidth() * object.pivot.x;
        float height = sprite.getHeight() * object.pivot.y;
        sprite.setX(object.position.x - width);
        sprite.setY(object.position.y - height);
        sprite.setOrigin(width, height);
        sprite.setRotation(object.angle);
        sprite.setColor(1.0f, 1.0f, 1.0f, object.alpha);
        sprite.setScale(object.scale.x, object.scale.y);
        sprite.draw(this.batch);
    }
}
