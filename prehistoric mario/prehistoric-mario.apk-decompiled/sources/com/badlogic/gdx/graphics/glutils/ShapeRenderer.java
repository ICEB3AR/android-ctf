package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Disposable;

public class ShapeRenderer implements Disposable {
    private boolean autoShapeType;
    private final Color color;
    private final Matrix4 combinedMatrix;
    private float defaultRectLineWidth;
    private boolean matrixDirty;
    private final Matrix4 projectionMatrix;
    private final ImmediateModeRenderer renderer;
    private ShapeType shapeType;
    private final Vector2 tmp;
    private final Matrix4 transformMatrix;

    public enum ShapeType {
        Point(0),
        Line(1),
        Filled(4);
        
        private final int glType;

        private ShapeType(int i) {
            this.glType = i;
        }

        public int getGlType() {
            return this.glType;
        }
    }

    public ShapeRenderer() {
        this(5000);
    }

    public ShapeRenderer(int i) {
        this(i, null);
    }

    public ShapeRenderer(int i, ShaderProgram shaderProgram) {
        this.matrixDirty = false;
        this.projectionMatrix = new Matrix4();
        this.transformMatrix = new Matrix4();
        this.combinedMatrix = new Matrix4();
        this.tmp = new Vector2();
        this.color = new Color(1.0f, 1.0f, 1.0f, 1.0f);
        this.defaultRectLineWidth = 0.75f;
        if (shaderProgram == null) {
            this.renderer = new ImmediateModeRenderer20(i, false, true, 0);
        } else {
            this.renderer = new ImmediateModeRenderer20(i, false, true, 0, shaderProgram);
        }
        this.projectionMatrix.setToOrtho2D(0.0f, 0.0f, (float) Gdx.graphics.getWidth(), (float) Gdx.graphics.getHeight());
        this.matrixDirty = true;
    }

    public void setColor(Color color2) {
        this.color.set(color2);
    }

    public void setColor(float f, float f2, float f3, float f4) {
        this.color.set(f, f2, f3, f4);
    }

    public Color getColor() {
        return this.color;
    }

    public void updateMatrices() {
        this.matrixDirty = true;
    }

    public void setProjectionMatrix(Matrix4 matrix4) {
        this.projectionMatrix.set(matrix4);
        this.matrixDirty = true;
    }

    public Matrix4 getProjectionMatrix() {
        return this.projectionMatrix;
    }

    public void setTransformMatrix(Matrix4 matrix4) {
        this.transformMatrix.set(matrix4);
        this.matrixDirty = true;
    }

    public Matrix4 getTransformMatrix() {
        return this.transformMatrix;
    }

    public void identity() {
        this.transformMatrix.idt();
        this.matrixDirty = true;
    }

    public void translate(float f, float f2, float f3) {
        this.transformMatrix.translate(f, f2, f3);
        this.matrixDirty = true;
    }

    public void rotate(float f, float f2, float f3, float f4) {
        this.transformMatrix.rotate(f, f2, f3, f4);
        this.matrixDirty = true;
    }

    public void scale(float f, float f2, float f3) {
        this.transformMatrix.scale(f, f2, f3);
        this.matrixDirty = true;
    }

    public void setAutoShapeType(boolean z) {
        this.autoShapeType = z;
    }

    public void begin() {
        if (this.autoShapeType) {
            begin(ShapeType.Line);
            return;
        }
        throw new IllegalStateException("autoShapeType must be true to use this method.");
    }

    public void begin(ShapeType shapeType2) {
        if (this.shapeType == null) {
            this.shapeType = shapeType2;
            if (this.matrixDirty) {
                this.combinedMatrix.set(this.projectionMatrix);
                Matrix4.mul(this.combinedMatrix.val, this.transformMatrix.val);
                this.matrixDirty = false;
            }
            this.renderer.begin(this.combinedMatrix, this.shapeType.getGlType());
            return;
        }
        throw new IllegalStateException("Call end() before beginning a new shape batch.");
    }

    public void set(ShapeType shapeType2) {
        ShapeType shapeType3 = this.shapeType;
        if (shapeType3 != shapeType2) {
            if (shapeType3 == null) {
                throw new IllegalStateException("begin must be called first.");
            } else if (this.autoShapeType) {
                end();
                begin(shapeType2);
            } else {
                throw new IllegalStateException("autoShapeType must be enabled.");
            }
        }
    }

    public void point(float f, float f2, float f3) {
        if (this.shapeType == ShapeType.Line) {
            float f4 = this.defaultRectLineWidth * 0.5f;
            line(f - f4, f2 - f4, f3, f + f4, f2 + f4, f3);
        } else if (this.shapeType == ShapeType.Filled) {
            float f5 = this.defaultRectLineWidth;
            float f6 = 0.5f * f5;
            box(f - f6, f2 - f6, f3 - f6, f5, f5, f5);
        } else {
            check(ShapeType.Point, null, 1);
            this.renderer.color(this.color);
            this.renderer.vertex(f, f2, f3);
        }
    }

