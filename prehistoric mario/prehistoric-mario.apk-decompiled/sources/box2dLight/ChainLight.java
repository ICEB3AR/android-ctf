package box2dLight;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.ShapeRenderer;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Rectangle;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.utils.FloatArray;
import com.badlogic.gdx.utils.Pools;

public class ChainLight extends Light {
    public static float defaultRayStartOffset = 0.001f;
    protected Body body;
    protected float bodyAngle;
    protected float bodyAngleOffset;
    protected final Vector2 bodyPosition;
    public final FloatArray chain;
    protected final Rectangle chainLightBounds;
    protected final float[] endX;
    protected final float[] endY;
    protected int rayDirection;
    protected final Rectangle rayHandlerBounds;
    public float rayStartOffset;
    protected final Matrix3 restorePosition;
    protected final Matrix3 rotateAroundZero;
    protected final FloatArray segmentAngles;
    protected final FloatArray segmentLengths;
    protected final float[] startX;
    protected final float[] startY;
    protected final Vector2 tmpEnd;
    protected final Vector2 tmpPerp;
    protected final Vector2 tmpStart;
    protected final Vector2 tmpVec;
    protected final Matrix3 zeroPosition;

    @Override // box2dLight.Light
    @Deprecated
    public void setDirection(float f) {
    }

    public ChainLight(RayHandler rayHandler, int i, Color color, float f, int i2) {
        this(rayHandler, i, color, f, i2, null);
    }

    public ChainLight(RayHandler rayHandler, int i, Color color, float f, int i2, float[] fArr) {
        super(rayHandler, i, color, f, 0.0f);
        this.segmentAngles = new FloatArray();
        this.segmentLengths = new FloatArray();
        this.bodyPosition = new Vector2();
        this.tmpEnd = new Vector2();
        this.tmpStart = new Vector2();
        this.tmpPerp = new Vector2();
        this.tmpVec = new Vector2();
        this.zeroPosition = new Matrix3();
        this.rotateAroundZero = new Matrix3();
        this.restorePosition = new Matrix3();
        this.chainLightBounds = new Rectangle();
        this.rayHandlerBounds = new Rectangle();
        this.rayStartOffset = defaultRayStartOffset;
        this.rayDirection = i2;
        this.vertexNum = (this.vertexNum - 1) * 2;
        this.endX = new float[i];
        this.endY = new float[i];
        this.startX = new float[i];
        this.startY = new float[i];
        this.chain = fArr != null ? new FloatArray(fArr) : new FloatArray();
        this.lightMesh = new Mesh(Mesh.VertexDataType.VertexArray, false, this.vertexNum, 0, new VertexAttribute(1, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, 1, "s"));
        this.softShadowMesh = new Mesh(Mesh.VertexDataType.VertexArray, false, this.vertexNum * 2, 0, new VertexAttribute(1, 2, "vertex_positions"), new VertexAttribute(4, 4, "quad_colors"), new VertexAttribute(32, 1, "s"));
        setMesh();
    }

