package com.badlogic.gdx.graphics.g2d.freetype;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.LongMap;
import com.badlogic.gdx.utils.SharedLibraryLoader;
import com.badlogic.gdx.utils.StreamUtils;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import java.util.Iterator;

public class FreeType {
    public static int FT_ENCODING_ADOBE_CUSTOM = encode('A', 'D', 'B', 'C');
    public static int FT_ENCODING_ADOBE_EXPERT = encode('A', 'D', 'B', 'E');
    public static int FT_ENCODING_ADOBE_LATIN_1 = encode('l', 'a', 't', '1');
    public static int FT_ENCODING_ADOBE_STANDARD = encode('A', 'D', 'O', 'B');
    public static int FT_ENCODING_APPLE_ROMAN = encode('a', 'r', 'm', 'n');
    public static int FT_ENCODING_BIG5 = encode('b', 'i', 'g', '5');
    public static int FT_ENCODING_GB2312 = encode('g', 'b', ' ', ' ');
    public static int FT_ENCODING_JOHAB = encode('j', 'o', 'h', 'a');
    public static int FT_ENCODING_MS_SYMBOL = encode('s', 'y', 'm', 'b');
    public static int FT_ENCODING_NONE = 0;
    public static int FT_ENCODING_OLD_LATIN_2 = encode('l', 'a', 't', '2');
    public static int FT_ENCODING_SJIS = encode('s', 'j', 'i', 's');
    public static int FT_ENCODING_UNICODE = encode('u', 'n', 'i', 'c');
    public static int FT_ENCODING_WANSUNG = encode('w', 'a', 'n', 's');
    public static int FT_FACE_FLAG_CID_KEYED = StreamUtils.DEFAULT_BUFFER_SIZE;
    public static int FT_FACE_FLAG_EXTERNAL_STREAM = GL20.GL_STENCIL_BUFFER_BIT;
    public static int FT_FACE_FLAG_FAST_GLYPHS = 128;
    public static int FT_FACE_FLAG_FIXED_SIZES = 2;
    public static int FT_FACE_FLAG_FIXED_WIDTH = 4;
    public static int FT_FACE_FLAG_GLYPH_NAMES = GL20.GL_NEVER;
    public static int FT_FACE_FLAG_HINTER = 2048;
    public static int FT_FACE_FLAG_HORIZONTAL = 16;
    public static int FT_FACE_FLAG_KERNING = 64;
    public static int FT_FACE_FLAG_MULTIPLE_MASTERS = 256;
    public static int FT_FACE_FLAG_SCALABLE = 1;
    public static int FT_FACE_FLAG_SFNT = 8;
    public static int FT_FACE_FLAG_TRICKY = 8192;
    public static int FT_FACE_FLAG_VERTICAL = 32;
    public static int FT_KERNING_DEFAULT = 0;
    public static int FT_KERNING_UNFITTED = 1;
    public static int FT_KERNING_UNSCALED = 2;
    public static int FT_LOAD_CROP_BITMAP = 64;
    public static int FT_LOAD_DEFAULT = 0;
    public static int FT_LOAD_FORCE_AUTOHINT = 32;
    public static int FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = GL20.GL_NEVER;
    public static int FT_LOAD_IGNORE_TRANSFORM = 2048;
    public static int FT_LOAD_LINEAR_DESIGN = 8192;
    public static int FT_LOAD_MONOCHROME = StreamUtils.DEFAULT_BUFFER_SIZE;
    public static int FT_LOAD_NO_AUTOHINT = GL20.GL_COVERAGE_BUFFER_BIT_NV;
    public static int FT_LOAD_NO_BITMAP = 8;
    public static int FT_LOAD_NO_HINTING = 2;
    public static int FT_LOAD_NO_RECURSE = GL20.GL_STENCIL_BUFFER_BIT;
    public static int FT_LOAD_NO_SCALE = 1;
    public static int FT_LOAD_PEDANTIC = 128;
    public static int FT_LOAD_RENDER = 4;
    public static int FT_LOAD_VERTICAL_LAYOUT = 16;
    public static int FT_PIXEL_MODE_GRAY = 2;
    public static int FT_PIXEL_MODE_GRAY2 = 3;
    public static int FT_PIXEL_MODE_GRAY4 = 4;
    public static int FT_PIXEL_MODE_LCD = 5;
    public static int FT_PIXEL_MODE_LCD_V = 6;
    public static int FT_PIXEL_MODE_MONO = 1;
    public static int FT_PIXEL_MODE_NONE;
    public static int FT_RENDER_MODE_LCD = 3;
    public static int FT_RENDER_MODE_LCD_V = 4;
    public static int FT_RENDER_MODE_LIGHT = 1;
    public static int FT_RENDER_MODE_MAX = 5;
    public static int FT_RENDER_MODE_MONO = 2;
    public static int FT_RENDER_MODE_NORMAL = 0;
    public static int FT_STROKER_LINECAP_BUTT = 0;
    public static int FT_STROKER_LINECAP_ROUND = 1;
    public static int FT_STROKER_LINECAP_SQUARE = 2;
    public static int FT_STROKER_LINEJOIN_BEVEL = 1;
    public static int FT_STROKER_LINEJOIN_MITER = FT_STROKER_LINEJOIN_MITER_VARIABLE;
    public static int FT_STROKER_LINEJOIN_MITER_FIXED = 3;
    public static int FT_STROKER_LINEJOIN_MITER_VARIABLE = 2;
    public static int FT_STROKER_LINEJOIN_ROUND = 0;
    public static int FT_STYLE_FLAG_BOLD = 2;
    public static int FT_STYLE_FLAG_ITALIC = 1;

