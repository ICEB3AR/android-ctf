package com.badlogic.gdx.backends.android.surfaceview;

import android.annotation.TargetApi;
import android.content.Context;
import android.opengl.GLSurfaceView;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18;
import com.badlogic.gdx.backends.android.surfaceview.ResolutionStrategy;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;

public class GLSurfaceView20API18 extends GLSurfaceViewAPI18 {
    private static final boolean DEBUG = false;
    static String TAG = "GL2JNIView";
    final ResolutionStrategy resolutionStrategy;

    public GLSurfaceView20API18(Context context, ResolutionStrategy resolutionStrategy2) {
        super(context);
        this.resolutionStrategy = resolutionStrategy2;
        init(false, 16, 0);
    }

    public GLSurfaceView20API18(Context context, boolean z, int i, int i2, ResolutionStrategy resolutionStrategy2) {
        super(context);
        this.resolutionStrategy = resolutionStrategy2;
        init(z, i, i2);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        ResolutionStrategy.MeasuredDimension calcMeasures = this.resolutionStrategy.calcMeasures(i, i2);
        setMeasuredDimension(calcMeasures.width, calcMeasures.height);
    }

    public InputConnection onCreateInputConnection(EditorInfo editorInfo) {
        if (editorInfo != null) {
            editorInfo.imeOptions |= 268435456;
        }
        return new BaseInputConnection(this, false) {
            /* class com.badlogic.gdx.backends.android.surfaceview.GLSurfaceView20API18.AnonymousClass1 */

            public boolean deleteSurroundingText(int i, int i2) {
                if (Build.VERSION.SDK_INT < 16 || i != 1 || i2 != 0) {
                    return super.deleteSurroundingText(i, i2);
                }
                sendDownUpKeyEventForBackwardCompatibility(67);
                return true;
            }

            @TargetApi(16)
            private void sendDownUpKeyEventForBackwardCompatibility(int i) {
                long uptimeMillis = SystemClock.uptimeMillis();
                super.sendKeyEvent(new KeyEvent(uptimeMillis, uptimeMillis, 0, i, 0, 0, -1, 0, 6));
                super.sendKeyEvent(new KeyEvent(SystemClock.uptimeMillis(), uptimeMillis, 1, i, 0, 0, -1, 0, 6));
            }
        };
    }

    private void init(boolean z, int i, int i2) {
        if (z) {
            getHolder().setFormat(-3);
        }
        setEGLContextFactory(new ContextFactory());
        setEGLConfigChooser(z ? new ConfigChooser(8, 8, 8, 8, i, i2) : new ConfigChooser(5, 6, 5, 0, i, i2));
    }

    /* access modifiers changed from: package-private */
    public static class ContextFactory implements GLSurfaceViewAPI18.EGLContextFactory {
        private static int EGL_CONTEXT_CLIENT_VERSION = 12440;

        ContextFactory() {
        }

        @Override // com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18.EGLContextFactory
        public EGLContext createContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig) {
            Log.w(GLSurfaceView20API18.TAG, "creating OpenGL ES 2.0 context");
            GLSurfaceView20API18.checkEglError("Before eglCreateContext", egl10);
            EGLContext eglCreateContext = egl10.eglCreateContext(eGLDisplay, eGLConfig, EGL10.EGL_NO_CONTEXT, new int[]{EGL_CONTEXT_CLIENT_VERSION, 2, 12344});
            GLSurfaceView20API18.checkEglError("After eglCreateContext", egl10);
            return eglCreateContext;
        }

