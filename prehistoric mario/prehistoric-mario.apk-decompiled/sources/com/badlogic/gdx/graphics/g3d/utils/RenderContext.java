package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;

public class RenderContext {
    private int blendDFactor;
    private int blendSFactor;
    private boolean blending;
    private int cullFace;
    private int depthFunc;
    private boolean depthMask;
    private float depthRangeFar;
    private float depthRangeNear;
    public final TextureBinder textureBinder;

    public RenderContext(TextureBinder textureBinder2) {
        this.textureBinder = textureBinder2;
    }

    public void begin() {
        Gdx.gl.glDisable(GL20.GL_DEPTH_TEST);
        this.depthFunc = 0;
        Gdx.gl.glDepthMask(true);
        this.depthMask = true;
        Gdx.gl.glDisable(GL20.GL_BLEND);
        this.blending = false;
        Gdx.gl.glDisable(GL20.GL_CULL_FACE);
        this.blendDFactor = 0;
        this.blendSFactor = 0;
        this.cullFace = 0;
        this.textureBinder.begin();
    }

    public void end() {
        if (this.depthFunc != 0) {
            Gdx.gl.glDisable(GL20.GL_DEPTH_TEST);
        }
        if (!this.depthMask) {
            Gdx.gl.glDepthMask(true);
        }
        if (this.blending) {
            Gdx.gl.glDisable(GL20.GL_BLEND);
        }
        if (this.cullFace > 0) {
            Gdx.gl.glDisable(GL20.GL_CULL_FACE);
        }
        this.textureBinder.end();
    }

    public void setDepthMask(boolean z) {
        if (this.depthMask != z) {
            GL20 gl20 = Gdx.gl;
            this.depthMask = z;
            gl20.glDepthMask(z);
        }
    }

    public void setDepthTest(int i) {
        setDepthTest(i, 0.0f, 1.0f);
    }

    public void setDepthTest(int i, float f, float f2) {
        boolean z = true;
        boolean z2 = this.depthFunc != 0;
        if (i == 0) {
            z = false;
        }
        if (this.depthFunc != i) {
            this.depthFunc = i;
            if (z) {
                Gdx.gl.glEnable(GL20.GL_DEPTH_TEST);
                Gdx.gl.glDepthFunc(i);
            } else {
                Gdx.gl.glDisable(GL20.GL_DEPTH_TEST);
            }
        }
        if (z) {
            if (!z2 || this.depthFunc != i) {
                GL20 gl20 = Gdx.gl;
                this.depthFunc = i;
                gl20.glDepthFunc(i);
            }
            if (!z2 || this.depthRangeNear != f || this.depthRangeFar != f2) {
                GL20 gl202 = Gdx.gl;
                this.depthRangeNear = f;
                this.depthRangeFar = f2;
                gl202.glDepthRangef(f, f2);
            }
        }
    }

    public void setBlending(boolean z, int i, int i2) {
        if (z != this.blending) {
            this.blending = z;
            if (z) {
                Gdx.gl.glEnable(GL20.GL_BLEND);
            } else {
                Gdx.gl.glDisable(GL20.GL_BLEND);
            }
        }
        if (!z) {
            return;
        }
        if (this.blendSFactor != i || this.blendDFactor != i2) {
            Gdx.gl.glBlendFunc(i, i2);
            this.blendSFactor = i;
            this.blendDFactor = i2;
        }
    }

    public void setCullFace(int i) {
        if (i != this.cullFace) {
            this.cullFace = i;
            if (i == 1028 || i == 1029 || i == 1032) {
                Gdx.gl.glEnable(GL20.GL_CULL_FACE);
                Gdx.gl.glCullFace(i);
                return;
            }
            Gdx.gl.glDisable(GL20.GL_CULL_FACE);
        }
    }
}
