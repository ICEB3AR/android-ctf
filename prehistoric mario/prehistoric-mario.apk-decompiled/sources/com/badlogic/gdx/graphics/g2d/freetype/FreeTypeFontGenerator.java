package com.badlogic.gdx.graphics.g2d.freetype;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.graphics.g2d.PixmapPacker;
import com.badlogic.gdx.graphics.g2d.TextureRegion;
import com.badlogic.gdx.graphics.g2d.freetype.FreeType;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.IOException;
import java.io.InputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;

public class FreeTypeFontGenerator implements Disposable {
    public static final String DEFAULT_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890\"!`?'.,;:()[]{}<>|/@\\^$-%+=#_&~* ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ";
    public static final int NO_MAXIMUM = -1;
    private static int maxTextureSize = 1024;
    boolean bitmapped = false;
    final FreeType.Face face;
    final FreeType.Library library;
    final String name;
    private int pixelHeight;
    private int pixelWidth;

    public static class FreeTypeFontParameter {
        public Color borderColor = Color.BLACK;
        public boolean borderStraight = false;
        public float borderWidth = 0.0f;
        public String characters = FreeTypeFontGenerator.DEFAULT_CHARS;
        public Color color = Color.WHITE;
        public boolean flip = false;
        public boolean genMipMaps = false;
        public boolean incremental;
        public boolean kerning = true;
        public Texture.TextureFilter magFilter = Texture.TextureFilter.Nearest;
        public Texture.TextureFilter minFilter = Texture.TextureFilter.Nearest;
        public PixmapPacker packer = null;
        public Color shadowColor = new Color(0.0f, 0.0f, 0.0f, 0.75f);
        public int shadowOffsetX = 0;
        public int shadowOffsetY = 0;
        public int size = 16;
    }

    public FreeTypeFontGenerator(FileHandle fileHandle) {
        ByteBuffer byteBuffer;
        this.name = fileHandle.pathWithoutExtension();
        int length = (int) fileHandle.length();
        this.library = FreeType.initFreeType();
        if (this.library != null) {
            InputStream read = fileHandle.read();
            if (length == 0) {
                try {
                    byte[] copyStreamToByteArray = StreamUtils.copyStreamToByteArray(read, length > 0 ? (int) (((float) length) * 1.5f) : GL20.GL_COLOR_BUFFER_BIT);
                    byteBuffer = BufferUtils.newUnsafeByteBuffer(copyStreamToByteArray.length);
                    BufferUtils.copy(copyStreamToByteArray, 0, (Buffer) byteBuffer, copyStreamToByteArray.length);
                } catch (IOException e) {
                    throw new GdxRuntimeException(e);
                } catch (Throwable th) {
                    StreamUtils.closeQuietly(read);
                    throw th;
                }
            } else {
                byteBuffer = BufferUtils.newUnsafeByteBuffer(length);
                StreamUtils.copyStream(read, byteBuffer);
            }
            StreamUtils.closeQuietly(read);
            this.face = this.library.newMemoryFace(byteBuffer, 0);
            if (this.face == null) {
                throw new GdxRuntimeException("Couldn't create face for font: " + fileHandle);
            } else if (!checkForBitmapFont()) {
                setPixelSizes(0, 15);
            }
        } else {
            throw new GdxRuntimeException("Couldn't initialize FreeType");
        }
    }

    private boolean checkForBitmapFont() {
        if ((this.face.getFaceFlags() & FreeType.FT_FACE_FLAG_FIXED_SIZES) == FreeType.FT_FACE_FLAG_FIXED_SIZES && (this.face.getFaceFlags() & FreeType.FT_FACE_FLAG_HORIZONTAL) == FreeType.FT_FACE_FLAG_HORIZONTAL && this.face.loadChar(32, FreeType.FT_LOAD_DEFAULT) && this.face.getGlyph().getFormat() == 1651078259) {
            this.bitmapped = true;
        }
        return this.bitmapped;
    }

    public BitmapFont generateFont(int i, String str, boolean z) {
        FreeTypeBitmapFontData generateData = generateData(i, str, z, null);
        BitmapFont bitmapFont = new BitmapFont((BitmapFont.BitmapFontData) generateData, generateData.regions, false);
        bitmapFont.setOwnsTexture(true);
        return bitmapFont;
    }

    public BitmapFont generateFont(int i) {
        return generateFont(i, DEFAULT_CHARS, false);
    }

