package com.uwsoft.editor.renderer.resources;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.ParticleEffect;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.g2d.freetype.FreeTypeFontGenerator;
import com.badlogic.gdx.utils.Json;
import com.uwsoft.editor.renderer.data.CompositeItemVO;
import com.uwsoft.editor.renderer.data.CompositeVO;
import com.uwsoft.editor.renderer.data.ProjectInfoVO;
import com.uwsoft.editor.renderer.data.ResolutionEntryVO;
import com.uwsoft.editor.renderer.data.SceneVO;
import com.uwsoft.editor.renderer.utils.MySkin;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

public class ResourceManager implements IResourceLoader, IResourceRetriever {
    protected HashMap<FontSizePair, BitmapFont> bitmapFonts = new HashMap<>();
    public String fontsPath = "freetypefonts";
    protected HashSet<FontSizePair> fontsToLoad = new HashSet<>();
    protected HashMap<String, SceneVO> loadedSceneVOs = new HashMap<>();
    protected TextureAtlas mainPack;
    public String packResolutionName = "orig";
    protected HashSet<String> particleEffectNamesToLoad = new HashSet<>();
    protected HashMap<String, ParticleEffect> particleEffects = new HashMap<>();
    public String particleEffectsPath = "particles";
    protected ArrayList<String> preparedSceneNames = new ArrayList<>();
    protected ProjectInfoVO projectVO;
    protected float resMultiplier;
    public String scenesPath = "scenes";
    protected HashMap<String, TextureAtlas> skeletonAtlases = new HashMap<>();
    protected HashMap<String, FileHandle> skeletonJSON = new HashMap<>();
    protected HashSet<String> spineAnimNamesToLoad = new HashSet<>();
    public String spineAnimationsPath = "spine_animations";
    protected HashSet<String> spriteAnimNamesToLoad = new HashSet<>();
    protected HashMap<String, TextureAtlas> spriteAnimations = new HashMap<>();
    public String spriteAnimationsPath = "sprite_animations";
    protected HashSet<String> spriterAnimNamesToLoad = new HashSet<>();
    protected HashMap<String, FileHandle> spriterAnimations = new HashMap<>();
    public String spriterAnimationsPath = "spriter_animations";

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public MySkin getSkin() {
        return null;
    }

    public void setWorkingResolution(String str) {
        this.packResolutionName = str;
    }

    public void initAllResources() {
        loadProjectVO();
        for (int i = 0; i < this.projectVO.scenes.size(); i++) {
            loadSceneVO(this.projectVO.scenes.get(i).sceneName);
            scheduleScene(this.projectVO.scenes.get(i).sceneName);
        }
        prepareAssetsToLoad();
        loadAssets();
    }

    public void initScene(String str) {
        loadSceneVO(str);
        scheduleScene(str);
        prepareAssetsToLoad();
        loadAssets();
    }

    public void unLoadScene(String str) {
        unScheduleScene(str);
        this.loadedSceneVOs.remove(str);
        loadAssets();
    }

    public void scheduleScene(String str) {
        if (this.loadedSceneVOs.containsKey(str)) {
            this.preparedSceneNames.add(str);
        }
    }

    public void unScheduleScene(String str) {
        this.preparedSceneNames.remove(str);
    }

