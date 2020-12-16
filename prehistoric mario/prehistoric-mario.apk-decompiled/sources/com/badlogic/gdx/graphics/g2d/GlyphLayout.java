package com.badlogic.gdx.graphics.g2d;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Colors;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;

public class GlyphLayout implements Pool.Poolable {
    private final Array<Color> colorStack = new Array<>(4);
    public float height;
    public final Array<GlyphRun> runs = new Array<>();
    public float width;

    public GlyphLayout() {
    }

    public GlyphLayout(BitmapFont bitmapFont, CharSequence charSequence) {
        setText(bitmapFont, charSequence);
    }

    public GlyphLayout(BitmapFont bitmapFont, CharSequence charSequence, Color color, float f, int i, boolean z) {
        setText(bitmapFont, charSequence, color, f, i, z);
    }

    public GlyphLayout(BitmapFont bitmapFont, CharSequence charSequence, int i, int i2, Color color, float f, int i3, boolean z, String str) {
        setText(bitmapFont, charSequence, i, i2, color, f, i3, z, str);
    }

    public void setText(BitmapFont bitmapFont, CharSequence charSequence) {
        setText(bitmapFont, charSequence, 0, charSequence.length(), bitmapFont.getColor(), 0.0f, 8, false, null);
    }

    public void setText(BitmapFont bitmapFont, CharSequence charSequence, Color color, float f, int i, boolean z) {
        setText(bitmapFont, charSequence, 0, charSequence.length(), color, f, i, z, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r26v13, types: [com.badlogic.gdx.utils.Pool] */
    /* JADX WARNING: Removed duplicated region for block: B:128:0x03b2  */
    /* JADX WARNING: Removed duplicated region for block: B:134:0x03d2  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x00af  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setText(com.badlogic.gdx.graphics.g2d.BitmapFont r30, java.lang.CharSequence r31, int r32, int r33, com.badlogic.gdx.graphics.Color r34, float r35, int r36, boolean r37, java.lang.String r38) {
        /*
        // Method dump skipped, instructions count: 1009
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.g2d.GlyphLayout.setText(com.badlogic.gdx.graphics.g2d.BitmapFont, java.lang.CharSequence, int, int, com.badlogic.gdx.graphics.Color, float, int, boolean, java.lang.String):void");
    }

    private void truncate(BitmapFont.BitmapFontData bitmapFontData, GlyphRun glyphRun, float f, String str, int i, Pool<GlyphRun> pool) {
        GlyphRun obtain = pool.obtain();
        bitmapFontData.getGlyphs(obtain, str, 0, str.length(), null);
        float f2 = 0.0f;
        if (obtain.xAdvances.size > 0) {
            adjustLastGlyph(bitmapFontData, obtain);
            int i2 = obtain.xAdvances.size;
            float f3 = 0.0f;
            for (int i3 = 1; i3 < i2; i3++) {
                f3 += obtain.xAdvances.get(i3);
            }
            f2 = f3;
        }
        float f4 = f - f2;
        float f5 = glyphRun.x;
        int i4 = 0;
        while (true) {
            if (i4 >= glyphRun.xAdvances.size) {
                break;
            }
            float f6 = glyphRun.xAdvances.get(i4);
            f5 += f6;
            if (f5 > f4) {
                glyphRun.width = (f5 - glyphRun.x) - f6;
                break;
            }
            i4++;
        }
        if (i4 > 1) {
            glyphRun.glyphs.truncate(i4 - 1);
            glyphRun.xAdvances.truncate(i4);
            adjustLastGlyph(bitmapFontData, glyphRun);
            if (obtain.xAdvances.size > 0) {
                glyphRun.xAdvances.addAll(obtain.xAdvances, 1, obtain.xAdvances.size - 1);
            }
        } else {
            glyphRun.glyphs.clear();
            glyphRun.xAdvances.clear();
            glyphRun.xAdvances.addAll(obtain.xAdvances);
            if (obtain.xAdvances.size > 0) {
                glyphRun.width += obtain.xAdvances.get(0);
            }
        }
        glyphRun.glyphs.addAll(obtain.glyphs);
        glyphRun.width += f2;
        pool.free(obtain);
    }

    private GlyphRun wrap(BitmapFont.BitmapFontData bitmapFontData, GlyphRun glyphRun, Pool<GlyphRun> pool, int i, int i2) {
        Array<BitmapFont.Glyph> array = glyphRun.glyphs;
        int i3 = glyphRun.glyphs.size;
        FloatArray floatArray = glyphRun.xAdvances;
        int i4 = i;
        while (i4 > 0 && bitmapFontData.isWhitespace((char) array.get(i4 - 1).id)) {
            i4--;
        }
        while (i < i3 && bitmapFontData.isWhitespace((char) array.get(i).id)) {
            i++;
        }
        while (i2 < i4) {
            glyphRun.width += floatArray.get(i2);
            i2++;
        }
        int i5 = i4 + 1;
        while (i2 > i5) {
            i2--;
            glyphRun.width -= floatArray.get(i2);
        }
        GlyphRun glyphRun2 = null;
        if (i < i3) {
            glyphRun2 = pool.obtain();
            glyphRun2.color.set(glyphRun.color);
            Array<BitmapFont.Glyph> array2 = glyphRun2.glyphs;
            array2.addAll(array, 0, i4);
            array.removeRange(0, i - 1);
            glyphRun.glyphs = array2;
            glyphRun2.glyphs = array;
            FloatArray floatArray2 = glyphRun2.xAdvances;
            floatArray2.addAll(floatArray, 0, i5);
            floatArray.removeRange(1, i);
            floatArray.set(0, (((float) (-array.first().xoffset)) * bitmapFontData.scaleX) - bitmapFontData.padLeft);
            glyphRun.xAdvances = floatArray2;
            glyphRun2.xAdvances = floatArray;
        } else {
            array.truncate(i4);
            floatArray.truncate(i5);
        }
        if (i4 == 0) {
            pool.free(glyphRun);
            this.runs.pop();
        } else {
            adjustLastGlyph(bitmapFontData, glyphRun);
        }
        return glyphRun2;
    }

    private void adjustLastGlyph(BitmapFont.BitmapFontData bitmapFontData, GlyphRun glyphRun) {
        BitmapFont.Glyph peek = glyphRun.glyphs.peek();
        if (!peek.fixedWidth) {
            float f = (((float) (peek.width + peek.xoffset)) * bitmapFontData.scaleX) - bitmapFontData.padRight;
            glyphRun.width += f - glyphRun.xAdvances.peek();
            glyphRun.xAdvances.set(glyphRun.xAdvances.size - 1, f);
        }
    }

    private int parseColorMarkup(CharSequence charSequence, int i, int i2, Pool<Color> pool) {
        int i3;
        int i4;
        if (i == i2) {
            return -1;
        }
        char charAt = charSequence.charAt(i);
        if (charAt == '#') {
            int i5 = i + 1;
            int i6 = 0;
            while (true) {
                if (i5 >= i2) {
                    break;
                }
                char charAt2 = charSequence.charAt(i5);
                if (charAt2 != ']') {
                    if (charAt2 >= '0' && charAt2 <= '9') {
                        i3 = i6 * 16;
                        i4 = charAt2 - '0';
                    } else if (charAt2 < 'a' || charAt2 > 'f') {
                        if (charAt2 < 'A' || charAt2 > 'F') {
                            break;
                        }
                        i3 = i6 * 16;
                        i4 = charAt2 - '7';
                    } else {
                        i3 = i6 * 16;
                        i4 = charAt2 - 'W';
                    }
                    i6 = i3 + i4;
                    i5++;
                } else if (i5 >= i + 2 && i5 <= i + 9) {
                    int i7 = i5 - i;
                    if (i7 <= 7) {
                        for (int i8 = 0; i8 < 9 - i7; i8++) {
                            i6 <<= 4;
                        }
                        i6 |= 255;
                    }
                    Color obtain = pool.obtain();
                    this.colorStack.add(obtain);
                    Color.rgba8888ToColor(obtain, i6);
                    return i7;
                }
            }
            return -1;
        } else if (charAt == '[') {
            return -2;
        } else {
            if (charAt != ']') {
                for (int i9 = i + 1; i9 < i2; i9++) {
                    if (charSequence.charAt(i9) == ']') {
                        Color color = Colors.get(charSequence.subSequence(i, i9).toString());
                        if (color == null) {
                            return -1;
                        }
                        Color obtain2 = pool.obtain();
                        this.colorStack.add(obtain2);
                        obtain2.set(color);
                        return i9 - i;
                    }
                }
                return -1;
            }
            if (this.colorStack.size > 1) {
                pool.free(this.colorStack.pop());
            }
            return 0;
        }
    }

    @Override // com.badlogic.gdx.utils.Pool.Poolable
    public void reset() {
        Pools.get(GlyphRun.class).freeAll(this.runs);
        this.runs.clear();
        this.width = 0.0f;
        this.height = 0.0f;
    }

    public String toString() {
        if (this.runs.size == 0) {
            return BuildConfig.FLAVOR;
        }
        StringBuilder sb = new StringBuilder(128);
        sb.append(this.width);
        sb.append('x');
        sb.append(this.height);
        sb.append('\n');
        int i = this.runs.size;
        for (int i2 = 0; i2 < i; i2++) {
            sb.append(this.runs.get(i2).toString());
            sb.append('\n');
        }
        sb.setLength(sb.length() - 1);
        return sb.toString();
    }

    public static class GlyphRun implements Pool.Poolable {
        public final Color color = new Color();
        public Array<BitmapFont.Glyph> glyphs = new Array<>();
        public float width;
        public float x;
        public FloatArray xAdvances = new FloatArray();
        public float y;

        @Override // com.badlogic.gdx.utils.Pool.Poolable
        public void reset() {
            this.glyphs.clear();
            this.xAdvances.clear();
            this.width = 0.0f;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder(this.glyphs.size);
            Array<BitmapFont.Glyph> array = this.glyphs;
            int i = array.size;
            for (int i2 = 0; i2 < i; i2++) {
                sb.append((char) array.get(i2).id);
            }
            sb.append(", #");
            sb.append(this.color);
            sb.append(", ");
            sb.append(this.x);
            sb.append(", ");
            sb.append(this.y);
            sb.append(", ");
            sb.append(this.width);
            return sb.toString();
        }
    }
}
