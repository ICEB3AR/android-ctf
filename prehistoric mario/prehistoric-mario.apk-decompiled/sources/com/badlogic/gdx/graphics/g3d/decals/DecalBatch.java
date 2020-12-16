package com.badlogic.gdx.graphics.g3d.decals;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.Pool;
import com.badlogic.gdx.utils.SortedIntList;
import java.util.Iterator;

public class DecalBatch implements Disposable {
    private static final int DEFAULT_SIZE = 1000;
    private final SortedIntList<Array<Decal>> groupList;
    private final Pool<Array<Decal>> groupPool;
    private GroupStrategy groupStrategy;
    private Mesh mesh;
    private final Array<Array<Decal>> usedGroups;
    private float[] vertices;

    public DecalBatch(GroupStrategy groupStrategy2) {
        this(DEFAULT_SIZE, groupStrategy2);
    }

    public DecalBatch(int i, GroupStrategy groupStrategy2) {
        this.groupList = new SortedIntList<>();
        this.groupPool = new Pool<Array<Decal>>(16) {
            /* class com.badlogic.gdx.graphics.g3d.decals.DecalBatch.AnonymousClass1 */

            /* access modifiers changed from: protected */
            @Override // com.badlogic.gdx.utils.Pool
            public Array<Decal> newObject() {
                return new Array<>(false, 100);
            }
        };
        this.usedGroups = new Array<>(16);
        initialize(i);
        setGroupStrategy(groupStrategy2);
    }

    public void setGroupStrategy(GroupStrategy groupStrategy2) {
        this.groupStrategy = groupStrategy2;
    }

    public void initialize(int i) {
        this.vertices = new float[(i * 24)];
        Mesh.VertexDataType vertexDataType = Mesh.VertexDataType.VertexArray;
        if (Gdx.gl30 != null) {
            vertexDataType = Mesh.VertexDataType.VertexBufferObjectWithVAO;
        }
        int i2 = i * 4;
        int i3 = i * 6;
        int i4 = 0;
        this.mesh = new Mesh(vertexDataType, false, i2, i3, new VertexAttribute(1, 3, ShaderProgram.POSITION_ATTRIBUTE), new VertexAttribute(4, 4, ShaderProgram.COLOR_ATTRIBUTE), new VertexAttribute(16, 2, "a_texCoord0"));
        short[] sArr = new short[i3];
        int i5 = 0;
        while (i4 < sArr.length) {
            sArr[i4] = (short) i5;
            short s = (short) (i5 + 2);
            sArr[i4 + 1] = s;
            short s2 = (short) (i5 + 1);
            sArr[i4 + 2] = s2;
            sArr[i4 + 3] = s2;
            sArr[i4 + 4] = s;
            sArr[i4 + 5] = (short) (i5 + 3);
            i4 += 6;
            i5 += 4;
        }
        this.mesh.setIndices(sArr);
    }

    public int getSize() {
        return this.vertices.length / 24;
    }

    public void add(Decal decal) {
        int decideGroup = this.groupStrategy.decideGroup(decal);
        Array<Decal> array = this.groupList.get(decideGroup);
        if (array == null) {
            array = this.groupPool.obtain();
            array.clear();
            this.usedGroups.add(array);
            this.groupList.insert(decideGroup, array);
        }
        array.add(decal);
    }

    public void flush() {
        render();
        clear();
    }

    /* access modifiers changed from: protected */
    public void render() {
        this.groupStrategy.beforeGroups();
        Iterator<SortedIntList.Node<Array<Decal>>> it = this.groupList.iterator();
        while (it.hasNext()) {
            SortedIntList.Node<Array<Decal>> next = it.next();
            this.groupStrategy.beforeGroup(next.index, next.value);
            render(this.groupStrategy.getGroupShader(next.index), next.value);
            this.groupStrategy.afterGroup(next.index);
        }
        this.groupStrategy.afterGroups();
    }

    private void render(ShaderProgram shaderProgram, Array<Decal> array) {
        int i;
        Iterator<Decal> it = array.iterator();
        DecalMaterial decalMaterial = null;
        loop0:
        while (true) {
            i = 0;
            while (it.hasNext()) {
                Decal next = it.next();
                if (decalMaterial == null || !decalMaterial.equals(next.getMaterial())) {
                    if (i > 0) {
                        flush(shaderProgram, i);
                        i = 0;
                    }
                    next.material.set();
                    decalMaterial = next.material;
                }
                next.update();
                System.arraycopy(next.vertices, 0, this.vertices, i, next.vertices.length);
                i += next.vertices.length;
                if (i == this.vertices.length) {
                    flush(shaderProgram, i);
                }
            }
            break loop0;
        }
        if (i > 0) {
            flush(shaderProgram, i);
        }
    }

    /* access modifiers changed from: protected */
    public void flush(ShaderProgram shaderProgram, int i) {
        this.mesh.setVertices(this.vertices, 0, i);
        this.mesh.render(shaderProgram, 4, 0, i / 4);
    }

    /* access modifiers changed from: protected */
    public void clear() {
        this.groupList.clear();
        this.groupPool.freeAll(this.usedGroups);
        this.usedGroups.clear();
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        clear();
        this.vertices = null;
        this.mesh.dispose();
    }
}