    private static int encode(char c, char c2, char c3, char c4) {
        return (c << 24) | (c2 << 16) | (c3 << '\b') | c4;
    }

    private static native long initFreeTypeJni();

    public static int toInt(int i) {
        return (i < 0 ? i - 32 : i + 32) >> 6;
    }

    private static class Pointer {
        long address;

        Pointer(long j) {
            this.address = j;
        }
    }

    public static class Library extends Pointer implements Disposable {
        LongMap<ByteBuffer> fontData = new LongMap<>();

        private static native void doneFreeType(long j);

        private static native long newMemoryFace(long j, ByteBuffer byteBuffer, int i, int i2);

        private static native long strokerNew(long j);

        Library(long j) {
            super(j);
        }

        @Override // com.badlogic.gdx.utils.Disposable
        public void dispose() {
            doneFreeType(this.address);
            Iterator<ByteBuffer> it = this.fontData.values().iterator();
            while (it.hasNext()) {
                BufferUtils.disposeUnsafeByteBuffer(it.next());
            }
        }

        public Face newFace(FileHandle fileHandle, int i) {
            byte[] readBytes = fileHandle.readBytes();
            return newMemoryFace(readBytes, readBytes.length, i);
        }

        public Face newMemoryFace(byte[] bArr, int i, int i2) {
            ByteBuffer newUnsafeByteBuffer = BufferUtils.newUnsafeByteBuffer(bArr.length);
            BufferUtils.copy(bArr, 0, (Buffer) newUnsafeByteBuffer, bArr.length);
            return newMemoryFace(newUnsafeByteBuffer, i2);
        }

        public Face newMemoryFace(ByteBuffer byteBuffer, int i) {
            long newMemoryFace = newMemoryFace(this.address, byteBuffer, byteBuffer.remaining(), i);
            if (newMemoryFace != 0) {
                this.fontData.put(newMemoryFace, byteBuffer);
                return new Face(newMemoryFace, this);
            }
            BufferUtils.disposeUnsafeByteBuffer(byteBuffer);
            throw new GdxRuntimeException("Couldn't load font");
        }

        public Stroker createStroker() {
            long strokerNew = strokerNew(this.address);
            if (strokerNew != 0) {
                return new Stroker(strokerNew);
            }
            throw new GdxRuntimeException("Couldn't create FreeType stroker");
        }
    }

