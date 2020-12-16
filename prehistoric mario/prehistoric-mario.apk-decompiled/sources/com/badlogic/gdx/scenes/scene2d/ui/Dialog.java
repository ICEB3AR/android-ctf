package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.scenes.scene2d.Action;
import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.actions.Actions;
import com.badlogic.gdx.scenes.scene2d.ui.Label;
import com.badlogic.gdx.scenes.scene2d.ui.TextButton;
import com.badlogic.gdx.scenes.scene2d.ui.Window;
import com.badlogic.gdx.scenes.scene2d.utils.ChangeListener;
import com.badlogic.gdx.scenes.scene2d.utils.FocusListener;
import com.badlogic.gdx.utils.ObjectMap;

public class Dialog extends Window {
    Table buttonTable;
    boolean cancelHide;
    Table contentTable;
    FocusListener focusListener;
    protected InputListener ignoreTouchDown = new InputListener() {
        /* class com.badlogic.gdx.scenes.scene2d.ui.Dialog.AnonymousClass1 */

        @Override // com.badlogic.gdx.scenes.scene2d.InputListener
        public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
            inputEvent.cancel();
            return false;
        }
    };
    Actor previousKeyboardFocus;
    Actor previousScrollFocus;
    private Skin skin;
    ObjectMap<Actor, Object> values = new ObjectMap<>();

    /* access modifiers changed from: protected */
    public void result(Object obj) {
    }

    public Dialog(String str, Skin skin2) {
        super(str, (Window.WindowStyle) skin2.get(Window.WindowStyle.class));
        setSkin(skin2);
        this.skin = skin2;
        initialize();
    }

    public Dialog(String str, Skin skin2, String str2) {
        super(str, (Window.WindowStyle) skin2.get(str2, Window.WindowStyle.class));
        setSkin(skin2);
        this.skin = skin2;
        initialize();
    }

    public Dialog(String str, Window.WindowStyle windowStyle) {
        super(str, windowStyle);
        initialize();
    }

    private void initialize() {
        setModal(true);
        defaults().space(6.0f);
        Table table = new Table(this.skin);
        this.contentTable = table;
        add(table).expand().fill();
        row();
        Table table2 = new Table(this.skin);
        this.buttonTable = table2;
        add(table2).fillX();
        this.contentTable.defaults().space(6.0f);
        this.buttonTable.defaults().space(6.0f);
        this.buttonTable.addListener(new ChangeListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Dialog.AnonymousClass2 */

            @Override // com.badlogic.gdx.scenes.scene2d.utils.ChangeListener
            public void changed(ChangeListener.ChangeEvent changeEvent, Actor actor) {
                if (Dialog.this.values.containsKey(actor)) {
                    while (actor.getParent() != Dialog.this.buttonTable) {
                        actor = actor.getParent();
                    }
                    Dialog dialog = Dialog.this;
                    dialog.result(dialog.values.get(actor));
                    if (!Dialog.this.cancelHide) {
                        Dialog.this.hide();
                    }
                    Dialog.this.cancelHide = false;
                }
            }
        });
        this.focusListener = new FocusListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Dialog.AnonymousClass3 */

            @Override // com.badlogic.gdx.scenes.scene2d.utils.FocusListener
            public void keyboardFocusChanged(FocusListener.FocusEvent focusEvent, Actor actor, boolean z) {
                if (!z) {
                    focusChanged(focusEvent);
                }
            }

            @Override // com.badlogic.gdx.scenes.scene2d.utils.FocusListener
            public void scrollFocusChanged(FocusListener.FocusEvent focusEvent, Actor actor, boolean z) {
                if (!z) {
                    focusChanged(focusEvent);
                }
            }

            private void focusChanged(FocusListener.FocusEvent focusEvent) {
                Actor relatedActor;
                Stage stage = Dialog.this.getStage();
                if (Dialog.this.isModal && stage != null && stage.getRoot().getChildren().size > 0 && stage.getRoot().getChildren().peek() == Dialog.this && (relatedActor = focusEvent.getRelatedActor()) != null && !relatedActor.isDescendantOf(Dialog.this) && !relatedActor.equals(Dialog.this.previousKeyboardFocus) && !relatedActor.equals(Dialog.this.previousScrollFocus)) {
                    focusEvent.cancel();
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.scenes.scene2d.Group, com.badlogic.gdx.scenes.scene2d.Actor
    public void setStage(Stage stage) {
        if (stage == null) {
            addListener(this.focusListener);
        } else {
            removeListener(this.focusListener);
        }
        super.setStage(stage);
    }

    public Table getContentTable() {
        return this.contentTable;
    }

    public Table getButtonTable() {
        return this.buttonTable;
    }

    public Dialog text(String str) {
        Skin skin2 = this.skin;
        if (skin2 != null) {
            return text(str, (Label.LabelStyle) skin2.get(Label.LabelStyle.class));
        }
        throw new IllegalStateException("This method may only be used if the dialog was constructed with a Skin.");
    }

    public Dialog text(String str, Label.LabelStyle labelStyle) {
        return text(new Label(str, labelStyle));
    }

    public Dialog text(Label label) {
        this.contentTable.add(label);
        return this;
    }

    public Dialog button(String str) {
        return button(str, (Object) null);
    }

    public Dialog button(String str, Object obj) {
        Skin skin2 = this.skin;
        if (skin2 != null) {
            return button(str, obj, (TextButton.TextButtonStyle) skin2.get(TextButton.TextButtonStyle.class));
        }
        throw new IllegalStateException("This method may only be used if the dialog was constructed with a Skin.");
    }

    public Dialog button(String str, Object obj, TextButton.TextButtonStyle textButtonStyle) {
        return button(new TextButton(str, textButtonStyle), obj);
    }

    public Dialog button(Button button) {
        return button(button, (Object) null);
    }

    public Dialog button(Button button, Object obj) {
        this.buttonTable.add(button);
        setObject(button, obj);
        return this;
    }

    public Dialog show(Stage stage, Action action) {
        clearActions();
        removeCaptureListener(this.ignoreTouchDown);
        this.previousKeyboardFocus = null;
        Actor keyboardFocus = stage.getKeyboardFocus();
        if (keyboardFocus != null && !keyboardFocus.isDescendantOf(this)) {
            this.previousKeyboardFocus = keyboardFocus;
        }
        this.previousScrollFocus = null;
        Actor scrollFocus = stage.getScrollFocus();
        if (scrollFocus != null && !scrollFocus.isDescendantOf(this)) {
            this.previousScrollFocus = scrollFocus;
        }
        stage.addActor(this);
        pack();
        stage.cancelTouchFocus();
        stage.setKeyboardFocus(this);
        stage.setScrollFocus(this);
        if (action != null) {
            addAction(action);
        }
        return this;
    }

    public Dialog show(Stage stage) {
        show(stage, Actions.sequence(Actions.alpha(0.0f), Actions.fadeIn(0.4f, Interpolation.fade)));
        setPosition((float) Math.round((stage.getWidth() - getWidth()) / 2.0f), (float) Math.round((stage.getHeight() - getHeight()) / 2.0f));
        return this;
    }

    public void hide(Action action) {
        Stage stage = getStage();
        if (stage != null) {
            removeListener(this.focusListener);
            Actor actor = this.previousKeyboardFocus;
            if (actor != null && actor.getStage() == null) {
                this.previousKeyboardFocus = null;
            }
            Actor keyboardFocus = stage.getKeyboardFocus();
            if (keyboardFocus == null || keyboardFocus.isDescendantOf(this)) {
                stage.setKeyboardFocus(this.previousKeyboardFocus);
            }
            Actor actor2 = this.previousScrollFocus;
            if (actor2 != null && actor2.getStage() == null) {
                this.previousScrollFocus = null;
            }
            Actor scrollFocus = stage.getScrollFocus();
            if (scrollFocus == null || scrollFocus.isDescendantOf(this)) {
                stage.setScrollFocus(this.previousScrollFocus);
            }
        }
        if (action != null) {
            addCaptureListener(this.ignoreTouchDown);
            addAction(Actions.sequence(action, Actions.removeListener(this.ignoreTouchDown, true), Actions.removeActor()));
            return;
        }
        remove();
    }

    public void hide() {
        hide(Actions.fadeOut(0.4f, Interpolation.fade));
    }

    public void setObject(Actor actor, Object obj) {
        this.values.put(actor, obj);
    }

    public Dialog key(final int i, final Object obj) {
        addListener(new InputListener() {
            /* class com.badlogic.gdx.scenes.scene2d.ui.Dialog.AnonymousClass4 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean keyDown(InputEvent inputEvent, int i) {
                if (i != i) {
                    return false;
                }
                Gdx.app.postRunnable(new Runnable() {
                    /* class com.badlogic.gdx.scenes.scene2d.ui.Dialog.AnonymousClass4.AnonymousClass1 */

                    public void run() {
                        Dialog.this.result(obj);
                        if (!Dialog.this.cancelHide) {
                            Dialog.this.hide();
                        }
                        Dialog.this.cancelHide = false;
                    }
                });
                return false;
            }
        });
        return this;
    }

    public void cancel() {
        this.cancelHide = true;
    }
}
