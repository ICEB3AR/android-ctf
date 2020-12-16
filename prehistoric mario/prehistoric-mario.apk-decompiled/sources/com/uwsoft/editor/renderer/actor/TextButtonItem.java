package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.ui.TextButton;
import com.uwsoft.editor.renderer.data.ButtonVO;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public class TextButtonItem extends TextButton implements IBaseItem {
    private Body body;
    private CustomVariables customVariables;
    public ButtonVO dataVO;
    public Essentials essentials;
    private boolean isLockedByLayer;
    protected int layerIndex;
    public float mulX;
    public float mulY;
    private CompositeItem parentItem;

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public boolean isComposite() {
        return false;
    }

    public TextButtonItem(ButtonVO buttonVO, Essentials essentials2, CompositeItem compositeItem) {
        this(buttonVO, essentials2);
        setParentItem(compositeItem);
    }

    public TextButtonItem(ButtonVO buttonVO, Essentials essentials2) {
        super(buttonVO.text, essentials2.rm.getSkin());
        this.mulX = 1.0f;
        this.mulY = 1.0f;
        this.layerIndex = 0;
        this.isLockedByLayer = false;
        this.parentItem = null;
        this.customVariables = new CustomVariables();
        this.dataVO = buttonVO;
        this.essentials = essentials2;
        setX(this.dataVO.x);
        setY(this.dataVO.y);
        this.customVariables.loadFromString(this.dataVO.customVars);
        getLabel().setFontScale(this.dataVO.scaleX, this.dataVO.scaleY);
        setRotation(this.dataVO.rotation);
        if (this.dataVO.zIndex < 0) {
            this.dataVO.zIndex = 0;
        }
        if (this.dataVO.tint == null) {
            setTint(new Color(1.0f, 1.0f, 1.0f, 1.0f));
        } else {
            setTint(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
        }
        pack();
        layout();
    }

    public void setTint(Color color) {
        getDataVO().tint = new float[]{color.r, color.g, color.b, color.a};
        setColor(color);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public ButtonVO getDataVO() {
        return this.dataVO;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void updateDataVO() {
        this.dataVO.x = getX();
        this.dataVO.y = getY();
        this.dataVO.customVars = this.customVariables.saveAsString();
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void renew() {
        setText(this.dataVO.text);
        this.customVariables.loadFromString(this.dataVO.customVars);
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        getLabel().setFontScale(this.dataVO.scaleX * this.mulX, this.dataVO.scaleY * this.mulY);
        setRotation(this.dataVO.rotation);
        pack();
        layout();
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public boolean isLockedByLayer() {
        return this.isLockedByLayer;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void setLockByLayer(boolean z) {
        this.isLockedByLayer = z;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void applyResolution(float f, float f2) {
        this.mulX = f;
        this.mulY = f2;
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        getLabel().setFontScale(this.dataVO.scaleX * this.mulX, this.dataVO.scaleY * this.mulY);
        updateDataVO();
        pack();
        layout();
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public int getLayerIndex() {
        return this.layerIndex;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void setLayerIndex(int i) {
        this.layerIndex = i;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public CompositeItem getParentItem() {
        return this.parentItem;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void setParentItem(CompositeItem compositeItem) {
        this.parentItem = compositeItem;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public Body getBody() {
        return this.body;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void setBody(Body body2) {
        this.body = body2;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void dispose() {
        if (!(this.essentials.world == null || getBody() == null)) {
            this.essentials.world.destroyBody(getBody());
        }
        setBody(null);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public CustomVariables getCustomVariables() {
        return this.customVariables;
    }
}
