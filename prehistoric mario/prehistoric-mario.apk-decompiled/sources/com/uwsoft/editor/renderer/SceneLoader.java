package com.uwsoft.editor.renderer;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.World;
import com.uwsoft.editor.renderer.actor.CompositeItem;
import com.uwsoft.editor.renderer.actor.IBaseItem;
import com.uwsoft.editor.renderer.data.CompositeItemVO;
import com.uwsoft.editor.renderer.data.CompositeVO;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.PhysicsPropertiesVO;
import com.uwsoft.editor.renderer.data.SceneVO;
import com.uwsoft.editor.renderer.data.SimpleImageVO;
import com.uwsoft.editor.renderer.resources.IResourceRetriever;
import com.uwsoft.editor.renderer.resources.ResourceManager;
import com.uwsoft.editor.renderer.script.IScript;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

public class SceneLoader {
    private String curResolution = "orig";
    public Essentials essentials;
    public CompositeItem sceneActor;
    private SceneVO sceneVO;

    public SceneLoader() {
        ResourceManager resourceManager = new ResourceManager();
        resourceManager.initAllResources();
        Essentials essentials2 = new Essentials();
        essentials2.rm = resourceManager;
        this.essentials = essentials2;
    }

    public SceneLoader(String str) {
        ResourceManager resourceManager = new ResourceManager();
        resourceManager.setWorkingResolution(str);
        resourceManager.initAllResources();
        Essentials essentials2 = new Essentials();
        essentials2.rm = resourceManager;
        this.essentials = essentials2;
        this.curResolution = str;
    }

    public SceneLoader(IResourceRetriever iResourceRetriever) {
        Essentials essentials2 = new Essentials();
        essentials2.rm = iResourceRetriever;
        this.essentials = essentials2;
    }

    public SceneLoader(Essentials essentials2) {
        this.essentials = essentials2;
    }

    public void setResolution(String str) {
        this.curResolution = str;
        CompositeItem compositeItem = this.sceneActor;
        if (compositeItem != null) {
            compositeItem.applyResolution(str);
        }
    }

    public SceneVO getSceneVO() {
        return this.sceneVO;
    }

    public SceneVO loadScene(String str, boolean z) {
        this.sceneVO = this.essentials.rm.getSceneVO(str);
        PhysicsPropertiesVO physicsPropertiesVO = this.sceneVO.physicsPropertiesVO;
        if (this.sceneVO.physicsPropertiesVO != null && this.sceneVO.physicsPropertiesVO.enabled) {
            this.essentials.world = new World(new Vector2(physicsPropertiesVO.gravityX, physicsPropertiesVO.gravityY), true);
            this.essentials.rayHandler.setWorld(this.essentials.world);
        }
        invalidateSceneVO(this.sceneVO);
        if (z) {
            this.sceneActor = getSceneAsActor();
            if (!this.curResolution.equals("orig")) {
                this.sceneActor.applyResolution(this.curResolution);
            }
        }
        setAmbienceInfo(this.sceneVO);
        return this.sceneVO;
    }

    public SceneVO loadScene(String str) {
        return loadScene(str, true);
    }

    public void invalidateSceneVO(SceneVO sceneVO2) {
        removeMissingImages(sceneVO2.composite);
    }

    public void removeMissingImages(CompositeVO compositeVO) {
        if (compositeVO != null) {
            Iterator<SimpleImageVO> it = compositeVO.sImages.iterator();
            while (it.hasNext()) {
                SimpleImageVO next = it.next();
                if (this.essentials.rm.getTextureRegion(next.imageName) == null) {
                    compositeVO.sImages.remove(next);
                }
            }
            Iterator<CompositeItemVO> it2 = compositeVO.sComposites.iterator();
            while (it2.hasNext()) {
                removeMissingImages(it2.next().composite);
            }
        }
    }

    public void setAmbienceInfo(SceneVO sceneVO2) {
        if (this.essentials.rayHandler != null && sceneVO2.ambientColor != null) {
            this.essentials.rayHandler.setAmbientLight(new Color(sceneVO2.ambientColor[0], sceneVO2.ambientColor[1], sceneVO2.ambientColor[2], sceneVO2.ambientColor[3]));
        }
    }

    public CompositeItem getSceneAsActor() {
        CompositeItemVO compositeItemVO = new CompositeItemVO(this.sceneVO.composite);
        if (compositeItemVO.composite == null) {
            compositeItemVO.composite = new CompositeVO();
        }
        return new CompositeItem(compositeItemVO, this.essentials);
    }

    public CompositeItem getLibraryAsActor(String str) {
        CompositeItemVO compositeItemVO = new CompositeItemVO(this.sceneVO.libraryItems.get(str));
        if (compositeItemVO.composite == null) {
            compositeItemVO.composite = new CompositeVO();
        }
        CompositeItem compositeItem = new CompositeItem(compositeItemVO, this.essentials);
        compositeItem.dataVO.itemName = str;
        compositeItem.applyResolution(this.curResolution);
        compositeItem.setX(0.0f);
        compositeItem.setY(0.0f);
        return compositeItem;
    }

    public CompositeItem getCompositeElementById(String str) {
        return getCompositeElement(this.sceneActor.getCompositeById(str).getDataVO());
    }

    public CompositeItem getCompositeElement(CompositeItemVO compositeItemVO) {
        return new CompositeItem(compositeItemVO, this.essentials);
    }

    public void addScriptTo(String str, IScript iScript) {
        this.sceneActor.addScriptTo(str, iScript);
    }

    public void addScriptTo(String str, ArrayList<IScript> arrayList) {
        this.sceneActor.addScriptTo(str, arrayList);
    }

    public IResourceRetriever getRm() {
        return this.essentials.rm;
    }

    public CompositeItem getRoot() {
        return this.sceneActor;
    }

    public void inject(Object obj) {
        Field[] declaredFields = obj.getClass().getDeclaredFields();
        System.out.println(declaredFields.length);
        for (Field field : declaredFields) {
            System.out.println(field.getName());
            if (IBaseItem.class.isAssignableFrom(field.getType())) {
                Class<?> type = field.getType();
                Class<?> type2 = field.getType();
                System.out.println(Arrays.toString(field.getDeclaredAnnotations()));
                if (field.isAnnotationPresent(Overlap2D.class)) {
                    System.out.println("annotation found");
                    IBaseItem byId = getRoot().getById(field.getName(), type);
                    System.out.println(byId);
                    try {
                        field.set(obj, type2.cast(byId));
                    } catch (IllegalAccessException | IllegalArgumentException e) {
                        e.printStackTrace();
                        System.exit(-1);
                    }
                }
            }
        }
    }
}
