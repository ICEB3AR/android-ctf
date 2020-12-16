package com.badlogic.gdx.scenes.scene2d.ui;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.scenes.scene2d.ui.Button;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.utils.Scaling;

public class ImageButton extends Button {
    private final Image image;
    private ImageButtonStyle style;

    public ImageButton(Skin skin) {
        this((ImageButtonStyle) skin.get(ImageButtonStyle.class));
        setSkin(skin);
    }

    public ImageButton(Skin skin, String str) {
        this((ImageButtonStyle) skin.get(str, ImageButtonStyle.class));
        setSkin(skin);
    }

    public ImageButton(ImageButtonStyle imageButtonStyle) {
        super(imageButtonStyle);
        this.image = new Image();
        this.image.setScaling(Scaling.fit);
        add(this.image);
        setStyle(imageButtonStyle);
        setSize(getPrefWidth(), getPrefHeight());
    }

    public ImageButton(Drawable drawable) {
        this(new ImageButtonStyle(null, null, null, drawable, null, null));
    }

    public ImageButton(Drawable drawable, Drawable drawable2) {
        this(new ImageButtonStyle(null, null, null, drawable, drawable2, null));
    }

    public ImageButton(Drawable drawable, Drawable drawable2, Drawable drawable3) {
        this(new ImageButtonStyle(null, null, null, drawable, drawable2, drawable3));
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Button
    public void setStyle(Button.ButtonStyle buttonStyle) {
        if (buttonStyle instanceof ImageButtonStyle) {
            super.setStyle(buttonStyle);
            this.style = (ImageButtonStyle) buttonStyle;
            if (this.image != null) {
                updateImage();
                return;
            }
            return;
        }
        throw new IllegalArgumentException("style must be an ImageButtonStyle.");
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Button
    public ImageButtonStyle getStyle() {
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
        updateImage();
        super.draw(batch, f);
    }

    public Image getImage() {
        return this.image;
    }

    public Cell getImageCell() {
        return getCell(this.image);
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
        sb.append(name2.indexOf(36) != -1 ? "ImageButton " : BuildConfig.FLAVOR);
        sb.append(name2);
        sb.append(": ");
        sb.append(this.image.getDrawable());
        return sb.toString();
    }

    public static class ImageButtonStyle extends Button.ButtonStyle {
        public Drawable imageChecked;
        public Drawable imageCheckedOver;
        public Drawable imageDisabled;
        public Drawable imageDown;
        public Drawable imageOver;
        public Drawable imageUp;

        public ImageButtonStyle() {
        }

        public ImageButtonStyle(Drawable drawable, Drawable drawable2, Drawable drawable3, Drawable drawable4, Drawable drawable5, Drawable drawable6) {
            super(drawable, drawable2, drawable3);
            this.imageUp = drawable4;
            this.imageDown = drawable5;
            this.imageChecked = drawable6;
        }

        public ImageButtonStyle(ImageButtonStyle imageButtonStyle) {
            super(imageButtonStyle);
            this.imageUp = imageButtonStyle.imageUp;
            this.imageDown = imageButtonStyle.imageDown;
            this.imageOver = imageButtonStyle.imageOver;
            this.imageChecked = imageButtonStyle.imageChecked;
            this.imageCheckedOver = imageButtonStyle.imageCheckedOver;
            this.imageDisabled = imageButtonStyle.imageDisabled;
        }

        public ImageButtonStyle(Button.ButtonStyle buttonStyle) {
            super(buttonStyle);
        }
    }
}
