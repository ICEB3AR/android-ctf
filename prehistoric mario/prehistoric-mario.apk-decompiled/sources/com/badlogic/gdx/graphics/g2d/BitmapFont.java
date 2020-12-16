package com.badlogic.gdx.graphics.g2d;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.graphics.g2d.TextureAtlas;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.GdxRuntimeException;

public class BitmapFont implements Disposable {
    private static final int LOG2_PAGE_SIZE = 9;
    private static final int PAGES = 128;
    private static final int PAGE_SIZE = 512;
    private final BitmapFontCache cache;
    final BitmapFontData data;
    private boolean flipped;
    boolean integer;
    private boolean ownsTexture;
    Array<TextureRegion> regions;

    public BitmapFont() {
        this(Gdx.files.classpath("com/badlogic/gdx/utils/arial-15.fnt"), Gdx.files.classpath("com/badlogic/gdx/utils/arial-15.png"), false, true);
    }

    public BitmapFont(boolean z) {
        this(Gdx.files.classpath("com/badlogic/gdx/utils/arial-15.fnt"), Gdx.files.classpath("com/badlogic/gdx/utils/arial-15.png"), z, true);
    }

    public BitmapFont(FileHandle fileHandle, TextureRegion textureRegion) {
        this(fileHandle, textureRegion, false);
    }

    public BitmapFont(FileHandle fileHandle, TextureRegion textureRegion, boolean z) {
        this(new BitmapFontData(fileHandle, z), textureRegion, true);
    }

    public BitmapFont(FileHandle fileHandle) {
        this(fileHandle, false);
    }

    public BitmapFont(FileHandle fileHandle, boolean z) {
        this(new BitmapFontData(fileHandle, z), (TextureRegion) null, true);
    }

    public BitmapFont(FileHandle fileHandle, FileHandle fileHandle2, boolean z) {
        this(fileHandle, fileHandle2, z, true);
    }

    public BitmapFont(FileHandle fileHandle, FileHandle fileHandle2, boolean z, boolean z2) {
        this(new BitmapFontData(fileHandle, z), new TextureRegion(new Texture(fileHandle2, false)), z2);
        this.ownsTexture = true;
    }

