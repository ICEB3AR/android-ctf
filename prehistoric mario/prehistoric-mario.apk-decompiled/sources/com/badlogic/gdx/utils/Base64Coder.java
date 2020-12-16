package com.badlogic.gdx.utils;

public class Base64Coder {
    public static final CharMap regularMap = new CharMap('+', '/');
    private static final String systemLineSeparator = "\n";
    public static final CharMap urlsafeMap = new CharMap('-', '_');

    public static class CharMap {
        protected final byte[] decodingMap = new byte[128];
        protected final char[] encodingMap = new char[64];

        public CharMap(char c, char c2) {
            char c3 = 'A';
            int i = 0;
            while (c3 <= 'Z') {
                this.encodingMap[i] = c3;
                c3 = (char) (c3 + 1);
                i++;
            }
            char c4 = 'a';
            while (c4 <= 'z') {
                this.encodingMap[i] = c4;
                c4 = (char) (c4 + 1);
                i++;
            }
            char c5 = '0';
            while (c5 <= '9') {
                this.encodingMap[i] = c5;
                c5 = (char) (c5 + 1);
                i++;
            }
            char[] cArr = this.encodingMap;
            cArr[i] = c;
            cArr[i + 1] = c2;
            int i2 = 0;
            while (true) {
                byte[] bArr = this.decodingMap;
                if (i2 >= bArr.length) {
                    break;
                }
                bArr[i2] = -1;
                i2++;
            }
            for (int i3 = 0; i3 < 64; i3++) {
                this.decodingMap[this.encodingMap[i3]] = (byte) i3;
            }
        }

        public byte[] getDecodingMap() {
            return this.decodingMap;
        }

        public char[] getEncodingMap() {
            return this.encodingMap;
        }
    }

    public static String encodeString(String str) {
        return encodeString(str, false);
    }

    public static String encodeString(String str, boolean z) {
        return new String(encode(str.getBytes(), (z ? urlsafeMap : regularMap).encodingMap));
    }

    public static String encodeLines(byte[] bArr) {
        return encodeLines(bArr, 0, bArr.length, 76, systemLineSeparator, regularMap.encodingMap);
    }

    public static String encodeLines(byte[] bArr, int i, int i2, int i3, String str, CharMap charMap) {
        return encodeLines(bArr, i, i2, i3, str, charMap.encodingMap);
    }

    public static String encodeLines(byte[] bArr, int i, int i2, int i3, String str, char[] cArr) {
        int i4 = (i3 * 3) / 4;
        if (i4 > 0) {
            StringBuilder stringBuilder = new StringBuilder((((i2 + 2) / 3) * 4) + ((((i2 + i4) - 1) / i4) * str.length()));
            int i5 = 0;
            while (i5 < i2) {
                int min = Math.min(i2 - i5, i4);
                stringBuilder.append(encode(bArr, i + i5, min, cArr));
                stringBuilder.append(str);
                i5 += min;
            }
            return stringBuilder.toString();
        }
        throw new IllegalArgumentException();
    }

    public static char[] encode(byte[] bArr) {
        return encode(bArr, regularMap.encodingMap);
    }

    public static char[] encode(byte[] bArr, CharMap charMap) {
        return encode(bArr, 0, bArr.length, charMap);
    }

    public static char[] encode(byte[] bArr, char[] cArr) {
        return encode(bArr, 0, bArr.length, cArr);
    }

    public static char[] encode(byte[] bArr, int i) {
        return encode(bArr, 0, i, regularMap.encodingMap);
    }

    public static char[] encode(byte[] bArr, int i, int i2, CharMap charMap) {
        return encode(bArr, i, i2, charMap.encodingMap);
    }

    public static char[] encode(byte[] bArr, int i, int i2, char[] cArr) {
        int i3;
        int i4;
        int i5;
        int i6;
        int i7 = ((i2 * 4) + 2) / 3;
        char[] cArr2 = new char[(((i2 + 2) / 3) * 4)];
        int i8 = i2 + i;
        int i9 = 0;
        while (i < i8) {
            int i10 = i + 1;
            int i11 = bArr[i] & 255;
            if (i10 < i8) {
                i3 = i10 + 1;
                i4 = bArr[i10] & 255;
            } else {
                i3 = i10;
                i4 = 0;
            }
            if (i3 < i8) {
                i5 = i3 + 1;
                i6 = bArr[i3] & 255;
            } else {
                i5 = i3;
                i6 = 0;
            }
            int i12 = i11 >>> 2;
            int i13 = ((i11 & 3) << 4) | (i4 >>> 4);
            int i14 = ((i4 & 15) << 2) | (i6 >>> 6);
            int i15 = i6 & 63;
            int i16 = i9 + 1;
            cArr2[i9] = cArr[i12];
            int i17 = i16 + 1;
            cArr2[i16] = cArr[i13];
            char c = '=';
            cArr2[i17] = i17 < i7 ? cArr[i14] : '=';
            int i18 = i17 + 1;
            if (i18 < i7) {
                c = cArr[i15];
            }
            cArr2[i18] = c;
            i9 = i18 + 1;
            i = i5;
        }
        return cArr2;
    }