    public BitmapFont generateFont(FreeTypeFontParameter freeTypeFontParameter) {
        return generateFont(freeTypeFontParameter, new FreeTypeBitmapFontData());
    }

    public BitmapFont generateFont(FreeTypeFontParameter freeTypeFontParameter, FreeTypeBitmapFontData freeTypeBitmapFontData) {
        generateData(freeTypeFontParameter, freeTypeBitmapFontData);
        if (freeTypeBitmapFontData.regions == null && freeTypeFontParameter.packer != null) {
            freeTypeBitmapFontData.regions = new Array<>();
            freeTypeFontParameter.packer.updateTextureRegions(freeTypeBitmapFontData.regions, freeTypeFontParameter.minFilter, freeTypeFontParameter.magFilter, freeTypeFontParameter.genMipMaps);
        }
        boolean z = false;
        BitmapFont bitmapFont = new BitmapFont((BitmapFont.BitmapFontData) freeTypeBitmapFontData, freeTypeBitmapFontData.regions, false);
        if (freeTypeFontParameter.packer == null) {
            z = true;
        }
        bitmapFont.setOwnsTexture(z);
        return bitmapFont;
    }

    public int scaleForPixelHeight(int i) {
        setPixelSizes(0, i);
        FreeType.SizeMetrics metrics = this.face.getSize().getMetrics();
        return (i * i) / (FreeType.toInt(metrics.getAscender()) - FreeType.toInt(metrics.getDescender()));
    }

    public int scaleForPixelWidth(int i, int i2) {
        FreeType.SizeMetrics metrics = this.face.getSize().getMetrics();
        int i3 = ((FreeType.toInt(metrics.getAscender()) - FreeType.toInt(metrics.getDescender())) * i) / (FreeType.toInt(metrics.getMaxAdvance()) * i2);
        setPixelSizes(0, i3);
        return i3;
    }

    public int scaleToFitSquare(int i, int i2, int i3) {
        return Math.min(scaleForPixelHeight(i2), scaleForPixelWidth(i, i3));
    }

    public class GlyphAndBitmap {
        public FreeType.Bitmap bitmap;
        public BitmapFont.Glyph glyph;

        public GlyphAndBitmap() {
        }
    }

    public GlyphAndBitmap generateGlyphAndBitmap(int i, int i2, boolean z) {
        setPixelSizes(0, i2);
        int i3 = FreeType.toInt(this.face.getSize().getMetrics().getAscender());
        FreeType.Bitmap bitmap = null;
        if (this.face.getCharIndex(i) == 0) {
            return null;
        }
        if (this.face.loadChar(i, FreeType.FT_LOAD_DEFAULT)) {
            FreeType.GlyphSlot glyph = this.face.getGlyph();
            if (this.bitmapped) {
                bitmap = glyph.getBitmap();
            } else if (glyph.renderGlyph(FreeType.FT_RENDER_MODE_LIGHT)) {
                bitmap = glyph.getBitmap();
            }
            FreeType.GlyphMetrics metrics = glyph.getMetrics();
            BitmapFont.Glyph glyph2 = new BitmapFont.Glyph();
            if (bitmap != null) {
                glyph2.width = bitmap.getWidth();
                glyph2.height = bitmap.getRows();
            } else {
                glyph2.width = 0;
                glyph2.height = 0;
            }
            glyph2.xoffset = glyph.getBitmapLeft();
            glyph2.yoffset = z ? (-glyph.getBitmapTop()) + i3 : (-(glyph2.height - glyph.getBitmapTop())) - i3;
            glyph2.xadvance = FreeType.toInt(metrics.getHoriAdvance());
            glyph2.srcX = 0;
            glyph2.srcY = 0;
            glyph2.id = i;
            GlyphAndBitmap glyphAndBitmap = new GlyphAndBitmap();
            glyphAndBitmap.glyph = glyph2;
            glyphAndBitmap.bitmap = bitmap;
            return glyphAndBitmap;
        }
        throw new GdxRuntimeException("Unable to load character!");
    }

    public FreeTypeBitmapFontData generateData(int i) {
        return generateData(i, DEFAULT_CHARS, false, null);
    }

    public FreeTypeBitmapFontData generateData(int i, String str, boolean z) {
        return generateData(i, str, z, null);
    }

