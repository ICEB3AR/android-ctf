package com.uwsoft.editor.renderer.actor;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.Group;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.ScissorStack;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import com.uwsoft.editor.renderer.data.CompositeItemVO;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.Image9patchVO;
import com.uwsoft.editor.renderer.data.LayerItemVO;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.data.PhysicsBodyDataVO;
import com.uwsoft.editor.renderer.data.ResolutionEntryVO;
import com.uwsoft.editor.renderer.data.SimpleImageVO;
import com.uwsoft.editor.renderer.physics.PhysicsBodyLoader;
import com.uwsoft.editor.renderer.script.IScript;
import com.uwsoft.editor.renderer.utils.CustomVariables;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;

public class CompositeItem extends Group implements IBaseItem {
    private Comparator<IBaseItem> ZIndexComparator;
    private Body body;
    private CustomVariables customVariables;
    public CompositeItemVO dataVO;
    public Essentials essentials;
    private boolean isLockedByLayer;
    private HashMap<String, IBaseItem> itemIdMap;
    private HashMap<String, ArrayList<IBaseItem>> itemLayerMap;
    private ArrayList<IBaseItem> items;
    protected int layerIndex;
    private HashMap<String, LayerItemVO> layerMap;
    public float mulX;
    public float mulY;
    private CompositeItem parentItem;
    private Rectangle scissorBounds;
    private ArrayList<IScript> scripts;

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public boolean isComposite() {
        return true;
    }

    public CompositeItem(CompositeItemVO compositeItemVO, Essentials essentials2, CompositeItem compositeItem) {
        this(compositeItemVO, essentials2);
        setParentItem(compositeItem);
    }

    public CompositeItem(CompositeItemVO compositeItemVO, Essentials essentials2) {
        this.mulX = 1.0f;
        this.mulY = 1.0f;
        this.layerIndex = 0;
        this.items = new ArrayList<>();
        this.itemIdMap = new HashMap<>();
        this.layerMap = new HashMap<>();
        this.itemLayerMap = new HashMap<>();
        this.isLockedByLayer = false;
        this.parentItem = null;
        this.customVariables = new CustomVariables();
        this.ZIndexComparator = new Comparator<IBaseItem>() {
            /* class com.uwsoft.editor.renderer.actor.CompositeItem.AnonymousClass1 */

            public int compare(IBaseItem iBaseItem, IBaseItem iBaseItem2) {
                int i;
                int i2;
                if (iBaseItem.getLayerIndex() == iBaseItem2.getLayerIndex()) {
                    i2 = iBaseItem.getDataVO().zIndex;
                    i = iBaseItem2.getDataVO().zIndex;
                } else {
                    i2 = iBaseItem.getLayerIndex();
                    i = iBaseItem2.getLayerIndex();
                }
                return i2 - i;
            }
        };
        this.scripts = new ArrayList<>(3);
        this.essentials = essentials2;
        this.dataVO = compositeItemVO;
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
        this.dataVO = compositeItemVO;
        reAssemble();
    }

