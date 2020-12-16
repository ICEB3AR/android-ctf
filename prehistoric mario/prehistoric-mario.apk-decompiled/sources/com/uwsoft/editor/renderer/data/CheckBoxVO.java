package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class CheckBoxVO extends MainItemVO {
    public String style = BuildConfig.FLAVOR;
    public String text = "Label";

    public CheckBoxVO() {
    }

    public CheckBoxVO(CheckBoxVO checkBoxVO) {
        super(checkBoxVO);
        this.text = new String(checkBoxVO.text);
        this.style = new String(checkBoxVO.style);
    }
}
