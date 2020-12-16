package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.utils.Array;
import java.util.Iterator;

public abstract class BaseShaderProvider implements ShaderProvider {

    /* renamed from: shaders  reason: collision with root package name */
    protected Array<Shader> f0shaders = new Array<>();

    /* access modifiers changed from: protected */
    public abstract Shader createShader(Renderable renderable);

    @Override // com.badlogic.gdx.graphics.g3d.utils.ShaderProvider
    public Shader getShader(Renderable renderable) {
        Shader shader = renderable.shader;
        if (shader != null && shader.canRender(renderable)) {
            return shader;
        }
        Iterator<Shader> it = this.f0shaders.iterator();
        while (it.hasNext()) {
            Shader next = it.next();
            if (next.canRender(renderable)) {
                return next;
            }
        }
        Shader createShader = createShader(renderable);
        createShader.init();
        this.f0shaders.add(createShader);
        return createShader;
    }

    @Override // com.badlogic.gdx.graphics.g3d.utils.ShaderProvider
    public void dispose() {
        Iterator<Shader> it = this.f0shaders.iterator();
        while (it.hasNext()) {
            it.next().dispose();
        }
        this.f0shaders.clear();
    }
}
