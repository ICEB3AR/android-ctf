package com.badlogic.gdx.backends.android;

import android.opengl.GLSurfaceView;
import android.os.Build;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.View;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceView20;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceView20API18;
import com.badlogic.gdx.backends.android.surfaceview.GLSurfaceViewAPI18;
import com.badlogic.gdx.backends.android.surfaceview.ResolutionStrategy;
import com.badlogic.gdx.utils.GdxRuntimeException;
import javax.microedition.khronos.opengles.GL10;

public final class AndroidGraphicsLiveWallpaper extends AndroidGraphics {
    public AndroidGraphicsLiveWallpaper(AndroidLiveWallpaper androidLiveWallpaper, AndroidApplicationConfiguration androidApplicationConfiguration, ResolutionStrategy resolutionStrategy) {
        super(androidLiveWallpaper, androidApplicationConfiguration, resolutionStrategy, false);
    }

    /* access modifiers changed from: package-private */
    public SurfaceHolder getSurfaceHolder() {
        SurfaceHolder surfaceHolder;
        synchronized (((AndroidLiveWallpaper) this.app).service.sync) {
            surfaceHolder = ((AndroidLiveWallpaper) this.app).service.getSurfaceHolder();
        }
        return surfaceHolder;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.backends.android.AndroidGraphics
    public View createGLSurfaceView(AndroidApplicationBase androidApplicationBase, ResolutionStrategy resolutionStrategy) {
        if (checkGL20()) {
            GLSurfaceView.EGLConfigChooser eglConfigChooser = getEglConfigChooser();
            if (Build.VERSION.SDK_INT > 10 || !this.config.useGLSurfaceView20API18) {
                AnonymousClass2 r3 = new GLSurfaceView20(androidApplicationBase.getContext(), resolutionStrategy) {
                    /* class com.badlogic.gdx.backends.android.AndroidGraphicsLiveWallpaper.AnonymousClass2 */

                    public SurfaceHolder getHolder() {
                        return AndroidGraphicsLiveWallpaper.this.getSurfaceHolder();
                    }

                    public void onDestroy() {
                        onDetachedFromWindow();
                    }
                };
                if (eglConfigChooser != null) {
                    r3.setEGLConfigChooser(eglConfigChooser);
                } else {
                    r3.setEGLConfigChooser(this.config.r, this.config.g, this.config.b, this.config.a, this.config.depth, this.config.stencil);
                }
                r3.setRenderer(this);
                return r3;
            }
            AnonymousClass1 r32 = new GLSurfaceView20API18(androidApplicationBase.getContext(), resolutionStrategy) {
                /* class com.badlogic.gdx.backends.android.AndroidGraphicsLiveWallpaper.AnonymousClass1 */

                public SurfaceHolder getHolder() {
                    return AndroidGraphicsLiveWallpaper.this.getSurfaceHolder();
                }

                public void onDestroy() {
                    onDetachedFromWindow();
                }
            };
            if (eglConfigChooser != null) {
                r32.setEGLConfigChooser(eglConfigChooser);
            } else {
                r32.setEGLConfigChooser(this.config.r, this.config.g, this.config.b, this.config.a, this.config.depth, this.config.stencil);
            }
            r32.setRenderer(this);
            return r32;
        }
        throw new GdxRuntimeException("Libgdx requires OpenGL ES 2.0");
    }

    public void onDestroyGLSurfaceView() {
        if (this.view == null) {
            return;
        }
        if ((this.view instanceof GLSurfaceView) || (this.view instanceof GLSurfaceViewAPI18)) {
            try {
                this.view.getClass().getMethod("onDestroy", new Class[0]).invoke(this.view, new Object[0]);
                if (AndroidLiveWallpaperService.DEBUG) {
                    Log.d("WallpaperService", " > AndroidLiveWallpaper - onDestroy() stopped GLThread managed by GLSurfaceView");
                }
            } catch (Throwable th) {
                Log.e("WallpaperService", "failed to destroy GLSurfaceView's thread! GLSurfaceView.onDetachedFromWindow impl changed since API lvl 16!");
                th.printStackTrace();
            }
        }
    }

    /* access modifiers changed from: package-private */
    @Override // com.badlogic.gdx.backends.android.AndroidGraphics
    public void resume() {
        synchronized (this.synch) {
            this.running = true;
            this.resume = true;
            while (this.resume) {
                try {
                    requestRendering();
                    this.synch.wait();
                } catch (InterruptedException unused) {
                    Gdx.app.log("AndroidGraphics", "waiting for resume synchronization failed!");
                }
            }
        }
    }

    @Override // com.badlogic.gdx.backends.android.AndroidGraphics
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
                this.synch.notifyAll();
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
            this.app.getApplicationListener().resume();
            Gdx.app.log("AndroidGraphics", "resumed");
        }
        if (z) {
            synchronized (this.app.getRunnables()) {
                this.app.getExecutedRunnables().clear();
                this.app.getExecutedRunnables().addAll(this.app.getRunnables());
                this.app.getRunnables().clear();
                for (int i = 0; i < this.app.getExecutedRunnables().size; i++) {
                    try {
                        this.app.getExecutedRunnables().get(i).run();
                    } catch (Throwable th) {
                        th.printStackTrace();
                    }
                }
            }
            this.app.getInput().processEvents();
            this.frameId++;
            this.app.getApplicationListener().render();
        }
        if (z2) {
            this.app.getApplicationListener().pause();
            Gdx.app.log("AndroidGraphics", "paused");
        }
        if (z3) {
            this.app.getApplicationListener().dispose();
            Gdx.app.log("AndroidGraphics", "destroyed");
        }
        if (nanoTime - this.frameStart > 1000000000) {
            this.fps = this.frames;
            this.frames = 0;
            this.frameStart = nanoTime;
        }
        this.frames++;
    }

    /* access modifiers changed from: protected */
    @Override // com.badlogic.gdx.backends.android.AndroidGraphics
    public void logManagedCachesStatus() {
        if (AndroidLiveWallpaperService.DEBUG) {
            super.logManagedCachesStatus();
        }
    }
}
