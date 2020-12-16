package com.badlogic.gdx.graphics;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.IndexArray;
import com.badlogic.gdx.graphics.glutils.IndexBufferObject;
import com.badlogic.gdx.graphics.glutils.IndexBufferObjectSubData;
import com.badlogic.gdx.graphics.glutils.IndexData;
import com.badlogic.gdx.graphics.glutils.InstanceBufferObject;
import com.badlogic.gdx.graphics.glutils.InstanceData;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.graphics.glutils.VertexArray;
import com.badlogic.gdx.graphics.glutils.VertexBufferObject;
import com.badlogic.gdx.graphics.glutils.VertexBufferObjectSubData;
import com.badlogic.gdx.graphics.glutils.VertexBufferObjectWithVAO;
import com.badlogic.gdx.graphics.glutils.VertexData;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.nio.FloatBuffer;
import java.nio.ShortBuffer;
import java.util.HashMap;
import java.util.Map;

public class Mesh implements Disposable {
    static final Map<Application, Array<Mesh>> meshes = new HashMap();
    boolean autoBind;
    final IndexData indices;
    InstanceData instances;
    boolean isInstanced;
    final boolean isVertexArray;
    private final Vector3 tmpV;
    final VertexData vertices;

    public enum VertexDataType {
        VertexArray,
        VertexBufferObject,
        VertexBufferObjectSubData,
        VertexBufferObjectWithVAO
    }

    protected Mesh(VertexData vertexData, IndexData indexData, boolean z) {
        this.autoBind = true;
        this.isInstanced = false;
        this.tmpV = new Vector3();
        this.vertices = vertexData;
        this.indices = indexData;
        this.isVertexArray = z;
        addManagedMesh(Gdx.app, this);
    }

    public Mesh(boolean z, int i, int i2, VertexAttribute... vertexAttributeArr) {
        this.autoBind = true;
        this.isInstanced = false;
        this.tmpV = new Vector3();
        this.vertices = makeVertexBuffer(z, i, new VertexAttributes(vertexAttributeArr));
        this.indices = new IndexBufferObject(z, i2);
        this.isVertexArray = false;
        addManagedMesh(Gdx.app, this);
    }

    public Mesh(boolean z, int i, int i2, VertexAttributes vertexAttributes) {
        this.autoBind = true;
        this.isInstanced = false;
        this.tmpV = new Vector3();
        this.vertices = makeVertexBuffer(z, i, vertexAttributes);
        this.indices = new IndexBufferObject(z, i2);
        this.isVertexArray = false;
        addManagedMesh(Gdx.app, this);
    }

    public Mesh(boolean z, boolean z2, int i, int i2, VertexAttributes vertexAttributes) {
        this.autoBind = true;
        this.isInstanced = false;
        this.tmpV = new Vector3();
        this.vertices = makeVertexBuffer(z, i, vertexAttributes);
        this.indices = new IndexBufferObject(z2, i2);
        this.isVertexArray = false;
        addManagedMesh(Gdx.app, this);
    }

    private VertexData makeVertexBuffer(boolean z, int i, VertexAttributes vertexAttributes) {
        if (Gdx.gl30 != null) {
            return new VertexBufferObjectWithVAO(z, i, vertexAttributes);
        }
        return new VertexBufferObject(z, i, vertexAttributes);
    }

    public Mesh(VertexDataType vertexDataType, boolean z, int i, int i2, VertexAttribute... vertexAttributeArr) {
        this(vertexDataType, z, i, i2, new VertexAttributes(vertexAttributeArr));
    }

