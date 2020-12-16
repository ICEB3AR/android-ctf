package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.nio.ByteBuffer;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class ETC1 {
    public static int ETC1_RGB8_OES = 36196;
    public static int PKM_HEADER_SIZE = 16;

    private static native void decodeImage(ByteBuffer byteBuffer, int i, ByteBuffer byteBuffer2, int i2, int i3, int i4, int i5);

    private static native ByteBuffer encodeImage(ByteBuffer byteBuffer, int i, int i2, int i3, int i4);

    private static native ByteBuffer encodeImagePKM(ByteBuffer byteBuffer, int i, int i2, int i3, int i4);

    public static native void formatHeader(ByteBuffer byteBuffer, int i, int i2, int i3);

    public static native int getCompressedDataSize(int i, int i2);

    static native int getHeightPKM(ByteBuffer byteBuffer, int i);

    static native int getWidthPKM(ByteBuffer byteBuffer, int i);

    static native boolean isValidPKM(ByteBuffer byteBuffer, int i);

    public static final class ETC1Data implements Disposable {
        public final ByteBuffer compressedData;
        public final int dataOffset;
        public final int height;
        public final int width;

        public ETC1Data(int i, int i2, ByteBuffer byteBuffer, int i3) {
            this.width = i;
            this.height = i2;
            this.compressedData = byteBuffer;
            this.dataOffset = i3;
            checkNPOT();
        }

        public ETC1Data(FileHandle fileHandle) {
            Throwable th;
            Exception e;
            byte[] bArr = new byte[GL20.GL_TEXTURE_MAG_FILTER];
            DataInputStream dataInputStream = null;
            try {
                DataInputStream dataInputStream2 = new DataInputStream(new BufferedInputStream(new GZIPInputStream(fileHandle.read())));
                try {
                    this.compressedData = BufferUtils.newUnsafeByteBuffer(dataInputStream2.readInt());
                    while (true) {
                        int read = dataInputStream2.read(bArr);
                        if (read != -1) {
                            this.compressedData.put(bArr, 0, read);
                        } else {
                            this.compressedData.position(0);
                            this.compressedData.limit(this.compressedData.capacity());
                            StreamUtils.closeQuietly(dataInputStream2);
                            this.width = ETC1.getWidthPKM(this.compressedData, 0);
                            this.height = ETC1.getHeightPKM(this.compressedData, 0);
                            this.dataOffset = ETC1.PKM_HEADER_SIZE;
                            this.compressedData.position(this.dataOffset);
                            checkNPOT();
                            return;
                        }
                    }
                } catch (Exception e2) {
                    e = e2;
                    dataInputStream = dataInputStream2;
                    try {
                        throw new GdxRuntimeException("Couldn't load pkm file '" + fileHandle + "'", e);
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
                throw new GdxRuntimeException("Couldn't load pkm file '" + fileHandle + "'", e);
            }
        }

        private void checkNPOT() {
            if (!MathUtils.isPowerOfTwo(this.width) || !MathUtils.isPowerOfTwo(this.height)) {
                System.out.println("ETC1Data warning: non-power-of-two ETC1 textures may crash the driver of PowerVR GPUs");
            }
        }

        public boolean hasPKMHeader() {
            return this.dataOffset == 16;
        }

        public void write(FileHandle fileHandle) {
            Throwable th;
            Exception e;
            byte[] bArr = new byte[GL20.GL_TEXTURE_MAG_FILTER];
            this.compressedData.position(0);
            ByteBuffer byteBuffer = this.compressedData;
            byteBuffer.limit(byteBuffer.capacity());
            DataOutputStream dataOutputStream = null;
            try {
                DataOutputStream dataOutputStream2 = new DataOutputStream(new GZIPOutputStream(fileHandle.write(false)));
                try {
                    dataOutputStream2.writeInt(this.compressedData.capacity());
                    int i = 0;
                    while (i != this.compressedData.capacity()) {
                        int min = Math.min(this.compressedData.remaining(), bArr.length);
                        this.compressedData.get(bArr, 0, min);
                        dataOutputStream2.write(bArr, 0, min);
                        i += min;
                    }
                    StreamUtils.closeQuietly(dataOutputStream2);
                    this.compressedData.position(this.dataOffset);
                    ByteBuffer byteBuffer2 = this.compressedData;
                    byteBuffer2.limit(byteBuffer2.capacity());
                } catch (Exception e2) {
                    e = e2;
                    dataOutputStream = dataOutputStream2;
                    try {
                        throw new GdxRuntimeException("Couldn't write PKM file to '" + fileHandle + "'", e);
                    } catch (Throwable th2) {
                        th = th2;
                        StreamUtils.closeQuietly(dataOutputStream);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    dataOutputStream = dataOutputStream2;
                    StreamUtils.closeQuietly(dataOutputStream);
                    throw th;
                }
            } catch (Exception e3) {
                e = e3;
                throw new GdxRuntimeException("Couldn't write PKM file to '" + fileHandle + "'", e);
            }
        }

        @Override // com.badlogic.gdx.utils.Disposable
        public void dispose() {
            BufferUtils.disposeUnsafeByteBuffer(this.compressedData);
        }

        public String toString() {
            if (hasPKMHeader()) {
                StringBuilder sb = new StringBuilder();
                sb.append(ETC1.isValidPKM(this.compressedData, 0) ? "valid" : "invalid");
                sb.append(" pkm [");
                sb.append(ETC1.getWidthPKM(this.compressedData, 0));
                sb.append("x");
                sb.append(ETC1.getHeightPKM(this.compressedData, 0));
                sb.append("], compressed: ");
                sb.append(this.compressedData.capacity() - ETC1.PKM_HEADER_SIZE);
                return sb.toString();
            }
            return "raw [" + this.width + "x" + this.height + "], compressed: " + (this.compressedData.capacity() - ETC1.PKM_HEADER_SIZE);
        }
    }

    private static int getPixelSize(Pixmap.Format format) {
        if (format == Pixmap.Format.RGB565) {
            return 2;
        }
        if (format == Pixmap.Format.RGB888) {
            return 3;
        }
        throw new GdxRuntimeException("Can only handle RGB565 or RGB888 images");
    }

    public static ETC1Data encodeImage(Pixmap pixmap) {
        ByteBuffer encodeImage = encodeImage(pixmap.getPixels(), 0, pixmap.getWidth(), pixmap.getHeight(), getPixelSize(pixmap.getFormat()));
        BufferUtils.newUnsafeByteBuffer(encodeImage);
        return new ETC1Data(pixmap.getWidth(), pixmap.getHeight(), encodeImage, 0);
    }

    public static ETC1Data encodeImagePKM(Pixmap pixmap) {
        ByteBuffer encodeImagePKM = encodeImagePKM(pixmap.getPixels(), 0, pixmap.getWidth(), pixmap.getHeight(), getPixelSize(pixmap.getFormat()));
        BufferUtils.newUnsafeByteBuffer(encodeImagePKM);
        return new ETC1Data(pixmap.getWidth(), pixmap.getHeight(), encodeImagePKM, 16);
    }

    public static Pixmap decodeImage(ETC1Data eTC1Data, Pixmap.Format format) {
        int i;
        int i2;
        int i3;
        if (eTC1Data.hasPKMHeader()) {
            int widthPKM = getWidthPKM(eTC1Data.compressedData, 0);
            i = getHeightPKM(eTC1Data.compressedData, 0);
            i2 = widthPKM;
            i3 = 16;
        } else {
            int i4 = eTC1Data.width;
            i = eTC1Data.height;
            i2 = i4;
            i3 = 0;
        }
        int pixelSize = getPixelSize(format);
        Pixmap pixmap = new Pixmap(i2, i, format);
        decodeImage(eTC1Data.compressedData, i3, pixmap.getPixels(), 0, i2, i, pixelSize);
        return pixmap;
    }
}
