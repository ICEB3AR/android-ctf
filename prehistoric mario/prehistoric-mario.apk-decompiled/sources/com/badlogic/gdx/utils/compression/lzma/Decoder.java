package com.badlogic.gdx.utils.compression.lzma;

import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.utils.StreamUtils;
import com.badlogic.gdx.utils.compression.lz.OutWindow;
import com.badlogic.gdx.utils.compression.rangecoder.BitTreeDecoder;
import java.io.IOException;

public class Decoder {
    int m_DictionarySize = -1;
    int m_DictionarySizeCheck = -1;
    short[] m_IsMatchDecoders = new short[192];
    short[] m_IsRep0LongDecoders = new short[192];
    short[] m_IsRepDecoders = new short[12];
    short[] m_IsRepG0Decoders = new short[12];
    short[] m_IsRepG1Decoders = new short[12];
    short[] m_IsRepG2Decoders = new short[12];
    LenDecoder m_LenDecoder = new LenDecoder();
    LiteralDecoder m_LiteralDecoder = new LiteralDecoder();
    OutWindow m_OutWindow = new OutWindow();
    BitTreeDecoder m_PosAlignDecoder = new BitTreeDecoder(4);
    short[] m_PosDecoders = new short[114];
    BitTreeDecoder[] m_PosSlotDecoder = new BitTreeDecoder[4];
    int m_PosStateMask;
    com.badlogic.gdx.utils.compression.rangecoder.Decoder m_RangeDecoder = new com.badlogic.gdx.utils.compression.rangecoder.Decoder();
    LenDecoder m_RepLenDecoder = new LenDecoder();

    /* access modifiers changed from: package-private */
    public class LenDecoder {
        short[] m_Choice = new short[2];
        BitTreeDecoder m_HighCoder = new BitTreeDecoder(8);
        BitTreeDecoder[] m_LowCoder = new BitTreeDecoder[16];
        BitTreeDecoder[] m_MidCoder = new BitTreeDecoder[16];
        int m_NumPosStates = 0;

        LenDecoder() {
        }

        public void Create(int i) {
            while (true) {
                int i2 = this.m_NumPosStates;
                if (i2 < i) {
                    this.m_LowCoder[i2] = new BitTreeDecoder(3);
                    this.m_MidCoder[this.m_NumPosStates] = new BitTreeDecoder(3);
                    this.m_NumPosStates++;
                } else {
                    return;
                }
            }
        }

        public void Init() {
            com.badlogic.gdx.utils.compression.rangecoder.Decoder.InitBitModels(this.m_Choice);
            for (int i = 0; i < this.m_NumPosStates; i++) {
                this.m_LowCoder[i].Init();
                this.m_MidCoder[i].Init();
            }
            this.m_HighCoder.Init();
        }

        public int Decode(com.badlogic.gdx.utils.compression.rangecoder.Decoder decoder, int i) throws IOException {
            int i2;
            if (decoder.DecodeBit(this.m_Choice, 0) == 0) {
                return this.m_LowCoder[i].Decode(decoder);
            }
            if (decoder.DecodeBit(this.m_Choice, 1) == 0) {
                i2 = this.m_MidCoder[i].Decode(decoder);
            } else {
                i2 = this.m_HighCoder.Decode(decoder) + 8;
            }
            return i2 + 8;
        }
    }

    /* access modifiers changed from: package-private */
    public class LiteralDecoder {
        Decoder2[] m_Coders;
        int m_NumPosBits;
        int m_NumPrevBits;
        int m_PosMask;

        /* access modifiers changed from: package-private */
        public class Decoder2 {
            short[] m_Decoders = new short[GL20.GL_SRC_COLOR];

            Decoder2() {
            }

            public void Init() {
                com.badlogic.gdx.utils.compression.rangecoder.Decoder.InitBitModels(this.m_Decoders);
            }

            public byte DecodeNormal(com.badlogic.gdx.utils.compression.rangecoder.Decoder decoder) throws IOException {
                int i = 1;
                do {
                    i = decoder.DecodeBit(this.m_Decoders, i) | (i << 1);
                } while (i < 256);
                return (byte) i;
            }

            public byte DecodeWithMatchByte(com.badlogic.gdx.utils.compression.rangecoder.Decoder decoder, byte b) throws IOException {
                int i = 1;
                while (true) {
                    int i2 = (b >> 7) & 1;
                    b = (byte) (b << 1);
                    int DecodeBit = decoder.DecodeBit(this.m_Decoders, ((i2 + 1) << 8) + i);
                    i = (i << 1) | DecodeBit;
                    if (i2 == DecodeBit) {
                        if (i >= 256) {
                            break;
                        }
                    } else {
                        while (i < 256) {
                            i = (i << 1) | decoder.DecodeBit(this.m_Decoders, i);
                        }
                    }
                }
                return (byte) i;
            }
        }