    /* renamed from: com.badlogic.gdx.graphics.Mesh$1  reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$badlogic$gdx$graphics$Mesh$VertexDataType = new int[VertexDataType.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(10:0|1|2|3|4|5|6|7|8|10) */
        /* JADX WARNING: Can't wrap try/catch for region: R(8:0|1|2|3|4|5|6|(3:7|8|10)) */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:5:0x001f */
        /* JADX WARNING: Missing exception handler attribute for start block: B:7:0x002a */
        static {
            /*
                com.badlogic.gdx.graphics.Mesh$VertexDataType[] r0 = com.badlogic.gdx.graphics.Mesh.VertexDataType.values()
                int r0 = r0.length
                int[] r0 = new int[r0]
                com.badlogic.gdx.graphics.Mesh.AnonymousClass1.$SwitchMap$com$badlogic$gdx$graphics$Mesh$VertexDataType = r0
                int[] r0 = com.badlogic.gdx.graphics.Mesh.AnonymousClass1.$SwitchMap$com$badlogic$gdx$graphics$Mesh$VertexDataType     // Catch:{ NoSuchFieldError -> 0x0014 }
                com.badlogic.gdx.graphics.Mesh$VertexDataType r1 = com.badlogic.gdx.graphics.Mesh.VertexDataType.VertexBufferObject     // Catch:{ NoSuchFieldError -> 0x0014 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0014 }
                r2 = 1
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0014 }
            L_0x0014:
                int[] r0 = com.badlogic.gdx.graphics.Mesh.AnonymousClass1.$SwitchMap$com$badlogic$gdx$graphics$Mesh$VertexDataType     // Catch:{ NoSuchFieldError -> 0x001f }
                com.badlogic.gdx.graphics.Mesh$VertexDataType r1 = com.badlogic.gdx.graphics.Mesh.VertexDataType.VertexBufferObjectSubData     // Catch:{ NoSuchFieldError -> 0x001f }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x001f }
                r2 = 2
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x001f }
            L_0x001f:
                int[] r0 = com.badlogic.gdx.graphics.Mesh.AnonymousClass1.$SwitchMap$com$badlogic$gdx$graphics$Mesh$VertexDataType     // Catch:{ NoSuchFieldError -> 0x002a }
                com.badlogic.gdx.graphics.Mesh$VertexDataType r1 = com.badlogic.gdx.graphics.Mesh.VertexDataType.VertexBufferObjectWithVAO     // Catch:{ NoSuchFieldError -> 0x002a }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x002a }
                r2 = 3
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x002a }
            L_0x002a:
                int[] r0 = com.badlogic.gdx.graphics.Mesh.AnonymousClass1.$SwitchMap$com$badlogic$gdx$graphics$Mesh$VertexDataType     // Catch:{ NoSuchFieldError -> 0x0035 }
                com.badlogic.gdx.graphics.Mesh$VertexDataType r1 = com.badlogic.gdx.graphics.Mesh.VertexDataType.VertexArray     // Catch:{ NoSuchFieldError -> 0x0035 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0035 }
                r2 = 4
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0035 }
            L_0x0035:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.Mesh.AnonymousClass1.<clinit>():void");
        }
    }

    public Mesh(VertexDataType vertexDataType, boolean z, int i, int i2, VertexAttributes vertexAttributes) {
        this.autoBind = true;
        this.isInstanced = false;
        this.tmpV = new Vector3();
        int i3 = AnonymousClass1.$SwitchMap$com$badlogic$gdx$graphics$Mesh$VertexDataType[vertexDataType.ordinal()];
        if (i3 == 1) {
            this.vertices = new VertexBufferObject(z, i, vertexAttributes);
            this.indices = new IndexBufferObject(z, i2);
            this.isVertexArray = false;
        } else if (i3 == 2) {
            this.vertices = new VertexBufferObjectSubData(z, i, vertexAttributes);
            this.indices = new IndexBufferObjectSubData(z, i2);
            this.isVertexArray = false;
        } else if (i3 != 3) {
            this.vertices = new VertexArray(i, vertexAttributes);
            this.indices = new IndexArray(i2);
            this.isVertexArray = true;
        } else {
            this.vertices = new VertexBufferObjectWithVAO(z, i, vertexAttributes);
            this.indices = new IndexBufferObjectSubData(z, i2);
            this.isVertexArray = false;
        }
        addManagedMesh(Gdx.app, this);
    }

    public Mesh enableInstancedRendering(boolean z, int i, VertexAttribute... vertexAttributeArr) {
        if (!this.isInstanced) {
            this.isInstanced = true;
            this.instances = new InstanceBufferObject(z, i, vertexAttributeArr);
            return this;
        }
        throw new GdxRuntimeException("Trying to enable InstancedRendering on same Mesh instance twice. Use disableInstancedRendering to clean up old InstanceData first");
    }

    public Mesh disableInstancedRendering() {
        if (this.isInstanced) {
            this.isInstanced = false;
            this.instances.dispose();
            this.instances = null;
        }
        return this;
    }

    public Mesh setInstanceData(float[] fArr, int i, int i2) {
        InstanceData instanceData = this.instances;
        if (instanceData != null) {
            instanceData.setInstanceData(fArr, i, i2);
            return this;
        }
        throw new GdxRuntimeException("An InstanceBufferObject must be set before setting instance data!");
    }

    public Mesh setInstanceData(float[] fArr) {
        InstanceData instanceData = this.instances;
        if (instanceData != null) {
            instanceData.setInstanceData(fArr, 0, fArr.length);
            return this;
        }
        throw new GdxRuntimeException("An InstanceBufferObject must be set before setting instance data!");
    }

    public Mesh setInstanceData(FloatBuffer floatBuffer, int i) {
        InstanceData instanceData = this.instances;
        if (instanceData != null) {
            instanceData.setInstanceData(floatBuffer, i);
            return this;
        }
        throw new GdxRuntimeException("An InstanceBufferObject must be set before setting instance data!");
    }

    public Mesh setInstanceData(FloatBuffer floatBuffer) {
        InstanceData instanceData = this.instances;
        if (instanceData != null) {
            instanceData.setInstanceData(floatBuffer, floatBuffer.limit());
            return this;
        }
        throw new GdxRuntimeException("An InstanceBufferObject must be set before setting instance data!");
    }

    public Mesh updateInstanceData(int i, float[] fArr) {
        return updateInstanceData(i, fArr, 0, fArr.length);
    }

    public Mesh updateInstanceData(int i, float[] fArr, int i2, int i3) {
        this.instances.updateInstanceData(i, fArr, i2, i3);
        return this;
    }

    public Mesh updateInstanceData(int i, FloatBuffer floatBuffer) {
        return updateInstanceData(i, floatBuffer, 0, floatBuffer.limit());
    }

    public Mesh updateInstanceData(int i, FloatBuffer floatBuffer, int i2, int i3) {
        this.instances.updateInstanceData(i, floatBuffer, i2, i3);
        return this;
    }

    public Mesh setVertices(float[] fArr) {
        this.vertices.setVertices(fArr, 0, fArr.length);
        return this;
    }

    public Mesh setVertices(float[] fArr, int i, int i2) {
        this.vertices.setVertices(fArr, i, i2);
        return this;
    }

    public Mesh updateVertices(int i, float[] fArr) {
        return updateVertices(i, fArr, 0, fArr.length);
    }

    public Mesh updateVertices(int i, float[] fArr, int i2, int i3) {
        this.vertices.updateVertices(i, fArr, i2, i3);
        return this;
    }

    public float[] getVertices(float[] fArr) {
        return getVertices(0, -1, fArr);
    }

    public float[] getVertices(int i, float[] fArr) {
        return getVertices(i, -1, fArr);
    }

    public float[] getVertices(int i, int i2, float[] fArr) {
        return getVertices(i, i2, fArr, 0);
    }

    public float[] getVertices(int i, int i2, float[] fArr, int i3) {
        int numVertices = (getNumVertices() * getVertexSize()) / 4;
        if (i2 == -1 && (i2 = numVertices - i) > fArr.length - i3) {
            i2 = fArr.length - i3;
        }
        if (i < 0 || i2 <= 0 || i + i2 > numVertices || i3 < 0 || i3 >= fArr.length) {
            throw new IndexOutOfBoundsException();
        } else if (fArr.length - i3 >= i2) {
            int position = getVerticesBuffer().position();
            getVerticesBuffer().position(i);
            getVerticesBuffer().get(fArr, i3, i2);
            getVerticesBuffer().position(position);
            return fArr;
        } else {
            throw new IllegalArgumentException("not enough room in vertices array, has " + fArr.length + " floats, needs " + i2);
        }
    }

    public Mesh setIndices(short[] sArr) {
        this.indices.setIndices(sArr, 0, sArr.length);
        return this;
    }

    public Mesh setIndices(short[] sArr, int i, int i2) {
        this.indices.setIndices(sArr, i, i2);
        return this;
    }

    public void getIndices(short[] sArr) {
        getIndices(sArr, 0);
    }

    public void getIndices(short[] sArr, int i) {
        getIndices(0, sArr, i);
    }

    public void getIndices(int i, short[] sArr, int i2) {
        getIndices(i, -1, sArr, i2);
    }

    public void getIndices(int i, int i2, short[] sArr, int i3) {
        int numIndices = getNumIndices();
        if (i2 < 0) {
            i2 = numIndices - i;
        }
        if (i < 0 || i >= numIndices || i + i2 > numIndices) {
            throw new IllegalArgumentException("Invalid range specified, offset: " + i + ", count: " + i2 + ", max: " + numIndices);
        } else if (sArr.length - i3 >= i2) {
            int position = getIndicesBuffer().position();
            getIndicesBuffer().position(i);
            getIndicesBuffer().get(sArr, i3, i2);
            getIndicesBuffer().position(position);
        } else {
            throw new IllegalArgumentException("not enough room in indices array, has " + sArr.length + " shorts, needs " + i2);
        }
    }

    public int getNumIndices() {
        return this.indices.getNumIndices();
    }

    public int getNumVertices() {
        return this.vertices.getNumVertices();
    }

    public int getMaxVertices() {
        return this.vertices.getNumMaxVertices();
    }

    public int getMaxIndices() {
        return this.indices.getNumMaxIndices();
    }

    public int getVertexSize() {
        return this.vertices.getAttributes().vertexSize;
    }

    public void setAutoBind(boolean z) {
        this.autoBind = z;
    }

    public void bind(ShaderProgram shaderProgram) {
        bind(shaderProgram, null);
    }

    public void bind(ShaderProgram shaderProgram, int[] iArr) {
        this.vertices.bind(shaderProgram, iArr);
        InstanceData instanceData = this.instances;
        if (instanceData != null && instanceData.getNumInstances() > 0) {
            this.instances.bind(shaderProgram, iArr);
        }
        if (this.indices.getNumIndices() > 0) {
            this.indices.bind();
        }
    }

    public void unbind(ShaderProgram shaderProgram) {
        unbind(shaderProgram, null);
    }

    public void unbind(ShaderProgram shaderProgram, int[] iArr) {
        this.vertices.unbind(shaderProgram, iArr);
        InstanceData instanceData = this.instances;
        if (instanceData != null && instanceData.getNumInstances() > 0) {
            this.instances.unbind(shaderProgram, iArr);
        }
        if (this.indices.getNumIndices() > 0) {
            this.indices.unbind();
        }
    }

    public void render(ShaderProgram shaderProgram, int i) {
        render(shaderProgram, i, 0, this.indices.getNumMaxIndices() > 0 ? getNumIndices() : getNumVertices(), this.autoBind);
    }

    public void render(ShaderProgram shaderProgram, int i, int i2, int i3) {
        render(shaderProgram, i, i2, i3, this.autoBind);
    }

    public void render(ShaderProgram shaderProgram, int i, int i2, int i3, boolean z) {
        if (i3 != 0) {
            if (z) {
                bind(shaderProgram);
            }
            if (!this.isVertexArray) {
                int numInstances = this.isInstanced ? this.instances.getNumInstances() : 0;
                if (this.indices.getNumIndices() > 0) {
                    if (i3 + i2 > this.indices.getNumMaxIndices()) {
                        throw new GdxRuntimeException("Mesh attempting to access memory outside of the index buffer (count: " + i3 + ", offset: " + i2 + ", max: " + this.indices.getNumMaxIndices() + ")");
                    } else if (!this.isInstanced || numInstances <= 0) {
                        Gdx.gl20.glDrawElements(i, i3, GL20.GL_UNSIGNED_SHORT, i2 * 2);
                    } else {
                        Gdx.gl30.glDrawElementsInstanced(i, i3, GL20.GL_UNSIGNED_SHORT, i2 * 2, numInstances);
                    }
                } else if (!this.isInstanced || numInstances <= 0) {
                    Gdx.gl20.glDrawArrays(i, i2, i3);
                } else {
                    Gdx.gl30.glDrawArraysInstanced(i, i2, i3, numInstances);
                }
            } else if (this.indices.getNumIndices() > 0) {
                ShortBuffer buffer = this.indices.getBuffer();
                int position = buffer.position();
                int limit = buffer.limit();
                buffer.position(i2);
                buffer.limit(i2 + i3);
                Gdx.gl20.glDrawElements(i, i3, GL20.GL_UNSIGNED_SHORT, buffer);
                buffer.position(position);
                buffer.limit(limit);
            } else {
                Gdx.gl20.glDrawArrays(i, i2, i3);
            }
            if (z) {
                unbind(shaderProgram);
            }
        }
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        if (meshes.get(Gdx.app) != null) {
            meshes.get(Gdx.app).removeValue(this, true);
        }
        this.vertices.dispose();
        InstanceData instanceData = this.instances;
        if (instanceData != null) {
            instanceData.dispose();
        }
        this.indices.dispose();
    }

    public VertexAttribute getVertexAttribute(int i) {
        VertexAttributes attributes = this.vertices.getAttributes();
        int size = attributes.size();
        for (int i2 = 0; i2 < size; i2++) {
            if (attributes.get(i2).usage == i) {
                return attributes.get(i2);
            }
        }
        return null;
    }

    public VertexAttributes getVertexAttributes() {
        return this.vertices.getAttributes();
    }

    public FloatBuffer getVerticesBuffer() {
        return this.vertices.getBuffer();
    }

    public BoundingBox calculateBoundingBox() {
        BoundingBox boundingBox = new BoundingBox();
        calculateBoundingBox(boundingBox);
        return boundingBox;
    }

    public void calculateBoundingBox(BoundingBox boundingBox) {
        int numVertices = getNumVertices();
        if (numVertices != 0) {
            FloatBuffer buffer = this.vertices.getBuffer();
            boundingBox.inf();
            VertexAttribute vertexAttribute = getVertexAttribute(1);
            int i = vertexAttribute.offset / 4;
            int i2 = this.vertices.getAttributes().vertexSize / 4;
            int i3 = vertexAttribute.numComponents;
            int i4 = 0;
            if (i3 == 1) {
                while (i4 < numVertices) {
                    boundingBox.ext(buffer.get(i), 0.0f, 0.0f);
                    i += i2;
                    i4++;
                }
            } else if (i3 == 2) {
                while (i4 < numVertices) {
                    boundingBox.ext(buffer.get(i), buffer.get(i + 1), 0.0f);
                    i += i2;
                    i4++;
                }
            } else if (i3 == 3) {
                while (i4 < numVertices) {
                    boundingBox.ext(buffer.get(i), buffer.get(i + 1), buffer.get(i + 2));
                    i += i2;
                    i4++;
                }
            }
        } else {
            throw new GdxRuntimeException("No vertices defined");
        }
    }

    public BoundingBox calculateBoundingBox(BoundingBox boundingBox, int i, int i2) {
        return extendBoundingBox(boundingBox.inf(), i, i2);
    }

    public BoundingBox calculateBoundingBox(BoundingBox boundingBox, int i, int i2, Matrix4 matrix4) {
        return extendBoundingBox(boundingBox.inf(), i, i2, matrix4);
    }

    public BoundingBox extendBoundingBox(BoundingBox boundingBox, int i, int i2) {
        return extendBoundingBox(boundingBox, i, i2, null);
    }

    public BoundingBox extendBoundingBox(BoundingBox boundingBox, int i, int i2, Matrix4 matrix4) {
        int i3;
        int numIndices = getNumIndices();
        int numVertices = getNumVertices();
        if (numIndices != 0) {
            numVertices = numIndices;
        }
        if (i < 0 || i2 < 1 || (i3 = i + i2) > numVertices) {
            throw new GdxRuntimeException("Invalid part specified ( offset=" + i + ", count=" + i2 + ", max=" + numVertices + " )");
        }
        FloatBuffer buffer = this.vertices.getBuffer();
        ShortBuffer buffer2 = this.indices.getBuffer();
        VertexAttribute vertexAttribute = getVertexAttribute(1);
        int i4 = vertexAttribute.offset / 4;
        int i5 = this.vertices.getAttributes().vertexSize / 4;
        int i6 = vertexAttribute.numComponents;
        if (i6 != 1) {
            if (i6 != 2) {
                if (i6 == 3) {
                    if (numIndices > 0) {
                        while (i < i3) {
                            int i7 = (buffer2.get(i) * i5) + i4;
                            this.tmpV.set(buffer.get(i7), buffer.get(i7 + 1), buffer.get(i7 + 2));
                            if (matrix4 != null) {
                                this.tmpV.mul(matrix4);
                            }
                            boundingBox.ext(this.tmpV);
                            i++;
                        }
                    } else {
                        while (i < i3) {
                            int i8 = (i * i5) + i4;
                            this.tmpV.set(buffer.get(i8), buffer.get(i8 + 1), buffer.get(i8 + 2));
                            if (matrix4 != null) {
                                this.tmpV.mul(matrix4);
                            }
                            boundingBox.ext(this.tmpV);
                            i++;
                        }
                    }
                }
            } else if (numIndices > 0) {
                while (i < i3) {
                    int i9 = (buffer2.get(i) * i5) + i4;
                    this.tmpV.set(buffer.get(i9), buffer.get(i9 + 1), 0.0f);
                    if (matrix4 != null) {
                        this.tmpV.mul(matrix4);
                    }
                    boundingBox.ext(this.tmpV);
                    i++;
                }
            } else {
                while (i < i3) {
                    int i10 = (i * i5) + i4;
                    this.tmpV.set(buffer.get(i10), buffer.get(i10 + 1), 0.0f);
                    if (matrix4 != null) {
                        this.tmpV.mul(matrix4);
                    }
                    boundingBox.ext(this.tmpV);
                    i++;
                }
            }
        } else if (numIndices > 0) {
            while (i < i3) {
                this.tmpV.set(buffer.get((buffer2.get(i) * i5) + i4), 0.0f, 0.0f);
                if (matrix4 != null) {
                    this.tmpV.mul(matrix4);
                }
                boundingBox.ext(this.tmpV);
                i++;
            }
        } else {
            while (i < i3) {
                this.tmpV.set(buffer.get((i * i5) + i4), 0.0f, 0.0f);
                if (matrix4 != null) {
                    this.tmpV.mul(matrix4);
                }
                boundingBox.ext(this.tmpV);
                i++;
            }
        }
        return boundingBox;
    }

    public float calculateRadiusSquared(float f, float f2, float f3, int i, int i2, Matrix4 matrix4) {
        int i3;
        int numIndices = getNumIndices();
        if (i < 0 || i2 < 1 || (i3 = i + i2) > numIndices) {
            throw new GdxRuntimeException("Not enough indices");
        }
        FloatBuffer buffer = this.vertices.getBuffer();
        ShortBuffer buffer2 = this.indices.getBuffer();
        VertexAttribute vertexAttribute = getVertexAttribute(1);
        int i4 = vertexAttribute.offset / 4;
        int i5 = this.vertices.getAttributes().vertexSize / 4;
        int i6 = vertexAttribute.numComponents;
        float f4 = 0.0f;
        if (i6 == 1) {
            float f5 = 0.0f;
            for (int i7 = i; i7 < i3; i7++) {
                this.tmpV.set(buffer.get((buffer2.get(i7) * i5) + i4), 0.0f, 0.0f);
                if (matrix4 != null) {
                    this.tmpV.mul(matrix4);
                }
                float len2 = this.tmpV.sub(f, f2, f3).len2();
                if (len2 > f5) {
                    f5 = len2;
                }
            }
            return f5;
        } else if (i6 == 2) {
            float f6 = 0.0f;
            for (int i8 = i; i8 < i3; i8++) {
                int i9 = (buffer2.get(i8) * i5) + i4;
                this.tmpV.set(buffer.get(i9), buffer.get(i9 + 1), 0.0f);
                if (matrix4 != null) {
                    this.tmpV.mul(matrix4);
                }
                float len22 = this.tmpV.sub(f, f2, f3).len2();
                if (len22 > f6) {
                    f6 = len22;
                }
            }
            return f6;
        } else if (i6 != 3) {
            return 0.0f;
        } else {
            int i10 = i;
            while (i10 < i3) {
                int i11 = (buffer2.get(i10) * i5) + i4;
                this.tmpV.set(buffer.get(i11), buffer.get(i11 + 1), buffer.get(i11 + 2));
                if (matrix4 != null) {
                    this.tmpV.mul(matrix4);
                }
                float len23 = this.tmpV.sub(f, f2, f3).len2();
                if (len23 > f4) {
                    f4 = len23;
                }
                i10++;
                i4 = i4;
            }
            return f4;
        }
    }

    public float calculateRadius(float f, float f2, float f3, int i, int i2, Matrix4 matrix4) {
        return (float) Math.sqrt((double) calculateRadiusSquared(f, f2, f3, i, i2, matrix4));
    }

    public float calculateRadius(Vector3 vector3, int i, int i2, Matrix4 matrix4) {
        return calculateRadius(vector3.x, vector3.y, vector3.z, i, i2, matrix4);
    }

    public float calculateRadius(float f, float f2, float f3, int i, int i2) {
        return calculateRadius(f, f2, f3, i, i2, null);
    }

    public float calculateRadius(Vector3 vector3, int i, int i2) {
        return calculateRadius(vector3.x, vector3.y, vector3.z, i, i2, null);
    }

    public float calculateRadius(float f, float f2, float f3) {
        return calculateRadius(f, f2, f3, 0, getNumIndices(), null);
    }

    public float calculateRadius(Vector3 vector3) {
        return calculateRadius(vector3.x, vector3.y, vector3.z, 0, getNumIndices(), null);
    }

    public ShortBuffer getIndicesBuffer() {
        return this.indices.getBuffer();
    }

    private static void addManagedMesh(Application application, Mesh mesh) {
        Array<Mesh> array = meshes.get(application);
        if (array == null) {
            array = new Array<>();
        }
        array.add(mesh);
        meshes.put(application, array);
    }

    public static void invalidateAllMeshes(Application application) {
        Array<Mesh> array = meshes.get(application);
        if (array != null) {
            for (int i = 0; i < array.size; i++) {
                array.get(i).vertices.invalidate();
                array.get(i).indices.invalidate();
            }
        }
    }

    public static void clearAllMeshes(Application application) {
        meshes.remove(application);
    }

    public static String getManagedStatus() {
        StringBuilder sb = new StringBuilder();
        sb.append("Managed meshes/app: { ");
        for (Application application : meshes.keySet()) {
            sb.append(meshes.get(application).size);
            sb.append(" ");
        }
        sb.append("}");
        return sb.toString();
    }

    public void scale(float f, float f2, float f3) {
        VertexAttribute vertexAttribute = getVertexAttribute(1);
        int i = vertexAttribute.offset / 4;
        int i2 = vertexAttribute.numComponents;
        int numVertices = getNumVertices();
        int vertexSize = getVertexSize() / 4;
        float[] fArr = new float[(numVertices * vertexSize)];
        getVertices(fArr);
        int i3 = 0;
        if (i2 == 1) {
            while (i3 < numVertices) {
                fArr[i] = fArr[i] * f;
                i += vertexSize;
                i3++;
            }
        } else if (i2 == 2) {
            while (i3 < numVertices) {
                fArr[i] = fArr[i] * f;
                int i4 = i + 1;
                fArr[i4] = fArr[i4] * f2;
                i += vertexSize;
                i3++;
            }
        } else if (i2 == 3) {
            while (i3 < numVertices) {
                fArr[i] = fArr[i] * f;
                int i5 = i + 1;
                fArr[i5] = fArr[i5] * f2;
                int i6 = i + 2;
                fArr[i6] = fArr[i6] * f3;
                i += vertexSize;
                i3++;
            }
        }
        setVertices(fArr);
    }

    public void transform(Matrix4 matrix4) {
        transform(matrix4, 0, getNumVertices());
    }

    public void transform(Matrix4 matrix4, int i, int i2) {
        VertexAttribute vertexAttribute = getVertexAttribute(1);
        int i3 = vertexAttribute.offset / 4;
        int vertexSize = getVertexSize() / 4;
        int i4 = vertexAttribute.numComponents;
        getNumVertices();
        int i5 = i2 * vertexSize;
        float[] fArr = new float[i5];
        int i6 = i * vertexSize;
        getVertices(i6, i5, fArr);
        transform(matrix4, fArr, vertexSize, i3, i4, 0, i2);
        updateVertices(i6, fArr);
    }

    public static void transform(Matrix4 matrix4, float[] fArr, int i, int i2, int i3, int i4, int i5) {
        if (i2 < 0 || i3 < 1 || i2 + i3 > i) {
            throw new IndexOutOfBoundsException();
        } else if (i4 < 0 || i5 < 1 || (i4 + i5) * i > fArr.length) {
            throw new IndexOutOfBoundsException("start = " + i4 + ", count = " + i5 + ", vertexSize = " + i + ", length = " + fArr.length);
        } else {
            Vector3 vector3 = new Vector3();
            int i6 = i2 + (i4 * i);
            int i7 = 0;
            if (i3 == 1) {
                while (i7 < i5) {
                    vector3.set(fArr[i6], 0.0f, 0.0f).mul(matrix4);
                    fArr[i6] = vector3.x;
                    i6 += i;
                    i7++;
                }
            } else if (i3 == 2) {
                while (i7 < i5) {
                    int i8 = i6 + 1;
                    vector3.set(fArr[i6], fArr[i8], 0.0f).mul(matrix4);
                    fArr[i6] = vector3.x;
                    fArr[i8] = vector3.y;
                    i6 += i;
                    i7++;
                }
            } else if (i3 == 3) {
                while (i7 < i5) {
                    int i9 = i6 + 1;
                    int i10 = i6 + 2;
                    vector3.set(fArr[i6], fArr[i9], fArr[i10]).mul(matrix4);
                    fArr[i6] = vector3.x;
                    fArr[i9] = vector3.y;
                    fArr[i10] = vector3.z;
                    i6 += i;
                    i7++;
                }
            }
        }
    }

    public void transformUV(Matrix3 matrix3) {
        transformUV(matrix3, 0, getNumVertices());
    }

    /* access modifiers changed from: protected */
    public void transformUV(Matrix3 matrix3, int i, int i2) {
        int i3 = getVertexAttribute(16).offset / 4;
        int vertexSize = getVertexSize() / 4;
        float[] fArr = new float[(getNumVertices() * vertexSize)];
        getVertices(0, fArr.length, fArr);
        transformUV(matrix3, fArr, vertexSize, i3, i, i2);
        setVertices(fArr, 0, fArr.length);
    }

    public static void transformUV(Matrix3 matrix3, float[] fArr, int i, int i2, int i3, int i4) {
        if (i3 < 0 || i4 < 1 || (i3 + i4) * i > fArr.length) {
            throw new IndexOutOfBoundsException("start = " + i3 + ", count = " + i4 + ", vertexSize = " + i + ", length = " + fArr.length);
        }
        Vector2 vector2 = new Vector2();
        int i5 = i2 + (i3 * i);
        for (int i6 = 0; i6 < i4; i6++) {
            int i7 = i5 + 1;
            vector2.set(fArr[i5], fArr[i7]).mul(matrix3);
            fArr[i5] = vector2.x;
            fArr[i7] = vector2.y;
            i5 += i;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x0075  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0087  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x00f0  */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x00ff  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x0111  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.badlogic.gdx.graphics.Mesh copy(boolean r20, boolean r21, int[] r22) {
        /*
        // Method dump skipped, instructions count: 277
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.graphics.Mesh.copy(boolean, boolean, int[]):com.badlogic.gdx.graphics.Mesh");
    }

    public Mesh copy(boolean z) {
        return copy(z, false, null);
    }
}
