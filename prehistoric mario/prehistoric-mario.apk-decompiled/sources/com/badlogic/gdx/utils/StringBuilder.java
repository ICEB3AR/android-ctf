package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import java.util.Arrays;

public class StringBuilder implements Appendable, CharSequence {
    static final int INITIAL_CAPACITY = 16;
    private static final char[] digits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    public char[] chars;
    public int length;

    public static int numChars(int i, int i2) {
        int i3 = i < 0 ? 2 : 1;
        while (true) {
            i /= i2;
            if (i == 0) {
                return i3;
            }
            i3++;
        }
    }

    public static int numChars(long j, int i) {
        int i2 = j < 0 ? 2 : 1;
        while (true) {
            j /= (long) i;
            if (j == 0) {
                return i2;
            }
            i2++;
        }
    }

    /* access modifiers changed from: package-private */
    public final char[] getValue() {
        return this.chars;
    }

    public StringBuilder() {
        this.chars = new char[16];
    }

    public StringBuilder(int i) {
        if (i >= 0) {
            this.chars = new char[i];
            return;
        }
        throw new NegativeArraySizeException();
    }

    public StringBuilder(CharSequence charSequence) {
        this(charSequence.toString());
    }

    public StringBuilder(StringBuilder stringBuilder) {
        this.length = stringBuilder.length;
        int i = this.length;
        this.chars = new char[(i + 16)];
        System.arraycopy(stringBuilder.chars, 0, this.chars, 0, i);
    }

    public StringBuilder(String str) {
        this.length = str.length();
        int i = this.length;
        this.chars = new char[(i + 16)];
        str.getChars(0, i, this.chars, 0);
    }

    private void enlargeBuffer(int i) {
        char[] cArr = this.chars;
        int length2 = (cArr.length >> 1) + cArr.length + 2;
        if (i <= length2) {
            i = length2;
        }
        char[] cArr2 = new char[i];
        System.arraycopy(this.chars, 0, cArr2, 0, this.length);
        this.chars = cArr2;
    }

    /* access modifiers changed from: package-private */
    public final void appendNull() {
        int i = this.length + 4;
        if (i > this.chars.length) {
            enlargeBuffer(i);
        }
        char[] cArr = this.chars;
        int i2 = this.length;
        this.length = i2 + 1;
        cArr[i2] = 'n';
        int i3 = this.length;
        this.length = i3 + 1;
        cArr[i3] = 'u';
        int i4 = this.length;
        this.length = i4 + 1;
        cArr[i4] = 'l';
        int i5 = this.length;
        this.length = i5 + 1;
        cArr[i5] = 'l';
    }

    /* access modifiers changed from: package-private */
    public final void append0(char[] cArr) {
        int length2 = this.length + cArr.length;
        if (length2 > this.chars.length) {
            enlargeBuffer(length2);
        }
        System.arraycopy(cArr, 0, this.chars, this.length, cArr.length);
        this.length = length2;
    }

    /* access modifiers changed from: package-private */
    public final void append0(char[] cArr, int i, int i2) {
        if (i > cArr.length || i < 0) {
            throw new ArrayIndexOutOfBoundsException("Offset out of bounds: " + i);
        } else if (i2 < 0 || cArr.length - i < i2) {
            throw new ArrayIndexOutOfBoundsException("Length out of bounds: " + i2);
        } else {
            int i3 = this.length + i2;
            if (i3 > this.chars.length) {
                enlargeBuffer(i3);
            }
            System.arraycopy(cArr, i, this.chars, this.length, i2);
            this.length = i3;
        }
    }

    /* access modifiers changed from: package-private */
    public final void append0(char c) {
        int i = this.length;
        if (i == this.chars.length) {
            enlargeBuffer(i + 1);
        }
        char[] cArr = this.chars;
        int i2 = this.length;
        this.length = i2 + 1;
        cArr[i2] = c;
    }

    /* access modifiers changed from: package-private */
    public final void append0(String str) {
        if (str == null) {
            appendNull();
            return;
        }
        int length2 = str.length();
        int i = this.length + length2;
        if (i > this.chars.length) {
            enlargeBuffer(i);
        }
        str.getChars(0, length2, this.chars, this.length);
        this.length = i;
    }