    public void prepareAssetsToLoad() {
        this.particleEffectNamesToLoad.clear();
        this.spineAnimNamesToLoad.clear();
        this.spriteAnimNamesToLoad.clear();
        this.spriterAnimNamesToLoad.clear();
        this.fontsToLoad.clear();
        Iterator<String> it = this.preparedSceneNames.iterator();
        while (it.hasNext()) {
            String next = it.next();
            CompositeVO compositeVO = this.loadedSceneVOs.get(next).composite;
            if (compositeVO != null) {
                String[] recursiveParticleEffectsList = compositeVO.getRecursiveParticleEffectsList();
                String[] recursiveSpineAnimationList = compositeVO.getRecursiveSpineAnimationList();
                String[] recursiveSpriteAnimationList = compositeVO.getRecursiveSpriteAnimationList();
                String[] recursiveSpriterAnimationList = compositeVO.getRecursiveSpriterAnimationList();
                FontSizePair[] recursiveFontList = compositeVO.getRecursiveFontList();
                for (CompositeItemVO compositeItemVO : this.loadedSceneVOs.get(next).libraryItems.values()) {
                    Collections.addAll(this.fontsToLoad, compositeItemVO.composite.getRecursiveFontList());
                    Collections.addAll(this.particleEffectNamesToLoad, compositeItemVO.composite.getRecursiveParticleEffectsList());
                }
                Collections.addAll(this.particleEffectNamesToLoad, recursiveParticleEffectsList);
                Collections.addAll(this.spineAnimNamesToLoad, recursiveSpineAnimationList);
                Collections.addAll(this.spriteAnimNamesToLoad, recursiveSpriteAnimationList);
                Collections.addAll(this.spriterAnimNamesToLoad, recursiveSpriterAnimationList);
                Collections.addAll(this.fontsToLoad, recursiveFontList);
            }
        }
    }

    public void loadAssets() {
        loadAtlasPack();
        loadParticleEffects();
        loadSpineAnimations();
        loadSpriteAnimations();
        loadSpriterAnimations();
        loadFonts();
    }

    @Override // com.uwsoft.editor.renderer.resources.IAssetLoader
    public void loadAtlasPack() {
        Files files = Gdx.files;
        FileHandle internal = files.internal(this.packResolutionName + File.separator + "pack.atlas");
        if (internal.exists()) {
            this.mainPack = new TextureAtlas(internal);
        }
    }

    @Override // com.uwsoft.editor.renderer.resources.IAssetLoader
    public void loadParticleEffects() {
        for (String str : this.particleEffects.keySet()) {
            if (!this.particleEffectNamesToLoad.contains(str)) {
                this.particleEffects.remove(str);
            }
        }
        Iterator<String> it = this.particleEffectNamesToLoad.iterator();
        while (it.hasNext()) {
            String next = it.next();
            ParticleEffect particleEffect = new ParticleEffect();
            Files files = Gdx.files;
            particleEffect.load(files.internal(this.particleEffectsPath + File.separator + next), this.mainPack, BuildConfig.FLAVOR);
            this.particleEffects.put(next, particleEffect);
        }
    }

    @Override // com.uwsoft.editor.renderer.resources.IAssetLoader
    public void loadSpriteAnimations() {
        for (String str : this.spriteAnimations.keySet()) {
            if (!this.spriteAnimNamesToLoad.contains(str)) {
                this.spriteAnimations.remove(str);
            }
        }
        Iterator<String> it = this.spriteAnimNamesToLoad.iterator();
        while (it.hasNext()) {
            String next = it.next();
            Files files = Gdx.files;
            this.spriteAnimations.put(next, new TextureAtlas(files.internal(this.packResolutionName + File.separator + this.spriteAnimationsPath + File.separator + next + File.separator + next + ".atlas")));
        }
    }

    @Override // com.uwsoft.editor.renderer.resources.IAssetLoader
    public void loadSpriterAnimations() {
        for (String str : this.spriterAnimations.keySet()) {
            if (!this.spriterAnimNamesToLoad.contains(str)) {
                this.spriterAnimations.remove(str);
            }
        }
        Iterator<String> it = this.spriterAnimNamesToLoad.iterator();
        while (it.hasNext()) {
            String next = it.next();
            Files files = Gdx.files;
            this.spriterAnimations.put(next, files.internal("orig" + File.separator + this.spriterAnimationsPath + File.separator + next + File.separator + next + ".scml"));
        }
    }

    public void loadSpineAnimation(String str) {
        Files files = Gdx.files;
        this.skeletonAtlases.put(str, new TextureAtlas(files.internal(this.packResolutionName + File.separator + this.spineAnimationsPath + File.separator + str + File.separator + str + ".atlas")));
        HashMap<String, FileHandle> hashMap = this.skeletonJSON;
        Files files2 = Gdx.files;
        hashMap.put(str, files2.internal("orig" + File.separator + this.spineAnimationsPath + File.separator + str + File.separator + str + ".json"));
    }

