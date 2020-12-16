package com.badlogic.gdx.graphics;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.utils.ByteArray;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.zip.CRC32;
import java.util.zip.CheckedOutputStream;
import java.util.zip.Deflater;
import java.util.zip.DeflaterOutputStream;
import java.util.zip.InflaterInputStream;

public class PixmapIO {
    public static void writeCIM(FileHandle fileHandle, Pixmap pixmap) {
        CIM.write(fileHandle, pixmap);
    }

    public static Pixmap readCIM(FileHandle fileHandle) {
        return CIM.read(fileHandle);
    }

    public static void writePNG(FileHandle fileHandle, Pixmap pixmap, int i, boolean z) {
        try {
            PNG png = new PNG((int) (((float) (pixmap.getWidth() * pixmap.getHeight())) * 1.5f));
            try {
                png.setFlipY(z);
                png.setCompression(i);
                png.write(fileHandle, pixmap);
            } finally {
                png.dispose();
            }
        } catch (IOException e) {
            throw new GdxRuntimeException("Error writing PNG: " + fileHandle, e);
        }
    }

    public static void writePNG(FileHandle fileHandle, Pixmap pixmap) {
        writePNG(fileHandle, pixmap, -1, false);
    }

    /* access modifiers changed from: private */
    public static class CIM {
        private static final int BUFFER_SIZE = 32000;
        private static final byte[] readBuffer = new byte[BUFFER_SIZE];
        private static final byte[] writeBuffer = new byte[BUFFER_SIZE];

        private CIM() {
        }

        public static void write(FileHandle fileHandle, Pixmap pixmap) {
            Throwable th;
            Exception e;
            DataOutputStream dataOutputStream = null;
            try {
                DataOutputStream dataOutputStream2 = new DataOutputStream(new DeflaterOutputStream(fileHandle.write(false)));
                try {
                    dataOutputStream2.writeInt(pixmap.getWidth());
                    dataOutputStream2.writeInt(pixmap.getHeight());
                    dataOutputStream2.writeInt(Pixmap.Format.toGdx2DPixmapFormat(pixmap.getFormat()));
                    ByteBuffer pixels = pixmap.getPixels();
                    pixels.position(0);
                    pixels.limit(pixels.capacity());
                    int capacity = pixels.capacity() % BUFFER_SIZE;
                    int capacity2 = pixels.capacity() / BUFFER_SIZE;
                    synchronized (writeBuffer) {
                        for (int i = 0; i < capacity2; i++) {
                            pixels.get(writeBuffer);
                            dataOutputStream2.write(writeBuffer);
                        }
                        pixels.get(writeBuffer, 0, capacity);
                        dataOutputStream2.write(writeBuffer, 0, capacity);
                    }
                    pixels.position(0);
                    pixels.limit(pixels.capacity());
                    StreamUtils.closeQuietly(dataOutputStream2);
                } catch (Exception e2) {
                    e = e2;
                    dataOutputStream = dataOutputStream2;
                    try {
                        throw new GdxRuntimeException("Couldn't write Pixmap to file '" + fileHandle + "'", e);
                    } catch (Throwable th2) {
                        th = th2;
                        dataOutputStream2 = dataOutputStream;
                        StreamUtils.closeQuietly(dataOutputStream2);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    StreamUtils.closeQuietly(dataOutputStream2);
                    throw th;
                }
            } catch (Exception e3) {
                e = e3;
                throw new GdxRuntimeException("Couldn't write Pixmap to file '" + fileHandle + "'", e);
            }
        }

        public static Pixmap read(FileHandle fileHandle) {
            Throwable th;
            DataInputStream dataInputStream;
            Exception e;
            try {
                dataInputStream = new DataInputStream(new InflaterInputStream(new BufferedInputStream(fileHandle.read())));
                try {
                    Pixmap pixmap = new Pixmap(dataInputStream.readInt(), dataInputStream.readInt(), Pixmap.Format.fromGdx2DPixmapFormat(dataInputStream.readInt()));
                    ByteBuffer pixels = pixmap.getPixels();
                    pixels.position(0);
                    pixels.limit(pixels.capacity());
                    synchronized (readBuffer) {
                        while (true) {
                            int read = dataInputStream.read(readBuffer);
                            if (read > 0) {
                                pixels.put(readBuffer, 0, read);
                            }
                        }
                    }
                    pixels.position(0);
                    pixels.limit(pixels.capacity());
                    StreamUtils.closeQuietly(dataInputStream);
                    return pixmap;
                } catch (Exception e2) {
                    e = e2;
                    try {
                        throw new GdxRuntimeException("Couldn't read Pixmap from file '" + fileHandle + "'", e);
                    } catch (Throwable th2) {
                        th = th2;
                        StreamUtils.closeQuietly(dataInputStream);
                        throw th;
                    }
                }
            } catch (Exception e3) {
                dataInputStream = null;
                e = e3;
                throw new GdxRuntimeException("Couldn't read Pixmap from file '" + fileHandle + "'", e);
            } catch (Throwable th3) {
                th = th3;
                dataInputStream = null;
                StreamUtils.closeQuietly(dataInputStream);
                throw th;
            }
        }
    }

