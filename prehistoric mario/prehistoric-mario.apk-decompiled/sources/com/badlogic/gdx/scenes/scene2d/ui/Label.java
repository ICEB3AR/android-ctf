package com.badlogic.gdx.scenes.scene2d.ui;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.BitmapFontCache;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.StringBuilder;

public class Label extends Widget {
    private static final GlyphLayout prefSizeLayout = new GlyphLayout();
    private static final Color tempColor = new Color();
    private BitmapFontCache cache;
    private String ellipsis;
    private boolean fontScaleChanged;
    private float fontScaleX;
    private float fontScaleY;
    private int intValue;
    private int labelAlign;
    private float lastPrefHeight;
    private final GlyphLayout layout;
    private int lineAlign;
    private final Vector2 prefSize;
    private boolean prefSizeInvalid;
    private LabelStyle style;
    private final StringBuilder text;
    private boolean wrap;

    public Label(CharSequence charSequence, Skin skin) {
        this(charSequence, (LabelStyle) skin.get(LabelStyle.class));
    }

    public Label(CharSequence charSequence, Skin skin, String str) {
        this(charSequence, (LabelStyle) skin.get(str, LabelStyle.class));
    }

    public Label(CharSequence charSequence, Skin skin, String str, Color color) {
        this(charSequence, new LabelStyle(skin.getFont(str), color));
    }

    public Label(CharSequence charSequence, Skin skin, String str, String str2) {
        this(charSequence, new LabelStyle(skin.getFont(str), skin.getColor(str2)));
    }

    public Label(CharSequence charSequence, LabelStyle labelStyle) {
        this.layout = new GlyphLayout();
        this.prefSize = new Vector2();
        this.text = new StringBuilder();
        this.intValue = Integer.MIN_VALUE;
        this.labelAlign = 8;
        this.lineAlign = 8;
        this.prefSizeInvalid = true;
        this.fontScaleX = 1.0f;
        this.fontScaleY = 1.0f;
        this.fontScaleChanged = false;
        if (charSequence != null) {
            this.text.append(charSequence);
        }
        setStyle(labelStyle);
        if (charSequence != null && charSequence.length() > 0) {
            setSize(getPrefWidth(), getPrefHeight());
        }
    }

    public void setStyle(LabelStyle labelStyle) {
        if (labelStyle == null) {
            throw new IllegalArgumentException("style cannot be null.");
        } else if (labelStyle.font != null) {
            this.style = labelStyle;
            this.cache = labelStyle.font.newFontCache();
            invalidateHierarchy();
        } else {
            throw new IllegalArgumentException("Missing LabelStyle font.");
        }
    }

    public LabelStyle getStyle() {
        return this.style;
    }

    public boolean setText(int i) {
        if (this.intValue == i) {
            return false;
        }
        setText(Integer.toString(i));
        this.intValue = i;
        return true;
    }

    public void setText(CharSequence charSequence) {
        if (charSequence == null) {
            charSequence = BuildConfig.FLAVOR;
        }
        if (charSequence instanceof StringBuilder) {
            if (!this.text.equals(charSequence)) {
                this.text.setLength(0);
                this.text.append((StringBuilder) charSequence);
            } else {
                return;
            }
        } else if (!textEquals(charSequence)) {
            this.text.setLength(0);
            this.text.append(charSequence);
        } else {
            return;
        }
        this.intValue = Integer.MIN_VALUE;
        invalidateHierarchy();
    }

    public boolean textEquals(CharSequence charSequence) {
        int i = this.text.length;
        char[] cArr = this.text.chars;
        if (i != charSequence.length()) {
            return false;
        }
        for (int i2 = 0; i2 < i; i2++) {
            if (cArr[i2] != charSequence.charAt(i2)) {
                return false;
            }
        }
        return true;
    }

