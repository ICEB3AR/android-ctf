package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.ui.TextField;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.IntArray;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.Pools;

public class TextArea extends TextField {
    int cursorLine;
    int firstLineShowing;
    private String lastText;
    IntArray linesBreak;
    private int linesShowing;
    float moveOffset;
    private float prefRows;

    public TextArea(String str, Skin skin) {
        super(str, skin);
    }

    public TextArea(String str, Skin skin, String str2) {
        super(str, skin, str2);
    }

    public TextArea(String str, TextField.TextFieldStyle textFieldStyle) {
        super(str, textFieldStyle);
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public void initialize() {
        super.initialize();
        this.writeEnters = true;
        this.linesBreak = new IntArray();
        this.cursorLine = 0;
        this.firstLineShowing = 0;
        this.moveOffset = -1.0f;
        this.linesShowing = 0;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public int letterUnderCursor(float f) {
        if (this.linesBreak.size <= 0) {
            return 0;
        }
        if (this.cursorLine * 2 >= this.linesBreak.size) {
            return this.text.length();
        }
        float[] fArr = this.glyphPositions.items;
        int i = this.linesBreak.items[this.cursorLine * 2];
        float f2 = f + fArr[i];
        int i2 = this.linesBreak.items[(this.cursorLine * 2) + 1];
        while (i < i2 && fArr[i] <= f2) {
            i++;
        }
        if (i <= 0 || fArr[i] - f2 > f2 - fArr[i - 1]) {
            return Math.max(0, i - 1);
        }
        return i;
    }

    public void setPrefRows(float f) {
        this.prefRows = f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField, com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefHeight() {
        if (this.prefRows <= 0.0f) {
            return super.getPrefHeight();
        }
        float f = this.textHeight * this.prefRows;
        return this.style.background != null ? Math.max(f + this.style.background.getBottomHeight() + this.style.background.getTopHeight(), this.style.background.getMinHeight()) : f;
    }

    public int getLines() {
        return (this.linesBreak.size / 2) + (newLineAtEnd() ? 1 : 0);
    }

    public boolean newLineAtEnd() {
        if (this.text.length() == 0 || (this.text.charAt(this.text.length() - 1) != '\n' && this.text.charAt(this.text.length() - 1) != '\r')) {
            return false;
        }
        return true;
    }

    public void moveCursorLine(int i) {
        if (i < 0) {
            this.cursorLine = 0;
            this.cursor = 0;
            this.moveOffset = -1.0f;
        } else if (i >= getLines()) {
            int lines = getLines() - 1;
            this.cursor = this.text.length();
            if (i > getLines() || lines == this.cursorLine) {
                this.moveOffset = -1.0f;
            }
            this.cursorLine = lines;
        } else if (i != this.cursorLine) {
            float f = 0.0f;
            if (this.moveOffset < 0.0f) {
                if (this.linesBreak.size > this.cursorLine * 2) {
                    f = this.glyphPositions.get(this.cursor) - this.glyphPositions.get(this.linesBreak.get(this.cursorLine * 2));
                }
                this.moveOffset = f;
            }
            this.cursorLine = i;
            this.cursor = this.cursorLine * 2 >= this.linesBreak.size ? this.text.length() : this.linesBreak.get(this.cursorLine * 2);
            while (this.cursor < this.text.length() && this.cursor <= this.linesBreak.get((this.cursorLine * 2) + 1) - 1 && this.glyphPositions.get(this.cursor) - this.glyphPositions.get(this.linesBreak.get(this.cursorLine * 2)) < this.moveOffset) {
                this.cursor++;
            }
            showCursor();
        }
    }

    /* access modifiers changed from: package-private */
    public void updateCurrentLine() {
        int i;
        int calculateCurrentLineIndex = calculateCurrentLineIndex(this.cursor);
        int i2 = calculateCurrentLineIndex / 2;
        if ((calculateCurrentLineIndex % 2 == 0 || (i = calculateCurrentLineIndex + 1) >= this.linesBreak.size || this.cursor != this.linesBreak.items[calculateCurrentLineIndex] || this.linesBreak.items[i] != this.linesBreak.items[calculateCurrentLineIndex]) && (i2 < this.linesBreak.size / 2 || this.text.length() == 0 || this.text.charAt(this.text.length() - 1) == '\n' || this.text.charAt(this.text.length() - 1) == '\r')) {
            this.cursorLine = i2;
        }
        updateFirstLineShowing();
    }

    /* access modifiers changed from: package-private */
    public void showCursor() {
        updateCurrentLine();
        updateFirstLineShowing();
    }

    /* access modifiers changed from: package-private */
    public void updateFirstLineShowing() {
        int i = this.cursorLine;
        int i2 = this.firstLineShowing;
        if (i != i2) {
            int i3 = i >= i2 ? 1 : -1;
            while (true) {
                int i4 = this.firstLineShowing;
                int i5 = this.cursorLine;
                if (i4 > i5 || (i4 + this.linesShowing) - 1 < i5) {
                    this.firstLineShowing += i3;
                } else {
                    return;
                }
            }
        }
    }

    private int calculateCurrentLineIndex(int i) {
        int i2 = 0;
        while (i2 < this.linesBreak.size && i > this.linesBreak.items[i2]) {
            i2++;
        }
        return i2;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.Actor
    public void sizeChanged() {
        float f;
        this.lastText = null;
        BitmapFont bitmapFont = this.style.font;
        Drawable drawable = this.style.background;
        float height = getHeight();
        if (drawable == null) {
            f = 0.0f;
        } else {
            f = drawable.getTopHeight() + drawable.getBottomHeight();
        }
        this.linesShowing = (int) Math.floor((double) ((height - f) / bitmapFont.getLineHeight()));
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public float getTextY(BitmapFont bitmapFont, Drawable drawable) {
        float height = getHeight();
        return drawable != null ? (float) ((int) (height - drawable.getTopHeight())) : height;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public void drawSelection(Drawable drawable, Batch batch, BitmapFont bitmapFont, float f, float f2) {
        int i = this.firstLineShowing * 2;
        int min = Math.min(this.cursor, this.selectionStart);
        int max = Math.max(this.cursor, this.selectionStart);
        float f3 = 0.0f;
        while (true) {
            int i2 = i + 1;
            if (i2 < this.linesBreak.size && i < (this.firstLineShowing + this.linesShowing) * 2) {
                int i3 = this.linesBreak.get(i);
                int i4 = this.linesBreak.get(i2);
                if ((min >= i3 || min >= i4 || max >= i3 || max >= i4) && (min <= i3 || min <= i4 || max <= i3 || max <= i4)) {
                    int max2 = Math.max(this.linesBreak.get(i), min);
                    int min2 = Math.min(this.linesBreak.get(i2), max);
                    float f4 = this.glyphPositions.get(max2) - this.glyphPositions.get(this.linesBreak.get(i));
                    drawable.draw(batch, f + f4 + this.fontOffset, ((f2 - this.textHeight) - bitmapFont.getDescent()) - f3, this.glyphPositions.get(min2) - this.glyphPositions.get(max2), bitmapFont.getLineHeight());
                }
                f3 += bitmapFont.getLineHeight();
                i += 2;
            } else {
                return;
            }
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public void drawText(Batch batch, BitmapFont bitmapFont, float f, float f2) {
        int i = this.firstLineShowing * 2;
        float f3 = 0.0f;
        while (i < (this.firstLineShowing + this.linesShowing) * 2 && i < this.linesBreak.size) {
            bitmapFont.draw(batch, this.displayText, f, f2 + f3, this.linesBreak.items[i], this.linesBreak.items[i + 1], 0.0f, 8, false);
            f3 -= bitmapFont.getLineHeight();
            i += 2;
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public void drawCursor(Drawable drawable, Batch batch, BitmapFont bitmapFont, float f, float f2) {
        drawable.draw(batch, f + ((this.cursor >= this.glyphPositions.size || this.cursorLine * 2 >= this.linesBreak.size) ? 0.0f : this.glyphPositions.get(this.cursor) - this.glyphPositions.get(this.linesBreak.items[this.cursorLine * 2])) + this.fontOffset + bitmapFont.getData().cursorX, (f2 - (bitmapFont.getDescent() / 2.0f)) - (((float) ((this.cursorLine - this.firstLineShowing) + 1)) * bitmapFont.getLineHeight()), drawable.getMinWidth(), bitmapFont.getLineHeight());
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public void calculateOffsets() {
        super.calculateOffsets();
        if (!this.text.equals(this.lastText)) {
            this.lastText = this.text;
            BitmapFont bitmapFont = this.style.font;
            float width = getWidth() - (this.style.background != null ? this.style.background.getLeftWidth() + this.style.background.getRightWidth() : 0.0f);
            this.linesBreak.clear();
            Pool pool = Pools.get(GlyphLayout.class);
            GlyphLayout glyphLayout = (GlyphLayout) pool.obtain();
            int i = 0;
            int i2 = 0;
            for (int i3 = 0; i3 < this.text.length(); i3++) {
                char charAt = this.text.charAt(i3);
                if (charAt == '\r' || charAt == '\n') {
                    this.linesBreak.add(i);
                    this.linesBreak.add(i3);
                    i = i3 + 1;
                } else {
                    if (!continueCursor(i3, 0)) {
                        i2 = i3;
                    }
                    glyphLayout.setText(bitmapFont, this.text.subSequence(i, i3 + 1));
                    if (glyphLayout.width > width) {
                        if (i >= i2) {
                            i2 = i3 - 1;
                        }
                        this.linesBreak.add(i);
                        i2++;
                        this.linesBreak.add(i2);
                        i = i2;
                    }
                }
            }
            pool.free(glyphLayout);
            if (i < this.text.length()) {
                this.linesBreak.add(i);
                this.linesBreak.add(this.text.length());
            }
            showCursor();
        }
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public InputListener createInputListener() {
        return new TextAreaListener();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public void setSelection(int i, int i2) {
        super.setSelection(i, i2);
        updateCurrentLine();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public void moveCursor(boolean z, boolean z2) {
        int i;
        int i2 = z ? 1 : -1;
        int i3 = (this.cursorLine * 2) + i2;
        if (i3 < 0 || (i = i3 + 1) >= this.linesBreak.size || this.linesBreak.items[i3] != this.cursor || this.linesBreak.items[i] != this.cursor) {
            super.moveCursor(z, z2);
        } else {
            this.cursorLine += i2;
            if (z2) {
                super.moveCursor(z, z2);
            }
            showCursor();
        }
        updateCurrentLine();
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField
    public boolean continueCursor(int i, int i2) {
        int calculateCurrentLineIndex = calculateCurrentLineIndex(i + i2);
        if (super.continueCursor(i, i2)) {
            if (calculateCurrentLineIndex >= 0 && calculateCurrentLineIndex < this.linesBreak.size - 2) {
                int i3 = calculateCurrentLineIndex + 1;
                if (this.linesBreak.items[i3] != i || this.linesBreak.items[i3] == this.linesBreak.items[calculateCurrentLineIndex + 2]) {
                    return true;
                }
            }
            return true;
        }
        return false;
    }

    public int getCursorLine() {
        return this.cursorLine;
    }

    public int getFirstLineShowing() {
        return this.firstLineShowing;
    }

    public int getLinesShowing() {
        return this.linesShowing;
    }

    public float getCursorX() {
        return this.textOffset + this.fontOffset + this.style.font.getData().cursorX;
    }

    public float getCursorY() {
        BitmapFont bitmapFont = this.style.font;
        return -(((-bitmapFont.getDescent()) / 2.0f) - (((float) ((this.cursorLine - this.firstLineShowing) + 1)) * bitmapFont.getLineHeight()));
    }

    public class TextAreaListener extends TextField.TextFieldClickListener {
        public TextAreaListener() {
            super();
        }

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField.TextFieldClickListener
        public void setCursorPosition(float f, float f2) {
            TextArea textArea = TextArea.this;
            textArea.moveOffset = -1.0f;
            Drawable drawable = textArea.style.background;
            BitmapFont bitmapFont = TextArea.this.style.font;
            float height = TextArea.this.getHeight();
            if (drawable != null) {
                height -= drawable.getTopHeight();
                f -= drawable.getLeftWidth();
            }
            float max = Math.max(0.0f, f);
            if (drawable != null) {
                f2 -= drawable.getTopHeight();
            }
            TextArea.this.cursorLine = ((int) Math.floor((double) ((height - f2) / bitmapFont.getLineHeight()))) + TextArea.this.firstLineShowing;
            TextArea textArea2 = TextArea.this;
            textArea2.cursorLine = Math.max(0, Math.min(textArea2.cursorLine, TextArea.this.getLines() - 1));
            super.setCursorPosition(max, f2);
            TextArea.this.updateCurrentLine();
        }

        /* JADX WARNING: Removed duplicated region for block: B:27:0x0079  */
        @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.ui.TextField.TextFieldClickListener
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean keyDown(com.badlogic.gdx.scenes.scene2d.InputEvent r4, int r5) {
            /*
            // Method dump skipped, instructions count: 131
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.TextArea.TextAreaListener.keyDown(com.badlogic.gdx.scenes.scene2d.InputEvent, int):boolean");
        }

        @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.ui.TextField.TextFieldClickListener
        public boolean keyTyped(InputEvent inputEvent, char c) {
            boolean keyTyped = super.keyTyped(inputEvent, c);
            TextArea.this.showCursor();
            return keyTyped;
        }

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField.TextFieldClickListener
        public void goHome(boolean z) {
            if (z) {
                TextArea.this.cursor = 0;
            } else if (TextArea.this.cursorLine * 2 < TextArea.this.linesBreak.size) {
                TextArea textArea = TextArea.this;
                textArea.cursor = textArea.linesBreak.get(TextArea.this.cursorLine * 2);
            }
        }

        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField.TextFieldClickListener
        public void goEnd(boolean z) {
            if (z || TextArea.this.cursorLine >= TextArea.this.getLines()) {
                TextArea textArea = TextArea.this;
                textArea.cursor = textArea.text.length();
            } else if ((TextArea.this.cursorLine * 2) + 1 < TextArea.this.linesBreak.size) {
                TextArea textArea2 = TextArea.this;
                textArea2.cursor = textArea2.linesBreak.get((TextArea.this.cursorLine * 2) + 1);
            }
        }
    }
}
