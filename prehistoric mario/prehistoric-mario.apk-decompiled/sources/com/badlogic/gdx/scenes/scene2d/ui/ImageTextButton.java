package com.badlogic.gdx.scenes.scene2d.ui;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.scenes.scene2d.ui.TextButton;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Scaling;

public class ImageTextButton extends Button {
    private final Image image;
    private Label label;
    private ImageTextButtonStyle style;

    public ImageTextButton(String str, Skin skin) {
        this(str, (ImageTextButtonStyle) skin.get(ImageTextButtonStyle.class));
        setSkin(skin);
    }

    public ImageTextButton(String str, Skin skin, String str2) {
        this(str, (ImageTextButtonStyle) skin.get(str2, ImageTextButtonStyle.class));
        setSkin(skin);
    }

    public ImageTextButton(String str, ImageTextButtonStyle imageTextButtonStyle) {
        super(imageTextButtonStyle);
        this.style = imageTextButtonStyle;
        defaults().space(3.0f);
        this.image = new Image();
        this.image.setScaling(Scaling.fit);
        this.label = new Label(str, new Label.LabelStyle(imageTextButtonStyle.font, imageTextButtonStyle.fontColor));
        this.label.setAlignment(1);
        add(this.image);
        add(this.label);
        setStyle(imageTextButtonStyle);
        setSize(getPrefWidth(), getPrefHeight());
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Button
    public void setStyle(Button.ButtonStyle buttonStyle) {
        if (buttonStyle instanceof ImageTextButtonStyle) {
            super.setStyle(buttonStyle);
            ImageTextButtonStyle imageTextButtonStyle = (ImageTextButtonStyle) buttonStyle;
            this.style = imageTextButtonStyle;
            if (this.image != null) {
                updateImage();
            }
            Label label2 = this.label;
            if (label2 != null) {
                Label.LabelStyle style2 = label2.getStyle();
                style2.font = imageTextButtonStyle.font;
                style2.fontColor = imageTextButtonStyle.fontColor;
                this.label.setStyle(style2);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("style must be a ImageTextButtonStyle.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Button
    public ImageTextButtonStyle getStyle() {
        return this.style;
    }

    /* access modifiers changed from: protected */
    public void updateImage() {
        Drawable drawable;
        if (isDisabled() && this.style.imageDisabled != null) {
            drawable = this.style.imageDisabled;
        } else if (isPressed() && this.style.imageDown != null) {
            drawable = this.style.imageDown;
        } else if (!this.isChecked || this.style.imageChecked == null) {
            drawable = (!isOver() || this.style.imageOver == null) ? this.style.imageUp != null ? this.style.imageUp : null : this.style.imageOver;
        } else {
            drawable = (this.style.imageCheckedOver == null || !isOver()) ? this.style.imageChecked : this.style.imageCheckedOver;
        }
        this.image.setDrawable(drawable);
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Button, com.badlogic.gdx.scenes.scene2d.ui.Table, com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void draw(Batch batch, float f) {
        Color color;
        updateImage();
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

    public Image getImage() {
        return this.image;
    }

    public Cell getImageCell() {
        return getCell(this.image);
    }

    public void setLabel(Label label2) {
        getLabelCell().setActor(label2);
        this.label = label2;
    }

    public Label getLabel() {
        return this.label;
    }

    public Cell getLabelCell() {
        return getCell(this.label);
    }

    public void setText(CharSequence charSequence) {
        this.label.setText(charSequence);
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
        sb.append(name2.indexOf(36) != -1 ? "ImageTextButton " : BuildConfig.FLAVOR);
        sb.append(name2);
        sb.append(": ");
        sb.append(this.image.getDrawable());
        sb.append(" ");
        sb.append((Object) this.label.getText());
        return sb.toString();
    }

    public static class ImageTextButtonStyle extends TextButton.TextButtonStyle {
        public Drawable imageChecked;
        public Drawable imageCheckedOver;
        public Drawable imageDisabled;
        public Drawable imageDown;
        public Drawable imageOver;
        public Drawable imageUp;

        public ImageTextButtonStyle() {
        }

        public ImageTextButtonStyle(Drawable drawable, Drawable drawable2, Drawable drawable3, BitmapFont bitmapFont) {
            super(drawable, drawable2, drawable3, bitmapFont);
        }

        public ImageTextButtonStyle(ImageTextButtonStyle imageTextButtonStyle) {
            super(imageTextButtonStyle);
            Drawable drawable = imageTextButtonStyle.imageUp;
            if (drawable != null) {
                this.imageUp = drawable;
            }
            Drawable drawable2 = imageTextButtonStyle.imageDown;
            if (drawable2 != null) {
                this.imageDown = drawable2;
            }
            Drawable drawable3 = imageTextButtonStyle.imageOver;
            if (drawable3 != null) {
                this.imageOver = drawable3;
            }
            Drawable drawable4 = imageTextButtonStyle.imageChecked;
            if (drawable4 != null) {
                this.imageChecked = drawable4;
            }
            Drawable drawable5 = imageTextButtonStyle.imageCheckedOver;
            if (drawable5 != null) {
                this.imageCheckedOver = drawable5;
            }
            Drawable drawable6 = imageTextButtonStyle.imageDisabled;
            if (drawable6 != null) {
                this.imageDisabled = drawable6;
            }
        }

        public ImageTextButtonStyle(TextButton.TextButtonStyle textButtonStyle) {
            super(textButtonStyle);
        }
    }
}
