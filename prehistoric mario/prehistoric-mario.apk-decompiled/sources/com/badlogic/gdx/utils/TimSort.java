package com.badlogic.gdx.utils;

import java.util.Arrays;
import java.util.Comparator;

/* access modifiers changed from: package-private */
public class TimSort<T> {
    private static final boolean DEBUG = false;
    private static final int INITIAL_TMP_STORAGE_LENGTH = 256;
    private static final int MIN_GALLOP = 7;
    private static final int MIN_MERGE = 32;
    private T[] a;
    private Comparator<? super T> c;
    private int minGallop;
    private final int[] runBase;
    private final int[] runLen;
    private int stackSize;
    private T[] tmp;
    private int tmpCount;

    private static int minRunLength(int i) {
        int i2 = 0;
        while (i >= 32) {
            i2 |= i & 1;
            i >>= 1;
        }
        return i + i2;
    }

    TimSort() {
        this.minGallop = 7;
        this.stackSize = 0;
        this.tmp = (T[]) new Object[256];
        this.runBase = new int[40];
        this.runLen = new int[40];
    }

    public void doSort(T[] tArr, Comparator<T> comparator, int i, int i2) {
        this.stackSize = 0;
        rangeCheck(tArr.length, i, i2);
        int i3 = i2 - i;
        if (i3 >= 2) {
            if (i3 < 32) {
                binarySort(tArr, i, i2, countRunAndMakeAscending(tArr, i, i2, comparator) + i, comparator);
                return;
            }
            this.a = tArr;
            this.c = comparator;
            this.tmpCount = 0;
            int minRunLength = minRunLength(i3);
            do {
                int countRunAndMakeAscending = countRunAndMakeAscending(tArr, i, i2, comparator);
                if (countRunAndMakeAscending < minRunLength) {
                    int i4 = i3 <= minRunLength ? i3 : minRunLength;
                    binarySort(tArr, i, i + i4, countRunAndMakeAscending + i, comparator);
                    countRunAndMakeAscending = i4;
                }
                pushRun(i, countRunAndMakeAscending);
                mergeCollapse();
                i += countRunAndMakeAscending;
                i3 -= countRunAndMakeAscending;
            } while (i3 != 0);
            mergeForceCollapse();
            this.a = null;
            this.c = null;
            T[] tArr2 = this.tmp;
            int i5 = this.tmpCount;
            for (int i6 = 0; i6 < i5; i6++) {
                tArr2[i6] = null;
            }
        }
    }

    private TimSort(T[] tArr, Comparator<? super T> comparator) {
        this.minGallop = 7;
        this.stackSize = 0;
        this.a = tArr;
        this.c = comparator;
        int length = tArr.length;
        this.tmp = (T[]) new Object[(length < 512 ? length >>> 1 : 256)];
        int i = length < 120 ? 5 : length < 1542 ? 10 : length < 119151 ? 19 : 40;
        this.runBase = new int[i];
        this.runLen = new int[i];
    }

    static <T> void sort(T[] tArr, Comparator<? super T> comparator) {
        sort(tArr, 0, tArr.length, comparator);
    }

