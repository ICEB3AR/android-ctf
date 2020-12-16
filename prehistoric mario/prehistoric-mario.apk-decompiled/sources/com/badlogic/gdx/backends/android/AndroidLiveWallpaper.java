package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Debug;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Window;
import android.view.WindowManager;
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
import com.badlogic.gdx.utils.GdxRuntimeException;
import com.badlogic.gdx.utils.SnapshotArray;

public class AndroidLiveWallpaper implements AndroidApplicationBase {
    protected ApplicationLogger applicationLogger;
    protected AndroidAudio audio;
    protected AndroidClipboard clipboard;
    protected final Array<Runnable> executedRunnables = new Array<>();
    protected AndroidFiles files;
    protected boolean firstResume = true;
    protected AndroidGraphicsLiveWallpaper graphics;
    protected AndroidInput input;
    protected final SnapshotArray<LifecycleListener> lifecycleListeners = new SnapshotArray<>(LifecycleListener.class);
    protected ApplicationListener listener;
    protected int logLevel = 2;
    protected AndroidNet net;
    protected final Array<Runnable> runnables = new Array<>();
    protected AndroidLiveWallpaperService service;

    @Override // com.badlogic.gdx.Application
    public void exit() {
    }

    static {
        GdxNativesLoader.load();
    }

    public AndroidLiveWallpaper(AndroidLiveWallpaperService androidLiveWallpaperService) {
        this.service = androidLiveWallpaperService;
    }

    public void initialize(ApplicationListener applicationListener, AndroidApplicationConfiguration androidApplicationConfiguration) {
        if (getVersion() >= 9) {
            setApplicationLogger(new AndroidApplicationLogger());
            this.graphics = new AndroidGraphicsLiveWallpaper(this, androidApplicationConfiguration, androidApplicationConfiguration.resolutionStrategy == null ? new FillResolutionStrategy() : androidApplicationConfiguration.resolutionStrategy);
            this.input = AndroidInputFactory.newAndroidInput(this, getService(), this.graphics.view, androidApplicationConfiguration);
            this.audio = new AndroidAudio(getService(), androidApplicationConfiguration);
            getService().getFilesDir();
            this.files = new AndroidFiles(getService().getAssets(), getService().getFilesDir().getAbsolutePath());
            this.net = new AndroidNet(this, androidApplicationConfiguration);
            this.listener = applicationListener;
            this.clipboard = new AndroidClipboard(getService());
            Gdx.app = this;
            Gdx.input = this.input;
            Gdx.audio = this.audio;
            Gdx.files = this.files;
            Gdx.graphics = this.graphics;
            Gdx.net = this.net;
            return;
        }
        throw new GdxRuntimeException("LibGDX requires Android API Level 9 or later.");
    }

    public void onPause() {
        if (AndroidLiveWallpaperService.DEBUG) {
            Log.d("WallpaperService", " > AndroidLiveWallpaper - onPause()");
        }
        this.audio.pause();
        this.input.onPause();
        AndroidGraphicsLiveWallpaper androidGraphicsLiveWallpaper = this.graphics;
        if (androidGraphicsLiveWallpaper != null) {
            androidGraphicsLiveWallpaper.onPauseGLSurfaceView();
        }
        if (AndroidLiveWallpaperService.DEBUG) {
            Log.d("WallpaperService", " > AndroidLiveWallpaper - onPause() done!");
        }
    }

    public void onResume() {
        Gdx.app = this;
        AndroidInput androidInput = this.input;
        Gdx.input = androidInput;
        Gdx.audio = this.audio;
        Gdx.files = this.files;
        Gdx.graphics = this.graphics;
        Gdx.net = this.net;
        androidInput.onResume();
        AndroidGraphicsLiveWallpaper androidGraphicsLiveWallpaper = this.graphics;
        if (androidGraphicsLiveWallpaper != null) {
            androidGraphicsLiveWallpaper.onResumeGLSurfaceView();
        }
        if (!this.firstResume) {
            this.audio.resume();
            this.graphics.resume();
            return;
        }
        this.firstResume = false;
    }

    public void onDestroy() {
        AndroidGraphicsLiveWallpaper androidGraphicsLiveWallpaper = this.graphics;
        if (androidGraphicsLiveWallpaper != null) {
            androidGraphicsLiveWallpaper.onDestroyGLSurfaceView();
        }
        AndroidAudio androidAudio = this.audio;
        if (androidAudio != null) {
            androidAudio.dispose();
        }
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public WindowManager getWindowManager() {
        return this.service.getWindowManager();
    }

    public AndroidLiveWallpaperService getService() {
        return this.service;
    }

    @Override // com.badlogic.gdx.Application
    public ApplicationListener getApplicationListener() {
        return this.listener;
    }

    @Override // com.badlogic.gdx.Application
    public void postRunnable(Runnable runnable) {
        synchronized (this.runnables) {
            this.runnables.add(runnable);
        }
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
        return new AndroidPreferences(this.service.getSharedPreferences(str, 0));
    }

    @Override // com.badlogic.gdx.Application
    public Clipboard getClipboard() {
        return this.clipboard;
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
    public Context getContext() {
        return this.service;
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
    public void startActivity(Intent intent) {
        this.service.startActivity(intent);
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public Window getApplicationWindow() {
        throw new UnsupportedOperationException();
    }

    @Override // com.badlogic.gdx.backends.android.AndroidApplicationBase
    public Handler getHandler() {
        throw new UnsupportedOperationException();
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