    public static class PNG implements Disposable {
        private static final byte COLOR_ARGB = 6;
        private static final byte COMPRESSION_DEFLATE = 0;
        private static final byte FILTER_NONE = 0;
        private static final int IDAT = 1229209940;
        private static final int IEND = 1229278788;
        private static final int IHDR = 1229472850;
        private static final byte INTERLACE_NONE = 0;
        private static final byte PAETH = 4;
        private static final byte[] SIGNATURE = {-119, 80, 78, 71, 13, 10, 26, 10};
        private final ChunkBuffer buffer;
        private ByteArray curLineBytes;
        private final Deflater deflater;
        private boolean flipY;
        private int lastLineLen;
        private ByteArray lineOutBytes;
        private ByteArray prevLineBytes;

        public PNG() {
            this(GL20.GL_COLOR_BUFFER_BIT);
        }

        public PNG(int i) {
            this.flipY = true;
            this.buffer = new ChunkBuffer(i);
            this.deflater = new Deflater();
        }

        public void setFlipY(boolean z) {
            this.flipY = z;
        }

        public void setCompression(int i) {
            this.deflater.setLevel(i);
        }

        public void write(FileHandle fileHandle, Pixmap pixmap) throws IOException {
            OutputStream write = fileHandle.write(false);
            try {
                write(write, pixmap);
            } finally {
                StreamUtils.closeQuietly(write);
            }
        }

