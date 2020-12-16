package com.badlogic.gdx.utils.compression.rangecoder;

import java.io.IOException;

public class BitTreeEncoder {
    short[] Models;
    int NumBitLevels;

    public BitTreeEncoder(int i) {
        this.NumBitLevels = i;
        this.Models = new short[(1 << i)];
    }

    public void Init() {
        Decoder.InitBitModels(this.Models);
    }

    public void Encode(Encoder encoder, int i) throws IOException {
        int i2 = this.NumBitLevels;
        int i3 = 1;
        while (i2 != 0) {
            i2--;
            int i4 = (i >>> i2) & 1;
            encoder.Encode(this.Models, i3, i4);
            i3 = (i3 << 1) | i4;
        }
    }

    public void ReverseEncode(Encoder encoder, int i) throws IOException {
        int i2 = 1;
        for (int i3 = 0; i3 < this.NumBitLevels; i3++) {
            int i4 = i & 1;
            encoder.Encode(this.Models, i2, i4);
            i2 = (i2 << 1) | i4;
            i >>= 1;
        }
    }

    public int GetPrice(int i) {
        int i2 = this.NumBitLevels;
        int i3 = 0;
        int i4 = 1;
        while (i2 != 0) {
            i2--;
            int i5 = (i >>> i2) & 1;
            i3 += Encoder.GetPrice(this.Models[i4], i5);
            i4 = (i4 << 1) + i5;
        }
        return i3;
    }

    public int ReverseGetPrice(int i) {
        int i2 = 0;
        int i3 = 1;
        for (int i4 = this.NumBitLevels; i4 != 0; i4--) {
            int i5 = i & 1;
            i >>>= 1;
            i2 += Encoder.GetPrice(this.Models[i3], i5);
            i3 = (i3 << 1) | i5;
        }
        return i2;
    }

    public static int ReverseGetPrice(short[] sArr, int i, int i2, int i3) {
        int i4 = 0;
        int i5 = 1;
        while (i2 != 0) {
            int i6 = i3 & 1;
            i3 >>>= 1;
            i4 += Encoder.GetPrice(sArr[i + i5], i6);
            i5 = (i5 << 1) | i6;
            i2--;
        }
        return i4;
    }

    public static void ReverseEncode(short[] sArr, int i, Encoder encoder, int i2, int i3) throws IOException {
        int i4 = 1;
        for (int i5 = 0; i5 < i2; i5++) {
            int i6 = i3 & 1;
            encoder.Encode(sArr, i + i4, i6);
            i4 = (i4 << 1) | i6;
            i3 >>= 1;
        }
    }
}
