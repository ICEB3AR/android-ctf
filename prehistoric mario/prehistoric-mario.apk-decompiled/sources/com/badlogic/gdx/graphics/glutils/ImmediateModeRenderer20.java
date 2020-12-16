package com.badlogic.gdx.graphics.glutils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.utils.Array;

public class ImmediateModeRenderer20 implements ImmediateModeRenderer {
    private final int colorOffset;
    private final int maxVertices;
    private final Mesh mesh;
    private final int normalOffset;
    private int numSetTexCoords;
    private final int numTexCoords;
    private int numVertices;
    private boolean ownsShader;
    private int primitiveType;
    private final Matrix4 projModelView;
    private ShaderProgram shader;
    private final String[] shaderUniformNames;
    private final int texCoordOffset;
    private int vertexIdx;
    private final int vertexSize;
    private final float[] vertices;

    public ImmediateModeRenderer20(boolean z, boolean z2, int i) {
        this(5000, z, z2, i, createDefaultShader(z, z2, i));
        this.ownsShader = true;
    }

    public ImmediateModeRenderer20(int i, boolean z, boolean z2, int i2) {
        this(i, z, z2, i2, createDefaultShader(z, z2, i2));
        this.ownsShader = true;
    }

    public ImmediateModeRenderer20(int i, boolean z, boolean z2, int i2, ShaderProgram shaderProgram) {
        this.projModelView = new Matrix4();
        this.maxVertices = i;
        this.numTexCoords = i2;
        this.shader = shaderProgram;
        this.mesh = new Mesh(false, i, 0, buildVertexAttributes(z, z2, i2));
        this.vertices = new float[(i * (this.mesh.getVertexAttributes().vertexSize / 4))];
        this.vertexSize = this.mesh.getVertexAttributes().vertexSize / 4;
        this.normalOffset = this.mesh.getVertexAttribute(8) != null ? this.mesh.getVertexAttribute(8).offset / 4 : 0;
        this.colorOffset = this.mesh.getVertexAttribute(4) != null ? this.mesh.getVertexAttribute(4).offset / 4 : 0;
        this.texCoordOffset = this.mesh.getVertexAttribute(16) != null ? this.mesh.getVertexAttribute(16).offset / 4 : 0;
        this.shaderUniformNames = new String[i2];
        for (int i3 = 0; i3 < i2; i3++) {
            String[] strArr = this.shaderUniformNames;
            strArr[i3] = "u_sampler" + i3;
        }
    }

    private VertexAttribute[] buildVertexAttributes(boolean z, boolean z2, int i) {
        Array array = new Array();
        array.add(new VertexAttribute(1, 3, ShaderProgram.POSITION_ATTRIBUTE));
        if (z) {
            array.add(new VertexAttribute(8, 3, ShaderProgram.NORMAL_ATTRIBUTE));
        }
        if (z2) {
            array.add(new VertexAttribute(4, 4, ShaderProgram.COLOR_ATTRIBUTE));
        }
        for (int i2 = 0; i2 < i; i2++) {
            array.add(new VertexAttribute(16, 2, ShaderProgram.TEXCOORD_ATTRIBUTE + i2));
        }
        VertexAttribute[] vertexAttributeArr = new VertexAttribute[array.size];
        for (int i3 = 0; i3 < array.size; i3++) {
            vertexAttributeArr[i3] = (VertexAttribute) array.get(i3);
        }
        return vertexAttributeArr;
    }

