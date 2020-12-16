package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.Touchable;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.scenes.scene2d.utils.Disableable;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;
import com.badlogic.gdx.scenes.scene2d.utils.FocusListener;
import com.badlogic.gdx.utils.Pools;
import com.badlogic.gdx.utils.SnapshotArray;

public class Button extends Table implements Disableable {
    ButtonGroup buttonGroup;
    private ClickListener clickListener;
    boolean focused;
    boolean isChecked;
    boolean isDisabled;
    private boolean programmaticChangeEvents;
    private ButtonStyle style;

    public Button(Skin skin) {
        super(skin);
        this.programmaticChangeEvents = true;
        initialize();
        setStyle((ButtonStyle) skin.get(ButtonStyle.class));
        setSize(getPrefWidth(), getPrefHeight());
    }

    public Button(Skin skin, String str) {
        super(skin);
        this.programmaticChangeEvents = true;
        initialize();
        setStyle((ButtonStyle) skin.get(str, ButtonStyle.class));
        setSize(getPrefWidth(), getPrefHeight());
    }

    public Button(Actor actor, Skin skin, String str) {
        this(actor, (ButtonStyle) skin.get(str, ButtonStyle.class));
        setSkin(skin);
    }

    public Button(Actor actor, ButtonStyle buttonStyle) {
        this.programmaticChangeEvents = true;
        initialize();
        add(actor);
        setStyle(buttonStyle);
        setSize(getPrefWidth(), getPrefHeight());
    }

    public Button(ButtonStyle buttonStyle) {
        this.programmaticChangeEvents = true;
        initialize();
        setStyle(buttonStyle);
        setSize(getPrefWidth(), getPrefHeight());
    }

    public Button() {
        this.programmaticChangeEvents = true;
        initialize();
    }

