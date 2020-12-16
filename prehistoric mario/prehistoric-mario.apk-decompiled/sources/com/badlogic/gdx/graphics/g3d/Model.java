package com.badlogic.gdx.graphics.g3d;

import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.VertexAttributes;
import com.badlogic.gdx.graphics.g3d.attributes.BlendingAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.ColorAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.FloatAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.TextureAttribute;
import com.badlogic.gdx.graphics.g3d.model.Animation;
import com.badlogic.gdx.graphics.g3d.model.MeshPart;
import com.badlogic.gdx.graphics.g3d.model.Node;
import com.badlogic.gdx.graphics.g3d.model.NodeAnimation;
import com.badlogic.gdx.graphics.g3d.model.NodeKeyframe;
import com.badlogic.gdx.graphics.g3d.model.NodePart;
import com.badlogic.gdx.graphics.g3d.model.data.ModelAnimation;
import com.badlogic.gdx.graphics.g3d.model.data.ModelData;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMaterial;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMesh;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMeshPart;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNode;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNodeAnimation;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNodeKeyframe;
import com.badlogic.gdx.graphics.g3d.model.data.ModelNodePart;
import com.badlogic.gdx.graphics.g3d.model.data.ModelTexture;
import com.badlogic.gdx.graphics.g3d.utils.TextureDescriptor;
import com.badlogic.gdx.graphics.g3d.utils.TextureProvider;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.math.collision.BoundingBox;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ArrayMap;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.ObjectMap;
import java.util.Iterator;

public class Model implements Disposable {
    public final Array<Animation> animations;
    protected final Array<Disposable> disposables;
    public final Array<Material> materials;
    public final Array<MeshPart> meshParts;
    public final Array<Mesh> meshes;
    private ObjectMap<NodePart, ArrayMap<String, Matrix4>> nodePartBones;
    public final Array<Node> nodes;

    public Model() {
        this.materials = new Array<>();
        this.nodes = new Array<>();
        this.animations = new Array<>();
        this.meshes = new Array<>();
        this.meshParts = new Array<>();
        this.disposables = new Array<>();
        this.nodePartBones = new ObjectMap<>();
    }

    public Model(ModelData modelData) {
        this(modelData, new TextureProvider.FileTextureProvider());
    }

    public Model(ModelData modelData, TextureProvider textureProvider) {
        this.materials = new Array<>();
        this.nodes = new Array<>();
        this.animations = new Array<>();
        this.meshes = new Array<>();
        this.meshParts = new Array<>();
        this.disposables = new Array<>();
        this.nodePartBones = new ObjectMap<>();
        load(modelData, textureProvider);
    }

    /* access modifiers changed from: protected */
    public void load(ModelData modelData, TextureProvider textureProvider) {
        loadMeshes(modelData.meshes);
        loadMaterials(modelData.materials, textureProvider);
        loadNodes(modelData.nodes);
        loadAnimations(modelData.animations);
        calculateTransforms();
    }

