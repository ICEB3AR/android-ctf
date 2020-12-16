package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class LabelVO extends MainItemVO {
    public int align;
    public float height = 0.0f;
    public boolean multiline = false;
    public int size;
    public String style = BuildConfig.FLAVOR;
    public String text = "Label";
    public float width = 0.0f;

    public LabelVO() {
    }

    public LabelVO(LabelVO labelVO) {
        super(labelVO);
        this.text = new String(labelVO.text);
        this.style = new String(labelVO.style);
        this.size = labelVO.size;
        this.align = labelVO.align;
        this.width = labelVO.width;
        this.height = labelVO.height;
        this.multiline = labelVO.multiline;
    }
}
