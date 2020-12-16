package com.badlogic.gdx.graphics.g3d;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.Camera;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.model.MeshPart;
import com.badlogic.gdx.graphics.g3d.utils.MeshBuilder;
import com.badlogic.gdx.graphics.g3d.utils.RenderableSorter;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.FlushablePool;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.Pool;
import java.util.Comparator;
import java.util.Iterator;

public class ModelCache implements Disposable, RenderableProvider {
    private boolean building;
    private Camera camera;
    private Array<Renderable> items;
    private MeshBuilder meshBuilder;
    private FlushablePool<MeshPart> meshPartPool;
    private MeshPool meshPool;
    private Array<Renderable> renderables;
    private FlushablePool<Renderable> renderablesPool;
    private RenderableSorter sorter;
    private Array<Renderable> tmp;

    public interface MeshPool extends Disposable {
        void flush();

        Mesh obtain(VertexAttributes vertexAttributes, int i, int i2);
    }

    public static class SimpleMeshPool implements MeshPool {
        private Array<Mesh> freeMeshes = new Array<>();
        private Array<Mesh> usedMeshes = new Array<>();

        @Override // com.badlogic.gdx.graphics.g3d.ModelCache.MeshPool
        public void flush() {
            this.freeMeshes.addAll(this.usedMeshes);
            this.usedMeshes.clear();
        }

        @Override // com.badlogic.gdx.graphics.g3d.ModelCache.MeshPool
        public Mesh obtain(VertexAttributes vertexAttributes, int i, int i2) {
            int i3 = this.freeMeshes.size;
            for (int i4 = 0; i4 < i3; i4++) {
                Mesh mesh = this.freeMeshes.get(i4);
                if (mesh.getVertexAttributes().equals(vertexAttributes) && mesh.getMaxVertices() >= i && mesh.getMaxIndices() >= i2) {
                    this.freeMeshes.removeIndex(i4);
                    this.usedMeshes.add(mesh);
                    return mesh;
                }
            }
            Mesh mesh2 = new Mesh(false, (int) GL20.GL_COVERAGE_BUFFER_BIT_NV, Math.max((int) GL20.GL_COVERAGE_BUFFER_BIT_NV, 1 << (32 - Integer.numberOfLeadingZeros(i2 - 1))), vertexAttributes);
            this.usedMeshes.add(mesh2);
            return mesh2;
        }

        @Override // com.badlogic.gdx.utils.Disposable
        public void dispose() {
            Iterator<Mesh> it = this.usedMeshes.iterator();
            while (it.hasNext()) {
                it.next().dispose();
            }
            this.usedMeshes.clear();
            Iterator<Mesh> it2 = this.freeMeshes.iterator();
            while (it2.hasNext()) {
                it2.next().dispose();
            }
            this.freeMeshes.clear();
        }
    }

    public static class TightMeshPool implements MeshPool {
        private Array<Mesh> freeMeshes = new Array<>();
        private Array<Mesh> usedMeshes = new Array<>();

        @Override // com.badlogic.gdx.graphics.g3d.ModelCache.MeshPool
        public void flush() {
            this.freeMeshes.addAll(this.usedMeshes);
            this.usedMeshes.clear();
        }

        @Override // com.badlogic.gdx.graphics.g3d.ModelCache.MeshPool
        public Mesh obtain(VertexAttributes vertexAttributes, int i, int i2) {
            int i3 = this.freeMeshes.size;
            for (int i4 = 0; i4 < i3; i4++) {
                Mesh mesh = this.freeMeshes.get(i4);
                if (mesh.getVertexAttributes().equals(vertexAttributes) && mesh.getMaxVertices() == i && mesh.getMaxIndices() == i2) {
                    this.freeMeshes.removeIndex(i4);
                    this.usedMeshes.add(mesh);
                    return mesh;
                }
            }
            Mesh mesh2 = new Mesh(true, i, i2, vertexAttributes);
            this.usedMeshes.add(mesh2);
            return mesh2;
        }

