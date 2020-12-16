package com.badlogic.gdx.backends.android;

import android.view.View;

public class AndroidVisibilityListener {
    public void createListener(final AndroidApplicationBase androidApplicationBase) {
        try {
            androidApplicationBase.getApplicationWindow().getDecorView().setOnSystemUiVisibilityChangeListener(new View.OnSystemUiVisibilityChangeListener() {
                /* class com.badlogic.gdx.backends.android.AndroidVisibilityListener.AnonymousClass1 */

                public void onSystemUiVisibilityChange(int i) {
                    androidApplicationBase.getHandler().post(new Runnable() {
                        /* class com.badlogic.gdx.backends.android.AndroidVisibilityListener.AnonymousClass1.AnonymousClass1 */

                        public void run() {
                            androidApplicationBase.useImmersiveMode(true);
                        }
                    });
                }
            });
        } catch (Throwable th) {
            androidApplicationBase.log("AndroidApplication", "Can't create OnSystemUiVisibilityChangeListener, unable to use immersive mode.", th);
        }
    }
}
