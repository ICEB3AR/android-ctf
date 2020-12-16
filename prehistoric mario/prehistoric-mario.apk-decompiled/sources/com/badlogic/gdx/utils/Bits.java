package com.badlogic.gdx.utils;

public class Bits {
    long[] bits = {0};

    public Bits() {
    }

    public Bits(int i) {
        checkCapacity(i >>> 6);
    }

    public boolean get(int i) {
        int i2 = i >>> 6;
        long[] jArr = this.bits;
        if (i2 < jArr.length && (jArr[i2] & (1 << (i & 63))) != 0) {
            return true;
        }
        return false;
    }

    public boolean getAndClear(int i) {
        int i2 = i >>> 6;
        long[] jArr = this.bits;
        if (i2 >= jArr.length) {
            return false;
        }
        long j = jArr[i2];
        jArr[i2] = jArr[i2] & ((1 << (i & 63)) ^ -1);
        if (jArr[i2] != j) {
            return true;
        }
        return false;
    }

    public boolean getAndSet(int i) {
        int i2 = i >>> 6;
        checkCapacity(i2);
        long[] jArr = this.bits;
        long j = jArr[i2];
        jArr[i2] = jArr[i2] | (1 << (i & 63));
        return jArr[i2] == j;
    }

    public void set(int i) {
        int i2 = i >>> 6;
        checkCapacity(i2);
        long[] jArr = this.bits;
        jArr[i2] = jArr[i2] | (1 << (i & 63));
    }

    public void flip(int i) {
        int i2 = i >>> 6;
        checkCapacity(i2);
        long[] jArr = this.bits;
        jArr[i2] = jArr[i2] ^ (1 << (i & 63));
    }

    private void checkCapacity(int i) {
        long[] jArr = this.bits;
        if (i >= jArr.length) {
            long[] jArr2 = new long[(i + 1)];
            System.arraycopy(jArr, 0, jArr2, 0, jArr.length);
            this.bits = jArr2;
        }
    }

    public void clear(int i) {
        int i2 = i >>> 6;
        long[] jArr = this.bits;
        if (i2 < jArr.length) {
            jArr[i2] = jArr[i2] & ((1 << (i & 63)) ^ -1);
        }
    }

    public void clear() {
        long[] jArr = this.bits;
        int length = jArr.length;
        for (int i = 0; i < length; i++) {
            jArr[i] = 0;
        }
    }

    public int numBits() {
        return this.bits.length << 6;
    }

    public int length() {
        long[] jArr = this.bits;
        for (int length = jArr.length - 1; length >= 0; length--) {
            long j = jArr[length];
            if (j != 0) {
                for (int i = 63; i >= 0; i--) {
                    if (((1 << (i & 63)) & j) != 0) {
                        return (length << 6) + i + 1;
                    }
                }
                continue;
            }
        }
        return 0;
    }

    public boolean notEmpty() {
        return !isEmpty();
    }

    public boolean isEmpty() {
        for (long j : this.bits) {
            if (j != 0) {
                return false;
            }
        }
        return true;
    }

    public int nextSetBit(int i) {
        int i2;
        long[] jArr = this.bits;
        int i3 = i >>> 6;
        int length = jArr.length;
        if (i3 >= length) {
            return -1;
        }
        long j = jArr[i3];
        if (j != 0) {
            i2 = i & 63;
            while (true) {
                if (i2 >= 64) {
                    break;
                } else if (((1 << (i2 & 63)) & j) != 0) {
                    break;
                } else {
                    i2++;
                }
            }
        }
        loop1:
        while (true) {
            i3++;
            if (i3 >= length) {
                return -1;
            }
            if (i3 != 0) {
                long j2 = jArr[i3];
                if (j2 != 0) {
                    i2 = 0;
                    while (i2 < 64) {
                        if (((1 << (i2 & 63)) & j2) != 0) {
                            break loop1;
                        }
                        i2++;
                    }
                    continue;
                } else {
                    continue;
                }
            }
        }
        return (i3 << 6) + i2;
    }

