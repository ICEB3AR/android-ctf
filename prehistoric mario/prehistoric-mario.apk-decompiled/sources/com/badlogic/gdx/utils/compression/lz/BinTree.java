package com.badlogic.gdx.utils.compression.lz;

import com.badlogic.gdx.graphics.GL20;
import java.io.IOException;

public class BinTree extends InWindow {
    private static final int[] CrcTable = new int[256];
    static final int kBT2HashSize = 65536;
    static final int kEmptyHashValue = 0;
    static final int kHash2Size = 1024;
    static final int kHash3Offset = 1024;
    static final int kHash3Size = 65536;
    static final int kMaxValForNormalize = 1073741823;
    static final int kStartMaxLen = 1;
    boolean HASH_ARRAY = true;
    int _cutValue = 255;
    int _cyclicBufferPos;
    int _cyclicBufferSize = 0;
    int[] _hash;
    int _hashMask;
    int _hashSizeSum = 0;
    int _matchMaxLen;
    int[] _son;
    int kFixHashSize = 66560;
    int kMinMatchCheck = 4;
    int kNumHashDirectBytes = 0;

    public void SetType(int i) {
        this.HASH_ARRAY = i > 2;
        if (this.HASH_ARRAY) {
            this.kNumHashDirectBytes = 0;
            this.kMinMatchCheck = 4;
            this.kFixHashSize = 66560;
            return;
        }
        this.kNumHashDirectBytes = 2;
        this.kMinMatchCheck = 3;
        this.kFixHashSize = 0;
    }

    @Override // com.badlogic.gdx.utils.compression.lz.InWindow
    public void Init() throws IOException {
        super.Init();
        for (int i = 0; i < this._hashSizeSum; i++) {
            this._hash[i] = 0;
        }
        this._cyclicBufferPos = 0;
        ReduceOffsets(-1);
    }

    @Override // com.badlogic.gdx.utils.compression.lz.InWindow
    public void MovePos() throws IOException {
        int i = this._cyclicBufferPos + 1;
        this._cyclicBufferPos = i;
        if (i >= this._cyclicBufferSize) {
            this._cyclicBufferPos = 0;
        }
        super.MovePos();
        if (this._pos == kMaxValForNormalize) {
            Normalize();
        }
    }

