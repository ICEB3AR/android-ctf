package com.badlogic.gdx.backends.android;

import android.opengl.GLSurfaceView;
import android.os.Build;
import android.os.Process;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Graphics;
import com.badlogic.gdx.LifecycleListener;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceView20;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceView20API18;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18;
import com.badlogic.gdx.backends.android.surfaceview.GdxEglConfigChooser;
import com.badlogic.gdx.backends.android.surfaceview.ResolutionStrategy;
import com.badlogic.gdx.graphics.Cubemap;
import com.badlogic.gdx.graphics.Cursor;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.GL30;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.Pixmap;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.TextureArray;
import com.badlogic.gdx.graphics.glutils.FrameBuffer;
import com.badlogic.gdx.graphics.glutils.GLVersion;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.math.WindowedMean;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.SnapshotArray;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.opengles.GL10;

public class AndroidGraphics implements Graphics, GLSurfaceView.Renderer {
    private static final String LOG_TAG = "AndroidGraphics";
    static volatile boolean enforceContinuousRendering = false;
    AndroidApplicationBase app;
    private Graphics.BufferFormat bufferFormat;
    protected final AndroidApplicationConfiguration config;
    volatile boolean created;
    protected float deltaTime;
    private float density;
    volatile boolean destroy;
    EGLContext eglContext;
    String extensions;
    protected int fps;
    protected long frameId;
    protected long frameStart;
    protected int frames;
    GL20 gl20;
    GL30 gl30;
    GLVersion glVersion;
    int height;
    private boolean isContinuous;
    protected long lastFrameTime;
    protected WindowedMean mean;
    volatile boolean pause;
    private float ppcX;
    private float ppcY;
    private float ppiX;
    private float ppiY;
    volatile boolean resume;
    volatile boolean running;
    Object synch;
    int[] value;
    final View view;
    int width;

    @Override // com.badlogic.gdx.Graphics
    public boolean isFullscreen() {
        return true;
    }

    @Override // com.badlogic.gdx.Graphics
    public Cursor newCursor(Pixmap pixmap, int i, int i2) {
        return null;
    }

    @Override // com.badlogic.gdx.Graphics
    public void setCursor(Cursor cursor) {
    }

    @Override // com.badlogic.gdx.Graphics
    public boolean setFullscreenMode(Graphics.DisplayMode displayMode) {
        return false;
    }

    @Override // com.badlogic.gdx.Graphics
    public void setResizable(boolean z) {
    }

    @Override // com.badlogic.gdx.Graphics
    public void setSystemCursor(Cursor.SystemCursor systemCursor) {
    }

    @Override // com.badlogic.gdx.Graphics
    public void setTitle(String str) {
    }

    @Override // com.badlogic.gdx.Graphics
    public void setVSync(boolean z) {
    }

    @Override // com.badlogic.gdx.Graphics
    public boolean setWindowedMode(int i, int i2) {
        return false;
    }

    @Override // com.badlogic.gdx.Graphics
    public boolean supportsDisplayModeChange() {
        return false;
    }

    public AndroidGraphics(AndroidApplicationBase androidApplicationBase, AndroidApplicationConfiguration androidApplicationConfiguration, ResolutionStrategy resolutionStrategy) {
        this(androidApplicationBase, androidApplicationConfiguration, resolutionStrategy, true);
    }

    public AndroidGraphics(AndroidApplicationBase androidApplicationBase, AndroidApplicationConfiguration androidApplicationConfiguration, ResolutionStrategy resolutionStrategy, boolean z) {
        this.lastFrameTime = System.nanoTime();
        this.deltaTime = 0.0f;
        this.frameStart = System.nanoTime();
        this.frameId = -1;
        this.frames = 0;
        this.mean = new WindowedMean(5);
        this.created = false;
        this.running = false;
        this.pause = false;
        this.resume = false;
        this.destroy = false;
        this.ppiX = 0.0f;
        this.ppiY = 0.0f;
        this.ppcX = 0.0f;
        this.ppcY = 0.0f;
        this.density = 1.0f;
        this.bufferFormat = new Graphics.BufferFormat(5, 6, 5, 0, 16, 0, 0, false);
        this.isContinuous = true;
        this.value = new int[1];
        this.synch = new Object();
        this.config = androidApplicationConfiguration;
        this.app = androidApplicationBase;
        this.view = createGLSurfaceView(androidApplicationBase, resolutionStrategy);
        preserveEGLContextOnPause();
        if (z) {
            this.view.setFocusable(true);
            this.view.setFocusableInTouchMode(true);
        }
    }

