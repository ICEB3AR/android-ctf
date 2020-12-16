package com.alles.platformer;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.badlogic.gdx.scenes.scene2d.ui.Table;
import com.badlogic.gdx.utils.viewport.FitViewport;
import com.badlogic.gdx.utils.viewport.Viewport;

public class Controller {
    OrthographicCamera cam = new OrthographicCamera();
    boolean downPressed;
    boolean leftPressed;
    boolean rightPressed;
    Stage stage = new Stage(this.viewport, MyPlatformer.absoluteBatch);
    boolean upPressed;
    Viewport viewport = new FitViewport(800.0f, 480.0f, this.cam);

    public Controller() {
        this.stage.addListener(new InputListener() {
            /* class com.alles.platformer.Controller.AnonymousClass1 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean keyDown(InputEvent inputEvent, int i) {
                switch (i) {
                    case 19:
                        Controller.this.upPressed = true;
                        break;
                    case 20:
                        Controller.this.downPressed = true;
                        break;
                    case 21:
                        Controller.this.leftPressed = true;
                        break;
                    case 22:
                        Controller.this.rightPressed = true;
                        break;
                }
                return true;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean keyUp(InputEvent inputEvent, int i) {
                switch (i) {
                    case 19:
                        Controller.this.upPressed = false;
                        return true;
                    case 20:
                        Controller.this.downPressed = false;
                        return true;
                    case 21:
                        Controller.this.leftPressed = false;
                        return true;
                    case 22:
                        Controller.this.rightPressed = false;
                        return true;
                    default:
                        return true;
                }
            }
        });
        Gdx.input.setInputProcessor(this.stage);
        Table table = new Table();
        table.left().bottom();
        Table table2 = new Table();
        table2.left().bottom();
        Image image = new Image(new Texture("flatDark25.png"));
        image.setSize(80.0f, 80.0f);
        image.addListener(new InputListener() {
            /* class com.alles.platformer.Controller.AnonymousClass2 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                Controller.this.upPressed = true;
                return true;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                Controller.this.upPressed = false;
            }
        });
        Image image2 = new Image(new Texture("flatDark26.png"));
        image2.setSize(80.0f, 80.0f);
        image2.addListener(new InputListener() {
            /* class com.alles.platformer.Controller.AnonymousClass3 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                Controller.this.downPressed = true;
                return true;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                Controller.this.downPressed = false;
            }
        });
        Image image3 = new Image(new Texture("flatDark24.png"));
        image3.setSize(80.0f, 80.0f);
        image3.addListener(new InputListener() {
            /* class com.alles.platformer.Controller.AnonymousClass4 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                Controller.this.rightPressed = true;
                return true;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                Controller.this.rightPressed = false;
            }
        });
        Image image4 = new Image(new Texture("flatDark23.png"));
        image4.setSize(80.0f, 80.0f);
        image4.addListener(new InputListener() {
            /* class com.alles.platformer.Controller.AnonymousClass5 */

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public boolean touchDown(InputEvent inputEvent, float f, float f2, int i, int i2) {
                Controller.this.leftPressed = true;
                return true;
            }

            @Override // com.badlogic.gdx.scenes.scene2d.InputListener
            public void touchUp(InputEvent inputEvent, float f, float f2, int i, int i2) {
                Controller.this.leftPressed = false;
            }
        });
        table2.add();
        table2.row().pad(5.0f, 5.0f, 5.0f, 5.0f);
        table2.add(image4).size(image4.getWidth(), image4.getHeight());
        table2.add();
        table2.add(image3).size(image3.getWidth(), image3.getHeight());
        table2.row().padBottom(5.0f);
        table.add();
        table.pad(5.0f, 500.0f, 5.0f, 5.0f).row().pad(5.0f, 5.0f, 5.0f, 5.0f);
        table.add(image2).size(image2.getWidth(), image2.getHeight());
        table.add();
        table.add(image).size(image.getWidth(), image.getHeight());
        table.row().padBottom(5.0f);
        this.stage.addActor(table);
        this.stage.addActor(table2);
    }

    public void draw() {
        this.stage.draw();
    }

    public boolean isUpPressed() {
        return this.upPressed;
    }

    public boolean isDownPressed() {
        return this.downPressed;
    }

    public boolean isLeftPressed() {
        return this.leftPressed;
    }

    public boolean isRightPressed() {
        return this.rightPressed;
    }

    public void resize(int i, int i2) {
        this.viewport.update(i, i2);
    }
}
