package com.uwsoft.editor.renderer.data;

import com.alles.platformer.BuildConfig;

public class TextBoxVO extends MainItemVO {
    public String defaultText = BuildConfig.FLAVOR;
    public float height = 0.0f;
    public String style = BuildConfig.FLAVOR;
    public float width = 0.0f;

    public TextBoxVO() {
    }

    public TextBoxVO(TextBoxVO textBoxVO) {
        super(textBoxVO);
        this.defaultText = new String(textBoxVO.defaultText);
        this.width = textBoxVO.width;
        this.height = textBoxVO.height;
        this.style = new String(textBoxVO.style);
    }
}