        LiteralDecoder() {
        }

        public void Create(int i, int i2) {
            if (!(this.m_Coders != null && this.m_NumPrevBits == i2 && this.m_NumPosBits == i)) {
                this.m_NumPosBits = i;
                this.m_PosMask = (1 << i) - 1;
                this.m_NumPrevBits = i2;
                int i3 = 1 << (this.m_NumPrevBits + this.m_NumPosBits);
                this.m_Coders = new Decoder2[i3];
                for (int i4 = 0; i4 < i3; i4++) {
                    this.m_Coders[i4] = new Decoder2();
                }
            }
        }

        public void Init() {
            int i = 1 << (this.m_NumPrevBits + this.m_NumPosBits);
            for (int i2 = 0; i2 < i; i2++) {
                this.m_Coders[i2].Init();
            }
        }

        /* access modifiers changed from: package-private */
        public Decoder2 GetDecoder(int i, byte b) {
            Decoder2[] decoder2Arr = this.m_Coders;
            int i2 = i & this.m_PosMask;
            int i3 = this.m_NumPrevBits;
            return decoder2Arr[(i2 << i3) + ((b & 255) >>> (8 - i3))];
        }
    }

    public Decoder() {
        for (int i = 0; i < 4; i++) {
            this.m_PosSlotDecoder[i] = new BitTreeDecoder(6);
        }
    }

    /* access modifiers changed from: package-private */
    public boolean SetDictionarySize(int i) {
        if (i < 0) {
            return false;
        }
        if (this.m_DictionarySize != i) {
            this.m_DictionarySize = i;
            this.m_DictionarySizeCheck = Math.max(this.m_DictionarySize, 1);
            this.m_OutWindow.Create(Math.max(this.m_DictionarySizeCheck, (int) StreamUtils.DEFAULT_BUFFER_SIZE));
        }
        return true;
    }

    /* access modifiers changed from: package-private */
    public boolean SetLcLpPb(int i, int i2, int i3) {
        if (i > 8 || i2 > 4 || i3 > 4) {
            return false;
        }
        this.m_LiteralDecoder.Create(i2, i);
        int i4 = 1 << i3;
        this.m_LenDecoder.Create(i4);
        this.m_RepLenDecoder.Create(i4);
        this.m_PosStateMask = i4 - 1;
        return true;
    }

    /* access modifiers changed from: package-private */
    public void Init() throws IOException {
        this.m_OutWindow.Init(false);
        com.badlogic.gdx.utils.compression.rangecoder.Decoder.InitBitModels(this.m_IsMatchDecoders);
        com.badlogic.gdx.utils.compression.rangecoder.Decoder.InitBitModels(this.m_IsRep0LongDecoders);
        com.badlogic.gdx.utils.compression.rangecoder.Decoder.InitBitModels(this.m_IsRepDecoders);
        com.badlogic.gdx.utils.compression.rangecoder.Decoder.InitBitModels(this.m_IsRepG0Decoders);
        com.badlogic.gdx.utils.compression.rangecoder.Decoder.InitBitModels(this.m_IsRepG1Decoders);
        com.badlogic.gdx.utils.compression.rangecoder.Decoder.InitBitModels(this.m_IsRepG2Decoders);
        com.badlogic.gdx.utils.compression.rangecoder.Decoder.InitBitModels(this.m_PosDecoders);
        this.m_LiteralDecoder.Init();
        for (int i = 0; i < 4; i++) {
            this.m_PosSlotDecoder[i].Init();
        }
        this.m_LenDecoder.Init();
        this.m_RepLenDecoder.Init();
        this.m_PosAlignDecoder.Init();
        this.m_RangeDecoder.Init();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:40:0x0111, code lost:
        r17.m_OutWindow.Flush();
        r17.m_OutWindow.ReleaseStream();
        r17.m_RangeDecoder.ReleaseStream();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x0120, code lost:
        return true;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean Code(java.io.InputStream r18, java.io.OutputStream r19, long r20) throws java.io.IOException {
        /*
        // Method dump skipped, instructions count: 331
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.compression.lzma.Decoder.Code(java.io.InputStream, java.io.OutputStream, long):boolean");
    }

    public boolean SetDecoderProperties(byte[] bArr) {
        if (bArr.length < 5) {
            return false;
        }
        int i = bArr[0] & 255;
        int i2 = i % 9;
        int i3 = i / 9;
        int i4 = i3 % 5;
        int i5 = i3 / 5;
        int i6 = 0;
        int i7 = 0;
        while (i6 < 4) {
            int i8 = i6 + 1;
            i7 += (bArr[i8] & 255) << (i6 * 8);
            i6 = i8;
        }
        if (!SetLcLpPb(i2, i4, i5)) {
            return false;
        }
        return SetDictionarySize(i7);
    }
}
