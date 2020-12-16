package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;
import java.util.ArrayList;

public class SelectBoxVO extends MainItemVO {
    public float height = 0.0f;
    public ArrayList<String> list = new ArrayList<>();
    public String style = BuildConfig.FLAVOR;
    public float width = 0.0f;

    public SelectBoxVO() {
    }

    public SelectBoxVO(SelectBoxVO selectBoxVO) {
        super(selectBoxVO);
        this.width = selectBoxVO.width;
        this.height = selectBoxVO.height;
        this.style = new String(selectBoxVO.style);
    }
}
