package shaders;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;

public final class ShadowShader {
    public static final ShaderProgram createShadowShader() {
        ShaderProgram.pedantic = false;
        ShaderProgram shaderProgram = new ShaderProgram("attribute vec4 a_position;\nattribute vec2 a_texCoord;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_texCoords = a_texCoord;\n   gl_Position = a_position;\n}\n", "#ifdef GL_ES\nprecision lowp float;\n#define MED mediump\n#else\n#define MED \n#endif\nvarying MED vec2 v_texCoords;\nuniform sampler2D u_texture;\nuniform vec4 ambient;\nvoid main()\n{\nvec4 c = texture2D(u_texture, v_texCoords);\ngl_FragColor.rgb = c.rgb * c.a + ambient.rgb;\ngl_FragColor.a = ambient.a - c.a;\n}\n");
        if (!shaderProgram.isCompiled()) {
            Gdx.app.log("ERROR", shaderProgram.getLog());
        }
        return shaderProgram;
    }
}