    /* access modifiers changed from: package-private */
    public final void append0(CharSequence charSequence, int i, int i2) {
        if (charSequence == null) {
            charSequence = "null";
        }
        if (i < 0 || i2 < 0 || i > i2 || i2 > charSequence.length()) {
            throw new IndexOutOfBoundsException();
        }
        append0(charSequence.subSequence(i, i2).toString());
    }

    public int capacity() {
        return this.chars.length;
    }

    public char charAt(int i) {
        if (i >= 0 && i < this.length) {
            return this.chars[i];
        }
        throw new StringIndexOutOfBoundsException(i);
    }

    /* access modifiers changed from: package-private */
    public final void delete0(int i, int i2) {
        if (i >= 0) {
            int i3 = this.length;
            if (i2 > i3) {
                i2 = i3;
            }
            if (i2 != i) {
                if (i2 > i) {
                    int i4 = this.length - i2;
                    if (i4 >= 0) {
                        char[] cArr = this.chars;
                        System.arraycopy(cArr, i2, cArr, i, i4);
                    }
                    this.length -= i2 - i;
                    return;
                }
            } else {
                return;
            }
        }
        throw new StringIndexOutOfBoundsException();
    }

    /* access modifiers changed from: package-private */
    public final void deleteCharAt0(int i) {
        int i2;
        if (i < 0 || i >= (i2 = this.length)) {
            throw new StringIndexOutOfBoundsException(i);
        }
        int i3 = (i2 - i) - 1;
        if (i3 > 0) {
            char[] cArr = this.chars;
            System.arraycopy(cArr, i + 1, cArr, i, i3);
        }
        this.length--;
    }

    public void ensureCapacity(int i) {
        char[] cArr = this.chars;
        if (i > cArr.length) {
            int length2 = (cArr.length << 1) + 2;
            if (length2 > i) {
                i = length2;
            }
            enlargeBuffer(i);
        }
    }

    public void getChars(int i, int i2, char[] cArr, int i3) {
        int i4 = this.length;
        if (i > i4 || i2 > i4 || i > i2) {
            throw new StringIndexOutOfBoundsException();
        }
        System.arraycopy(this.chars, i, cArr, i3, i2 - i);
    }

    /* access modifiers changed from: package-private */
    public final void insert0(int i, char[] cArr) {
        if (i < 0 || i > this.length) {
            throw new StringIndexOutOfBoundsException(i);
        } else if (cArr.length != 0) {
            move(cArr.length, i);
            System.arraycopy(cArr, 0, cArr, i, cArr.length);
            this.length += cArr.length;
        }
    }

    /* access modifiers changed from: package-private */
    public final void insert0(int i, char[] cArr, int i2, int i3) {
        if (i < 0 || i > i3) {
            throw new StringIndexOutOfBoundsException(i);
        } else if (i2 < 0 || i3 < 0 || i3 > cArr.length - i2) {
            throw new StringIndexOutOfBoundsException("offset " + i2 + ", length " + i3 + ", char[].length " + cArr.length);
        } else if (i3 != 0) {
            move(i3, i);
            System.arraycopy(cArr, i2, this.chars, i, i3);
            this.length += i3;
        }
    }

    /* access modifiers changed from: package-private */
    public final void insert0(int i, char c) {
        if (i < 0 || i > this.length) {
            throw new ArrayIndexOutOfBoundsException(i);
        }
        move(1, i);
        this.chars[i] = c;
        this.length++;
    }

    /* access modifiers changed from: package-private */
    public final void insert0(int i, String str) {
        if (i < 0 || i > this.length) {
            throw new StringIndexOutOfBoundsException(i);
        }
        if (str == null) {
            str = "null";
        }
        int length2 = str.length();
        if (length2 != 0) {
            move(length2, i);
            str.getChars(0, length2, this.chars, i);
            this.length += length2;
        }
    }

    /* access modifiers changed from: package-private */
    public final void insert0(int i, CharSequence charSequence, int i2, int i3) {
        if (charSequence == null) {
            charSequence = "null";
        }
        if (i < 0 || i > this.length || i2 < 0 || i3 < 0 || i2 > i3 || i3 > charSequence.length()) {
            throw new IndexOutOfBoundsException();
        }
        insert0(i, charSequence.subSequence(i2, i3).toString());
    }

    public int length() {
        return this.length;
    }

