package shaders;

import box2dLight.RayHandler;
import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;

public final class LightShader {
    public static final ShaderProgram createLightShader() {
        String str = "#ifdef GL_ES\nprecision lowp float;\n#define MED mediump\n#else\n#define MED \n#endif\nvarying vec4 v_color;\nvoid main()\n{\n  gl_FragColor = " + (RayHandler.getGammaCorrection() ? "sqrt" : BuildConfig.FLAVOR) + "(v_color);\n" + "}";
        ShaderProgram.pedantic = false;
        ShaderProgram shaderProgram = new ShaderProgram("attribute vec4 vertex_positions;\nattribute vec4 quad_colors;\nattribute float s;\nuniform mat4 u_projTrans;\nvarying vec4 v_color;\nvoid main()\n{\n   v_color = s * quad_colors;\n   gl_Position =  u_projTrans * vertex_positions;\n}\n", str);
        if (!shaderProgram.isCompiled()) {
            Gdx.app.log("ERROR", shaderProgram.getLog());
        }
        return shaderProgram;
    }
}
