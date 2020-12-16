package com.badlogic.gdx.backends.android;

import android.content.SharedPreferences;
import android.os.Build;
import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Preferences;
import java.util.Map;

public class AndroidPreferences implements Preferences {
    SharedPreferences.Editor editor;
    SharedPreferences sharedPrefs;

    public AndroidPreferences(SharedPreferences sharedPreferences) {
        this.sharedPrefs = sharedPreferences;
    }

    @Override // com.badlogic.gdx.Preferences
    public Preferences putBoolean(String str, boolean z) {
        edit();
        this.editor.putBoolean(str, z);
        return this;
    }

    @Override // com.badlogic.gdx.Preferences
    public Preferences putInteger(String str, int i) {
        edit();
        this.editor.putInt(str, i);
        return this;
    }

    @Override // com.badlogic.gdx.Preferences
    public Preferences putLong(String str, long j) {
        edit();
        this.editor.putLong(str, j);
        return this;
    }

    @Override // com.badlogic.gdx.Preferences
    public Preferences putFloat(String str, float f) {
        edit();
        this.editor.putFloat(str, f);
        return this;
    }

    @Override // com.badlogic.gdx.Preferences
    public Preferences putString(String str, String str2) {
        edit();
        this.editor.putString(str, str2);
        return this;
    }

    @Override // com.badlogic.gdx.Preferences
    public Preferences put(Map<String, ?> map) {
        edit();
        for (Map.Entry<String, ?> entry : map.entrySet()) {
            if (entry.getValue() instanceof Boolean) {
                putBoolean(entry.getKey(), ((Boolean) entry.getValue()).booleanValue());
            }
            if (entry.getValue() instanceof Integer) {
                putInteger(entry.getKey(), ((Integer) entry.getValue()).intValue());
            }
            if (entry.getValue() instanceof Long) {
                putLong(entry.getKey(), ((Long) entry.getValue()).longValue());
            }
            if (entry.getValue() instanceof String) {
                putString(entry.getKey(), (String) entry.getValue());
            }
            if (entry.getValue() instanceof Float) {
                putFloat(entry.getKey(), ((Float) entry.getValue()).floatValue());
            }
        }
        return this;
    }

    @Override // com.badlogic.gdx.Preferences
    public boolean getBoolean(String str) {
        return this.sharedPrefs.getBoolean(str, false);
    }

    @Override // com.badlogic.gdx.Preferences
    public int getInteger(String str) {
        return this.sharedPrefs.getInt(str, 0);
    }

    @Override // com.badlogic.gdx.Preferences
    public long getLong(String str) {
        return this.sharedPrefs.getLong(str, 0);
    }

    @Override // com.badlogic.gdx.Preferences
    public float getFloat(String str) {
        return this.sharedPrefs.getFloat(str, 0.0f);
    }

    @Override // com.badlogic.gdx.Preferences
    public String getString(String str) {
        return this.sharedPrefs.getString(str, BuildConfig.FLAVOR);
    }

    @Override // com.badlogic.gdx.Preferences
    public boolean getBoolean(String str, boolean z) {
        return this.sharedPrefs.getBoolean(str, z);
    }

    @Override // com.badlogic.gdx.Preferences
    public int getInteger(String str, int i) {
        return this.sharedPrefs.getInt(str, i);
    }

    @Override // com.badlogic.gdx.Preferences
    public long getLong(String str, long j) {
        return this.sharedPrefs.getLong(str, j);
    }

    @Override // com.badlogic.gdx.Preferences
    public float getFloat(String str, float f) {
        return this.sharedPrefs.getFloat(str, f);
    }

    @Override // com.badlogic.gdx.Preferences
    public String getString(String str, String str2) {
        return this.sharedPrefs.getString(str, str2);
    }

    @Override // com.badlogic.gdx.Preferences
    public Map<String, ?> get() {
        return this.sharedPrefs.getAll();
    }

    @Override // com.badlogic.gdx.Preferences
    public boolean contains(String str) {
        return this.sharedPrefs.contains(str);
    }

    @Override // com.badlogic.gdx.Preferences
    public void clear() {
        edit();
        this.editor.clear();
    }

    @Override // com.badlogic.gdx.Preferences
    public void flush() {
        if (this.editor != null) {
            if (Build.VERSION.SDK_INT >= 9) {
                this.editor.apply();
            } else {
                this.editor.commit();
            }
            this.editor = null;
        }
    }

    @Override // com.badlogic.gdx.Preferences
    public void remove(String str) {
        edit();
        this.editor.remove(str);
    }

    private void edit() {
        if (this.editor == null) {
            this.editor = this.sharedPrefs.edit();
        }
    }
}
