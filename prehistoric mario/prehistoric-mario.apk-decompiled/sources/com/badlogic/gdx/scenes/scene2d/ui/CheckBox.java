package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.graphics.g2d.BitmapFont;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.ui.TextButton;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Scaling;

public class CheckBox extends TextButton {
    private Image image;
    private Cell imageCell;
    private CheckBoxStyle style;

    public CheckBox(String str, Skin skin) {
        this(str, (CheckBoxStyle) skin.get(CheckBoxStyle.class));
    }

    public CheckBox(String str, Skin skin, String str2) {
        this(str, (CheckBoxStyle) skin.get(str2, CheckBoxStyle.class));
    }

    public CheckBox(String str, CheckBoxStyle checkBoxStyle) {
        super(str, checkBoxStyle);
        clearChildren();
        Label label = getLabel();
        Image image2 = new Image(checkBoxStyle.checkboxOff, Scaling.none);
        this.image = image2;
        this.imageCell = add(image2);
        add(label);
        label.setAlignment(8);
        setSize(getPrefWidth(), getPrefHeight());
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextButton, com.badlogic.gdx.scenes.scene2d.ui.Button
    public void setStyle(Button.ButtonStyle buttonStyle) {
        if (buttonStyle instanceof CheckBoxStyle) {
            super.setStyle(buttonStyle);
            this.style = (CheckBoxStyle) buttonStyle;
            return;
        }
        throw new IllegalArgumentException("style must be a CheckBoxStyle.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextButton, com.badlogic.gdx.scenes.scene2d.ui.TextButton, com.badlogic.gdx.scenes.scene2d.ui.Button
    public CheckBoxStyle getStyle() {
        return this.style;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.TextButton, com.badlogic.gdx.scenes.scene2d.ui.Button, com.badlogic.gdx.scenes.scene2d.ui.Table, com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void draw(Batch batch, float f) {
        Drawable drawable = isDisabled() ? (!this.isChecked || this.style.checkboxOnDisabled == null) ? this.style.checkboxOffDisabled : this.style.checkboxOnDisabled : null;
        if (drawable == null) {
            boolean z = isOver() && !isDisabled();
            if (!this.isChecked || this.style.checkboxOn == null) {
                drawable = (!z || this.style.checkboxOver == null) ? this.style.checkboxOff : this.style.checkboxOver;
            } else {
                drawable = (!z || this.style.checkboxOnOver == null) ? this.style.checkboxOn : this.style.checkboxOnOver;
            }
        }
        this.image.setDrawable(drawable);
        super.draw(batch, f);
    }

    public Image getImage() {
        return this.image;
    }

    public Cell getImageCell() {
        return this.imageCell;
    }

    public static class CheckBoxStyle extends TextButton.TextButtonStyle {
        public Drawable checkboxOff;
        public Drawable checkboxOffDisabled;
        public Drawable checkboxOn;
        public Drawable checkboxOnDisabled;
        public Drawable checkboxOnOver;
        public Drawable checkboxOver;

        public CheckBoxStyle() {
        }

        public CheckBoxStyle(Drawable drawable, Drawable drawable2, BitmapFont bitmapFont, Color color) {
            this.checkboxOff = drawable;
            this.checkboxOn = drawable2;
            this.font = bitmapFont;
            this.fontColor = color;
        }

        public CheckBoxStyle(CheckBoxStyle checkBoxStyle) {
            super(checkBoxStyle);
            this.checkboxOff = checkBoxStyle.checkboxOff;
            this.checkboxOn = checkBoxStyle.checkboxOn;
            this.checkboxOver = checkBoxStyle.checkboxOver;
            this.checkboxOffDisabled = checkBoxStyle.checkboxOffDisabled;
            this.checkboxOnDisabled = checkBoxStyle.checkboxOnDisabled;
        }
    }
}
