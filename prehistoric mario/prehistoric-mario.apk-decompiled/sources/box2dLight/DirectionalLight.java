package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;

public class DirectionalLight extends Light {
    protected float cos;
    protected final Vector2[] end = new Vector2[this.rayNum];
    protected float sin;
    protected final Vector2[] start = new Vector2[this.rayNum];

    @Override // box2dLight.Light
    @Deprecated
    public void attachToBody(Body body) {
    }

    @Override // box2dLight.Light
    @Deprecated
    public Body getBody() {
        return null;
    }

    @Override // box2dLight.Light
    @Deprecated
    public boolean getIgnoreAttachedBody() {
        return false;
    }

    @Override // box2dLight.Light
    @Deprecated
    public float getX() {
        return 0.0f;
    }

    @Override // box2dLight.Light
    @Deprecated
    public float getY() {
        return 0.0f;
    }

    @Override // box2dLight.Light
    @Deprecated
    public void setDistance(float f) {
    }

    @Override // box2dLight.Light
    @Deprecated
    public void setIgnoreAttachedBody(boolean z) {
    }

    @Override // box2dLight.Light
    @Deprecated
    public void setPosition(float f, float f2) {
    }

    @Override // box2dLight.Light
    @Deprecated
    public void setPosition(Vector2 vector2) {
    }

    public DirectionalLight(RayHandler rayHandler, int i, Color color, float f) {
        super(rayHandler, i, color, Float.POSITIVE_INFINITY, f);
        this.vertexNum = (this.vertexNum - 1) * 2;
        for (int i2 = 0; i2 < this.rayNum; i2++) {
            this.start[i2] = new Vector2();
            this.end[i2] = new Vector2();
        }
        this.lightMesh = new Mesh(Mesh.VertexDataType.VertexArray, this.staticLight, this.vertexNum, 0, new VertexAttribute(1, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, 1, "s"));
        this.softShadowMesh = new Mesh(Mesh.VertexDataType.VertexArray, this.staticLight, this.vertexNum, 0, new VertexAttribute(1, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, 1, "s"));
        update();
    }

