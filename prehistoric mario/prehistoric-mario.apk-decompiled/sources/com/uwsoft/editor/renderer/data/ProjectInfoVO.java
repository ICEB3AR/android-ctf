package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;

public class ProjectInfoVO {
    public HashMap<String, String> assetMeshMap = new HashMap<>();
    public HashMap<String, MeshVO> meshes = new HashMap<>();
    public ResolutionEntryVO originalResolution = new ResolutionEntryVO();
    public ArrayList<ResolutionEntryVO> resolutions = new ArrayList<>();
    public ArrayList<SceneVO> scenes = new ArrayList<>();

    public String constructJsonString() {
        Json json = new Json();
        json.setOutputType(JsonWriter.OutputType.json);
        String json2 = json.toJson(this);
        json.prettyPrint(json2);
        return json2;
    }

    public ResolutionEntryVO getResolution(String str) {
        Iterator<ResolutionEntryVO> it = this.resolutions.iterator();
        while (it.hasNext()) {
            ResolutionEntryVO next = it.next();
            if (next.name.equalsIgnoreCase(str)) {
                return next;
            }
        }
        return null;
    }

    public String addNewMesh(MeshVO meshVO) {
        HashMap<String, MeshVO> hashMap = this.meshes;
        int parseInt = (hashMap == null || hashMap.size() == 0) ? -1 : Integer.parseInt((String) Collections.max(this.meshes.keySet(), new Comparator<String>() {
            /* class com.uwsoft.editor.renderer.data.ProjectInfoVO.AnonymousClass1 */

            public int compare(String str, String str2) {
                return Integer.valueOf(str).compareTo(Integer.valueOf(str2));
            }
        }));
        HashMap<String, MeshVO> hashMap2 = this.meshes;
        StringBuilder sb = new StringBuilder();
        int i = parseInt + 1;
        sb.append(i);
        sb.append(BuildConfig.FLAVOR);
        hashMap2.put(sb.toString(), meshVO);
        return i + BuildConfig.FLAVOR;
    }

    public String cloneMesh(String str) {
        MeshVO meshVO = this.meshes.get(str);
        if (meshVO == null) {
            return str;
        }
        return addNewMesh(meshVO.clone());
    }
}
