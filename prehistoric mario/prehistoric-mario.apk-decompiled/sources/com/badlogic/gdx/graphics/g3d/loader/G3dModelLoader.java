package com.badlogic.gdx.graphics.g3d.loader;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.assets.loaders.FileHandleResolver;
import com.badlogic.gdx.assets.loaders.ModelLoader;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.graphics.g3d.attributes.FloatAttribute;
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
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Quaternion;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.ArrayMap;
import com.badlogic.gdx.utils.BaseJsonReader;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.JsonValue;
import java.util.Iterator;

public class G3dModelLoader extends ModelLoader<ModelLoader.ModelParameters> {
    public static final short VERSION_HI = 0;
    public static final short VERSION_LO = 1;
    protected final BaseJsonReader reader;
    protected final Quaternion tempQ;

    public G3dModelLoader(BaseJsonReader baseJsonReader) {
        this(baseJsonReader, null);
    }

    public G3dModelLoader(BaseJsonReader baseJsonReader, FileHandleResolver fileHandleResolver) {
        super(fileHandleResolver);
        this.tempQ = new Quaternion();
        this.reader = baseJsonReader;
    }

    @Override // com.badlogic.gdx.assets.loaders.ModelLoader
    public ModelData loadModelData(FileHandle fileHandle, ModelLoader.ModelParameters modelParameters) {
        return parseModel(fileHandle);
    }

    public ModelData parseModel(FileHandle fileHandle) {
        JsonValue parse = this.reader.parse(fileHandle);
        ModelData modelData = new ModelData();
        JsonValue require = parse.require("version");
        modelData.version[0] = require.getShort(0);
        modelData.version[1] = require.getShort(1);
        if (modelData.version[0] == 0 && modelData.version[1] == 1) {
            modelData.id = parse.getString("id", BuildConfig.FLAVOR);
            parseMeshes(modelData, parse);
            parseMaterials(modelData, parse, fileHandle.parent().path());
            parseNodes(modelData, parse);
            parseAnimations(modelData, parse);
            return modelData;
        }
        throw new GdxRuntimeException("Model version not supported");
    }

    /* access modifiers changed from: protected */
    public void parseMeshes(ModelData modelData, JsonValue jsonValue) {
        JsonValue jsonValue2 = jsonValue.get("meshes");
        if (jsonValue2 != null) {
            modelData.meshes.ensureCapacity(jsonValue2.size);
            for (JsonValue jsonValue3 = jsonValue2.child; jsonValue3 != null; jsonValue3 = jsonValue3.next) {
                ModelMesh modelMesh = new ModelMesh();
                modelMesh.id = jsonValue3.getString("id", BuildConfig.FLAVOR);
                modelMesh.attributes = parseAttributes(jsonValue3.require("attributes"));
                modelMesh.vertices = jsonValue3.require("vertices").asFloatArray();
                JsonValue require = jsonValue3.require("parts");
                Array array = new Array();
                for (JsonValue jsonValue4 = require.child; jsonValue4 != null; jsonValue4 = jsonValue4.next) {
                    ModelMeshPart modelMeshPart = new ModelMeshPart();
                    String string = jsonValue4.getString("id", null);
                    if (string != null) {
                        Iterator it = array.iterator();
                        while (it.hasNext()) {
                            if (((ModelMeshPart) it.next()).id.equals(string)) {
                                throw new GdxRuntimeException("Mesh part with id '" + string + "' already in defined");
                            }
                        }
                        modelMeshPart.id = string;
                        String string2 = jsonValue4.getString("type", null);
                        if (string2 != null) {
                            modelMeshPart.primitiveType = parseType(string2);
                            modelMeshPart.indices = jsonValue4.require("indices").asShortArray();
                            array.add(modelMeshPart);
                        } else {
                            throw new GdxRuntimeException("No primitive type given for mesh part '" + string + "'");
                        }
                    } else {
                        throw new GdxRuntimeException("Not id given for mesh part");
                    }
                }
                modelMesh.parts = (ModelMeshPart[]) array.toArray(ModelMeshPart.class);
                modelData.meshes.add(modelMesh);
            }
        }
    }

