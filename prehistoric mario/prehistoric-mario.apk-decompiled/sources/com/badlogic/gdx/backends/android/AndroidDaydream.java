package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Debug;
import android.os.Handler;
import android.os.Looper;
import android.service.dreams.DreamService;
import android.view.View;
import android.view.Window;
import android.widget.FrameLayout;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.ApplicationListener;
import com.badlogic.gdx.ApplicationLogger;
import com.badlogic.gdx.Audio;
import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Graphics;
import com.badlogic.gdx.LifecycleListener;
import com.badlogic.gdx.Net;
import com.badlogic.gdx.Preferences;
import com.badlogic.gdx.backends.android.surfaceview.FillResolutionStrategy;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Clipboard;
import com.badlogic.gdx.utils.GdxNativesLoader;
import com.badlogic.gdx.utils.SnapshotArray;
import java.lang.reflect.Method;
import java.util.Arrays;

public class AndroidDaydream extends DreamService implements AndroidApplicationBase {
    protected ApplicationLogger applicationLogger;
    protected AndroidAudio audio;
    protected AndroidClipboard clipboard;
    protected final Array<Runnable> executedRunnables = new Array<>();
    protected AndroidFiles files;
    protected boolean firstResume = true;
    protected AndroidGraphics graphics;
    protected Handler handler;
    protected AndroidInput input;
    protected final SnapshotArray<LifecycleListener> lifecycleListeners = new SnapshotArray<>(LifecycleListener.class);
    protected ApplicationListener listener;
    protected int logLevel = 2;
    protected AndroidNet net;
    protected final Array<Runnable> runnables = new Array<>();

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public Context getContext() {
        return this;
    }

    static {
        GdxNativesLoader.load();
    }

    public void initialize(ApplicationListener applicationListener) {
        initialize(applicationListener, new AndroidApplicationConfiguration());
    }

    public void initialize(ApplicationListener applicationListener, AndroidApplicationConfiguration androidApplicationConfiguration) {
        init(applicationListener, androidApplicationConfiguration, false);
    }

    public View initializeForView(ApplicationListener applicationListener) {
        return initializeForView(applicationListener, new AndroidApplicationConfiguration());
    }

    public View initializeForView(ApplicationListener applicationListener, AndroidApplicationConfiguration androidApplicationConfiguration) {
        init(applicationListener, androidApplicationConfiguration, true);
        return this.graphics.getView();
    }

    private void init(ApplicationListener applicationListener, AndroidApplicationConfiguration androidApplicationConfiguration, boolean z) {
        setApplicationLogger(new AndroidApplicationLogger());
        this.graphics = new AndroidGraphics(this, androidApplicationConfiguration, androidApplicationConfiguration.resolutionStrategy == null ? new FillResolutionStrategy() : androidApplicationConfiguration.resolutionStrategy);
        this.input = AndroidInputFactory.newAndroidInput(this, this, this.graphics.view, androidApplicationConfiguration);
        this.audio = new AndroidAudio(this, androidApplicationConfiguration);
        getFilesDir();
        this.files = new AndroidFiles(getAssets(), getFilesDir().getAbsolutePath());
        this.net = new AndroidNet(this, androidApplicationConfiguration);
        this.listener = applicationListener;
        this.handler = new Handler();
        this.clipboard = new AndroidClipboard(this);
        addLifecycleListener(new LifecycleListener() {
            /* class com.badlogic.gdx.backends.android.AndroidDaydream.AnonymousClass1 */

            @Override // com.badlogic.gdx.LifecycleListener
            public void resume() {
                AndroidDaydream.this.audio.resume();
            }

            @Override // com.badlogic.gdx.LifecycleListener
            public void pause() {
                AndroidDaydream.this.audio.pause();
            }

            @Override // com.badlogic.gdx.LifecycleListener
            public void dispose() {
                AndroidDaydream.this.audio.dispose();
                AndroidDaydream.this.audio = null;
            }
        });
        Gdx.app = this;
        Gdx.input = getInput();
        Gdx.audio = getAudio();
        Gdx.files = getFiles();
        Gdx.graphics = getGraphics();
        Gdx.net = getNet();
        if (!z) {
            setFullscreen(true);
            setContentView(this.graphics.getView(), createLayoutParams());
        }
        createWakeLock(androidApplicationConfiguration.useWakelock);
        hideStatusBar(androidApplicationConfiguration);
        if (getResources().getConfiguration().keyboard != 1) {
            getInput().keyboardAvailable = true;
        }
    }

