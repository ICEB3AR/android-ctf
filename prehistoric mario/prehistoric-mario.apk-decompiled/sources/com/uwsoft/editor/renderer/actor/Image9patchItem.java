package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.g2d.NinePatch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.physics.box2d.Body;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.Image9patchVO;

public class Image9patchItem extends ImageItem implements IBaseItem {
    private Body body;
    private Image9patchVO image9patchVO;
    private final int[] splits;

    public Image9patchItem(Image9patchVO image9patchVO2, Essentials essentials) {
        this(image9patchVO2, essentials, (TextureAtlas.AtlasRegion) essentials.rm.getTextureRegion(image9patchVO2.imageName));
    }

    private Image9patchItem(Image9patchVO image9patchVO2, Essentials essentials, TextureAtlas.AtlasRegion atlasRegion) {
        super(image9patchVO2, essentials, new NinePatch(atlasRegion, atlasRegion.splits[0], atlasRegion.splits[1], atlasRegion.splits[2], atlasRegion.splits[3]));
        this.splits = atlasRegion.splits;
        this.image9patchVO = image9patchVO2;
    }

    public Image9patchItem(Image9patchVO image9patchVO2, Essentials essentials, CompositeItem compositeItem) {
        this(image9patchVO2, essentials);
        Image9patchVO image9patchVO3 = this.image9patchVO;
        image9patchVO3.width = image9patchVO3.width == 0.0f ? getWidth() : this.image9patchVO.width;
        Image9patchVO image9patchVO4 = this.image9patchVO;
        image9patchVO4.height = image9patchVO4.height == 0.0f ? getHeight() : this.image9patchVO.height;
        setParentItem(compositeItem);
        setWidth(this.image9patchVO.width);
        setHeight(this.image9patchVO.height);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setScaleX(float f) {
        float width = getWidth() * f;
        int[] iArr = this.splits;
        if (iArr != null && width < ((float) (iArr[0] + iArr[1]))) {
            width = (float) (iArr[0] + iArr[1]);
        }
        setWidth(width);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setScaleY(float f) {
        float height = getHeight() * f;
        int[] iArr = this.splits;
        if (iArr != null && height < ((float) (iArr[2] + iArr[3]))) {
            height = (float) (iArr[2] + iArr[3]);
        }
        setHeight(height);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.ui.Image
    public float getMinWidth() {
        int[] iArr = this.splits;
        return (float) (iArr[0] + iArr[1]);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.ui.Image
    public float getMinHeight() {
        int[] iArr = this.splits;
        return (float) (iArr[0] + iArr[1]);
    }

    @Override // com.uwsoft.editor.renderer.actor.ImageItem, com.uwsoft.editor.renderer.actor.IBaseItem
    public Body getBody() {
        return this.body;
    }

    @Override // com.uwsoft.editor.renderer.actor.ImageItem, com.uwsoft.editor.renderer.actor.IBaseItem
    public void setBody(Body body2) {
        this.body = body2;
    }

    @Override // com.uwsoft.editor.renderer.actor.ImageItem, com.uwsoft.editor.renderer.actor.IBaseItem
    public void dispose() {
        if (!(this.essentials.world == null || getBody() == null)) {
            this.essentials.world.destroyBody(getBody());
        }
        setBody(null);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setScale(float f, float f2) {
        setScaleX(f);
        setScaleY(f2);
    }

    @Override // com.uwsoft.editor.renderer.actor.ImageItem, com.uwsoft.editor.renderer.actor.IBaseItem
    public void renew() {
        setWidth(this.image9patchVO.width * this.mulX);
        setHeight(this.image9patchVO.height * this.mulY);
        super.renew();
    }

    @Override // com.uwsoft.editor.renderer.actor.ImageItem, com.uwsoft.editor.renderer.actor.IBaseItem
    public void updateDataVO() {
        this.image9patchVO.width = getWidth() / this.mulX;
        this.image9patchVO.height = getHeight() / this.mulY;
        super.updateDataVO();
    }

    @Override // com.uwsoft.editor.renderer.actor.ImageItem, com.uwsoft.editor.renderer.actor.IBaseItem
    public void applyResolution(float f, float f2) {
        Image9patchVO image9patchVO2 = (Image9patchVO) this.dataVO;
        setWidth(image9patchVO2.width * f);
        setHeight(image9patchVO2.height * f2);
        super.applyResolution(f, f2);
    }
}