    @Override // box2dLight.Light
    public void setDirection(float f) {
        this.direction = f;
        this.sin = MathUtils.sinDeg(f);
        this.cos = MathUtils.cosDeg(f);
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    /* access modifiers changed from: package-private */
    @Override // box2dLight.Light
    public void update() {
        if (!this.staticLight || this.dirty) {
            this.dirty = false;
            float f = this.rayHandler.x2 - this.rayHandler.x1;
            float f2 = this.rayHandler.y2 - this.rayHandler.y1;
            if (f <= f2) {
                f = f2;
            }
            float f3 = this.cos * f;
            float f4 = this.sin * f;
            if (f3 * f3 < 0.1f && f4 * f4 < 0.1f) {
                f3 = 1.0f;
                f4 = 1.0f;
            }
            float f5 = (-this.sin) * f;
            float f6 = f * this.cos;
            float f7 = ((this.rayHandler.x1 + this.rayHandler.x2) * 0.5f) - f5;
            float f8 = ((this.rayHandler.y1 + this.rayHandler.y2) * 0.5f) - f6;
            float f9 = (f5 * 2.0f) / ((float) (this.rayNum - 1));
            float floor = ((float) MathUtils.floor(f7 / (f9 * 2.0f))) * f9 * 2.0f;
            float f10 = (f6 * 2.0f) / ((float) (this.rayNum - 1));
            float ceil = ((float) MathUtils.ceil(f8 / (f10 * 2.0f))) * f10 * 2.0f;
            for (int i = 0; i < this.rayNum; i++) {
                float f11 = (float) i;
                float f12 = (f11 * f9) + floor;
                float f13 = (f11 * f10) + ceil;
                this.m_index = i;
                Vector2[] vector2Arr = this.start;
                vector2Arr[i].x = f12 - f3;
                vector2Arr[i].y = f13 - f4;
                float[] fArr = this.mx;
                float f14 = f12 + f3;
                this.end[i].x = f14;
                fArr[i] = f14;
                float[] fArr2 = this.my;
                float f15 = f13 + f4;
                this.end[i].y = f15;
                fArr2[i] = f15;
                if (this.rayHandler.world != null && !this.xray) {
                    this.rayHandler.world.rayCast(this.ray, this.start[i], this.end[i]);
                }
            }
            int i2 = this.rayNum;
            int i3 = 0;
            int i4 = 0;
            while (i3 < i2) {
                int i5 = i4 + 1;
                this.segments[i4] = this.start[i3].x;
                int i6 = i5 + 1;
                this.segments[i5] = this.start[i3].y;
                int i7 = i6 + 1;
                this.segments[i6] = this.colorF;
                int i8 = i7 + 1;
                this.segments[i7] = 1.0f;
                int i9 = i8 + 1;
                this.segments[i8] = this.mx[i3];
                int i10 = i9 + 1;
                this.segments[i9] = this.my[i3];
                int i11 = i10 + 1;
                this.segments[i10] = this.colorF;
                this.segments[i11] = 1.0f;
                i3++;
                i4 = i11 + 1;
            }
            this.lightMesh.setVertices(this.segments, 0, i4);
            if (this.soft && !this.xray) {
                int i12 = 0;
                int i13 = 0;
                while (i12 < i2) {
                    int i14 = i13 + 1;
                    this.segments[i13] = this.mx[i12];
                    int i15 = i14 + 1;
                    this.segments[i14] = this.my[i12];
                    int i16 = i15 + 1;
                    this.segments[i15] = this.colorF;
                    int i17 = i16 + 1;
                    this.segments[i16] = 1.0f;
                    int i18 = i17 + 1;
                    this.segments[i17] = this.mx[i12] + (this.softShadowLength * this.cos);
                    int i19 = i18 + 1;
                    this.segments[i18] = this.my[i12] + (this.softShadowLength * this.sin);
                    int i20 = i19 + 1;
                    this.segments[i19] = zeroColorBits;
                    this.segments[i20] = 1.0f;
                    i12++;
                    i13 = i20 + 1;
                }
                this.softShadowMesh.setVertices(this.segments, 0, i13);
            }
        }
    }

    /* access modifiers changed from: package-private */
    @Override // box2dLight.Light
    public void render() {
        this.rayHandler.lightRenderedLastFrame++;
        this.lightMesh.render(this.rayHandler.lightShader, 5, 0, this.vertexNum);
        if (this.soft && !this.xray) {
            this.softShadowMesh.render(this.rayHandler.lightShader, 5, 0, this.vertexNum);
        }
    }

    @Override // box2dLight.Light
    public boolean contains(float f, float f2) {
        float[] fArr = this.mx;
        int i = this.rayNum;
        float f3 = this.start[0].x;
        fArr[i] = f3;
        float[] fArr2 = this.my;
        int i2 = this.rayNum;
        float f4 = this.start[0].y;
        fArr2[i2] = f4;
        int i3 = 0;
        boolean z = false;
        while (i3 <= this.rayNum) {
            float f5 = this.mx[i3];
            float f6 = this.my[i3];
            if (((f6 < f2 && f4 >= f2) || (f6 >= f2 && f4 < f2)) && ((f2 - f6) / (f4 - f6)) * (f3 - f5) < f - f5) {
                z = !z;
            }
            i3++;
            f3 = f5;
            f4 = f6;
        }
        int i4 = 0;
        while (i4 < this.rayNum) {
            float f7 = this.start[i4].x;
            float f8 = this.start[i4].y;
            if (((f8 < f2 && f4 >= f2) || (f8 >= f2 && f4 < f2)) && ((f2 - f8) / (f4 - f8)) * (f3 - f7) < f - f7) {
                z = !z;
            }
            i4++;
            f3 = f7;
            f4 = f8;
        }
        return z;
    }
}
