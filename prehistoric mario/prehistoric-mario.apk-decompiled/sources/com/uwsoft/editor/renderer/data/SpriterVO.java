package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class SpriterVO extends MainItemVO {
    public int animation;
    public String animationName = BuildConfig.FLAVOR;
    public int entity;
    public float scale = 1.0f;

    public SpriterVO() {
    }

    public SpriterVO(SpriterVO spriterVO) {
        super(spriterVO);
        this.entity = spriterVO.entity;
        this.animation = spriterVO.animation;
        this.animationName = spriterVO.animationName;
        this.scale = spriterVO.scale;
    }
}
