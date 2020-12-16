package com.badlogic.gdx.scenes.scene2d.ui;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.graphics.g2d.GlyphLayout;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.scenes.scene2d.utils.Disableable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.UIUtils;
import com.badlogic.gdx.utils.Clipboard;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.Timer;

public class TextField extends Widget implements Disableable {
    private static final char BACKSPACE = '\b';
    private static final char BULLET = 149;
    private static final char DELETE = 127;
    protected static final char ENTER_ANDROID = '\n';
    protected static final char ENTER_DESKTOP = '\r';
    private static final char TAB = '\t';
    public static float keyRepeatInitialTime = 0.4f;
    public static float keyRepeatTime = 0.1f;
    private static final Vector2 tmp1 = new Vector2();
    private static final Vector2 tmp2 = new Vector2();
    private static final Vector2 tmp3 = new Vector2();
    final Timer.Task blinkTask;
    float blinkTime;
    Clipboard clipboard;
    protected int cursor;
    boolean cursorOn;
    boolean disabled;
    protected CharSequence displayText;
    TextFieldFilter filter;
    boolean focusTraversal;
    boolean focused;
    protected float fontOffset;
    protected final FloatArray glyphPositions;
    protected boolean hasSelection;
    InputListener inputListener;
    final KeyRepeatTask keyRepeatTask;
    OnscreenKeyboard keyboard;
    long lastChangeTime;
    protected final GlyphLayout layout;
    TextFieldListener listener;
    private int maxLength;
    private String messageText;
    boolean onlyFontChars;
    private StringBuilder passwordBuffer;
    private char passwordCharacter;
    boolean passwordMode;
    boolean programmaticChangeEvents;
    float renderOffset;
    protected int selectionStart;
    private float selectionWidth;
    private float selectionX;
    TextFieldStyle style;
    protected String text;
    private int textHAlign;
    protected float textHeight;
    protected float textOffset;
    String undoText;
    private int visibleTextEnd;
    private int visibleTextStart;
    protected boolean writeEnters;

    public interface OnscreenKeyboard {
        void show(boolean z);
    }

    public interface TextFieldListener {
        void keyTyped(TextField textField, char c);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefWidth() {
        return 150.0f;
    }

    public TextField(String str, Skin skin) {
        this(str, (TextFieldStyle) skin.get(TextFieldStyle.class));
    }

    public TextField(String str, Skin skin, String str2) {
        this(str, (TextFieldStyle) skin.get(str2, TextFieldStyle.class));
    }

    public TextField(String str, TextFieldStyle textFieldStyle) {
        this.layout = new GlyphLayout();
        this.glyphPositions = new FloatArray();
        this.keyboard = new DefaultOnscreenKeyboard();
        this.focusTraversal = true;
        this.onlyFontChars = true;
        this.textHAlign = 8;
        this.undoText = BuildConfig.FLAVOR;
        this.passwordCharacter = BULLET;
        this.maxLength = 0;
        this.blinkTime = 0.32f;
        this.blinkTask = new Timer.Task() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.TextField.AnonymousClass1 */

            @Override // com.badlogic.gdx.utils.Timer.Task
            public void run() {
                TextField textField = TextField.this;
                textField.cursorOn = !textField.cursorOn;
                Gdx.graphics.requestRendering();
            }
        };
        this.keyRepeatTask = new KeyRepeatTask();
        setStyle(textFieldStyle);
        this.clipboard = Gdx.app.getClipboard();
        initialize();
        setText(str);
        setSize(getPrefWidth(), getPrefHeight());
    }

    /* access modifiers changed from: protected */
    public void initialize() {
        InputListener createInputListener = createInputListener();
        this.inputListener = createInputListener;
        addListener(createInputListener);
    }

    /* access modifiers changed from: protected */
    public InputListener createInputListener() {
        return new TextFieldClickListener();
    }

    /* access modifiers changed from: protected */
    public int letterUnderCursor(float f) {
        float f2 = f - (((this.textOffset + this.fontOffset) - this.style.font.getData().cursorX) - this.glyphPositions.get(this.visibleTextStart));
        if (getBackgroundDrawable() != null) {
            f2 -= this.style.background.getLeftWidth();
        }
        int i = this.glyphPositions.size;
        float[] fArr = this.glyphPositions.items;
        for (int i2 = 1; i2 < i; i2++) {
            if (fArr[i2] > f2) {
                int i3 = i2 - 1;
                return fArr[i2] - f2 <= f2 - fArr[i3] ? i2 : i3;
            }
        }
        return i - 1;
    }

    /* access modifiers changed from: protected */
    public boolean isWordCharacter(char c) {
        return Character.isLetterOrDigit(c);
    }

