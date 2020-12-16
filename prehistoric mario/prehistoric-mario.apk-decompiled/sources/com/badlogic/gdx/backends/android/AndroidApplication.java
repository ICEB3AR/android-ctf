package com.badlogic.gdx.backends.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Debug;
import android.os.Handler;
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
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Clipboard;
import com.badlogic.gdx.utils.GdxNativesLoader;
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.SnapshotArray;
import java.lang.reflect.Method;

public class AndroidApplication extends Activity implements AndroidApplicationBase {
    private final Array<AndroidEventListener> androidEventListeners = new Array<>();
    protected ApplicationLogger applicationLogger;
    protected AndroidAudio audio;
    protected AndroidClipboard clipboard;
    protected final Array<Runnable> executedRunnables = new Array<>();
    protected AndroidFiles files;
    protected boolean firstResume = true;
    protected AndroidGraphics graphics;
    public Handler handler;
    protected boolean hideStatusBar = false;
    protected AndroidInput input;
    private boolean isWaitingForAudio = false;
    protected final SnapshotArray<LifecycleListener> lifecycleListeners = new SnapshotArray<>(LifecycleListener.class);
    protected ApplicationListener listener;
    protected int logLevel = 2;
    protected AndroidNet net;
    protected final Array<Runnable> runnables = new Array<>();
    protected boolean useImmersiveMode = false;
    private int wasFocusChanged = -1;

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
        if (getVersion() >= 9) {
            setApplicationLogger(new AndroidApplicationLogger());
            this.graphics = new AndroidGraphics(this, androidApplicationConfiguration, androidApplicationConfiguration.resolutionStrategy == null ? new FillResolutionStrategy() : androidApplicationConfiguration.resolutionStrategy);
            this.input = AndroidInputFactory.newAndroidInput(this, this, this.graphics.view, androidApplicationConfiguration);
            this.audio = new AndroidAudio(this, androidApplicationConfiguration);
            getFilesDir();
            this.files = new AndroidFiles(getAssets(), getFilesDir().getAbsolutePath());
            this.net = new AndroidNet(this, androidApplicationConfiguration);
            this.listener = applicationListener;
            this.handler = new Handler();
            this.useImmersiveMode = androidApplicationConfiguration.useImmersiveMode;
            this.hideStatusBar = androidApplicationConfiguration.hideStatusBar;
            this.clipboard = new AndroidClipboard(this);
            addLifecycleListener(new LifecycleListener() {
                /* class com.badlogic.gdx.backends.android.AndroidApplication.AnonymousClass1 */

                @Override // com.badlogic.gdx.LifecycleListener
                public void resume() {
                }

                @Override // com.badlogic.gdx.LifecycleListener
                public void pause() {
                    AndroidApplication.this.audio.pause();
                }

                @Override // com.badlogic.gdx.LifecycleListener
                public void dispose() {
                    AndroidApplication.this.audio.dispose();
                }
            });
            Gdx.app = this;
            Gdx.input = getInput();
            Gdx.audio = getAudio();
            Gdx.files = getFiles();
            Gdx.graphics = getGraphics();
            Gdx.net = getNet();
            if (!z) {
                try {
                    requestWindowFeature(1);
                } catch (Exception e) {
                    log("AndroidApplication", "Content already displayed, cannot request FEATURE_NO_TITLE", e);
                }
                getWindow().setFlags(GL20.GL_STENCIL_BUFFER_BIT, GL20.GL_STENCIL_BUFFER_BIT);
                getWindow().clearFlags(2048);
                setContentView(this.graphics.getView(), createLayoutParams());
            }
            createWakeLock(androidApplicationConfiguration.useWakelock);
            hideStatusBar(this.hideStatusBar);
            useImmersiveMode(this.useImmersiveMode);
            if (this.useImmersiveMode && getVersion() >= 19) {
                try {
                    Class<?> cls = Class.forName("com.badlogic.gdx.backends.android.AndroidVisibilityListener");
                    cls.getDeclaredMethod("createListener", AndroidApplicationBase.class).invoke(cls.newInstance(), this);
                } catch (Exception e2) {
                    log("AndroidApplication", "Failed to create AndroidVisibilityListener", e2);
                }
            }
            if (getResources().getConfiguration().keyboard != 1) {
                getInput().keyboardAvailable = true;
                return;
            }
            return;
        }
        throw new GdxRuntimeException("LibGDX requires Android API Level 9 or later.");
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
    public void hideStatusBar(boolean z) {
        if (z && getVersion() >= 11) {
            View decorView = getWindow().getDecorView();
            try {
                Method method = View.class.getMethod("setSystemUiVisibility", Integer.TYPE);
                if (getVersion() <= 13) {
                    method.invoke(decorView, 0);
                }
                method.invoke(decorView, 1);
            } catch (Exception e) {
                log("AndroidApplication", "Can't hide status bar", e);
            }
        }
    }

