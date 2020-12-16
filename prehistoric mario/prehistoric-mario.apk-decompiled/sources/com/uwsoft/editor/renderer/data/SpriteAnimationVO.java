package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class SpriteAnimationVO extends MainItemVO {
    public String animationName = BuildConfig.FLAVOR;
    public String animations = BuildConfig.FLAVOR;
    public int fps = 24;

    public SpriteAnimationVO() {
    }

    public SpriteAnimationVO(SpriteAnimationVO spriteAnimationVO) {
        super(spriteAnimationVO);
        this.animationName = spriteAnimationVO.animationName;
        this.fps = spriteAnimationVO.fps;
        this.animations = spriteAnimationVO.animations;
    }
}
