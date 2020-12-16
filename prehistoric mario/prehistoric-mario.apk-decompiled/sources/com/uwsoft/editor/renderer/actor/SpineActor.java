package com.uwsoft.editor.renderer.actor;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.SpineVO;
import com.uwsoft.editor.renderer.spine.SpineDataHelper;
import com.uwsoft.editor.renderer.spine.SpineReflectionHelper;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import java.lang.reflect.InvocationTargetException;

public class SpineActor extends Actor implements IBaseItem {
    private Body body;
    private CustomVariables customVariables;
    public SpineVO dataVO;
    private Essentials essentials;
    private boolean isLockedByLayer;
    protected int layerIndex;
    public float mulX;
    public float mulY;
    private CompositeItem parentItem;
    private SpineDataHelper spineData;
    private SpineReflectionHelper spineReflectionHelper;

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public boolean isComposite() {
        return false;
    }

    public SpineActor(SpineVO spineVO, Essentials essentials2, CompositeItem compositeItem) {
        this(spineVO, essentials2);
        setParentItem(compositeItem);
    }

    public SpineActor(SpineVO spineVO, Essentials essentials2) {
        this.mulX = 1.0f;
        this.mulY = 1.0f;
        this.layerIndex = 0;
        this.isLockedByLayer = false;
        this.parentItem = null;
        this.customVariables = new CustomVariables();
        this.essentials = essentials2;
        this.spineReflectionHelper = this.essentials.spineReflectionHelper;
        this.dataVO = spineVO;
        initSpine();
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

    private void initSpine() {
        this.spineData = new SpineDataHelper();
        try {
            this.spineData.initSpine(this.dataVO, this.essentials.rm, this.spineReflectionHelper, this.mulX);
        } catch (ReflectionException | IllegalAccessException | IllegalArgumentException | InstantiationException | InvocationTargetException e) {
            System.out.println("Reflection problem");
            e.printStackTrace();
        }
        setWidth(this.spineData.width);
        setHeight(this.spineData.height);
    }

    public Array<Object> getAnimations() {
        return this.spineData.getAnimations();
    }

    public void setAnimation(String str) {
        this.spineData.setAnimation(str);
        this.dataVO.currentAnimationName = str;
    }

    public Object getState() {
        return this.spineData.stateObject;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        this.spineData.draw(batch, f);
        super.draw(batch, f);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void act(float f) {
        this.spineData.act(f, getX(), getY());
        super.act(f);
    }

    public void setTint(Color color) {
        getDataVO().tint = new float[]{color.r, color.g, color.b, color.a};
        setColor(color);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public SpineVO getDataVO() {
        return this.dataVO;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void renew() {
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        setScaleX(this.dataVO.scaleX);
        setScaleY(this.dataVO.scaleY);
        setRotation(this.dataVO.rotation);
        setColor(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]);
        this.customVariables.loadFromString(this.dataVO.customVars);
        initSpine();
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
        this.mulX = f;
        this.mulY = f2;
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        updateDataVO();
        initSpine();
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

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setScale(float f) {
        super.setScale(f, f);
        this.dataVO.scaleX = f;
        renew();
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

    public String getCurrentAnimationName() {
        return this.dataVO.currentAnimationName;
    }
}