    public void setTint(Color color) {
        getDataVO().tint = new float[]{color.r, color.g, color.b, color.a};
        setColor(color);
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public CompositeItem getParentItem() {
        return this.parentItem;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void setParentItem(CompositeItem compositeItem) {
        this.parentItem = compositeItem;
    }

    public void addScript(IScript iScript) {
        this.scripts.add(iScript);
        iScript.init(this);
    }

    public void addScript(ArrayList<IScript> arrayList) {
        this.scripts.addAll(arrayList);
        Iterator<IScript> it = arrayList.iterator();
        while (it.hasNext()) {
            it.next().init(this);
        }
    }

    public void addScriptTo(String str, ArrayList<IScript> arrayList) {
        Iterator<IBaseItem> it = this.items.iterator();
        while (it.hasNext()) {
            IBaseItem next = it.next();
            if (next instanceof CompositeItem) {
                if (next.getDataVO().itemName.equals(str)) {
                    ((CompositeItem) next).addScript(arrayList);
                }
                ((CompositeItem) next).addScriptTo(str, arrayList);
            }
        }
    }

    public void addScriptTo(String str, IScript iScript) {
        Iterator<IBaseItem> it = this.items.iterator();
        while (it.hasNext()) {
            IBaseItem next = it.next();
            if (next instanceof CompositeItem) {
                if (next.getDataVO().itemName.equals(str)) {
                    ((CompositeItem) next).addScript(iScript);
                }
                ((CompositeItem) next).addScriptTo(str, iScript);
            }
        }
    }

    public void addScriptTo(String str, Class<? extends IScript> cls) {
        Iterator<IBaseItem> it = this.items.iterator();
        while (it.hasNext()) {
            IBaseItem next = it.next();
            if (next instanceof CompositeItem) {
                if (next.getDataVO().itemName.equals(str)) {
                    IScript iScript = null;
                    try {
                        iScript = (IScript) ClassReflection.newInstance(cls);
                    } catch (ReflectionException e) {
                        e.printStackTrace();
                    }
                    if (iScript != null) {
                        ((CompositeItem) next).addScript(iScript);
                    }
                }
                ((CompositeItem) next).addScriptTo(str, cls);
            }
        }
    }

    public void removeScript(IScript iScript) {
        this.scripts.remove(iScript);
        iScript.dispose();
    }

    public void removeScript(ArrayList<IScript> arrayList) {
        this.scripts.removeAll(arrayList);
        Iterator<IScript> it = arrayList.iterator();
        while (it.hasNext()) {
            it.next().dispose();
        }
    }

    public void removeScript(String str, ArrayList<IScript> arrayList) {
        Iterator<IBaseItem> it = this.items.iterator();
        while (it.hasNext()) {
            IBaseItem next = it.next();
            if (next instanceof CompositeItem) {
                if (next.getDataVO().itemName.equals(str)) {
                    ((CompositeItem) next).removeScript(arrayList);
                }
                ((CompositeItem) next).removeScript(str, arrayList);
            }
        }
    }

    private void reAssemble() {
        clear();
        if (this.items != null) {
            for (int i = 0; i < this.items.size(); i++) {
                this.items.get(i).dispose();
            }
        }
        this.items.clear();
        this.itemIdMap.clear();
        this.itemLayerMap.clear();
        for (int i2 = 0; i2 < this.dataVO.composite.sImages.size(); i2++) {
            SimpleImageVO simpleImageVO = this.dataVO.composite.sImages.get(i2);
            ImageItem imageItem = new ImageItem(simpleImageVO, this.essentials, this);
            inventorize(imageItem);
            addActor(imageItem);
            imageItem.setZIndex(simpleImageVO.zIndex);
        }
        for (int i3 = 0; i3 < this.dataVO.composite.sImage9patchs.size(); i3++) {
            Image9patchVO image9patchVO = this.dataVO.composite.sImage9patchs.get(i3);
            Image9patchItem image9patchItem = new Image9patchItem(image9patchVO, this.essentials, this);
            inventorize(image9patchItem);
            addActor(image9patchItem);
            image9patchItem.setZIndex(image9patchVO.zIndex);
        }
        for (int i4 = 0; i4 < this.dataVO.composite.sTextBox.size(); i4++) {
            TextBoxItem textBoxItem = new TextBoxItem(this.dataVO.composite.sTextBox.get(i4), this.essentials, this);
            inventorize(textBoxItem);
            addActor(textBoxItem);
            textBoxItem.setZIndex(textBoxItem.dataVO.zIndex);
        }
        for (int i5 = 0; i5 < this.dataVO.composite.sButtons.size(); i5++) {
            TextButtonItem textButtonItem = new TextButtonItem(this.dataVO.composite.sButtons.get(i5), this.essentials, this);
            inventorize(textButtonItem);
            addActor(textButtonItem);
            textButtonItem.setZIndex(textButtonItem.dataVO.zIndex);
        }
        for (int i6 = 0; i6 < this.dataVO.composite.sLabels.size(); i6++) {
            LabelItem labelItem = new LabelItem(this.dataVO.composite.sLabels.get(i6), this.essentials, this);
            inventorize(labelItem);
            addActor(labelItem);
            labelItem.setZIndex(labelItem.dataVO.zIndex);
        }
        for (int i7 = 0; i7 < this.dataVO.composite.sCheckBoxes.size(); i7++) {
            CheckBoxItem checkBoxItem = new CheckBoxItem(this.dataVO.composite.sCheckBoxes.get(i7), this.essentials, this);
            inventorize(checkBoxItem);
            addActor(checkBoxItem);
            checkBoxItem.setZIndex(checkBoxItem.dataVO.zIndex);
        }
        for (int i8 = 0; i8 < this.dataVO.composite.sSelectBoxes.size(); i8++) {
            SelectBoxItem selectBoxItem = new SelectBoxItem(this.dataVO.composite.sSelectBoxes.get(i8), this.essentials, this);
            inventorize(selectBoxItem);
            addActor(selectBoxItem);
            selectBoxItem.setZIndex(selectBoxItem.dataVO.zIndex);
        }
        for (int i9 = 0; i9 < this.dataVO.composite.sComposites.size(); i9++) {
            CompositeItem compositeItem = new CompositeItem(this.dataVO.composite.sComposites.get(i9), this.essentials, this);
            inventorize(compositeItem);
            addActor(compositeItem);
            compositeItem.setZIndex(compositeItem.dataVO.zIndex);
        }
        for (int i10 = 0; i10 < this.dataVO.composite.sParticleEffects.size(); i10++) {
            ParticleItem particleItem = new ParticleItem(this.dataVO.composite.sParticleEffects.get(i10), this.essentials, this);
            inventorize(particleItem);
            addActor(particleItem);
            particleItem.setZIndex(particleItem.dataVO.zIndex);
        }
        if (this.essentials.rayHandler != null) {
            for (int i11 = 0; i11 < this.dataVO.composite.sLights.size(); i11++) {
                LightActor lightActor = new LightActor(this.dataVO.composite.sLights.get(i11), this.essentials, this);
                inventorize(lightActor);
                addActor(lightActor);
            }
        }
        if (this.essentials.spineReflectionHelper != null) {
            for (int i12 = 0; i12 < this.dataVO.composite.sSpineAnimations.size(); i12++) {
                SpineActor spineActor = new SpineActor(this.dataVO.composite.sSpineAnimations.get(i12), this.essentials, this);
                inventorize(spineActor);
                addActor(spineActor);
                spineActor.setZIndex(spineActor.dataVO.zIndex);
            }
        }
        for (int i13 = 0; i13 < this.dataVO.composite.sSpriteAnimations.size(); i13++) {
            SpriteAnimation spriteAnimation = new SpriteAnimation(this.dataVO.composite.sSpriteAnimations.get(i13), this.essentials, this);
            inventorize(spriteAnimation);
            spriteAnimation.start();
            addActor(spriteAnimation);
            spriteAnimation.setZIndex(spriteAnimation.dataVO.zIndex);
        }
        for (int i14 = 0; i14 < this.dataVO.composite.sSpriterAnimations.size(); i14++) {
            SpriterActor spriterActor = new SpriterActor(this.dataVO.composite.sSpriterAnimations.get(i14), this.essentials, this);
            inventorize(spriterActor);
            addActor(spriterActor);
            spriterActor.setZIndex(spriterActor.dataVO.zIndex);
        }
        if (this.dataVO.composite.layers.size() == 0) {
            LayerItemVO layerItemVO = new LayerItemVO();
            layerItemVO.layerName = "Default";
            this.dataVO.composite.layers.add(layerItemVO);
        }
        recalculateSize();
        sortZindexes();
        reAssembleLayers();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public void setStage(Stage stage) {
        super.setStage(stage);
        if (stage != null) {
            assemblePhysics();
        }
    }

    private void inventorize(IBaseItem iBaseItem) {
        String str = iBaseItem.getDataVO().itemIdentifier;
        String str2 = iBaseItem.getDataVO().layerName;
        if (str.length() > 0) {
            this.itemIdMap.put(str, iBaseItem);
        }
        if (str2.length() > 0) {
            if (!this.itemLayerMap.containsKey(str2)) {
                this.itemLayerMap.put(str2, new ArrayList<>());
            }
            this.itemLayerMap.get(str2).add(iBaseItem);
        }
        this.items.add(iBaseItem);
    }

    public ArrayList<CompositeItem> findItemsByName(String str) {
        return findItemsByName(str, this, new ArrayList<>());
    }

    private ArrayList<CompositeItem> findItemsByName(String str, CompositeItem compositeItem, ArrayList<CompositeItem> arrayList) {
        for (int i = 0; i < compositeItem.items.size(); i++) {
            if (compositeItem.items.get(i).getClass().getSimpleName().equals("CompositeItem")) {
                CompositeItem compositeItem2 = (CompositeItem) compositeItem.items.get(i);
                if (compositeItem2.dataVO.itemName.equals(str)) {
                    arrayList.add(compositeItem2);
                }
                findItemsByName(str, compositeItem2, arrayList);
            }
        }
        return arrayList;
    }

    public CheckBoxItem getCheckBoxById(String str) {
        return (CheckBoxItem) this.itemIdMap.get(str);
    }

    public CompositeItem getCompositeById(String str) {
        return (CompositeItem) this.itemIdMap.get(str);
    }

    public IBaseItem getItemById(String str) {
        return this.itemIdMap.get(str);
    }

    public ImageItem getImageById(String str) {
        return (ImageItem) this.itemIdMap.get(str);
    }

    public LabelItem getLabelById(String str) {
        return (LabelItem) this.itemIdMap.get(str);
    }

    public ParticleItem getParticleById(String str) {
        return (ParticleItem) this.itemIdMap.get(str);
    }

    public SelectBoxItem getSelectBoxById(String str) {
        return (SelectBoxItem) this.itemIdMap.get(str);
    }

    public TextBoxItem getTextBoxById(String str) {
        return (TextBoxItem) this.itemIdMap.get(str);
    }

    public TextButtonItem getTextButtonById(String str) {
        return (TextButtonItem) this.itemIdMap.get(str);
    }

    public LightActor getLightActorById(String str) {
        return (LightActor) this.itemIdMap.get(str);
    }

    public SpriteAnimation getSpriteAnimationById(String str) {
        return (SpriteAnimation) this.itemIdMap.get(str);
    }

    public SpriterActor getSpriterActorById(String str) {
        return (SpriterActor) this.itemIdMap.get(str);
    }

    public SpineActor getSpineActorById(String str) {
        return (SpineActor) this.itemIdMap.get(str);
    }

    public Image9patchItem getNinePatchById(String str) {
        return (Image9patchItem) this.itemIdMap.get(str);
    }

    public void addItem(IBaseItem iBaseItem) {
        this.dataVO.composite.addItem(iBaseItem.getDataVO());
        iBaseItem.setParentItem(this);
        inventorize(iBaseItem);
        addActor((Actor) iBaseItem);
        iBaseItem.updateDataVO();
        iBaseItem.applyResolution(this.mulX, this.mulY);
        recalculateSize();
        sortZindexes();
        reAssembleLayers();
        if (iBaseItem.getDataVO().physicsBodyData != null && Integer.parseInt(iBaseItem.getDataVO().meshId) >= 0) {
            Vector2 vector2 = new Vector2();
            vector2.set(iBaseItem.getDataVO().x * this.mulX, iBaseItem.getDataVO().y * this.mulY);
            localToStageCoordinates(vector2);
            vector2.scl(PhysicsBodyLoader.SCALE);
            if (iBaseItem.getBody() != null) {
                this.essentials.world.destroyBody(iBaseItem.getBody());
                iBaseItem.setBody(null);
            }
            iBaseItem.setBody(PhysicsBodyLoader.createBody(this.essentials.world, iBaseItem.getDataVO().physicsBodyData, this.essentials.rm.getProjectVO().meshes.get(iBaseItem.getDataVO().meshId), new Vector2(this.mulX, this.mulY)));
            iBaseItem.getBody().setTransform(vector2.x, vector2.y, (float) Math.toRadians((double) iBaseItem.getDataVO().rotation));
        }
    }

    public void loadFromVO(CompositeItemVO compositeItemVO) {
        this.dataVO = compositeItemVO;
        reAssemble();
        recalculateSize();
        sortZindexes();
        reAssembleLayers();
    }

    public ArrayList<IBaseItem> getItems() {
        return this.items;
    }

    public void reAssembleLayers() {
        this.layerMap.clear();
        for (int i = 0; i < this.dataVO.composite.layers.size(); i++) {
            LayerItemVO layerItemVO = this.dataVO.composite.layers.get(i);
            setLayerChildrenVisibilty(layerItemVO.layerName, layerItemVO.isVisible);
            setLayerChildrenLock(layerItemVO.layerName, layerItemVO.isLocked || !layerItemVO.isVisible);
            this.layerMap.put(layerItemVO.layerName, layerItemVO);
        }
    }

    private void assemblePhysics() {
        if (this.essentials.world != null) {
            Vector2 vector2 = new Vector2(this.mulX, this.mulY);
            Iterator<IBaseItem> it = this.items.iterator();
            while (it.hasNext()) {
                IBaseItem next = it.next();
                if (next.getBody() != null) {
                    this.essentials.world.destroyBody(next.getBody());
                    next.setBody(null);
                }
                MainItemVO dataVO2 = next.getDataVO();
                PhysicsBodyDataVO physicsBodyDataVO = dataVO2.physicsBodyData;
                if (!(Integer.parseInt(dataVO2.meshId) < 0 || physicsBodyDataVO == null || this.essentials.rm.getProjectVO().meshes.get(dataVO2.meshId) == null)) {
                    next.setBody(PhysicsBodyLoader.createBody(this.essentials.world, physicsBodyDataVO, this.essentials.rm.getProjectVO().meshes.get(dataVO2.meshId), vector2));
                    next.getBody().setUserData(next);
                }
            }
            positionPhysics();
        }
    }

    public void positionPhysics() {
        Vector2 vector2 = new Vector2();
        Iterator<IBaseItem> it = this.items.iterator();
        while (it.hasNext()) {
            IBaseItem next = it.next();
            if (next.getBody() != null) {
                MainItemVO dataVO2 = next.getDataVO();
                vector2.set(dataVO2.x * this.mulX, dataVO2.y * this.mulY);
                localToStageCoordinates(vector2);
                vector2.scl(PhysicsBodyLoader.SCALE);
                next.getBody().setTransform(vector2.x, vector2.y, (float) Math.toRadians((double) next.getDataVO().rotation));
            }
        }
    }

    public void recalculateSize() {
        float f = 0.0f;
        float f2 = 0.0f;
        float f3 = 0.0f;
        float f4 = 0.0f;
        for (int i = 0; i < this.items.size(); i++) {
            Actor actor = (Actor) this.items.get(i);
            if (i == 0) {
                if (actor.getScaleX() <= 0.0f || actor.getWidth() * actor.getScaleX() <= 0.0f) {
                    f = actor.getX();
                    f3 = actor.getX() + (actor.getWidth() * actor.getScaleX());
                } else {
                    float x = actor.getX();
                    f3 = x;
                    f = actor.getX() + (actor.getWidth() * actor.getScaleX());
                }
                if (actor.getScaleY() <= 0.0f || actor.getHeight() * actor.getScaleY() <= 0.0f) {
                    f2 = actor.getY();
                    f4 = actor.getY() + (actor.getHeight() * actor.getScaleY());
                } else {
                    f4 = actor.getY();
                    f2 = actor.getY() + (actor.getHeight() * actor.getScaleY());
                }
            }
            if (actor.getScaleX() <= 0.0f || actor.getWidth() <= 0.0f) {
                if (f < actor.getX()) {
                    f = actor.getX();
                }
                if (f3 > actor.getX() + (actor.getWidth() * actor.getScaleX())) {
                    f3 = actor.getX() + (actor.getWidth() * actor.getScaleX());
                }
            } else {
                if (f3 > actor.getX()) {
                    f3 = actor.getX();
                }
                if (f < actor.getX() + (actor.getWidth() * actor.getScaleX())) {
                    f = actor.getX() + (actor.getWidth() * actor.getScaleX());
                }
            }
            if (actor.getScaleY() <= 0.0f || actor.getHeight() * actor.getScaleY() <= 0.0f) {
                if (f2 < actor.getY()) {
                    f2 = actor.getY();
                }
                if (f4 > actor.getY() + (actor.getHeight() * actor.getScaleY())) {
                    f4 = actor.getY() + (actor.getHeight() * actor.getScaleY());
                }
            } else {
                if (f4 > actor.getY()) {
                    f4 = actor.getY();
                }
                if (f2 < actor.getY() + (actor.getHeight() * actor.getScaleY())) {
                    f2 = actor.getY() + (actor.getHeight() * actor.getScaleY());
                }
            }
        }
        setWidth(f - 0.0f);
        setHeight(f2 - 0.0f);
    }

    public void sortZindexes() {
        if (this.items != null) {
            for (int i = 0; i < this.items.size(); i++) {
                this.items.get(i).setLayerIndex(getlayerIndexByName(this.items.get(i).getDataVO().layerName));
            }
            Collections.sort(this.items, this.ZIndexComparator);
            for (int i2 = 0; i2 < this.items.size(); i2++) {
                IBaseItem iBaseItem = this.items.get(i2);
                if (iBaseItem.getDataVO().zIndex < 0) {
                    iBaseItem.getDataVO().zIndex = 0;
                }
                ((Actor) iBaseItem).setZIndex(i2);
                iBaseItem.getDataVO().zIndex = i2;
            }
        }
    }

    private int getlayerIndexByName(String str) {
        ArrayList<LayerItemVO> arrayList = this.dataVO.composite.layers;
        for (int i = 0; i < arrayList.size(); i++) {
            if (arrayList.get(i).layerName.equals(str)) {
                return i;
            }
        }
        return 0;
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public CompositeItemVO getDataVO() {
        return this.dataVO;
    }

    public void removeItem(IBaseItem iBaseItem) {
        this.items.remove(iBaseItem);
        this.dataVO.composite.removeItem(iBaseItem.getDataVO());
        iBaseItem.dispose();
    }

    public void applyResolution(String str) {
        ResolutionEntryVO resolution;
        if (str != null && !str.isEmpty() && (resolution = this.essentials.rm.getProjectVO().getResolution(str)) != null) {
            float f = ((float) resolution.width) / ((float) this.essentials.rm.getProjectVO().originalResolution.width);
            applyResolution(f, f);
        }
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public void applyResolution(float f, float f2) {
        this.mulX = f;
        this.mulY = f2;
        for (int i = 0; i < this.items.size(); i++) {
            this.items.get(i).applyResolution(f, f2);
            if (this.items.get(i).getBody() != null) {
                this.essentials.world.destroyBody(this.items.get(i).getBody());
                this.items.get(i).setBody(null);
            }
        }
        if (getBody() != null) {
            this.essentials.world.destroyBody(getBody());
        }
        setBody(null);
        setX(this.dataVO.x * this.mulX);
        setY(this.dataVO.y * this.mulY);
        updateDataVO();
        recalculateSize();
        assemblePhysics();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public void act(float f) {
        for (int i = 0; i < this.scripts.size(); i++) {
            this.scripts.get(i).act(f);
        }
        if (!(this.essentials.world == null || this.body == null || this.dataVO.physicsBodyData == null || this.dataVO.physicsBodyData.bodyType <= 0 || this.essentials.physicsStopped)) {
            setX(this.body.getPosition().x / PhysicsBodyLoader.SCALE);
            setY(this.body.getPosition().y / PhysicsBodyLoader.SCALE);
            setRotation(this.body.getAngle() * 57.295776f);
        }
        super.act(f);
    }

    public void setScissors(float f, float f2, float f3, float f4) {
        CompositeItemVO compositeItemVO = this.dataVO;
        float f5 = this.mulX;
        compositeItemVO.scissorX = f / f5;
        float f6 = this.mulY;
        compositeItemVO.scissorY = f2 / f6;
        compositeItemVO.scissorWidth = f3 / f5;
        compositeItemVO.scissorHeight = f4 / f6;
        this.scissorBounds = new Rectangle(compositeItemVO.scissorX * this.mulX, this.dataVO.scissorY * this.mulY, this.dataVO.scissorWidth * this.mulX, this.dataVO.scissorHeight * this.mulY);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        if (this.dataVO.scissorWidth <= 0.0f || this.dataVO.scissorHeight <= 0.0f) {
            super.draw(batch, f);
            return;
        }
        if (isTransform()) {
            applyTransform(batch, computeTransform());
        }
        Rectangle rectangle = (Rectangle) Pools.obtain(Rectangle.class);
        getStage().calculateScissors(this.scissorBounds, rectangle);
        if (ScissorStack.pushScissors(rectangle)) {
            drawChildren(batch, f);
            ScissorStack.popScissors();
            if (isTransform()) {
                resetTransform(batch);
            }
            Pools.free(rectangle);
        }
    }

    public boolean layerExists(String str) {
        return this.layerMap.containsKey(str);
    }

    public void setLayerVisibilty(String str, boolean z) {
        LayerItemVO layerItemVO = this.layerMap.get(str);
        if (layerItemVO != null) {
            layerItemVO.isVisible = z;
            setLayerChildrenVisibilty(str, z);
        }
    }

    private void setLayerChildrenVisibilty(String str, boolean z) {
        ArrayList<IBaseItem> arrayList = this.itemLayerMap.get(str);
        if (arrayList != null) {
            for (int i = 0; i < arrayList.size(); i++) {
                ((Actor) arrayList.get(i)).setVisible(z);
            }
        }
    }

    public void setLayerLock(String str, boolean z) {
        for (int i = 0; i < this.dataVO.composite.layers.size(); i++) {
            if (this.dataVO.composite.layers.get(i).layerName.equals(str)) {
                this.dataVO.composite.layers.get(i).isLocked = z;
                setLayerChildrenLock(str, z);
            }
        }
    }

    public void setLayerChildrenLock(String str, boolean z) {
        for (int i = 0; i < this.items.size(); i++) {
            IBaseItem iBaseItem = this.items.get(i);
            if (iBaseItem.getDataVO().layerName.equals(str)) {
                iBaseItem.setLockByLayer(z);
                ((Actor) iBaseItem).setTouchable(z ? Touchable.disabled : Touchable.enabled);
            }
        }
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
        this.scissorBounds = new Rectangle(this.dataVO.scissorX * this.mulX, this.dataVO.scissorY * this.mulY, this.dataVO.scissorWidth * this.mulX, this.dataVO.scissorHeight * this.mulY);
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
        for (int i = 0; i < this.items.size(); i++) {
            this.items.get(i).updateDataVO();
        }
        sortZindexes();
        this.dataVO.scaleX = getScaleX();
        this.dataVO.scaleY = getScaleY();
        this.dataVO.customVars = this.customVariables.saveAsString();
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
        for (int i = 0; i < this.items.size(); i++) {
            this.items.get(i).dispose();
        }
    }

    @Override // com.uwsoft.editor.renderer.actor.IBaseItem
    public CustomVariables getCustomVariables() {
        return this.customVariables;
    }

    public <T extends IBaseItem> T getById(String str, Class<T> cls) {
        return cls.cast(this.itemIdMap.get(str));
    }

    public ArrayList<IBaseItem> getItemsByLayerName(String str) {
        return this.itemLayerMap.get(str);
    }
}