    /* access modifiers changed from: package-private */
    @Override // box2dLight.Light
    public void update() {
        if (this.dirty) {
            updateChain();
            applyAttachment();
        } else {
            updateBody();
        }
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
            this.lightMesh.render(this.rayHandler.lightShader, 5, 0, this.vertexNum);
            if (this.soft && !this.xray) {
                this.softShadowMesh.render(this.rayHandler.lightShader, 5, 0, this.vertexNum);
            }
        }
    }

    public void debugRender(ShapeRenderer shapeRenderer) {
        shapeRenderer.setColor(Color.YELLOW);
        FloatArray floatArray = (FloatArray) Pools.obtain(FloatArray.class);
        floatArray.clear();
        for (int i = 0; i < this.rayNum; i++) {
            floatArray.addAll(this.mx[i], this.my[i]);
        }
        for (int i2 = this.rayNum - 1; i2 > -1; i2--) {
            floatArray.addAll(this.startX[i2], this.startY[i2]);
        }
        shapeRenderer.polygon(floatArray.shrink());
        Pools.free(floatArray);
    }

    @Override // box2dLight.Light
    public void attachToBody(Body body2) {
        attachToBody(body2, 0.0f);
    }

    public void attachToBody(Body body2, float f) {
        this.body = body2;
        this.bodyPosition.set(body2.getPosition());
        this.bodyAngleOffset = f * 0.017453292f;
        this.bodyAngle = body2.getAngle();
        applyAttachment();
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    @Override // box2dLight.Light
    public Body getBody() {
        return this.body;
    }

    @Override // box2dLight.Light
    public float getX() {
        return this.tmpPosition.x;
    }

    @Override // box2dLight.Light
    public float getY() {
        return this.tmpPosition.y;
    }

    @Override // box2dLight.Light
    public void setPosition(float f, float f2) {
        this.tmpPosition.x = f;
        this.tmpPosition.y = f2;
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    @Override // box2dLight.Light
    public void setPosition(Vector2 vector2) {
        this.tmpPosition.x = vector2.x;
        this.tmpPosition.y = vector2.y;
        if (this.staticLight) {
            this.dirty = true;
        }
    }

    @Override // box2dLight.Light
    public boolean contains(float f, float f2) {
        boolean z = false;
        if (!this.chainLightBounds.contains(f, f2)) {
            return false;
        }
        FloatArray floatArray = (FloatArray) Pools.obtain(FloatArray.class);
        floatArray.clear();
        for (int i = 0; i < this.rayNum; i++) {
            floatArray.addAll(this.mx[i], this.my[i]);
        }
        for (int i2 = this.rayNum - 1; i2 > -1; i2--) {
            floatArray.addAll(this.startX[i2], this.startY[i2]);
        }
        int i3 = 0;
        int i4 = 0;
        while (i3 < floatArray.size) {
            float f3 = floatArray.items[i3];
            float f4 = floatArray.items[i3 + 1];
            int i5 = i3 + 2;
            float f5 = floatArray.items[i5 % floatArray.size];
            float f6 = floatArray.items[(i3 + 3) % floatArray.size];
            if (((f4 <= f2 && f2 < f6) || (f6 <= f2 && f2 < f4)) && f < (((f5 - f3) / (f6 - f4)) * (f2 - f4)) + f3) {
                i4++;
            }
            i3 = i5;
        }
        if ((i4 & 1) == 1) {
            z = true;
        }
        Pools.free(floatArray);
        return z;
    }

    @Override // box2dLight.Light
    public void setDistance(float f) {
        float f2 = f * RayHandler.gammaCorrectionParameter;
        if (f2 < 0.01f) {
            f2 = 0.01f;
        }
        this.distance = f2;
        this.dirty = true;
    }

    public void updateChain() {
        int i;
        Vector2 vector2 = (Vector2) Pools.obtain(Vector2.class);
        Vector2 vector22 = (Vector2) Pools.obtain(Vector2.class);
        Vector2 vector23 = (Vector2) Pools.obtain(Vector2.class);
        Vector2 vector24 = (Vector2) Pools.obtain(Vector2.class);
        Vector2 vector25 = (Vector2) Pools.obtain(Vector2.class);
        Spinor spinor = (Spinor) Pools.obtain(Spinor.class);
        Spinor spinor2 = (Spinor) Pools.obtain(Spinor.class);
        Spinor spinor3 = (Spinor) Pools.obtain(Spinor.class);
        Spinor spinor4 = (Spinor) Pools.obtain(Spinor.class);
        Spinor spinor5 = (Spinor) Pools.obtain(Spinor.class);
        Spinor spinor6 = (Spinor) Pools.obtain(Spinor.class);
        Spinor spinor7 = (Spinor) Pools.obtain(Spinor.class);
        int i2 = (this.chain.size / 2) - 1;
        this.segmentAngles.clear();
        this.segmentLengths.clear();
        int i3 = 0;
        float f = 0.0f;
        int i4 = 0;
        while (i3 < this.chain.size - 2) {
            int i5 = i3 + 2;
            vector2.set(this.chain.items[i5], this.chain.items[i3 + 3]).sub(this.chain.items[i3], this.chain.items[i3 + 1]);
            this.segmentLengths.add(vector2.len());
            this.segmentAngles.add(vector2.rotate90(this.rayDirection).angle() * 0.017453292f);
            f += this.segmentLengths.items[i4];
            i4++;
            i3 = i5;
            spinor = spinor;
            vector22 = vector22;
        }
        int i6 = this.rayNum;
        int i7 = 0;
        int i8 = 0;
        while (i7 < i2) {
            spinor2.set(i7 == 0 ? this.segmentAngles.items[i7] : this.segmentAngles.items[i7 - 1]);
            spinor3.set(this.segmentAngles.items[i7]);
            spinor4.set(i7 == this.segmentAngles.size + -1 ? this.segmentAngles.items[i7] : this.segmentAngles.items[i7 + 1]);
            int i9 = i8;
            spinor5.set(spinor2).slerp(spinor3, 0.5f);
            spinor6.set(spinor3).slerp(spinor4, 0.5f);
            int i10 = i7 * 2;
            vector23.set(this.chain.items[i10], this.chain.items[i10 + 1]);
            vector24.set(this.chain.items[i10 + 2], this.chain.items[i10 + 3]).sub(vector23).nor();
            float f2 = (float) i6;
            float f3 = f / f2;
            if (i7 == i2 - 1) {
                i = i6;
            } else {
                i = (int) ((this.segmentLengths.items[i7] / f) * f2);
            }
            int i11 = 0;
            while (i11 < i) {
                float f4 = ((float) i11) * f3;
                spinor7.set(spinor5).slerp(spinor6, f4 / this.segmentLengths.items[i7]);
                float angle = spinor7.angle();
                vector25.set(this.rayStartOffset, 0.0f).rotateRad(angle);
                vector2.set(vector24).scl(f4).add(vector23).add(vector25);
                this.startX[i9] = vector2.x;
                this.startY[i9] = vector2.y;
                vector22.set(this.distance, 0.0f).rotateRad(angle).add(vector2);
                this.endX[i9] = vector22.x;
                this.endY[i9] = vector22.y;
                i9++;
                i11++;
                i2 = i2;
                f3 = f3;
                spinor5 = spinor5;
                spinor7 = spinor7;
            }
            i6 -= i;
            f -= this.segmentLengths.items[i7];
            i7++;
            i8 = i9;
            spinor4 = spinor4;
            i2 = i2;
        }
        Pools.free(vector2);
        Pools.free(vector22);
        Pools.free(vector23);
        Pools.free(vector24);
        Pools.free(vector25);
        Pools.free(spinor2);
        Pools.free(spinor3);
        Pools.free(spinor4);
        Pools.free(spinor5);
        Pools.free(spinor6);
        Pools.free(spinor7);
        Pools.free(spinor);
    }

    /* access modifiers changed from: package-private */
    public void applyAttachment() {
        if (!(this.body == null || this.staticLight)) {
            this.restorePosition.setToTranslation(this.bodyPosition);
            this.rotateAroundZero.setToRotationRad(this.bodyAngle + this.bodyAngleOffset);
            for (int i = 0; i < this.rayNum; i++) {
                this.tmpVec.set(this.startX[i], this.startY[i]).mul(this.rotateAroundZero).mul(this.restorePosition);
                this.startX[i] = this.tmpVec.x;
                this.startY[i] = this.tmpVec.y;
                this.tmpVec.set(this.endX[i], this.endY[i]).mul(this.rotateAroundZero).mul(this.restorePosition);
                this.endX[i] = this.tmpVec.x;
                this.endY[i] = this.tmpVec.y;
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean cull() {
        boolean z = false;
        if (!this.rayHandler.culling) {
            this.culled = false;
        } else {
            updateBoundingRects();
            if (this.chainLightBounds.width > 0.0f && this.chainLightBounds.height > 0.0f && !this.chainLightBounds.overlaps(this.rayHandlerBounds)) {
                z = true;
            }
            this.culled = z;
        }
        return this.culled;
    }

    /* access modifiers changed from: package-private */
    public void updateBody() {
        if (!(this.body == null || this.staticLight)) {
            Vector2 position = this.body.getPosition();
            this.tmpVec.set(0.0f, 0.0f).sub(this.bodyPosition);
            this.bodyPosition.set(position);
            this.zeroPosition.setToTranslation(this.tmpVec);
            this.restorePosition.setToTranslation(this.bodyPosition);
            this.rotateAroundZero.setToRotationRad(this.bodyAngle).inv().rotateRad(this.body.getAngle());
            this.bodyAngle = this.body.getAngle();
            for (int i = 0; i < this.rayNum; i++) {
                this.tmpVec.set(this.startX[i], this.startY[i]).mul(this.zeroPosition).mul(this.rotateAroundZero).mul(this.restorePosition);
                this.startX[i] = this.tmpVec.x;
                this.startY[i] = this.tmpVec.y;
                this.tmpVec.set(this.endX[i], this.endY[i]).mul(this.zeroPosition).mul(this.rotateAroundZero).mul(this.restorePosition);
                this.endX[i] = this.tmpVec.x;
                this.endY[i] = this.tmpVec.y;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void updateMesh() {
        for (int i = 0; i < this.rayNum; i++) {
            this.m_index = i;
            this.f[i] = 1.0f;
            this.tmpEnd.x = this.endX[i];
            this.mx[i] = this.tmpEnd.x;
            this.tmpEnd.y = this.endY[i];
            this.my[i] = this.tmpEnd.y;
            Vector2 vector2 = this.tmpStart;
            vector2.x = this.startX[i];
            vector2.y = this.startY[i];
            if (this.rayHandler.world != null && !this.xray) {
                this.rayHandler.world.rayCast(this.ray, this.tmpStart, this.tmpEnd);
            }
        }
        setMesh();
    }

    /* access modifiers changed from: protected */
    public void setMesh() {
        int i = 0;
        int i2 = 0;
        while (i < this.rayNum) {
            int i3 = i2 + 1;
            this.segments[i2] = this.startX[i];
            int i4 = i3 + 1;
            this.segments[i3] = this.startY[i];
            int i5 = i4 + 1;
            this.segments[i4] = this.colorF;
            int i6 = i5 + 1;
            this.segments[i5] = 1.0f;
            int i7 = i6 + 1;
            this.segments[i6] = this.mx[i];
            int i8 = i7 + 1;
            this.segments[i7] = this.my[i];
            int i9 = i8 + 1;
            this.segments[i8] = this.colorF;
            this.segments[i9] = 1.0f - this.f[i];
            i++;
            i2 = i9 + 1;
        }
        this.lightMesh.setVertices(this.segments, 0, i2);
        if (this.soft && !this.xray) {
            int i10 = 0;
            int i11 = 0;
            while (i10 < this.rayNum) {
                int i12 = i11 + 1;
                this.segments[i11] = this.mx[i10];
                int i13 = i12 + 1;
                this.segments[i12] = this.my[i10];
                int i14 = i13 + 1;
                this.segments[i13] = this.colorF;
                float f = 1.0f - this.f[i10];
                int i15 = i14 + 1;
                this.segments[i14] = f;
                this.tmpPerp.set(this.mx[i10], this.my[i10]).sub(this.startX[i10], this.startY[i10]).nor().scl(this.softShadowLength * f).add(this.mx[i10], this.my[i10]);
                int i16 = i15 + 1;
                this.segments[i15] = this.tmpPerp.x;
                int i17 = i16 + 1;
                this.segments[i16] = this.tmpPerp.y;
                int i18 = i17 + 1;
                this.segments[i17] = zeroColorBits;
                this.segments[i18] = 0.0f;
                i10++;
                i11 = i18 + 1;
            }
            this.softShadowMesh.setVertices(this.segments, 0, i11);
        }
    }

    /* access modifiers changed from: protected */
    public void updateBoundingRects() {
        float[] fArr = this.startX;
        float f = fArr[0];
        float f2 = fArr[0];
        float[] fArr2 = this.startY;
        float f3 = fArr2[0];
        float f4 = fArr2[0];
        for (int i = 0; i < this.rayNum; i++) {
            float[] fArr3 = this.startX;
            if (f <= fArr3[i]) {
                f = fArr3[i];
            }
            if (f <= this.mx[i]) {
                f = this.mx[i];
            }
            float[] fArr4 = this.startX;
            if (f2 >= fArr4[i]) {
                f2 = fArr4[i];
            }
            if (f2 >= this.mx[i]) {
                f2 = this.mx[i];
            }
            float[] fArr5 = this.startY;
            if (f3 <= fArr5[i]) {
                f3 = fArr5[i];
            }
            if (f3 <= this.my[i]) {
                f3 = this.my[i];
            }
            float[] fArr6 = this.startY;
            if (f4 >= fArr6[i]) {
                f4 = fArr6[i];
            }
            if (f4 >= this.my[i]) {
                f4 = this.my[i];
            }
        }
        this.chainLightBounds.set(f2, f4, f - f2, f3 - f4);
        this.rayHandlerBounds.set(this.rayHandler.x1, this.rayHandler.y1, this.rayHandler.x2 - this.rayHandler.x1, this.rayHandler.y2 - this.rayHandler.y1);
    }
}
