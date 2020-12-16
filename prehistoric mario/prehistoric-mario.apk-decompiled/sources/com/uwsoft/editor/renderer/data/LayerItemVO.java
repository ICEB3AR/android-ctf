package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class LayerItemVO {
    public boolean isLocked = false;
    public boolean isVisible = true;
    public String layerName = BuildConfig.FLAVOR;

    public LayerItemVO() {
    }

    public LayerItemVO(String str) {
        this.layerName = new String(str);
    }

    public LayerItemVO(LayerItemVO layerItemVO) {
        this.layerName = new String(layerItemVO.layerName);
        this.isLocked = layerItemVO.isLocked;
        this.isVisible = layerItemVO.isVisible;
    }
}