    /* JADX WARNING: Illegal instructions before constructor call */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public BitmapFont(com.badlogic.gdx.graphics.g2d.BitmapFont.BitmapFontData r3, com.badlogic.gdx.graphics.g2d.TextureRegion r4, boolean r5) {
        /*
            r2 = this;
            if (r4 == 0) goto L_0x000d
            r0 = 1
            com.badlogic.gdx.graphics.g2d.TextureRegion[] r0 = new com.badlogic.gdx.graphics.g2d.TextureRegion[r0]
            r1 = 0
            r0[r1] = r4
            com.badlogic.gdx.utils.Array r4 = com.badlogic.gdx.utils.Array.with(r0)
            goto L_0x000e
        L_0x000d:
            r4 = 0
        L_0x000e:
            r2.<init>(r3, r4, r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g2d.BitmapFont.<init>(com.badlogic.gdx.graphics.g2d.BitmapFont$BitmapFontData, com.badlogic.gdx.graphics.g2d.TextureRegion, boolean):void");
    }

    public BitmapFont(BitmapFontData bitmapFontData, Array<TextureRegion> array, boolean z) {
        FileHandle fileHandle;
        this.flipped = bitmapFontData.flipped;
        this.data = bitmapFontData;
        this.integer = z;
        if (array != null && array.size != 0) {
            this.regions = array;
            this.ownsTexture = false;
        } else if (bitmapFontData.imagePaths != null) {
            int length = bitmapFontData.imagePaths.length;
            this.regions = new Array<>(length);
            for (int i = 0; i < length; i++) {
                if (bitmapFontData.fontFile == null) {
                    fileHandle = Gdx.files.internal(bitmapFontData.imagePaths[i]);
                } else {
                    fileHandle = Gdx.files.getFileHandle(bitmapFontData.imagePaths[i], bitmapFontData.fontFile.type());
                }
                this.regions.add(new TextureRegion(new Texture(fileHandle, false)));
            }
            this.ownsTexture = true;
        } else {
            throw new IllegalArgumentException("If no regions are specified, the font data must have an images path.");
        }
        this.cache = newFontCache();
        load(bitmapFontData);
    }

    /* access modifiers changed from: protected */
    public void load(BitmapFontData bitmapFontData) {
        Glyph[][] glyphArr = bitmapFontData.glyphs;
        for (Glyph[] glyphArr2 : glyphArr) {
            if (glyphArr2 != null) {
                for (Glyph glyph : glyphArr2) {
                    if (glyph != null) {
                        bitmapFontData.setGlyphRegion(glyph, this.regions.get(glyph.page));
                    }
                }
            }
        }
        if (bitmapFontData.missingGlyph != null) {
            bitmapFontData.setGlyphRegion(bitmapFontData.missingGlyph, this.regions.get(bitmapFontData.missingGlyph.page));
        }
    }

    public GlyphLayout draw(Batch batch, CharSequence charSequence, float f, float f2) {
        this.cache.clear();
        GlyphLayout addText = this.cache.addText(charSequence, f, f2);
        this.cache.draw(batch);
        return addText;
    }

    public GlyphLayout draw(Batch batch, CharSequence charSequence, float f, float f2, float f3, int i, boolean z) {
        this.cache.clear();
        GlyphLayout addText = this.cache.addText(charSequence, f, f2, f3, i, z);
        this.cache.draw(batch);
        return addText;
    }

    public GlyphLayout draw(Batch batch, CharSequence charSequence, float f, float f2, int i, int i2, float f3, int i3, boolean z) {
        this.cache.clear();
        GlyphLayout addText = this.cache.addText(charSequence, f, f2, i, i2, f3, i3, z);
        this.cache.draw(batch);
        return addText;
    }

    public GlyphLayout draw(Batch batch, CharSequence charSequence, float f, float f2, int i, int i2, float f3, int i3, boolean z, String str) {
        this.cache.clear();
        GlyphLayout addText = this.cache.addText(charSequence, f, f2, i, i2, f3, i3, z, str);
        this.cache.draw(batch);
        return addText;
    }

    public void draw(Batch batch, GlyphLayout glyphLayout, float f, float f2) {
        this.cache.clear();
        this.cache.addText(glyphLayout, f, f2);
        this.cache.draw(batch);
    }

    public Color getColor() {
        return this.cache.getColor();
    }

    public void setColor(Color color) {
        this.cache.getColor().set(color);
    }

    public void setColor(float f, float f2, float f3, float f4) {
        this.cache.getColor().set(f, f2, f3, f4);
    }

    public float getScaleX() {
        return this.data.scaleX;
    }

    public float getScaleY() {
        return this.data.scaleY;
    }

    public TextureRegion getRegion() {
        return this.regions.first();
    }

    public Array<TextureRegion> getRegions() {
        return this.regions;
    }

    public TextureRegion getRegion(int i) {
        return this.regions.get(i);
    }

    public float getLineHeight() {
        return this.data.lineHeight;
    }

    public float getSpaceXadvance() {
        return this.data.spaceXadvance;
    }

    public float getXHeight() {
        return this.data.xHeight;
    }

    public float getCapHeight() {
        return this.data.capHeight;
    }

    public float getAscent() {
        return this.data.ascent;
    }

    public float getDescent() {
        return this.data.descent;
    }

    public boolean isFlipped() {
        return this.flipped;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        if (this.ownsTexture) {
            for (int i = 0; i < this.regions.size; i++) {
                this.regions.get(i).getTexture().dispose();
            }
        }
    }

    public void setFixedWidthGlyphs(CharSequence charSequence) {
        BitmapFontData bitmapFontData = this.data;
        int length = charSequence.length();
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            Glyph glyph = bitmapFontData.getGlyph(charSequence.charAt(i2));
            if (glyph != null && glyph.xadvance > i) {
                i = glyph.xadvance;
            }
        }
        int length2 = charSequence.length();
        for (int i3 = 0; i3 < length2; i3++) {
            Glyph glyph2 = bitmapFontData.getGlyph(charSequence.charAt(i3));
            if (glyph2 != null) {
                glyph2.xoffset += Math.round((float) ((i - glyph2.xadvance) / 2));
                glyph2.xadvance = i;
                glyph2.kerning = null;
                glyph2.fixedWidth = true;
            }
        }
    }