        @Override // com.badlogic.gdx.utils.Disposable
        public void dispose() {
            Iterator<Mesh> it = this.usedMeshes.iterator();
            while (it.hasNext()) {
                it.next().dispose();
            }
            this.usedMeshes.clear();
            Iterator<Mesh> it2 = this.freeMeshes.iterator();
            while (it2.hasNext()) {
                it2.next().dispose();
            }
            this.freeMeshes.clear();
        }
    }

    public static class Sorter implements RenderableSorter, Comparator<Renderable> {
        @Override // com.badlogic.gdx.graphics.g3d.utils.RenderableSorter
        public void sort(Camera camera, Array<Renderable> array) {
            array.sort(this);
        }

        public int compare(Renderable renderable, Renderable renderable2) {
            int compareTo = renderable.meshPart.mesh.getVertexAttributes().compareTo(renderable2.meshPart.mesh.getVertexAttributes());
            return (compareTo == 0 && (compareTo = renderable.material.compareTo(renderable2.material)) == 0) ? renderable.meshPart.primitiveType - renderable2.meshPart.primitiveType : compareTo;
        }
    }

    public ModelCache() {
        this(new Sorter(), new SimpleMeshPool());
    }

    public ModelCache(RenderableSorter renderableSorter, MeshPool meshPool2) {
        this.renderables = new Array<>();
        this.renderablesPool = new FlushablePool<Renderable>() {
            /* class com.badlogic.gdx.graphics.g3d.ModelCache.AnonymousClass1 */

            /* access modifiers changed from: protected */
            @Override // com.badlogic.gdx.utils.Pool
            public Renderable newObject() {
                return new Renderable();
            }
        };
        this.meshPartPool = new FlushablePool<MeshPart>() {
            /* class com.badlogic.gdx.graphics.g3d.ModelCache.AnonymousClass2 */

            /* access modifiers changed from: protected */
            @Override // com.badlogic.gdx.utils.Pool
            public MeshPart newObject() {
                return new MeshPart();
            }
        };
        this.items = new Array<>();
        this.tmp = new Array<>();
        this.sorter = renderableSorter;
        this.meshPool = meshPool2;
        this.meshBuilder = new MeshBuilder();
    }

    public void begin() {
        begin(null);
    }

    public void begin(Camera camera2) {
        if (!this.building) {
            this.building = true;
            this.camera = camera2;
            this.renderablesPool.flush();
            this.renderables.clear();
            this.items.clear();
            this.meshPartPool.flush();
            this.meshPool.flush();
            return;
        }
        throw new GdxRuntimeException("Call end() after calling begin()");
    }

    private Renderable obtainRenderable(Material material, int i) {
        Renderable obtain = this.renderablesPool.obtain();
        obtain.bones = null;
        obtain.environment = null;
        obtain.material = material;
        obtain.meshPart.mesh = null;
        obtain.meshPart.offset = 0;
        obtain.meshPart.size = 0;
        obtain.meshPart.primitiveType = i;
        obtain.meshPart.center.set(0.0f, 0.0f, 0.0f);
        obtain.meshPart.halfExtents.set(0.0f, 0.0f, 0.0f);
        obtain.meshPart.radius = -1.0f;
        obtain.shader = null;
        obtain.userData = null;
        obtain.worldTransform.idt();
        return obtain;
    }

