package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class SimpleImageVO extends MainItemVO {
    public String imageName = BuildConfig.FLAVOR;

    public SimpleImageVO() {
    }

    public SimpleImageVO(SimpleImageVO simpleImageVO) {
        super(simpleImageVO);
        this.imageName = new String(simpleImageVO.imageName);
    }
}
