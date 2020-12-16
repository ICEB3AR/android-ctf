package com.badlogic.gdx;

import com.badlogic.gdx.utils.GdxRuntimeException;

public class Version {
    public static final int MAJOR;
    public static final int MINOR;
    public static final int REVISION;
    public static final String VERSION = "1.9.10";

    static {
        try {
            String[] split = VERSION.split("\\.");
            int i = 0;
            MAJOR = split.length < 1 ? 0 : Integer.valueOf(split[0]).intValue();
            MINOR = split.length < 2 ? 0 : Integer.valueOf(split[1]).intValue();
            if (split.length >= 3) {
                i = Integer.valueOf(split[2]).intValue();
            }
            REVISION = i;
        } catch (Throwable th) {
            throw new GdxRuntimeException("Invalid version 1.9.10", th);
        }
    }

    public static boolean isHigher(int i, int i2, int i3) {
        return isHigherEqual(i, i2, i3 + 1);
    }

    public static boolean isHigherEqual(int i, int i2, int i3) {
        int i4 = MAJOR;
        if (i4 != i) {
            return i4 > i;
        }
        int i5 = MINOR;
        if (i5 != i2) {
            if (i5 > i2) {
                return true;
            }
            return false;
        } else if (REVISION >= i3) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isLower(int i, int i2, int i3) {
        return isLowerEqual(i, i2, i3 - 1);
    }

    public static boolean isLowerEqual(int i, int i2, int i3) {
        int i4 = MAJOR;
        if (i4 != i) {
            return i4 < i;
        }
        int i5 = MINOR;
        if (i5 != i2) {
            if (i5 < i2) {
                return true;
            }
            return false;
        } else if (REVISION <= i3) {
            return true;
        } else {
            return false;
        }
    }
}
