package com.badlogic.gdx.graphics.g3d.utils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.Material;
import com.badlogic.gdx.graphics.g3d.Model;
import com.badlogic.gdx.graphics.g3d.model.MeshPart;
import com.badlogic.gdx.graphics.g3d.model.Node;
import com.badlogic.gdx.graphics.g3d.model.NodePart;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import java.util.Iterator;

public class ModelBuilder {
    private Array<MeshBuilder> builders = new Array<>();
    private Model model;
    private Node node;
    private Matrix4 tmpTransform = new Matrix4();

    private MeshBuilder getBuilder(VertexAttributes vertexAttributes) {
        Iterator<MeshBuilder> it = this.builders.iterator();
        while (it.hasNext()) {
            MeshBuilder next = it.next();
            if (next.getAttributes().equals(vertexAttributes) && next.lastIndex() < 16383) {
                return next;
            }
        }
        MeshBuilder meshBuilder = new MeshBuilder();
        meshBuilder.begin(vertexAttributes);
        this.builders.add(meshBuilder);
        return meshBuilder;
    }

    public void begin() {
        if (this.model == null) {
            this.node = null;
            this.model = new Model();
            this.builders.clear();
            return;
        }
        throw new GdxRuntimeException("Call end() first");
    }

    public Model end() {
        Model model2 = this.model;
        if (model2 != null) {
            endnode();
            this.model = null;
            Iterator<MeshBuilder> it = this.builders.iterator();
            while (it.hasNext()) {
                it.next().end();
            }
            this.builders.clear();
            rebuildReferences(model2);
            return model2;
        }
        throw new GdxRuntimeException("Call begin() first");
    }

    private void endnode() {
        if (this.node != null) {
            this.node = null;
        }
    }

    /* access modifiers changed from: protected */
    public Node node(Node node2) {
        if (this.model != null) {
            endnode();
            this.model.nodes.add(node2);
            this.node = node2;
            return node2;
        }
        throw new GdxRuntimeException("Call begin() first");
    }

    public Node node() {
        Node node2 = new Node();
        node(node2);
        node2.id = "node" + this.model.nodes.size;
        return node2;
    }

    public Node node(String str, Model model2) {
        Node node2 = new Node();
        node2.id = str;
        node2.addChildren(model2.nodes);
        node(node2);
        for (Disposable disposable : model2.getManagedDisposables()) {
            manage(disposable);
        }
        return node2;
    }

    public void manage(Disposable disposable) {
        Model model2 = this.model;
        if (model2 != null) {
            model2.manageDisposable(disposable);
            return;
        }
        throw new GdxRuntimeException("Call begin() first");
    }

    public void part(MeshPart meshPart, Material material) {
        if (this.node == null) {
            node();
        }
        this.node.parts.add(new NodePart(meshPart, material));
    }

    public MeshPart part(String str, Mesh mesh, int i, int i2, int i3, Material material) {
        MeshPart meshPart = new MeshPart();
        meshPart.id = str;
        meshPart.primitiveType = i;
        meshPart.mesh = mesh;
        meshPart.offset = i2;
        meshPart.size = i3;
        part(meshPart, material);
        return meshPart;
    }

    public MeshPart part(String str, Mesh mesh, int i, Material material) {
        return part(str, mesh, i, 0, mesh.getNumIndices(), material);
    }

    public MeshPartBuilder part(String str, int i, VertexAttributes vertexAttributes, Material material) {
        MeshBuilder builder = getBuilder(vertexAttributes);
        part(builder.part(str, i), material);
        return builder;
    }

    public MeshPartBuilder part(String str, int i, long j, Material material) {
        return part(str, i, MeshBuilder.createAttributes(j), material);
    }

    public Model createBox(float f, float f2, float f3, Material material, long j) {
        return createBox(f, f2, f3, 4, material, j);
    }

    public Model createBox(float f, float f2, float f3, int i, Material material, long j) {
        begin();
        part("box", i, j, material).box(f, f2, f3);
        return end();
    }

    public Model createRect(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12, float f13, float f14, float f15, Material material, long j) {
        return createRect(f, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, 4, material, j);
    }

    public Model createRect(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, float f9, float f10, float f11, float f12, float f13, float f14, float f15, int i, Material material, long j) {
        begin();
        part("rect", i, j, material).rect(f, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15);
        return end();
    }

    public Model createCylinder(float f, float f2, float f3, int i, Material material, long j) {
        return createCylinder(f, f2, f3, i, 4, material, j);
    }

    public Model createCylinder(float f, float f2, float f3, int i, int i2, Material material, long j) {
        return createCylinder(f, f2, f3, i, i2, material, j, 0.0f, 360.0f);
    }

    public Model createCylinder(float f, float f2, float f3, int i, Material material, long j, float f4, float f5) {
        return createCylinder(f, f2, f3, i, 4, material, j, f4, f5);
    }

    public Model createCylinder(float f, float f2, float f3, int i, int i2, Material material, long j, float f4, float f5) {
        begin();
        part("cylinder", i2, j, material).cylinder(f, f2, f3, i, f4, f5);
        return end();
    }

