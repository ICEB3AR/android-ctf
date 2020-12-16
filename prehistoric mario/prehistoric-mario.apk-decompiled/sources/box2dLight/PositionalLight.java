package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;

public abstract class PositionalLight extends Light {
    protected Body body;
    protected float bodyAngleOffset;
    protected float bodyOffsetX;
    protected float bodyOffsetY;
    protected float[] cos;
    protected float[] endX;
    protected float[] endY;
    protected float[] sin;
    protected final Vector2 start = new Vector2();
    protected final Vector2 tmpEnd = new Vector2();

    public PositionalLight(RayHandler rayHandler, int i, Color color, float f, float f2, float f3, float f4) {
        super(rayHandler, i, color, f, f4);
        Vector2 vector2 = this.start;
        vector2.x = f2;
        vector2.y = f3;
        this.lightMesh = new Mesh(Mesh.VertexDataType.VertexArray, false, this.vertexNum, 0, new VertexAttribute(1, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, 1, "s"));
        this.softShadowMesh = new Mesh(Mesh.VertexDataType.VertexArray, false, this.vertexNum * 2, 0, new VertexAttribute(1, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, 1, "s"));
        setMesh();
    }

    /* access modifiers changed from: package-private */
    @Override // box2dLight.Light
    public void update() {
        updateBody();
        if (!cull()) {
            if (!this.staticLight || this.dirty) {
                this.dirty = false;
                updateMesh();
            }
        }
    }

    /* access modifiers changed from: package-private */
    @Override // box2dLight.Light
    public void render() {
        if (!this.rayHandler.culling || !this.culled) {
            this.rayHandler.lightRenderedLastFrame++;
            this.lightMesh.render(this.rayHandler.lightShader, 6, 0, this.vertexNum);
            if (this.soft && !this.xray) {
                this.softShadowMesh.render(this.rayHandler.lightShader, 5, 0, (this.vertexNum - 1) * 2);
            }
        }
    }

    @Override // box2dLight.Light
    public void attachToBody(Body body2) {
        attachToBody(body2, 0.0f, 0.0f, 0.0f);
    }

    public void attachToBody(Body body2, float f, float f2) {
        attachToBody(body2, f, f2, 0.0f);
    }

    public void attachToBody(Body body2, float f, float f2, float f3) {
        this.body = body2;
        this.bodyOffsetX = f;
        this.bodyOffsetY = f2;
        this.bodyAngleOffset = f3;
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    @Override // box2dLight.Light
    public Vector2 getPosition() {
        this.tmpPosition.x = this.start.x;
        this.tmpPosition.y = this.start.y;
        return this.tmpPosition;
    }

    @Override // box2dLight.Light
    public Body getBody() {
        return this.body;
    }

    @Override // box2dLight.Light
    public float getX() {
        return this.start.x;
    }

    @Override // box2dLight.Light
    public float getY() {
        return this.start.y;
    }

    @Override // box2dLight.Light
    public void setPosition(float f, float f2) {
        Vector2 vector2 = this.start;
        vector2.x = f;
        vector2.y = f2;
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    @Override // box2dLight.Light
    public void setPosition(Vector2 vector2) {
        this.start.x = vector2.x;
        this.start.y = vector2.y;
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    @Override // box2dLight.Light
    public boolean contains(float f, float f2) {
        float f3 = this.start.x - f;
        float f4 = this.start.y - f2;
        int i = 0;
        if (this.distance * this.distance <= (f3 * f3) + (f4 * f4)) {
            return false;
        }
        float[] fArr = this.mx;
        int i2 = this.rayNum;
        float f5 = this.start.x;
        fArr[i2] = f5;
        float[] fArr2 = this.my;
        int i3 = this.rayNum;
        float f6 = this.start.y;
        fArr2[i3] = f6;
        boolean z = false;
        while (i <= this.rayNum) {
            float f7 = this.mx[i];
            float f8 = this.my[i];
            if (((f8 < f2 && f6 >= f2) || (f8 >= f2 && f6 < f2)) && ((f2 - f8) / (f6 - f8)) * (f5 - f7) < f - f7) {
                z = !z;
            }
            i++;
            f5 = f7;
            f6 = f8;
        }
        return z;
    }

    /* access modifiers changed from: protected */
    @Override // box2dLight.Light
    public void setRayNum(int i) {
        super.setRayNum(i);
        this.sin = new float[i];
        this.cos = new float[i];
        this.endX = new float[i];
        this.endY = new float[i];
    }

    /* access modifiers changed from: protected */
    public boolean cull() {
        this.culled = this.rayHandler.culling && !this.rayHandler.intersect(this.start.x, this.start.y, this.distance + this.softShadowLength);
        return this.culled;
    }

    /* access modifiers changed from: protected */
    public void updateBody() {
        if (this.body != null && !this.staticLight) {
            Vector2 position = this.body.getPosition();
            float angle = this.body.getAngle();
            float cos2 = MathUtils.cos(angle);
            float sin2 = MathUtils.sin(angle);
            float f = this.bodyOffsetX;
            float f2 = this.bodyOffsetY;
            this.start.x = position.x + ((f * cos2) - (f2 * sin2));
            this.start.y = position.y + (f * sin2) + (f2 * cos2);
            setDirection(this.bodyAngleOffset + (angle * 57.295776f));
        }
    }

    /* access modifiers changed from: protected */
    public void updateMesh() {
        for (int i = 0; i < this.rayNum; i++) {
            this.m_index = i;
            this.f[i] = 1.0f;
            this.tmpEnd.x = this.endX[i] + this.start.x;
            this.mx[i] = this.tmpEnd.x;
            this.tmpEnd.y = this.endY[i] + this.start.y;
            this.my[i] = this.tmpEnd.y;
            if (this.rayHandler.world != null && !this.xray) {
                this.rayHandler.world.rayCast(this.ray, this.start, this.tmpEnd);
            }
        }
        setMesh();
    }

    /* access modifiers changed from: protected */
    public void setMesh() {
        this.segments[0] = this.start.x;
        this.segments[1] = this.start.y;
        this.segments[2] = this.colorF;
        this.segments[3] = 1.0f;
        int i = 0;
        int i2 = 4;
        while (i < this.rayNum) {
            int i3 = i2 + 1;
            this.segments[i2] = this.mx[i];
            int i4 = i3 + 1;
            this.segments[i3] = this.my[i];
            int i5 = i4 + 1;
            this.segments[i4] = this.colorF;
            this.segments[i5] = 1.0f - this.f[i];
            i++;
            i2 = i5 + 1;
        }
        this.lightMesh.setVertices(this.segments, 0, i2);
        if (this.soft && !this.xray) {
            int i6 = 0;
            int i7 = 0;
            while (i6 < this.rayNum) {
                int i8 = i7 + 1;
                this.segments[i7] = this.mx[i6];
                int i9 = i8 + 1;
                this.segments[i8] = this.my[i6];
                int i10 = i9 + 1;
                this.segments[i9] = this.colorF;
                float f = 1.0f - this.f[i6];
                int i11 = i10 + 1;
                this.segments[i10] = f;
                int i12 = i11 + 1;
                this.segments[i11] = this.mx[i6] + (this.softShadowLength * f * this.cos[i6]);
                int i13 = i12 + 1;
                this.segments[i12] = this.my[i6] + (f * this.softShadowLength * this.sin[i6]);
                int i14 = i13 + 1;
                this.segments[i13] = zeroColorBits;
                this.segments[i14] = 0.0f;
                i6++;
                i7 = i14 + 1;
            }
            this.softShadowMesh.setVertices(this.segments, 0, i7);
        }
    }
}