    public void setUseIntegerPositions(boolean z) {
        this.integer = z;
        this.cache.setUseIntegerPositions(z);
    }

    public boolean usesIntegerPositions() {
        return this.integer;
    }

    public BitmapFontCache getCache() {
        return this.cache;
    }

    public BitmapFontData getData() {
        return this.data;
    }

    public boolean ownsTexture() {
        return this.ownsTexture;
    }

    public void setOwnsTexture(boolean z) {
        this.ownsTexture = z;
    }

    public BitmapFontCache newFontCache() {
        return new BitmapFontCache(this, this.integer);
    }

    public String toString() {
        return this.data.name != null ? this.data.name : super.toString();
    }

    public static class Glyph {
        public boolean fixedWidth;
        public int height;
        public int id;
        public byte[][] kerning;
        public int page = 0;
        public int srcX;
        public int srcY;
        public float u;
        public float u2;
        public float v;
        public float v2;
        public int width;
        public int xadvance;
        public int xoffset;
        public int yoffset;

        public int getKerning(char c) {
            byte[] bArr;
            byte[][] bArr2 = this.kerning;
            if (bArr2 == null || (bArr = bArr2[c >>> '\t']) == null) {
                return 0;
            }
            return bArr[c & 511];
        }

        public void setKerning(int i, int i2) {
            if (this.kerning == null) {
                this.kerning = new byte[128][];
            }
            byte[][] bArr = this.kerning;
            int i3 = i >>> 9;
            byte[] bArr2 = bArr[i3];
            if (bArr2 == null) {
                bArr2 = new byte[512];
                bArr[i3] = bArr2;
            }
            bArr2[i & 511] = (byte) i2;
        }

        public String toString() {
            return Character.toString((char) this.id);
        }
    }

    static int indexOf(CharSequence charSequence, char c, int i) {
        int length = charSequence.length();
        while (i < length) {
            if (charSequence.charAt(i) == c) {
                return i;
            }
            i++;
        }
        return length;
    }

    public static class BitmapFontData {
        public float ascent;
        public float blankLineScale;
        public char[] breakChars;
        public char[] capChars;
        public float capHeight;
        public float cursorX;
        public float descent;
        public float down;
        public boolean flipped;
        public FileHandle fontFile;
        public final Glyph[][] glyphs;
        public String[] imagePaths;
        public float lineHeight;
        public boolean markupEnabled;
        public Glyph missingGlyph;
        public String name;
        public float padBottom;
        public float padLeft;
        public float padRight;
        public float padTop;
        public float scaleX;
        public float scaleY;
        public float spaceXadvance;
        public char[] xChars;
        public float xHeight;

        public boolean isWhitespace(char c) {
            return c == '\t' || c == '\n' || c == '\r' || c == ' ';
        }

