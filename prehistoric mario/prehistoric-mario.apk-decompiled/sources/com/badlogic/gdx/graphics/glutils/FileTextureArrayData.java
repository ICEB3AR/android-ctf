package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureArrayData;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class FileTextureArrayData implements TextureArrayData {
    private int depth;
    private Pixmap.Format format;
    private boolean prepared;
    private TextureData[] textureDatas;
    boolean useMipMaps;

    public FileTextureArrayData(Pixmap.Format format2, boolean z, FileHandle[] fileHandleArr) {
        this.format = format2;
        this.useMipMaps = z;
        this.depth = fileHandleArr.length;
        this.textureDatas = new TextureData[fileHandleArr.length];
        for (int i = 0; i < fileHandleArr.length; i++) {
            this.textureDatas[i] = TextureData.Factory.loadFromFile(fileHandleArr[i], format2, z);
        }
    }

    @Override // com.badlogic.gdx.graphics.TextureArrayData
    public boolean isPrepared() {
        return this.prepared;
    }

    @Override // com.badlogic.gdx.graphics.TextureArrayData
    public void prepare() {
        TextureData[] textureDataArr = this.textureDatas;
        int i = -1;
        int i2 = -1;
        for (TextureData textureData : textureDataArr) {
            textureData.prepare();
            if (i == -1) {
                i = textureData.getWidth();
                i2 = textureData.getHeight();
            } else if (i != textureData.getWidth() || i2 != textureData.getHeight()) {
                throw new GdxRuntimeException("Error whilst preparing TextureArray: TextureArray Textures must have equal dimensions.");
            }
        }
        this.prepared = true;
    }

    @Override // com.badlogic.gdx.graphics.TextureArrayData
    public void consumeTextureArrayData() {
        boolean z;
        Pixmap pixmap;
        int i = 0;
        while (true) {
            TextureData[] textureDataArr = this.textureDatas;
            if (i < textureDataArr.length) {
                if (textureDataArr[i].getType() == TextureData.TextureDataType.Custom) {
                    this.textureDatas[i].consumeCustomData(GL30.GL_TEXTURE_2D_ARRAY);
                } else {
                    TextureData textureData = this.textureDatas[i];
                    Pixmap consumePixmap = textureData.consumePixmap();
                    boolean disposePixmap = textureData.disposePixmap();
                    if (textureData.getFormat() != consumePixmap.getFormat()) {
                        Pixmap pixmap2 = new Pixmap(consumePixmap.getWidth(), consumePixmap.getHeight(), textureData.getFormat());
                        pixmap2.setBlending(Pixmap.Blending.None);
                        pixmap2.drawPixmap(consumePixmap, 0, 0, 0, 0, consumePixmap.getWidth(), consumePixmap.getHeight());
                        if (textureData.disposePixmap()) {
                            consumePixmap.dispose();
                        }
                        pixmap = pixmap2;
                        z = true;
                    } else {
                        z = disposePixmap;
                        pixmap = consumePixmap;
                    }
                    Gdx.gl30.glTexSubImage3D(GL30.GL_TEXTURE_2D_ARRAY, 0, 0, 0, i, pixmap.getWidth(), pixmap.getHeight(), 1, pixmap.getGLInternalFormat(), pixmap.getGLType(), pixmap.getPixels());
                    if (z) {
                        pixmap.dispose();
                    }
                }
                i++;
            } else {
                return;
            }
        }
    }

    @Override // com.badlogic.gdx.graphics.TextureArrayData
    public int getWidth() {
        return this.textureDatas[0].getWidth();
    }

    @Override // com.badlogic.gdx.graphics.TextureArrayData
    public int getHeight() {
        return this.textureDatas[0].getHeight();
    }

    @Override // com.badlogic.gdx.graphics.TextureArrayData
    public int getDepth() {
        return this.depth;
    }

    @Override // com.badlogic.gdx.graphics.TextureArrayData
    public int getInternalFormat() {
        return Pixmap.Format.toGlFormat(this.format);
    }

    @Override // com.badlogic.gdx.graphics.TextureArrayData
    public int getGLType() {
        return Pixmap.Format.toGlType(this.format);
    }

    @Override // com.badlogic.gdx.graphics.TextureArrayData
    public boolean isManaged() {
        for (TextureData textureData : this.textureDatas) {
            if (!textureData.isManaged()) {
                return false;
            }
        }
        return true;
    }
}