    /* access modifiers changed from: protected */
    public void loadAnimations(Iterable<ModelAnimation> iterable) {
        for (ModelAnimation modelAnimation : iterable) {
            Animation animation = new Animation();
            animation.id = modelAnimation.id;
            Iterator<ModelNodeAnimation> it = modelAnimation.nodeAnimations.iterator();
            while (it.hasNext()) {
                ModelNodeAnimation next = it.next();
                Node node = getNode(next.nodeId);
                if (node != null) {
                    NodeAnimation nodeAnimation = new NodeAnimation();
                    nodeAnimation.node = node;
                    if (next.translation != null) {
                        nodeAnimation.translation = new Array<>();
                        nodeAnimation.translation.ensureCapacity(next.translation.size);
                        Iterator<ModelNodeKeyframe<Vector3>> it2 = next.translation.iterator();
                        while (it2.hasNext()) {
                            ModelNodeKeyframe<Vector3> next2 = it2.next();
                            if (next2.keytime > animation.duration) {
                                animation.duration = next2.keytime;
                            }
                            nodeAnimation.translation.add(new NodeKeyframe<>(next2.keytime, new Vector3(next2.value == null ? node.translation : next2.value)));
                        }
                    }
                    if (next.rotation != null) {
                        nodeAnimation.rotation = new Array<>();
                        nodeAnimation.rotation.ensureCapacity(next.rotation.size);
                        Iterator<ModelNodeKeyframe<Quaternion>> it3 = next.rotation.iterator();
                        while (it3.hasNext()) {
                            ModelNodeKeyframe<Quaternion> next3 = it3.next();
                            if (next3.keytime > animation.duration) {
                                animation.duration = next3.keytime;
                            }
                            nodeAnimation.rotation.add(new NodeKeyframe<>(next3.keytime, new Quaternion(next3.value == null ? node.rotation : next3.value)));
                        }
                    }
                    if (next.scaling != null) {
                        nodeAnimation.scaling = new Array<>();
                        nodeAnimation.scaling.ensureCapacity(next.scaling.size);
                        Iterator<ModelNodeKeyframe<Vector3>> it4 = next.scaling.iterator();
                        while (it4.hasNext()) {
                            ModelNodeKeyframe<Vector3> next4 = it4.next();
                            if (next4.keytime > animation.duration) {
                                animation.duration = next4.keytime;
                            }
                            nodeAnimation.scaling.add(new NodeKeyframe<>(next4.keytime, new Vector3(next4.value == null ? node.scale : next4.value)));
                        }
                    }
                    if ((nodeAnimation.translation != null && nodeAnimation.translation.size > 0) || ((nodeAnimation.rotation != null && nodeAnimation.rotation.size > 0) || (nodeAnimation.scaling != null && nodeAnimation.scaling.size > 0))) {
                        animation.nodeAnimations.add(nodeAnimation);
                    }
                }
            }
            if (animation.nodeAnimations.size > 0) {
                this.animations.add(animation);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void loadNodes(Iterable<ModelNode> iterable) {
        this.nodePartBones.clear();
        for (ModelNode modelNode : iterable) {
            this.nodes.add(loadNode(modelNode));
        }
        ObjectMap.Entries<NodePart, ArrayMap<String, Matrix4>> it = this.nodePartBones.entries().iterator();
        while (it.hasNext()) {
            ObjectMap.Entry entry = (ObjectMap.Entry) it.next();
            if (entry.key.invBoneBindTransforms == null) {
                entry.key.invBoneBindTransforms = new ArrayMap<>(Node.class, Matrix4.class);
            }
            entry.key.invBoneBindTransforms.clear();
            Iterator it2 = entry.value.entries().iterator();
            while (it2.hasNext()) {
                ObjectMap.Entry entry2 = (ObjectMap.Entry) it2.next();
                entry.key.invBoneBindTransforms.put(getNode(entry2.key), new Matrix4((Matrix4) entry2.value).inv());
            }
        }
    }

    /* access modifiers changed from: protected */
    public Node loadNode(ModelNode modelNode) {
        MeshPart meshPart;
        Node node = new Node();
        node.id = modelNode.id;
        if (modelNode.translation != null) {
            node.translation.set(modelNode.translation);
        }
        if (modelNode.rotation != null) {
            node.rotation.set(modelNode.rotation);
        }
        if (modelNode.scale != null) {
            node.scale.set(modelNode.scale);
        }
        if (modelNode.parts != null) {
            ModelNodePart[] modelNodePartArr = modelNode.parts;
            for (ModelNodePart modelNodePart : modelNodePartArr) {
                Material material = null;
                if (modelNodePart.meshPartId != null) {
                    Iterator<MeshPart> it = this.meshParts.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        meshPart = it.next();
                        if (modelNodePart.meshPartId.equals(meshPart.id)) {
                            break;
                        }
                    }
                }
                meshPart = null;
                if (modelNodePart.materialId != null) {
                    Iterator<Material> it2 = this.materials.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            break;
                        }
                        Material next = it2.next();
                        if (modelNodePart.materialId.equals(next.id)) {
                            material = next;
                            break;
                        }
                    }
                }
                if (meshPart == null || material == null) {
                    throw new GdxRuntimeException("Invalid node: " + node.id);
                }
                if (!(meshPart == null || material == null)) {
                    NodePart nodePart = new NodePart();
                    nodePart.meshPart = meshPart;
                    nodePart.material = material;
                    node.parts.add(nodePart);
                    if (modelNodePart.bones != null) {
                        this.nodePartBones.put(nodePart, modelNodePart.bones);
                    }
                }
            }
        }
        if (modelNode.children != null) {
            for (ModelNode modelNode2 : modelNode.children) {
                node.addChild(loadNode(modelNode2));
            }
        }
        return node;
    }

