package com.uwsoft.editor.renderer.actor;

import com.badlogic.gdx.physics.box2d.Body;
import com.uwsoft.editor.renderer.data.MainItemVO;
import com.uwsoft.editor.renderer.utils.CustomVariables;

public interface IBaseItem {
    void applyResolution(float f, float f2);

    void dispose();

    Body getBody();

    CustomVariables getCustomVariables();

    MainItemVO getDataVO();

    int getLayerIndex();

    CompositeItem getParentItem();

    boolean isComposite();

    boolean isLockedByLayer();

    void renew();

    void setBody(Body body);

    void setLayerIndex(int i);

    void setLockByLayer(boolean z);

    void setParentItem(CompositeItem compositeItem);

    void updateDataVO();
}