        public void write(OutputStream outputStream, Pixmap pixmap) throws IOException {
            byte[] bArr;
            byte[] bArr2;
            byte[] bArr3;
            DeflaterOutputStream deflaterOutputStream = new DeflaterOutputStream(this.buffer, this.deflater);
            DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
            dataOutputStream.write(SIGNATURE);
            this.buffer.writeInt(IHDR);
            this.buffer.writeInt(pixmap.getWidth());
            this.buffer.writeInt(pixmap.getHeight());
            this.buffer.writeByte(8);
            this.buffer.writeByte(6);
            int i = 0;
            this.buffer.writeByte(0);
            this.buffer.writeByte(0);
            this.buffer.writeByte(0);
            this.buffer.endChunk(dataOutputStream);
            this.buffer.writeInt(IDAT);
            this.deflater.reset();
            int width = pixmap.getWidth() * 4;
            ByteArray byteArray = this.lineOutBytes;
            if (byteArray == null) {
                ByteArray byteArray2 = new ByteArray(width);
                this.lineOutBytes = byteArray2;
                bArr3 = byteArray2.items;
                ByteArray byteArray3 = new ByteArray(width);
                this.curLineBytes = byteArray3;
                bArr2 = byteArray3.items;
                ByteArray byteArray4 = new ByteArray(width);
                this.prevLineBytes = byteArray4;
                bArr = byteArray4.items;
            } else {
                bArr3 = byteArray.ensureCapacity(width);
                bArr2 = this.curLineBytes.ensureCapacity(width);
                bArr = this.prevLineBytes.ensureCapacity(width);
                int i2 = this.lastLineLen;
                for (int i3 = 0; i3 < i2; i3++) {
                    bArr[i3] = 0;
                }
            }
            this.lastLineLen = width;
            ByteBuffer pixels = pixmap.getPixels();
            int position = pixels.position();
            int i4 = 1;
            boolean z = pixmap.getFormat() == Pixmap.Format.RGBA8888;
            int height = pixmap.getHeight();
            byte[] bArr4 = bArr;
            byte[] bArr5 = bArr2;
            int i5 = 0;
            while (i5 < height) {
                int i6 = this.flipY ? (height - i5) - i4 : i5;
                if (z) {
                    pixels.position(i6 * width);
                    pixels.get(bArr5, i, width);
                } else {
                    int i7 = 0;
                    int i8 = 0;
                    while (i7 < pixmap.getWidth()) {
                        int pixel = pixmap.getPixel(i7, i6);
                        int i9 = i8 + 1;
                        bArr5[i8] = (byte) ((pixel >> 24) & 255);
                        int i10 = i9 + 1;
                        bArr5[i9] = (byte) ((pixel >> 16) & 255);
                        int i11 = i10 + 1;
                        bArr5[i10] = (byte) ((pixel >> 8) & 255);
                        int i12 = i11 + 1;
                        bArr5[i11] = (byte) (pixel & 255);
                        i7++;
                        i6 = i6;
                        z = z;
                        i8 = i12;
                    }
                }
                bArr3[0] = (byte) (bArr5[0] - bArr4[0]);
                bArr3[1] = (byte) (bArr5[1] - bArr4[1]);
                bArr3[2] = (byte) (bArr5[2] - bArr4[2]);
                bArr3[3] = (byte) (bArr5[3] - bArr4[3]);
                int i13 = 4;
                while (i13 < width) {
                    int i14 = i13 - 4;
                    int i15 = bArr5[i14] & 255;
                    int i16 = bArr4[i13] & 255;
                    int i17 = bArr4[i14] & 255;
                    int i18 = (i15 + i16) - i17;
                    int i19 = i18 - i15;
                    if (i19 < 0) {
                        i19 = -i19;
                    }
                    int i20 = i18 - i16;
                    if (i20 < 0) {
                        i20 = -i20;
                    }
                    int i21 = i18 - i17;
                    if (i21 < 0) {
                        i21 = -i21;
                    }
                    if (i19 <= i20 && i19 <= i21) {
                        i16 = i15;
                    } else if (i20 > i21) {
                        i16 = i17;
                    }
                    bArr3[i13] = (byte) (bArr5[i13] - i16);
                    i13++;
                    height = height;
                }
                deflaterOutputStream.write(4);
                i = 0;
                deflaterOutputStream.write(bArr3, 0, width);
                i5++;
                z = z;
                i4 = 1;
                bArr4 = bArr5;
                bArr5 = bArr4;
            }
            pixels.position(position);
            deflaterOutputStream.finish();
            this.buffer.endChunk(dataOutputStream);
            this.buffer.writeInt(IEND);
            this.buffer.endChunk(dataOutputStream);
            outputStream.flush();
        }

        @Override // com.badlogic.gdx.utils.Disposable
        public void dispose() {
            this.deflater.end();
        }

        /* access modifiers changed from: package-private */
        public static class ChunkBuffer extends DataOutputStream {
            final ByteArrayOutputStream buffer;
            final CRC32 crc;

            ChunkBuffer(int i) {
                this(new ByteArrayOutputStream(i), new CRC32());
            }

            private ChunkBuffer(ByteArrayOutputStream byteArrayOutputStream, CRC32 crc32) {
                super(new CheckedOutputStream(byteArrayOutputStream, crc32));
                this.buffer = byteArrayOutputStream;
                this.crc = crc32;
            }

            public void endChunk(DataOutputStream dataOutputStream) throws IOException {
                flush();
                dataOutputStream.writeInt(this.buffer.size() - 4);
                this.buffer.writeTo(dataOutputStream);
                dataOutputStream.writeInt((int) this.crc.getValue());
                this.buffer.reset();
                this.crc.reset();
            }
        }
    }
}