    public int nextClearBit(int i) {
        int length;
        long[] jArr = this.bits;
        int i2 = i >>> 6;
        int length2 = jArr.length;
        if (i2 >= length2) {
            length = jArr.length;
        } else {
            long j = jArr[i2];
            int i3 = i & 63;
            while (true) {
                if (i3 >= 64) {
                    loop1:
                    while (true) {
                        i2++;
                        if (i2 >= length2) {
                            length = jArr.length;
                            break;
                        } else if (i2 == 0) {
                            return i2 << 6;
                        } else {
                            long j2 = jArr[i2];
                            i3 = 0;
                            while (true) {
                                if (i3 < 64) {
                                    if (((1 << (i3 & 63)) & j2) == 0) {
                                        break loop1;
                                    }
                                    i3++;
                                }
                            }
                        }
                    }
                } else if (((1 << (i3 & 63)) & j) == 0) {
                    break;
                } else {
                    i3++;
                }
            }
            return (i2 << 6) + i3;
        }
        return length << 6;
    }

    public void and(Bits bits2) {
        int min = Math.min(this.bits.length, bits2.bits.length);
        for (int i = 0; min > i; i++) {
            long[] jArr = this.bits;
            jArr[i] = jArr[i] & bits2.bits[i];
        }
        long[] jArr2 = this.bits;
        if (jArr2.length > min) {
            int length = jArr2.length;
            while (length > min) {
                this.bits[min] = 0;
                min++;
            }
        }
    }

    public void andNot(Bits bits2) {
        int length = this.bits.length;
        int length2 = bits2.bits.length;
        int i = 0;
        while (i < length && i < length2) {
            long[] jArr = this.bits;
            jArr[i] = jArr[i] & (bits2.bits[i] ^ -1);
            i++;
        }
    }

    public void or(Bits bits2) {
        int min = Math.min(this.bits.length, bits2.bits.length);
        for (int i = 0; min > i; i++) {
            long[] jArr = this.bits;
            jArr[i] = jArr[i] | bits2.bits[i];
        }
        long[] jArr2 = bits2.bits;
        if (min < jArr2.length) {
            checkCapacity(jArr2.length);
            int length = bits2.bits.length;
            while (length > min) {
                this.bits[min] = bits2.bits[min];
                min++;
            }
        }
    }

    public void xor(Bits bits2) {
        int min = Math.min(this.bits.length, bits2.bits.length);
        for (int i = 0; min > i; i++) {
            long[] jArr = this.bits;
            jArr[i] = jArr[i] ^ bits2.bits[i];
        }
        long[] jArr2 = bits2.bits;
        if (min < jArr2.length) {
            checkCapacity(jArr2.length);
            int length = bits2.bits.length;
            while (length > min) {
                this.bits[min] = bits2.bits[min];
                min++;
            }
        }
    }

    public boolean intersects(Bits bits2) {
        long[] jArr = this.bits;
        long[] jArr2 = bits2.bits;
        for (int min = Math.min(jArr.length, jArr2.length) - 1; min >= 0; min--) {
            if ((jArr[min] & jArr2[min]) != 0) {
                return true;
            }
        }
        return false;
    }

    public boolean containsAll(Bits bits2) {
        long[] jArr = this.bits;
        long[] jArr2 = bits2.bits;
        int length = jArr2.length;
        int length2 = jArr.length;
        for (int i = length2; i < length; i++) {
            if (jArr2[i] != 0) {
                return false;
            }
        }
        for (int min = Math.min(length2, length) - 1; min >= 0; min--) {
            if ((jArr[min] & jArr2[min]) != jArr2[min]) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        int length = length() >>> 6;
        int i = 0;
        for (int i2 = 0; length >= i2; i2++) {
            long[] jArr = this.bits;
            i = (i * 127) + ((int) (jArr[i2] ^ (jArr[i2] >>> 32)));
        }
        return i;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Bits bits2 = (Bits) obj;
        long[] jArr = bits2.bits;
        int min = Math.min(this.bits.length, jArr.length);
        for (int i = 0; min > i; i++) {
            if (this.bits[i] != jArr[i]) {
                return false;
            }
        }
        if (this.bits.length == jArr.length || length() == bits2.length()) {
            return true;
        }
        return false;
    }
}
