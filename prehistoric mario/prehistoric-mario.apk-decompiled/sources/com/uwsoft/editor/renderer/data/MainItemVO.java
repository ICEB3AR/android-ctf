package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;
import java.util.Arrays;

public class MainItemVO {
    public String customVars = BuildConfig.FLAVOR;
    public boolean isFlipedH = false;
    public boolean isFlipedV = false;
    public String itemIdentifier = BuildConfig.FLAVOR;
    public String itemName = BuildConfig.FLAVOR;
    public String layerName = BuildConfig.FLAVOR;
    public String meshId = "-1";
    public PhysicsBodyDataVO physicsBodyData = null;
    public float rotation;
    public float scaleX = 1.0f;
    public float scaleY = 1.0f;
    public String[] tags = null;
    public float[] tint = null;
    public float x;
    public float y;
    public int zIndex = 0;

    public MainItemVO() {
    }

    public MainItemVO(MainItemVO mainItemVO) {
        this.itemIdentifier = new String(mainItemVO.itemIdentifier);
        this.itemName = new String(mainItemVO.itemName);
        if (this.tags != null) {
            String[] strArr = mainItemVO.tags;
            this.tags = (String[]) Arrays.copyOf(strArr, strArr.length);
        }
        this.customVars = new String(mainItemVO.customVars);
        this.x = mainItemVO.x;
        this.y = mainItemVO.y;
        this.rotation = mainItemVO.rotation;
        this.zIndex = mainItemVO.zIndex;
        this.layerName = new String(mainItemVO.layerName);
        float[] fArr = mainItemVO.tint;
        if (fArr != null) {
            this.tint = Arrays.copyOf(fArr, fArr.length);
        }
        this.isFlipedH = mainItemVO.isFlipedH;
        this.isFlipedV = mainItemVO.isFlipedV;
        this.scaleX = mainItemVO.scaleX;
        this.scaleY = mainItemVO.scaleY;
        this.meshId = mainItemVO.meshId;
        PhysicsBodyDataVO physicsBodyDataVO = mainItemVO.physicsBodyData;
        if (physicsBodyDataVO != null) {
            this.physicsBodyData = new PhysicsBodyDataVO(physicsBodyDataVO);
        }
    }
}
