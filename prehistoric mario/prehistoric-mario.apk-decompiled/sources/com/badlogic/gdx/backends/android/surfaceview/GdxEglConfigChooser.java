package com.badlogic.gdx.backends.android.surfaceview;

import android.opengl.GLSurfaceView;
import android.util.Log;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;

public class GdxEglConfigChooser implements GLSurfaceView.EGLConfigChooser {
    public static final int EGL_COVERAGE_BUFFERS_NV = 12512;
    public static final int EGL_COVERAGE_SAMPLES_NV = 12513;
    private static final int EGL_OPENGL_ES2_BIT = 4;
    private static final String TAG = "GdxEglConfigChooser";
    protected int mAlphaSize;
    protected int mBlueSize;
    protected final int[] mConfigAttribs;
    protected int mDepthSize;
    protected int mGreenSize;
    protected int mNumSamples;
    protected int mRedSize;
    protected int mStencilSize;
    private int[] mValue = new int[1];

    public GdxEglConfigChooser(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        this.mRedSize = i;
        this.mGreenSize = i2;
        this.mBlueSize = i3;
        this.mAlphaSize = i4;
        this.mDepthSize = i5;
        this.mStencilSize = i6;
        this.mNumSamples = i7;
        this.mConfigAttribs = new int[]{12324, 4, 12323, 4, 12322, 4, 12352, 4, 12344};
    }

    public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
        int[] iArr = new int[1];
        egl10.eglChooseConfig(eGLDisplay, this.mConfigAttribs, null, 0, iArr);
        int i = iArr[0];
        if (i > 0) {
            EGLConfig[] eGLConfigArr = new EGLConfig[i];
            egl10.eglChooseConfig(eGLDisplay, this.mConfigAttribs, eGLConfigArr, i, iArr);
            return chooseConfig(egl10, eGLDisplay, eGLConfigArr);
        }
        throw new IllegalArgumentException("No configs match configSpec");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00e2, code lost:
        if (r5 == r19.mAlphaSize) goto L_0x00e4;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public javax.microedition.khronos.egl.EGLConfig chooseConfig(javax.microedition.khronos.egl.EGL10 r20, javax.microedition.khronos.egl.EGLDisplay r21, javax.microedition.khronos.egl.EGLConfig[] r22) {
        /*
        // Method dump skipped, instructions count: 252
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.backends.android.surfaceview.GdxEglConfigChooser.chooseConfig(javax.microedition.khronos.egl.EGL10, javax.microedition.khronos.egl.EGLDisplay, javax.microedition.khronos.egl.EGLConfig[]):javax.microedition.khronos.egl.EGLConfig");
    }

    private int findConfigAttrib(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, int i, int i2) {
        return egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, i, this.mValue) ? this.mValue[0] : i2;
    }

    private void printConfigs(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr) {
        int length = eGLConfigArr.length;
        Log.w(TAG, String.format("%d configurations", Integer.valueOf(length)));
        for (int i = 0; i < length; i++) {
            Log.w(TAG, String.format("Configuration %d:\n", Integer.valueOf(i)));
            printConfig(egl10, eGLDisplay, eGLConfigArr[i]);
        }
    }

    private void printConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig) {
        int[] iArr = {12320, 12321, 12322, 12323, 12324, 12325, 12326, 12327, 12328, 12329, 12330, 12331, 12332, 12333, 12334, 12335, 12336, 12337, 12338, 12339, 12340, 12343, 12342, 12341, 12345, 12346, 12347, 12348, 12349, 12350, 12351, 12352, 12354, EGL_COVERAGE_BUFFERS_NV, EGL_COVERAGE_SAMPLES_NV};
        String[] strArr = {"EGL_BUFFER_SIZE", "EGL_ALPHA_SIZE", "EGL_BLUE_SIZE", "EGL_GREEN_SIZE", "EGL_RED_SIZE", "EGL_DEPTH_SIZE", "EGL_STENCIL_SIZE", "EGL_CONFIG_CAVEAT", "EGL_CONFIG_ID", "EGL_LEVEL", "EGL_MAX_PBUFFER_HEIGHT", "EGL_MAX_PBUFFER_PIXELS", "EGL_MAX_PBUFFER_WIDTH", "EGL_NATIVE_RENDERABLE", "EGL_NATIVE_VISUAL_ID", "EGL_NATIVE_VISUAL_TYPE", "EGL_PRESERVED_RESOURCES", "EGL_SAMPLES", "EGL_SAMPLE_BUFFERS", "EGL_SURFACE_TYPE", "EGL_TRANSPARENT_TYPE", "EGL_TRANSPARENT_RED_VALUE", "EGL_TRANSPARENT_GREEN_VALUE", "EGL_TRANSPARENT_BLUE_VALUE", "EGL_BIND_TO_TEXTURE_RGB", "EGL_BIND_TO_TEXTURE_RGBA", "EGL_MIN_SWAP_INTERVAL", "EGL_MAX_SWAP_INTERVAL", "EGL_LUMINANCE_SIZE", "EGL_ALPHA_MASK_SIZE", "EGL_COLOR_BUFFER_TYPE", "EGL_RENDERABLE_TYPE", "EGL_CONFORMANT", "EGL_COVERAGE_BUFFERS_NV", "EGL_COVERAGE_SAMPLES_NV"};
        int[] iArr2 = new int[1];
        for (int i = 0; i < iArr.length; i++) {
            int i2 = iArr[i];
            String str = strArr[i];
            if (egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, i2, iArr2)) {
                Log.w(TAG, String.format("  %s: %d\n", str, Integer.valueOf(iArr2[0])));
            } else {
                egl10.eglGetError();
            }
        }
    }
}
