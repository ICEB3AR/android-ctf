package com.badlogic.gdx.graphics.g3d.utils.shapebuilders;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.g3d.Renderable;
import com.badlogic.gdx.graphics.g3d.RenderableProvider;
import com.badlogic.gdx.graphics.g3d.utils.MeshPartBuilder;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.FlushablePool;
import java.util.Iterator;

public class RenderableShapeBuilder extends BaseShapeBuilder {
    private static final int FLOAT_BYTES = 4;
    private static short[] indices;
    private static final Array<Renderable> renderables = new Array<>();
    private static final RenderablePool renderablesPool = new RenderablePool();
    private static float[] vertices;

    /* access modifiers changed from: private */
    public static class RenderablePool extends FlushablePool<Renderable> {
        /* access modifiers changed from: protected */
        @Override // com.badlogic.gdx.utils.Pool
        public Renderable newObject() {
            return new Renderable();
        }

        @Override // com.badlogic.gdx.utils.FlushablePool, com.badlogic.gdx.utils.Pool
        public Renderable obtain() {
            Renderable renderable = (Renderable) super.obtain();
            renderable.environment = null;
            renderable.material = null;
            renderable.meshPart.set(BuildConfig.FLAVOR, null, 0, 0, 0);
            renderable.shader = null;
            renderable.userData = null;
            return renderable;
        }
    }

    public static void buildNormals(MeshPartBuilder meshPartBuilder, RenderableProvider renderableProvider, float f) {
        buildNormals(meshPartBuilder, renderableProvider, f, tmpColor0.set(0.0f, 0.0f, 1.0f, 1.0f), tmpColor1.set(1.0f, 0.0f, 0.0f, 1.0f), tmpColor2.set(0.0f, 1.0f, 0.0f, 1.0f));
    }

    public static void buildNormals(MeshPartBuilder meshPartBuilder, RenderableProvider renderableProvider, float f, Color color, Color color2, Color color3) {
        renderableProvider.getRenderables(renderables, renderablesPool);
        Iterator<Renderable> it = renderables.iterator();
        while (it.hasNext()) {
            buildNormals(meshPartBuilder, it.next(), f, color, color2, color3);
        }
        renderablesPool.flush();
        renderables.clear();
    }

    public static void buildNormals(MeshPartBuilder meshPartBuilder, Renderable renderable, float f, Color color, Color color2, Color color3) {
        int i;
        int i2;
        Mesh mesh = renderable.meshPart.mesh;
        int i3 = mesh.getVertexAttribute(1) != null ? mesh.getVertexAttribute(1).offset / 4 : -1;
        int i4 = mesh.getVertexAttribute(8) != null ? mesh.getVertexAttribute(8).offset / 4 : -1;
        int i5 = mesh.getVertexAttribute(128) != null ? mesh.getVertexAttribute(128).offset / 4 : -1;
        int i6 = mesh.getVertexAttribute(256) != null ? mesh.getVertexAttribute(256).offset / 4 : -1;
        int vertexSize = mesh.getVertexSize() / 4;
        if (mesh.getNumIndices() > 0) {
            ensureIndicesCapacity(mesh.getNumIndices());
            mesh.getIndices(renderable.meshPart.offset, renderable.meshPart.size, indices, 0);
            i2 = minVerticeInIndices();
            i = maxVerticeInIndices() - i2;
        } else {
            i2 = renderable.meshPart.offset;
            i = renderable.meshPart.size;
        }
        int i7 = i * vertexSize;
        ensureVerticesCapacity(i7);
        mesh.getVertices(i2 * vertexSize, i7, vertices, 0);
        while (i2 < i) {
            int i8 = i2 * vertexSize;
            Vector3 vector3 = tmpV0;
            float[] fArr = vertices;
            int i9 = i8 + i3;
            vector3.set(fArr[i9], fArr[i9 + 1], fArr[i9 + 2]);
            int i10 = -1;
            if (i4 != -1) {
                Vector3 vector32 = tmpV1;
                float[] fArr2 = vertices;
                int i11 = i8 + i4;
                vector32.set(fArr2[i11], fArr2[i11 + 1], fArr2[i11 + 2]);
                tmpV2.set(tmpV0).add(tmpV1.scl(f));
                i10 = -1;
            }
            if (i5 != i10) {
                Vector3 vector33 = tmpV3;
                float[] fArr3 = vertices;
                int i12 = i8 + i5;
                vector33.set(fArr3[i12], fArr3[i12 + 1], fArr3[i12 + 2]);
                tmpV4.set(tmpV0).add(tmpV3.scl(f));
                i10 = -1;
            }
            if (i6 != i10) {
                Vector3 vector34 = tmpV5;
                float[] fArr4 = vertices;
                int i13 = i8 + i6;
                vector34.set(fArr4[i13], fArr4[i13 + 1], fArr4[i13 + 2]);
                tmpV6.set(tmpV0).add(tmpV5.scl(f));
            }
            tmpV0.mul(renderable.worldTransform);
            tmpV2.mul(renderable.worldTransform);
            tmpV4.mul(renderable.worldTransform);
            tmpV6.mul(renderable.worldTransform);
            if (i4 != -1) {
                meshPartBuilder.setColor(color);
                meshPartBuilder.line(tmpV0, tmpV2);
            }
            if (i5 != -1) {
                meshPartBuilder.setColor(color2);
                meshPartBuilder.line(tmpV0, tmpV4);
            }
            if (i6 != -1) {
                meshPartBuilder.setColor(color3);
                meshPartBuilder.line(tmpV0, tmpV6);
            }
            i2++;
        }
    }

    private static void ensureVerticesCapacity(int i) {
        float[] fArr = vertices;
        if (fArr == null || fArr.length < i) {
            vertices = new float[i];
        }
    }

    private static void ensureIndicesCapacity(int i) {
        short[] sArr = indices;
        if (sArr == null || sArr.length < i) {
            indices = new short[i];
        }
    }

    private static short minVerticeInIndices() {
        short s = Short.MAX_VALUE;
        int i = 0;
        while (true) {
            short[] sArr = indices;
            if (i >= sArr.length) {
                return s;
            }
            if (sArr[i] < s) {
                s = sArr[i];
            }
            i++;
        }
    }

    private static short maxVerticeInIndices() {
        short s = Short.MIN_VALUE;
        int i = 0;
        while (true) {
            short[] sArr = indices;
            if (i >= sArr.length) {
                return s;
            }
            if (sArr[i] > s) {
                s = sArr[i];
            }
            i++;
        }
    }
}