    @Override // com.uwsoft.editor.renderer.resources.IAssetLoader
    public void loadSpineAnimations() {
        Iterator<Map.Entry<String, TextureAtlas>> it = this.skeletonAtlases.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, TextureAtlas> next = it.next();
            if (this.spineAnimNamesToLoad.contains(next.getKey())) {
                this.spineAnimNamesToLoad.remove(next.getKey());
            } else {
                it.remove();
                this.skeletonJSON.remove(next.getKey());
            }
        }
        Iterator<String> it2 = this.spineAnimNamesToLoad.iterator();
        while (it2.hasNext()) {
            loadSpineAnimation(it2.next());
        }
    }

    @Override // com.uwsoft.editor.renderer.resources.IAssetLoader
    public void loadFonts() {
        ResolutionEntryVO resolution = getProjectVO().getResolution(this.packResolutionName);
        this.resMultiplier = 1.0f;
        if (!this.packResolutionName.equals("orig")) {
            if (resolution.base == 0) {
                this.resMultiplier = ((float) resolution.width) / ((float) getProjectVO().originalResolution.width);
            } else {
                this.resMultiplier = ((float) resolution.height) / ((float) getProjectVO().originalResolution.height);
            }
        }
        for (FontSizePair fontSizePair : this.bitmapFonts.keySet()) {
            if (!this.fontsToLoad.contains(fontSizePair)) {
                this.bitmapFonts.remove(fontSizePair);
            }
        }
        Iterator<FontSizePair> it = this.fontsToLoad.iterator();
        while (it.hasNext()) {
            loadFont(it.next());
        }
    }

    public void loadFont(FontSizePair fontSizePair) {
        Files files = Gdx.files;
        FreeTypeFontGenerator freeTypeFontGenerator = new FreeTypeFontGenerator(files.internal(this.fontsPath + File.separator + fontSizePair.fontName + ".ttf"));
        FreeTypeFontGenerator.FreeTypeFontParameter freeTypeFontParameter = new FreeTypeFontGenerator.FreeTypeFontParameter();
        freeTypeFontParameter.size = Math.round(((float) fontSizePair.fontSize) * this.resMultiplier);
        this.bitmapFonts.put(fontSizePair, freeTypeFontGenerator.generateFont(freeTypeFontParameter));
    }

    @Override // com.uwsoft.editor.renderer.resources.IDataLoader
    public SceneVO loadSceneVO(String str) {
        Files files = Gdx.files;
        SceneVO sceneVO = (SceneVO) new Json().fromJson(SceneVO.class, files.internal(this.scenesPath + File.separator + str + ".dt").readString());
        this.loadedSceneVOs.put(str, sceneVO);
        return sceneVO;
    }

    public void unLoadSceneVO(String str) {
        this.loadedSceneVOs.remove(str);
    }

    @Override // com.uwsoft.editor.renderer.resources.IDataLoader
    public ProjectInfoVO loadProjectVO() {
        this.projectVO = (ProjectInfoVO) new Json().fromJson(ProjectInfoVO.class, Gdx.files.internal("project.dt").readString());
        return this.projectVO;
    }

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public TextureRegion getTextureRegion(String str) {
        return this.mainPack.findRegion(str);
    }

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public ParticleEffect getParticleEffect(String str) {
        return new ParticleEffect(this.particleEffects.get(str));
    }

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public TextureAtlas getSkeletonAtlas(String str) {
        return this.skeletonAtlases.get(str);
    }

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public FileHandle getSkeletonJSON(String str) {
        return this.skeletonJSON.get(str);
    }

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public TextureAtlas getSpriteAnimation(String str) {
        return this.spriteAnimations.get(str);
    }

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public BitmapFont getBitmapFont(String str, int i) {
        return this.bitmapFonts.get(new FontSizePair(str, i));
    }

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public SceneVO getSceneVO(String str) {
        return this.loadedSceneVOs.get(str);
    }

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public ProjectInfoVO getProjectVO() {
        return this.projectVO;
    }

    public void dispose() {
        this.mainPack.dispose();
    }

    @Override // com.uwsoft.editor.renderer.resources.IResourceRetriever
    public FileHandle getSCMLFile(String str) {
        return this.spriterAnimations.get(str);
    }
}