    private void initialize() {
        setTouchable(Touchable.enabled);
        AnonymousClass1 r0 = new ClickListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Button.AnonymousClass1 */

            @Override // com.badlogic.gdx.scenes.scene2d.utils.ClickListener
            public void clicked(InputEvent inputEvent, float f, float f2) {
                if (!Button.this.isDisabled()) {
                    Button button = Button.this;
                    button.setChecked(!button.isChecked, true);
                }
            }
        };
        this.clickListener = r0;
        addListener(r0);
        addListener(new FocusListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Button.AnonymousClass2 */

            @Override // com.badlogic.gdx.scenes.scene2d.utils.FocusListener
            public void keyboardFocusChanged(FocusListener.FocusEvent focusEvent, Actor actor, boolean z) {
                Button.this.focused = z;
            }
        });
    }

    public Button(Drawable drawable) {
        this(new ButtonStyle(drawable, null, null));
    }

    public Button(Drawable drawable, Drawable drawable2) {
        this(new ButtonStyle(drawable, drawable2, null));
    }

    public Button(Drawable drawable, Drawable drawable2, Drawable drawable3) {
        this(new ButtonStyle(drawable, drawable2, drawable3));
    }

    public Button(Actor actor, Skin skin) {
        this(actor, (ButtonStyle) skin.get(ButtonStyle.class));
    }

    public void setChecked(boolean z) {
        setChecked(z, this.programmaticChangeEvents);
    }

    /* access modifiers changed from: package-private */
    public void setChecked(boolean z, boolean z2) {
        if (this.isChecked != z) {
            ButtonGroup buttonGroup2 = this.buttonGroup;
            if (buttonGroup2 == null || buttonGroup2.canCheck(this, z)) {
                this.isChecked = z;
                if (z2) {
                    ChangeListener.ChangeEvent changeEvent = (ChangeListener.ChangeEvent) Pools.obtain(ChangeListener.ChangeEvent.class);
                    if (fire(changeEvent)) {
                        this.isChecked = !z;
                    }
                    Pools.free(changeEvent);
                }
            }
        }
    }

    public void toggle() {
        setChecked(!this.isChecked);
    }

    public boolean isChecked() {
        return this.isChecked;
    }

    public boolean isPressed() {
        return this.clickListener.isVisualPressed();
    }

    public boolean isOver() {
        return this.clickListener.isOver();
    }

    public ClickListener getClickListener() {
        return this.clickListener;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public boolean isDisabled() {
        return this.isDisabled;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.utils.Disableable
    public void setDisabled(boolean z) {
        this.isDisabled = z;
    }

    public void setProgrammaticChangeEvents(boolean z) {
        this.programmaticChangeEvents = z;
    }

    public void setStyle(ButtonStyle buttonStyle) {
        Drawable drawable;
        if (buttonStyle != null) {
            this.style = buttonStyle;
            if (!isPressed() || isDisabled()) {
                drawable = (!isDisabled() || buttonStyle.disabled == null) ? (!this.isChecked || buttonStyle.checked == null) ? (!isOver() || buttonStyle.over == null) ? (!this.focused || buttonStyle.focused == null) ? buttonStyle.up : buttonStyle.focused : buttonStyle.over : (!isOver() || buttonStyle.checkedOver == null) ? (!this.focused || buttonStyle.checkedFocused == null) ? buttonStyle.checked : buttonStyle.checkedFocused : buttonStyle.checkedOver : buttonStyle.disabled;
            } else {
                drawable = buttonStyle.down == null ? buttonStyle.up : buttonStyle.down;
            }
            setBackground(drawable);
            return;
        }
        throw new IllegalArgumentException("style cannot be null.");
    }

    public ButtonStyle getStyle() {
        return this.style;
    }

    public ButtonGroup getButtonGroup() {
        return this.buttonGroup;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Table, com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public void draw(Batch batch, float f) {
        Drawable drawable;
        float f2;
        float f3;
        validate();
        boolean isDisabled2 = isDisabled();
        boolean isPressed = isPressed();
        boolean isChecked2 = isChecked();
        boolean isOver = isOver();
        if (isDisabled2 && this.style.disabled != null) {
            drawable = this.style.disabled;
        } else if (isPressed && this.style.down != null) {
            drawable = this.style.down;
        } else if (!isChecked2 || this.style.checked == null) {
            if (isOver && this.style.over != null) {
                drawable = this.style.over;
            } else if (!this.focused || this.style.focused == null) {
                drawable = this.style.up != null ? this.style.up : null;
            } else {
                drawable = this.style.focused;
            }
        } else if (this.style.checkedOver != null && isOver) {
            drawable = this.style.checkedOver;
        } else if (this.style.checkedFocused == null || !this.focused) {
            drawable = this.style.checked;
        } else {
            drawable = this.style.checkedFocused;
        }
        setBackground(drawable);
        if (isPressed && !isDisabled2) {
            f3 = this.style.pressedOffsetX;
            f2 = this.style.pressedOffsetY;
        } else if (!isChecked2 || isDisabled2) {
            f3 = this.style.unpressedOffsetX;
            f2 = this.style.unpressedOffsetY;
        } else {
            f3 = this.style.checkedOffsetX;
            f2 = this.style.checkedOffsetY;
        }
        SnapshotArray<Actor> children = getChildren();
        for (int i = 0; i < children.size; i++) {
            children.get(i).moveBy(f3, f2);
        }
        super.draw(batch, f);
        for (int i2 = 0; i2 < children.size; i2++) {
            children.get(i2).moveBy(-f3, -f2);
        }
        Stage stage = getStage();
        if (!(stage == null || !stage.getActionsRequestRendering() || isPressed == this.clickListener.isPressed())) {
            Gdx.graphics.requestRendering();
        }
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Table, com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefWidth() {
        float prefWidth = super.getPrefWidth();
        if (this.style.up != null) {
            prefWidth = Math.max(prefWidth, this.style.up.getMinWidth());
        }
        if (this.style.down != null) {
            prefWidth = Math.max(prefWidth, this.style.down.getMinWidth());
        }
        return this.style.checked != null ? Math.max(prefWidth, this.style.checked.getMinWidth()) : prefWidth;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Table, com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getPrefHeight() {
        float prefHeight = super.getPrefHeight();
        if (this.style.up != null) {
            prefHeight = Math.max(prefHeight, this.style.up.getMinHeight());
        }
        if (this.style.down != null) {
            prefHeight = Math.max(prefHeight, this.style.down.getMinHeight());
        }
        return this.style.checked != null ? Math.max(prefHeight, this.style.checked.getMinHeight()) : prefHeight;
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Table, com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinWidth() {
        return getPrefWidth();
    }

    @Override // com.badlogic.gdx.scenes.scene2d.ui.Table, com.badlogic.gdx.scenes.scene2d.utils.Layout, com.badlogic.gdx.scenes.scene2d.ui.WidgetGroup
    public float getMinHeight() {
        return getPrefHeight();
    }

    public static class ButtonStyle {
        public Drawable checked;
        public Drawable checkedFocused;
        public float checkedOffsetX;
        public float checkedOffsetY;
        public Drawable checkedOver;
        public Drawable disabled;
        public Drawable down;
        public Drawable focused;
        public Drawable over;
        public float pressedOffsetX;
        public float pressedOffsetY;
        public float unpressedOffsetX;
        public float unpressedOffsetY;
        public Drawable up;

        public ButtonStyle() {
        }

        public ButtonStyle(Drawable drawable, Drawable drawable2, Drawable drawable3) {
            this.up = drawable;
            this.down = drawable2;
            this.checked = drawable3;
        }

        public ButtonStyle(ButtonStyle buttonStyle) {
            this.up = buttonStyle.up;
            this.down = buttonStyle.down;
            this.over = buttonStyle.over;
            this.focused = buttonStyle.focused;
            this.checked = buttonStyle.checked;
            this.checkedOver = buttonStyle.checkedOver;
            this.checkedFocused = buttonStyle.checkedFocused;
            this.disabled = buttonStyle.disabled;
            this.pressedOffsetX = buttonStyle.pressedOffsetX;
            this.pressedOffsetY = buttonStyle.pressedOffsetY;
            this.unpressedOffsetX = buttonStyle.unpressedOffsetX;
            this.unpressedOffsetY = buttonStyle.unpressedOffsetY;
            this.checkedOffsetX = buttonStyle.checkedOffsetX;
            this.checkedOffsetY = buttonStyle.checkedOffsetY;
        }
    }
}
