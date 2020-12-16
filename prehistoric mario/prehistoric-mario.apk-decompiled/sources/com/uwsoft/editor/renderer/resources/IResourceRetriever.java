package com.uwsoft.editor.renderer.resources;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.ParticleEffect;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.uwsoft.editor.renderer.data.ProjectInfoVO;
import com.uwsoft.editor.renderer.data.SceneVO;
import com.uwsoft.editor.renderer.utils.MySkin;

public interface IResourceRetriever {
    BitmapFont getBitmapFont(String str, int i);

    ParticleEffect getParticleEffect(String str);

    ProjectInfoVO getProjectVO();

    FileHandle getSCMLFile(String str);

    SceneVO getSceneVO(String str);

    TextureAtlas getSkeletonAtlas(String str);

    FileHandle getSkeletonJSON(String str);

    MySkin getSkin();

    TextureAtlas getSpriteAnimation(String str);

    TextureRegion getTextureRegion(String str);
}