    public FreeTypeBitmapFontData generateData(int i, String str, boolean z, PixmapPacker pixmapPacker) {
        FreeTypeFontParameter freeTypeFontParameter = new FreeTypeFontParameter();
        freeTypeFontParameter.size = i;
        freeTypeFontParameter.characters = str;
        freeTypeFontParameter.flip = z;
        freeTypeFontParameter.packer = pixmapPacker;
        return generateData(freeTypeFontParameter);
    }

    public FreeTypeBitmapFontData generateData(FreeTypeFontParameter freeTypeFontParameter) {
        return generateData(freeTypeFontParameter, new FreeTypeBitmapFontData());
    }

    /* access modifiers changed from: package-private */
    public void setPixelSizes(int i, int i2) {
        this.pixelWidth = i;
        this.pixelHeight = i2;
        if (!this.bitmapped && !this.face.setPixelSizes(i, i2)) {
            throw new GdxRuntimeException("Couldn't set size for font");
        }
    }

    public FreeTypeBitmapFontData generateData(FreeTypeFontParameter freeTypeFontParameter, FreeTypeBitmapFontData freeTypeBitmapFontData) {
        boolean z;
        PixmapPacker pixmapPacker;
        int i;
        FreeTypeFontParameter freeTypeFontParameter2 = freeTypeFontParameter == null ? new FreeTypeFontParameter() : freeTypeFontParameter;
        String str = freeTypeFontParameter2.characters;
        int length = str.length();
        boolean z2 = freeTypeFontParameter2.incremental;
        setPixelSizes(0, freeTypeFontParameter2.size);
        FreeType.SizeMetrics metrics = this.face.getSize().getMetrics();
        freeTypeBitmapFontData.flipped = freeTypeFontParameter2.flip;
        freeTypeBitmapFontData.ascent = (float) FreeType.toInt(metrics.getAscender());
        freeTypeBitmapFontData.descent = (float) FreeType.toInt(metrics.getDescender());
        freeTypeBitmapFontData.lineHeight = (float) FreeType.toInt(metrics.getHeight());
        float f = freeTypeBitmapFontData.ascent;
        if (this.bitmapped && freeTypeBitmapFontData.lineHeight == 0.0f) {
            for (int i2 = 32; i2 < this.face.getNumGlyphs() + 32; i2++) {
                if (this.face.loadChar(i2, FreeType.FT_LOAD_DEFAULT)) {
                    float f2 = (float) FreeType.toInt(this.face.getGlyph().getMetrics().getHeight());
                    if (f2 <= freeTypeBitmapFontData.lineHeight) {
                        f2 = freeTypeBitmapFontData.lineHeight;
                    }
                    freeTypeBitmapFontData.lineHeight = f2;
                }
            }
        }
        if (this.face.loadChar(32, FreeType.FT_LOAD_DEFAULT)) {
            freeTypeBitmapFontData.spaceWidth = (float) FreeType.toInt(this.face.getGlyph().getMetrics().getHoriAdvance());
        } else {
            freeTypeBitmapFontData.spaceWidth = (float) this.face.getMaxAdvanceWidth();
        }
        BitmapFont.Glyph glyph = new BitmapFont.Glyph();
        glyph.xadvance = (int) freeTypeBitmapFontData.spaceWidth;
        glyph.id = 32;
        freeTypeBitmapFontData.setGlyph(32, glyph);
        char[] cArr = freeTypeBitmapFontData.xChars;
        int length2 = cArr.length;
        int i3 = 0;
        while (true) {
            if (i3 >= length2) {
                break;
            }
            if (this.face.loadChar(cArr[i3], FreeType.FT_LOAD_DEFAULT)) {
                freeTypeBitmapFontData.xHeight = (float) FreeType.toInt(this.face.getGlyph().getMetrics().getHeight());
                break;
            }
            i3++;
        }
        if (freeTypeBitmapFontData.xHeight != 0.0f) {
            char[] cArr2 = freeTypeBitmapFontData.capChars;
            int length3 = cArr2.length;
            int i4 = 0;
            while (true) {
                if (i4 >= length3) {
                    break;
                }
                if (this.face.loadChar(cArr2[i4], FreeType.FT_LOAD_DEFAULT)) {
                    freeTypeBitmapFontData.capHeight = (float) FreeType.toInt(this.face.getGlyph().getMetrics().getHeight());
                    break;
                }
                i4++;
            }
            if (this.bitmapped || freeTypeBitmapFontData.capHeight != 1.0f) {
                freeTypeBitmapFontData.ascent -= freeTypeBitmapFontData.capHeight;
                freeTypeBitmapFontData.down = -freeTypeBitmapFontData.lineHeight;
                if (freeTypeFontParameter2.flip) {
                    freeTypeBitmapFontData.ascent = -freeTypeBitmapFontData.ascent;
                    freeTypeBitmapFontData.down = -freeTypeBitmapFontData.down;
                }
                PixmapPacker pixmapPacker2 = freeTypeFontParameter2.packer;
                if (pixmapPacker2 == null) {
                    if (z2) {
                        i = maxTextureSize;
                    } else {
                        int ceil = (int) Math.ceil((double) freeTypeBitmapFontData.lineHeight);
                        i = MathUtils.nextPowerOfTwo((int) Math.sqrt((double) (ceil * ceil * length)));
                        int i5 = maxTextureSize;
                        if (i5 > 0) {
                            i = Math.min(i, i5);
                        }
                    }
                    pixmapPacker = new PixmapPacker(i, i, Pixmap.Format.RGBA8888, 2, false);
                    z = true;
                } else {
                    pixmapPacker = pixmapPacker2;
                    z = false;
                }
                FreeType.Stroker stroker = null;
                if (freeTypeFontParameter2.borderWidth > 0.0f) {
                    stroker = this.library.createStroker();
                    stroker.set((int) (freeTypeFontParameter2.borderWidth * 64.0f), freeTypeFontParameter2.borderStraight ? FreeType.FT_STROKER_LINECAP_BUTT : FreeType.FT_STROKER_LINECAP_ROUND, freeTypeFontParameter2.borderStraight ? FreeType.FT_STROKER_LINEJOIN_MITER_FIXED : FreeType.FT_STROKER_LINEJOIN_ROUND, 0);
                }
                FreeType.Stroker stroker2 = stroker;
                if (z2) {
                    freeTypeBitmapFontData.generator = this;
                    freeTypeBitmapFontData.parameter = freeTypeFontParameter2;
                    freeTypeBitmapFontData.stroker = stroker2;
                    freeTypeBitmapFontData.packer = pixmapPacker;
                    freeTypeBitmapFontData.glyphs = new Array<>(length + 32);
                }
                int i6 = 0;
                while (i6 < length) {
                    char charAt = str.charAt(i6);
                    BitmapFont.Glyph createGlyph = createGlyph(charAt, freeTypeBitmapFontData, freeTypeFontParameter2, stroker2, f, pixmapPacker);
                    if (createGlyph != null) {
                        freeTypeBitmapFontData.setGlyph(charAt, createGlyph);
                        if (z2) {
                            freeTypeBitmapFontData.glyphs.add(createGlyph);
                        }
                    }
                    i6++;
                    stroker2 = stroker2;
                }
                if (stroker2 != null && !z2) {
                    stroker2.dispose();
                }
                if (freeTypeFontParameter2.kerning) {
                    for (int i7 = 0; i7 < length; i7++) {
                        char charAt2 = str.charAt(i7);
                        BitmapFont.Glyph glyph2 = freeTypeBitmapFontData.getGlyph(charAt2);
                        if (glyph2 != null) {
                            int charIndex = this.face.getCharIndex(charAt2);
                            for (int i8 = i7; i8 < length; i8++) {
                                char charAt3 = str.charAt(i8);
                                BitmapFont.Glyph glyph3 = freeTypeBitmapFontData.getGlyph(charAt3);
                                if (glyph3 != null) {
                                    int charIndex2 = this.face.getCharIndex(charAt3);
                                    int kerning = this.face.getKerning(charIndex, charIndex2, 0);
                                    if (kerning != 0) {
                                        glyph2.setKerning(charAt3, FreeType.toInt(kerning));
                                    }
                                    int kerning2 = this.face.getKerning(charIndex2, charIndex, 0);
                                    if (kerning2 != 0) {
                                        glyph3.setKerning(charAt2, FreeType.toInt(kerning2));
                                    }
                                }
                            }
                        }
                    }
                }
                if (z) {
                    freeTypeBitmapFontData.regions = new Array<>();
                    pixmapPacker.updateTextureRegions(freeTypeBitmapFontData.regions, freeTypeFontParameter2.minFilter, freeTypeFontParameter2.magFilter, freeTypeFontParameter2.genMipMaps);
                }
                return freeTypeBitmapFontData;
            }
            throw new GdxRuntimeException("No cap character found in font");
        }
        throw new GdxRuntimeException("No x-height character found in font");
    }

