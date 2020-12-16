package com.alles.platformer;

public class RC4 {
    private final byte[] S = new byte[256];
    private final byte[] T = new byte[256];
    private final int keylen;

    public RC4(byte[] bArr) {
        if (bArr.length < 1 || bArr.length > 256) {
            throw new IllegalArgumentException("key must be between 1 and 256 bytes");
        }
        this.keylen = bArr.length;
        for (int i = 0; i < 256; i++) {
            this.S[i] = (byte) i;
            this.T[i] = bArr[i % this.keylen];
        }
        int i2 = 0;
        for (int i3 = 0; i3 < 256; i3++) {
            byte[] bArr2 = this.S;
            i2 = (i2 + bArr2[i3] + this.T[i3]) & 255;
            byte b = bArr2[i2];
            bArr2[i2] = bArr2[i3];
            bArr2[i3] = b;
        }
    }

    public byte[] encrypt(byte[] bArr) {
        byte[] bArr2 = new byte[bArr.length];
        int i = 0;
        int i2 = 0;
        for (int i3 = 0; i3 < bArr.length; i3++) {
            i = (i + 1) & 255;
            byte[] bArr3 = this.S;
            i2 = (i2 + bArr3[i]) & 255;
            byte b = bArr3[i2];
            bArr3[i2] = bArr3[i];
            bArr3[i] = b;
            bArr2[i3] = (byte) (bArr3[(bArr3[i] + bArr3[i2]) & 255] ^ bArr[i3]);
        }
        return bArr2;
    }

    public byte[] decrypt(byte[] bArr) {
        return encrypt(bArr);
    }
}
