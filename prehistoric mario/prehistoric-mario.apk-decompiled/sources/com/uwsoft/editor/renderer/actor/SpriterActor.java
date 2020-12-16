package com.uwsoft.editor.renderer.actor;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.brashmonkey.spriter.Data;
import com.brashmonkey.spriter.Player;
import com.brashmonkey.spriter.Rectangle;
import com.brashmonkey.spriter.SCMLReader;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.data.SpriterVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import com.uwsoft.editor.renderer.utils.LibGdxDrawer;
import com.uwsoft.editor.renderer.utils.LibGdxLoader;
import java.util.ArrayList;

public class SpriterActor extends Actor implements IBaseItem {
    private ArrayList<String> animations;
    private Body body;
    private int currentAnimationIndex;
    private String currentAnimationName;
    private int currentEntityIndex;
    private CustomVariables customVariables;
    private Data data;
    public SpriterVO dataVO;
    private LibGdxDrawer drawer;
    private ArrayList<String> entities;
    private final Essentials essentials;
    private int frameHeight;
    private int frameWidth;
    private boolean isLockedByLayer;
    protected int layerIndex;
    public float mulX;
    public float mulY;
    private CompositeItem parentItem;
    private Player player;
    protected boolean reverse;

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void dispose() {
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public Body getBody() {
        return null;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public boolean isComposite() {
        return false;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void setBody(Body body2) {
    }

    public SpriterActor(SpriterVO spriterVO, Essentials essentials2, CompositeItem compositeItem) {
        this(spriterVO, essentials2);
        setParentItem(compositeItem);
    }

    public SpriterActor(SpriterVO spriterVO, Essentials essentials2) {
        this.mulX = 1.0f;
        this.mulY = 1.0f;
        this.layerIndex = 0;
        this.reverse = false;
        this.isLockedByLayer = false;
        this.parentItem = null;
        this.customVariables = new CustomVariables();
        this.currentAnimationName = BuildConfig.FLAVOR;
        this.animations = new ArrayList<>();
        this.entities = new ArrayList<>();
        this.currentEntityIndex = 0;
        this.essentials = essentials2;
        this.dataVO = spriterVO;
        setX(this.dataVO.x);
        setY(this.dataVO.y);
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
        initSpriteAnimation();
    }

    private void initSpriteAnimation() {
        setOriginX(0.0f);
        setOriginY(0.0f);
        FileHandle sCMLFile = this.essentials.rm.getSCMLFile(this.dataVO.animationName);
        this.data = new SCMLReader(sCMLFile.read()).getData();
        LibGdxLoader libGdxLoader = new LibGdxLoader(this.data);
        libGdxLoader.load(sCMLFile.file());
        this.drawer = new LibGdxDrawer(libGdxLoader, new ShapeRenderer());
        this.currentAnimationIndex = this.dataVO.animation;
        this.currentEntityIndex = this.dataVO.entity;
        initPlayer();
    }

    private void initPlayer() {
        this.player = new Player(this.data.getEntity(this.currentEntityIndex));
        this.player.setAnimation(this.currentAnimationIndex);
        this.player.setScale(this.dataVO.scale * this.mulX);
        setRectangle();
    }

    private void setRectangle() {
        this.player.update();
        Rectangle boundingRectangle = this.player.getBoundingRectangle(null);
        this.frameWidth = (int) boundingRectangle.size.width;
        this.frameHeight = (int) boundingRectangle.size.height;
        setWidth((float) this.frameWidth);
        setHeight((float) this.frameHeight);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void act(float f) {
        super.act(f);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        batch.setColor(1.0f, 1.0f, 1.0f, getColor().a * f);
        super.draw(batch, f);
        this.player.setPosition(getX(), getY());
        this.player.setPivot(getWidth() / 2.0f, getHeight() / 2.0f);
        this.player.setScale(this.dataVO.scale * this.mulX);
        this.player.rotate(getRotation() - this.player.getAngle());
        this.player.update();
        this.drawer.beforeDraw(this.player, batch);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void renew() {
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        this.player.setScale(this.dataVO.scale * this.mulX);
        setRotation(this.dataVO.rotation);
        this.customVariables.loadFromString(this.dataVO.customVars);
        setRectangle();
    }

    public void setSpriterScale(float f) {
        this.dataVO.scale = f;
        renew();
    }

    public void setTint(Color color) {
        getDataVO().tint = new float[]{color.r, color.g, color.b, color.a};
        setColor(color);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public MainItemVO getDataVO() {
        return this.dataVO;
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
    public int getLayerIndex() {
        return this.layerIndex;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void setLayerIndex(int i) {
        this.layerIndex = i;
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
        SpriterVO spriterVO = this.dataVO;
        spriterVO.entity = this.currentEntityIndex;
        spriterVO.animation = this.currentAnimationIndex;
        spriterVO.customVars = this.customVariables.saveAsString();
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void applyResolution(float f, float f2) {
        this.mulX = f;
        this.mulY = f2;
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        updateDataVO();
        initPlayer();
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
    public CustomVariables getCustomVariables() {
        return this.customVariables;
    }

    public ArrayList<String> getAnimations() {
        this.animations = new ArrayList<>();
        for (int i = 0; i < this.data.getEntity(this.currentEntityIndex).animations(); i++) {
            this.animations.add(this.data.getEntity(this.currentEntityIndex).getAnimation(i).name);
        }
        return this.animations;
    }

    public void setAnimation(int i) {
        this.currentAnimationIndex = i;
        updateDataVO();
        initPlayer();
    }

    public void setEntity(int i) {
        this.currentEntityIndex = i;
        setAnimation(0);
        updateDataVO();
        initPlayer();
    }

    public ArrayList<String> getEntities() {
        this.entities = this.data.getEntities();
        return this.entities;
    }

    public String getCurrentEntityName() {
        return this.entities.get(this.currentEntityIndex);
    }

    public int getCurrentEntityIndex() {
        return this.currentEntityIndex;
    }

    public String getCurrentAnimationName() {
        return this.currentAnimationName;
    }

    public int getCurrentAnimationIndex() {
        return this.currentAnimationIndex;
    }
}
