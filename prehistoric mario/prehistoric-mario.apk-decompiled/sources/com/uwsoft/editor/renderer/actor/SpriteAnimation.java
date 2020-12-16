package com.uwsoft.editor.renderer.actor;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonWriter;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.data.SpriteAnimationVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SpriteAnimation extends Actor implements IBaseItem {
    private TextureAtlas.AtlasRegion[] animationAtlasRegions;
    public AnimationCompleteListener animationCompleteListener;
    private Map<String, Animation> animations;
    private Body body;
    private String currentAnimationName;
    private CustomVariables customVariables;
    public SpriteAnimationVO dataVO;
    private int endFrame;
    private final Essentials essentials;
    private int firstFrame;
    private float frameDuration;
    private int frameHeight;
    private int frameIndex;
    private int frameWidth;
    private int framesCount;
    private boolean isLockedByLayer;
    private float lastFrame;
    protected int layerIndex;
    public boolean looping;
    public float mulX;
    public float mulY;
    private float normalSpeed;
    private CompositeItem parentItem;
    private boolean paused;
    private int playingTo;
    protected boolean reverse;

    public interface AnimationCompleteListener {
        void complete(SpriteAnimation spriteAnimation);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public boolean isComposite() {
        return false;
    }

    public SpriteAnimation(SpriteAnimationVO spriteAnimationVO, Essentials essentials2, CompositeItem compositeItem) {
        this(spriteAnimationVO, essentials2);
        setParentItem(compositeItem);
    }

    public SpriteAnimation(SpriteAnimationVO spriteAnimationVO, Essentials essentials2) {
        this.mulX = 1.0f;
        this.mulY = 1.0f;
        this.layerIndex = 0;
        this.reverse = false;
        this.isLockedByLayer = false;
        this.parentItem = null;
        this.playingTo = -1;
        this.normalSpeed = 1.0f;
        this.paused = true;
        this.animations = new HashMap();
        this.customVariables = new CustomVariables();
        this.currentAnimationName = BuildConfig.FLAVOR;
        this.essentials = essentials2;
        this.dataVO = spriteAnimationVO;
        setX(this.dataVO.x);
        setY(this.dataVO.y);
        setScaleX(this.dataVO.scaleX);
        setScaleY(this.dataVO.scaleY);
        this.customVariables.loadFromString(this.dataVO.customVars);
        this.animations = Animation.constructJsonObject(this.dataVO.animations);
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

    public String getCurrentAnimationName() {
        return this.currentAnimationName;
    }

    private void initSpriteAnimation() {
        this.lastFrame = 0.0f;
        this.frameIndex = -1;
        setOriginX(0.0f);
        setOriginY(0.0f);
        Array<TextureAtlas.AtlasRegion> regions = this.essentials.rm.getSpriteAnimation(this.dataVO.animationName).getRegions();
        this.animationAtlasRegions = new TextureAtlas.AtlasRegion[regions.size];
        this.frameHeight = regions.get(0).originalHeight;
        this.frameWidth = regions.get(0).originalWidth;
        setWidth((float) this.frameWidth);
        setHeight((float) this.frameHeight);
        this.framesCount = regions.size;
        for (int i = 0; i < regions.size; i++) {
            this.animationAtlasRegions[regNameToFrame(regions.get(i).name) - 1] = regions.get(i);
        }
        setAnimation(this.dataVO.fps, true);
    }

    public int getFramesCount() {
        return this.animationAtlasRegions.length;
    }

    public void setAnimation(boolean z) {
        setAnimation(24, z);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        batch.setColor(1.0f, 1.0f, 1.0f, getColor().a * f);
        batch.draw(this.animationAtlasRegions[this.frameIndex], getX() + this.animationAtlasRegions[this.frameIndex].offsetX, getY() + this.animationAtlasRegions[this.frameIndex].offsetY, getOriginX(), getOriginY(), (float) this.animationAtlasRegions[this.frameIndex].getRegionWidth(), (float) this.animationAtlasRegions[this.frameIndex].getRegionHeight(), getScaleX(), getScaleY(), getRotation());
        super.draw(batch, f);
    }

    public TextureAtlas.AtlasRegion getAtlasRegionAt(int i) {
        return this.animationAtlasRegions[i];
    }

    public void setAnimation(String str) {
        Animation animation = this.animations.get(str);
        if (animation != null) {
            setAnimation(animation.startFrame, animation.endFrame, this.dataVO.fps, this.looping);
            this.currentAnimationName = str;
        }
    }

    public void setAnimation(int i, boolean z) {
        boolean z2 = false;
        this.firstFrame = 0;
        this.endFrame = this.framesCount - 1;
        int i2 = this.endFrame;
        this.playingTo = i2;
        this.frameIndex = 0;
        this.frameDuration = 1.0f / ((float) i);
        this.looping = z;
        if (this.firstFrame > i2) {
            z2 = true;
        }
        this.reverse = z2;
    }

    public void setAnimation(int i, int i2, int i3, boolean z) {
        this.firstFrame = i;
        this.endFrame = i2;
        this.playingTo = this.endFrame;
        this.frameIndex = i;
        this.frameDuration = 1.0f / ((float) i3);
        this.looping = z;
        if (i > i2) {
            this.reverse = true;
        } else {
            this.reverse = false;
        }
    }

    private int regNameToFrame(String str) {
        Matcher matcher = Pattern.compile("[^0-9]+([0-9]+)$").matcher(str);
        if (matcher.find()) {
            return Integer.parseInt(matcher.group(1));
        }
        throw new RuntimeException("Frame name should be something like this '*0001', but not " + str + ".");
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
    public void renew() {
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        setScaleX(this.dataVO.scaleX);
        setScaleY(this.dataVO.scaleY);
        setRotation(this.dataVO.rotation);
        setColor(this.dataVO.tint[0], this.dataVO.tint[1], this.dataVO.tint[2], this.dataVO.tint[3]);
        if (this.currentAnimationName.isEmpty()) {
            setAnimation(this.dataVO.fps, this.looping);
        } else {
            setAnimation(this.currentAnimationName);
        }
        this.customVariables.loadFromString(this.dataVO.customVars);
        this.animations = Animation.constructJsonObject(this.dataVO.animations);
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
        this.dataVO.customVars = this.customVariables.saveAsString();
        this.dataVO.animations = Animation.constructJsonString(this.animations);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void applyResolution(float f, float f2) {
        this.mulX = f;
        this.mulY = f2;
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        updateDataVO();
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
        SpriteAnimationVO spriteAnimationVO = this.dataVO;
        spriteAnimationVO.scaleX = f;
        spriteAnimationVO.scaleY = f;
        renew();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public void act(float f) {
        int i;
        boolean z = this.paused;
        if (!z) {
            float f2 = this.frameDuration / this.normalSpeed;
            this.lastFrame += f;
            if (this.lastFrame > f2) {
                if (!z) {
                    if (this.reverse) {
                        this.frameIndex--;
                    } else {
                        this.frameIndex++;
                    }
                }
                this.lastFrame = 0.0f;
                if ((this.frameIndex > this.playingTo && !this.reverse) || (this.frameIndex < this.playingTo && this.reverse)) {
                    if (this.looping) {
                        this.frameIndex = this.firstFrame;
                    } else {
                        AnimationCompleteListener animationCompleteListener2 = this.animationCompleteListener;
                        if (animationCompleteListener2 != null) {
                            animationCompleteListener2.complete(this);
                            this.paused = true;
                            int i2 = this.frameIndex;
                            int i3 = this.endFrame;
                            if (i2 > i3) {
                                this.frameIndex = i3;
                            }
                        } else {
                            this.paused = true;
                            int i4 = this.frameIndex;
                            int i5 = this.endFrame;
                            if (i4 > i5) {
                                this.frameIndex = i5;
                            }
                        }
                    }
                }
                if (!this.looping && (i = this.playingTo) != -1 && this.frameIndex == i) {
                    this.playingTo = -1;
                    this.paused = true;
                    AnimationCompleteListener animationCompleteListener3 = this.animationCompleteListener;
                    if (animationCompleteListener3 != null) {
                        animationCompleteListener3.complete(this);
                    }
                }
            }
            super.act(f);
        }
    }

    public void pause() {
        this.paused = true;
    }

    public void start() {
        this.frameIndex = 0;
        this.paused = false;
    }

    public void resume() {
        this.paused = false;
    }

    public void playTo(int i) {
        int i2 = this.framesCount;
        if (i >= i2) {
            i = i2 - 1;
        }
        if (i < 0) {
            i = 0;
        }
        int i3 = this.frameIndex;
        if (i3 != i) {
            if (i3 > i) {
                this.reverse = true;
            } else {
                this.reverse = false;
            }
            this.playingTo = i;
            this.paused = false;
        }
    }

    public void setCurrFrame(int i) {
        this.frameIndex = i;
        this.playingTo = -1;
        int i2 = this.frameIndex;
        int i3 = this.framesCount;
        if (i2 >= i3) {
            this.frameIndex = i3 - 1;
        }
        if (this.frameIndex < 0) {
            this.frameIndex = 0;
        }
    }

    private int getFrameNumberFromName(String str) {
        String str2 = BuildConfig.FLAVOR;
        for (int i = 0; Character.isDigit(str.charAt(i)); i++) {
            str2 = str2 + str.charAt(i);
        }
        return Integer.parseInt(str2);
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

    public void setNormalSpeed(float f) {
        this.normalSpeed = f;
    }

    public int getCurrentFrameIndex() {
        return this.frameIndex;
    }

    public void setCompletionListener(AnimationCompleteListener animationCompleteListener2) {
        this.animationCompleteListener = animationCompleteListener2;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public CustomVariables getCustomVariables() {
        return this.customVariables;
    }

    public Map<String, Animation> getAnimations() {
        return this.animations;
    }

    public static class Animation {
        public int endFrame;
        public String name;
        public int startFrame;

        public Animation(int i, int i2, String str) {
            this.startFrame = i;
            this.endFrame = i2;
            this.name = str;
        }

        public Animation() {
        }

        public static String constructJsonString(Map<String, Animation> map) {
            Json json = new Json();
            json.setOutputType(JsonWriter.OutputType.json);
            return json.toJson(map);
        }

        public static Map<String, Animation> constructJsonObject(String str) {
            if (str.isEmpty()) {
                return new HashMap();
            }
            return (Map) new Json().fromJson(HashMap.class, str);
        }
    }
}