    /* access modifiers changed from: protected */
    public void preserveEGLContextOnPause() {
        if ((Build.VERSION.SDK_INT >= 11 && (this.view instanceof GLSurfaceView20)) || (this.view instanceof GLSurfaceView20API18)) {
            try {
                this.view.getClass().getMethod("setPreserveEGLContextOnPause", Boolean.TYPE).invoke(this.view, true);
            } catch (Exception unused) {
                Gdx.app.log(LOG_TAG, "Method GLSurfaceView.setPreserveEGLContextOnPause not found");
            }
        }
    }

    /* access modifiers changed from: protected */
    public View createGLSurfaceView(AndroidApplicationBase androidApplicationBase, ResolutionStrategy resolutionStrategy) {
        if (checkGL20()) {
            GLSurfaceView.EGLConfigChooser eglConfigChooser = getEglConfigChooser();
            if (Build.VERSION.SDK_INT > 10 || !this.config.useGLSurfaceView20API18) {
                GLSurfaceView20 gLSurfaceView20 = new GLSurfaceView20(androidApplicationBase.getContext(), resolutionStrategy, this.config.useGL30 ? 3 : 2);
                if (eglConfigChooser != null) {
                    gLSurfaceView20.setEGLConfigChooser(eglConfigChooser);
                } else {
                    gLSurfaceView20.setEGLConfigChooser(this.config.r, this.config.g, this.config.b, this.config.a, this.config.depth, this.config.stencil);
                }
                gLSurfaceView20.setRenderer(this);
                return gLSurfaceView20;
            }
            GLSurfaceView20API18 gLSurfaceView20API18 = new GLSurfaceView20API18(androidApplicationBase.getContext(), resolutionStrategy);
            if (eglConfigChooser != null) {
                gLSurfaceView20API18.setEGLConfigChooser(eglConfigChooser);
            } else {
                gLSurfaceView20API18.setEGLConfigChooser(this.config.r, this.config.g, this.config.b, this.config.a, this.config.depth, this.config.stencil);
            }
            gLSurfaceView20API18.setRenderer(this);
            return gLSurfaceView20API18;
        }
        throw new GdxRuntimeException("Libgdx requires OpenGL ES 2.0");
    }

    public void onPauseGLSurfaceView() {
        View view2 = this.view;
        if (view2 != null) {
            if (view2 instanceof GLSurfaceViewAPI18) {
                ((GLSurfaceViewAPI18) view2).onPause();
            }
            View view3 = this.view;
            if (view3 instanceof GLSurfaceView) {
                ((GLSurfaceView) view3).onPause();
            }
        }
    }

    public void onResumeGLSurfaceView() {
        View view2 = this.view;
        if (view2 != null) {
            if (view2 instanceof GLSurfaceViewAPI18) {
                ((GLSurfaceViewAPI18) view2).onResume();
            }
            View view3 = this.view;
            if (view3 instanceof GLSurfaceView) {
                ((GLSurfaceView) view3).onResume();
            }
        }
    }

    /* access modifiers changed from: protected */
    public GLSurfaceView.EGLConfigChooser getEglConfigChooser() {
        return new GdxEglConfigChooser(this.config.r, this.config.g, this.config.b, this.config.a, this.config.depth, this.config.stencil, this.config.numSamples);
    }

    /* access modifiers changed from: protected */
    public void updatePpi() {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        this.app.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        this.ppiX = displayMetrics.xdpi;
        this.ppiY = displayMetrics.ydpi;
        this.ppcX = displayMetrics.xdpi / 2.54f;
        this.ppcY = displayMetrics.ydpi / 2.54f;
        this.density = displayMetrics.density;
    }

    /* access modifiers changed from: protected */
    public boolean checkGL20() {
        EGL10 egl10 = (EGL10) EGLContext.getEGL();
        EGLDisplay eglGetDisplay = egl10.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
        egl10.eglInitialize(eglGetDisplay, new int[2]);
        int[] iArr = new int[1];
        egl10.eglChooseConfig(eglGetDisplay, new int[]{12324, 4, 12323, 4, 12322, 4, 12352, 4, 12344}, new EGLConfig[10], 10, iArr);
        egl10.eglTerminate(eglGetDisplay);
        if (iArr[0] > 0) {
            return true;
        }
        return false;
    }