    public final void line(float f, float f2, float f3, float f4, float f5, float f6) {
        Color color2 = this.color;
        line(f, f2, f3, f4, f5, f6, color2, color2);
    }

    public final void line(Vector3 vector3, Vector3 vector32) {
        float f = vector3.x;
        float f2 = vector3.y;
        float f3 = vector3.z;
        float f4 = vector32.x;
        float f5 = vector32.y;
        float f6 = vector32.z;
        Color color2 = this.color;
        line(f, f2, f3, f4, f5, f6, color2, color2);
    }

    public final void line(float f, float f2, float f3, float f4) {
        Color color2 = this.color;
        line(f, f2, 0.0f, f3, f4, 0.0f, color2, color2);
    }

    public final void line(Vector2 vector2, Vector2 vector22) {
        float f = vector2.x;
        float f2 = vector2.y;
        float f3 = vector22.x;
        float f4 = vector22.y;
        Color color2 = this.color;
        line(f, f2, 0.0f, f3, f4, 0.0f, color2, color2);
    }

    public final void line(float f, float f2, float f3, float f4, Color color2, Color color3) {
        line(f, f2, 0.0f, f3, f4, 0.0f, color2, color3);
    }

    public void line(float f, float f2, float f3, float f4, float f5, float f6, Color color2, Color color3) {
        if (this.shapeType == ShapeType.Filled) {
            rectLine(f, f2, f4, f5, this.defaultRectLineWidth, color2, color3);
            return;
        }
        check(ShapeType.Line, null, 2);
        this.renderer.color(color2.r, color2.g, color2.b, color2.a);
        this.renderer.vertex(f, f2, f3);
        this.renderer.color(color3.r, color3.g, color3.b, color3.a);
        this.renderer.vertex(f4, f5, f6);
    }

    public void curve(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, int i) {
        int i2 = i;
        check(ShapeType.Line, null, (i2 * 2) + 2);
        float floatBits = this.color.toFloatBits();
        float f9 = 1.0f / ((float) i2);
        float f10 = f9 * f9;
        float f11 = f10 * f9;
        float f12 = f9 * 3.0f;
        float f13 = f10 * 3.0f;
        float f14 = f10 * 6.0f;
        float f15 = 6.0f * f11;
        float f16 = (f - (f3 * 2.0f)) + f5;
        float f17 = (f2 - (2.0f * f4)) + f6;
        float f18 = (((f3 - f5) * 3.0f) - f) + f7;
        float f19 = (((f4 - f6) * 3.0f) - f2) + f8;
        float f20 = ((f3 - f) * f12) + (f16 * f13) + (f18 * f11);
        float f21 = ((f4 - f2) * f12) + (f13 * f17) + (f11 * f19);
        float f22 = f18 * f15;
        float f23 = (f16 * f14) + f22;
        float f24 = f19 * f15;
        float f25 = (f17 * f14) + f24;
        float f26 = f;
        float f27 = f2;
        while (true) {
            int i3 = i2 - 1;
            if (i2 > 0) {
                this.renderer.color(floatBits);
                this.renderer.vertex(f26, f27, 0.0f);
                f26 += f20;
                f27 += f21;
                f20 += f23;
                f21 += f25;
                f23 += f22;
                f25 += f24;
                this.renderer.color(floatBits);
                this.renderer.vertex(f26, f27, 0.0f);
                i2 = i3;
            } else {
                this.renderer.color(floatBits);
                this.renderer.vertex(f26, f27, 0.0f);
                this.renderer.color(floatBits);
                this.renderer.vertex(f7, f8, 0.0f);
                return;
            }
        }
    }