        @Override // com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18.EGLContextFactory
        public void destroyContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLContext eGLContext) {
            egl10.eglDestroyContext(eGLDisplay, eGLContext);
        }
    }

    static void checkEglError(String str, EGL10 egl10) {
        while (true) {
            int eglGetError = egl10.eglGetError();
            if (eglGetError != 12288) {
                Log.e(TAG, String.format("%s: EGL error: 0x%x", str, Integer.valueOf(eglGetError)));
            } else {
                return;
            }
        }
    }

    /* access modifiers changed from: private */
    public static class ConfigChooser implements GLSurfaceView.EGLConfigChooser {
        private static int EGL_OPENGL_ES2_BIT = 4;
        private static int[] s_configAttribs2 = {12324, 4, 12323, 4, 12322, 4, 12352, EGL_OPENGL_ES2_BIT, 12344};
        protected int mAlphaSize;
        protected int mBlueSize;
        protected int mDepthSize;
        protected int mGreenSize;
        protected int mRedSize;
        protected int mStencilSize;
        private int[] mValue = new int[1];

        public ConfigChooser(int i, int i2, int i3, int i4, int i5, int i6) {
            this.mRedSize = i;
            this.mGreenSize = i2;
            this.mBlueSize = i3;
            this.mAlphaSize = i4;
            this.mDepthSize = i5;
            this.mStencilSize = i6;
        }

        public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
            int[] iArr = new int[1];
            egl10.eglChooseConfig(eGLDisplay, s_configAttribs2, null, 0, iArr);
            int i = iArr[0];
            if (i > 0) {
                EGLConfig[] eGLConfigArr = new EGLConfig[i];
                egl10.eglChooseConfig(eGLDisplay, s_configAttribs2, eGLConfigArr, i, iArr);
                return chooseConfig(egl10, eGLDisplay, eGLConfigArr);
            }
            throw new IllegalArgumentException("No configs match configSpec");
        }

        public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr) {
            for (EGLConfig eGLConfig : eGLConfigArr) {
                int findConfigAttrib = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12325, 0);
                int findConfigAttrib2 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12326, 0);
                if (findConfigAttrib >= this.mDepthSize && findConfigAttrib2 >= this.mStencilSize) {
                    int findConfigAttrib3 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12324, 0);
                    int findConfigAttrib4 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12323, 0);
                    int findConfigAttrib5 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12322, 0);
                    int findConfigAttrib6 = findConfigAttrib(egl10, eGLDisplay, eGLConfig, 12321, 0);
                    if (findConfigAttrib3 == this.mRedSize && findConfigAttrib4 == this.mGreenSize && findConfigAttrib5 == this.mBlueSize && findConfigAttrib6 == this.mAlphaSize) {
                        return eGLConfig;
                    }
                }
            }
            return null;
        }

        private int findConfigAttrib(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, int i, int i2) {
            return egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, i, this.mValue) ? this.mValue[0] : i2;
        }

        private void printConfigs(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr) {
            int length = eGLConfigArr.length;
            Log.w(GLSurfaceView20API18.TAG, String.format("%d configurations", Integer.valueOf(length)));
            for (int i = 0; i < length; i++) {
                Log.w(GLSurfaceView20API18.TAG, String.format("Configuration %d:\n", Integer.valueOf(i)));
                printConfig(egl10, eGLDisplay, eGLConfigArr[i]);
            }
        }

        private void printConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig) {
            int[] iArr = {12320, 12321, 12322, 12323, 12324, 12325, 12326, 12327, 12328, 12329, 12330, 12331, 12332, 12333, 12334, 12335, 12336, 12337, 12338, 12339, 12340, 12343, 12342, 12341, 12345, 12346, 12347, 12348, 12349, 12350, 12351, 12352, 12354};
            String[] strArr = {"EGL_BUFFER_SIZE", "EGL_ALPHA_SIZE", "EGL_BLUE_SIZE", "EGL_GREEN_SIZE", "EGL_RED_SIZE", "EGL_DEPTH_SIZE", "EGL_STENCIL_SIZE", "EGL_CONFIG_CAVEAT", "EGL_CONFIG_ID", "EGL_LEVEL", "EGL_MAX_PBUFFER_HEIGHT", "EGL_MAX_PBUFFER_PIXELS", "EGL_MAX_PBUFFER_WIDTH", "EGL_NATIVE_RENDERABLE", "EGL_NATIVE_VISUAL_ID", "EGL_NATIVE_VISUAL_TYPE", "EGL_PRESERVED_RESOURCES", "EGL_SAMPLES", "EGL_SAMPLE_BUFFERS", "EGL_SURFACE_TYPE", "EGL_TRANSPARENT_TYPE", "EGL_TRANSPARENT_RED_VALUE", "EGL_TRANSPARENT_GREEN_VALUE", "EGL_TRANSPARENT_BLUE_VALUE", "EGL_BIND_TO_TEXTURE_RGB", "EGL_BIND_TO_TEXTURE_RGBA", "EGL_MIN_SWAP_INTERVAL", "EGL_MAX_SWAP_INTERVAL", "EGL_LUMINANCE_SIZE", "EGL_ALPHA_MASK_SIZE", "EGL_COLOR_BUFFER_TYPE", "EGL_RENDERABLE_TYPE", "EGL_CONFORMANT"};
            int[] iArr2 = new int[1];
            for (int i = 0; i < iArr.length; i++) {
                int i2 = iArr[i];
                String str = strArr[i];
                if (egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, i2, iArr2)) {
                    Log.w(GLSurfaceView20API18.TAG, String.format("  %s: %d\n", str, Integer.valueOf(iArr2[0])));
                } else {
                    do {
                    } while (egl10.eglGetError() != 12288);
                }
            }
        }
    }
}