    static <T> void sort(T[] tArr, int i, int i2, Comparator<? super T> comparator) {
        if (comparator == null) {
            Arrays.sort(tArr, i, i2);
            return;
        }
        rangeCheck(tArr.length, i, i2);
        int i3 = i2 - i;
        if (i3 >= 2) {
            if (i3 < 32) {
                binarySort(tArr, i, i2, countRunAndMakeAscending(tArr, i, i2, comparator) + i, comparator);
                return;
            }
            TimSort timSort = new TimSort(tArr, comparator);
            int minRunLength = minRunLength(i3);
            do {
                int countRunAndMakeAscending = countRunAndMakeAscending(tArr, i, i2, comparator);
                if (countRunAndMakeAscending < minRunLength) {
                    int i4 = i3 <= minRunLength ? i3 : minRunLength;
                    binarySort(tArr, i, i + i4, countRunAndMakeAscending + i, comparator);
                    countRunAndMakeAscending = i4;
                }
                timSort.pushRun(i, countRunAndMakeAscending);
                timSort.mergeCollapse();
                i += countRunAndMakeAscending;
                i3 -= countRunAndMakeAscending;
            } while (i3 != 0);
            timSort.mergeForceCollapse();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:0:0x0000, code lost:
        if (r8 == r6) goto L_0x0002;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:10:0x001f, code lost:
        r2 = r8 - r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0021, code lost:
        if (r2 == 1) goto L_0x0034;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0024, code lost:
        if (r2 == 2) goto L_0x002c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0026, code lost:
        java.lang.System.arraycopy(r5, r1, r5, r1 + 1, r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x002c, code lost:
        r5[r1 + 2] = r5[r1 + 1];
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0034, code lost:
        r5[r1 + 1] = r5[r1];
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x003a, code lost:
        r5[r1] = r0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x003d, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:1:0x0002, code lost:
        r8 = r8 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:2:0x0004, code lost:
        if (r8 >= r7) goto L_0x003d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:3:0x0006, code lost:
        r0 = r5[r8];
        r1 = r6;
        r2 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:5:0x000b, code lost:
        if (r1 >= r2) goto L_0x001f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:6:0x000d, code lost:
        r3 = (r1 + r2) >>> 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:7:0x0017, code lost:
        if (r9.compare(r0, r5[r3]) >= 0) goto L_0x001b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:0x0019, code lost:
        r2 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x001b, code lost:
        r1 = r3 + 1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static <T> void binarySort(T[] r5, int r6, int r7, int r8, java.util.Comparator<? super T> r9) {
        /*
            if (r8 != r6) goto L_0x0004
        L_0x0002:
            int r8 = r8 + 1
        L_0x0004:
            if (r8 >= r7) goto L_0x003d
            r0 = r5[r8]
            r1 = r6
            r2 = r8
        L_0x000a:
            r3 = 1
            if (r1 >= r2) goto L_0x001f
            int r4 = r1 + r2
            int r3 = r4 >>> 1
            r4 = r5[r3]
            int r4 = r9.compare(r0, r4)
            if (r4 >= 0) goto L_0x001b
            r2 = r3
            goto L_0x000a
        L_0x001b:
            int r3 = r3 + 1
            r1 = r3
            goto L_0x000a
        L_0x001f:
            int r2 = r8 - r1
            if (r2 == r3) goto L_0x0034
            r3 = 2
            if (r2 == r3) goto L_0x002c
            int r3 = r1 + 1
            java.lang.System.arraycopy(r5, r1, r5, r3, r2)
            goto L_0x003a
        L_0x002c:
            int r2 = r1 + 2
            int r3 = r1 + 1
            r3 = r5[r3]
            r5[r2] = r3
        L_0x0034:
            int r2 = r1 + 1
            r3 = r5[r1]
            r5[r2] = r3
        L_0x003a:
            r5[r1] = r0
            goto L_0x0002
        L_0x003d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.TimSort.binarySort(java.lang.Object[], int, int, int, java.util.Comparator):void");
    }

    private static <T> int countRunAndMakeAscending(T[] tArr, int i, int i2, Comparator<? super T> comparator) {
        int i3 = i + 1;
        if (i3 == i2) {
            return 1;
        }
        int i4 = i3 + 1;
        if (comparator.compare(tArr[i3], tArr[i]) < 0) {
            while (i4 < i2 && comparator.compare(tArr[i4], tArr[i4 - 1]) < 0) {
                i4++;
            }
            reverseRange(tArr, i, i4);
        } else {
            while (i4 < i2 && comparator.compare(tArr[i4], tArr[i4 - 1]) >= 0) {
                i4++;
            }
        }
        return i4 - i;
    }

    private static void reverseRange(Object[] objArr, int i, int i2) {
        int i3 = i2 - 1;
        while (i < i3) {
            Object obj = objArr[i];
            objArr[i] = objArr[i3];
            objArr[i3] = obj;
            i3--;
            i++;
        }
    }

    private void pushRun(int i, int i2) {
        int[] iArr = this.runBase;
        int i3 = this.stackSize;
        iArr[i3] = i;
        this.runLen[i3] = i2;
        this.stackSize = i3 + 1;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x002a, code lost:
        r1 = r5.runLen;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0034, code lost:
        if (r1[r0 - 1] >= r1[r0 + 1]) goto L_0x0044;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0036, code lost:
        r0 = r0 - 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:5:0x0016, code lost:
        if (r1[r0 - 1] > (r1[r0] + r1[r0 + 1])) goto L_0x0018;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0028, code lost:
        if (r1[r0 - 2] <= (r1[r0] + r1[r0 - 1])) goto L_0x002a;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void mergeCollapse() {
        /*
            r5 = this;
        L_0x0000:
            int r0 = r5.stackSize
            r1 = 1
            if (r0 <= r1) goto L_0x0048
            int r0 = r0 + -2
            if (r0 < r1) goto L_0x0018
            int[] r1 = r5.runLen
            int r2 = r0 + -1
            r2 = r1[r2]
            r3 = r1[r0]
            int r4 = r0 + 1
            r1 = r1[r4]
            int r3 = r3 + r1
            if (r2 <= r3) goto L_0x002a
        L_0x0018:
            r1 = 2
            if (r0 < r1) goto L_0x0039
            int[] r1 = r5.runLen
            int r2 = r0 + -2
            r2 = r1[r2]
            r3 = r1[r0]
            int r4 = r0 + -1
            r1 = r1[r4]
            int r3 = r3 + r1
            if (r2 > r3) goto L_0x0039
        L_0x002a:
            int[] r1 = r5.runLen
            int r2 = r0 + -1
            r2 = r1[r2]
            int r3 = r0 + 1
            r1 = r1[r3]
            if (r2 >= r1) goto L_0x0044
            int r0 = r0 + -1
            goto L_0x0044
        L_0x0039:
            int[] r1 = r5.runLen
            r2 = r1[r0]
            int r3 = r0 + 1
            r1 = r1[r3]
            if (r2 <= r1) goto L_0x0044
            goto L_0x0048
        L_0x0044:
            r5.mergeAt(r0)
            goto L_0x0000
        L_0x0048:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.TimSort.mergeCollapse():void");
    }

    private void mergeForceCollapse() {
        while (true) {
            int i = this.stackSize;
            if (i > 1) {
                int i2 = i - 2;
                if (i2 > 0) {
                    int[] iArr = this.runLen;
                    if (iArr[i2 - 1] < iArr[i2 + 1]) {
                        i2--;
                    }
                }
                mergeAt(i2);
            } else {
                return;
            }
        }
    }

    private void mergeAt(int i) {
        int[] iArr = this.runBase;
        int i2 = iArr[i];
        int[] iArr2 = this.runLen;
        int i3 = iArr2[i];
        int i4 = i + 1;
        int i5 = iArr[i4];
        int i6 = iArr2[i4];
        iArr2[i] = i3 + i6;
        if (i == this.stackSize - 3) {
            int i7 = i + 2;
            iArr[i4] = iArr[i7];
            iArr2[i4] = iArr2[i7];
        }
        this.stackSize--;
        T[] tArr = this.a;
        int gallopRight = gallopRight(tArr[i5], tArr, i2, i3, 0, this.c);
        int i8 = i2 + gallopRight;
        int i9 = i3 - gallopRight;
        if (i9 != 0) {
            T[] tArr2 = this.a;
            int gallopLeft = gallopLeft(tArr2[(i8 + i9) - 1], tArr2, i5, i6, i6 - 1, this.c);
            if (gallopLeft != 0) {
                if (i9 <= gallopLeft) {
                    mergeLo(i8, i9, i5, gallopLeft);
                } else {
                    mergeHi(i8, i9, i5, gallopLeft);
                }
            }
        }
    }

    private static <T> int gallopLeft(T t, T[] tArr, int i, int i2, int i3, Comparator<? super T> comparator) {
        int i4;
        int i5;
        int i6 = i + i3;
        if (comparator.compare(t, tArr[i6]) > 0) {
            int i7 = i2 - i3;
            int i8 = 0;
            int i9 = 1;
            while (i9 < i7 && comparator.compare(t, tArr[i6 + i9]) > 0) {
                int i10 = (i9 << 1) + 1;
                if (i10 <= 0) {
                    i8 = i9;
                    i9 = i7;
                } else {
                    i9 = i10;
                    i8 = i9;
                }
            }
            if (i9 <= i7) {
                i7 = i9;
            }
            int i11 = i8 + i3;
            i4 = i7 + i3;
            i5 = i11;
        } else {
            int i12 = i3 + 1;
            int i13 = 0;
            int i14 = 1;
            while (i14 < i12 && comparator.compare(t, tArr[i6 - i14]) <= 0) {
                int i15 = (i14 << 1) + 1;
                if (i15 <= 0) {
                    i13 = i14;
                    i14 = i12;
                } else {
                    i14 = i15;
                    i13 = i14;
                }
            }
            if (i14 <= i12) {
                i12 = i14;
            }
            i5 = i3 - i12;
            i4 = i3 - i13;
        }
        int i16 = i5 + 1;
        while (i16 < i4) {
            int i17 = ((i4 - i16) >>> 1) + i16;
            if (comparator.compare(t, tArr[i + i17]) > 0) {
                i16 = i17 + 1;
            } else {
                i4 = i17;
            }
        }
        return i4;
    }

    private static <T> int gallopRight(T t, T[] tArr, int i, int i2, int i3, Comparator<? super T> comparator) {
        int i4;
        int i5;
        int i6 = i + i3;
        if (comparator.compare(t, tArr[i6]) < 0) {
            int i7 = i3 + 1;
            int i8 = 0;
            int i9 = 1;
            while (i9 < i7 && comparator.compare(t, tArr[i6 - i9]) < 0) {
                int i10 = (i9 << 1) + 1;
                if (i10 <= 0) {
                    i8 = i9;
                    i9 = i7;
                } else {
                    i9 = i10;
                    i8 = i9;
                }
            }
            if (i9 <= i7) {
                i7 = i9;
            }
            i5 = i3 - i7;
            i4 = i3 - i8;
        } else {
            int i11 = i2 - i3;
            int i12 = 0;
            int i13 = 1;
            while (i13 < i11 && comparator.compare(t, tArr[i6 + i13]) >= 0) {
                int i14 = (i13 << 1) + 1;
                if (i14 <= 0) {
                    i12 = i13;
                    i13 = i11;
                } else {
                    i13 = i14;
                    i12 = i13;
                }
            }
            if (i13 <= i11) {
                i11 = i13;
            }
            int i15 = i12 + i3;
            i4 = i3 + i11;
            i5 = i15;
        }
        int i16 = i5 + 1;
        while (i16 < i4) {
            int i17 = ((i4 - i16) >>> 1) + i16;
            if (comparator.compare(t, tArr[i + i17]) < 0) {
                i4 = i17;
            } else {
                i16 = i17 + 1;
            }
        }
        return i4;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0075, code lost:
        r14 = r2;
        r12 = r4;
        r15 = r5;
        r17 = r6;
        r16 = r13;
        r13 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x007d, code lost:
        r6 = gallopRight(r7[r12], r8, r13, r14, 0, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x0088, code lost:
        if (r6 == 0) goto L_0x009e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x008a, code lost:
        java.lang.System.arraycopy(r8, r13, r7, r15, r6);
        r1 = r15 + r6;
        r3 = r13 + r6;
        r2 = r14 - r6;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0093, code lost:
        if (r2 > r10) goto L_0x009b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0095, code lost:
        r14 = r2;
        r13 = r3;
        r4 = r12;
        r12 = r16;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x009b, code lost:
        r15 = r1;
        r14 = r2;
        r13 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x009e, code lost:
        r5 = r15 + 1;
        r4 = r12 + 1;
        r7[r15] = r7[r12];
        r12 = r16 - 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x00a8, code lost:
        if (r12 != 0) goto L_0x00af;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x00aa, code lost:
        r1 = r5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x00af, code lost:
        r1 = gallopLeft(r8[r13], r7, r4, r12, 0, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x00be, code lost:
        if (r1 == 0) goto L_0x00d0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x00c0, code lost:
        java.lang.System.arraycopy(r7, r4, r7, r5, r1);
        r2 = r5 + r1;
        r4 = r4 + r1;
        r3 = r12 - r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x00c9, code lost:
        if (r3 != 0) goto L_0x00ce;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00cb, code lost:
        r1 = r2;
        r12 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x00ce, code lost:
        r12 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x00d0, code lost:
        r4 = r4;
        r2 = r5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x00d2, code lost:
        r3 = r2 + 1;
        r5 = r13 + 1;
        r7[r2] = r8[r13];
        r14 = r14 - 1;
        r9 = 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x00dd, code lost:
        if (r14 != 1) goto L_0x0101;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x00df, code lost:
        r1 = r3;
        r13 = r5;
        r10 = r17;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x0101, code lost:
        r17 = r17 - 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0104, code lost:
        if (r6 < 7) goto L_0x0108;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x0106, code lost:
        r6 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x0108, code lost:
        r6 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x0109, code lost:
        if (r1 < 7) goto L_0x010d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x010b, code lost:
        r1 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x010d, code lost:
        r1 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x010f, code lost:
        if ((r1 | r6) != false) goto L_0x0122;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x0111, code lost:
        if (r17 >= 0) goto L_0x0115;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x0113, code lost:
        r17 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x0122, code lost:
        r15 = r3;
        r13 = r5;
        r16 = r12;
        r10 = 1;
        r12 = r4;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void mergeLo(int r20, int r21, int r22, int r23) {
        /*
        // Method dump skipped, instructions count: 302
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.TimSort.mergeLo(int, int, int, int):void");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0077, code lost:
        r16 = r2;
        r17 = r3;
        r12 = r4;
        r14 = r5;
        r15 = r6;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x007e, code lost:
        r6 = r13 - gallopRight(r8[r12], r7, r21, r13, r13 - 1, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x008d, code lost:
        if (r6 == 0) goto L_0x00a6;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x008f, code lost:
        r1 = r14 - r6;
        r2 = r15 - r6;
        r13 = r13 - r6;
        java.lang.System.arraycopy(r7, r2 + 1, r7, r1 + 1, r6);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x009b, code lost:
        if (r13 != 0) goto L_0x00a4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x009d, code lost:
        r15 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x00a4, code lost:
        r14 = r1;
        r15 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x00a6, code lost:
        r18 = r14 - 1;
        r19 = r12 - 1;
        r7[r14] = r8[r12];
        r12 = r16 - 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x00b0, code lost:
        if (r12 != 1) goto L_0x00ba;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x00b2, code lost:
        r2 = r12;
        r3 = r17;
        r1 = r18;
        r12 = r19;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x00ba, code lost:
        r1 = r12 - gallopLeft(r7[r15], r8, 0, r12, r12 - 1, r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x00c9, code lost:
        if (r1 == 0) goto L_0x00e4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x00cb, code lost:
        r2 = r18 - r1;
        r4 = r19 - r1;
        r3 = r12 - r1;
        java.lang.System.arraycopy(r8, r4 + 1, r7, r2 + 1, r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x00d8, code lost:
        if (r3 > 1) goto L_0x00de;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00da, code lost:
        r1 = r2;
        r2 = r3;
        r12 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x00de, code lost:
        r18 = r2;
        r16 = r3;
        r12 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x00e4, code lost:
        r16 = r12;
        r12 = r19;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x00e8, code lost:
        r2 = r18 - 1;
        r3 = r15 - 1;
        r7[r18] = r7[r15];
        r13 = r13 - 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x00f2, code lost:
        if (r13 != 0) goto L_0x011c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x00f4, code lost:
        r1 = r2;
        r15 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x011c, code lost:
        r17 = r17 - 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x011f, code lost:
        if (r6 < 7) goto L_0x0123;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x0121, code lost:
        r5 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x0123, code lost:
        r5 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x0124, code lost:
        if (r1 < 7) goto L_0x0128;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x0126, code lost:
        r1 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x0128, code lost:
        r1 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x012a, code lost:
        if ((r1 | r5) != false) goto L_0x013b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x012c, code lost:
        if (r17 >= 0) goto L_0x0130;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x012e, code lost:
        r17 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x013b, code lost:
        r14 = r2;
        r15 = r3;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void mergeHi(int r21, int r22, int r23, int r24) {
        /*
        // Method dump skipped, instructions count: 319
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.TimSort.mergeHi(int, int, int, int):void");
    }

    private T[] ensureCapacity(int i) {
        this.tmpCount = Math.max(this.tmpCount, i);
        if (this.tmp.length < i) {
            int i2 = (i >> 1) | i;
            int i3 = i2 | (i2 >> 2);
            int i4 = i3 | (i3 >> 4);
            int i5 = i4 | (i4 >> 8);
            int i6 = (i5 | (i5 >> 16)) + 1;
            if (i6 >= 0) {
                i = Math.min(i6, this.a.length >>> 1);
            }
            this.tmp = (T[]) new Object[i];
        }
        return this.tmp;
    }

    private static void rangeCheck(int i, int i2, int i3) {
        if (i2 > i3) {
            throw new IllegalArgumentException("fromIndex(" + i2 + ") > toIndex(" + i3 + ")");
        } else if (i2 < 0) {
            throw new ArrayIndexOutOfBoundsException(i2);
        } else if (i3 > i) {
            throw new ArrayIndexOutOfBoundsException(i3);
        }
    }
}