    public void triangle(float f, float f2, float f3, float f4, float f5, float f6) {
        check(ShapeType.Line, ShapeType.Filled, 6);
        float floatBits = this.color.toFloatBits();
        if (this.shapeType == ShapeType.Line) {
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f3, f4, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f3, f4, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f5, f6, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f5, f6, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, 0.0f);
            return;
        }
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, 0.0f);
        this.renderer.color(floatBits);
        this.renderer.vertex(f3, f4, 0.0f);
        this.renderer.color(floatBits);
        this.renderer.vertex(f5, f6, 0.0f);
    }

    public void triangle(float f, float f2, float f3, float f4, float f5, float f6, Color color2, Color color3, Color color4) {
        check(ShapeType.Line, ShapeType.Filled, 6);
        if (this.shapeType == ShapeType.Line) {
            this.renderer.color(color2.r, color2.g, color2.b, color2.a);
            this.renderer.vertex(f, f2, 0.0f);
            this.renderer.color(color3.r, color3.g, color3.b, color3.a);
            this.renderer.vertex(f3, f4, 0.0f);
            this.renderer.color(color3.r, color3.g, color3.b, color3.a);
            this.renderer.vertex(f3, f4, 0.0f);
            this.renderer.color(color4.r, color4.g, color4.b, color4.a);
            this.renderer.vertex(f5, f6, 0.0f);
            this.renderer.color(color4.r, color4.g, color4.b, color4.a);
            this.renderer.vertex(f5, f6, 0.0f);
            this.renderer.color(color2.r, color2.g, color2.b, color2.a);
            this.renderer.vertex(f, f2, 0.0f);
            return;
        }
        this.renderer.color(color2.r, color2.g, color2.b, color2.a);
        this.renderer.vertex(f, f2, 0.0f);
        this.renderer.color(color3.r, color3.g, color3.b, color3.a);
        this.renderer.vertex(f3, f4, 0.0f);
        this.renderer.color(color4.r, color4.g, color4.b, color4.a);
        this.renderer.vertex(f5, f6, 0.0f);
    }

    public void rect(float f, float f2, float f3, float f4) {
        check(ShapeType.Line, ShapeType.Filled, 8);
        float floatBits = this.color.toFloatBits();
        if (this.shapeType == ShapeType.Line) {
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, 0.0f);
            this.renderer.color(floatBits);
            float f5 = f3 + f;
            this.renderer.vertex(f5, f2, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f5, f2, 0.0f);
            this.renderer.color(floatBits);
            float f6 = f4 + f2;
            this.renderer.vertex(f5, f6, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f5, f6, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f6, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f6, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, 0.0f);
            return;
        }
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, 0.0f);
        this.renderer.color(floatBits);
        float f7 = f3 + f;
        this.renderer.vertex(f7, f2, 0.0f);
        this.renderer.color(floatBits);
        float f8 = f4 + f2;
        this.renderer.vertex(f7, f8, 0.0f);
        this.renderer.color(floatBits);
        this.renderer.vertex(f7, f8, 0.0f);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f8, 0.0f);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, 0.0f);
    }

    public void rect(float f, float f2, float f3, float f4, Color color2, Color color3, Color color4, Color color5) {
        check(ShapeType.Line, ShapeType.Filled, 8);
        if (this.shapeType == ShapeType.Line) {
            this.renderer.color(color2.r, color2.g, color2.b, color2.a);
            this.renderer.vertex(f, f2, 0.0f);
            this.renderer.color(color3.r, color3.g, color3.b, color3.a);
            float f5 = f3 + f;
            this.renderer.vertex(f5, f2, 0.0f);
            this.renderer.color(color3.r, color3.g, color3.b, color3.a);
            this.renderer.vertex(f5, f2, 0.0f);
            this.renderer.color(color4.r, color4.g, color4.b, color4.a);
            float f6 = f4 + f2;
            this.renderer.vertex(f5, f6, 0.0f);
            this.renderer.color(color4.r, color4.g, color4.b, color4.a);
            this.renderer.vertex(f5, f6, 0.0f);
            this.renderer.color(color5.r, color5.g, color5.b, color5.a);
            this.renderer.vertex(f, f6, 0.0f);
            this.renderer.color(color5.r, color5.g, color5.b, color5.a);
            this.renderer.vertex(f, f6, 0.0f);
            this.renderer.color(color2.r, color2.g, color2.b, color2.a);
            this.renderer.vertex(f, f2, 0.0f);
            return;
        }
        this.renderer.color(color2.r, color2.g, color2.b, color2.a);
        this.renderer.vertex(f, f2, 0.0f);
        this.renderer.color(color3.r, color3.g, color3.b, color3.a);
        float f7 = f3 + f;
        this.renderer.vertex(f7, f2, 0.0f);
        this.renderer.color(color4.r, color4.g, color4.b, color4.a);
        float f8 = f4 + f2;
        this.renderer.vertex(f7, f8, 0.0f);
        this.renderer.color(color4.r, color4.g, color4.b, color4.a);
        this.renderer.vertex(f7, f8, 0.0f);
        this.renderer.color(color5.r, color5.g, color5.b, color5.a);
        this.renderer.vertex(f, f8, 0.0f);
        this.renderer.color(color2.r, color2.g, color2.b, color2.a);
        this.renderer.vertex(f, f2, 0.0f);
    }

    public void rect(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9) {
        Color color2 = this.color;
        rect(f, f2, f3, f4, f5, f6, f7, f8, f9, color2, color2, color2, color2);
    }

    public void rect(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, Color color2, Color color3, Color color4, Color color5) {
        check(ShapeType.Line, ShapeType.Filled, 8);
        float cosDeg = MathUtils.cosDeg(f9);
        float sinDeg = MathUtils.sinDeg(f9);
        float f10 = -f3;
        float f11 = -f4;
        float f12 = f5 - f3;
        float f13 = f6 - f4;
        if (!(f7 == 1.0f && f8 == 1.0f)) {
            f10 *= f7;
            f11 *= f8;
            f12 *= f7;
            f13 *= f8;
        }
        float f14 = f + f3;
        float f15 = f2 + f4;
        float f16 = sinDeg * f11;
        float f17 = ((cosDeg * f10) - f16) + f14;
        float f18 = f11 * cosDeg;
        float f19 = (f10 * sinDeg) + f18 + f15;
        float f20 = cosDeg * f12;
        float f21 = (f20 - f16) + f14;
        float f22 = f12 * sinDeg;
        float f23 = f18 + f22 + f15;
        float f24 = (f20 - (sinDeg * f13)) + f14;
        float f25 = f22 + (cosDeg * f13) + f15;
        float f26 = (f24 - f21) + f17;
        float f27 = f25 - (f23 - f19);
        if (this.shapeType == ShapeType.Line) {
            this.renderer.color(color2.r, color2.g, color2.b, color2.a);
            this.renderer.vertex(f17, f19, 0.0f);
            this.renderer.color(color3.r, color3.g, color3.b, color3.a);
            this.renderer.vertex(f21, f23, 0.0f);
            this.renderer.color(color3.r, color3.g, color3.b, color3.a);
            this.renderer.vertex(f21, f23, 0.0f);
            this.renderer.color(color4.r, color4.g, color4.b, color4.a);
            this.renderer.vertex(f24, f25, 0.0f);
            this.renderer.color(color4.r, color4.g, color4.b, color4.a);
            this.renderer.vertex(f24, f25, 0.0f);
            this.renderer.color(color5.r, color5.g, color5.b, color5.a);
            this.renderer.vertex(f26, f27, 0.0f);
            this.renderer.color(color5.r, color5.g, color5.b, color5.a);
            this.renderer.vertex(f26, f27, 0.0f);
            this.renderer.color(color2.r, color2.g, color2.b, color2.a);
            this.renderer.vertex(f17, f19, 0.0f);
            return;
        }
        this.renderer.color(color2.r, color2.g, color2.b, color2.a);
        this.renderer.vertex(f17, f19, 0.0f);
        this.renderer.color(color3.r, color3.g, color3.b, color3.a);
        this.renderer.vertex(f21, f23, 0.0f);
        this.renderer.color(color4.r, color4.g, color4.b, color4.a);
        this.renderer.vertex(f24, f25, 0.0f);
        this.renderer.color(color4.r, color4.g, color4.b, color4.a);
        this.renderer.vertex(f24, f25, 0.0f);
        this.renderer.color(color5.r, color5.g, color5.b, color5.a);
        this.renderer.vertex(f26, f27, 0.0f);
        this.renderer.color(color2.r, color2.g, color2.b, color2.a);
        this.renderer.vertex(f17, f19, 0.0f);
    }

    public void rectLine(float f, float f2, float f3, float f4, float f5) {
        check(ShapeType.Line, ShapeType.Filled, 8);
        float floatBits = this.color.toFloatBits();
        Vector2 nor = this.tmp.set(f4 - f2, f - f3).nor();
        float f6 = f5 * 0.5f;
        float f7 = nor.x * f6;
        float f8 = nor.y * f6;
        if (this.shapeType == ShapeType.Line) {
            this.renderer.color(floatBits);
            float f9 = f + f7;
            float f10 = f2 + f8;
            this.renderer.vertex(f9, f10, 0.0f);
            this.renderer.color(floatBits);
            float f11 = f - f7;
            float f12 = f2 - f8;
            this.renderer.vertex(f11, f12, 0.0f);
            this.renderer.color(floatBits);
            float f13 = f3 + f7;
            float f14 = f4 + f8;
            this.renderer.vertex(f13, f14, 0.0f);
            this.renderer.color(floatBits);
            float f15 = f3 - f7;
            float f16 = f4 - f8;
            this.renderer.vertex(f15, f16, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f13, f14, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f9, f10, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f15, f16, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f11, f12, 0.0f);
            return;
        }
        this.renderer.color(floatBits);
        this.renderer.vertex(f + f7, f2 + f8, 0.0f);
        this.renderer.color(floatBits);
        float f17 = f - f7;
        float f18 = f2 - f8;
        this.renderer.vertex(f17, f18, 0.0f);
        this.renderer.color(floatBits);
        float f19 = f3 + f7;
        float f20 = f4 + f8;
        this.renderer.vertex(f19, f20, 0.0f);
        this.renderer.color(floatBits);
        this.renderer.vertex(f3 - f7, f4 - f8, 0.0f);
        this.renderer.color(floatBits);
        this.renderer.vertex(f19, f20, 0.0f);
        this.renderer.color(floatBits);
        this.renderer.vertex(f17, f18, 0.0f);
    }

    public void rectLine(float f, float f2, float f3, float f4, float f5, Color color2, Color color3) {
        check(ShapeType.Line, ShapeType.Filled, 8);
        float floatBits = color2.toFloatBits();
        float floatBits2 = color3.toFloatBits();
        Vector2 nor = this.tmp.set(f4 - f2, f - f3).nor();
        float f6 = f5 * 0.5f;
        float f7 = nor.x * f6;
        float f8 = nor.y * f6;
        if (this.shapeType == ShapeType.Line) {
            this.renderer.color(floatBits);
            float f9 = f + f7;
            float f10 = f2 + f8;
            this.renderer.vertex(f9, f10, 0.0f);
            this.renderer.color(floatBits);
            float f11 = f - f7;
            float f12 = f2 - f8;
            this.renderer.vertex(f11, f12, 0.0f);
            this.renderer.color(floatBits2);
            float f13 = f3 + f7;
            float f14 = f4 + f8;
            this.renderer.vertex(f13, f14, 0.0f);
            this.renderer.color(floatBits2);
            float f15 = f3 - f7;
            float f16 = f4 - f8;
            this.renderer.vertex(f15, f16, 0.0f);
            this.renderer.color(floatBits2);
            this.renderer.vertex(f13, f14, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f9, f10, 0.0f);
            this.renderer.color(floatBits2);
            this.renderer.vertex(f15, f16, 0.0f);
            this.renderer.color(floatBits);
            this.renderer.vertex(f11, f12, 0.0f);
            return;
        }
        this.renderer.color(floatBits);
        this.renderer.vertex(f + f7, f2 + f8, 0.0f);
        this.renderer.color(floatBits);
        float f17 = f - f7;
        float f18 = f2 - f8;
        this.renderer.vertex(f17, f18, 0.0f);
        this.renderer.color(floatBits2);
        float f19 = f3 + f7;
        float f20 = f4 + f8;
        this.renderer.vertex(f19, f20, 0.0f);
        this.renderer.color(floatBits2);
        this.renderer.vertex(f3 - f7, f4 - f8, 0.0f);
        this.renderer.color(floatBits2);
        this.renderer.vertex(f19, f20, 0.0f);
        this.renderer.color(floatBits);
        this.renderer.vertex(f17, f18, 0.0f);
    }

    public void rectLine(Vector2 vector2, Vector2 vector22, float f) {
        rectLine(vector2.x, vector2.y, vector22.x, vector22.y, f);
    }

    public void box(float f, float f2, float f3, float f4, float f5, float f6) {
        float f7 = -f6;
        float floatBits = this.color.toFloatBits();
        if (this.shapeType == ShapeType.Line) {
            check(ShapeType.Line, ShapeType.Filled, 24);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, f3);
            this.renderer.color(floatBits);
            float f8 = f4 + f;
            this.renderer.vertex(f8, f2, f3);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f2, f3);
            this.renderer.color(floatBits);
            float f9 = f7 + f3;
            this.renderer.vertex(f8, f2, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f2, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, f3);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, f3);
            this.renderer.color(floatBits);
            float f10 = f5 + f2;
            this.renderer.vertex(f, f10, f3);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f10, f3);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f10, f3);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f10, f3);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f10, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f10, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f10, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f10, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f10, f3);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f2, f3);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f10, f3);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f2, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f8, f10, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f2, f9);
            this.renderer.color(floatBits);
            this.renderer.vertex(f, f10, f9);
            return;
        }
        check(ShapeType.Line, ShapeType.Filled, 36);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f3);
        this.renderer.color(floatBits);
        float f11 = f4 + f;
        this.renderer.vertex(f11, f2, f3);
        this.renderer.color(floatBits);
        float f12 = f5 + f2;
        this.renderer.vertex(f11, f12, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f12, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f12, f3);
        this.renderer.color(floatBits);
        float f13 = f7 + f3;
        this.renderer.vertex(f11, f2, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f12, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f12, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f12, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f12, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f12, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f12, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f2, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f2, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f12, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f2, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f12, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f12, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f12, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f12, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f12, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f12, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f12, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f12, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f2, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f2, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f13);
        this.renderer.color(floatBits);
        this.renderer.vertex(f11, f2, f3);
        this.renderer.color(floatBits);
        this.renderer.vertex(f, f2, f3);
    }

    public void x(float f, float f2, float f3) {
        float f4 = f - f3;
        float f5 = f2 - f3;
        float f6 = f + f3;
        float f7 = f2 + f3;
        line(f4, f5, f6, f7);
        line(f4, f7, f6, f5);
    }

    public void x(Vector2 vector2, float f) {
        x(vector2.x, vector2.y, f);
    }

    public void arc(float f, float f2, float f3, float f4, float f5) {
        arc(f, f2, f3, f4, f5, Math.max(1, (int) (((float) Math.cbrt((double) f3)) * 6.0f * (f5 / 360.0f))));
    }

    public void arc(float f, float f2, float f3, float f4, float f5, int i) {
        if (i > 0) {
            float floatBits = this.color.toFloatBits();
            float f6 = ((f5 / 360.0f) * 6.2831855f) / ((float) i);
            float cos = MathUtils.cos(f6);
            float sin = MathUtils.sin(f6);
            float f7 = f4 * 0.017453292f;
            float cos2 = MathUtils.cos(f7) * f3;
            float sin2 = f3 * MathUtils.sin(f7);
            int i2 = 0;
            if (this.shapeType == ShapeType.Line) {
                check(ShapeType.Line, ShapeType.Filled, (i * 2) + 2);
                this.renderer.color(floatBits);
                this.renderer.vertex(f, f2, 0.0f);
                this.renderer.color(floatBits);
                this.renderer.vertex(f + cos2, f2 + sin2, 0.0f);
                while (i2 < i) {
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f + cos2, f2 + sin2, 0.0f);
                    float f8 = (cos * cos2) - (sin * sin2);
                    sin2 = (sin2 * cos) + (cos2 * sin);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f + f8, f2 + sin2, 0.0f);
                    i2++;
                    cos2 = f8;
                }
                this.renderer.color(floatBits);
                this.renderer.vertex(cos2 + f, sin2 + f2, 0.0f);
            } else {
                check(ShapeType.Line, ShapeType.Filled, (i * 3) + 3);
                while (i2 < i) {
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f, f2, 0.0f);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f + cos2, f2 + sin2, 0.0f);
                    float f9 = (cos * cos2) - (sin * sin2);
                    sin2 = (sin2 * cos) + (cos2 * sin);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f + f9, f2 + sin2, 0.0f);
                    i2++;
                    cos2 = f9;
                }
                this.renderer.color(floatBits);
                this.renderer.vertex(f, f2, 0.0f);
                this.renderer.color(floatBits);
                this.renderer.vertex(cos2 + f, sin2 + f2, 0.0f);
            }
            this.renderer.color(floatBits);
            this.renderer.vertex(f + 0.0f, f2 + 0.0f, 0.0f);
            return;
        }
        throw new IllegalArgumentException("segments must be > 0.");
    }

    public void circle(float f, float f2, float f3) {
        circle(f, f2, f3, Math.max(1, (int) (((float) Math.cbrt((double) f3)) * 6.0f)));
    }

    public void circle(float f, float f2, float f3, int i) {
        if (i > 0) {
            float floatBits = this.color.toFloatBits();
            float f4 = 6.2831855f / ((float) i);
            float cos = MathUtils.cos(f4);
            float sin = MathUtils.sin(f4);
            int i2 = 0;
            if (this.shapeType == ShapeType.Line) {
                check(ShapeType.Line, ShapeType.Filled, (i * 2) + 2);
                float f5 = f3;
                float f6 = 0.0f;
                while (i2 < i) {
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f + f5, f2 + f6, 0.0f);
                    float f7 = (cos * f5) - (sin * f6);
                    f6 = (f6 * cos) + (f5 * sin);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f + f7, f2 + f6, 0.0f);
                    i2++;
                    f5 = f7;
                }
                this.renderer.color(floatBits);
                this.renderer.vertex(f5 + f, f6 + f2, 0.0f);
            } else {
                check(ShapeType.Line, ShapeType.Filled, (i * 3) + 3);
                int i3 = i - 1;
                float f8 = f3;
                float f9 = 0.0f;
                while (i2 < i3) {
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f, f2, 0.0f);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f + f8, f2 + f9, 0.0f);
                    float f10 = (cos * f8) - (sin * f9);
                    f9 = (f9 * cos) + (f8 * sin);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f + f10, f2 + f9, 0.0f);
                    i2++;
                    f8 = f10;
                }
                this.renderer.color(floatBits);
                this.renderer.vertex(f, f2, 0.0f);
                this.renderer.color(floatBits);
                this.renderer.vertex(f8 + f, f9 + f2, 0.0f);
            }
            this.renderer.color(floatBits);
            this.renderer.vertex(f + f3, f2 + 0.0f, 0.0f);
            return;
        }
        throw new IllegalArgumentException("segments must be > 0.");
    }

    public void ellipse(float f, float f2, float f3, float f4) {
        ellipse(f, f2, f3, f4, Math.max(1, (int) (((float) Math.cbrt((double) Math.max(f3 * 0.5f, 0.5f * f4))) * 12.0f)));
    }

    public void ellipse(float f, float f2, float f3, float f4, int i) {
        if (i > 0) {
            check(ShapeType.Line, ShapeType.Filled, i * 3);
            float floatBits = this.color.toFloatBits();
            float f5 = 6.2831855f / ((float) i);
            float f6 = f + (f3 / 2.0f);
            float f7 = f2 + (f4 / 2.0f);
            int i2 = 0;
            if (this.shapeType == ShapeType.Line) {
                while (i2 < i) {
                    this.renderer.color(floatBits);
                    float f8 = f3 * 0.5f;
                    float f9 = ((float) i2) * f5;
                    float f10 = f4 * 0.5f;
                    this.renderer.vertex((MathUtils.cos(f9) * f8) + f6, (MathUtils.sin(f9) * f10) + f7, 0.0f);
                    this.renderer.color(floatBits);
                    i2++;
                    float f11 = ((float) i2) * f5;
                    this.renderer.vertex((f8 * MathUtils.cos(f11)) + f6, (f10 * MathUtils.sin(f11)) + f7, 0.0f);
                }
                return;
            }
            while (i2 < i) {
                this.renderer.color(floatBits);
                float f12 = f3 * 0.5f;
                float f13 = ((float) i2) * f5;
                float f14 = f4 * 0.5f;
                this.renderer.vertex((MathUtils.cos(f13) * f12) + f6, (MathUtils.sin(f13) * f14) + f7, 0.0f);
                this.renderer.color(floatBits);
                this.renderer.vertex(f6, f7, 0.0f);
                this.renderer.color(floatBits);
                i2++;
                float f15 = ((float) i2) * f5;
                this.renderer.vertex((f12 * MathUtils.cos(f15)) + f6, (f14 * MathUtils.sin(f15)) + f7, 0.0f);
            }
            return;
        }
        throw new IllegalArgumentException("segments must be > 0.");
    }

    public void ellipse(float f, float f2, float f3, float f4, float f5) {
        ellipse(f, f2, f3, f4, f5, Math.max(1, (int) (((float) Math.cbrt((double) Math.max(f3 * 0.5f, 0.5f * f4))) * 12.0f)));
    }

    public void ellipse(float f, float f2, float f3, float f4, float f5, int i) {
        if (i > 0) {
            check(ShapeType.Line, ShapeType.Filled, i * 3);
            float floatBits = this.color.toFloatBits();
            float f6 = 6.2831855f / ((float) i);
            float f7 = (3.1415927f * f5) / 180.0f;
            float sin = MathUtils.sin(f7);
            float cos = MathUtils.cos(f7);
            float f8 = f + (f3 / 2.0f);
            float f9 = f2 + (f4 / 2.0f);
            float f10 = 0.5f;
            float f11 = f3 * 0.5f;
            int i2 = 0;
            if (this.shapeType == ShapeType.Line) {
                float f12 = f11;
                float f13 = 0.0f;
                while (i2 < i) {
                    this.renderer.color(floatBits);
                    this.renderer.vertex(((cos * f12) + f8) - (sin * f13), (f12 * sin) + f9 + (f13 * cos), 0.0f);
                    i2++;
                    float f14 = ((float) i2) * f6;
                    float cos2 = MathUtils.cos(f14) * f11;
                    float sin2 = MathUtils.sin(f14) * f4 * f10;
                    this.renderer.color(floatBits);
                    this.renderer.vertex(((cos * cos2) + f8) - (sin * sin2), f9 + (sin * cos2) + (cos * sin2), 0.0f);
                    f10 = 0.5f;
                    f13 = sin2;
                    f12 = cos2;
                }
                return;
            }
            float f15 = f11;
            float f16 = 0.0f;
            while (i2 < i) {
                this.renderer.color(floatBits);
                this.renderer.vertex(((cos * f15) + f8) - (sin * f16), (f15 * sin) + f9 + (f16 * cos), 0.0f);
                this.renderer.color(floatBits);
                this.renderer.vertex(f8, f9, 0.0f);
                i2++;
                float f17 = ((float) i2) * f6;
                float cos3 = MathUtils.cos(f17) * f11;
                float sin3 = MathUtils.sin(f17) * f4 * 0.5f;
                this.renderer.color(floatBits);
                this.renderer.vertex(((cos * cos3) + f8) - (sin * sin3), f9 + (sin * cos3) + (cos * sin3), 0.0f);
                f16 = sin3;
                f15 = cos3;
            }
            return;
        }
        throw new IllegalArgumentException("segments must be > 0.");
    }

    public void cone(float f, float f2, float f3, float f4, float f5) {
        cone(f, f2, f3, f4, f5, Math.max(1, (int) (((float) Math.sqrt((double) f4)) * 4.0f)));
    }

    public void cone(float f, float f2, float f3, float f4, float f5, int i) {
        float f6;
        float f7;
        if (i > 0) {
            check(ShapeType.Line, ShapeType.Filled, (i * 4) + 2);
            float floatBits = this.color.toFloatBits();
            float f8 = 6.2831855f / ((float) i);
            float cos = MathUtils.cos(f8);
            float sin = MathUtils.sin(f8);
            int i2 = 0;
            if (this.shapeType == ShapeType.Line) {
                f7 = f4;
                f6 = 0.0f;
                while (i2 < i) {
                    this.renderer.color(floatBits);
                    float f9 = f + f7;
                    float f10 = f2 + f6;
                    this.renderer.vertex(f9, f10, f3);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f, f2, f3 + f5);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f9, f10, f3);
                    float f11 = (cos * f7) - (sin * f6);
                    f6 = (f6 * cos) + (f7 * sin);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f + f11, f2 + f6, f3);
                    i2++;
                    f7 = f11;
                }
                this.renderer.color(floatBits);
                this.renderer.vertex(f + f7, f2 + f6, f3);
            } else {
                int i3 = i - 1;
                f7 = f4;
                f6 = 0.0f;
                while (i2 < i3) {
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f, f2, f3);
                    this.renderer.color(floatBits);
                    float f12 = f + f7;
                    float f13 = f2 + f6;
                    this.renderer.vertex(f12, f13, f3);
                    float f14 = (cos * f7) - (sin * f6);
                    f6 = (f6 * cos) + (f7 * sin);
                    this.renderer.color(floatBits);
                    float f15 = f + f14;
                    float f16 = f2 + f6;
                    this.renderer.vertex(f15, f16, f3);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f12, f13, f3);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f15, f16, f3);
                    this.renderer.color(floatBits);
                    this.renderer.vertex(f, f2, f3 + f5);
                    i2++;
                    f7 = f14;
                }
                this.renderer.color(floatBits);
                this.renderer.vertex(f, f2, f3);
                this.renderer.color(floatBits);
                this.renderer.vertex(f + f7, f2 + f6, f3);
            }
            this.renderer.color(floatBits);
            float f17 = f + f4;
            float f18 = 0.0f + f2;
            this.renderer.vertex(f17, f18, f3);
            if (this.shapeType != ShapeType.Line) {
                this.renderer.color(floatBits);
                this.renderer.vertex(f7 + f, f6 + f2, f3);
                this.renderer.color(floatBits);
                this.renderer.vertex(f17, f18, f3);
                this.renderer.color(floatBits);
                this.renderer.vertex(f, f2, f3 + f5);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("segments must be > 0.");
    }

    public void polygon(float[] fArr, int i, int i2) {
        float f;
        float f2;
        if (i2 < 6) {
            throw new IllegalArgumentException("Polygons must contain at least 3 points.");
        } else if (i2 % 2 == 0) {
            check(ShapeType.Line, null, i2);
            float floatBits = this.color.toFloatBits();
            float f3 = fArr[0];
            float f4 = fArr[1];
            int i3 = i + i2;
            while (i < i3) {
                float f5 = fArr[i];
                float f6 = fArr[i + 1];
                int i4 = i + 2;
                if (i4 >= i2) {
                    f2 = f3;
                    f = f4;
                } else {
                    f2 = fArr[i4];
                    f = fArr[i + 3];
                }
                this.renderer.color(floatBits);
                this.renderer.vertex(f5, f6, 0.0f);
                this.renderer.color(floatBits);
                this.renderer.vertex(f2, f, 0.0f);
                i = i4;
            }
        } else {
            throw new IllegalArgumentException("Polygons must have an even number of vertices.");
        }
    }

    public void polygon(float[] fArr) {
        polygon(fArr, 0, fArr.length);
    }

    public void polyline(float[] fArr, int i, int i2) {
        if (i2 < 4) {
            throw new IllegalArgumentException("Polylines must contain at least 2 points.");
        } else if (i2 % 2 == 0) {
            check(ShapeType.Line, null, i2);
            float floatBits = this.color.toFloatBits();
            int i3 = (i2 + i) - 2;
            while (i < i3) {
                float f = fArr[i];
                float f2 = fArr[i + 1];
                int i4 = i + 2;
                float f3 = fArr[i4];
                float f4 = fArr[i + 3];
                this.renderer.color(floatBits);
                this.renderer.vertex(f, f2, 0.0f);
                this.renderer.color(floatBits);
                this.renderer.vertex(f3, f4, 0.0f);
                i = i4;
            }
        } else {
            throw new IllegalArgumentException("Polylines must have an even number of vertices.");
        }
    }

    public void polyline(float[] fArr) {
        polyline(fArr, 0, fArr.length);
    }

    private void check(ShapeType shapeType2, ShapeType shapeType3, int i) {
        ShapeType shapeType4 = this.shapeType;
        if (shapeType4 == null) {
            throw new IllegalStateException("begin must be called first.");
        } else if (shapeType4 == shapeType2 || shapeType4 == shapeType3) {
            if (this.matrixDirty) {
                ShapeType shapeType5 = this.shapeType;
                end();
                begin(shapeType5);
            } else if (this.renderer.getMaxVertices() - this.renderer.getNumVertices() < i) {
                ShapeType shapeType6 = this.shapeType;
                end();
                begin(shapeType6);
            }
        } else if (this.autoShapeType) {
            end();
            begin(shapeType2);
        } else if (shapeType3 == null) {
            throw new IllegalStateException("Must call begin(ShapeType." + shapeType2 + ").");
        } else {
            throw new IllegalStateException("Must call begin(ShapeType." + shapeType2 + ") or begin(ShapeType." + shapeType3 + ").");
        }
    }

    public void end() {
        this.renderer.end();
        this.shapeType = null;
    }

    public void flush() {
        ShapeType shapeType2 = this.shapeType;
        if (shapeType2 != null) {
            end();
            begin(shapeType2);
        }
    }

    public ShapeType getCurrentType() {
        return this.shapeType;
    }

    public ImmediateModeRenderer getRenderer() {
        return this.renderer;
    }

    public boolean isDrawing() {
        return this.shapeType != null;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        this.renderer.dispose();
    }
}