    public void end() {
        if (this.building) {
            this.building = false;
            if (this.items.size != 0) {
                this.sorter.sort(this.camera, this.items);
                int i = this.items.size;
                int i2 = this.renderables.size;
                Renderable renderable = this.items.get(0);
                VertexAttributes vertexAttributes = renderable.meshPart.mesh.getVertexAttributes();
                Material material = renderable.material;
                int i3 = renderable.meshPart.primitiveType;
                int i4 = this.renderables.size;
                this.meshBuilder.begin(vertexAttributes);
                MeshPart part = this.meshBuilder.part(BuildConfig.FLAVOR, i3, this.meshPartPool.obtain());
                this.renderables.add(obtainRenderable(material, i3));
                int i5 = this.items.size;
                Material material2 = material;
                int i6 = i3;
                for (int i7 = 0; i7 < i5; i7++) {
                    Renderable renderable2 = this.items.get(i7);
                    VertexAttributes vertexAttributes2 = renderable2.meshPart.mesh.getVertexAttributes();
                    Material material3 = renderable2.material;
                    int i8 = renderable2.meshPart.primitiveType;
                    boolean z = vertexAttributes2.equals(vertexAttributes) && renderable2.meshPart.size + this.meshBuilder.getNumVertices() < 32767;
                    if (!(z && i8 == i6 && material3.same(material2, true))) {
                        if (!z) {
                            MeshBuilder meshBuilder2 = this.meshBuilder;
                            Mesh end = meshBuilder2.end(this.meshPool.obtain(vertexAttributes, meshBuilder2.getNumVertices(), this.meshBuilder.getNumIndices()));
                            while (i4 < this.renderables.size) {
                                this.renderables.get(i4).meshPart.mesh = end;
                                i4++;
                            }
                            this.meshBuilder.begin(vertexAttributes2);
                            vertexAttributes = vertexAttributes2;
                        }
                        MeshPart part2 = this.meshBuilder.part(BuildConfig.FLAVOR, i8, this.meshPartPool.obtain());
                        Array<Renderable> array = this.renderables;
                        Renderable renderable3 = array.get(array.size - 1);
                        renderable3.meshPart.offset = part.offset;
                        renderable3.meshPart.size = part.size;
                        this.renderables.add(obtainRenderable(material3, i8));
                        part = part2;
                        material2 = material3;
                        i6 = i8;
                    }
                    this.meshBuilder.setVertexTransform(renderable2.worldTransform);
                    this.meshBuilder.addMesh(renderable2.meshPart.mesh, renderable2.meshPart.offset, renderable2.meshPart.size);
                }
                MeshBuilder meshBuilder3 = this.meshBuilder;
                Mesh end2 = meshBuilder3.end(this.meshPool.obtain(vertexAttributes, meshBuilder3.getNumVertices(), this.meshBuilder.getNumIndices()));
                while (i4 < this.renderables.size) {
                    this.renderables.get(i4).meshPart.mesh = end2;
                    i4++;
                }
                Array<Renderable> array2 = this.renderables;
                Renderable renderable4 = array2.get(array2.size - 1);
                renderable4.meshPart.offset = part.offset;
                renderable4.meshPart.size = part.size;
                return;
            }
            return;
        }
        throw new GdxRuntimeException("Call begin() prior to calling end()");
    }

    public void add(Renderable renderable) {
        if (!this.building) {
            throw new GdxRuntimeException("Can only add items to the ModelCache in between .begin() and .end()");
        } else if (renderable.bones == null) {
            this.items.add(renderable);
        } else {
            this.renderables.add(renderable);
        }
    }

    public void add(RenderableProvider renderableProvider) {
        renderableProvider.getRenderables(this.tmp, this.renderablesPool);
        int i = this.tmp.size;
        for (int i2 = 0; i2 < i; i2++) {
            add(this.tmp.get(i2));
        }
        this.tmp.clear();
    }

    public <T extends RenderableProvider> void add(Iterable<T> iterable) {
        for (T t : iterable) {
            add(t);
        }
    }

    @Override // com.badlogic.gdx.graphics.g3d.RenderableProvider
    public void getRenderables(Array<Renderable> array, Pool<Renderable> pool) {
        if (!this.building) {
            Iterator<Renderable> it = this.renderables.iterator();
            while (it.hasNext()) {
                Renderable next = it.next();
                next.shader = null;
                next.environment = null;
            }
            array.addAll(this.renderables);
            return;
        }
        throw new GdxRuntimeException("Cannot render a ModelCache in between .begin() and .end()");
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        if (!this.building) {
            this.meshPool.dispose();
            return;
        }
        throw new GdxRuntimeException("Cannot dispose a ModelCache in between .begin() and .end()");
    }
}
