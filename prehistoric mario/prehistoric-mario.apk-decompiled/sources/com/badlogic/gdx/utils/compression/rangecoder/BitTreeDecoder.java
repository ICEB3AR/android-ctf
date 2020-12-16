package com.badlogic.gdx.utils.compression.rangecoder;

import java.io.IOException;

public class BitTreeDecoder {
    short[] Models;
    int NumBitLevels;

    public BitTreeDecoder(int i) {
        this.NumBitLevels = i;
        this.Models = new short[(1 << i)];
    }

    public void Init() {
        Decoder.InitBitModels(this.Models);
    }

    public int Decode(Decoder decoder) throws IOException {
        int i = 1;
        for (int i2 = this.NumBitLevels; i2 != 0; i2--) {
            i = decoder.DecodeBit(this.Models, i) + (i << 1);
        }
        return i - (1 << this.NumBitLevels);
    }

    public int ReverseDecode(Decoder decoder) throws IOException {
        int i = 0;
        int i2 = 1;
        for (int i3 = 0; i3 < this.NumBitLevels; i3++) {
            int DecodeBit = decoder.DecodeBit(this.Models, i2);
            i2 = (i2 << 1) + DecodeBit;
            i |= DecodeBit << i3;
        }
        return i;
    }

    public static int ReverseDecode(short[] sArr, int i, Decoder decoder, int i2) throws IOException {
        int i3 = 0;
        int i4 = 1;
        for (int i5 = 0; i5 < i2; i5++) {
            int DecodeBit = decoder.DecodeBit(sArr, i + i4);
            i4 = (i4 << 1) + DecodeBit;
            i3 |= DecodeBit << i5;
        }
        return i3;
    }
}