    public StringBuilder getText() {
        return this.text;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public void invalidate() {
        super.invalidate();
        this.prefSizeInvalid = true;
    }

    private void scaleAndComputePrefSize() {
        BitmapFont font = this.cache.getFont();
        float scaleX = font.getScaleX();
        float scaleY = font.getScaleY();
        if (this.fontScaleChanged) {
            font.getData().setScale(this.fontScaleX, this.fontScaleY);
        }
        computePrefSize();
        if (this.fontScaleChanged) {
            font.getData().setScale(scaleX, scaleY);
        }
    }

    private void computePrefSize() {
        this.prefSizeInvalid = false;
        GlyphLayout glyphLayout = prefSizeLayout;
        if (!this.wrap || this.ellipsis != null) {
            glyphLayout.setText(this.cache.getFont(), this.text);
        } else {
            float width = getWidth();
            if (this.style.background != null) {
                width -= this.style.background.getLeftWidth() + this.style.background.getRightWidth();
            }
            glyphLayout.setText(this.cache.getFont(), this.text, Color.WHITE, width, 8, true);
        }
        this.prefSize.set(glyphLayout.width, glyphLayout.height);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public void layout() {
        float f;
        float f2;
        float f3;
        float f4;
        GlyphLayout glyphLayout;
        float f5;
        float f6;
        float f7;
        BitmapFont font = this.cache.getFont();
        float scaleX = font.getScaleX();
        float scaleY = font.getScaleY();
        if (this.fontScaleChanged) {
            font.getData().setScale(this.fontScaleX, this.fontScaleY);
        }
        boolean z = this.wrap && this.ellipsis == null;
        if (z) {
            float prefHeight = getPrefHeight();
            if (prefHeight != this.lastPrefHeight) {
                this.lastPrefHeight = prefHeight;
                invalidateHierarchy();
            }
        }
        float width = getWidth();
        float height = getHeight();
        Drawable drawable = this.style.background;
        if (drawable != null) {
            float leftWidth = drawable.getLeftWidth();
            float bottomHeight = drawable.getBottomHeight();
            f4 = width - (drawable.getLeftWidth() + drawable.getRightWidth());
            f = height - (drawable.getBottomHeight() + drawable.getTopHeight());
            f3 = leftWidth;
            f2 = bottomHeight;
        } else {
            f4 = width;
            f = height;
            f3 = 0.0f;
            f2 = 0.0f;
        }
        GlyphLayout glyphLayout2 = this.layout;
        if (z || this.text.indexOf("\n") != -1) {
            StringBuilder stringBuilder = this.text;
            glyphLayout = glyphLayout2;
            glyphLayout2.setText(font, stringBuilder, 0, stringBuilder.length, Color.WHITE, f4, this.lineAlign, z, this.ellipsis);
            float f8 = glyphLayout.width;
            f6 = glyphLayout.height;
            int i = this.labelAlign;
            if ((i & 8) == 0) {
                f3 += (i & 16) != 0 ? f4 - f8 : (f4 - f8) / 2.0f;
            }
            f5 = f8;
        } else {
            f6 = font.getData().capHeight;
            glyphLayout = glyphLayout2;
            f5 = f4;
        }
        int i2 = this.labelAlign;
        if ((i2 & 2) != 0) {
            f7 = f2 + (this.cache.getFont().isFlipped() ? 0.0f : f - f6) + this.style.font.getDescent();
        } else if ((i2 & 4) != 0) {
            f7 = (f2 + (this.cache.getFont().isFlipped() ? f - f6 : 0.0f)) - this.style.font.getDescent();
        } else {
            f7 = f2 + ((f - f6) / 2.0f);
        }
        if (!this.cache.getFont().isFlipped()) {
            f7 += f6;
        }
        StringBuilder stringBuilder2 = this.text;
        glyphLayout.setText(font, stringBuilder2, 0, stringBuilder2.length, Color.WHITE, f5, this.lineAlign, z, this.ellipsis);
        this.cache.setText(glyphLayout, f3, f7);
        if (this.fontScaleChanged) {
            font.getData().setScale(scaleX, scaleY);
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        validate();
        Color color = tempColor.set(getColor());
        color.a *= f;
        if (this.style.background != null) {
            batch.setColor(color.r, color.g, color.b, color.a);
            this.style.background.draw(batch, getX(), getY(), getWidth(), getHeight());
        }
        if (this.style.fontColor != null) {
            color.mul(this.style.fontColor);
        }
        this.cache.tint(color);
        this.cache.setPosition(getX(), getY());
        this.cache.draw(batch);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefWidth() {
        if (this.wrap) {
            return 0.0f;
        }
        if (this.prefSizeInvalid) {
            scaleAndComputePrefSize();
        }
        float f = this.prefSize.x;
        Drawable drawable = this.style.background;
        return drawable != null ? f + drawable.getLeftWidth() + drawable.getRightWidth() : f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefHeight() {
        if (this.prefSizeInvalid) {
            scaleAndComputePrefSize();
        }
        float f = 1.0f;
        if (this.fontScaleChanged) {
            f = this.fontScaleY / this.style.font.getScaleY();
        }
        float descent = this.prefSize.y - ((this.style.font.getDescent() * f) * 2.0f);
        Drawable drawable = this.style.background;
        return drawable != null ? descent + drawable.getTopHeight() + drawable.getBottomHeight() : descent;
    }

    public GlyphLayout getGlyphLayout() {
        return this.layout;
    }

    public void setWrap(boolean z) {
        this.wrap = z;
        invalidateHierarchy();
    }

    public int getLabelAlign() {
        return this.labelAlign;
    }

    public int getLineAlign() {
        return this.lineAlign;
    }

    public void setAlignment(int i) {
        setAlignment(i, i);
    }

    public void setAlignment(int i, int i2) {
        this.labelAlign = i;
        if ((i2 & 8) != 0) {
            this.lineAlign = 8;
        } else if ((i2 & 16) != 0) {
            this.lineAlign = 16;
        } else {
            this.lineAlign = 1;
        }
        invalidate();
    }

    public void setFontScale(float f) {
        setFontScale(f, f);
    }

    public void setFontScale(float f, float f2) {
        this.fontScaleChanged = true;
        this.fontScaleX = f;
        this.fontScaleY = f2;
        invalidateHierarchy();
    }

    public float getFontScaleX() {
        return this.fontScaleX;
    }

    public void setFontScaleX(float f) {
        setFontScale(f, this.fontScaleY);
    }

    public float getFontScaleY() {
        return this.fontScaleY;
    }

    public void setFontScaleY(float f) {
        setFontScale(this.fontScaleX, f);
    }

    public void setEllipsis(String str) {
        this.ellipsis = str;
    }

    public void setEllipsis(boolean z) {
        if (z) {
            this.ellipsis = "...";
        } else {
            this.ellipsis = null;
        }
    }

    /* access modifiers changed from: protected */
    public BitmapFontCache getBitmapFontCache() {
        return this.cache;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Actor
    public String toString() {
        String name = getName();
        if (name != null) {
            return name;
        }
        String name2 = getClass().getName();
        int lastIndexOf = name2.lastIndexOf(46);
        if (lastIndexOf != -1) {
            name2 = name2.substring(lastIndexOf + 1);
        }
        StringBuilder sb = new StringBuilder();
        sb.append(name2.indexOf(36) != -1 ? "Label " : BuildConfig.FLAVOR);
        sb.append(name2);
        sb.append(": ");
        sb.append((Object) this.text);
        return sb.toString();
    }

    public static class LabelStyle {
        public Drawable background;
        public BitmapFont font;
        public Color fontColor;

        public LabelStyle() {
        }

        public LabelStyle(BitmapFont bitmapFont, Color color) {
            this.font = bitmapFont;
            this.fontColor = color;
        }

        public LabelStyle(LabelStyle labelStyle) {
            this.font = labelStyle.font;
            Color color = labelStyle.fontColor;
            if (color != null) {
                this.fontColor = new Color(color);
            }
            this.background = labelStyle.background;
        }
    }
}