        public BitmapFontData() {
            this.capHeight = 1.0f;
            this.blankLineScale = 1.0f;
            this.scaleX = 1.0f;
            this.scaleY = 1.0f;
            this.glyphs = new Glyph[128][];
            this.xHeight = 1.0f;
            this.xChars = new char[]{'x', 'e', 'a', 'o', 'n', 's', 'r', 'c', 'u', 'm', 'v', 'w', 'z'};
            this.capChars = new char[]{'M', 'N', 'B', 'D', 'C', 'E', 'F', 'K', 'A', 'G', 'H', 'I', 'J', 'L', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        }

        public BitmapFontData(FileHandle fileHandle, boolean z) {
            this.capHeight = 1.0f;
            this.blankLineScale = 1.0f;
            this.scaleX = 1.0f;
            this.scaleY = 1.0f;
            this.glyphs = new Glyph[128][];
            this.xHeight = 1.0f;
            this.xChars = new char[]{'x', 'e', 'a', 'o', 'n', 's', 'r', 'c', 'u', 'm', 'v', 'w', 'z'};
            this.capChars = new char[]{'M', 'N', 'B', 'D', 'C', 'E', 'F', 'K', 'A', 'G', 'H', 'I', 'J', 'L', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
            this.fontFile = fileHandle;
            this.flipped = z;
            load(fileHandle, z);
        }

        /* JADX WARNING: Removed duplicated region for block: B:110:0x02d1 A[Catch:{ Exception -> 0x0454 }] */
        /* JADX WARNING: Removed duplicated region for block: B:113:0x02e9 A[Catch:{ Exception -> 0x0454 }] */
        /* JADX WARNING: Removed duplicated region for block: B:115:0x02f5 A[Catch:{ Exception -> 0x0454 }] */
        /* JADX WARNING: Removed duplicated region for block: B:125:0x0342  */
        /* JADX WARNING: Removed duplicated region for block: B:130:0x0359  */
        /* JADX WARNING: Removed duplicated region for block: B:186:0x0354 A[SYNTHETIC] */
        /* JADX WARNING: Removed duplicated region for block: B:197:0x0345 A[SYNTHETIC] */
        /* JADX WARNING: Removed duplicated region for block: B:28:0x00d8  */
        /* JADX WARNING: Removed duplicated region for block: B:68:0x020f  */
        /* JADX WARNING: Removed duplicated region for block: B:74:0x022d  */
        /* JADX WARNING: Removed duplicated region for block: B:77:0x024c  */
        /* JADX WARNING: Removed duplicated region for block: B:81:0x025e  */
        /* JADX WARNING: Removed duplicated region for block: B:84:0x0272  */
        /* JADX WARNING: Removed duplicated region for block: B:89:0x0286  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void load(com.badlogic.gdx.files.FileHandle r23, boolean r24) {
            /*
            // Method dump skipped, instructions count: 1160
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g2d.BitmapFont.BitmapFontData.load(com.badlogic.gdx.files.FileHandle, boolean):void");
        }

        public void setGlyphRegion(Glyph glyph, TextureRegion textureRegion) {
            float f;
            float f2;
            float f3;
            Texture texture = textureRegion.getTexture();
            float width = 1.0f / ((float) texture.getWidth());
            float height = 1.0f / ((float) texture.getHeight());
            float f4 = textureRegion.u;
            float f5 = textureRegion.v;
            float regionWidth = (float) textureRegion.getRegionWidth();
            float regionHeight = (float) textureRegion.getRegionHeight();
            if (textureRegion instanceof TextureAtlas.AtlasRegion) {
                TextureAtlas.AtlasRegion atlasRegion = (TextureAtlas.AtlasRegion) textureRegion;
                f2 = atlasRegion.offsetX;
                f = ((float) (atlasRegion.originalHeight - atlasRegion.packedHeight)) - atlasRegion.offsetY;
            } else {
                f = 0.0f;
                f2 = 0.0f;
            }
            float f6 = (float) glyph.srcX;
            float f7 = (float) (glyph.srcX + glyph.width);
            float f8 = (float) glyph.srcY;
            float f9 = (float) (glyph.srcY + glyph.height);
            if (f2 > 0.0f) {
                f6 -= f2;
                if (f6 < 0.0f) {
                    glyph.width = (int) (((float) glyph.width) + f6);
                    glyph.xoffset = (int) (((float) glyph.xoffset) - f6);
                    f6 = 0.0f;
                }
                float f10 = f7 - f2;
                if (f10 > regionWidth) {
                    glyph.width = (int) (((float) glyph.width) - (f10 - regionWidth));
                } else {
                    regionWidth = f10;
                }
            } else {
                regionWidth = f7;
            }
            if (f > 0.0f) {
                float f11 = f8 - f;
                if (f11 < 0.0f) {
                    glyph.height = (int) (((float) glyph.height) + f11);
                    if (glyph.height < 0) {
                        glyph.height = 0;
                    }
                    f8 = 0.0f;
                } else {
                    f8 = f11;
                }
                f3 = f9 - f;
                if (f3 > regionHeight) {
                    float f12 = f3 - regionHeight;
                    glyph.height = (int) (((float) glyph.height) - f12);
                    glyph.yoffset = (int) (((float) glyph.yoffset) + f12);
                    f3 = regionHeight;
                }
            } else {
                f3 = f9;
            }
            glyph.u = (f6 * width) + f4;
            glyph.u2 = f4 + (regionWidth * width);
            if (this.flipped) {
                glyph.v = (f8 * height) + f5;
                glyph.v2 = f5 + (f3 * height);
                return;
            }
            glyph.v2 = (f8 * height) + f5;
            glyph.v = f5 + (f3 * height);
        }

        public void setLineHeight(float f) {
            this.lineHeight = f * this.scaleY;
            this.down = this.flipped ? this.lineHeight : -this.lineHeight;
        }

        public void setGlyph(int i, Glyph glyph) {
            Glyph[][] glyphArr = this.glyphs;
            int i2 = i / 512;
            Glyph[] glyphArr2 = glyphArr[i2];
            if (glyphArr2 == null) {
                glyphArr2 = new Glyph[512];
                glyphArr[i2] = glyphArr2;
            }
            glyphArr2[i & 511] = glyph;
        }

        public Glyph getFirstGlyph() {
            Glyph[][] glyphArr = this.glyphs;
            for (Glyph[] glyphArr2 : glyphArr) {
                if (glyphArr2 != null) {
                    for (Glyph glyph : glyphArr2) {
                        if (!(glyph == null || glyph.height == 0 || glyph.width == 0)) {
                            return glyph;
                        }
                    }
                    continue;
                }
            }
            throw new GdxRuntimeException("No glyphs found.");
        }

        public boolean hasGlyph(char c) {
            if (this.missingGlyph == null && getGlyph(c) == null) {
                return false;
            }
            return true;
        }

        public Glyph getGlyph(char c) {
            Glyph[] glyphArr = this.glyphs[c / 512];
            if (glyphArr != null) {
                return glyphArr[c & 511];
            }
            return null;
        }

        public void getGlyphs(GlyphLayout.GlyphRun glyphRun, CharSequence charSequence, int i, int i2, Glyph glyph) {
            boolean z = this.markupEnabled;
            float f = this.scaleX;
            Glyph glyph2 = this.missingGlyph;
            Array<Glyph> array = glyphRun.glyphs;
            FloatArray floatArray = glyphRun.xAdvances;
            int i3 = i2 - i;
            array.ensureCapacity(i3);
            floatArray.ensureCapacity(i3 + 1);
            while (i < i2) {
                int i4 = i + 1;
                char charAt = charSequence.charAt(i);
                if (charAt != '\r') {
                    Glyph glyph3 = getGlyph(charAt);
                    if (glyph3 == null) {
                        if (glyph2 != null) {
                            glyph3 = glyph2;
                        }
                    }
                    array.add(glyph3);
                    if (glyph == null) {
                        floatArray.add(glyph3.fixedWidth ? 0.0f : (((float) (-glyph3.xoffset)) * f) - this.padLeft);
                    } else {
                        floatArray.add(((float) (glyph.xadvance + glyph.getKerning(charAt))) * f);
                    }
                    if (z && charAt == '[' && i4 < i2 && charSequence.charAt(i4) == '[') {
                        i4++;
                    }
                    i = i4;
                    glyph = glyph3;
                }
                i = i4;
            }
            if (glyph != null) {
                floatArray.add(glyph.fixedWidth ? ((float) glyph.xadvance) * f : (((float) (glyph.width + glyph.xoffset)) * f) - this.padRight);
            }
        }

        /* JADX WARNING: Code restructure failed: missing block: B:10:0x002d, code lost:
            return r4 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x0032, code lost:
            if (isWhitespace(r0) == false) goto L_0x0018;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:14:0x0036, code lost:
            return r4 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x0037, code lost:
            return 0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:4:0x0016, code lost:
            if (isBreakChar(r0) != false) goto L_0x0018;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:5:0x0018, code lost:
            r4 = r4 - 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:6:0x001a, code lost:
            if (r4 <= 0) goto L_0x0037;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:7:0x001c, code lost:
            r0 = (char) r3.get(r4).id;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:8:0x0029, code lost:
            if (isBreakChar(r0) == false) goto L_0x002e;
         */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public int getWrapIndex(com.badlogic.gdx.utils.Array<com.badlogic.gdx.graphics.g2d.BitmapFont.Glyph> r3, int r4) {
            /*
                r2 = this;
                int r4 = r4 + -1
                java.lang.Object r0 = r3.get(r4)
                com.badlogic.gdx.graphics.g2d.BitmapFont$Glyph r0 = (com.badlogic.gdx.graphics.g2d.BitmapFont.Glyph) r0
                int r0 = r0.id
                char r0 = (char) r0
                boolean r1 = r2.isWhitespace(r0)
                if (r1 == 0) goto L_0x0012
                return r4
            L_0x0012:
                boolean r0 = r2.isBreakChar(r0)
                if (r0 == 0) goto L_0x001a
            L_0x0018:
                int r4 = r4 + -1
            L_0x001a:
                if (r4 <= 0) goto L_0x0037
                java.lang.Object r0 = r3.get(r4)
                com.badlogic.gdx.graphics.g2d.BitmapFont$Glyph r0 = (com.badlogic.gdx.graphics.g2d.BitmapFont.Glyph) r0
                int r0 = r0.id
                char r0 = (char) r0
                boolean r1 = r2.isBreakChar(r0)
                if (r1 == 0) goto L_0x002e
                int r4 = r4 + 1
                return r4
            L_0x002e:
                boolean r0 = r2.isWhitespace(r0)
                if (r0 == 0) goto L_0x0018
                int r4 = r4 + 1
                return r4
            L_0x0037:
                r3 = 0
                return r3
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g2d.BitmapFont.BitmapFontData.getWrapIndex(com.badlogic.gdx.utils.Array, int):int");
        }

        public boolean isBreakChar(char c) {
            char[] cArr = this.breakChars;
            if (cArr == null) {
                return false;
            }
            for (char c2 : cArr) {
                if (c == c2) {
                    return true;
                }
            }
            return false;
        }

        public String getImagePath(int i) {
            return this.imagePaths[i];
        }

        public String[] getImagePaths() {
            return this.imagePaths;
        }

        public FileHandle getFontFile() {
            return this.fontFile;
        }

        public void setScale(float f, float f2) {
            if (f == 0.0f) {
                throw new IllegalArgumentException("scaleX cannot be 0.");
            } else if (f2 != 0.0f) {
                float f3 = f / this.scaleX;
                float f4 = f2 / this.scaleY;
                this.lineHeight *= f4;
                this.spaceXadvance *= f3;
                this.xHeight *= f4;
                this.capHeight *= f4;
                this.ascent *= f4;
                this.descent *= f4;
                this.down *= f4;
                this.padLeft *= f3;
                this.padRight *= f3;
                this.padTop *= f4;
                this.padBottom *= f4;
                this.scaleX = f;
                this.scaleY = f2;
            } else {
                throw new IllegalArgumentException("scaleY cannot be 0.");
            }
        }

        public void setScale(float f) {
            setScale(f, f);
        }

        public void scale(float f) {
            setScale(this.scaleX + f, this.scaleY + f);
        }

        public String toString() {
            String str = this.name;
            return str != null ? str : super.toString();
        }
    }
}
