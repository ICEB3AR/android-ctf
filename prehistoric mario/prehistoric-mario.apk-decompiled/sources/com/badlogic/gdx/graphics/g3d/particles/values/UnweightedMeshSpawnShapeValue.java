package com.badlogic.gdx.graphics.g3d.particles.values;

import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.particles.values.MeshSpawnShapeValue;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector3;

public final class UnweightedMeshSpawnShapeValue extends MeshSpawnShapeValue {
    private short[] indices;
    private int positionOffset;
    private int triangleCount;
    private int vertexCount;
    private int vertexSize;
    private float[] vertices;

    public UnweightedMeshSpawnShapeValue(UnweightedMeshSpawnShapeValue unweightedMeshSpawnShapeValue) {
        super(unweightedMeshSpawnShapeValue);
        load(unweightedMeshSpawnShapeValue);
    }

    public UnweightedMeshSpawnShapeValue() {
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.MeshSpawnShapeValue
    public void setMesh(Mesh mesh, Model model) {
        super.setMesh(mesh, model);
        this.vertexSize = mesh.getVertexSize() / 4;
        this.positionOffset = mesh.getVertexAttribute(1).offset / 4;
        int numIndices = mesh.getNumIndices();
        if (numIndices > 0) {
            this.indices = new short[numIndices];
            mesh.getIndices(this.indices);
            this.triangleCount = this.indices.length / 3;
        } else {
            this.indices = null;
        }
        this.vertexCount = mesh.getNumVertices();
        this.vertices = new float[(this.vertexCount * this.vertexSize)];
        mesh.getVertices(this.vertices);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public void spawnAux(Vector3 vector3, float f) {
        if (this.indices == null) {
            int random = MathUtils.random(this.vertexCount - 3);
            int i = this.vertexSize;
            int i2 = (random * i) + this.positionOffset;
            int i3 = i2 + i;
            int i4 = i + i3;
            float[] fArr = this.vertices;
            MeshSpawnShapeValue.Triangle.pick(fArr[i2], fArr[i2 + 1], fArr[i2 + 2], fArr[i3], fArr[i3 + 1], fArr[i3 + 2], fArr[i4], fArr[i4 + 1], fArr[i4 + 2], vector3);
            return;
        }
        int random2 = MathUtils.random(this.triangleCount - 1) * 3;
        short[] sArr = this.indices;
        short s = sArr[random2];
        int i5 = this.vertexSize;
        int i6 = this.positionOffset;
        int i7 = (s * i5) + i6;
        int i8 = (sArr[random2 + 1] * i5) + i6;
        int i9 = (sArr[random2 + 2] * i5) + i6;
        float[] fArr2 = this.vertices;
        MeshSpawnShapeValue.Triangle.pick(fArr2[i7], fArr2[i7 + 1], fArr2[i7 + 2], fArr2[i8], fArr2[i8 + 1], fArr2[i8 + 2], fArr2[i9], fArr2[i9 + 1], fArr2[i9 + 2], vector3);
    }

    @Override // com.badlogic.gdx.graphics.g3d.particles.values.SpawnShapeValue
    public SpawnShapeValue copy() {
        return new UnweightedMeshSpawnShapeValue(this);
    }
}