    private void move(int i, int i2) {
        char[] cArr = this.chars;
        int length2 = cArr.length;
        int i3 = this.length;
        if (length2 - i3 >= i) {
            System.arraycopy(cArr, i2, cArr, i + i2, i3 - i2);
            return;
        }
        int i4 = i3 + i;
        int length3 = (cArr.length << 1) + 2;
        if (i4 > length3) {
            length3 = i4;
        }
        char[] cArr2 = new char[length3];
        System.arraycopy(this.chars, 0, cArr2, 0, i2);
        System.arraycopy(this.chars, i2, cArr2, i + i2, this.length - i2);
        this.chars = cArr2;
    }

    /* access modifiers changed from: package-private */
    public final void replace0(int i, int i2, String str) {
        if (i >= 0) {
            int i3 = this.length;
            if (i2 > i3) {
                i2 = i3;
            }
            if (i2 > i) {
                int length2 = str.length();
                int i4 = (i2 - i) - length2;
                if (i4 > 0) {
                    char[] cArr = this.chars;
                    System.arraycopy(cArr, i2, cArr, i + length2, this.length - i2);
                } else if (i4 < 0) {
                    move(-i4, i2);
                }
                str.getChars(0, length2, this.chars, i);
                this.length -= i4;
                return;
            } else if (i == i2) {
                if (str != null) {
                    insert0(i, str);
                    return;
                }
                throw new NullPointerException();
            }
        }
        throw new StringIndexOutOfBoundsException();
    }

    /* access modifiers changed from: package-private */
    public final void reverse0() {
        int i;
        int i2 = this.length;
        if (i2 >= 2) {
            int i3 = i2 - 1;
            char[] cArr = this.chars;
            char c = cArr[0];
            int i4 = i2 / 2;
            char c2 = cArr[i3];
            char c3 = c;
            boolean z = true;
            boolean z2 = true;
            int i5 = i3;
            int i6 = 0;
            while (i6 < i4) {
                char[] cArr2 = this.chars;
                int i7 = i6 + 1;
                char c4 = cArr2[i7];
                int i8 = i5 - 1;
                char c5 = cArr2[i8];
                boolean z3 = z && c4 >= 56320 && c4 <= 57343 && c3 >= 55296 && c3 <= 56319;
                if (!z3 || this.length >= 3) {
                    if (z3 == (z2 && c5 >= 55296 && c5 <= 56319 && c2 >= 56320 && c2 <= 57343)) {
                        if (z3) {
                            char[] cArr3 = this.chars;
                            cArr3[i5] = c4;
                            cArr3[i8] = c3;
                            cArr3[i6] = c5;
                            cArr3[i7] = c2;
                            char c6 = cArr3[i6 + 2];
                            i5--;
                            c2 = cArr3[i5 - 2];
                            c3 = c6;
                            i6 = i7;
                        } else {
                            char[] cArr4 = this.chars;
                            cArr4[i5] = c3;
                            cArr4[i6] = c2;
                            c2 = c5;
                            c3 = c4;
                        }
                        i = 1;
                        z = true;
                    } else if (z3) {
                        char[] cArr5 = this.chars;
                        cArr5[i5] = c4;
                        cArr5[i6] = c2;
                        c2 = c5;
                        i = 1;
                        z = false;
                    } else {
                        char[] cArr6 = this.chars;
                        cArr6[i5] = c3;
                        cArr6[i6] = c5;
                        c3 = c4;
                        i = 1;
                        z = true;
                        z2 = false;
                        i6 += i;
                        i5--;
                    }
                    z2 = true;
                    i6 += i;
                    i5--;
                } else {
                    return;
                }
            }
            if ((this.length & 1) != 1) {
                return;
            }
            if (!z || !z2) {
                char[] cArr7 = this.chars;
                if (z) {
                    c3 = c2;
                }
                cArr7[i5] = c3;
            }
        }
    }

    public void setCharAt(int i, char c) {
        if (i < 0 || i >= this.length) {
            throw new StringIndexOutOfBoundsException(i);
        }
        this.chars[i] = c;
    }

    public void setLength(int i) {
        if (i >= 0) {
            char[] cArr = this.chars;
            if (i > cArr.length) {
                enlargeBuffer(i);
            } else {
                int i2 = this.length;
                if (i2 < i) {
                    Arrays.fill(cArr, i2, i, (char) 0);
                }
            }
            this.length = i;
            return;
        }
        throw new StringIndexOutOfBoundsException(i);
    }