    public void setShader(ShaderProgram shaderProgram) {
        if (this.ownsShader) {
            this.shader.dispose();
        }
        this.shader = shaderProgram;
        this.ownsShader = false;
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void begin(Matrix4 matrix4, int i) {
        this.projModelView.set(matrix4);
        this.primitiveType = i;
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void color(Color color) {
        this.vertices[this.vertexIdx + this.colorOffset] = color.toFloatBits();
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void color(float f, float f2, float f3, float f4) {
        this.vertices[this.vertexIdx + this.colorOffset] = Color.toFloatBits(f, f2, f3, f4);
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void color(float f) {
        this.vertices[this.vertexIdx + this.colorOffset] = f;
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void texCoord(float f, float f2) {
        int i = this.vertexIdx + this.texCoordOffset;
        float[] fArr = this.vertices;
        int i2 = this.numSetTexCoords;
        fArr[i + i2] = f;
        fArr[i + i2 + 1] = f2;
        this.numSetTexCoords = i2 + 2;
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void normal(float f, float f2, float f3) {
        int i = this.vertexIdx + this.normalOffset;
        float[] fArr = this.vertices;
        fArr[i] = f;
        fArr[i + 1] = f2;
        fArr[i + 2] = f3;
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void vertex(float f, float f2, float f3) {
        int i = this.vertexIdx;
        float[] fArr = this.vertices;
        fArr[i] = f;
        fArr[i + 1] = f2;
        fArr[i + 2] = f3;
        this.numSetTexCoords = 0;
        this.vertexIdx = i + this.vertexSize;
        this.numVertices++;
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void flush() {
        if (this.numVertices != 0) {
            this.shader.begin();
            this.shader.setUniformMatrix("u_projModelView", this.projModelView);
            for (int i = 0; i < this.numTexCoords; i++) {
                this.shader.setUniformi(this.shaderUniformNames[i], i);
            }
            this.mesh.setVertices(this.vertices, 0, this.vertexIdx);
            this.mesh.render(this.shader, this.primitiveType);
            this.shader.end();
            this.numSetTexCoords = 0;
            this.vertexIdx = 0;
            this.numVertices = 0;
        }
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void end() {
        flush();
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public int getNumVertices() {
        return this.numVertices;
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public int getMaxVertices() {
        return this.maxVertices;
    }

    @Override // com.badlogic.gdx.graphics.glutils.ImmediateModeRenderer
    public void dispose() {
        ShaderProgram shaderProgram;
        if (this.ownsShader && (shaderProgram = this.shader) != null) {
            shaderProgram.dispose();
        }
        this.mesh.dispose();
    }

    private static String createVertexShader(boolean z, boolean z2, int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("attribute vec4 a_position;\n");
        String str = BuildConfig.FLAVOR;
        sb.append(z ? "attribute vec3 a_normal;\n" : str);
        sb.append(z2 ? "attribute vec4 a_color;\n" : str);
        String sb2 = sb.toString();
        String str2 = sb2;
        for (int i2 = 0; i2 < i; i2++) {
            str2 = str2 + "attribute vec2 a_texCoord" + i2 + ";\n";
        }
        String str3 = str2 + "uniform mat4 u_projModelView;\n";
        StringBuilder sb3 = new StringBuilder();
        sb3.append(str3);
        sb3.append(z2 ? "varying vec4 v_col;\n" : str);
        String sb4 = sb3.toString();
        for (int i3 = 0; i3 < i; i3++) {
            sb4 = sb4 + "varying vec2 v_tex" + i3 + ";\n";
        }
        StringBuilder sb5 = new StringBuilder();
        sb5.append(sb4);
        sb5.append("void main() {\n   gl_Position = u_projModelView * a_position;\n");
        if (z2) {
            str = "   v_col = a_color;\n";
        }
        sb5.append(str);
        String sb6 = sb5.toString();
        for (int i4 = 0; i4 < i; i4++) {
            sb6 = sb6 + "   v_tex" + i4 + " = " + ShaderProgram.TEXCOORD_ATTRIBUTE + i4 + ";\n";
        }
        return (sb6 + "   gl_PointSize = 1.0;\n") + "}\n";
    }

    private static String createFragmentShader(boolean z, boolean z2, int i) {
        String str = "#ifdef GL_ES\nprecision mediump float;\n#endif\n";
        if (z2) {
            str = str + "varying vec4 v_col;\n";
        }
        String str2 = str;
        for (int i2 = 0; i2 < i; i2++) {
            str2 = (str2 + "varying vec2 v_tex" + i2 + ";\n") + "uniform sampler2D u_sampler" + i2 + ";\n";
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str2);
        sb.append("void main() {\n   gl_FragColor = ");
        sb.append(z2 ? "v_col" : "vec4(1, 1, 1, 1)");
        String sb2 = sb.toString();
        if (i > 0) {
            sb2 = sb2 + " * ";
        }
        for (int i3 = 0; i3 < i; i3++) {
            sb2 = i3 == i - 1 ? sb2 + " texture2D(u_sampler" + i3 + ",  v_tex" + i3 + ")" : sb2 + " texture2D(u_sampler" + i3 + ",  v_tex" + i3 + ") *";
        }
        return sb2 + ";\n}";
    }

    public static ShaderProgram createDefaultShader(boolean z, boolean z2, int i) {
        return new ShaderProgram(createVertexShader(z, z2, i), createFragmentShader(z, z2, i));
    }
}
