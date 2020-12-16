package com.uwsoft.editor.renderer.data;

public class LightVO extends MainItemVO {
    public float coneDegree = 30.0f;
    public float directionDegree = 0.0f;
    public float distance = 300.0f;
    public boolean isStatic = true;
    public boolean isXRay = true;
    public int rays = 12;
    public LightType type;

    public enum LightType {
        POINT,
        CONE
    }

    public LightVO() {
        this.tint = new float[4];
        this.tint[0] = 1.0f;
        this.tint[1] = 1.0f;
        this.tint[2] = 1.0f;
        this.tint[3] = 1.0f;
    }

    public LightVO(LightVO lightVO) {
        super(lightVO);
        this.type = lightVO.type;
        this.rays = lightVO.rays;
        this.distance = lightVO.distance;
        this.directionDegree = lightVO.directionDegree;
        this.coneDegree = lightVO.coneDegree;
        this.isStatic = lightVO.isStatic;
        this.isXRay = lightVO.isXRay;
    }
}
