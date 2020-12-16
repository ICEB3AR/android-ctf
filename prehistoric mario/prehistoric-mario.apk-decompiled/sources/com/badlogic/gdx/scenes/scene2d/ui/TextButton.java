package com.badlogic.gdx.scenes.scene2d.ui;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;

public class TextButton extends Button {
    private Label label;
    private TextButtonStyle style;

    public TextButton(String str, Skin skin) {
        this(str, (TextButtonStyle) skin.get(TextButtonStyle.class));
        setSkin(skin);
    }

    public TextButton(String str, Skin skin, String str2) {
        this(str, (TextButtonStyle) skin.get(str2, TextButtonStyle.class));
        setSkin(skin);
    }

    public TextButton(String str, TextButtonStyle textButtonStyle) {
        setStyle(textButtonStyle);
        this.style = textButtonStyle;
        this.label = new Label(str, new Label.LabelStyle(textButtonStyle.font, textButtonStyle.fontColor));
        this.label.setAlignment(1);
        add(this.label).expand().fill();
        setSize(getPrefWidth(), getPrefHeight());
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Button
    public void setStyle(Button.ButtonStyle buttonStyle) {
        if (buttonStyle == null) {
            throw new NullPointerException("style cannot be null");
        } else if (buttonStyle instanceof TextButtonStyle) {
            super.setStyle(buttonStyle);
            TextButtonStyle textButtonStyle = (TextButtonStyle) buttonStyle;
            this.style = textButtonStyle;
            Label label2 = this.label;
            if (label2 != null) {
                Label.LabelStyle style2 = label2.getStyle();
                style2.font = textButtonStyle.font;
                style2.fontColor = textButtonStyle.fontColor;
                this.label.setStyle(style2);
            }
        } else {
            throw new IllegalArgumentException("style must be a TextButtonStyle.");
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Button
    public TextButtonStyle getStyle() {
        return this.style;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Button, com.badlogic.gdx.scenes.scene2d.ui.Table, com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void draw(Batch batch, float f) {
        Color color;
        if (isDisabled() && this.style.disabledFontColor != null) {
            color = this.style.disabledFontColor;
        } else if (isPressed() && this.style.downFontColor != null) {
            color = this.style.downFontColor;
        } else if (!this.isChecked || this.style.checkedFontColor == null) {
            color = (!isOver() || this.style.overFontColor == null) ? this.style.fontColor : this.style.overFontColor;
        } else {
            color = (!isOver() || this.style.checkedOverFontColor == null) ? this.style.checkedFontColor : this.style.checkedOverFontColor;
        }
        if (color != null) {
            this.label.getStyle().fontColor = color;
        }
        super.draw(batch, f);
    }

    public void setLabel(Label label2) {
        getLabelCell().setActor(label2);
        this.label = label2;
    }

    public Label getLabel() {
        return this.label;
    }

    public Cell<Label> getLabelCell() {
        return getCell(this.label);
    }

    public void setText(String str) {
        this.label.setText(str);
    }

    public CharSequence getText() {
        return this.label.getText();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
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
        sb.append(name2.indexOf(36) != -1 ? "TextButton " : BuildConfig.FLAVOR);
        sb.append(name2);
        sb.append(": ");
        sb.append((Object) this.label.getText());
        return sb.toString();
    }

    public static class TextButtonStyle extends Button.ButtonStyle {
        public Color checkedFontColor;
        public Color checkedOverFontColor;
        public Color disabledFontColor;
        public Color downFontColor;
        public BitmapFont font;
        public Color fontColor;
        public Color overFontColor;

        public TextButtonStyle() {
        }

        public TextButtonStyle(Drawable drawable, Drawable drawable2, Drawable drawable3, BitmapFont bitmapFont) {
            super(drawable, drawable2, drawable3);
            this.font = bitmapFont;
        }

        public TextButtonStyle(TextButtonStyle textButtonStyle) {
            super(textButtonStyle);
            this.font = textButtonStyle.font;
            Color color = textButtonStyle.fontColor;
            if (color != null) {
                this.fontColor = new Color(color);
            }
            Color color2 = textButtonStyle.downFontColor;
            if (color2 != null) {
                this.downFontColor = new Color(color2);
            }
            Color color3 = textButtonStyle.overFontColor;
            if (color3 != null) {
                this.overFontColor = new Color(color3);
            }
            Color color4 = textButtonStyle.checkedFontColor;
            if (color4 != null) {
                this.checkedFontColor = new Color(color4);
            }
            Color color5 = textButtonStyle.checkedOverFontColor;
            if (color5 != null) {
                this.checkedOverFontColor = new Color(color5);
            }
            Color color6 = textButtonStyle.disabledFontColor;
            if (color6 != null) {
                this.disabledFontColor = new Color(color6);
            }
        }
    }
}