    /* access modifiers changed from: protected */
    public int parseType(String str) {
        if (str.equals("TRIANGLES")) {
            return 4;
        }
        if (str.equals("LINES")) {
            return 1;
        }
        if (str.equals("POINTS")) {
            return 0;
        }
        if (str.equals("TRIANGLE_STRIP")) {
            return 5;
        }
        if (str.equals("LINE_STRIP")) {
            return 3;
        }
        throw new GdxRuntimeException("Unknown primitive type '" + str + "', should be one of triangle, trianglestrip, line, linestrip, lineloop or point");
    }

    /* access modifiers changed from: protected */
    public VertexAttribute[] parseAttributes(JsonValue jsonValue) {
        Array array = new Array();
        int i = 0;
        int i2 = 0;
        for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
            String asString = jsonValue2.asString();
            if (asString.equals("POSITION")) {
                array.add(VertexAttribute.Position());
            } else if (asString.equals("NORMAL")) {
                array.add(VertexAttribute.Normal());
            } else if (asString.equals("COLOR")) {
                array.add(VertexAttribute.ColorUnpacked());
            } else if (asString.equals("COLORPACKED")) {
                array.add(VertexAttribute.ColorPacked());
            } else if (asString.equals("TANGENT")) {
                array.add(VertexAttribute.Tangent());
            } else if (asString.equals("BINORMAL")) {
                array.add(VertexAttribute.Binormal());
            } else if (asString.startsWith("TEXCOORD")) {
                array.add(VertexAttribute.TexCoords(i));
                i++;
            } else if (asString.startsWith("BLENDWEIGHT")) {
                array.add(VertexAttribute.BoneWeight(i2));
                i2++;
            } else {
                throw new GdxRuntimeException("Unknown vertex attribute '" + asString + "', should be one of position, normal, uv, tangent or binormal");
            }
        }
        return (VertexAttribute[]) array.toArray(VertexAttribute.class);
    }

    /* access modifiers changed from: protected */
    public void parseMaterials(ModelData modelData, JsonValue jsonValue, String str) {
        JsonValue jsonValue2 = jsonValue.get("materials");
        if (jsonValue2 != null) {
            modelData.materials.ensureCapacity(jsonValue2.size);
            for (JsonValue jsonValue3 = jsonValue2.child; jsonValue3 != null; jsonValue3 = jsonValue3.next) {
                ModelMaterial modelMaterial = new ModelMaterial();
                String string = jsonValue3.getString("id", null);
                if (string != null) {
                    modelMaterial.id = string;
                    JsonValue jsonValue4 = jsonValue3.get("diffuse");
                    if (jsonValue4 != null) {
                        modelMaterial.diffuse = parseColor(jsonValue4);
                    }
                    JsonValue jsonValue5 = jsonValue3.get("ambient");
                    if (jsonValue5 != null) {
                        modelMaterial.ambient = parseColor(jsonValue5);
                    }
                    JsonValue jsonValue6 = jsonValue3.get("emissive");
                    if (jsonValue6 != null) {
                        modelMaterial.emissive = parseColor(jsonValue6);
                    }
                    JsonValue jsonValue7 = jsonValue3.get("specular");
                    if (jsonValue7 != null) {
                        modelMaterial.specular = parseColor(jsonValue7);
                    }
                    JsonValue jsonValue8 = jsonValue3.get("reflection");
                    if (jsonValue8 != null) {
                        modelMaterial.reflection = parseColor(jsonValue8);
                    }
                    modelMaterial.shininess = jsonValue3.getFloat(FloatAttribute.ShininessAlias, 0.0f);
                    modelMaterial.opacity = jsonValue3.getFloat("opacity", 1.0f);
                    JsonValue jsonValue9 = jsonValue3.get("textures");
                    if (jsonValue9 != null) {
                        for (JsonValue jsonValue10 = jsonValue9.child; jsonValue10 != null; jsonValue10 = jsonValue10.next) {
                            ModelTexture modelTexture = new ModelTexture();
                            String string2 = jsonValue10.getString("id", null);
                            if (string2 != null) {
                                modelTexture.id = string2;
                                String string3 = jsonValue10.getString("filename", null);
                                if (string3 != null) {
                                    StringBuilder sb = new StringBuilder();
                                    sb.append(str);
                                    String str2 = "/";
                                    if (str.length() == 0 || str.endsWith(str2)) {
                                        str2 = BuildConfig.FLAVOR;
                                    }
                                    sb.append(str2);
                                    sb.append(string3);
                                    modelTexture.fileName = sb.toString();
                                    modelTexture.uvTranslation = readVector2(jsonValue10.get("uvTranslation"), 0.0f, 0.0f);
                                    modelTexture.uvScaling = readVector2(jsonValue10.get("uvScaling"), 1.0f, 1.0f);
                                    String string4 = jsonValue10.getString("type", null);
                                    if (string4 != null) {
                                        modelTexture.usage = parseTextureUsage(string4);
                                        if (modelMaterial.textures == null) {
                                            modelMaterial.textures = new Array<>();
                                        }
                                        modelMaterial.textures.add(modelTexture);
                                    } else {
                                        throw new GdxRuntimeException("Texture needs type.");
                                    }
                                } else {
                                    throw new GdxRuntimeException("Texture needs filename.");
                                }
                            } else {
                                throw new GdxRuntimeException("Texture has no id.");
                            }
                        }
                        continue;
                    }
                    modelData.materials.add(modelMaterial);
                } else {
                    throw new GdxRuntimeException("Material needs an id.");
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public int parseTextureUsage(String str) {
        if (str.equalsIgnoreCase("AMBIENT")) {
            return 4;
        }
        if (str.equalsIgnoreCase("BUMP")) {
            return 8;
        }
        if (str.equalsIgnoreCase("DIFFUSE")) {
            return 2;
        }
        if (str.equalsIgnoreCase("EMISSIVE")) {
            return 3;
        }
        if (str.equalsIgnoreCase("NONE")) {
            return 1;
        }
        if (str.equalsIgnoreCase("NORMAL")) {
            return 7;
        }
        if (str.equalsIgnoreCase("REFLECTION")) {
            return 10;
        }
        if (str.equalsIgnoreCase("SHININESS")) {
            return 6;
        }
        if (str.equalsIgnoreCase("SPECULAR")) {
            return 5;
        }
        return str.equalsIgnoreCase("TRANSPARENCY") ? 9 : 0;
    }

    /* access modifiers changed from: protected */
    public Color parseColor(JsonValue jsonValue) {
        if (jsonValue.size >= 3) {
            return new Color(jsonValue.getFloat(0), jsonValue.getFloat(1), jsonValue.getFloat(2), 1.0f);
        }
        throw new GdxRuntimeException("Expected Color values <> than three.");
    }

    /* access modifiers changed from: protected */
    public Vector2 readVector2(JsonValue jsonValue, float f, float f2) {
        if (jsonValue == null) {
            return new Vector2(f, f2);
        }
        if (jsonValue.size == 2) {
            return new Vector2(jsonValue.getFloat(0), jsonValue.getFloat(1));
        }
        throw new GdxRuntimeException("Expected Vector2 values <> than two.");
    }

    /* access modifiers changed from: protected */
    public Array<ModelNode> parseNodes(ModelData modelData, JsonValue jsonValue) {
        JsonValue jsonValue2 = jsonValue.get("nodes");
        if (jsonValue2 != null) {
            modelData.nodes.ensureCapacity(jsonValue2.size);
            for (JsonValue jsonValue3 = jsonValue2.child; jsonValue3 != null; jsonValue3 = jsonValue3.next) {
                modelData.nodes.add(parseNodesRecursively(jsonValue3));
            }
        }
        return modelData.nodes;
    }

    /* access modifiers changed from: protected */
    public ModelNode parseNodesRecursively(JsonValue jsonValue) {
        Vector3 vector3;
        Quaternion quaternion;
        Vector3 vector32;
        String str;
        String str2;
        int i;
        G3dModelLoader g3dModelLoader = this;
        ModelNode modelNode = new ModelNode();
        String str3 = null;
        String string = jsonValue.getString("id", null);
        if (string != null) {
            modelNode.id = string;
            String str4 = "translation";
            JsonValue jsonValue2 = jsonValue.get(str4);
            if (jsonValue2 == null || jsonValue2.size == 3) {
                boolean z = true;
                if (jsonValue2 == null) {
                    vector3 = null;
                } else {
                    vector3 = new Vector3(jsonValue2.getFloat(0), jsonValue2.getFloat(1), jsonValue2.getFloat(2));
                }
                modelNode.translation = vector3;
                String str5 = "rotation";
                JsonValue jsonValue3 = jsonValue.get(str5);
                if (jsonValue3 == null || jsonValue3.size == 4) {
                    if (jsonValue3 == null) {
                        quaternion = null;
                    } else {
                        quaternion = new Quaternion(jsonValue3.getFloat(0), jsonValue3.getFloat(1), jsonValue3.getFloat(2), jsonValue3.getFloat(3));
                    }
                    modelNode.rotation = quaternion;
                    JsonValue jsonValue4 = jsonValue.get("scale");
                    if (jsonValue4 == null || jsonValue4.size == 3) {
                        if (jsonValue4 == null) {
                            vector32 = null;
                        } else {
                            vector32 = new Vector3(jsonValue4.getFloat(0), jsonValue4.getFloat(1), jsonValue4.getFloat(2));
                        }
                        modelNode.scale = vector32;
                        String string2 = jsonValue.getString("mesh", null);
                        if (string2 != null) {
                            modelNode.meshId = string2;
                        }
                        JsonValue jsonValue5 = jsonValue.get("parts");
                        if (jsonValue5 != null) {
                            modelNode.parts = new ModelNodePart[jsonValue5.size];
                            JsonValue jsonValue6 = jsonValue5.child;
                            int i2 = 0;
                            while (jsonValue6 != null) {
                                ModelNodePart modelNodePart = new ModelNodePart();
                                String string3 = jsonValue6.getString("meshpartid", str3);
                                String string4 = jsonValue6.getString("materialid", str3);
                                if (string3 == null || string4 == null) {
                                    throw new GdxRuntimeException("Node " + string + " part is missing meshPartId or materialId");
                                }
                                modelNodePart.materialId = string4;
                                modelNodePart.meshPartId = string3;
                                JsonValue jsonValue7 = jsonValue6.get("bones");
                                if (jsonValue7 != null) {
                                    modelNodePart.bones = new ArrayMap<>(z, jsonValue7.size, String.class, Matrix4.class);
                                    JsonValue jsonValue8 = jsonValue7.child;
                                    while (jsonValue8 != null) {
                                        String string5 = jsonValue8.getString("node", null);
                                        if (string5 != null) {
                                            Matrix4 matrix4 = new Matrix4();
                                            JsonValue jsonValue9 = jsonValue8.get(str4);
                                            if (jsonValue9 == null || jsonValue9.size < 3) {
                                                str = str4;
                                            } else {
                                                str = str4;
                                                matrix4.translate(jsonValue9.getFloat(0), jsonValue9.getFloat(1), jsonValue9.getFloat(2));
                                            }
                                            JsonValue jsonValue10 = jsonValue8.get(str5);
                                            if (jsonValue10 == null || jsonValue10.size < 4) {
                                                str2 = str5;
                                                i = 3;
                                            } else {
                                                str2 = str5;
                                                i = 3;
                                                matrix4.rotate(g3dModelLoader.tempQ.set(jsonValue10.getFloat(0), jsonValue10.getFloat(1), jsonValue10.getFloat(2), jsonValue10.getFloat(3)));
                                            }
                                            JsonValue jsonValue11 = jsonValue8.get("scale");
                                            if (jsonValue11 != null && jsonValue11.size >= i) {
                                                matrix4.scale(jsonValue11.getFloat(0), jsonValue11.getFloat(1), jsonValue11.getFloat(2));
                                            }
                                            modelNodePart.bones.put(string5, matrix4);
                                            jsonValue8 = jsonValue8.next;
                                            g3dModelLoader = this;
                                            str4 = str;
                                            str5 = str2;
                                        } else {
                                            throw new GdxRuntimeException("Bone node ID missing");
                                        }
                                    }
                                    continue;
                                }
                                modelNode.parts[i2] = modelNodePart;
                                jsonValue6 = jsonValue6.next;
                                i2++;
                                g3dModelLoader = this;
                                str4 = str4;
                                str5 = str5;
                                str3 = null;
                                z = true;
                            }
                        }
                        int i3 = 0;
                        JsonValue jsonValue12 = jsonValue.get("children");
                        if (jsonValue12 != null) {
                            modelNode.children = new ModelNode[jsonValue12.size];
                            JsonValue jsonValue13 = jsonValue12.child;
                            while (jsonValue13 != null) {
                                modelNode.children[i3] = parseNodesRecursively(jsonValue13);
                                jsonValue13 = jsonValue13.next;
                                i3++;
                            }
                        }
                        return modelNode;
                    }
                    throw new GdxRuntimeException("Node scale incomplete");
                }
                throw new GdxRuntimeException("Node rotation incomplete");
            }
            throw new GdxRuntimeException("Node translation incomplete");
        }
        throw new GdxRuntimeException("Node id missing.");
    }

    /* access modifiers changed from: protected */
    public void parseAnimations(ModelData modelData, JsonValue jsonValue) {
        ModelData modelData2 = modelData;
        JsonValue jsonValue2 = jsonValue.get("animations");
        if (jsonValue2 != null) {
            modelData2.animations.ensureCapacity(jsonValue2.size);
            JsonValue jsonValue3 = jsonValue2.child;
            while (jsonValue3 != null) {
                JsonValue jsonValue4 = jsonValue3.get("bones");
                if (jsonValue4 != null) {
                    ModelAnimation modelAnimation = new ModelAnimation();
                    modelData2.animations.add(modelAnimation);
                    modelAnimation.nodeAnimations.ensureCapacity(jsonValue4.size);
                    modelAnimation.id = jsonValue3.getString("id");
                    for (JsonValue jsonValue5 = jsonValue4.child; jsonValue5 != null; jsonValue5 = jsonValue5.next) {
                        ModelNodeAnimation modelNodeAnimation = new ModelNodeAnimation();
                        modelAnimation.nodeAnimations.add(modelNodeAnimation);
                        modelNodeAnimation.nodeId = jsonValue5.getString("boneId");
                        JsonValue jsonValue6 = jsonValue5.get("keyframes");
                        float f = 1000.0f;
                        float f2 = 0.0f;
                        int i = 2;
                        int i2 = 1;
                        int i3 = 0;
                        int i4 = 3;
                        if (jsonValue6 == null || !jsonValue6.isArray()) {
                            JsonValue jsonValue7 = jsonValue5.get("translation");
                            if (jsonValue7 != null && jsonValue7.isArray()) {
                                modelNodeAnimation.translation = new Array<>();
                                modelNodeAnimation.translation.ensureCapacity(jsonValue7.size);
                                for (JsonValue jsonValue8 = jsonValue7.child; jsonValue8 != null; jsonValue8 = jsonValue8.next) {
                                    ModelNodeKeyframe<Vector3> modelNodeKeyframe = new ModelNodeKeyframe<>();
                                    modelNodeAnimation.translation.add(modelNodeKeyframe);
                                    modelNodeKeyframe.keytime = jsonValue8.getFloat("keytime", 0.0f) / 1000.0f;
                                    JsonValue jsonValue9 = jsonValue8.get("value");
                                    if (jsonValue9 != null && jsonValue9.size >= 3) {
                                        modelNodeKeyframe.value = (T) new Vector3(jsonValue9.getFloat(0), jsonValue9.getFloat(1), jsonValue9.getFloat(2));
                                    }
                                }
                            }
                            JsonValue jsonValue10 = jsonValue5.get("rotation");
                            if (jsonValue10 != null && jsonValue10.isArray()) {
                                modelNodeAnimation.rotation = new Array<>();
                                modelNodeAnimation.rotation.ensureCapacity(jsonValue10.size);
                                for (JsonValue jsonValue11 = jsonValue10.child; jsonValue11 != null; jsonValue11 = jsonValue11.next) {
                                    ModelNodeKeyframe<Quaternion> modelNodeKeyframe2 = new ModelNodeKeyframe<>();
                                    modelNodeAnimation.rotation.add(modelNodeKeyframe2);
                                    modelNodeKeyframe2.keytime = jsonValue11.getFloat("keytime", 0.0f) / 1000.0f;
                                    JsonValue jsonValue12 = jsonValue11.get("value");
                                    if (jsonValue12 != null) {
                                        if (jsonValue12.size >= 4) {
                                            modelNodeKeyframe2.value = (T) new Quaternion(jsonValue12.getFloat(0), jsonValue12.getFloat(1), jsonValue12.getFloat(2), jsonValue12.getFloat(3));
                                        }
                                    }
                                }
                            }
                            JsonValue jsonValue13 = jsonValue5.get("scaling");
                            if (jsonValue13 != null && jsonValue13.isArray()) {
                                modelNodeAnimation.scaling = new Array<>();
                                modelNodeAnimation.scaling.ensureCapacity(jsonValue13.size);
                                for (JsonValue jsonValue14 = jsonValue13.child; jsonValue14 != null; jsonValue14 = jsonValue14.next) {
                                    ModelNodeKeyframe<Vector3> modelNodeKeyframe3 = new ModelNodeKeyframe<>();
                                    modelNodeAnimation.scaling.add(modelNodeKeyframe3);
                                    modelNodeKeyframe3.keytime = jsonValue14.getFloat("keytime", 0.0f) / 1000.0f;
                                    JsonValue jsonValue15 = jsonValue14.get("value");
                                    if (jsonValue15 != null) {
                                        if (jsonValue15.size >= 3) {
                                            modelNodeKeyframe3.value = (T) new Vector3(jsonValue15.getFloat(0), jsonValue15.getFloat(1), jsonValue15.getFloat(2));
                                        }
                                    }
                                }
                            }
                        } else {
                            JsonValue jsonValue16 = jsonValue6.child;
                            while (jsonValue16 != null) {
                                float f3 = jsonValue16.getFloat("keytime", f2) / f;
                                JsonValue jsonValue17 = jsonValue16.get("translation");
                                if (jsonValue17 != null && jsonValue17.size == i4) {
                                    if (modelNodeAnimation.translation == null) {
                                        modelNodeAnimation.translation = new Array<>();
                                    }
                                    ModelNodeKeyframe<Vector3> modelNodeKeyframe4 = new ModelNodeKeyframe<>();
                                    modelNodeKeyframe4.keytime = f3;
                                    modelNodeKeyframe4.value = (T) new Vector3(jsonValue17.getFloat(i3), jsonValue17.getFloat(i2), jsonValue17.getFloat(i));
                                    modelNodeAnimation.translation.add(modelNodeKeyframe4);
                                }
                                JsonValue jsonValue18 = jsonValue16.get("rotation");
                                if (jsonValue18 != null && jsonValue18.size == 4) {
                                    if (modelNodeAnimation.rotation == null) {
                                        modelNodeAnimation.rotation = new Array<>();
                                    }
                                    ModelNodeKeyframe<Quaternion> modelNodeKeyframe5 = new ModelNodeKeyframe<>();
                                    modelNodeKeyframe5.keytime = f3;
                                    modelNodeKeyframe5.value = (T) new Quaternion(jsonValue18.getFloat(0), jsonValue18.getFloat(i2), jsonValue18.getFloat(i), jsonValue18.getFloat(3));
                                    modelNodeAnimation.rotation.add(modelNodeKeyframe5);
                                }
                                JsonValue jsonValue19 = jsonValue16.get("scale");
                                if (jsonValue19 != null && jsonValue19.size == 3) {
                                    if (modelNodeAnimation.scaling == null) {
                                        modelNodeAnimation.scaling = new Array<>();
                                    }
                                    ModelNodeKeyframe<Vector3> modelNodeKeyframe6 = new ModelNodeKeyframe<>();
                                    modelNodeKeyframe6.keytime = f3;
                                    modelNodeKeyframe6.value = (T) new Vector3(jsonValue19.getFloat(0), jsonValue19.getFloat(1), jsonValue19.getFloat(2));
                                    modelNodeAnimation.scaling.add(modelNodeKeyframe6);
                                }
                                jsonValue16 = jsonValue16.next;
                                f = 1000.0f;
                                f2 = 0.0f;
                                i = 2;
                                i2 = 1;
                                i3 = 0;
                                i4 = 3;
                            }
                        }
                    }
                }
                jsonValue3 = jsonValue3.next;
                modelData2 = modelData;
            }
        }
    }
}
