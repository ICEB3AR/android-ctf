package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.CubemapData;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.TextureData;
import com.badlogic.gdx.graphics.glutils.ETC1;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;
import java.util.zip.GZIPInputStream;

public class KTXTextureData implements TextureData, CubemapData {
    private static final int GL_TEXTURE_1D = 4660;
    private static final int GL_TEXTURE_1D_ARRAY_EXT = 4660;
    private static final int GL_TEXTURE_2D_ARRAY_EXT = 4660;
    private static final int GL_TEXTURE_3D = 4660;
    private ByteBuffer compressedData;
    private FileHandle file;
    private int glBaseInternalFormat;
    private int glFormat;
    private int glInternalFormat;
    private int glType;
    private int glTypeSize;
    private int imagePos;
    private int numberOfArrayElements;
    private int numberOfFaces;
    private int numberOfMipmapLevels;
    private int pixelDepth = -1;
    private int pixelHeight = -1;
    private int pixelWidth = -1;
    private boolean useMipMaps;

    @Override // com.badlogic.gdx.graphics.TextureData, com.badlogic.gdx.graphics.CubemapData
    public boolean isManaged() {
        return true;
    }

    public KTXTextureData(FileHandle fileHandle, boolean z) {
        this.file = fileHandle;
        this.useMipMaps = z;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public TextureData.TextureDataType getType() {
        return TextureData.TextureDataType.Custom;
    }

    @Override // com.badlogic.gdx.graphics.TextureData, com.badlogic.gdx.graphics.CubemapData
    public boolean isPrepared() {
        return this.compressedData != null;
    }

    @Override // com.badlogic.gdx.graphics.TextureData, com.badlogic.gdx.graphics.CubemapData
    public void prepare() {
        Throwable th;
        Exception e;
        if (this.compressedData == null) {
            FileHandle fileHandle = this.file;
            if (fileHandle != null) {
                if (fileHandle.name().endsWith(".zktx")) {
                    byte[] bArr = new byte[GL20.GL_TEXTURE_MAG_FILTER];
                    DataInputStream dataInputStream = null;
                    try {
                        DataInputStream dataInputStream2 = new DataInputStream(new BufferedInputStream(new GZIPInputStream(this.file.read())));
                        try {
                            this.compressedData = BufferUtils.newUnsafeByteBuffer(dataInputStream2.readInt());
                            while (true) {
                                int read = dataInputStream2.read(bArr);
                                if (read == -1) {
                                    break;
                                }
                                this.compressedData.put(bArr, 0, read);
                            }
                            this.compressedData.position(0);
                            this.compressedData.limit(this.compressedData.capacity());
                            StreamUtils.closeQuietly(dataInputStream2);
                        } catch (Exception e2) {
                            e = e2;
                            dataInputStream = dataInputStream2;
                            try {
                                throw new GdxRuntimeException("Couldn't load zktx file '" + this.file + "'", e);
                            } catch (Throwable th2) {
                                th = th2;
                                StreamUtils.closeQuietly(dataInputStream);
                                throw th;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            dataInputStream = dataInputStream2;
                            StreamUtils.closeQuietly(dataInputStream);
                            throw th;
                        }
                    } catch (Exception e3) {
                        e = e3;
                        throw new GdxRuntimeException("Couldn't load zktx file '" + this.file + "'", e);
                    }
                } else {
                    this.compressedData = ByteBuffer.wrap(this.file.readBytes());
                }
                if (this.compressedData.get() != -85) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != 75) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != 84) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != 88) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != 32) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != 49) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != 49) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != -69) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != 13) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != 10) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() != 26) {
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else if (this.compressedData.get() == 10) {
                    int i = this.compressedData.getInt();
                    if (i == 67305985 || i == 16909060) {
                        if (i != 67305985) {
                            ByteBuffer byteBuffer = this.compressedData;
                            byteBuffer.order(byteBuffer.order() == ByteOrder.BIG_ENDIAN ? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN);
                        }
                        this.glType = this.compressedData.getInt();
                        this.glTypeSize = this.compressedData.getInt();
                        this.glFormat = this.compressedData.getInt();
                        this.glInternalFormat = this.compressedData.getInt();
                        this.glBaseInternalFormat = this.compressedData.getInt();
                        this.pixelWidth = this.compressedData.getInt();
                        this.pixelHeight = this.compressedData.getInt();
                        this.pixelDepth = this.compressedData.getInt();
                        this.numberOfArrayElements = this.compressedData.getInt();
                        this.numberOfFaces = this.compressedData.getInt();
                        this.numberOfMipmapLevels = this.compressedData.getInt();
                        if (this.numberOfMipmapLevels == 0) {
                            this.numberOfMipmapLevels = 1;
                            this.useMipMaps = true;
                        }
                        this.imagePos = this.compressedData.position() + this.compressedData.getInt();
                        if (!this.compressedData.isDirect()) {
                            int i2 = this.imagePos;
                            for (int i3 = 0; i3 < this.numberOfMipmapLevels; i3++) {
                                i2 += (((this.compressedData.getInt(i2) + 3) & -4) * this.numberOfFaces) + 4;
                            }
                            this.compressedData.limit(i2);
                            this.compressedData.position(0);
                            ByteBuffer newUnsafeByteBuffer = BufferUtils.newUnsafeByteBuffer(i2);
                            newUnsafeByteBuffer.order(this.compressedData.order());
                            newUnsafeByteBuffer.put(this.compressedData);
                            this.compressedData = newUnsafeByteBuffer;
                            return;
                        }
                        return;
                    }
                    throw new GdxRuntimeException("Invalid KTX Header");
                } else {
                    throw new GdxRuntimeException("Invalid KTX Header");
                }
            } else {
                throw new GdxRuntimeException("Need a file to load from");
            }
        } else {
            throw new GdxRuntimeException("Already prepared");
        }
    }

    @Override // com.badlogic.gdx.graphics.CubemapData
    public void consumeCubemapData() {
        consumeCustomData(GL20.GL_TEXTURE_CUBE_MAP);
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public void consumeCustomData(int i) {
        boolean z;
        int i2;
        int i3;
        int i4;
        boolean z2;
        int i5;
        if (this.compressedData != null) {
            IntBuffer newIntBuffer = BufferUtils.newIntBuffer(16);
            int i6 = 1;
            if (this.glType != 0 && this.glFormat != 0) {
                z = false;
            } else if (this.glType + this.glFormat == 0) {
                z = true;
            } else {
                throw new GdxRuntimeException("either both or none of glType, glFormat must be zero");
            }
            if (this.pixelHeight > 0) {
                i3 = 2;
                i2 = GL20.GL_TEXTURE_2D;
            } else {
                i3 = 1;
                i2 = 4660;
            }
            if (this.pixelDepth > 0) {
                i3 = 3;
                i2 = 4660;
            }
            int i7 = this.numberOfFaces;
            if (i7 == 6) {
                if (i3 == 2) {
                    i2 = GL20.GL_TEXTURE_CUBE_MAP;
                } else {
                    throw new GdxRuntimeException("cube map needs 2D faces");
                }
            } else if (i7 != 1) {
                throw new GdxRuntimeException("numberOfFaces must be either 1 or 6");
            }
            if (this.numberOfArrayElements > 0) {
                if (i2 == 4660 || i2 == 3553) {
                    i3++;
                    i2 = 4660;
                } else {
                    throw new GdxRuntimeException("No API for 3D and cube arrays yet");
                }
            }
            if (i2 != 4660) {
                int i8 = this.numberOfFaces;
                int i9 = -1;
                int i10 = GL20.GL_TEXTURE_CUBE_MAP_POSITIVE_X;
                if (i8 != 6 || i == 34067) {
                    if (!(this.numberOfFaces == 6 && i == 34067)) {
                        if (i == i2 || (34069 <= i && i <= 34074 && i == 3553)) {
                            i10 = i;
                        } else {
                            throw new GdxRuntimeException("Invalid target requested : 0x" + Integer.toHexString(i) + ", expecting : 0x" + Integer.toHexString(i2));
                        }
                    }
                    i4 = -1;
                } else if (34069 > i || i > 34074) {
                    throw new GdxRuntimeException("You must specify either GL_TEXTURE_CUBE_MAP to bind all 6 faces of the cube or the requested face GL_TEXTURE_CUBE_MAP_POSITIVE_X and followings.");
                } else {
                    i4 = i - GL20.GL_TEXTURE_CUBE_MAP_POSITIVE_X;
                }
                Gdx.gl.glGetIntegerv(GL20.GL_UNPACK_ALIGNMENT, newIntBuffer);
                int i11 = newIntBuffer.get(0);
                int i12 = 4;
                if (i11 != 4) {
                    Gdx.gl.glPixelStorei(GL20.GL_UNPACK_ALIGNMENT, 4);
                }
                int i13 = this.glInternalFormat;
                int i14 = this.glFormat;
                int i15 = this.imagePos;
                int i16 = 0;
                while (i16 < this.numberOfMipmapLevels) {
                    int max = Math.max(i6, this.pixelWidth >> i16);
                    int max2 = Math.max(i6, this.pixelHeight >> i16);
                    Math.max(i6, this.pixelDepth >> i16);
                    this.compressedData.position(i15);
                    int i17 = this.compressedData.getInt();
                    int i18 = (i17 + 3) & -4;
                    i15 += i12;
                    int i19 = max2;
                    int i20 = 0;
                    while (i20 < this.numberOfFaces) {
                        this.compressedData.position(i15);
                        i15 += i18;
                        if (i4 == i9 || i4 == i20) {
                            ByteBuffer slice = this.compressedData.slice();
                            slice.limit(i18);
                            if (i3 != 1) {
                                if (i3 == 2) {
                                    int i21 = this.numberOfArrayElements;
                                    if (i21 <= 0) {
                                        i21 = i19;
                                    }
                                    if (z) {
                                        i5 = i4;
                                        if (i13 == ETC1.ETC1_RGB8_OES) {
                                            z2 = z;
                                            if (!Gdx.graphics.supportsExtension("GL_OES_compressed_ETC1_RGB8_texture")) {
                                                Pixmap decodeImage = ETC1.decodeImage(new ETC1.ETC1Data(max, i21, slice, 0), Pixmap.Format.RGB888);
                                                Gdx.gl.glTexImage2D(i10 + i20, i16, decodeImage.getGLInternalFormat(), decodeImage.getWidth(), decodeImage.getHeight(), 0, decodeImage.getGLFormat(), decodeImage.getGLType(), decodeImage.getPixels());
                                                decodeImage.dispose();
                                            } else {
                                                Gdx.gl.glCompressedTexImage2D(i10 + i20, i16, i13, max, i21, 0, i17, slice);
                                            }
                                        } else {
                                            z2 = z;
                                            Gdx.gl.glCompressedTexImage2D(i10 + i20, i16, i13, max, i21, 0, i17, slice);
                                        }
                                    } else {
                                        i5 = i4;
                                        z2 = z;
                                        Gdx.gl.glTexImage2D(i10 + i20, i16, i13, max, i21, 0, i14, this.glType, slice);
                                    }
                                    i19 = i21;
                                } else {
                                    i5 = i4;
                                    z2 = z;
                                    if (i3 == 3) {
                                        int i22 = this.numberOfArrayElements;
                                    }
                                }
                                i20++;
                                i4 = i5;
                                z = z2;
                                i9 = -1;
                            }
                        }
                        i5 = i4;
                        z2 = z;
                        i20++;
                        i4 = i5;
                        z = z2;
                        i9 = -1;
                    }
                    i16++;
                    i4 = i4;
                    z = z;
                    i6 = 1;
                    i12 = 4;
                    i9 = -1;
                }
                if (i11 != 4) {
                    Gdx.gl.glPixelStorei(GL20.GL_UNPACK_ALIGNMENT, i11);
                }
                if (useMipMaps()) {
                    Gdx.gl.glGenerateMipmap(i10);
                }
                disposePreparedData();
                return;
            }
            throw new GdxRuntimeException("Unsupported texture format (only 2D texture are supported in LibGdx for the time being)");
        }
        throw new GdxRuntimeException("Call prepare() before calling consumeCompressedData()");
    }

    public void disposePreparedData() {
        ByteBuffer byteBuffer = this.compressedData;
        if (byteBuffer != null) {
            BufferUtils.disposeUnsafeByteBuffer(byteBuffer);
        }
        this.compressedData = null;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public Pixmap consumePixmap() {
        throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap");
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean disposePixmap() {
        throw new GdxRuntimeException("This TextureData implementation does not return a Pixmap");
    }

    @Override // com.badlogic.gdx.graphics.TextureData, com.badlogic.gdx.graphics.CubemapData
    public int getWidth() {
        return this.pixelWidth;
    }

    @Override // com.badlogic.gdx.graphics.TextureData, com.badlogic.gdx.graphics.CubemapData
    public int getHeight() {
        return this.pixelHeight;
    }

    public int getNumberOfMipMapLevels() {
        return this.numberOfMipmapLevels;
    }

    public int getNumberOfFaces() {
        return this.numberOfFaces;
    }

    public int getGlInternalFormat() {
        return this.glInternalFormat;
    }

    public ByteBuffer getData(int i, int i2) {
        int i3 = this.imagePos;
        for (int i4 = 0; i4 < this.numberOfMipmapLevels; i4++) {
            int i5 = (this.compressedData.getInt(i3) + 3) & -4;
            int i6 = i3 + 4;
            if (i4 == i) {
                int i7 = i6;
                for (int i8 = 0; i8 < this.numberOfFaces; i8++) {
                    if (i8 == i2) {
                        this.compressedData.position(i7);
                        ByteBuffer slice = this.compressedData.slice();
                        slice.limit(i5);
                        return slice;
                    }
                    i7 += i5;
                }
                i3 = i7;
            } else {
                i3 = i6 + (i5 * this.numberOfFaces);
            }
        }
        return null;
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public Pixmap.Format getFormat() {
        throw new GdxRuntimeException("This TextureData implementation directly handles texture formats.");
    }

    @Override // com.badlogic.gdx.graphics.TextureData
    public boolean useMipMaps() {
        return this.useMipMaps;
    }
}