    public boolean Create(int i, int i2, int i3, int i4) {
        if (i > 1073741567) {
            return false;
        }
        this._cutValue = (i3 >> 1) + 16;
        int i5 = i2 + i;
        super.Create(i5, i4 + i3, (((i5 + i3) + i4) / 2) + 256);
        this._matchMaxLen = i3;
        int i6 = i + 1;
        if (this._cyclicBufferSize != i6) {
            this._cyclicBufferSize = i6;
            this._son = new int[(i6 * 2)];
        }
        int i7 = 65536;
        if (this.HASH_ARRAY) {
            int i8 = i - 1;
            int i9 = i8 | (i8 >> 1);
            int i10 = i9 | (i9 >> 2);
            int i11 = i10 | (i10 >> 4);
            int i12 = ((i11 | (i11 >> 8)) >> 1) | 65535;
            if (i12 > 16777216) {
                i12 >>= 1;
            }
            this._hashMask = i12;
            i7 = this.kFixHashSize + i12 + 1;
        }
        if (i7 != this._hashSizeSum) {
            this._hashSizeSum = i7;
            this._hash = new int[i7];
        }
        return true;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:70:0x01b9, code lost:
        r1 = r19._son;
        r1[r5] = 0;
        r1[r8] = 0;
     */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x0108  */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x011c  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01b9 A[EDGE_INSN: B:73:0x01b9->B:70:0x01b9 ?: BREAK  , SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int GetMatches(int[] r20) throws java.io.IOException {
        /*
        // Method dump skipped, instructions count: 452
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.compression.lz.BinTree.GetMatches(int[]):int");
    }

    public void Skip(int i) throws IOException {
        int i2;
        int i3;
        int i4 = i;
        do {
            if (this._pos + this._matchMaxLen <= this._streamPos) {
                i2 = this._matchMaxLen;
            } else {
                i2 = this._streamPos - this._pos;
                if (i2 < this.kMinMatchCheck) {
                    MovePos();
                    i4--;
                }
            }
            int i5 = this._pos > this._cyclicBufferSize ? this._pos - this._cyclicBufferSize : 0;
            int i6 = this._bufferOffset + this._pos;
            if (this.HASH_ARRAY) {
                int i7 = CrcTable[this._bufferBase[i6] & 255] ^ (this._bufferBase[i6 + 1] & 255);
                this._hash[i7 & 1023] = this._pos;
                int i8 = i7 ^ ((this._bufferBase[i6 + 2] & 255) << 8);
                this._hash[(65535 & i8) + GL20.GL_STENCIL_BUFFER_BIT] = this._pos;
                i3 = (i8 ^ (CrcTable[this._bufferBase[i6 + 3] & 255] << 5)) & this._hashMask;
            } else {
                i3 = (this._bufferBase[i6] & 255) ^ ((this._bufferBase[i6 + 1] & 255) << 8);
            }
            int[] iArr = this._hash;
            int i9 = this.kFixHashSize;
            int i10 = iArr[i9 + i3];
            iArr[i9 + i3] = this._pos;
            int i11 = this._cyclicBufferPos;
            int i12 = (i11 << 1) + 1;
            int i13 = i11 << 1;
            int i14 = this.kNumHashDirectBytes;
            int i15 = this._cutValue;
            int i16 = i14;
            while (true) {
                if (i10 <= i5) {
                    break;
                }
                int i17 = i15 - 1;
                if (i15 == 0) {
                    break;
                }
                int i18 = this._pos - i10;
                int i19 = this._cyclicBufferPos;
                int i20 = (i18 <= i19 ? i19 - i18 : (i19 - i18) + this._cyclicBufferSize) << 1;
                int i21 = this._bufferOffset + i10;
                int min = Math.min(i14, i16);
                if (this._bufferBase[i21 + min] == this._bufferBase[i6 + min]) {
                    do {
                        min++;
                        if (min == i2) {
                            break;
                        }
                    } while (this._bufferBase[i21 + min] == this._bufferBase[i6 + min]);
                    if (min == i2) {
                        int[] iArr2 = this._son;
                        iArr2[i13] = iArr2[i20];
                        iArr2[i12] = iArr2[i20 + 1];
                        break;
                    }
                }
                if ((this._bufferBase[i21 + min] & 255) < (this._bufferBase[i6 + min] & 255)) {
                    int[] iArr3 = this._son;
                    iArr3[i13] = i10;
                    int i22 = i20 + 1;
                    i10 = iArr3[i22];
                    i13 = i22;
                    i16 = min;
                } else {
                    int[] iArr4 = this._son;
                    iArr4[i12] = i10;
                    i10 = iArr4[i20];
                    i12 = i20;
                    i14 = min;
                }
                i15 = i17;
            }
            int[] iArr5 = this._son;
            iArr5[i13] = 0;
            iArr5[i12] = 0;
            MovePos();
            i4--;
        } while (i4 != 0);
    }

    /* access modifiers changed from: package-private */
    public void NormalizeLinks(int[] iArr, int i, int i2) {
        for (int i3 = 0; i3 < i; i3++) {
            int i4 = iArr[i3];
            iArr[i3] = i4 <= i2 ? 0 : i4 - i2;
        }
    }

    /* access modifiers changed from: package-private */
    public void Normalize() {
        int i = this._pos;
        int i2 = this._cyclicBufferSize;
        int i3 = i - i2;
        NormalizeLinks(this._son, i2 * 2, i3);
        NormalizeLinks(this._hash, this._hashSizeSum, i3);
        ReduceOffsets(i3);
    }

    public void SetCutValue(int i) {
        this._cutValue = i;
    }

    static {
        for (int i = 0; i < 256; i++) {
            int i2 = i;
            for (int i3 = 0; i3 < 8; i3++) {
                i2 = (i2 & 1) != 0 ? (i2 >>> 1) ^ -306674912 : i2 >>> 1;
            }
            CrcTable[i] = i2;
        }
    }
}
