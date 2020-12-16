package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import java.text.MessageFormat;
import java.util.Locale;

/* access modifiers changed from: package-private */
public class TextFormatter {
    private StringBuilder buffer = new StringBuilder();
    private MessageFormat messageFormat;

    public TextFormatter(Locale locale, boolean z) {
        if (z) {
            this.messageFormat = new MessageFormat(BuildConfig.FLAVOR, locale);
        }
    }

    public String format(String str, Object... objArr) {
        MessageFormat messageFormat2 = this.messageFormat;
        if (messageFormat2 == null) {
            return simpleFormat(str, objArr);
        }
        messageFormat2.applyPattern(replaceEscapeChars(str));
        return this.messageFormat.format(objArr);
    }

    private String replaceEscapeChars(String str) {
        int i = 0;
        this.buffer.setLength(0);
        int length = str.length();
        boolean z = false;
        while (i < length) {
            char charAt = str.charAt(i);
            if (charAt == '\'') {
                this.buffer.append("''");
                z = true;
            } else if (charAt == '{') {
                int i2 = i + 1;
                while (i2 < length && str.charAt(i2) == '{') {
                    i2++;
                }
                int i3 = i2 - i;
                int i4 = i3 / 2;
                if (i4 > 0) {
                    this.buffer.append('\'');
                    do {
                        this.buffer.append('{');
                        i4--;
                    } while (i4 > 0);
                    this.buffer.append('\'');
                    z = true;
                }
                if (i3 % 2 != 0) {
                    this.buffer.append('{');
                }
                i = i2 - 1;
            } else {
                this.buffer.append(charAt);
            }
            i++;
        }
        return z ? this.buffer.toString() : str;
    }

    private String simpleFormat(String str, Object... objArr) {
        this.buffer.setLength(0);
        int length = str.length();
        int i = 0;
        int i2 = -1;
        boolean z = false;
        while (i < length) {
            char charAt = str.charAt(i);
            if (i2 < 0) {
                if (charAt == '{') {
                    int i3 = i + 1;
                    if (i3 >= length || str.charAt(i3) != '{') {
                        i2 = 0;
                    } else {
                        this.buffer.append(charAt);
                        i = i3;
                    }
                    z = true;
                } else {
                    this.buffer.append(charAt);
                }
            } else if (charAt == '}') {
                if (i2 >= objArr.length) {
                    throw new IllegalArgumentException("Argument index out of bounds: " + i2);
                } else if (str.charAt(i - 1) != '{') {
                    if (objArr[i2] == null) {
                        this.buffer.append("null");
                    } else {
                        this.buffer.append(objArr[i2].toString());
                    }
                    i2 = -1;
                } else {
                    throw new IllegalArgumentException("Missing argument index after a left curly brace");
                }
            } else if (charAt < '0' || charAt > '9') {
                throw new IllegalArgumentException("Unexpected '" + charAt + "' while parsing argument index");
            } else {
                i2 = (i2 * 10) + (charAt - '0');
            }
            i++;
        }
        if (i2 < 0) {
            return z ? this.buffer.toString() : str;
        }
        throw new IllegalArgumentException("Unmatched braces in the pattern.");
    }
}
