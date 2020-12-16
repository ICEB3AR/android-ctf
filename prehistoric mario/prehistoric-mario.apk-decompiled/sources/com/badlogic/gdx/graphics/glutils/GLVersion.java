package com.badlogic.gdx.graphics.glutils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GLVersion {
    private final String TAG = "GLVersion";
    private int majorVersion;
    private int minorVersion;
    private int releaseVersion;
    private final String rendererString;
    private final Type type;
    private final String vendorString;

    public enum Type {
        OpenGL,
        GLES,
        WebGL,
        NONE
    }

    public GLVersion(Application.ApplicationType applicationType, String str, String str2, String str3) {
        if (applicationType == Application.ApplicationType.Android) {
            this.type = Type.GLES;
        } else if (applicationType == Application.ApplicationType.iOS) {
            this.type = Type.GLES;
        } else if (applicationType == Application.ApplicationType.Desktop) {
            this.type = Type.OpenGL;
        } else if (applicationType == Application.ApplicationType.Applet) {
            this.type = Type.OpenGL;
        } else if (applicationType == Application.ApplicationType.WebGL) {
            this.type = Type.WebGL;
        } else {
            this.type = Type.NONE;
        }
        if (this.type == Type.GLES) {
            extractVersion("OpenGL ES (\\d(\\.\\d){0,2})", str);
        } else if (this.type == Type.WebGL) {
            extractVersion("WebGL (\\d(\\.\\d){0,2})", str);
        } else if (this.type == Type.OpenGL) {
            extractVersion("(\\d(\\.\\d){0,2})", str);
        } else {
            this.majorVersion = -1;
            this.minorVersion = -1;
            this.releaseVersion = -1;
            str2 = BuildConfig.FLAVOR;
            str3 = str2;
        }
        this.vendorString = str2;
        this.rendererString = str3;
    }

    private void extractVersion(String str, String str2) {
        Matcher matcher = Pattern.compile(str).matcher(str2);
        int i = 0;
        if (matcher.find()) {
            String[] split = matcher.group(1).split("\\.");
            this.majorVersion = parseInt(split[0], 2);
            this.minorVersion = split.length < 2 ? 0 : parseInt(split[1], 0);
            if (split.length >= 3) {
                i = parseInt(split[2], 0);
            }
            this.releaseVersion = i;
            return;
        }
        Application application = Gdx.app;
        application.log("GLVersion", "Invalid version string: " + str2);
        this.majorVersion = 2;
        this.minorVersion = 0;
        this.releaseVersion = 0;
    }

    private int parseInt(String str, int i) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException unused) {
            Application application = Gdx.app;
            application.error("LibGDX GL", "Error parsing number: " + str + ", assuming: " + i);
            return i;
        }
    }

    public Type getType() {
        return this.type;
    }

    public int getMajorVersion() {
        return this.majorVersion;
    }

    public int getMinorVersion() {
        return this.minorVersion;
    }

    public int getReleaseVersion() {
        return this.releaseVersion;
    }

    public String getVendorString() {
        return this.vendorString;
    }

    public String getRendererString() {
        return this.rendererString;
    }

    public boolean isVersionEqualToOrHigher(int i, int i2) {
        int i3 = this.majorVersion;
        return i3 > i || (i3 == i && this.minorVersion >= i2);
    }

    public String getDebugVersionString() {
        return "Type: " + this.type + "\nVersion: " + this.majorVersion + ":" + this.minorVersion + ":" + this.releaseVersion + "\nVendor: " + this.vendorString + "\nRenderer: " + this.rendererString;
    }
}
