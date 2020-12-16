package com.uwsoft.editor.renderer.resources;

import com.uwsoft.editor.renderer.data.ProjectInfoVO;
import com.uwsoft.editor.renderer.data.SceneVO;

public interface IDataLoader {
    ProjectInfoVO loadProjectVO();

    SceneVO loadSceneVO(String str);
}