    /* access modifiers changed from: package-private */
    public BitmapFont.Glyph createGlyph(char c, FreeTypeBitmapFontData freeTypeBitmapFontData, FreeTypeFontParameter freeTypeFontParameter, FreeType.Stroker stroker, float f, PixmapPacker pixmapPacker) {
        FreeType.Bitmap bitmap;
        BitmapFont.Glyph glyph;
        boolean z = this.face.getCharIndex(c) == 0;
        if (z && (glyph = freeTypeBitmapFontData.getGlyph(0)) != null) {
            return glyph;
        }
        if (!this.face.loadChar(c, FreeType.FT_LOAD_DEFAULT)) {
            Application application = Gdx.app;
            application.log("FreeTypeFontGenerator", "Couldn't load char '" + c + "'");
            return null;
        }
        FreeType.GlyphSlot glyph2 = this.face.getGlyph();
        FreeType.Glyph glyph3 = glyph2.getGlyph();
        try {
            glyph3.toBitmap(FreeType.FT_RENDER_MODE_NORMAL);
            FreeType.Bitmap bitmap2 = glyph3.getBitmap();
            Pixmap pixmap = bitmap2.getPixmap(Pixmap.Format.RGBA8888, freeTypeFontParameter.color);
            if (!(freeTypeFontParameter.borderWidth <= 0.0f && freeTypeFontParameter.shadowOffsetX == 0 && freeTypeFontParameter.shadowOffsetY == 0)) {
                if (freeTypeFontParameter.borderWidth > 0.0f) {
                    FreeType.Glyph glyph4 = glyph2.getGlyph();
                    glyph4.strokeBorder(stroker, false);
                    glyph4.toBitmap(FreeType.FT_RENDER_MODE_NORMAL);
                    bitmap = glyph4.getBitmap();
                    Pixmap pixmap2 = bitmap.getPixmap(Pixmap.Format.RGBA8888, freeTypeFontParameter.borderColor);
                    pixmap2.drawPixmap(pixmap, glyph3.getLeft() - glyph4.getLeft(), -(glyph3.getTop() - glyph4.getTop()));
                    pixmap.dispose();
                    glyph3.dispose();
                    pixmap = pixmap2;
                    glyph3 = glyph4;
                } else {
                    bitmap = bitmap2;
                }
                if (!(freeTypeFontParameter.shadowOffsetX == 0 && freeTypeFontParameter.shadowOffsetY == 0)) {
                    Pixmap pixmap3 = bitmap.getPixmap(Pixmap.Format.RGBA8888, freeTypeFontParameter.shadowColor);
                    Pixmap pixmap4 = new Pixmap(pixmap3.getWidth() + Math.abs(freeTypeFontParameter.shadowOffsetX), pixmap3.getHeight() + Math.abs(freeTypeFontParameter.shadowOffsetY), Pixmap.Format.RGBA8888);
                    Pixmap.Blending blending = Pixmap.getBlending();
                    Pixmap.setBlending(Pixmap.Blending.None);
                    pixmap4.drawPixmap(pixmap3, Math.max(freeTypeFontParameter.shadowOffsetX, 0), Math.max(freeTypeFontParameter.shadowOffsetY, 0));
                    Pixmap.setBlending(blending);
                    pixmap4.drawPixmap(pixmap, Math.max(-freeTypeFontParameter.shadowOffsetX, 0), Math.max(-freeTypeFontParameter.shadowOffsetY, 0));
                    pixmap.dispose();
                    glyph3 = glyph3;
                    pixmap = pixmap4;
                }
            }
            FreeType.GlyphMetrics metrics = glyph2.getMetrics();
            BitmapFont.Glyph glyph5 = new BitmapFont.Glyph();
            glyph5.id = c;
            glyph5.width = pixmap.getWidth();
            glyph5.height = pixmap.getHeight();
            glyph5.xoffset = glyph3.getLeft();
            glyph5.yoffset = freeTypeFontParameter.flip ? (-glyph3.getTop()) + ((int) f) : (-(glyph5.height - glyph3.getTop())) - ((int) f);
            glyph5.xadvance = FreeType.toInt(metrics.getHoriAdvance()) + ((int) freeTypeFontParameter.borderWidth);
            if (this.bitmapped) {
                pixmap.setColor(Color.CLEAR);
                pixmap.fill();
                ByteBuffer buffer = bitmap2.getBuffer();
                int intBits = Color.WHITE.toIntBits();
                int intBits2 = Color.CLEAR.toIntBits();
                for (int i = 0; i < glyph5.height; i++) {
                    int pitch = bitmap2.getPitch() * i;
                    for (int i2 = 0; i2 < glyph5.width + glyph5.xoffset; i2++) {
                        pixmap.drawPixel(i2, i, ((buffer.get((i2 / 8) + pitch) >>> (7 - (i2 % 8))) & 1) == 1 ? intBits : intBits2);
                    }
                }
            }
            Rectangle pack = pixmapPacker.pack(pixmap);
            glyph5.page = pixmapPacker.getPages().size - 1;
            glyph5.srcX = (int) pack.x;
            glyph5.srcY = (int) pack.y;
            if (freeTypeFontParameter.incremental && freeTypeBitmapFontData.regions != null && freeTypeBitmapFontData.regions.size <= glyph5.page) {
                pixmapPacker.updateTextureRegions(freeTypeBitmapFontData.regions, freeTypeFontParameter.minFilter, freeTypeFontParameter.magFilter, freeTypeFontParameter.genMipMaps);
            }
            pixmap.dispose();
            glyph3.dispose();
            if (z) {
                freeTypeBitmapFontData.setGlyph(0, glyph5);
            }
            return glyph5;
        } catch (GdxRuntimeException unused) {
            glyph3.dispose();
            Application application2 = Gdx.app;
            application2.log("FreeTypeFontGenerator", "Couldn't render char '" + c + "'");
            return null;
        }
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.face.dispose();
        this.library.dispose();
    }

