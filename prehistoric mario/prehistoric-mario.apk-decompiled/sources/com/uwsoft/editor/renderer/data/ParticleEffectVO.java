package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class ParticleEffectVO extends MainItemVO {
    public float particleHeight = 100.0f;
    public String particleName = BuildConfig.FLAVOR;
    public float particleWidth = 100.0f;

    public ParticleEffectVO() {
    }

    public ParticleEffectVO(ParticleEffectVO particleEffectVO) {
        super(particleEffectVO);
        this.particleName = new String(particleEffectVO.particleName);
    }
}
