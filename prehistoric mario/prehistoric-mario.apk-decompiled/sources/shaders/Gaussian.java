package shaders;

import box2dLight.RayHandler;
import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;

public class Gaussian {
    public static ShaderProgram createBlurShader(int i, int i2) {
        String num = Integer.toString(i);
        String num2 = Integer.toString(i2);
        String str = RayHandler.isDiffuse ? ".rgb" : BuildConfig.FLAVOR;
        ShaderProgram.pedantic = false;
        ShaderProgram shaderProgram = new ShaderProgram("attribute vec4 a_position;\nuniform vec2  dir;\nattribute vec2 a_texCoord;\nvarying vec2 v_texCoords0;\nvarying vec2 v_texCoords1;\nvarying vec2 v_texCoords2;\nvarying vec2 v_texCoords3;\nvarying vec2 v_texCoords4;\n#define FBO_W " + num + ".0\n" + "#define FBO_H " + num2 + ".0\n" + "const vec2 futher = vec2(3.2307692308 / FBO_W, 3.2307692308 / FBO_H );\n" + "const vec2 closer = vec2(1.3846153846 / FBO_W, 1.3846153846 / FBO_H );\n" + "void main()\n" + "{\n" + "vec2 f = futher * dir;\n" + "vec2 c = closer * dir;\n" + "v_texCoords0 = a_texCoord - f;\n" + "v_texCoords1 = a_texCoord - c;\n" + "v_texCoords2 = a_texCoord;\n" + "v_texCoords3 = a_texCoord + c;\n" + "v_texCoords4 = a_texCoord + f;\n" + "gl_Position = a_position;\n" + "}\n", "#ifdef GL_ES\nprecision lowp float;\n#define MED mediump\n#else\n#define MED \n#endif\nuniform sampler2D u_texture;\nvarying MED vec2 v_texCoords0;\nvarying MED vec2 v_texCoords1;\nvarying MED vec2 v_texCoords2;\nvarying MED vec2 v_texCoords3;\nvarying MED vec2 v_texCoords4;\nconst float center = 0.2270270270;\nconst float close  = 0.3162162162;\nconst float far    = 0.0702702703;\nvoid main()\n{\t \ngl_FragColor" + str + " = far    * texture2D(u_texture, v_texCoords0)" + str + "\n" + "\t      \t\t+ close  * texture2D(u_texture, v_texCoords1)" + str + "\n" + "\t\t\t\t+ center * texture2D(u_texture, v_texCoords2)" + str + "\n" + "\t\t\t\t+ close  * texture2D(u_texture, v_texCoords3)" + str + "\n" + "\t\t\t\t+ far    * texture2D(u_texture, v_texCoords4)" + str + ";\n" + "}\n");
        if (!shaderProgram.isCompiled()) {
            Gdx.app.log("ERROR", shaderProgram.getLog());
        }
        return shaderProgram;
    }
}
