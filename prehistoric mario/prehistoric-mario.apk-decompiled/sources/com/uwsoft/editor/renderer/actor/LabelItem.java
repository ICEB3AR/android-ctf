package com.uwsoft.editor.renderer.actor;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.LabelVO;
import com.uwsoft.editor.renderer.resources.IResourceRetriever;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public class LabelItem extends Label implements IBaseItem {
    private static BitmapFont font = null;
    private static int labelDefaultSize = 12;
    private static Label.LabelStyle style;
    private Body body;
    private CustomVariables customVariables;
    public LabelVO dataVO;
    public Essentials essentials;
    private String fontName;
    private int fontSize;
    private boolean isLockedByLayer;
    protected int layerIndex;
    public float mulX;
    public float mulY;
    private CompositeItem parentItem;

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public boolean isComposite() {
        return false;
    }

    public LabelItem(LabelVO labelVO, Essentials essentials2, CompositeItem compositeItem) {
        this(labelVO, essentials2);
        setParentItem(compositeItem);
    }

    public LabelItem(LabelVO labelVO, Essentials essentials2) {
        super(labelVO.text, generateStyle(essentials2.rm, labelVO.style, labelVO.size));
        this.mulX = 1.0f;
        this.mulY = 1.0f;
        this.layerIndex = 0;
        this.isLockedByLayer = false;
        this.parentItem = null;
        this.customVariables = new CustomVariables();
        this.dataVO = labelVO;
        this.essentials = essentials2;
        setX(this.dataVO.x);
        setY(this.dataVO.y);
        setRotation(this.dataVO.rotation);
        if (this.dataVO.zIndex < 0) {
            this.dataVO.zIndex = 0;
        }
        if (this.dataVO.tint == null) {
            setTint(new Color(1.0f, 1.0f, 1.0f, 1.0f));
        } else {
            setTint(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
        }
        if (this.dataVO.align == 0) {
            setAlignment(1);
        } else {
            setAlignment(this.dataVO.align);
        }
        if (this.dataVO.width == 0.0f) {
            this.dataVO.width = getWidth() / this.mulX;
        }
        if (this.dataVO.height == 0.0f) {
            this.dataVO.height = getHeight() / this.mulY;
        }
        renew();
    }

    private static Label.LabelStyle generateStyle(IResourceRetriever iResourceRetriever, String str, int i) {
        if (i == 0) {
            i = labelDefaultSize;
        }
        style = new Label.LabelStyle(iResourceRetriever.getBitmapFont(str, i), null);
        return style;
    }

    public void setTint(Color color) {
        getDataVO().tint = new float[]{color.r, color.g, color.b, color.a};
        setColor(color);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public LabelVO getDataVO() {
        return this.dataVO;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void renew() {
        String str = this.fontName;
        if (str == null || !str.equals(this.dataVO.style) || this.fontSize != this.dataVO.size) {
            if (this.dataVO.size == 0) {
                this.dataVO.size = labelDefaultSize;
            }
            font = this.essentials.rm.getBitmapFont(this.dataVO.style, this.dataVO.size);
            style = new Label.LabelStyle(font, null);
            setStyle(style);
            this.fontName = this.dataVO.style;
            this.fontSize = this.dataVO.size;
            if (this.dataVO.width == 0.0f) {
                this.dataVO.width = getWidth() / this.mulX;
            }
            if (this.dataVO.height == 0.0f) {
                this.dataVO.height = getHeight() / this.mulY;
            }
        }
        setText(this.dataVO.text);
        this.customVariables.loadFromString(this.dataVO.customVars);
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        setRotation(this.dataVO.rotation);
        setColor(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]);
        setScale(this.dataVO.scaleX, this.dataVO.scaleY);
        setAlignment(this.dataVO.align);
        setWidth(this.dataVO.width * this.mulY);
        setHeight(this.dataVO.height * this.mulY);
        setWrap(true);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public float getScaleX() {
        return getFontScaleX();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public float getScaleY() {
        return getFontScaleY();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setScaleX(float f) {
        if (f > 0.0f) {
            setFontScaleX(f);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setScaleY(float f) {
        if (f > 0.0f) {
            setFontScaleY(f);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setScale(float f, float f2) {
        if (f > 0.0f && f2 > 0.0f) {
            setFontScale(f, f2);
        }
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
        this.dataVO.y = getY() / this.mulY;
        this.dataVO.x = getX() / this.mulX;
        this.dataVO.rotation = getRotation();
        if (getZIndex() >= 0) {
            this.dataVO.zIndex = getZIndex();
        }
        if (this.dataVO.layerName == null || this.dataVO.layerName.equals(BuildConfig.FLAVOR)) {
            this.dataVO.layerName = "Default";
        }
        this.dataVO.customVars = this.customVariables.saveAsString();
        this.dataVO.scaleX = getScaleX();
        this.dataVO.scaleY = getScaleY();
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void applyResolution(float f, float f2) {
        this.mulX = f;
        this.mulY = f2;
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        setScale(this.dataVO.scaleX, this.dataVO.scaleY);
        setWidth(this.dataVO.width * f);
        setHeight(this.dataVO.height * f2);
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

    public void setStyle(String str, int i) {
        LabelVO labelVO = this.dataVO;
        labelVO.style = str;
        labelVO.size = i;
    }

    public void setAlign(int i) {
        this.dataVO.align = i;
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
