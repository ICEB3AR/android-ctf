package com.uwsoft.editor.renderer.data;

public class CompositeItemVO extends MainItemVO {
    public CompositeVO composite;
    public float scissorHeight;
    public float scissorWidth;
    public float scissorX;
    public float scissorY;

    public CompositeItemVO() {
        this.composite = new CompositeVO();
    }

    public CompositeItemVO(CompositeVO compositeVO) {
        this.composite = new CompositeVO(compositeVO);
    }

    public CompositeItemVO(CompositeItemVO compositeItemVO) {
        super(compositeItemVO);
        this.composite = new CompositeVO(compositeItemVO.composite);
    }

    public void update(CompositeItemVO compositeItemVO) {
        this.composite = new CompositeVO(compositeItemVO.composite);
    }

    public CompositeItemVO clone() {
        CompositeItemVO compositeItemVO = new CompositeItemVO();
        compositeItemVO.composite = this.composite;
        compositeItemVO.isFlipedH = this.isFlipedH;
        compositeItemVO.isFlipedV = this.isFlipedV;
        compositeItemVO.itemName = this.itemName;
        compositeItemVO.layerName = this.layerName;
        compositeItemVO.rotation = this.rotation;
        compositeItemVO.tint = this.tint;
        compositeItemVO.x = this.x;
        compositeItemVO.y = this.y;
        compositeItemVO.zIndex = this.zIndex;
        compositeItemVO.scissorX = this.scissorX;
        compositeItemVO.scissorY = this.scissorY;
        compositeItemVO.scissorWidth = this.scissorWidth;
        compositeItemVO.scissorHeight = this.scissorHeight;
        return compositeItemVO;
    }
}