    /* access modifiers changed from: protected */
    public int[] wordUnderCursor(int i) {
        int i2;
        String str = this.text;
        int length = str.length();
        if (i < str.length()) {
            int i3 = i;
            while (true) {
                if (i3 >= length) {
                    break;
                } else if (!isWordCharacter(str.charAt(i3))) {
                    length = i3;
                    break;
                } else {
                    i3++;
                }
            }
            int i4 = i - 1;
            while (true) {
                if (i4 <= -1) {
                    i2 = 0;
                    break;
                } else if (!isWordCharacter(str.charAt(i4))) {
                    i2 = i4 + 1;
                    break;
                } else {
                    i4--;
                }
            }
        } else {
            i2 = str.length();
            length = 0;
        }
        return new int[]{i2, length};
    }

    /* access modifiers changed from: package-private */
    public int[] wordUnderCursor(float f) {
        return wordUnderCursor(letterUnderCursor(f));
    }

    /* access modifiers changed from: package-private */
    public boolean withinMaxLength(int i) {
        int i2 = this.maxLength;
        return i2 <= 0 || i < i2;
    }

    public void setMaxLength(int i) {
        this.maxLength = i;
    }

    public int getMaxLength() {
        return this.maxLength;
    }

    public void setOnlyFontChars(boolean z) {
        this.onlyFontChars = z;
    }

    public void setStyle(TextFieldStyle textFieldStyle) {
        if (textFieldStyle != null) {
            this.style = textFieldStyle;
            this.textHeight = textFieldStyle.font.getCapHeight() - (textFieldStyle.font.getDescent() * 2.0f);
            invalidateHierarchy();
            return;
        }
        throw new IllegalArgumentException("style cannot be null.");
    }

    public TextFieldStyle getStyle() {
        return this.style;
    }

    /* access modifiers changed from: protected */
    public void calculateOffsets() {
        float width = getWidth();
        Drawable backgroundDrawable = getBackgroundDrawable();
        if (backgroundDrawable != null) {
            width -= backgroundDrawable.getLeftWidth() + backgroundDrawable.getRightWidth();
        }
        int i = this.glyphPositions.size;
        float[] fArr = this.glyphPositions.items;
        float f = fArr[Math.max(0, this.cursor - 1)];
        float f2 = this.renderOffset;
        float f3 = f + f2;
        float f4 = 0.0f;
        if (f3 <= 0.0f) {
            this.renderOffset = f2 - f3;
        } else {
            float f5 = fArr[Math.min(i - 1, this.cursor + 1)] - width;
            if ((-this.renderOffset) < f5) {
                this.renderOffset = -f5;
            }
        }
        float f6 = fArr[i - 1];
        int i2 = i - 2;
        float f7 = 0.0f;
        while (i2 >= 0) {
            float f8 = fArr[i2];
            if (f6 - f8 > width) {
                break;
            }
            i2--;
            f7 = f8;
        }
        if ((-this.renderOffset) > f7) {
            this.renderOffset = -f7;
        }
        this.visibleTextStart = 0;
        int i3 = 0;
        while (true) {
            if (i3 >= i) {
                break;
            } else if (fArr[i3] >= (-this.renderOffset)) {
                this.visibleTextStart = i3;
                f4 = fArr[i3];
                break;
            } else {
                i3++;
            }
        }
        int i4 = this.visibleTextStart + 1;
        float f9 = width - this.renderOffset;
        int min = Math.min(this.displayText.length(), i);
        while (i4 <= min && fArr[i4] <= f9) {
            i4++;
        }
        this.visibleTextEnd = Math.max(0, i4 - 1);
        int i5 = this.textHAlign;
        if ((i5 & 8) == 0) {
            this.textOffset = width - (fArr[this.visibleTextEnd] - f4);
            if ((i5 & 1) != 0) {
                this.textOffset = (float) Math.round(this.textOffset * 0.5f);
            }
        } else {
            this.textOffset = f4 + this.renderOffset;
        }
        if (this.hasSelection) {
            int min2 = Math.min(this.cursor, this.selectionStart);
            int max = Math.max(this.cursor, this.selectionStart);
            float max2 = Math.max(fArr[min2] - fArr[this.visibleTextStart], -this.textOffset);
            float min3 = Math.min(fArr[max] - fArr[this.visibleTextStart], width - this.textOffset);
            this.selectionX = max2;
            this.selectionWidth = (min3 - max2) - this.style.font.getData().cursorX;
        }
    }