    @Override // com.badlogic.gdx.Graphics
    public GL20 getGL20() {
        return this.gl20;
    }

    @Override // com.badlogic.gdx.Graphics
    public void setGL20(GL20 gl202) {
        this.gl20 = gl202;
        if (this.gl30 == null) {
            Gdx.gl = gl202;
            Gdx.gl20 = gl202;
        }
    }

    @Override // com.badlogic.gdx.Graphics
    public boolean isGL30Available() {
        return this.gl30 != null;
    }

    @Override // com.badlogic.gdx.Graphics
    public GL30 getGL30() {
        return this.gl30;
    }

    @Override // com.badlogic.gdx.Graphics
    public void setGL30(GL30 gl302) {
        this.gl30 = gl302;
        if (gl302 != null) {
            this.gl20 = gl302;
            GL20 gl202 = this.gl20;
            Gdx.gl = gl202;
            Gdx.gl20 = gl202;
            Gdx.gl30 = gl302;
        }
    }

    @Override // com.badlogic.gdx.Graphics
    public int getHeight() {
        return this.height;
    }

    @Override // com.badlogic.gdx.Graphics
    public int getWidth() {
        return this.width;
    }

    @Override // com.badlogic.gdx.Graphics
    public int getBackBufferWidth() {
        return this.width;
    }

    @Override // com.badlogic.gdx.Graphics
    public int getBackBufferHeight() {
        return this.height;
    }

    /* access modifiers changed from: protected */
    public void setupGL(GL10 gl10) {
        this.glVersion = new GLVersion(Application.ApplicationType.Android, gl10.glGetString(GL20.GL_VERSION), gl10.glGetString(GL20.GL_VENDOR), gl10.glGetString(GL20.GL_RENDERER));
        if (!this.config.useGL30 || this.glVersion.getMajorVersion() <= 2) {
            if (this.gl20 == null) {
                this.gl20 = new AndroidGL20();
                GL20 gl202 = this.gl20;
                Gdx.gl = gl202;
                Gdx.gl20 = gl202;
            } else {
                return;
            }
        } else if (this.gl30 == null) {
            AndroidGL30 androidGL30 = new AndroidGL30();
            this.gl30 = androidGL30;
            this.gl20 = androidGL30;
            GL30 gl302 = this.gl30;
            Gdx.gl = gl302;
            Gdx.gl20 = gl302;
            Gdx.gl30 = gl302;
        } else {
            return;
        }
        Application application = Gdx.app;
        application.log(LOG_TAG, "OGL renderer: " + gl10.glGetString(GL20.GL_RENDERER));
        Application application2 = Gdx.app;
        application2.log(LOG_TAG, "OGL vendor: " + gl10.glGetString(GL20.GL_VENDOR));
        Application application3 = Gdx.app;
        application3.log(LOG_TAG, "OGL version: " + gl10.glGetString(GL20.GL_VERSION));
        Application application4 = Gdx.app;
        application4.log(LOG_TAG, "OGL extensions: " + gl10.glGetString(GL20.GL_EXTENSIONS));
    }

    public void onSurfaceChanged(GL10 gl10, int i, int i2) {
        this.width = i;
        this.height = i2;
        updatePpi();
        gl10.glViewport(0, 0, this.width, this.height);
        if (!this.created) {
            this.app.getApplicationListener().create();
            this.created = true;
            synchronized (this) {
                this.running = true;
            }
        }
        this.app.getApplicationListener().resize(i, i2);
    }