    /* access modifiers changed from: protected */
    public FrameLayout.LayoutParams createLayoutParams() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 17;
        return layoutParams;
    }

    /* access modifiers changed from: protected */
    public void createWakeLock(boolean z) {
        if (z) {
            getWindow().addFlags(128);
        }
    }

    /* access modifiers changed from: protected */
    public void hideStatusBar(AndroidApplicationConfiguration androidApplicationConfiguration) {
        if (androidApplicationConfiguration.hideStatusBar && getVersion() >= 11) {
            View decorView = getWindow().getDecorView();
            try {
                Method method = View.class.getMethod("setSystemUiVisibility", Integer.TYPE);
                method.invoke(decorView, 0);
                method.invoke(decorView, 1);
            } catch (Exception e) {
                log("AndroidApplication", "Can't hide status bar", e);
            }
        }
    }

    public void onDreamingStopped() {
        boolean isContinuousRendering = this.graphics.isContinuousRendering();
        this.graphics.setContinuousRendering(true);
        this.graphics.pause();
        this.input.unregisterSensorListeners();
        Arrays.fill(this.input.realId, -1);
        Arrays.fill(this.input.touched, false);
        this.graphics.clearManagedCaches();
        this.graphics.destroy();
        this.graphics.setContinuousRendering(isContinuousRendering);
        this.graphics.onPauseGLSurfaceView();
        super.onDreamingStopped();
    }

    public void onDreamingStarted() {
        Gdx.app = this;
        Gdx.input = getInput();
        Gdx.audio = getAudio();
        Gdx.files = getFiles();
        Gdx.graphics = getGraphics();
        Gdx.net = getNet();
        getInput().registerSensorListeners();
        AndroidGraphics androidGraphics = this.graphics;
        if (androidGraphics != null) {
            androidGraphics.onResumeGLSurfaceView();
        }
        if (!this.firstResume) {
            this.graphics.resume();
        } else {
            this.firstResume = false;
        }
        super.onDreamingStarted();
    }

    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
    }

    @Override // com.badlogic.gdx.Application
    public ApplicationListener getApplicationListener() {
        return this.listener;
    }

    @Override // com.badlogic.gdx.Application
    public Audio getAudio() {
        return this.audio;
    }

    @Override // com.badlogic.gdx.Application
    public Files getFiles() {
        return this.files;
    }

    @Override // com.badlogic.gdx.Application
    public Graphics getGraphics() {
        return this.graphics;
    }

    @Override // com.badlogic.gdx.Application, com.badlogic.gdx.backends.android.AndroidApplicationBase
    public AndroidInput getInput() {
        return this.input;
    }

    @Override // com.badlogic.gdx.Application
    public Net getNet() {
        return this.net;
    }

    @Override // com.badlogic.gdx.Application
    public Application.ApplicationType getType() {
        return Application.ApplicationType.Android;
    }

    @Override // com.badlogic.gdx.Application
    public int getVersion() {
        return Build.VERSION.SDK_INT;
    }

    @Override // com.badlogic.gdx.Application
    public long getJavaHeap() {
        return Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
    }

    @Override // com.badlogic.gdx.Application
    public long getNativeHeap() {
        return Debug.getNativeHeapAllocatedSize();
    }

    @Override // com.badlogic.gdx.Application
    public Preferences getPreferences(String str) {
        return new AndroidPreferences(getSharedPreferences(str, 0));
    }

    @Override // com.badlogic.gdx.Application
    public Clipboard getClipboard() {
        return this.clipboard;
    }

    @Override // com.badlogic.gdx.Application
    public void postRunnable(Runnable runnable) {
        synchronized (this.runnables) {
            this.runnables.add(runnable);
            Gdx.graphics.requestRendering();
        }
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        boolean z = true;
        if (configuration.hardKeyboardHidden != 1) {
            z = false;
        }
        this.input.keyboardAvailable = z;
    }

    @Override // com.badlogic.gdx.Application
    public void exit() {
        this.handler.post(new Runnable() {
            /* class com.badlogic.gdx.backends.android.AndroidDaydream.AnonymousClass2 */

            public void run() {
                AndroidDaydream.this.finish();
            }
        });
    }

    @Override // com.badlogic.gdx.Application
    public void debug(String str, String str2) {
        if (this.logLevel >= 3) {
            getApplicationLogger().debug(str, str2);
        }
    }

    @Override // com.badlogic.gdx.Application
    public void debug(String str, String str2, Throwable th) {
        if (this.logLevel >= 3) {
            getApplicationLogger().debug(str, str2, th);
        }
    }

    @Override // com.badlogic.gdx.Application
    public void log(String str, String str2) {
        if (this.logLevel >= 2) {
            getApplicationLogger().log(str, str2);
        }
    }

    @Override // com.badlogic.gdx.Application
    public void log(String str, String str2, Throwable th) {
        if (this.logLevel >= 2) {
            getApplicationLogger().log(str, str2, th);
        }
    }

    @Override // com.badlogic.gdx.Application
    public void error(String str, String str2) {
        if (this.logLevel >= 1) {
            getApplicationLogger().error(str, str2);
        }
    }

    @Override // com.badlogic.gdx.Application
    public void error(String str, String str2, Throwable th) {
        if (this.logLevel >= 1) {
            getApplicationLogger().error(str, str2, th);
        }
    }

    @Override // com.badlogic.gdx.Application
    public void setLogLevel(int i) {
        this.logLevel = i;
    }

    @Override // com.badlogic.gdx.Application
    public int getLogLevel() {
        return this.logLevel;
    }

    @Override // com.badlogic.gdx.Application
    public void setApplicationLogger(ApplicationLogger applicationLogger2) {
        this.applicationLogger = applicationLogger2;
    }

    @Override // com.badlogic.gdx.Application
    public ApplicationLogger getApplicationLogger() {
        return this.applicationLogger;
    }

    @Override // com.badlogic.gdx.Application
    public void addLifecycleListener(LifecycleListener lifecycleListener) {
        synchronized (this.lifecycleListeners) {
            this.lifecycleListeners.add(lifecycleListener);
        }
    }

    @Override // com.badlogic.gdx.Application
    public void removeLifecycleListener(LifecycleListener lifecycleListener) {
        synchronized (this.lifecycleListeners) {
            this.lifecycleListeners.removeValue(lifecycleListener, true);
        }
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public Array<Runnable> getRunnables() {
        return this.runnables;
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public Array<Runnable> getExecutedRunnables() {
        return this.executedRunnables;
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public SnapshotArray<LifecycleListener> getLifecycleListeners() {
        return this.lifecycleListeners;
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public Window getApplicationWindow() {
        return getWindow();
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public Handler getHandler() {
        return this.handler;
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public void runOnUiThread(Runnable runnable) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            new Handler(Looper.getMainLooper()).post(runnable);
        } else {
            runnable.run();
        }
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public void useImmersiveMode(boolean z) {
        throw new UnsupportedOperationException();
    }
}
