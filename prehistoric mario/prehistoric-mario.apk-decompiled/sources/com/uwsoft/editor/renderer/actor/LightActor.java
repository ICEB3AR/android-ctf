package com.uwsoft.editor.renderer.actor;

import box2dLight.ConeLight;
import box2dLight.Light;
import box2dLight.PointLight;
import box2dLight.RayHandler;
import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.LightVO;
import com.uwsoft.editor.renderer.physics.PhysicsBodyLoader;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import java.io.PrintStream;

public class LightActor extends Actor implements IBaseItem {
    private Body body;
    private CustomVariables customVariables;
    private LightVO dataVO;
    private Image debugImg;
    private float direction;
    public Essentials essentials;
    private boolean isLockedByLayer;
    protected int layerIndex;
    public Light lightObject;
    public float mulX;
    public float mulY;
    private CompositeItem parentItem;
    public RayHandler rayHandler;
    private Vector2 tmpVector;

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public boolean isComposite() {
        return false;
    }

    public LightActor(LightVO lightVO, Essentials essentials2, CompositeItem compositeItem) {
        this(lightVO, essentials2);
        setParentItem(compositeItem);
    }

    public LightActor(LightVO lightVO, Essentials essentials2) {
        this.lightObject = null;
        this.rayHandler = null;
        this.mulX = 1.0f;
        this.mulY = 1.0f;
        this.layerIndex = 0;
        this.isLockedByLayer = false;
        this.parentItem = null;
        this.tmpVector = new Vector2();
        this.customVariables = new CustomVariables();
        this.essentials = essentials2;
        this.rayHandler = this.essentials.rayHandler;
        this.dataVO = lightVO;
        setX(this.dataVO.x);
        setY(this.dataVO.y);
        this.customVariables.loadFromString(this.dataVO.customVars);
        if (this.dataVO.type == LightVO.LightType.POINT) {
            createPointLight();
        } else {
            createConeLight();
        }
        setWidth(40.0f);
        setHeight(40.0f);
    }

    public void createPointLight() {
        this.lightObject = new PointLight(this.rayHandler, this.dataVO.rays);
        this.lightObject.setColor(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
        this.lightObject.setDistance(this.dataVO.distance * this.mulX * PhysicsBodyLoader.SCALE);
        this.lightObject.setPosition(this.dataVO.x * this.mulX * PhysicsBodyLoader.SCALE, this.dataVO.y * this.mulY * PhysicsBodyLoader.SCALE);
        this.lightObject.setStaticLight(this.dataVO.isStatic);
        this.lightObject.setActive(true);
        this.lightObject.setXray(this.dataVO.isXRay);
    }

    public void createConeLight() {
        this.lightObject = new ConeLight(this.rayHandler, this.dataVO.rays, Color.WHITE, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f);
        this.lightObject.setColor(new Color(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]));
        this.lightObject.setDistance(this.dataVO.distance * this.mulX * PhysicsBodyLoader.SCALE);
        this.lightObject.setPosition(this.dataVO.x * this.mulX * PhysicsBodyLoader.SCALE, this.dataVO.y * this.mulY * PhysicsBodyLoader.SCALE);
        this.lightObject.setStaticLight(this.dataVO.isStatic);
        this.direction = this.dataVO.directionDegree;
        this.lightObject.setDirection(this.direction);
        ((ConeLight) this.lightObject).setConeDegree(this.dataVO.coneDegree);
        this.lightObject.setActive(true);
        this.lightObject.setXray(this.dataVO.isXRay);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void act(float f) {
        float f2;
        float x = getX();
        float y = getY();
        float f3 = 0.0f;
        float f4 = 0.0f;
        for (Group parent = getParent(); parent != null; parent = parent.getParent()) {
            x += parent.getX();
            y += parent.getY();
            f4 += parent.getRotation();
        }
        if (this.lightObject != null) {
            if (f4 != 0.0f) {
                float x2 = (getX() * MathUtils.cosDeg(f4)) - (getY() * MathUtils.sinDeg(f4));
                f3 = getY() - ((getY() * MathUtils.cosDeg(f4)) + (getX() * MathUtils.sinDeg(f4)));
                f2 = getX() - x2;
            } else {
                f2 = 0.0f;
            }
            this.lightObject.setPosition(((x - f2) + 20.0f) * PhysicsBodyLoader.SCALE, ((y - f3) + 20.0f) * PhysicsBodyLoader.SCALE);
        }
        if (this.dataVO.type == LightVO.LightType.CONE) {
            this.lightObject.setDirection(this.direction + f4);
        }
        super.act(f);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        super.draw(batch, f);
    }

    public void changeDistance(int i) {
        this.lightObject.setDistance(((float) i) * PhysicsBodyLoader.SCALE);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public LightVO getDataVO() {
        return this.dataVO;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void renew() {
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        removeLights();
        if (this.dataVO.type == LightVO.LightType.POINT) {
            createPointLight();
        } else {
            createConeLight();
        }
        this.customVariables.loadFromString(this.dataVO.customVars);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public float getRotation() {
        if (this.dataVO.type == LightVO.LightType.POINT) {
            return 0.0f;
        }
        return super.getRotation();
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
        this.dataVO.distance = (((float) ((int) this.lightObject.getDistance())) / this.mulX) / PhysicsBodyLoader.SCALE;
        PrintStream printStream = System.out;
        printStream.println("dataVO.distance = " + this.dataVO.distance);
        LightVO lightVO = this.dataVO;
        lightVO.directionDegree = this.direction;
        if (lightVO.type == LightVO.LightType.CONE) {
            this.dataVO.coneDegree = ((ConeLight) this.lightObject).getConeDegree();
        }
        this.dataVO.x = getX() / this.mulX;
        this.dataVO.y = getY() / this.mulY;
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
        Light light = this.lightObject;
        if (light != null) {
            light.setDistance(this.dataVO.distance * this.mulX * PhysicsBodyLoader.SCALE);
        }
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

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setColor(Color color) {
        if (color != null) {
            this.lightObject.setColor(color);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public Color getColor() {
        return this.lightObject.getColor();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void setRotation(float f) {
        if (this.dataVO.type == LightVO.LightType.CONE) {
            this.lightObject.setDirection(this.direction + f);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void rotateBy(float f) {
        if (this.dataVO.type == LightVO.LightType.POINT) {
            Light light = this.lightObject;
            light.setDistance(light.getDistance() + (f * PhysicsBodyLoader.SCALE));
            return;
        }
        this.direction += f;
        this.lightObject.setDirection(this.direction);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void dispose() {
        removeLights();
        if (!(this.essentials.world == null || getBody() == null)) {
            this.essentials.world.destroyBody(getBody());
        }
        setBody(null);
    }

    public void removeLights() {
        Light light = this.lightObject;
        if (light != null) {
            light.remove();
            this.lightObject = null;
        }
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
    public CustomVariables getCustomVariables() {
        return this.customVariables;
    }
}
