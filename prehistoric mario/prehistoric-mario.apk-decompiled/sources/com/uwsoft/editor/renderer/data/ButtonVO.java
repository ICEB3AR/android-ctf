package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class ButtonVO extends MainItemVO {
    public String style = BuildConfig.FLAVOR;
    public String text = "Button";

    public ButtonVO() {
    }

    public ButtonVO(ButtonVO buttonVO) {
        super(buttonVO);
        this.text = new String(buttonVO.text);
        this.style = new String(buttonVO.style);
    }
}
