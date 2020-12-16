package box2dLight;

import com.badlogic.gdx.Gdx;

public class BlendFunc {
    final int default_dfactor;
    final int default_sfactor;
    int dfactor;
    int sfactor;

    public BlendFunc(int i, int i2) {
        this.default_sfactor = i;
        this.default_dfactor = i2;
        this.sfactor = i;
        this.dfactor = i2;
    }

    public void set(int i, int i2) {
        this.sfactor = i;
        this.dfactor = i2;
    }

    public void reset() {
        this.sfactor = this.default_sfactor;
        this.dfactor = this.default_dfactor;
    }

    public void apply() {
        Gdx.gl20.glBlendFunc(this.sfactor, this.dfactor);
    }
}