    public Model createCone(float f, float f2, float f3, int i, Material material, long j) {
        return createCone(f, f2, f3, i, 4, material, j);
    }

    public Model createCone(float f, float f2, float f3, int i, int i2, Material material, long j) {
        return createCone(f, f2, f3, i, i2, material, j, 0.0f, 360.0f);
    }

    public Model createCone(float f, float f2, float f3, int i, Material material, long j, float f4, float f5) {
        return createCone(f, f2, f3, i, 4, material, j, f4, f5);
    }

    public Model createCone(float f, float f2, float f3, int i, int i2, Material material, long j, float f4, float f5) {
        begin();
        part("cone", i2, j, material).cone(f, f2, f3, i, f4, f5);
        return end();
    }

    public Model createSphere(float f, float f2, float f3, int i, int i2, Material material, long j) {
        return createSphere(f, f2, f3, i, i2, 4, material, j);
    }

    public Model createSphere(float f, float f2, float f3, int i, int i2, int i3, Material material, long j) {
        return createSphere(f, f2, f3, i, i2, i3, material, j, 0.0f, 360.0f, 0.0f, 180.0f);
    }

    public Model createSphere(float f, float f2, float f3, int i, int i2, Material material, long j, float f4, float f5, float f6, float f7) {
        return createSphere(f, f2, f3, i, i2, 4, material, j, f4, f5, f6, f7);
    }

    public Model createSphere(float f, float f2, float f3, int i, int i2, int i3, Material material, long j, float f4, float f5, float f6, float f7) {
        begin();
        part("cylinder", i3, j, material).sphere(f, f2, f3, i, i2, f4, f5, f6, f7);
        return end();
    }

    public Model createCapsule(float f, float f2, int i, Material material, long j) {
        return createCapsule(f, f2, i, 4, material, j);
    }

    public Model createCapsule(float f, float f2, int i, int i2, Material material, long j) {
        begin();
        part("capsule", i2, j, material).capsule(f, f2, i);
        return end();
    }

    public static void rebuildReferences(Model model2) {
        model2.materials.clear();
        model2.meshes.clear();
        model2.meshParts.clear();
        Iterator<Node> it = model2.nodes.iterator();
        while (it.hasNext()) {
            rebuildReferences(model2, it.next());
        }
    }

    private static void rebuildReferences(Model model2, Node node2) {
        Iterator<NodePart> it = node2.parts.iterator();
        while (it.hasNext()) {
            NodePart next = it.next();
            if (!model2.materials.contains(next.material, true)) {
                model2.materials.add(next.material);
            }
            if (!model2.meshParts.contains(next.meshPart, true)) {
                model2.meshParts.add(next.meshPart);
                if (!model2.meshes.contains(next.meshPart.mesh, true)) {
                    model2.meshes.add(next.meshPart.mesh);
                }
                model2.manageDisposable(next.meshPart.mesh);
            }
        }
        for (Node node3 : node2.getChildren()) {
            rebuildReferences(model2, node3);
        }
    }

    public Model createXYZCoordinates(float f, float f2, float f3, int i, int i2, Material material, long j) {
        begin();
        node();
        MeshPartBuilder part = part("xyz", i2, j, material);
        part.setColor(Color.RED);
        part.arrow(0.0f, 0.0f, 0.0f, f, 0.0f, 0.0f, f2, f3, i);
        part.setColor(Color.GREEN);
        part.arrow(0.0f, 0.0f, 0.0f, 0.0f, f, 0.0f, f2, f3, i);
        part.setColor(Color.BLUE);
        part.arrow(0.0f, 0.0f, 0.0f, 0.0f, 0.0f, f, f2, f3, i);
        return end();
    }

    public Model createXYZCoordinates(float f, Material material, long j) {
        return createXYZCoordinates(f, 0.1f, 0.1f, 5, 4, material, j);
    }

    public Model createArrow(float f, float f2, float f3, float f4, float f5, float f6, float f7, float f8, int i, int i2, Material material, long j) {
        begin();
        part("arrow", i2, j, material).arrow(f, f2, f3, f4, f5, f6, f7, f8, i);
        return end();
    }

    public Model createArrow(Vector3 vector3, Vector3 vector32, Material material, long j) {
        return createArrow(vector3.x, vector3.y, vector3.z, vector32.x, vector32.y, vector32.z, 0.1f, 0.1f, 5, 4, material, j);
    }

    public Model createLineGrid(int i, int i2, float f, float f2, Material material, long j) {
        begin();
        MeshPartBuilder part = part("lines", 1, j, material);
        float f3 = (((float) i) * f) / 2.0f;
        float f4 = (((float) i2) * f2) / 2.0f;
        float f5 = -f3;
        float f6 = -f4;
        float f7 = f5;
        float f8 = f7;
        for (int i3 = 0; i3 <= i; i3++) {
            part.line(f7, 0.0f, f4, f8, 0.0f, f6);
            f7 += f;
            f8 += f;
        }
        float f9 = f6;
        for (int i4 = 0; i4 <= i2; i4++) {
            part.line(f5, 0.0f, f6, f3, 0.0f, f9);
            f6 += f2;
            f9 += f2;
        }
        return end();
    }
}