    /* access modifiers changed from: protected */
    public void loadMeshes(Iterable<ModelMesh> iterable) {
        for (ModelMesh modelMesh : iterable) {
            convertMesh(modelMesh);
        }
    }

    /* access modifiers changed from: protected */
    public void convertMesh(ModelMesh modelMesh) {
        int i = 0;
        for (ModelMeshPart modelMeshPart : modelMesh.parts) {
            i += modelMeshPart.indices.length;
        }
        boolean z = i > 0;
        VertexAttributes vertexAttributes = new VertexAttributes(modelMesh.attributes);
        int length = modelMesh.vertices.length / (vertexAttributes.vertexSize / 4);
        Mesh mesh = new Mesh(true, length, i, vertexAttributes);
        this.meshes.add(mesh);
        this.disposables.add(mesh);
        BufferUtils.copy(modelMesh.vertices, mesh.getVerticesBuffer(), modelMesh.vertices.length, 0);
        mesh.getIndicesBuffer().clear();
        ModelMeshPart[] modelMeshPartArr = modelMesh.parts;
        int i2 = 0;
        for (ModelMeshPart modelMeshPart2 : modelMeshPartArr) {
            MeshPart meshPart = new MeshPart();
            meshPart.id = modelMeshPart2.id;
            meshPart.primitiveType = modelMeshPart2.primitiveType;
            meshPart.offset = i2;
            meshPart.size = z ? modelMeshPart2.indices.length : length;
            meshPart.mesh = mesh;
            if (z) {
                mesh.getIndicesBuffer().put(modelMeshPart2.indices);
            }
            i2 += meshPart.size;
            this.meshParts.add(meshPart);
        }
        mesh.getIndicesBuffer().position(0);
        Iterator<MeshPart> it = this.meshParts.iterator();
        while (it.hasNext()) {
            it.next().update();
        }
    }

    /* access modifiers changed from: protected */
    public void loadMaterials(Iterable<ModelMaterial> iterable, TextureProvider textureProvider) {
        for (ModelMaterial modelMaterial : iterable) {
            this.materials.add(convertMaterial(modelMaterial, textureProvider));
        }
    }

    /* access modifiers changed from: protected */
    public Material convertMaterial(ModelMaterial modelMaterial, TextureProvider textureProvider) {
        Texture texture;
        Material material = new Material();
        material.id = modelMaterial.id;
        if (modelMaterial.ambient != null) {
            material.set(new ColorAttribute(ColorAttribute.Ambient, modelMaterial.ambient));
        }
        if (modelMaterial.diffuse != null) {
            material.set(new ColorAttribute(ColorAttribute.Diffuse, modelMaterial.diffuse));
        }
        if (modelMaterial.specular != null) {
            material.set(new ColorAttribute(ColorAttribute.Specular, modelMaterial.specular));
        }
        if (modelMaterial.emissive != null) {
            material.set(new ColorAttribute(ColorAttribute.Emissive, modelMaterial.emissive));
        }
        if (modelMaterial.reflection != null) {
            material.set(new ColorAttribute(ColorAttribute.Reflection, modelMaterial.reflection));
        }
        if (modelMaterial.shininess > 0.0f) {
            material.set(new FloatAttribute(FloatAttribute.Shininess, modelMaterial.shininess));
        }
        if (modelMaterial.opacity != 1.0f) {
            material.set(new BlendingAttribute(GL20.GL_SRC_ALPHA, GL20.GL_ONE_MINUS_SRC_ALPHA, modelMaterial.opacity));
        }
        ObjectMap objectMap = new ObjectMap();
        if (modelMaterial.textures != null) {
            Iterator<ModelTexture> it = modelMaterial.textures.iterator();
            while (it.hasNext()) {
                ModelTexture next = it.next();
                if (objectMap.containsKey(next.fileName)) {
                    texture = (Texture) objectMap.get(next.fileName);
                } else {
                    texture = textureProvider.load(next.fileName);
                    objectMap.put(next.fileName, texture);
                    this.disposables.add(texture);
                }
                TextureDescriptor textureDescriptor = new TextureDescriptor(texture);
                textureDescriptor.minFilter = texture.getMinFilter();
                textureDescriptor.magFilter = texture.getMagFilter();
                textureDescriptor.uWrap = texture.getUWrap();
                textureDescriptor.vWrap = texture.getVWrap();
                float f = next.uvTranslation == null ? 0.0f : next.uvTranslation.x;
                float f2 = next.uvTranslation == null ? 0.0f : next.uvTranslation.y;
                float f3 = next.uvScaling == null ? 1.0f : next.uvScaling.x;
                float f4 = next.uvScaling == null ? 1.0f : next.uvScaling.y;
                int i = next.usage;
                if (i == 2) {
                    material.set(new TextureAttribute(TextureAttribute.Diffuse, textureDescriptor, f, f2, f3, f4));
                } else if (i == 3) {
                    material.set(new TextureAttribute(TextureAttribute.Emissive, textureDescriptor, f, f2, f3, f4));
                } else if (i == 4) {
                    material.set(new TextureAttribute(TextureAttribute.Ambient, textureDescriptor, f, f2, f3, f4));
                } else if (i == 5) {
                    material.set(new TextureAttribute(TextureAttribute.Specular, textureDescriptor, f, f2, f3, f4));
                } else if (i == 7) {
                    material.set(new TextureAttribute(TextureAttribute.Normal, textureDescriptor, f, f2, f3, f4));
                } else if (i == 8) {
                    material.set(new TextureAttribute(TextureAttribute.Bump, textureDescriptor, f, f2, f3, f4));
                } else if (i == 10) {
                    material.set(new TextureAttribute(TextureAttribute.Reflection, textureDescriptor, f, f2, f3, f4));
                }
            }
        }
        return material;
    }

