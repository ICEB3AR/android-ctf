package com.uwsoft.editor.renderer.actor;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.ui.TextField;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.TextBoxVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public class TextBoxItem extends TextField implements IBaseItem {
    private Body body;
    private CustomVariables customVariables;
    public TextBoxVO dataVO;
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

    public TextBoxItem(TextBoxVO textBoxVO, Essentials essentials2, CompositeItem compositeItem) {
        this(textBoxVO, essentials2);
        setParentItem(compositeItem);
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public TextBoxItem(TextBoxVO textBoxVO, Essentials essentials2) {
        super(textBoxVO.defaultText, essentials2.rm.getSkin(), textBoxVO.style.isEmpty() ? "default" : textBoxVO.style);
        this.mulX = 1.0f;
        this.mulY = 1.0f;
        this.layerIndex = 0;
        this.isLockedByLayer = false;
        this.parentItem = null;
        this.customVariables = new CustomVariables();
        this.essentials = essentials2;
        this.dataVO = textBoxVO;
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
        setFocusTraversal(false);
        renew();
    }

    public void setTint(Color color) {
        getDataVO().tint = new float[]{color.r, color.g, color.b, color.a};
        setColor(color);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public TextBoxVO getDataVO() {
        return this.dataVO;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void renew() {
        setText(this.dataVO.defaultText);
        if (this.dataVO.width > 0.0f) {
            setWidth(this.dataVO.width);
        }
        if (this.dataVO.height > 0.0f) {
            setHeight(this.dataVO.height);
        }
        invalidate();
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        setScaleX(this.dataVO.scaleX * this.mulX);
        setScaleY(this.dataVO.scaleY * this.mulY);
        setRotation(this.dataVO.rotation);
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
    public CompositeItem getParentItem() {
        return this.parentItem;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void setParentItem(CompositeItem compositeItem) {
        this.parentItem = compositeItem;
    }

    public void setStyle(TextField.TextFieldStyle textFieldStyle, String str) {
        setStyle(textFieldStyle);
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
