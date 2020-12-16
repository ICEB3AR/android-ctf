package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;

public class TextTooltip extends Tooltip<Label> {
    public TextTooltip(String str, Skin skin) {
        this(str, TooltipManager.getInstance(), (TextTooltipStyle) skin.get(TextTooltipStyle.class));
    }

    public TextTooltip(String str, Skin skin, String str2) {
        this(str, TooltipManager.getInstance(), (TextTooltipStyle) skin.get(str2, TextTooltipStyle.class));
    }

    public TextTooltip(String str, TextTooltipStyle textTooltipStyle) {
        this(str, TooltipManager.getInstance(), textTooltipStyle);
    }

    public TextTooltip(String str, TooltipManager tooltipManager, Skin skin) {
        this(str, tooltipManager, (TextTooltipStyle) skin.get(TextTooltipStyle.class));
    }

    public TextTooltip(String str, TooltipManager tooltipManager, Skin skin, String str2) {
        this(str, tooltipManager, (TextTooltipStyle) skin.get(str2, TextTooltipStyle.class));
    }

    public TextTooltip(String str, final TooltipManager tooltipManager, TextTooltipStyle textTooltipStyle) {
        super(null, tooltipManager);
        Label label = new Label(str, textTooltipStyle.label);
        label.setWrap(true);
        this.container.setActor(label);
        this.container.width(new Value() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.TextTooltip.AnonymousClass1 */

            @Override // com.badlogic.gdx.scenes.scene2d.ui.Value
            public float get(Actor actor) {
                return Math.min(tooltipManager.maxWidth, ((Label) TextTooltip.this.container.getActor()).getGlyphLayout().width);
            }
        });
        setStyle(textTooltipStyle);
    }

    public void setStyle(TextTooltipStyle textTooltipStyle) {
        if (textTooltipStyle == null) {
            throw new NullPointerException("style cannot be null");
        } else if (textTooltipStyle instanceof TextTooltipStyle) {
            ((Label) this.container.getActor()).setStyle(textTooltipStyle.label);
            this.container.setBackground(textTooltipStyle.background);
            this.container.maxWidth(textTooltipStyle.wrapWidth);
        } else {
            throw new IllegalArgumentException("style must be a TextTooltipStyle.");
        }
    }

    public static class TextTooltipStyle {
        public Drawable background;
        public Label.LabelStyle label;
        public float wrapWidth;

        public TextTooltipStyle() {
        }

        public TextTooltipStyle(Label.LabelStyle labelStyle, Drawable drawable) {
            this.label = labelStyle;
            this.background = drawable;
        }

        public TextTooltipStyle(TextTooltipStyle textTooltipStyle) {
            this.label = new Label.LabelStyle(textTooltipStyle.label);
            this.background = textTooltipStyle.background;
        }
    }
}