    public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        this.eglContext = ((EGL10) EGLContext.getEGL()).eglGetCurrentContext();
        setupGL(gl10);
        logConfig(eGLConfig);
        updatePpi();
        Mesh.invalidateAllMeshes(this.app);
        Texture.invalidateAllTextures(this.app);
        Cubemap.invalidateAllCubemaps(this.app);
        TextureArray.invalidateAllTextureArrays(this.app);
        ShaderProgram.invalidateAllShaderPrograms(this.app);
        FrameBuffer.invalidateAllFrameBuffers(this.app);
        logManagedCachesStatus();
        Display defaultDisplay = this.app.getWindowManager().getDefaultDisplay();
        this.width = defaultDisplay.getWidth();
        this.height = defaultDisplay.getHeight();
        this.mean = new WindowedMean(5);
        this.lastFrameTime = System.nanoTime();
        gl10.glViewport(0, 0, this.width, this.height);
    }

    /* access modifiers changed from: protected */
    public void logConfig(EGLConfig eGLConfig) {
        EGL10 egl10 = (EGL10) EGLContext.getEGL();
        EGLDisplay eglGetDisplay = egl10.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
        int attrib = getAttrib(egl10, eglGetDisplay, eGLConfig, 12324, 0);
        int attrib2 = getAttrib(egl10, eglGetDisplay, eGLConfig, 12323, 0);
        int attrib3 = getAttrib(egl10, eglGetDisplay, eGLConfig, 12322, 0);
        int attrib4 = getAttrib(egl10, eglGetDisplay, eGLConfig, 12321, 0);
        int attrib5 = getAttrib(egl10, eglGetDisplay, eGLConfig, 12325, 0);
        int attrib6 = getAttrib(egl10, eglGetDisplay, eGLConfig, 12326, 0);
        int max = Math.max(getAttrib(egl10, eglGetDisplay, eGLConfig, 12337, 0), getAttrib(egl10, eglGetDisplay, eGLConfig, GdxEglConfigChooser.EGL_COVERAGE_SAMPLES_NV, 0));
        boolean z = getAttrib(egl10, eglGetDisplay, eGLConfig, GdxEglConfigChooser.EGL_COVERAGE_SAMPLES_NV, 0) != 0;
        Application application = Gdx.app;
        application.log(LOG_TAG, "framebuffer: (" + attrib + ", " + attrib2 + ", " + attrib3 + ", " + attrib4 + ")");
        Application application2 = Gdx.app;
        StringBuilder sb = new StringBuilder();
        sb.append("depthbuffer: (");
        sb.append(attrib5);
        sb.append(")");
        application2.log(LOG_TAG, sb.toString());
        Application application3 = Gdx.app;
        application3.log(LOG_TAG, "stencilbuffer: (" + attrib6 + ")");
        Application application4 = Gdx.app;
        application4.log(LOG_TAG, "samples: (" + max + ")");
        Application application5 = Gdx.app;
        application5.log(LOG_TAG, "coverage sampling: (" + z + ")");
        this.bufferFormat = new Graphics.BufferFormat(attrib, attrib2, attrib3, attrib4, attrib5, attrib6, max, z);
    }

    private int getAttrib(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, int i, int i2) {
        return egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, i, this.value) ? this.value[0] : i2;
    }

    /* access modifiers changed from: package-private */
    public void resume() {
        synchronized (this.synch) {
            this.running = true;
            this.resume = true;
        }
    }

    /* access modifiers changed from: package-private */
    public void pause() {
        synchronized (this.synch) {
            if (this.running) {
                this.running = false;
                this.pause = true;
                while (this.pause) {
                    try {
                        this.synch.wait(4000);
                        if (this.pause) {
                            Gdx.app.error(LOG_TAG, "waiting for pause synchronization took too long; assuming deadlock and killing");
                            Process.killProcess(Process.myPid());
                        }
                    } catch (InterruptedException unused) {
                        Gdx.app.log(LOG_TAG, "waiting for pause synchronization failed!");
                    }
                }
            }
        }
    }

    /* access modifiers changed from: package-private */
    public void destroy() {
        synchronized (this.synch) {
            this.running = false;
            this.destroy = true;
            while (this.destroy) {
                try {
                    this.synch.wait();
                } catch (InterruptedException unused) {
                    Gdx.app.log(LOG_TAG, "waiting for destroy synchronization failed!");
                }
            }
        }
    }

    public void onDrawFrame(GL10 gl10) {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        long nanoTime = System.nanoTime();
        this.deltaTime = ((float) (nanoTime - this.lastFrameTime)) / 1.0E9f;
        this.lastFrameTime = nanoTime;
        if (!this.resume) {
            this.mean.addValue(this.deltaTime);
        } else {
            this.deltaTime = 0.0f;
        }
        synchronized (this.synch) {
            z = this.running;
            z2 = this.pause;
            z3 = this.destroy;
            z4 = this.resume;
            if (this.resume) {
                this.resume = false;
            }
            if (this.pause) {
                this.pause = false;
                this.synch.notifyAll();
            }
            if (this.destroy) {
                this.destroy = false;
                this.synch.notifyAll();
            }
        }
        if (z4) {
            SnapshotArray<LifecycleListener> lifecycleListeners = this.app.getLifecycleListeners();
            synchronized (lifecycleListeners) {
                LifecycleListener[] begin = lifecycleListeners.begin();
                int i = lifecycleListeners.size;
                for (int i2 = 0; i2 < i; i2++) {
                    begin[i2].resume();
                }
                lifecycleListeners.end();
            }
            this.app.getApplicationListener().resume();
            Gdx.app.log(LOG_TAG, "resumed");
        }
        if (z) {
            synchronized (this.app.getRunnables()) {
                this.app.getExecutedRunnables().clear();
                this.app.getExecutedRunnables().addAll(this.app.getRunnables());
                this.app.getRunnables().clear();
            }
            for (int i3 = 0; i3 < this.app.getExecutedRunnables().size; i3++) {
                try {
                    this.app.getExecutedRunnables().get(i3).run();
                } catch (Throwable th) {
                    th.printStackTrace();
                }
            }
            this.app.getInput().processEvents();
            this.frameId++;
            this.app.getApplicationListener().render();
        }
        if (z2) {
            SnapshotArray<LifecycleListener> lifecycleListeners2 = this.app.getLifecycleListeners();
            synchronized (lifecycleListeners2) {
                LifecycleListener[] begin2 = lifecycleListeners2.begin();
                int i4 = lifecycleListeners2.size;
                for (int i5 = 0; i5 < i4; i5++) {
                    begin2[i5].pause();
                }
            }
            this.app.getApplicationListener().pause();
            Gdx.app.log(LOG_TAG, "paused");
        }
        if (z3) {
            SnapshotArray<LifecycleListener> lifecycleListeners3 = this.app.getLifecycleListeners();
            synchronized (lifecycleListeners3) {
                LifecycleListener[] begin3 = lifecycleListeners3.begin();
                int i6 = lifecycleListeners3.size;
                for (int i7 = 0; i7 < i6; i7++) {
                    begin3[i7].dispose();
                }
            }
            this.app.getApplicationListener().dispose();
            Gdx.app.log(LOG_TAG, "destroyed");
        }
        if (nanoTime - this.frameStart > 1000000000) {
            this.fps = this.frames;
            this.frames = 0;
            this.frameStart = nanoTime;
        }
        this.frames++;
    }

    @Override // com.badlogic.gdx.Graphics
    public long getFrameId() {
        return this.frameId;
    }

    @Override // com.badlogic.gdx.Graphics
    public float getDeltaTime() {
        return this.mean.getMean() == 0.0f ? this.deltaTime : this.mean.getMean();
    }

    @Override // com.badlogic.gdx.Graphics
    public float getRawDeltaTime() {
        return this.deltaTime;
    }

    @Override // com.badlogic.gdx.Graphics
    public Graphics.GraphicsType getType() {
        return Graphics.GraphicsType.AndroidGL;
    }

    @Override // com.badlogic.gdx.Graphics
    public GLVersion getGLVersion() {
        return this.glVersion;
    }

    @Override // com.badlogic.gdx.Graphics
    public int getFramesPerSecond() {
        return this.fps;
    }

    public void clearManagedCaches() {
        Mesh.clearAllMeshes(this.app);
        Texture.clearAllTextures(this.app);
        Cubemap.clearAllCubemaps(this.app);
        TextureArray.clearAllTextureArrays(this.app);
        ShaderProgram.clearAllShaderPrograms(this.app);
        FrameBuffer.clearAllFrameBuffers(this.app);
        logManagedCachesStatus();
    }

    /* access modifiers changed from: protected */
    public void logManagedCachesStatus() {
        Gdx.app.log(LOG_TAG, Mesh.getManagedStatus());
        Gdx.app.log(LOG_TAG, Texture.getManagedStatus());
        Gdx.app.log(LOG_TAG, Cubemap.getManagedStatus());
        Gdx.app.log(LOG_TAG, ShaderProgram.getManagedStatus());
        Gdx.app.log(LOG_TAG, FrameBuffer.getManagedStatus());
    }

    public View getView() {
        return this.view;
    }

    @Override // com.badlogic.gdx.Graphics
    public float getPpiX() {
        return this.ppiX;
    }

    @Override // com.badlogic.gdx.Graphics
    public float getPpiY() {
        return this.ppiY;
    }

    @Override // com.badlogic.gdx.Graphics
    public float getPpcX() {
        return this.ppcX;
    }

    @Override // com.badlogic.gdx.Graphics
    public float getPpcY() {
        return this.ppcY;
    }

    @Override // com.badlogic.gdx.Graphics
    public float getDensity() {
        return this.density;
    }

    @Override // com.badlogic.gdx.Graphics
    public Graphics.Monitor getPrimaryMonitor() {
        return new AndroidMonitor(0, 0, "Primary Monitor");
    }

    @Override // com.badlogic.gdx.Graphics
    public Graphics.Monitor getMonitor() {
        return getPrimaryMonitor();
    }

    @Override // com.badlogic.gdx.Graphics
    public Graphics.Monitor[] getMonitors() {
        return new Graphics.Monitor[]{getPrimaryMonitor()};
    }

    @Override // com.badlogic.gdx.Graphics
    public Graphics.DisplayMode[] getDisplayModes(Graphics.Monitor monitor) {
        return getDisplayModes();
    }

    @Override // com.badlogic.gdx.Graphics
    public Graphics.DisplayMode getDisplayMode(Graphics.Monitor monitor) {
        return getDisplayMode();
    }

    @Override // com.badlogic.gdx.Graphics
    public Graphics.DisplayMode[] getDisplayModes() {
        return new Graphics.DisplayMode[]{getDisplayMode()};
    }

    @Override // com.badlogic.gdx.Graphics
    public void setUndecorated(boolean z) {
        this.app.getApplicationWindow().setFlags(GL20.GL_STENCIL_BUFFER_BIT, z ? 1 : 0);
    }

    @Override // com.badlogic.gdx.Graphics
    public Graphics.DisplayMode getDisplayMode() {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        this.app.getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        return new AndroidDisplayMode(displayMetrics.widthPixels, displayMetrics.heightPixels, 0, 0);
    }

    @Override // com.badlogic.gdx.Graphics
    public Graphics.BufferFormat getBufferFormat() {
        return this.bufferFormat;
    }

    @Override // com.badlogic.gdx.Graphics
    public boolean supportsExtension(String str) {
        if (this.extensions == null) {
            this.extensions = Gdx.gl.glGetString(GL20.GL_EXTENSIONS);
        }
        return this.extensions.contains(str);
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v5, resolved type: com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18 */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v2, types: [boolean, int] */
    /* JADX WARNING: Unknown variable types count: 1 */
    @Override // com.badlogic.gdx.Graphics
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setContinuousRendering(boolean r3) {
        /*
            r2 = this;
            android.view.View r0 = r2.view
            if (r0 == 0) goto L_0x002d
            boolean r0 = com.badlogic.gdx.backends.android.AndroidGraphics.enforceContinuousRendering
            if (r0 != 0) goto L_0x000d
            if (r3 == 0) goto L_0x000b
            goto L_0x000d
        L_0x000b:
            r3 = 0
            goto L_0x000e
        L_0x000d:
            r3 = 1
        L_0x000e:
            r2.isContinuous = r3
            boolean r3 = r2.isContinuous
            android.view.View r0 = r2.view
            boolean r1 = r0 instanceof com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18
            if (r1 == 0) goto L_0x001d
            com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18 r0 = (com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18) r0
            r0.setRenderMode(r3)
        L_0x001d:
            android.view.View r0 = r2.view
            boolean r1 = r0 instanceof android.opengl.GLSurfaceView
            if (r1 == 0) goto L_0x0028
            android.opengl.GLSurfaceView r0 = (android.opengl.GLSurfaceView) r0
            r0.setRenderMode(r3)
        L_0x0028:
            com.badlogic.gdx.math.WindowedMean r3 = r2.mean
            r3.clear()
        L_0x002d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.backends.android.AndroidGraphics.setContinuousRendering(boolean):void");
    }

    @Override // com.badlogic.gdx.Graphics
    public boolean isContinuousRendering() {
        return this.isContinuous;
    }

    @Override // com.badlogic.gdx.Graphics
    public void requestRendering() {
        View view2 = this.view;
        if (view2 != null) {
            if (view2 instanceof GLSurfaceViewAPI18) {
                ((GLSurfaceViewAPI18) view2).requestRender();
            }
            View view3 = this.view;
            if (view3 instanceof GLSurfaceView) {
                ((GLSurfaceView) view3).requestRender();
            }
        }
    }

    /* access modifiers changed from: private */
    public class AndroidDisplayMode extends Graphics.DisplayMode {
        protected AndroidDisplayMode(int i, int i2, int i3, int i4) {
            super(i, i2, i3, i4);
        }
    }

    /* access modifiers changed from: private */
    public class AndroidMonitor extends Graphics.Monitor {
        public AndroidMonitor(int i, int i2, String str) {
            super(i, i2, str);
        }
    }
}