    public void manageDisposable(Disposable disposable) {
        if (!this.disposables.contains(disposable, true)) {
            this.disposables.add(disposable);
        }
    }

    public Iterable<Disposable> getManagedDisposables() {
        return this.disposables;
    }

    @Override // com.badlogic.gdx.utils.Disposable
    public void dispose() {
        Iterator<Disposable> it = this.disposables.iterator();
        while (it.hasNext()) {
            it.next().dispose();
        }
    }

    public void calculateTransforms() {
        int i = this.nodes.size;
        for (int i2 = 0; i2 < i; i2++) {
            this.nodes.get(i2).calculateTransforms(true);
        }
        for (int i3 = 0; i3 < i; i3++) {
            this.nodes.get(i3).calculateBoneTransforms(true);
        }
    }

    public BoundingBox calculateBoundingBox(BoundingBox boundingBox) {
        boundingBox.inf();
        return extendBoundingBox(boundingBox);
    }

    public BoundingBox extendBoundingBox(BoundingBox boundingBox) {
        int i = this.nodes.size;
        for (int i2 = 0; i2 < i; i2++) {
            this.nodes.get(i2).extendBoundingBox(boundingBox);
        }
        return boundingBox;
    }

    public Animation getAnimation(String str) {
        return getAnimation(str, true);
    }

    public Animation getAnimation(String str, boolean z) {
        int i = this.animations.size;
        int i2 = 0;
        if (z) {
            while (i2 < i) {
                Animation animation = this.animations.get(i2);
                if (animation.id.equalsIgnoreCase(str)) {
                    return animation;
                }
                i2++;
            }
            return null;
        }
        while (i2 < i) {
            Animation animation2 = this.animations.get(i2);
            if (animation2.id.equals(str)) {
                return animation2;
            }
            i2++;
        }
        return null;
    }

    public Material getMaterial(String str) {
        return getMaterial(str, true);
    }

    public Material getMaterial(String str, boolean z) {
        int i = this.materials.size;
        int i2 = 0;
        if (z) {
            while (i2 < i) {
                Material material = this.materials.get(i2);
                if (material.id.equalsIgnoreCase(str)) {
                    return material;
                }
                i2++;
            }
            return null;
        }
        while (i2 < i) {
            Material material2 = this.materials.get(i2);
            if (material2.id.equals(str)) {
                return material2;
            }
            i2++;
        }
        return null;
    }

    public Node getNode(String str) {
        return getNode(str, true);
    }

    public Node getNode(String str, boolean z) {
        return getNode(str, z, false);
    }

    public Node getNode(String str, boolean z, boolean z2) {
        return Node.getNode(this.nodes, str, z, z2);
    }
}