    public static class Face extends Pointer implements Disposable {
        Library library;

        private static native void doneFace(long j);

        private static native int getAscender(long j);

        private static native int getCharIndex(long j, int i);

        private static native int getDescender(long j);

        private static native int getFaceFlags(long j);

        private static native long getGlyph(long j);

        private static native int getHeight(long j);

        private static native int getKerning(long j, int i, int i2, int i3);

        private static native int getMaxAdvanceHeight(long j);

        private static native int getMaxAdvanceWidth(long j);

        private static native int getNumGlyphs(long j);

        private static native long getSize(long j);

        private static native int getStyleFlags(long j);

        private static native int getUnderlinePosition(long j);

        private static native int getUnderlineThickness(long j);

        private static native boolean hasKerning(long j);

        private static native boolean loadChar(long j, int i, int i2);

        private static native boolean loadGlyph(long j, int i, int i2);

        private static native boolean selectSize(long j, int i);

        private static native boolean setCharSize(long j, int i, int i2, int i3, int i4);

        private static native boolean setPixelSizes(long j, int i, int i2);

        public Face(long j, Library library2) {
            super(j);
            this.library = library2;
        }

        @Override // com.badlogic.gdx.utils.Disposable
        public void dispose() {
            doneFace(this.address);
            ByteBuffer byteBuffer = this.library.fontData.get(this.address);
            if (byteBuffer != null) {
                this.library.fontData.remove(this.address);
                BufferUtils.disposeUnsafeByteBuffer(byteBuffer);
            }
        }

        public int getFaceFlags() {
            return getFaceFlags(this.address);
        }

        public int getStyleFlags() {
            return getStyleFlags(this.address);
        }

        public int getNumGlyphs() {
            return getNumGlyphs(this.address);
        }

        public int getAscender() {
            return getAscender(this.address);
        }

        public int getDescender() {
            return getDescender(this.address);
        }

        public int getHeight() {
            return getHeight(this.address);
        }

        public int getMaxAdvanceWidth() {
            return getMaxAdvanceWidth(this.address);
        }

        public int getMaxAdvanceHeight() {
            return getMaxAdvanceHeight(this.address);
        }

        public int getUnderlinePosition() {
            return getUnderlinePosition(this.address);
        }

        public int getUnderlineThickness() {
            return getUnderlineThickness(this.address);
        }

        public boolean selectSize(int i) {
            return selectSize(this.address, i);
        }

        public boolean setCharSize(int i, int i2, int i3, int i4) {
            return setCharSize(this.address, i, i2, i3, i4);
        }

        public boolean setPixelSizes(int i, int i2) {
            return setPixelSizes(this.address, i, i2);
        }

        public boolean loadGlyph(int i, int i2) {
            return loadGlyph(this.address, i, i2);
        }

        public boolean loadChar(int i, int i2) {
            return loadChar(this.address, i, i2);
        }

        public GlyphSlot getGlyph() {
            return new GlyphSlot(getGlyph(this.address));
        }

        public Size getSize() {
            return new Size(getSize(this.address));
        }

        public boolean hasKerning() {
            return hasKerning(this.address);
        }

        public int getKerning(int i, int i2, int i3) {
            return getKerning(this.address, i, i2, i3);
        }

        public int getCharIndex(int i) {
            return getCharIndex(this.address, i);
        }
    }

    public static class Size extends Pointer {
        private static native long getMetrics(long j);

        Size(long j) {
            super(j);
        }

        public SizeMetrics getMetrics() {
            return new SizeMetrics(getMetrics(this.address));
        }
    }

    public static class SizeMetrics extends Pointer {
        private static native int getAscender(long j);

        private static native int getDescender(long j);

        private static native int getHeight(long j);

        private static native int getMaxAdvance(long j);

        private static native int getXppem(long j);

        private static native int getXscale(long j);

        private static native int getYppem(long j);

        private static native int getYscale(long j);

        SizeMetrics(long j) {
            super(j);
        }