    public void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        useImmersiveMode(this.useImmersiveMode);
        hideStatusBar(this.hideStatusBar);
        if (z) {
            this.wasFocusChanged = 1;
            if (this.isWaitingForAudio) {
                this.audio.resume();
                this.isWaitingForAudio = false;
                return;
            }
            return;
        }
        this.wasFocusChanged = 0;
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    @TargetApi(19)
    public void useImmersiveMode(boolean z) {
        if (z && getVersion() >= 19) {
            View decorView = getWindow().getDecorView();
            try {
                View.class.getMethod("setSystemUiVisibility", Integer.TYPE).invoke(decorView, 5894);
            } catch (Exception e) {
                log("AndroidApplication", "Can't set immersive mode", e);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        boolean isContinuousRendering = this.graphics.isContinuousRendering();
        boolean z = AndroidGraphics.enforceContinuousRendering;
        AndroidGraphics.enforceContinuousRendering = true;
        this.graphics.setContinuousRendering(true);
        this.graphics.pause();
        this.input.onPause();
        if (isFinishing()) {
            this.graphics.clearManagedCaches();
            this.graphics.destroy();
        }
        AndroidGraphics.enforceContinuousRendering = z;
        this.graphics.setContinuousRendering(isContinuousRendering);
        this.graphics.onPauseGLSurfaceView();
        super.onPause();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        Gdx.app = this;
        Gdx.input = getInput();
        Gdx.audio = getAudio();
        Gdx.files = getFiles();
        Gdx.graphics = getGraphics();
        Gdx.net = getNet();
        this.input.onResume();
        AndroidGraphics androidGraphics = this.graphics;
        if (androidGraphics != null) {
            androidGraphics.onResumeGLSurfaceView();
        }
        if (!this.firstResume) {
            this.graphics.resume();
        } else {
            this.firstResume = false;
        }
        this.isWaitingForAudio = true;
        int i = this.wasFocusChanged;
        if (i == 1 || i == -1) {
            this.audio.resume();
            this.isWaitingForAudio = false;
        }
        super.onResume();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
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
            /* class com.badlogic.gdx.backends.android.AndroidApplication.AnonymousClass2 */

            public void run() {
                AndroidApplication.this.finish();
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

    /* access modifiers changed from: protected */
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        synchronized (this.androidEventListeners) {
            for (int i3 = 0; i3 < this.androidEventListeners.size; i3++) {
                this.androidEventListeners.get(i3).onActivityResult(i, i2, intent);
            }
        }
    }

    public void addAndroidEventListener(AndroidEventListener androidEventListener) {
        synchronized (this.androidEventListeners) {
            this.androidEventListeners.add(androidEventListener);
        }
    }

    public void removeAndroidEventListener(AndroidEventListener androidEventListener) {
        synchronized (this.androidEventListeners) {
            this.androidEventListeners.removeValue(androidEventListener, true);
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
}
