package com.uwsoft.editor.renderer.data;

public class Image9patchVO extends SimpleImageVO {
    public float height = 0.0f;
    public float width = 0.0f;

    public Image9patchVO() {
    }

    public Image9patchVO(Image9patchVO image9patchVO) {
        super(image9patchVO);
        this.width = image9patchVO.width;
        this.height = image9patchVO.height;
    }
}
