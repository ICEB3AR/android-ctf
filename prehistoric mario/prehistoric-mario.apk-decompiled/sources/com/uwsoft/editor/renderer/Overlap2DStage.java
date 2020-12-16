package com.uwsoft.editor.renderer;

import box2dLight.RayHandler;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.physics.box2d.World;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.utils.viewport.Viewport;
import com.uwsoft.editor.renderer.data.Essentials;
import com.uwsoft.editor.renderer.data.SceneVO;
import com.uwsoft.editor.renderer.physics.PhysicsBodyLoader;
import com.uwsoft.editor.renderer.resources.ResourceManager;
import com.uwsoft.editor.renderer.spine.SpineReflectionHelper;

public class Overlap2DStage extends Stage {
    public Essentials essentials;
    public boolean physiscStopped = false;
    public SceneLoader sceneLoader;
    private float timeAcc = 0.0f;

    public Overlap2DStage() {
        initStage();
    }

    public Overlap2DStage(Viewport viewport) {
        super(viewport);
        initStage();
    }

    /* access modifiers changed from: protected */
    public void initStage() {
        this.essentials = new Essentials();
        SpineReflectionHelper spineReflectionHelper = new SpineReflectionHelper();
        if (spineReflectionHelper.isSpineAviable) {
            this.essentials.spineReflectionHelper = spineReflectionHelper;
        }
        initLightsConfiguration();
    }

    public void loadScene(String str) {
        this.sceneLoader.loadScene(str);
        setAmbienceInfo(this.sceneLoader.getSceneVO());
        addActor(this.sceneLoader.getRoot());
    }

    public void initSceneLoader() {
        ResourceManager resourceManager = new ResourceManager();
        resourceManager.initAllResources();
        this.sceneLoader = new SceneLoader(this.essentials);
        this.essentials.rayHandler.setWorld(this.essentials.world);
        this.essentials.rm = resourceManager;
    }

    public void initSceneLoader(ResourceManager resourceManager) {
        this.sceneLoader = new SceneLoader(this.essentials);
        this.essentials.rayHandler.setWorld(this.essentials.world);
        this.essentials.rm = resourceManager;
    }

    /* access modifiers changed from: protected */
    public void initLightsConfiguration() {
        RayHandler.setGammaCorrection(true);
        RayHandler.useDiffuseLight(true);
        RayHandler rayHandler = new RayHandler(null);
        rayHandler.setAmbientLight(1.0f, 1.0f, 1.0f, 1.0f);
        rayHandler.setCulling(true);
        rayHandler.setBlur(true);
        rayHandler.setBlurNum(3);
        rayHandler.setShadows(true);
        rayHandler.setCombinedMatrix((OrthographicCamera) getCamera());
        this.essentials.rayHandler = rayHandler;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Stage
    public void act(float f) {
        float f2;
        if (this.essentials.world != null && !this.physiscStopped) {
            while (true) {
                f2 = this.timeAcc;
                if (f2 >= f) {
                    break;
                }
                this.timeAcc = f2 + 0.016666668f;
                this.essentials.world.step(0.016666668f, 10, 10);
            }
            this.timeAcc = f2 - f;
        }
        if (this.essentials.rayHandler != null) {
            OrthographicCamera orthographicCamera = (OrthographicCamera) getCamera();
            this.essentials.rayHandler.setCombinedMatrix(orthographicCamera.combined.scl(1.0f / PhysicsBodyLoader.SCALE), orthographicCamera.position.x, orthographicCamera.position.y, orthographicCamera.zoom * orthographicCamera.viewportWidth, orthographicCamera.viewportHeight * orthographicCamera.zoom);
        }
        super.act(f);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Stage
    public void draw() {
        super.draw();
        if (this.essentials.rayHandler != null) {
            this.essentials.rayHandler.updateAndRender();
        }
    }

    public void setAmbienceInfo(SceneVO sceneVO) {
        this.essentials.rayHandler.setAmbientLight(new Color(sceneVO.ambientColor[0], sceneVO.ambientColor[1], sceneVO.ambientColor[2], sceneVO.ambientColor[3]));
    }

    public World getWorld() {
        return this.essentials.world;
    }
}