    public String substring(int i) {
        int i2;
        if (i < 0 || i > (i2 = this.length)) {
            throw new StringIndexOutOfBoundsException(i);
        } else if (i == i2) {
            return BuildConfig.FLAVOR;
        } else {
            return new String(this.chars, i, i2 - i);
        }
    }

    public String substring(int i, int i2) {
        if (i < 0 || i > i2 || i2 > this.length) {
            throw new StringIndexOutOfBoundsException();
        } else if (i == i2) {
            return BuildConfig.FLAVOR;
        } else {
            return new String(this.chars, i, i2 - i);
        }
    }

    public String toString() {
        int i = this.length;
        if (i == 0) {
            return BuildConfig.FLAVOR;
        }
        return new String(this.chars, 0, i);
    }

    public CharSequence subSequence(int i, int i2) {
        return substring(i, i2);
    }

    public int indexOf(String str) {
        return indexOf(str, 0);
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x002f  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x002e A[SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int indexOf(java.lang.String r11, int r12) {
        /*
            r10 = this;
            r0 = 0
            if (r12 >= 0) goto L_0x0004
            r12 = 0
        L_0x0004:
            int r1 = r11.length()
            if (r1 != 0) goto L_0x0012
            int r11 = r10.length
            if (r12 < r11) goto L_0x0010
            if (r12 != 0) goto L_0x0011
        L_0x0010:
            r11 = r12
        L_0x0011:
            return r11
        L_0x0012:
            int r2 = r10.length
            int r2 = r2 - r1
            r3 = -1
            if (r12 <= r2) goto L_0x0019
            return r3
        L_0x0019:
            char r4 = r11.charAt(r0)
        L_0x001d:
            r5 = 1
            if (r12 > r2) goto L_0x002b
            char[] r6 = r10.chars
            char r6 = r6[r12]
            if (r6 != r4) goto L_0x0028
            r6 = 1
            goto L_0x002c
        L_0x0028:
            int r12 = r12 + 1
            goto L_0x001d
        L_0x002b:
            r6 = 0
        L_0x002c:
            if (r6 != 0) goto L_0x002f
            return r3
        L_0x002f:
            r7 = r12
            r6 = 0
        L_0x0031:
            int r6 = r6 + r5
            if (r6 >= r1) goto L_0x0040
            char[] r8 = r10.chars
            int r7 = r7 + r5
            char r8 = r8[r7]
            char r9 = r11.charAt(r6)
            if (r8 != r9) goto L_0x0040
            goto L_0x0031
        L_0x0040:
            if (r6 != r1) goto L_0x0028
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.StringBuilder.indexOf(java.lang.String, int):int");
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x003a  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0056 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x0039 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x0031 A[SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int indexOfIgnoreCase(java.lang.String r12, int r13) {
        /*
            r11 = this;
            r0 = 0
            if (r13 >= 0) goto L_0x0004
            r13 = 0
        L_0x0004:
            int r1 = r12.length()
            if (r1 != 0) goto L_0x0012
            int r12 = r11.length
            if (r13 < r12) goto L_0x0010
            if (r13 != 0) goto L_0x0011
        L_0x0010:
            r12 = r13
        L_0x0011:
            return r12
        L_0x0012:
            int r2 = r11.length
            int r2 = r2 - r1
            r3 = -1
            if (r13 <= r2) goto L_0x0019
            return r3
        L_0x0019:
            char r4 = r12.charAt(r0)
            char r4 = java.lang.Character.toUpperCase(r4)
            char r5 = java.lang.Character.toLowerCase(r4)
        L_0x0025:
            r6 = 1
            if (r13 > r2) goto L_0x0036
            char[] r7 = r11.chars
            char r7 = r7[r13]
            if (r7 == r4) goto L_0x0034
            if (r7 != r5) goto L_0x0031
            goto L_0x0034
        L_0x0031:
            int r13 = r13 + 1
            goto L_0x0025
        L_0x0034:
            r7 = 1
            goto L_0x0037
        L_0x0036:
            r7 = 0
        L_0x0037:
            if (r7 != 0) goto L_0x003a
            return r3
        L_0x003a:
            r8 = r13
            r7 = 0
        L_0x003c:
            int r7 = r7 + r6
            if (r7 >= r1) goto L_0x0054
            char[] r9 = r11.chars
            int r8 = r8 + r6
            char r9 = r9[r8]
            char r10 = r12.charAt(r7)
            char r10 = java.lang.Character.toUpperCase(r10)
            if (r9 == r10) goto L_0x003c
            char r10 = java.lang.Character.toLowerCase(r10)
            if (r9 == r10) goto L_0x003c
        L_0x0054:
            if (r7 != r1) goto L_0x0031
            return r13
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.StringBuilder.indexOfIgnoreCase(java.lang.String, int):int");
    }

    public boolean contains(String str) {
        return indexOf(str, 0) != -1;
    }

    public boolean containsIgnoreCase(String str) {
        return indexOfIgnoreCase(str, 0) != -1;
    }

    public int lastIndexOf(String str) {
        return lastIndexOf(str, this.length);
    }

    public int lastIndexOf(String str, int i) {
        boolean z;
        int length2 = str.length();
        int i2 = this.length;
        if (length2 > i2 || i < 0) {
            return -1;
        }
        if (length2 <= 0) {
            return i < i2 ? i : i2;
        }
        if (i > i2 - length2) {
            i = i2 - length2;
        }
        char charAt = str.charAt(0);
        while (true) {
            if (i < 0) {
                z = false;
            } else if (this.chars[i] == charAt) {
                z = true;
            } else {
                i--;
            }
            if (!z) {
                return -1;
            }
            int i3 = i;
            int i4 = 0;
            do {
                i4++;
                if (i4 >= length2) {
                    break;
                }
                i3++;
            } while (this.chars[i3] == str.charAt(i4));
            if (i4 == length2) {
                return i;
            }
            i--;
        }
    }

    public void trimToSize() {
        int i = this.length;
        char[] cArr = this.chars;
        if (i < cArr.length) {
            char[] cArr2 = new char[i];
            System.arraycopy(cArr, 0, cArr2, 0, i);
            this.chars = cArr2;
        }
    }

    public int codePointAt(int i) {
        int i2;
        if (i >= 0 && i < (i2 = this.length)) {
            return Character.codePointAt(this.chars, i, i2);
        }
        throw new StringIndexOutOfBoundsException(i);
    }

    public int codePointBefore(int i) {
        if (i >= 1 && i <= this.length) {
            return Character.codePointBefore(this.chars, i);
        }
        throw new StringIndexOutOfBoundsException(i);
    }

    public int codePointCount(int i, int i2) {
        if (i >= 0 && i2 <= this.length && i <= i2) {
            return Character.codePointCount(this.chars, i, i2 - i);
        }
        throw new StringIndexOutOfBoundsException();
    }

    public int offsetByCodePoints(int i, int i2) {
        return Character.offsetByCodePoints(this.chars, 0, this.length, i, i2);
    }

    public StringBuilder append(boolean z) {
        append0(z ? "true" : "false");
        return this;
    }

    @Override // java.lang.Appendable
    public StringBuilder append(char c) {
        append0(c);
        return this;
    }

    public StringBuilder append(int i) {
        return append(i, 0);
    }

    public StringBuilder append(int i, int i2) {
        return append(i, i2, '0');
    }

    public StringBuilder append(int i, int i2, char c) {
        if (i == Integer.MIN_VALUE) {
            append0("-2147483648");
            return this;
        }
        if (i < 0) {
            append0('-');
            i = -i;
        }
        if (i2 > 1) {
            for (int numChars = i2 - numChars(i, 10); numChars > 0; numChars--) {
                append(c);
            }
        }
        if (i >= 10000) {
            if (i >= 1000000000) {
                append0(digits[(int) ((((long) i) % 10000000000L) / 1000000000)]);
            }
            if (i >= 100000000) {
                append0(digits[(i % 1000000000) / 100000000]);
            }
            if (i >= 10000000) {
                append0(digits[(i % 100000000) / 10000000]);
            }
            if (i >= 1000000) {
                append0(digits[(i % 10000000) / 1000000]);
            }
            if (i >= 100000) {
                append0(digits[(i % 1000000) / 100000]);
            }
            append0(digits[(i % 100000) / 10000]);
        }
        if (i >= 1000) {
            append0(digits[(i % 10000) / 1000]);
        }
        if (i >= 100) {
            append0(digits[(i % 1000) / 100]);
        }
        if (i >= 10) {
            append0(digits[(i % 100) / 10]);
        }
        append0(digits[i % 10]);
        return this;
    }

    public StringBuilder append(long j) {
        return append(j, 0);
    }

    public StringBuilder append(long j, int i) {
        return append(j, i, '0');
    }

    public StringBuilder append(long j, int i, char c) {
        if (j == Long.MIN_VALUE) {
            append0("-9223372036854775808");
            return this;
        }
        if (j < 0) {
            append0('-');
            j = -j;
        }
        if (i > 1) {
            for (int numChars = i - numChars(j, 10); numChars > 0; numChars--) {
                append(c);
            }
        }
        if (j >= 10000) {
            if (j >= 1000000000000000000L) {
                char[] cArr = digits;
                double d = (double) j;
                Double.isNaN(d);
                append0(cArr[(int) ((d % 1.0E19d) / 1.0E18d)]);
            }
            if (j >= 100000000000000000L) {
                append0(digits[(int) ((j % 1000000000000000000L) / 100000000000000000L)]);
            }
            if (j >= 10000000000000000L) {
                append0(digits[(int) ((j % 100000000000000000L) / 10000000000000000L)]);
            }
            if (j >= 1000000000000000L) {
                append0(digits[(int) ((j % 10000000000000000L) / 1000000000000000L)]);
            }
            if (j >= 100000000000000L) {
                append0(digits[(int) ((j % 1000000000000000L) / 100000000000000L)]);
            }
            if (j >= 10000000000000L) {
                append0(digits[(int) ((j % 100000000000000L) / 10000000000000L)]);
            }
            if (j >= 1000000000000L) {
                append0(digits[(int) ((j % 10000000000000L) / 1000000000000L)]);
            }
            if (j >= 100000000000L) {
                append0(digits[(int) ((j % 1000000000000L) / 100000000000L)]);
            }
            if (j >= 10000000000L) {
                append0(digits[(int) ((j % 100000000000L) / 10000000000L)]);
            }
            if (j >= 1000000000) {
                append0(digits[(int) ((j % 10000000000L) / 1000000000)]);
            }
            if (j >= 100000000) {
                append0(digits[(int) ((j % 1000000000) / 100000000)]);
            }
            if (j >= 10000000) {
                append0(digits[(int) ((j % 100000000) / 10000000)]);
            }
            if (j >= 1000000) {
                append0(digits[(int) ((j % 10000000) / 1000000)]);
            }
            if (j >= 100000) {
                append0(digits[(int) ((j % 1000000) / 100000)]);
            }
            append0(digits[(int) ((j % 100000) / 10000)]);
        }
        if (j >= 1000) {
            append0(digits[(int) ((j % 10000) / 1000)]);
        }
        if (j >= 100) {
            append0(digits[(int) ((j % 1000) / 100)]);
        }
        if (j >= 10) {
            append0(digits[(int) ((j % 100) / 10)]);
        }
        append0(digits[(int) (j % 10)]);
        return this;
    }

    public StringBuilder append(float f) {
        append0(Float.toString(f));
        return this;
    }

    public StringBuilder append(double d) {
        append0(Double.toString(d));
        return this;
    }

    public StringBuilder append(Object obj) {
        if (obj == null) {
            appendNull();
        } else {
            append0(obj.toString());
        }
        return this;
    }

    public StringBuilder append(String str) {
        append0(str);
        return this;
    }

    public StringBuilder appendLine(String str) {
        append0(str);
        append0('\n');
        return this;
    }

    public StringBuilder append(char[] cArr) {
        append0(cArr);
        return this;
    }

    public StringBuilder append(char[] cArr, int i, int i2) {
        append0(cArr, i, i2);
        return this;
    }

    @Override // java.lang.Appendable
    public StringBuilder append(CharSequence charSequence) {
        if (charSequence == null) {
            appendNull();
        } else if (charSequence instanceof StringBuilder) {
            StringBuilder stringBuilder = (StringBuilder) charSequence;
            append0(stringBuilder.chars, 0, stringBuilder.length);
        } else {
            append0(charSequence.toString());
        }
        return this;
    }

    public StringBuilder append(StringBuilder stringBuilder) {
        if (stringBuilder == null) {
            appendNull();
        } else {
            append0(stringBuilder.chars, 0, stringBuilder.length);
        }
        return this;
    }

    @Override // java.lang.Appendable
    public StringBuilder append(CharSequence charSequence, int i, int i2) {
        append0(charSequence, i, i2);
        return this;
    }

    public StringBuilder append(StringBuilder stringBuilder, int i, int i2) {
        if (stringBuilder == null) {
            appendNull();
        } else {
            append0(stringBuilder.chars, i, i2);
        }
        return this;
    }

    public StringBuilder appendCodePoint(int i) {
        append0(Character.toChars(i));
        return this;
    }

    public StringBuilder delete(int i, int i2) {
        delete0(i, i2);
        return this;
    }

    public StringBuilder deleteCharAt(int i) {
        deleteCharAt0(i);
        return this;
    }

    public void clear() {
        this.length = 0;
    }

    public StringBuilder insert(int i, boolean z) {
        insert0(i, z ? "true" : "false");
        return this;
    }

    public StringBuilder insert(int i, char c) {
        insert0(i, c);
        return this;
    }

    public StringBuilder insert(int i, int i2) {
        insert0(i, Integer.toString(i2));
        return this;
    }

    public StringBuilder insert(int i, long j) {
        insert0(i, Long.toString(j));
        return this;
    }

    public StringBuilder insert(int i, float f) {
        insert0(i, Float.toString(f));
        return this;
    }

    public StringBuilder insert(int i, double d) {
        insert0(i, Double.toString(d));
        return this;
    }

    public StringBuilder insert(int i, Object obj) {
        insert0(i, obj == null ? "null" : obj.toString());
        return this;
    }

    public StringBuilder insert(int i, String str) {
        insert0(i, str);
        return this;
    }

    public StringBuilder insert(int i, char[] cArr) {
        insert0(i, cArr);
        return this;
    }

    public StringBuilder insert(int i, char[] cArr, int i2, int i3) {
        insert0(i, cArr, i2, i3);
        return this;
    }

    public StringBuilder insert(int i, CharSequence charSequence) {
        insert0(i, charSequence == null ? "null" : charSequence.toString());
        return this;
    }

    public StringBuilder insert(int i, CharSequence charSequence, int i2, int i3) {
        insert0(i, charSequence, i2, i3);
        return this;
    }

    public StringBuilder replace(int i, int i2, String str) {
        replace0(i, i2, str);
        return this;
    }

    public StringBuilder replace(String str, String str2) {
        int length2 = str.length();
        int length3 = str2.length();
        int i = 0;
        while (true) {
            int indexOf = indexOf(str, i);
            if (indexOf == -1) {
                return this;
            }
            replace0(indexOf, indexOf + length2, str2);
            i = indexOf + length3;
        }
    }

    public StringBuilder replace(char c, String str) {
        int length2 = str.length();
        int i = 0;
        while (i != this.length) {
            if (this.chars[i] == c) {
                replace0(i, i + 1, str);
                i += length2;
            } else {
                i++;
            }
        }
        return this;
    }

    public StringBuilder reverse() {
        reverse0();
        return this;
    }

    public int hashCode() {
        return ((this.length + 31) * 31) + Arrays.hashCode(this.chars);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        StringBuilder stringBuilder = (StringBuilder) obj;
        int i = this.length;
        if (i != stringBuilder.length) {
            return false;
        }
        char[] cArr = this.chars;
        char[] cArr2 = stringBuilder.chars;
        for (int i2 = 0; i2 < i; i2++) {
            if (cArr[i2] != cArr2[i2]) {
                return false;
            }
        }
        return true;
    }

    public boolean equalsIgnoreCase(StringBuilder stringBuilder) {
        int i;
        if (this == stringBuilder) {
            return true;
        }
        if (stringBuilder == null || (i = this.length) != stringBuilder.length) {
            return false;
        }
        char[] cArr = this.chars;
        char[] cArr2 = stringBuilder.chars;
        for (int i2 = 0; i2 < i; i2++) {
            char c = cArr[i2];
            char upperCase = Character.toUpperCase(cArr2[i2]);
            if (!(c == upperCase || c == Character.toLowerCase(upperCase))) {
                return false;
            }
        }
        return true;
    }

    public boolean equalsIgnoreCase(String str) {
        int i;
        if (str == null || (i = this.length) != str.length()) {
            return false;
        }
        char[] cArr = this.chars;
        for (int i2 = 0; i2 < i; i2++) {
            char c = cArr[i2];
            char upperCase = Character.toUpperCase(str.charAt(i2));
            if (!(c == upperCase || c == Character.toLowerCase(upperCase))) {
                return false;
            }
        }
        return true;
    }
}