    private Drawable getBackgroundDrawable() {
        boolean hasKeyboardFocus = hasKeyboardFocus();
        if (!this.disabled || this.style.disabledBackground == null) {
            return (!hasKeyboardFocus || this.style.focusedBackground == null) ? this.style.background : this.style.focusedBackground;
        }
        return this.style.disabledBackground;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Widget, com.badlogic.gdx.scenes.scene2d.Actor
    public void draw(Batch batch, float f) {
        float f2;
        float f3;
        boolean hasKeyboardFocus = hasKeyboardFocus();
        if (hasKeyboardFocus != this.focused) {
            this.focused = hasKeyboardFocus;
            this.blinkTask.cancel();
            this.cursorOn = hasKeyboardFocus;
            if (hasKeyboardFocus) {
                Timer.Task task = this.blinkTask;
                float f4 = this.blinkTime;
                Timer.schedule(task, f4, f4);
            } else {
                this.keyRepeatTask.cancel();
            }
        } else if (!hasKeyboardFocus) {
            this.cursorOn = false;
        }
        BitmapFont bitmapFont = this.style.font;
        Color color = (!this.disabled || this.style.disabledFontColor == null) ? (!hasKeyboardFocus || this.style.focusedFontColor == null) ? this.style.fontColor : this.style.focusedFontColor : this.style.disabledFontColor;
        Drawable drawable = this.style.selection;
        Drawable drawable2 = this.style.cursor;
        Drawable backgroundDrawable = getBackgroundDrawable();
        Color color2 = getColor();
        float x = getX();
        float y = getY();
        float width = getWidth();
        float height = getHeight();
        batch.setColor(color2.r, color2.g, color2.b, color2.a * f);
        if (backgroundDrawable != null) {
            backgroundDrawable.draw(batch, x, y, width, height);
            f3 = backgroundDrawable.getLeftWidth();
            f2 = backgroundDrawable.getRightWidth();
        } else {
            f3 = 0.0f;
            f2 = 0.0f;
        }
        float textY = getTextY(bitmapFont, backgroundDrawable);
        calculateOffsets();
        if (hasKeyboardFocus && this.hasSelection && drawable != null) {
            drawSelection(drawable, batch, bitmapFont, x + f3, y + textY);
        }
        float f5 = bitmapFont.isFlipped() ? -this.textHeight : 0.0f;
        if (this.displayText.length() != 0) {
            bitmapFont.setColor(color.r, color.g, color.b, color.a * color2.a * f);
            drawText(batch, bitmapFont, x + f3, y + textY + f5);
        } else if (!hasKeyboardFocus && this.messageText != null) {
            BitmapFont bitmapFont2 = this.style.messageFont != null ? this.style.messageFont : bitmapFont;
            if (this.style.messageFontColor != null) {
                bitmapFont2.setColor(this.style.messageFontColor.r, this.style.messageFontColor.g, this.style.messageFontColor.b, this.style.messageFontColor.a * color2.a * f);
            } else {
                bitmapFont2.setColor(0.7f, 0.7f, 0.7f, color2.a * f);
            }
            drawMessageText(batch, bitmapFont2, x + f3, y + textY + f5, (width - f3) - f2);
        }
        if (!this.disabled && this.cursorOn && drawable2 != null) {
            drawCursor(drawable2, batch, bitmapFont, x + f3, y + textY);
        }
    }

    /* access modifiers changed from: protected */
    public float getTextY(BitmapFont bitmapFont, Drawable drawable) {
        float f;
        float height = getHeight();
        float descent = (this.textHeight / 2.0f) + bitmapFont.getDescent();
        if (drawable != null) {
            float bottomHeight = drawable.getBottomHeight();
            f = descent + (((height - drawable.getTopHeight()) - bottomHeight) / 2.0f) + bottomHeight;
        } else {
            f = descent + (height / 2.0f);
        }
        return bitmapFont.usesIntegerPositions() ? (float) ((int) f) : f;
    }

    /* access modifiers changed from: protected */
    public void drawSelection(Drawable drawable, Batch batch, BitmapFont bitmapFont, float f, float f2) {
        drawable.draw(batch, f + this.textOffset + this.selectionX + this.fontOffset, (f2 - this.textHeight) - bitmapFont.getDescent(), this.selectionWidth, this.textHeight);
    }

    /* access modifiers changed from: protected */
    public void drawText(Batch batch, BitmapFont bitmapFont, float f, float f2) {
        bitmapFont.draw(batch, this.displayText, f + this.textOffset, f2, this.visibleTextStart, this.visibleTextEnd, 0.0f, 8, false);
    }

    /* access modifiers changed from: protected */
    public void drawMessageText(Batch batch, BitmapFont bitmapFont, float f, float f2, float f3) {
        String str = this.messageText;
        bitmapFont.draw(batch, str, f, f2, 0, str.length(), f3, this.textHAlign, false, "...");
    }

    /* access modifiers changed from: protected */
    public void drawCursor(Drawable drawable, Batch batch, BitmapFont bitmapFont, float f, float f2) {
        drawable.draw(batch, (((f + this.textOffset) + this.glyphPositions.get(this.cursor)) - this.glyphPositions.get(this.visibleTextStart)) + this.fontOffset + bitmapFont.getData().cursorX, (f2 - this.textHeight) - bitmapFont.getDescent(), drawable.getMinWidth(), this.textHeight);
    }

    /* access modifiers changed from: package-private */
    public void updateDisplayText() {
        BitmapFont bitmapFont = this.style.font;
        BitmapFont.BitmapFontData data = bitmapFont.getData();
        String str = this.text;
        int length = str.length();
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (true) {
            char c = ' ';
            if (i >= length) {
                break;
            }
            char charAt = str.charAt(i);
            if (data.hasGlyph(charAt)) {
                c = charAt;
            }
            sb.append(c);
            i++;
        }
        String sb2 = sb.toString();
        if (!this.passwordMode || !data.hasGlyph(this.passwordCharacter)) {
            this.displayText = sb2;
        } else {
            if (this.passwordBuffer == null) {
                this.passwordBuffer = new StringBuilder(sb2.length());
            }
            if (this.passwordBuffer.length() > length) {
                this.passwordBuffer.setLength(length);
            } else {
                for (int length2 = this.passwordBuffer.length(); length2 < length; length2++) {
                    this.passwordBuffer.append(this.passwordCharacter);
                }
            }
            this.displayText = this.passwordBuffer;
        }
        this.layout.setText(bitmapFont, this.displayText.toString().replace(ENTER_DESKTOP, ' ').replace(ENTER_ANDROID, ' '));
        this.glyphPositions.clear();
        float f = 0.0f;
        if (this.layout.runs.size > 0) {
            FloatArray floatArray = this.layout.runs.first().xAdvances;
            this.fontOffset = floatArray.first();
            int i2 = floatArray.size;
            float f2 = 0.0f;
            for (int i3 = 1; i3 < i2; i3++) {
                this.glyphPositions.add(f2);
                f2 += floatArray.get(i3);
            }
            f = f2;
        } else {
            this.fontOffset = 0.0f;
        }
        this.glyphPositions.add(f);
        this.visibleTextStart = Math.min(this.visibleTextStart, this.glyphPositions.size - 1);
        this.visibleTextEnd = MathUtils.clamp(this.visibleTextEnd, this.visibleTextStart, this.glyphPositions.size - 1);
        if (this.selectionStart > sb2.length()) {
            this.selectionStart = length;
        }
    }

    public void copy() {
        if (this.hasSelection && !this.passwordMode) {
            this.clipboard.setContents(this.text.substring(Math.min(this.cursor, this.selectionStart), Math.max(this.cursor, this.selectionStart)));
        }
    }

    public void cut() {
        cut(this.programmaticChangeEvents);
    }

    /* access modifiers changed from: package-private */
    public void cut(boolean z) {
        if (this.hasSelection && !this.passwordMode) {
            copy();
            this.cursor = delete(z);
            updateDisplayText();
        }
    }

    /* access modifiers changed from: package-private */
    public void paste(String str, boolean z) {
        TextFieldFilter textFieldFilter;
        if (str != null) {
            StringBuilder sb = new StringBuilder();
            int length = this.text.length();
            if (this.hasSelection) {
                length -= Math.abs(this.cursor - this.selectionStart);
            }
            BitmapFont.BitmapFontData data = this.style.font.getData();
            int length2 = str.length();
            for (int i = 0; i < length2 && withinMaxLength(sb.length() + length); i++) {
                char charAt = str.charAt(i);
                if ((this.writeEnters && (charAt == '\n' || charAt == '\r')) || !(charAt == '\r' || charAt == '\n' || ((this.onlyFontChars && !data.hasGlyph(charAt)) || !((textFieldFilter = this.filter) == null || textFieldFilter.acceptChar(this, charAt))))) {
                    sb.append(charAt);
                }
            }
            String sb2 = sb.toString();
            if (this.hasSelection) {
                this.cursor = delete(z);
            }
            if (z) {
                String str2 = this.text;
                changeText(str2, insert(this.cursor, sb2, str2));
            } else {
                this.text = insert(this.cursor, sb2, this.text);
            }
            updateDisplayText();
            this.cursor += sb2.length();
        }
    }

    /* access modifiers changed from: package-private */
    public String insert(int i, CharSequence charSequence, String str) {
        if (str.length() == 0) {
            return charSequence.toString();
        }
        return str.substring(0, i) + ((Object) charSequence) + str.substring(i, str.length());
    }

    /* access modifiers changed from: package-private */
    public int delete(boolean z) {
        int i = this.selectionStart;
        int i2 = this.cursor;
        int min = Math.min(i, i2);
        int max = Math.max(i, i2);
        StringBuilder sb = new StringBuilder();
        String str = BuildConfig.FLAVOR;
        sb.append(min > 0 ? this.text.substring(0, min) : str);
        if (max < this.text.length()) {
            String str2 = this.text;
            str = str2.substring(max, str2.length());
        }
        sb.append(str);
        String sb2 = sb.toString();
        if (z) {
            changeText(this.text, sb2);
        } else {
            this.text = sb2;
        }
        clearSelection();
        return min;
    }

    public void next(boolean z) {
        Stage stage = getStage();
        if (stage != null) {
            Vector2 localToStageCoordinates = getParent().localToStageCoordinates(tmp2.set(getX(), getY()));
            Vector2 vector2 = tmp1;
            TextField textField = this;
            while (true) {
                TextField findNextTextField = textField.findNextTextField(stage.getActors(), null, vector2, localToStageCoordinates, z);
                if (findNextTextField == null) {
                    if (z) {
                        localToStageCoordinates.set(-3.4028235E38f, -3.4028235E38f);
                    } else {
                        localToStageCoordinates.set(Float.MAX_VALUE, Float.MAX_VALUE);
                    }
                    findNextTextField = textField.findNextTextField(stage.getActors(), null, vector2, localToStageCoordinates, z);
                }
                textField = findNextTextField;
                if (textField == null) {
                    Gdx.input.setOnscreenKeyboardVisible(false);
                    return;
                } else if (stage.setKeyboardFocus(textField)) {
                    textField.selectAll();
                    return;
                } else {
                    localToStageCoordinates.set(vector2);
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:41:0x008e, code lost:
        if (((r2.y > r12.y) ^ r14) != false) goto L_0x0093;
     */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0062  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0075 A[ADDED_TO_REGION] */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x007a  */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x0096  */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x00b1  */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00b5  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private com.badlogic.gdx.scenes.scene2d.ui.TextField findNextTextField(com.badlogic.gdx.utils.Array<com.badlogic.gdx.scenes.scene2d.Actor> r10, com.badlogic.gdx.scenes.scene2d.ui.TextField r11, com.badlogic.gdx.math.Vector2 r12, com.badlogic.gdx.math.Vector2 r13, boolean r14) {
        /*
        // Method dump skipped, instructions count: 208
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.TextField.findNextTextField(com.badlogic.gdx.utils.Array, com.badlogic.gdx.scenes.scene2d.ui.TextField, com.badlogic.gdx.math.Vector2, com.badlogic.gdx.math.Vector2, boolean):com.badlogic.gdx.scenes.scene2d.ui.TextField");
    }

    public InputListener getDefaultInputListener() {
        return this.inputListener;
    }

    public void setTextFieldListener(TextFieldListener textFieldListener) {
        this.listener = textFieldListener;
    }

    public void setTextFieldFilter(TextFieldFilter textFieldFilter) {
        this.filter = textFieldFilter;
    }

    public TextFieldFilter getTextFieldFilter() {
        return this.filter;
    }

    public void setFocusTraversal(boolean z) {
        this.focusTraversal = z;
    }

    public String getMessageText() {
        return this.messageText;
    }

    public void setMessageText(String str) {
        this.messageText = str;
    }

    public void appendText(String str) {
        if (str == null) {
            str = BuildConfig.FLAVOR;
        }
        clearSelection();
        this.cursor = this.text.length();
        paste(str, this.programmaticChangeEvents);
    }

    public void setText(String str) {
        if (str == null) {
            str = BuildConfig.FLAVOR;
        }
        if (!str.equals(this.text)) {
            clearSelection();
            String str2 = this.text;
            this.text = BuildConfig.FLAVOR;
            paste(str, false);
            if (this.programmaticChangeEvents) {
                changeText(str2, this.text);
            }
            this.cursor = 0;
        }
    }

    public String getText() {
        return this.text;
    }

    /* access modifiers changed from: package-private */
    public boolean changeText(String str, String str2) {
        if (str2.equals(str)) {
            return false;
        }
        this.text = str2;
        ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent) Pools.obtain(ChangeListener.ChangeEvent.class);
        boolean fire = fire(changeEvent);
        if (!fire) {
            str = str2;
        }
        this.text = str;
        Pools.free(changeEvent);
        return !fire;
    }

    public void setProgrammaticChangeEvents(boolean z) {
        this.programmaticChangeEvents = z;
    }

    public boolean getProgrammaticChangeEvents() {
        return this.programmaticChangeEvents;
    }

    public int getSelectionStart() {
        return this.selectionStart;
    }

    public String getSelection() {
        return this.hasSelection ? this.text.substring(Math.min(this.selectionStart, this.cursor), Math.max(this.selectionStart, this.cursor)) : BuildConfig.FLAVOR;
    }

    public void setSelection(int i, int i2) {
        if (i < 0) {
            throw new IllegalArgumentException("selectionStart must be >= 0");
        } else if (i2 >= 0) {
            int min = Math.min(this.text.length(), i);
            int min2 = Math.min(this.text.length(), i2);
            if (min2 == min) {
                clearSelection();
                return;
            }
            if (min2 < min) {
                min2 = min;
                min = min2;
            }
            this.hasSelection = true;
            this.selectionStart = min;
            this.cursor = min2;
        } else {
            throw new IllegalArgumentException("selectionEnd must be >= 0");
        }
    }

    public void selectAll() {
        setSelection(0, this.text.length());
    }

    public void clearSelection() {
        this.hasSelection = false;
    }

    public void setCursorPosition(int i) {
        if (i >= 0) {
            clearSelection();
            this.cursor = Math.min(i, this.text.length());
            return;
        }
        throw new IllegalArgumentException("cursorPosition must be >= 0");
    }

    public int getCursorPosition() {
        return this.cursor;
    }

    public OnscreenKeyboard getOnscreenKeyboard() {
        return this.keyboard;
    }

    public void setOnscreenKeyboard(OnscreenKeyboard onscreenKeyboard) {
        this.keyboard = onscreenKeyboard;
    }

    public void setClipboard(Clipboard clipboard2) {
        this.clipboard = clipboard2;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.Widget
    public float getPrefHeight() {
        float f;
        float f2 = 0.0f;
        if (this.style.background != null) {
            f = Math.max(0.0f, this.style.background.getBottomHeight() + this.style.background.getTopHeight());
            f2 = Math.max(0.0f, this.style.background.getMinHeight());
        } else {
            f = 0.0f;
        }
        if (this.style.focusedBackground != null) {
            f = Math.max(f, this.style.focusedBackground.getBottomHeight() + this.style.focusedBackground.getTopHeight());
            f2 = Math.max(f2, this.style.focusedBackground.getMinHeight());
        }
        if (this.style.disabledBackground != null) {
            f = Math.max(f, this.style.disabledBackground.getBottomHeight() + this.style.disabledBackground.getTopHeight());
            f2 = Math.max(f2, this.style.disabledBackground.getMinHeight());
        }
        return Math.max(f + this.textHeight, f2);
    }

    public void setAlignment(int i) {
        this.textHAlign = i;
    }

    public int getAlignment() {
        return this.textHAlign;
    }

    public void setPasswordMode(boolean z) {
        this.passwordMode = z;
        updateDisplayText();
    }

    public boolean isPasswordMode() {
        return this.passwordMode;
    }

    public void setPasswordCharacter(char c) {
        this.passwordCharacter = c;
        if (this.passwordMode) {
            updateDisplayText();
        }
    }

    public void setBlinkTime(float f) {
        this.blinkTime = f;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public void setDisabled(boolean z) {
        this.disabled = z;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public boolean isDisabled() {
        return this.disabled;
    }

    /* access modifiers changed from: protected */
    public void moveCursor(boolean z, boolean z2) {
        int i = 0;
        int length = z ? this.text.length() : 0;
        if (!z) {
            i = -1;
        }
        do {
            if (z) {
                int i2 = this.cursor + 1;
                this.cursor = i2;
                if (i2 >= length) {
                    return;
                }
            } else {
                int i3 = this.cursor - 1;
                this.cursor = i3;
                if (i3 <= length) {
                    return;
                }
            }
            if (!z2) {
                return;
            }
        } while (continueCursor(this.cursor, i));
    }

    /* access modifiers changed from: protected */
    public boolean continueCursor(int i, int i2) {
        return isWordCharacter(this.text.charAt(i + i2));
    }

    /* access modifiers changed from: package-private */
    public class KeyRepeatTask extends Timer.Task {
        int keycode;

        KeyRepeatTask() {
        }

        @Override // com.badlogic.gdx.utils.Timer.Task
        public void run() {
            TextField.this.inputListener.keyDown(null, this.keycode);
        }
    }

    public interface TextFieldFilter {
        boolean acceptChar(TextField textField, char c);

        public static class DigitsOnlyFilter implements TextFieldFilter {
            @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField.TextFieldFilter
            public boolean acceptChar(TextField textField, char c) {
                return Character.isDigit(c);
            }
        }
    }

    public static class DefaultOnscreenKeyboard implements OnscreenKeyboard {
        @Override // com.badlogic.gdx.scenes.scene2d.ui.TextField.OnscreenKeyboard
        public void show(boolean z) {
            Gdx.input.setOnscreenKeyboardVisible(z);
        }
    }

    public class TextFieldClickListener extends ClickListener {
        public TextFieldClickListener() {
        }

        @Override // com.badlogic.gdx.scenes.scene2d.utils.ClickListener
        public void clicked(InputEvent inputEvent, float f, float f2) {
            int tapCount = getTapCount() % 4;
            if (tapCount == 0) {
                TextField.this.clearSelection();
            }
            if (tapCount == 2) {
                int[] wordUnderCursor = TextField.this.wordUnderCursor(f);
                TextField.this.setSelection(wordUnderCursor[0], wordUnderCursor[1]);
            }
            if (tapCount == 3) {
                TextField.this.selectAll();
            }
        }

        @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.utils.ClickListener
        public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
            if (!super.touchDown(inputEvent, f, f2, i, i2)) {
                return false;
            }
            if (i == 0 && i2 != 0) {
                return false;
            }
            if (TextField.this.disabled) {
                return true;
            }
            setCursorPosition(f, f2);
            TextField textField = TextField.this;
            textField.selectionStart = textField.cursor;
            Stage stage = TextField.this.getStage();
            if (stage != null) {
                stage.setKeyboardFocus(TextField.this);
            }
            TextField.this.keyboard.show(true);
            TextField.this.hasSelection = true;
            return true;
        }

        @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.utils.ClickListener
        public void touchDragged(InputEvent inputEvent, float f, float f2, int i) {
            super.touchDragged(inputEvent, f, f2, i);
            setCursorPosition(f, f2);
        }

        @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.utils.ClickListener
        public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
            if (TextField.this.selectionStart == TextField.this.cursor) {
                TextField.this.hasSelection = false;
            }
            super.touchUp(inputEvent, f, f2, i, i2);
        }

        /* access modifiers changed from: protected */
        public void setCursorPosition(float f, float f2) {
            TextField textField = TextField.this;
            textField.cursor = textField.letterUnderCursor(f);
            TextField textField2 = TextField.this;
            textField2.cursorOn = textField2.focused;
            TextField.this.blinkTask.cancel();
            if (TextField.this.focused) {
                Timer.schedule(TextField.this.blinkTask, TextField.this.blinkTime, TextField.this.blinkTime);
            }
        }

        /* access modifiers changed from: protected */
        public void goHome(boolean z) {
            TextField.this.cursor = 0;
        }

        /* access modifiers changed from: protected */
        public void goEnd(boolean z) {
            TextField textField = TextField.this;
            textField.cursor = textField.text.length();
        }

        /* JADX WARNING: Removed duplicated region for block: B:42:0x00a1  */
        /* JADX WARNING: Removed duplicated region for block: B:60:0x00e7  */
        /* JADX WARNING: Removed duplicated region for block: B:72:0x012d  */
        @Override // com.badlogic.gdx.scenes.scene2d.InputListener
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean keyDown(com.badlogic.gdx.scenes.scene2d.InputEvent r11, int r12) {
            /*
            // Method dump skipped, instructions count: 305
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.scenes.scene2d.ui.TextField.TextFieldClickListener.keyDown(com.badlogic.gdx.scenes.scene2d.InputEvent, int):boolean");
        }

        /* access modifiers changed from: protected */
        public void scheduleKeyRepeatTask(int i) {
            if (!TextField.this.keyRepeatTask.isScheduled() || TextField.this.keyRepeatTask.keycode != i) {
                TextField.this.keyRepeatTask.keycode = i;
                TextField.this.keyRepeatTask.cancel();
                Timer.schedule(TextField.this.keyRepeatTask, TextField.keyRepeatInitialTime, TextField.keyRepeatTime);
            }
        }

        @Override // com.badlogic.gdx.scenes.scene2d.InputListener
        public boolean keyUp(InputEvent inputEvent, int i) {
            if (TextField.this.disabled) {
                return false;
            }
            TextField.this.keyRepeatTask.cancel();
            return true;
        }

        @Override // com.badlogic.gdx.scenes.scene2d.InputListener
        public boolean keyTyped(InputEvent inputEvent, char c) {
            String str;
            if (TextField.this.disabled) {
                return false;
            }
            if (c != '\r') {
                switch (c) {
                    case '\b':
                    case '\t':
                    case '\n':
                        break;
                    default:
                        if (c < ' ') {
                            return false;
                        }
                        break;
                }
            }
            if (!TextField.this.hasKeyboardFocus()) {
                return false;
            }
            if (UIUtils.isMac && Gdx.input.isKeyPressed(63)) {
                return true;
            }
            if ((c == '\t' || c == '\n') && TextField.this.focusTraversal) {
                TextField.this.next(UIUtils.shift());
            } else {
                boolean z = c == 127;
                boolean z2 = c == '\b';
                boolean z3 = c == '\r' || c == '\n';
                boolean z4 = z3 ? TextField.this.writeEnters : !TextField.this.onlyFontChars || TextField.this.style.font.getData().hasGlyph(c);
                boolean z5 = z2 || z;
                if (z4 || z5) {
                    String str2 = TextField.this.text;
                    int i = TextField.this.cursor;
                    if (z5) {
                        if (TextField.this.hasSelection) {
                            TextField textField = TextField.this;
                            textField.cursor = textField.delete(false);
                        } else {
                            if (z2 && TextField.this.cursor > 0) {
                                TextField textField2 = TextField.this;
                                StringBuilder sb = new StringBuilder();
                                sb.append(TextField.this.text.substring(0, TextField.this.cursor - 1));
                                String str3 = TextField.this.text;
                                TextField textField3 = TextField.this;
                                int i2 = textField3.cursor;
                                textField3.cursor = i2 - 1;
                                sb.append(str3.substring(i2));
                                textField2.text = sb.toString();
                                TextField.this.renderOffset = 0.0f;
                            }
                            if (z && TextField.this.cursor < TextField.this.text.length()) {
                                TextField textField4 = TextField.this;
                                textField4.text = TextField.this.text.substring(0, TextField.this.cursor) + TextField.this.text.substring(TextField.this.cursor + 1);
                            }
                        }
                    }
                    if (z4 && !z5) {
                        if (!z3 && TextField.this.filter != null && !TextField.this.filter.acceptChar(TextField.this, c)) {
                            return true;
                        }
                        TextField textField5 = TextField.this;
                        if (!textField5.withinMaxLength(textField5.text.length())) {
                            return true;
                        }
                        if (TextField.this.hasSelection) {
                            TextField textField6 = TextField.this;
                            textField6.cursor = textField6.delete(false);
                        }
                        if (z3) {
                            str = "\n";
                        } else {
                            str = String.valueOf(c);
                        }
                        TextField textField7 = TextField.this;
                        int i3 = textField7.cursor;
                        textField7.cursor = i3 + 1;
                        textField7.text = textField7.insert(i3, str, TextField.this.text);
                    }
                    String str4 = TextField.this.undoText;
                    TextField textField8 = TextField.this;
                    if (textField8.changeText(str2, textField8.text)) {
                        long currentTimeMillis = System.currentTimeMillis();
                        if (currentTimeMillis - 750 > TextField.this.lastChangeTime) {
                            TextField.this.undoText = str2;
                        }
                        TextField.this.lastChangeTime = currentTimeMillis;
                    } else {
                        TextField.this.cursor = i;
                    }
                    TextField.this.updateDisplayText();
                }
            }
            if (TextField.this.listener != null) {
                TextField.this.listener.keyTyped(TextField.this, c);
            }
            return true;
        }
    }

    public static class TextFieldStyle {
        public Drawable background;
        public Drawable cursor;
        public Drawable disabledBackground;
        public Color disabledFontColor;
        public Drawable focusedBackground;
        public Color focusedFontColor;
        public BitmapFont font;
        public Color fontColor;
        public BitmapFont messageFont;
        public Color messageFontColor;
        public Drawable selection;

        public TextFieldStyle() {
        }

        public TextFieldStyle(BitmapFont bitmapFont, Color color, Drawable drawable, Drawable drawable2, Drawable drawable3) {
            this.background = drawable3;
            this.cursor = drawable;
            this.font = bitmapFont;
            this.fontColor = color;
            this.selection = drawable2;
        }

        public TextFieldStyle(TextFieldStyle textFieldStyle) {
            this.messageFont = textFieldStyle.messageFont;
            Color color = textFieldStyle.messageFontColor;
            if (color != null) {
                this.messageFontColor = new Color(color);
            }
            this.background = textFieldStyle.background;
            this.focusedBackground = textFieldStyle.focusedBackground;
            this.disabledBackground = textFieldStyle.disabledBackground;
            this.cursor = textFieldStyle.cursor;
            this.font = textFieldStyle.font;
            Color color2 = textFieldStyle.fontColor;
            if (color2 != null) {
                this.fontColor = new Color(color2);
            }
            Color color3 = textFieldStyle.focusedFontColor;
            if (color3 != null) {
                this.focusedFontColor = new Color(color3);
            }
            Color color4 = textFieldStyle.disabledFontColor;
            if (color4 != null) {
                this.disabledFontColor = new Color(color4);
            }
            this.selection = textFieldStyle.selection;
        }
    }
}