        public int getXppem() {
            return getXppem(this.address);
        }

        public int getYppem() {
            return getYppem(this.address);
        }

        public int getXScale() {
            return getXscale(this.address);
        }

        public int getYscale() {
            return getYscale(this.address);
        }

        public int getAscender() {
            return getAscender(this.address);
        }

        public int getDescender() {
            return getDescender(this.address);
        }

        public int getHeight() {
            return getHeight(this.address);
        }

        public int getMaxAdvance() {
            return getMaxAdvance(this.address);
        }
    }

    public static class GlyphSlot extends Pointer {
        private static native int getAdvanceX(long j);

        private static native int getAdvanceY(long j);

        private static native long getBitmap(long j);

        private static native int getBitmapLeft(long j);

        private static native int getBitmapTop(long j);

        private static native int getFormat(long j);

        private static native long getGlyph(long j);

        private static native int getLinearHoriAdvance(long j);

        private static native int getLinearVertAdvance(long j);

        private static native long getMetrics(long j);

        private static native boolean renderGlyph(long j, int i);

        GlyphSlot(long j) {
            super(j);
        }

        public GlyphMetrics getMetrics() {
            return new GlyphMetrics(getMetrics(this.address));
        }

        public int getLinearHoriAdvance() {
            return getLinearHoriAdvance(this.address);
        }

        public int getLinearVertAdvance() {
            return getLinearVertAdvance(this.address);
        }

        public int getAdvanceX() {
            return getAdvanceX(this.address);
        }

        public int getAdvanceY() {
            return getAdvanceY(this.address);
        }

        public int getFormat() {
            return getFormat(this.address);
        }

        public Bitmap getBitmap() {
            return new Bitmap(getBitmap(this.address));
        }

        public int getBitmapLeft() {
            return getBitmapLeft(this.address);
        }

        public int getBitmapTop() {
            return getBitmapTop(this.address);
        }

        public boolean renderGlyph(int i) {
            return renderGlyph(this.address, i);
        }

        public Glyph getGlyph() {
            long glyph = getGlyph(this.address);
            if (glyph != 0) {
                return new Glyph(glyph);
            }
            throw new GdxRuntimeException("Couldn't get glyph");
        }
    }

    public static class Glyph extends Pointer implements Disposable {
        private boolean rendered;

        private static native void done(long j);

        private static native long getBitmap(long j);

        private static native int getLeft(long j);

        private static native int getTop(long j);

        private static native long strokeBorder(long j, long j2, boolean z);

        private static native long toBitmap(long j, int i);

        Glyph(long j) {
            super(j);
        }

        @Override // com.badlogic.gdx.utils.Disposable
        public void dispose() {
            done(this.address);
        }

        public void strokeBorder(Stroker stroker, boolean z) {
            this.address = strokeBorder(this.address, stroker.address, z);
        }

        public void toBitmap(int i) {
            long bitmap = toBitmap(this.address, i);
            if (bitmap != 0) {
                this.address = bitmap;
                this.rendered = true;
                return;
            }
            throw new GdxRuntimeException("Couldn't render glyph");
        }

        public Bitmap getBitmap() {
            if (this.rendered) {
                return new Bitmap(getBitmap(this.address));
            }
            throw new GdxRuntimeException("Glyph is not yet rendered");
        }

        public int getLeft() {
            if (this.rendered) {
                return getLeft(this.address);
            }
            throw new GdxRuntimeException("Glyph is not yet rendered");
        }

        public int getTop() {
            if (this.rendered) {
                return getTop(this.address);
            }
            throw new GdxRuntimeException("Glyph is not yet rendered");
        }
    }

    public static class Bitmap extends Pointer {
        private static native ByteBuffer getBuffer(long j);

        private static native int getNumGray(long j);

        private static native int getPitch(long j);

        private static native int getPixelMode(long j);

        private static native int getRows(long j);

        private static native int getWidth(long j);

        Bitmap(long j) {
            super(j);
        }

