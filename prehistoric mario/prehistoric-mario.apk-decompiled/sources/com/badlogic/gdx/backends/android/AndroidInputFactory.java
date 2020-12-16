package com.badlogic.gdx.backends.android;

import android.content.Context;
import android.os.Build;
import com.badlogic.gdx.Application;

public class AndroidInputFactory {
    public static AndroidInput newAndroidInput(Application application, Context context, Object obj, AndroidApplicationConfiguration androidApplicationConfiguration) {
        Class<?> cls;
        try {
            if (Build.VERSION.SDK_INT >= 12) {
                cls = Class.forName("com.badlogic.gdx.backends.android.AndroidInputThreePlus");
            } else {
                cls = Class.forName("com.badlogic.gdx.backends.android.AndroidInput");
            }
            return (AndroidInput) cls.getConstructor(Application.class, Context.class, Object.class, AndroidApplicationConfiguration.class).newInstance(application, context, obj, androidApplicationConfiguration);
        } catch (Exception e) {
            throw new RuntimeException("Couldn't construct AndroidInput, this should never happen", e);
        }
    }
}
