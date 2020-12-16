package com.badlogic.gdx.utils;

import com.badlogic.gdx.net.HttpStatus;
import com.badlogic.gdx.utils.ObjectMap;
import java.io.IOException;
import java.io.Writer;
import java.util.Date;

public final class PropertiesUtils {
    private static final int CONTINUE = 3;
    private static final int IGNORE = 5;
    private static final int KEY_DONE = 4;
    private static final String LINE_SEPARATOR = "\n";
    private static final int NONE = 0;
    private static final int SLASH = 1;
    private static final int UNICODE = 2;

    private PropertiesUtils() {
    }

    /* JADX WARNING: Code restructure failed: missing block: B:103:0x0130, code lost:
        if (r11 != 3) goto L_0x0133;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void load(com.badlogic.gdx.utils.ObjectMap<java.lang.String, java.lang.String> r16, java.io.Reader r17) throws java.io.IOException {
        /*
        // Method dump skipped, instructions count: 380
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.PropertiesUtils.load(com.badlogic.gdx.utils.ObjectMap, java.io.Reader):void");
    }

    public static void store(ObjectMap<String, String> objectMap, Writer writer, String str) throws IOException {
        storeImpl(objectMap, writer, str, false);
    }

    private static void storeImpl(ObjectMap<String, String> objectMap, Writer writer, String str, boolean z) throws IOException {
        if (str != null) {
            writeComment(writer, str);
        }
        writer.write("#");
        writer.write(new Date().toString());
        writer.write(LINE_SEPARATOR);
        StringBuilder stringBuilder = new StringBuilder((int) HttpStatus.SC_OK);
        ObjectMap.Entries<String, String> it = objectMap.entries().iterator();
        while (it.hasNext()) {
            ObjectMap.Entry entry = (ObjectMap.Entry) it.next();
            dumpString(stringBuilder, entry.key, true, z);
            stringBuilder.append('=');
            dumpString(stringBuilder, entry.value, false, z);
            writer.write(LINE_SEPARATOR);
            writer.write(stringBuilder.toString());
            stringBuilder.setLength(0);
        }
        writer.flush();
    }

    private static void dumpString(StringBuilder stringBuilder, String str, boolean z, boolean z2) {
        Object obj;
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if (charAt > '=' && charAt < 127) {
                if (charAt == '\\') {
                    obj = "\\\\";
                } else {
                    obj = Character.valueOf(charAt);
                }
                stringBuilder.append(obj);
            } else if (charAt == '\t') {
                stringBuilder.append("\\t");
            } else if (charAt == '\n') {
                stringBuilder.append("\\n");
            } else if (charAt == '\f') {
                stringBuilder.append("\\f");
            } else if (charAt == '\r') {
                stringBuilder.append("\\r");
            } else if (charAt != ' ') {
                if (charAt == '!' || charAt == '#' || charAt == ':' || charAt == '=') {
                    stringBuilder.append('\\').append(charAt);
                } else if ((charAt < ' ' || charAt > '~') && z2) {
                    String hexString = Integer.toHexString(charAt);
                    stringBuilder.append("\\u");
                    for (int i2 = 0; i2 < 4 - hexString.length(); i2++) {
                        stringBuilder.append('0');
                    }
                    stringBuilder.append(hexString);
                } else {
                    stringBuilder.append(charAt);
                }
            } else if (i == 0 || z) {
                stringBuilder.append("\\ ");
            } else {
                stringBuilder.append(charAt);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:27:0x006f, code lost:
        if (r11.charAt(r4) != '!') goto L_0x0071;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void writeComment(java.io.Writer r10, java.lang.String r11) throws java.io.IOException {
        /*
        // Method dump skipped, instructions count: 134
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.PropertiesUtils.writeComment(java.io.Writer, java.lang.String):void");
    }
}
