package com.uwsoft.editor.renderer.spine;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.g2d.Batch;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import com.uwsoft.editor.renderer.data.SpineVO;
import com.uwsoft.editor.renderer.resources.IResourceRetriever;
import java.lang.reflect.InvocationTargetException;

public class SpineDataHelper {
    public float height;
    private float minX;
    private float minY;
    private SpineReflectionHelper reflectionData;
    private Object renderer;
    private Object skeletonData;
    private Object skeletonObject;
    public Object stateObject;
    public float width;

    public void initSpine(SpineVO spineVO, IResourceRetriever iResourceRetriever, SpineReflectionHelper spineReflectionHelper, float f) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, ReflectionException {
        this.renderer = spineReflectionHelper.skeletonRendererObject;
        this.reflectionData = spineReflectionHelper;
        Object newInstance = this.reflectionData.skeletonJsonConstructorAccess.newInstance(iResourceRetriever.getSkeletonAtlas(spineVO.animationName));
        ClassReflection.getMethod(this.reflectionData.skeletonJsonClass, "setScale", Float.TYPE).invoke(newInstance, Float.valueOf(spineVO.scaleX * f));
        this.skeletonData = ClassReflection.getMethod(this.reflectionData.skeletonJsonClass, "readSkeletonData", FileHandle.class).invoke(newInstance, iResourceRetriever.getSkeletonJSON(spineVO.animationName));
        this.skeletonObject = this.reflectionData.skeletonConstructorAccess.newInstance(this.skeletonData);
        Object newInstance2 = this.reflectionData.animationStateDataConstructorAccess.newInstance(this.skeletonData);
        computeBoundBox();
        this.stateObject = this.reflectionData.animationStateConstructorAccess.newInstance(newInstance2);
        setAnimation((String) this.reflectionData.getAnimNameMethodIndex.invoke(((Array) this.reflectionData.getAnimationMethodIndex.invoke(this.skeletonData, new Object[0])).get(0), new Object[0]));
    }

    private void computeBoundBox() throws ReflectionException {
        this.reflectionData.updateWorldTransformMethodIndex.invoke(this.skeletonObject, new Object[0]);
        this.minX = Float.MAX_VALUE;
        this.minY = Float.MAX_VALUE;
        Array array = (Array) this.reflectionData.getSlotsMethodIndex.invoke(this.skeletonObject, new Object[0]);
        int i = array.size;
        float f = Float.MIN_VALUE;
        float f2 = Float.MIN_VALUE;
        for (int i2 = 0; i2 < i; i2++) {
            Object obj = array.get(i2);
            Object invoke = this.reflectionData.getAttachmentMethodIndex.invoke(obj, new Object[0]);
            if (invoke != null && this.reflectionData.regionAttachmentClass.isInstance(invoke)) {
                this.reflectionData.updateWorldVerticesMethodIndex.invoke(invoke, obj, false);
                float[] fArr = (float[]) this.reflectionData.getWorldVerticesIndex.invoke(invoke, new Object[0]);
                int length = fArr.length;
                float f3 = f2;
                float f4 = f;
                for (int i3 = 0; i3 < length; i3 += 5) {
                    this.minX = Math.min(this.minX, fArr[i3]);
                    int i4 = i3 + 1;
                    this.minY = Math.min(this.minY, fArr[i4]);
                    f4 = Math.max(f4, fArr[i3]);
                    f3 = Math.max(f3, fArr[i4]);
                }
                f = f4;
                f2 = f3;
            }
        }
        this.width = f - this.minX;
        this.height = f2 - this.minY;
    }

    public void setAnimation(String str) {
        if (str == null) {
            System.out.println("NO ANIM NAME");
            return;
        }
        try {
            this.reflectionData.setAnimationMethodIndex.invoke(this.stateObject, 0, str, true);
        } catch (ReflectionException e) {
            e.printStackTrace();
        }
    }

    public Array<Object> getAnimations() {
        try {
            return (Array) this.reflectionData.getAnimationMethodIndex.invoke(this.skeletonData, new Object[0]);
        } catch (ReflectionException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void draw(Batch batch, float f) {
        try {
            this.reflectionData.skeletonRendererDrawMethodIndex.invoke(this.renderer, batch, this.skeletonObject);
        } catch (ReflectionException unused) {
        }
    }

    public void act(float f, float f2, float f3) {
        try {
            this.reflectionData.updateWorldTransformMethodIndex.invoke(this.skeletonObject, new Object[0]);
            this.reflectionData.updateMethodIndex.invoke(this.stateObject, Float.valueOf(f));
            this.reflectionData.applyMethodIndex.invoke(this.stateObject, this.skeletonObject);
            this.reflectionData.setPositionMethodIndex.invoke(this.skeletonObject, Float.valueOf(f2 - this.minX), Float.valueOf(f3 - this.minY));
        } catch (ReflectionException unused) {
        }
    }
}
