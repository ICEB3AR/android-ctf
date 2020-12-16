package com.badlogic.gdx;

public abstract class Game implements ApplicationListener {
    protected Screen screen;

    @Override // com.badlogic.gdx.ApplicationListener
    public void dispose() {
        Screen screen2 = this.screen;
        if (screen2 != null) {
            screen2.hide();
        }
    }

    @Override // com.badlogic.gdx.ApplicationListener
    public void pause() {
        Screen screen2 = this.screen;
        if (screen2 != null) {
            screen2.pause();
        }
    }

    @Override // com.badlogic.gdx.ApplicationListener
    public void resume() {
        Screen screen2 = this.screen;
        if (screen2 != null) {
            screen2.resume();
        }
    }

    @Override // com.badlogic.gdx.ApplicationListener
    public void render() {
        Screen screen2 = this.screen;
        if (screen2 != null) {
            screen2.render(Gdx.graphics.getDeltaTime());
        }
    }

    @Override // com.badlogic.gdx.ApplicationListener
    public void resize(int i, int i2) {
        Screen screen2 = this.screen;
        if (screen2 != null) {
            screen2.resize(i, i2);
        }
    }

    public void setScreen(Screen screen2) {
        Screen screen3 = this.screen;
        if (screen3 != null) {
            screen3.hide();
        }
        this.screen = screen2;
        Screen screen4 = this.screen;
        if (screen4 != null) {
            screen4.show();
            this.screen.resize(Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
        }
    }

    public Screen getScreen() {
        return this.screen;
    }
}
