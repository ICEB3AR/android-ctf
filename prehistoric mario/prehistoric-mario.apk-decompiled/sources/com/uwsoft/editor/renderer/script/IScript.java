package com.uwsoft.editor.renderer.script;

import com.uwsoft.editor.renderer.actor.CompositeItem;

public interface IScript {
    void act(float f);

    void dispose();

    void init(CompositeItem compositeItem);
}
