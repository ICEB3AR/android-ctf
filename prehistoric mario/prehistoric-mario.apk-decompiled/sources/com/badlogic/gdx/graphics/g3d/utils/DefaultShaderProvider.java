package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.Shader;
import com.badlogic.gdx.graphics.g3d.shaders.DefaultShader;

public class DefaultShaderProvider extends BaseShaderProvider {
    public final DefaultShader.Config config;

    public DefaultShaderProvider(DefaultShader.Config config2) {
        this.config = config2 == null ? new DefaultShader.Config() : config2;
    }

    public DefaultShaderProvider(String str, String str2) {
        this(new DefaultShader.Config(str, str2));
    }

    public DefaultShaderProvider(FileHandle fileHandle, FileHandle fileHandle2) {
        this(fileHandle.readString(), fileHandle2.readString());
    }

    public DefaultShaderProvider() {
        this(null);
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.graphics.g3d.utils.BaseShaderProvider
    public Shader createShader(Renderable renderable) {
        return new DefaultShader(renderable, this.config);
    }
}
