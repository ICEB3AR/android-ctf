package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class SpineVO extends MainItemVO {
    public String animationName = BuildConfig.FLAVOR;
    public String currentAnimationName = BuildConfig.FLAVOR;

    public SpineVO() {
    }

    public SpineVO(SpineVO spineVO) {
        super(spineVO);
        this.animationName = spineVO.animationName;
        this.currentAnimationName = spineVO.currentAnimationName;
    }
}
