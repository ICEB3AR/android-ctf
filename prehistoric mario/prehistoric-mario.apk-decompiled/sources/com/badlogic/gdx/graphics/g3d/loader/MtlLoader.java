package com.badlogic.gdx.graphics.g3d.loader;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.g3d.model.data.ModelMaterial;
import com.badlogic.gdx.graphics.g3d.model.data.ModelTexture;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.StreamUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;

/* access modifiers changed from: package-private */
/* compiled from: ObjLoader */
public class MtlLoader {
    public Array<ModelMaterial> materials = new Array<>();

    MtlLoader() {
    }

    public void load(FileHandle fileHandle) {
        Color color = Color.WHITE;
        Color color2 = Color.WHITE;
        if (fileHandle != null && fileHandle.exists()) {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileHandle.read()), StreamUtils.DEFAULT_BUFFER_SIZE);
            String str = null;
            float f = 1.0f;
            float f2 = 0.0f;
            Color color3 = color2;
            Color color4 = color;
            String str2 = "default";
            while (true) {
                try {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    }
                    if (readLine.length() > 0 && readLine.charAt(0) == '\t') {
                        readLine = readLine.substring(1).trim();
                    }
                    String[] split = readLine.split("\\s+");
                    if (split[0].length() != 0) {
                        if (split[0].charAt(0) != '#') {
                            String lowerCase = split[0].toLowerCase();
                            if (lowerCase.equals("newmtl")) {
                                ModelMaterial modelMaterial = new ModelMaterial();
                                modelMaterial.id = str2;
                                modelMaterial.diffuse = new Color(color4);
                                modelMaterial.specular = new Color(color3);
                                modelMaterial.opacity = f;
                                modelMaterial.shininess = f2;
                                if (str != null) {
                                    ModelTexture modelTexture = new ModelTexture();
                                    modelTexture.usage = 2;
                                    modelTexture.fileName = new String(str);
                                    if (modelMaterial.textures == null) {
                                        modelMaterial.textures = new Array<>(1);
                                    }
                                    modelMaterial.textures.add(modelTexture);
                                }
                                this.materials.add(modelMaterial);
                                if (split.length > 1) {
                                    str2 = split[1].replace('.', '_');
                                } else {
                                    str2 = "default";
                                }
                                color4 = Color.WHITE;
                                color3 = Color.WHITE;
                                f = 1.0f;
                                f2 = 0.0f;
                            } else {
                                if (!lowerCase.equals("kd")) {
                                    if (!lowerCase.equals("ks")) {
                                        if (!lowerCase.equals("tr")) {
                                            if (!lowerCase.equals("d")) {
                                                if (lowerCase.equals("ns")) {
                                                    f2 = Float.parseFloat(split[1]);
                                                } else if (lowerCase.equals("map_kd")) {
                                                    str = fileHandle.parent().child(split[1]).path();
                                                }
                                            }
                                        }
                                        f = Float.parseFloat(split[1]);
                                    }
                                }
                                float parseFloat = Float.parseFloat(split[1]);
                                float parseFloat2 = Float.parseFloat(split[2]);
                                float parseFloat3 = Float.parseFloat(split[3]);
                                float parseFloat4 = split.length > 4 ? Float.parseFloat(split[4]) : 1.0f;
                                if (split[0].toLowerCase().equals("kd")) {
                                    color4 = new Color();
                                    color4.set(parseFloat, parseFloat2, parseFloat3, parseFloat4);
                                } else {
                                    color3 = new Color();
                                    color3.set(parseFloat, parseFloat2, parseFloat3, parseFloat4);
                                }
                            }
                        }
                    }
                } catch (IOException unused) {
                    return;
                }
            }
            bufferedReader.close();
            ModelMaterial modelMaterial2 = new ModelMaterial();
            modelMaterial2.id = str2;
            modelMaterial2.diffuse = new Color(color4);
            modelMaterial2.specular = new Color(color3);
            modelMaterial2.opacity = f;
            modelMaterial2.shininess = f2;
            if (str != null) {
                ModelTexture modelTexture2 = new ModelTexture();
                modelTexture2.usage = 2;
                modelTexture2.fileName = new String(str);
                if (modelMaterial2.textures == null) {
                    modelMaterial2.textures = new Array<>(1);
                }
                modelMaterial2.textures.add(modelTexture2);
            }
            this.materials.add(modelMaterial2);
        }
    }

    public ModelMaterial getMaterial(String str) {
        Iterator<ModelMaterial> it = this.materials.iterator();
        while (it.hasNext()) {
            ModelMaterial next = it.next();
            if (next.id.equals(str)) {
                return next;
            }
        }
        ModelMaterial modelMaterial = new ModelMaterial();
        modelMaterial.id = str;
        modelMaterial.diffuse = new Color(Color.WHITE);
        this.materials.add(modelMaterial);
        return modelMaterial;
    }
}