    public static void setMaxTextureSize(int i) {
        maxTextureSize = i;
    }

    public static int getMaxTextureSize() {
        return maxTextureSize;
    }

    public static class FreeTypeBitmapFontData extends BitmapFont.BitmapFontData implements Disposable {
        FreeTypeFontGenerator generator;
        Array<BitmapFont.Glyph> glyphs;
        PixmapPacker packer;
        FreeTypeFontParameter parameter;
        Array<TextureRegion> regions;
        FreeType.Stroker stroker;

        @Override // com.badlogic.gdx.graphics.g2d.BitmapFont.BitmapFontData
        public BitmapFont.Glyph getGlyph(char c) {
            FreeTypeFontGenerator freeTypeFontGenerator;
            BitmapFont.Glyph glyph = super.getGlyph(c);
            if (!(glyph != null || (freeTypeFontGenerator = this.generator) == null || c == 0)) {
                freeTypeFontGenerator.setPixelSizes(0, this.parameter.size);
                glyph = this.generator.createGlyph(c, this, this.parameter, this.stroker, (this.ascent + this.capHeight) / this.scaleY, this.packer);
                if (glyph == null) {
                    return null;
                }
                setGlyph(c, glyph);
                setGlyphRegion(glyph, this.regions.get(glyph.page));
                this.glyphs.add(glyph);
                if (this.parameter.kerning) {
                    FreeType.Face face = this.generator.face;
                    int charIndex = face.getCharIndex(c);
                    int i = this.glyphs.size;
                    for (int i2 = 0; i2 < i; i2++) {
                        BitmapFont.Glyph glyph2 = this.glyphs.get(i2);
                        int charIndex2 = face.getCharIndex(glyph2.id);
                        int kerning = face.getKerning(charIndex, charIndex2, 0);
                        if (kerning != 0) {
                            glyph.setKerning(glyph2.id, FreeType.toInt(kerning));
                        }
                        int kerning2 = face.getKerning(charIndex2, charIndex, 0);
                        if (kerning2 != 0) {
                            glyph2.setKerning(c, FreeType.toInt(kerning2));
                        }
                    }
                }
            }
            return glyph;
        }

        public void getGlyphs(GlyphLayout.GlyphRun glyphRun, CharSequence charSequence, int i, int i2) {
            PixmapPacker pixmapPacker = this.packer;
            if (pixmapPacker != null) {
                pixmapPacker.setPackToTexture(true);
            }
            super.getGlyphs(glyphRun, charSequence, i, i2);
        }

        @Override // com.badlogic.gdx.utils.Disposable
        public void dispose() {
            FreeType.Stroker stroker2 = this.stroker;
            if (stroker2 != null) {
                stroker2.dispose();
            }
            PixmapPacker pixmapPacker = this.packer;
            if (pixmapPacker != null) {
                pixmapPacker.dispose();
            }
        }
    }
}
