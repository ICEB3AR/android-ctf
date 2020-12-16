package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;

public class ShaderProgramLoader extends AsynchronousAssetLoader<ShaderProgram, ShaderProgramParameter> {
    private String fragmentFileSuffix = ".frag";
    private String vertexFileSuffix = ".vert";

    public static class ShaderProgramParameter extends AssetLoaderParameters<ShaderProgram> {
        public String fragmentFile;
        public boolean logOnCompileFailure = true;
        public String prependFragmentCode;
        public String prependVertexCode;
        public String vertexFile;
    }

    public Array<AssetDescriptor> getDependencies(String str, FileHandle fileHandle, ShaderProgramParameter shaderProgramParameter) {
        return null;
    }

    public void loadAsync(AssetManager assetManager, String str, FileHandle fileHandle, ShaderProgramParameter shaderProgramParameter) {
    }

    public ShaderProgramLoader(FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
    }

    public ShaderProgramLoader(FileHandleResolver fileHandleResolver, String str, String str2) {
        super(fileHandleResolver);
        this.vertexFileSuffix = str;
        this.fragmentFileSuffix = str2;
    }

    public ShaderProgram loadSync(AssetManager assetManager, String str, FileHandle fileHandle, ShaderProgramParameter shaderProgramParameter) {
        String str2;
        FileHandle fileHandle2;
        String str3 = null;
        if (shaderProgramParameter != null) {
            str2 = shaderProgramParameter.vertexFile != null ? shaderProgramParameter.vertexFile : null;
            if (shaderProgramParameter.fragmentFile != null) {
                str3 = shaderProgramParameter.fragmentFile;
            }
        } else {
            str2 = null;
        }
        if (str2 == null && str.endsWith(this.fragmentFileSuffix)) {
            str2 = str.substring(0, str.length() - this.fragmentFileSuffix.length()) + this.vertexFileSuffix;
        }
        if (str3 == null && str.endsWith(this.vertexFileSuffix)) {
            str3 = str.substring(0, str.length() - this.vertexFileSuffix.length()) + this.fragmentFileSuffix;
        }
        if (str2 == null) {
            fileHandle2 = fileHandle;
        } else {
            fileHandle2 = resolve(str2);
        }
        if (str3 != null) {
            fileHandle = resolve(str3);
        }
        String readString = fileHandle2.readString();
        String readString2 = fileHandle2.equals(fileHandle) ? readString : fileHandle.readString();
        if (shaderProgramParameter != null) {
            if (shaderProgramParameter.prependVertexCode != null) {
                readString = shaderProgramParameter.prependVertexCode + readString;
            }
            if (shaderProgramParameter.prependFragmentCode != null) {
                readString2 = shaderProgramParameter.prependFragmentCode + readString2;
            }
        }
        ShaderProgram shaderProgram = new ShaderProgram(readString, readString2);
        if ((shaderProgramParameter == null || shaderProgramParameter.logOnCompileFailure) && !shaderProgram.isCompiled()) {
            assetManager.getLogger().error("ShaderProgram " + str + " failed to compile:\n" + shaderProgram.getLog());
        }
        return shaderProgram;
    }
}
