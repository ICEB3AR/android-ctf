package com.uwsoft.editor.renderer.script;

import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.utils.ClickListener;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.DelayedRemovalArray;
import com.uwsoft.editor.renderer.actor.CompositeItem;

public class SimpleButtonScript implements IScript {
    public static final int TEXT_EFFECT_DOWN = 2;
    public static final int TEXT_EFFECT_NONE = 0;
    public static final int TEXT_EFFECT_PUSH = 1;
    protected CompositeItem buttonHolder;
    protected boolean isDown = false;
    protected boolean isToggled = false;
    protected final DelayedRemovalArray<ClickListener> listeners = new DelayedRemovalArray<>(0);
    protected float origTextScaleX;
    protected float origTextScaleY;
    protected float origTextY;
    protected int textEffect = 0;

    public static SimpleButtonScript selfInit(CompositeItem compositeItem) {
        SimpleButtonScript simpleButtonScript = new SimpleButtonScript();
        compositeItem.addScript(simpleButtonScript);
        return simpleButtonScript;
    }

    public int getTextEffect() {
        return this.textEffect;
    }

    public void setTextEffect(int i) {
        this.textEffect = i;
    }

    public boolean isDown() {
        return this.isDown;
    }

    public boolean isToggled() {
        return this.isToggled;
    }

    @Override // com.uwsoft.editor.renderer.script.IScript
    public void init(CompositeItem compositeItem) {
        this.buttonHolder = compositeItem;
        String stringVariable = compositeItem.getCustomVariables().getStringVariable("text");
        if (compositeItem.getLabelById("text") != null) {
            if (stringVariable != null) {
                compositeItem.getLabelById("text").setText(stringVariable);
            }
            compositeItem.getLabelById("text").setAlignment(1);
            this.origTextY = compositeItem.getLabelById("text").getY();
            this.origTextScaleX = compositeItem.getLabelById("text").getScaleX();
            this.origTextScaleY = compositeItem.getLabelById("text").getScaleY();
        }
        this.buttonHolder.addListener(new ClickListener() {
            /* class com.uwsoft.editor.renderer.script.SimpleButtonScript.AnonymousClass1 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.utils.ClickListener
            public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                SimpleButtonScript.this.isDown = true;
                for (int i3 = 0; i3 < SimpleButtonScript.this.listeners.size; i3++) {
                    SimpleButtonScript.this.listeners.get(i3).touchDown(inputEvent, f, f2, i, i2);
                }
                return super.touchDown(inputEvent, f, f2, i, i2);
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener, com.badlogic.gdx.scenes.scene2d.utils.ClickListener
            public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                SimpleButtonScript simpleButtonScript = SimpleButtonScript.this;
                simpleButtonScript.isDown = false;
                simpleButtonScript.isToggled = !simpleButtonScript.isToggled;
                for (int i3 = 0; i3 < SimpleButtonScript.this.listeners.size; i3++) {
                    SimpleButtonScript.this.listeners.get(i3).touchUp(inputEvent, f, f2, i, i2);
                }
                super.touchUp(inputEvent, f, f2, i, i2);
            }
        });
    }

    @Override // com.uwsoft.editor.renderer.script.IScript
    public void dispose() {
        clearListeners();
    }

    @Override // com.uwsoft.editor.renderer.script.IScript
    public void act(float f) {
        if (this.isDown) {
            this.buttonHolder.setLayerVisibilty("checked", false);
            this.buttonHolder.setLayerVisibilty("normal", false);
            this.buttonHolder.setLayerVisibilty("pressed", true);
        } else {
            if (!this.isToggled || !this.buttonHolder.layerExists("checked")) {
                this.buttonHolder.setLayerVisibilty("normal", true);
                this.buttonHolder.setLayerVisibilty("checked", false);
            } else {
                this.buttonHolder.setLayerVisibilty("checked", true);
                this.buttonHolder.setLayerVisibilty("normal", false);
            }
            this.buttonHolder.setLayerVisibilty("pressed", false);
        }
        if (this.buttonHolder.getLabelById("text") != null) {
            int i = this.textEffect;
            if (i == 2) {
                if (this.isDown) {
                    this.buttonHolder.getLabelById("text").setY(this.origTextY - (this.buttonHolder.mulY * 5.0f));
                } else {
                    this.buttonHolder.getLabelById("text").setY(this.origTextY);
                }
            } else if (i != 1) {
            } else {
                if (this.isDown) {
                    this.buttonHolder.getLabelById("text").setScale(0.9f);
                    return;
                }
                this.buttonHolder.getLabelById("text").setScaleX(this.origTextScaleX);
                this.buttonHolder.getLabelById("text").setScaleY(this.origTextScaleY);
            }
        }
    }

    public void setToggle(boolean z) {
        this.isToggled = z;
    }

    public boolean addListener(ClickListener clickListener) {
        if (this.listeners.contains(clickListener, true)) {
            return false;
        }
        this.listeners.add(clickListener);
        return true;
    }

    public boolean removeListener(ClickListener clickListener) {
        return this.listeners.removeValue(clickListener, true);
    }

    public Array<ClickListener> getListeners() {
        return this.listeners;
    }

    public void clearListeners() {
        this.listeners.clear();
    }

    public CompositeItem getItem() {
        return this.buttonHolder;
    }
}