    public static String decodeString(String str) {
        return decodeString(str, false);
    }

    public static String decodeString(String str, boolean z) {
        return new String(decode(str.toCharArray(), (z ? urlsafeMap : regularMap).decodingMap));
    }

    public static byte[] decodeLines(String str) {
        return decodeLines(str, regularMap.decodingMap);
    }

    public static byte[] decodeLines(String str, CharMap charMap) {
        return decodeLines(str, charMap.decodingMap);
    }

    public static byte[] decodeLines(String str, byte[] bArr) {
        char[] cArr = new char[str.length()];
        int i = 0;
        for (int i2 = 0; i2 < str.length(); i2++) {
            char charAt = str.charAt(i2);
            if (!(charAt == ' ' || charAt == '\r' || charAt == '\n' || charAt == '\t')) {
                cArr[i] = charAt;
                i++;
            }
        }
        return decode(cArr, 0, i, bArr);
    }

    public static byte[] decode(String str) {
        return decode(str.toCharArray());
    }

    public static byte[] decode(String str, CharMap charMap) {
        return decode(str.toCharArray(), charMap);
    }

    public static byte[] decode(char[] cArr, byte[] bArr) {
        return decode(cArr, 0, cArr.length, bArr);
    }

    public static byte[] decode(char[] cArr, CharMap charMap) {
        return decode(cArr, 0, cArr.length, charMap);
    }

    public static byte[] decode(char[] cArr) {
        return decode(cArr, 0, cArr.length, regularMap.decodingMap);
    }

    public static byte[] decode(char[] cArr, int i, int i2, CharMap charMap) {
        return decode(cArr, i, i2, charMap.decodingMap);
    }

    public static byte[] decode(char[] cArr, int i, int i2, byte[] bArr) {
        int i3;
        char c;
        int i4;
        if (i2 % 4 == 0) {
            while (i2 > 0 && cArr[(i + i2) - 1] == '=') {
                i2--;
            }
            int i5 = (i2 * 3) / 4;
            byte[] bArr2 = new byte[i5];
            int i6 = i2 + i;
            int i7 = 0;
            while (i < i6) {
                int i8 = i + 1;
                char c2 = cArr[i];
                int i9 = i8 + 1;
                char c3 = cArr[i8];
                char c4 = 'A';
                if (i9 < i6) {
                    i3 = i9 + 1;
                    c = cArr[i9];
                } else {
                    i3 = i9;
                    c = 'A';
                }
                if (i3 < i6) {
                    int i10 = i3 + 1;
                    char c5 = cArr[i3];
                    i3 = i10;
                    c4 = c5;
                }
                if (c2 > 127 || c3 > 127 || c > 127 || c4 > 127) {
                    throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
                }
                byte b = bArr[c2];
                byte b2 = bArr[c3];
                byte b3 = bArr[c];
                byte b4 = bArr[c4];
                if (b < 0 || b2 < 0 || b3 < 0 || b4 < 0) {
                    throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
                }
                int i11 = (b << 2) | (b2 >>> 4);
                int i12 = ((b2 & 15) << 4) | (b3 >>> 2);
                int i13 = ((b3 & 3) << 6) | b4;
                int i14 = i7 + 1;
                bArr2[i7] = (byte) i11;
                if (i14 < i5) {
                    i4 = i14 + 1;
                    bArr2[i14] = (byte) i12;
                } else {
                    i4 = i14;
                }
                if (i4 < i5) {
                    i7 = i4 + 1;
                    bArr2[i4] = (byte) i13;
                } else {
                    i7 = i4;
                }
                i = i3;
            }
            return bArr2;
        }
        throw new IllegalArgumentException("Length of Base64 encoded input string is not a multiple of 4.");
    }

    private Base64Coder() {
    }
}
