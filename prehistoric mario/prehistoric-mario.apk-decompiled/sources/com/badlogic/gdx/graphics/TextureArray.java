package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureArrayData;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.Buffer;
import java.util.HashMap;
import java.util.Map;

public class TextureArray extends GLTexture {
    static final Map<Application, Array<TextureArray>> managedTextureArrays = new HashMap();
    private TextureArrayData data;

    public TextureArray(String... strArr) {
        this(getInternalHandles(strArr));
    }

    public TextureArray(FileHandle... fileHandleArr) {
        this(false, fileHandleArr);
    }

    public TextureArray(boolean z, FileHandle... fileHandleArr) {
        this(z, Pixmap.Format.RGBA8888, fileHandleArr);
    }

    public TextureArray(boolean z, Pixmap.Format format, FileHandle... fileHandleArr) {
        this(TextureArrayData.Factory.loadFromFiles(format, z, fileHandleArr));
    }

    public TextureArray(TextureArrayData textureArrayData) {
        super(GL30.GL_TEXTURE_2D_ARRAY, Gdx.gl.glGenTexture());
        if (Gdx.gl30 != null) {
            load(textureArrayData);
            if (textureArrayData.isManaged()) {
                addManagedTexture(Gdx.app, this);
                return;
            }
            return;
        }
        throw new GdxRuntimeException("TextureArray requires a device running with GLES 3.0 compatibilty");
    }

    private static FileHandle[] getInternalHandles(String... strArr) {
        FileHandle[] fileHandleArr = new FileHandle[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            fileHandleArr[i] = Gdx.files.internal(strArr[i]);
        }
        return fileHandleArr;
    }

    private void load(TextureArrayData textureArrayData) {
        if (this.data == null || textureArrayData.isManaged() == this.data.isManaged()) {
            this.data = textureArrayData;
            bind();
            Gdx.gl30.glTexImage3D(GL30.GL_TEXTURE_2D_ARRAY, 0, textureArrayData.getInternalFormat(), textureArrayData.getWidth(), textureArrayData.getHeight(), textureArrayData.getDepth(), 0, textureArrayData.getInternalFormat(), textureArrayData.getGLType(), (Buffer) null);
            if (!textureArrayData.isPrepared()) {
                textureArrayData.prepare();
            }
            textureArrayData.consumeTextureArrayData();
            setFilter(this.minFilter, this.magFilter);
            setWrap(this.uWrap, this.vWrap);
            Gdx.gl.glBindTexture(this.glTarget, 0);
            return;
        }
        throw new GdxRuntimeException("New data must have the same managed status as the old data");
    }

    @Override // com.badlogic.gdx.graphics.GLTexture
    public int getWidth() {
        return this.data.getWidth();
    }

    @Override // com.badlogic.gdx.graphics.GLTexture
    public int getHeight() {
        return this.data.getHeight();
    }

    @Override // com.badlogic.gdx.graphics.GLTexture
    public int getDepth() {
        return this.data.getDepth();
    }

    @Override // com.badlogic.gdx.graphics.GLTexture
    public boolean isManaged() {
        return this.data.isManaged();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.graphics.GLTexture
    public void reload() {
        if (isManaged()) {
            this.glHandle = Gdx.gl.glGenTexture();
            load(this.data);
            return;
        }
        throw new GdxRuntimeException("Tried to reload an unmanaged TextureArray");
    }

    private static void addManagedTexture(Application application, TextureArray textureArray) {
        Array<TextureArray> array = managedTextureArrays.get(application);
        if (array == null) {
            array = new Array<>();
        }
        array.add(textureArray);
        managedTextureArrays.put(application, array);
    }

    public static void clearAllTextureArrays(Application application) {
        managedTextureArrays.remove(application);
    }

    public static void invalidateAllTextureArrays(Application application) {
        Array<TextureArray> array = managedTextureArrays.get(application);
        if (array != null) {
            for (int i = 0; i < array.size; i++) {
                array.get(i).reload();
            }
        }
    }

    public static String getManagedStatus() {
        StringBuilder sb = new StringBuilder();
        sb.append("Managed TextureArrays/app: { ");
        for (Application application : managedTextureArrays.keySet()) {
            sb.append(managedTextureArrays.get(application).size);
            sb.append(" ");
        }
        sb.append("}");
        return sb.toString();
    }

    public static int getNumManagedTextureArrays() {
        return managedTextureArrays.get(Gdx.app).size;
    }
}