        public int getRows() {
            return getRows(this.address);
        }

        public int getWidth() {
            return getWidth(this.address);
        }

        public int getPitch() {
            return getPitch(this.address);
        }

        public ByteBuffer getBuffer() {
            if (getRows() == 0) {
                return BufferUtils.newByteBuffer(1);
            }
            return getBuffer(this.address);
        }

        public Pixmap getPixmap(Pixmap.Format format) {
            return getPixmap(format, Color.WHITE);
        }

        public Pixmap getPixmap(Pixmap.Format format, Color color) {
            Pixmap pixmap;
            int width = getWidth();
            ByteBuffer buffer = getBuffer();
            if (color == Color.WHITE) {
                pixmap = new Pixmap(width, getRows(), Pixmap.Format.Alpha);
                BufferUtils.copy(buffer, pixmap.getPixels(), pixmap.getPixels().capacity());
            } else {
                pixmap = new Pixmap(width, getRows(), Pixmap.Format.RGBA8888);
                int pitch = getPitch();
                int rgba8888 = Color.rgba8888(color);
                IntBuffer asIntBuffer = pixmap.getPixels().asIntBuffer();
                for (int i = 0; i < getRows(); i++) {
                    int i2 = i * pitch;
                    int i3 = i * width;
                    for (int i4 = 0; i4 < width; i4++) {
                        asIntBuffer.put(i3 + i4, ((int) (((float) ((rgba8888 & 255) * (buffer.get(i2 + i4) & 255))) / 255.0f)) | (rgba8888 & -256));
                    }
                }
            }
            if (format == pixmap.getFormat()) {
                return pixmap;
            }
            Pixmap pixmap2 = new Pixmap(pixmap.getWidth(), pixmap.getHeight(), format);
            Pixmap.Blending blending = Pixmap.getBlending();
            Pixmap.setBlending(Pixmap.Blending.None);
            pixmap2.drawPixmap(pixmap, 0, 0);
            Pixmap.setBlending(blending);
            pixmap.dispose();
            return pixmap2;
        }

        public int getNumGray() {
            return getNumGray(this.address);
        }

        public int getPixelMode() {
            return getPixelMode(this.address);
        }
    }

    public static class GlyphMetrics extends Pointer {
        private static native int getHeight(long j);

        private static native int getHoriAdvance(long j);

        private static native int getHoriBearingX(long j);

        private static native int getHoriBearingY(long j);

        private static native int getVertAdvance(long j);

        private static native int getVertBearingX(long j);

        private static native int getVertBearingY(long j);

        private static native int getWidth(long j);

        GlyphMetrics(long j) {
            super(j);
        }

        public int getWidth() {
            return getWidth(this.address);
        }

        public int getHeight() {
            return getHeight(this.address);
        }

        public int getHoriBearingX() {
            return getHoriBearingX(this.address);
        }

        public int getHoriBearingY() {
            return getHoriBearingY(this.address);
        }

        public int getHoriAdvance() {
            return getHoriAdvance(this.address);
        }

        public int getVertBearingX() {
            return getVertBearingX(this.address);
        }

        public int getVertBearingY() {
            return getVertBearingY(this.address);
        }

        public int getVertAdvance() {
            return getVertAdvance(this.address);
        }
    }

    public static class Stroker extends Pointer implements Disposable {
        private static native void done(long j);

        private static native void set(long j, int i, int i2, int i3, int i4);

        Stroker(long j) {
            super(j);
        }

        public void set(int i, int i2, int i3, int i4) {
            set(this.address, i, i2, i3, i4);
        }

        @Override // com.badlogic.gdx.utils.Disposable
        public void dispose() {
            done(this.address);
        }
    }

    public static Library initFreeType() {
        new SharedLibraryLoader().load("gdx-freetype");
        long initFreeTypeJni = initFreeTypeJni();
        if (initFreeTypeJni != 0) {
            return new Library(initFreeTypeJni);
        }
        throw new GdxRuntimeException("Couldn't initialize FreeType library");
    }
}
