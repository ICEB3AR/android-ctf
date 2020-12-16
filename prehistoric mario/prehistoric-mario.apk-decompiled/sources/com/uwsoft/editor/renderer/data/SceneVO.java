package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.utils.Json;
import com.badlogic.gdx.utils.JsonWriter;
import java.util.Arrays;
import java.util.HashMap;

public class SceneVO {
    public float[] ambientColor = {1.0f, 1.0f, 1.0f, 1.0f};
    public CompositeVO composite;
    public HashMap<String, CompositeItemVO> libraryItems = new HashMap<>();
    public PhysicsPropertiesVO physicsPropertiesVO = new PhysicsPropertiesVO();
    public String sceneName = BuildConfig.FLAVOR;

    public SceneVO() {
    }

    public SceneVO(SceneVO sceneVO) {
        this.sceneName = new String(sceneVO.sceneName);
        this.composite = new CompositeVO(sceneVO.composite);
        float[] fArr = sceneVO.ambientColor;
        this.ambientColor = Arrays.copyOf(fArr, fArr.length);
        this.physicsPropertiesVO = new PhysicsPropertiesVO(sceneVO.physicsPropertiesVO);
    }

    public String constructJsonString() {
        Json json = new Json();
        json.setOutputType(JsonWriter.OutputType.json);
        return json.toJson(this);
    }
}
