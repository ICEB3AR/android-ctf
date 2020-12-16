package com.uwsoft.editor.renderer.actor;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.ui.CheckBox;
import com.uwsoft.editor.renderer.data.CheckBoxVO;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public class CheckBoxItem extends CheckBox implements IBaseItem {
    private Body body;
    private CustomVariables customVariables;
    public CheckBoxVO dataVO;
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

    public CheckBoxItem(CheckBoxVO checkBoxVO, Essentials essentials2, CompositeItem compositeItem) {
        this(checkBoxVO, essentials2);
        setParentItem(compositeItem);
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public CheckBoxItem(CheckBoxVO checkBoxVO, Essentials essentials2) {
        super(checkBoxVO.text, essentials2.rm.getSkin(), checkBoxVO.style.isEmpty() ? "default" : checkBoxVO.style);
        this.mulX = 1.0f;
        this.mulY = 1.0f;
        this.layerIndex = 0;
        this.customVariables = new CustomVariables();
        this.isLockedByLayer = false;
        this.parentItem = null;
        this.dataVO = checkBoxVO;
        this.essentials = essentials2;
        setX(this.dataVO.x);
        setY(this.dataVO.y);
        setScaleX(this.dataVO.scaleX);
        setScaleY(this.dataVO.scaleY);
        this.customVariables.loadFromString(this.dataVO.customVars);
        setRotation(this.dataVO.rotation);
        if (this.dataVO.zIndex < 0) {
            this.dataVO.zIndex = 0;
        }
        if (this.dataVO.tint == null) {
            setTint(new Color(1.0f, 1.0f, 1.0f, 1.0f));
        } else {
            setTint(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
        }
    }

    public void setTint(Color color) {
        getDataVO().tint = new float[]{color.r, color.g, color.b, color.a};
        setColor(color);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public CheckBoxVO getDataVO() {
        return this.dataVO;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void renew() {
        setText(this.dataVO.text);
        pack();
        layout();
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        setScaleX(this.dataVO.scaleX * this.mulX);
        setScaleY(this.dataVO.scaleY * this.mulY);
        setRotation(this.dataVO.rotation);
        setColor(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]);
        this.customVariables.loadFromString(this.dataVO.customVars);
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
    public void updateDataVO() {
        this.dataVO.x = getX() / this.mulX;
        this.dataVO.y = getY() / this.mulY;
        this.dataVO.rotation = getRotation();
        if (getZIndex() >= 0) {
            this.dataVO.zIndex = getZIndex();
        }
        if (this.dataVO.layerName == null || this.dataVO.layerName.equals(BuildConfig.FLAVOR)) {
            this.dataVO.layerName = "Default";
        }
        this.dataVO.customVars = this.customVariables.saveAsString();
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void applyResolution(float f, float f2) {
        setScaleX(this.dataVO.scaleX * f);
        setScaleY(this.dataVO.scaleY * f2);
        this.mulX = f;
        this.mulY = f2;
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        updateDataVO();
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
    public void setParentItem(CompositeItem compositeItem) {
        this.parentItem = compositeItem;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public CompositeItem getParentItem() {
        return this.parentItem;
    }

    public void setStyle(CheckBox.CheckBoxStyle checkBoxStyle, String str) {
        setStyle(checkBoxStyle);
        this.dataVO.style = str;
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
        if (!(this.essentials.world == null || this.body == null)) {
            this.essentials.world.destroyBody(getBody());
        }
        setBody(null);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public CustomVariables getCustomVariables() {
        return this.customVariables;
    }
}
