package com.badlogic.gdx.graphics.profiling;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.utils.GdxRuntimeException;

public interface GLErrorListener {
    public static final GLErrorListener LOGGING_LISTENER = new GLErrorListener() {
        /* class com.badlogic.gdx.graphics.profiling.GLErrorListener.AnonymousClass1 */

        @Override // com.badlogic.gdx.graphics.profiling.GLErrorListener
        public void onError(int i) {
            String str = null;
            try {
                StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
                int i2 = 0;
                while (true) {
                    if (i2 >= stackTrace.length) {
                        break;
                    } else if ("check".equals(stackTrace[i2].getMethodName())) {
                        int i3 = i2 + 1;
                        if (i3 < stackTrace.length) {
                            str = stackTrace[i3].getMethodName();
                        }
                    } else {
                        i2++;
                    }
                }
            } catch (Exception unused) {
            }
            if (str != null) {
                Application application = Gdx.app;
                application.error("GLProfiler", "Error " + GLInterceptor.resolveErrorNumber(i) + " from " + str);
                return;
            }
            Application application2 = Gdx.app;
            application2.error("GLProfiler", "Error " + GLInterceptor.resolveErrorNumber(i) + " at: ", new Exception());
        }
    };
    public static final GLErrorListener THROWING_LISTENER = new GLErrorListener() {
        /* class com.badlogic.gdx.graphics.profiling.GLErrorListener.AnonymousClass2 */

        @Override // com.badlogic.gdx.graphics.profiling.GLErrorListener
        public void onError(int i) {
            throw new GdxRuntimeException("GLProfiler: Got GL error " + GLInterceptor.resolveErrorNumber(i));
        }
    };

    void onError(int i);
}
