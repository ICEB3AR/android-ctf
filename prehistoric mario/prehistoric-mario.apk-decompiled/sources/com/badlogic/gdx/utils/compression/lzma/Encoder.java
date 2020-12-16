package com.badlogic.gdx.utils.compression.lzma;

import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.utils.compression.ICodeProgress;
import com.badlogic.gdx.utils.compression.lz.BinTree;
import com.badlogic.gdx.utils.compression.rangecoder.BitTreeEncoder;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Encoder {
    public static final int EMatchFinderTypeBT2 = 0;
    public static final int EMatchFinderTypeBT4 = 1;
    static byte[] g_FastPos = new byte[2048];
    static final int kDefaultDictionaryLogSize = 22;
    static final int kIfinityPrice = 268435455;
    static final int kNumFastBytesDefault = 32;
    public static final int kNumLenSpecSymbols = 16;
    static final int kNumOpts = 4096;
    public static final int kPropSize = 5;
    int _additionalOffset;
    int _alignPriceCount;
    int[] _alignPrices = new int[16];
    int _dictionarySize;
    int _dictionarySizePrev;
    int _distTableSize = 44;
    int[] _distancesPrices = new int[GL20.GL_NEVER];
    boolean _finished;
    InputStream _inStream;
    short[] _isMatch = new short[192];
    short[] _isRep = new short[12];
    short[] _isRep0Long = new short[192];
    short[] _isRepG0 = new short[12];
    short[] _isRepG1 = new short[12];
    short[] _isRepG2 = new short[12];
    LenPriceTableEncoder _lenEncoder = new LenPriceTableEncoder();
    LiteralEncoder _literalEncoder = new LiteralEncoder();
    int _longestMatchLength;
    boolean _longestMatchWasFound;
    int[] _matchDistances = new int[548];
    BinTree _matchFinder = null;
    int _matchFinderType;
    int _matchPriceCount;
    boolean _needReleaseMFStream;
    int _numDistancePairs;
    int _numFastBytes = 32;
    int _numFastBytesPrev;
    int _numLiteralContextBits;
    int _numLiteralPosStateBits;
    Optimal[] _optimum = new Optimal[4096];
    int _optimumCurrentIndex;
    int _optimumEndIndex;
    BitTreeEncoder _posAlignEncoder = new BitTreeEncoder(4);
    short[] _posEncoders = new short[114];
    BitTreeEncoder[] _posSlotEncoder = new BitTreeEncoder[4];
    int[] _posSlotPrices = new int[256];
    int _posStateBits = 2;
    int _posStateMask = 3;
    byte _previousByte;
    com.badlogic.gdx.utils.compression.rangecoder.Encoder _rangeEncoder = new com.badlogic.gdx.utils.compression.rangecoder.Encoder();
    int[] _repDistances = new int[4];
    LenPriceTableEncoder _repMatchLenEncoder = new LenPriceTableEncoder();
    int _state = Base.StateInit();
    boolean _writeEndMark;
    int backRes;
    boolean[] finished;
    long nowPos64;
    long[] processedInSize;
    long[] processedOutSize;
    byte[] properties;
    int[] repLens;
    int[] reps;
    int[] tempPrices;

    /* access modifiers changed from: package-private */
    public boolean ChangePair(int i, int i2) {
        return i < 33554432 && i2 >= (i << 7);
    }

    public boolean SetAlgorithm(int i) {
        return true;
    }

    static {
        byte[] bArr = g_FastPos;
        bArr[0] = 0;
        bArr[1] = 1;
        int i = 2;
        int i2 = 2;
        while (i < 22) {
            int i3 = 1 << ((i >> 1) - 1);
            int i4 = i2;
            int i5 = 0;
            while (i5 < i3) {
                g_FastPos[i4] = (byte) i;
                i5++;
                i4++;
            }
            i++;
            i2 = i4;
        }
    }

    static int GetPosSlot(int i) {
        if (i < 2048) {
            return g_FastPos[i];
        }
        if (i < 2097152) {
            return g_FastPos[i >> 10] + 20;
        }
        return g_FastPos[i >> 20] + 40;
    }

    static int GetPosSlot2(int i) {
        if (i < 131072) {
            return g_FastPos[i >> 6] + 12;
        }
        if (i < 134217728) {
            return g_FastPos[i >> 16] + 32;
        }
        return g_FastPos[i >> 26] + 52;
    }

    /* access modifiers changed from: package-private */
    public void BaseInit() {
        this._state = Base.StateInit();
        this._previousByte = 0;
        for (int i = 0; i < 4; i++) {
            this._repDistances[i] = 0;
        }
    }

    /* access modifiers changed from: package-private */
    public class LiteralEncoder {
        Encoder2[] m_Coders;
        int m_NumPosBits;
        int m_NumPrevBits;
        int m_PosMask;

        /* access modifiers changed from: package-private */
        public class Encoder2 {
            short[] m_Encoders = new short[GL20.GL_SRC_COLOR];

            Encoder2() {
            }

            public void Init() {
                com.badlogic.gdx.utils.compression.rangecoder.Encoder.InitBitModels(this.m_Encoders);
            }

            public void Encode(com.badlogic.gdx.utils.compression.rangecoder.Encoder encoder, byte b) throws IOException {
                int i = 1;
                for (int i2 = 7; i2 >= 0; i2--) {
                    int i3 = (b >> i2) & 1;
                    encoder.Encode(this.m_Encoders, i, i3);
                    i = (i << 1) | i3;
                }
            }

            public void EncodeMatched(com.badlogic.gdx.utils.compression.rangecoder.Encoder encoder, byte b, byte b2) throws IOException {
                int i;
                int i2 = 1;
                boolean z = true;
                for (int i3 = 7; i3 >= 0; i3--) {
                    int i4 = (b2 >> i3) & 1;
                    if (z) {
                        int i5 = (b >> i3) & 1;
                        i = ((i5 + 1) << 8) + i2;
                        z = i5 == i4;
                    } else {
                        i = i2;
                    }
                    encoder.Encode(this.m_Encoders, i, i4);
                    i2 = (i2 << 1) | i4;
                }
            }

            /* JADX WARNING: Removed duplicated region for block: B:9:0x0028  */
            /* Code decompiled incorrectly, please refer to instructions dump. */
            public int GetPrice(boolean r8, byte r9, byte r10) {
                /*
                    r7 = this;
                    r0 = 1
                    r1 = 0
                    r2 = 7
                    if (r8 == 0) goto L_0x0025
                    r8 = 1
                L_0x0006:
                    if (r2 < 0) goto L_0x0026
                    int r3 = r9 >> r2
                    r3 = r3 & r0
                    int r4 = r10 >> r2
                    r4 = r4 & r0
                    short[] r5 = r7.m_Encoders
                    int r6 = r3 + 1
                    int r6 = r6 << 8
                    int r6 = r6 + r8
                    short r5 = r5[r6]
                    int r5 = com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice(r5, r4)
                    int r1 = r1 + r5
                    int r8 = r8 << 1
                    r8 = r8 | r4
                    if (r3 == r4) goto L_0x0022
                    goto L_0x0036
                L_0x0022:
                    int r2 = r2 + -1
                    goto L_0x0006
                L_0x0025:
                    r8 = 1
                L_0x0026:
                    if (r2 < 0) goto L_0x0039
                    int r9 = r10 >> r2
                    r9 = r9 & r0
                    short[] r3 = r7.m_Encoders
                    short r3 = r3[r8]
                    int r3 = com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice(r3, r9)
                    int r1 = r1 + r3
                    int r8 = r8 << r0
                    r8 = r8 | r9
                L_0x0036:
                    int r2 = r2 + -1
                    goto L_0x0026
                L_0x0039:
                    return r1
                */
                throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.compression.lzma.Encoder.LiteralEncoder.Encoder2.GetPrice(boolean, byte, byte):int");
            }
        }

        LiteralEncoder() {
        }

        public void Create(int i, int i2) {
            if (!(this.m_Coders != null && this.m_NumPrevBits == i2 && this.m_NumPosBits == i)) {
                this.m_NumPosBits = i;
                this.m_PosMask = (1 << i) - 1;
                this.m_NumPrevBits = i2;
                int i3 = 1 << (this.m_NumPrevBits + this.m_NumPosBits);
                this.m_Coders = new Encoder2[i3];
                for (int i4 = 0; i4 < i3; i4++) {
                    this.m_Coders[i4] = new Encoder2();
                }
            }
        }

        public void Init() {
            int i = 1 << (this.m_NumPrevBits + this.m_NumPosBits);
            for (int i2 = 0; i2 < i; i2++) {
                this.m_Coders[i2].Init();
            }
        }

        public Encoder2 GetSubCoder(int i, byte b) {
            Encoder2[] encoder2Arr = this.m_Coders;
            int i2 = i & this.m_PosMask;
            int i3 = this.m_NumPrevBits;
            return encoder2Arr[(i2 << i3) + ((b & 255) >>> (8 - i3))];
        }
    }

    /* access modifiers changed from: package-private */
    public class LenEncoder {
        short[] _choice = new short[2];
        BitTreeEncoder _highCoder = new BitTreeEncoder(8);
        BitTreeEncoder[] _lowCoder = new BitTreeEncoder[16];
        BitTreeEncoder[] _midCoder = new BitTreeEncoder[16];

        public LenEncoder() {
            for (int i = 0; i < 16; i++) {
                this._lowCoder[i] = new BitTreeEncoder(3);
                this._midCoder[i] = new BitTreeEncoder(3);
            }
        }

        public void Init(int i) {
            com.badlogic.gdx.utils.compression.rangecoder.Encoder.InitBitModels(this._choice);
            for (int i2 = 0; i2 < i; i2++) {
                this._lowCoder[i2].Init();
                this._midCoder[i2].Init();
            }
            this._highCoder.Init();
        }

        public void Encode(com.badlogic.gdx.utils.compression.rangecoder.Encoder encoder, int i, int i2) throws IOException {
            if (i < 8) {
                encoder.Encode(this._choice, 0, 0);
                this._lowCoder[i2].Encode(encoder, i);
                return;
            }
            int i3 = i - 8;
            encoder.Encode(this._choice, 0, 1);
            if (i3 < 8) {
                encoder.Encode(this._choice, 1, 0);
                this._midCoder[i2].Encode(encoder, i3);
                return;
            }
            encoder.Encode(this._choice, 1, 1);
            this._highCoder.Encode(encoder, i3 - 8);
        }

        public void SetPrices(int i, int i2, int[] iArr, int i3) {
            int i4 = 0;
            int GetPrice0 = com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice0(this._choice[0]);
            int GetPrice1 = com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice1(this._choice[0]);
            int GetPrice02 = com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice0(this._choice[1]) + GetPrice1;
            int GetPrice12 = GetPrice1 + com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice1(this._choice[1]);
            while (i4 < 8) {
                if (i4 < i2) {
                    iArr[i3 + i4] = this._lowCoder[i].GetPrice(i4) + GetPrice0;
                    i4++;
                } else {
                    return;
                }
            }
            while (i4 < 16) {
                if (i4 < i2) {
                    iArr[i3 + i4] = this._midCoder[i].GetPrice(i4 - 8) + GetPrice02;
                    i4++;
                } else {
                    return;
                }
            }
            while (i4 < i2) {
                iArr[i3 + i4] = this._highCoder.GetPrice((i4 - 8) - 8) + GetPrice12;
                i4++;
            }
        }
    }

    /* access modifiers changed from: package-private */
    public class LenPriceTableEncoder extends LenEncoder {
        int[] _counters = new int[16];
        int[] _prices = new int[GL20.GL_DONT_CARE];
        int _tableSize;

        LenPriceTableEncoder() {
            super();
        }

        public void SetTableSize(int i) {
            this._tableSize = i;
        }

        public int GetPrice(int i, int i2) {
            return this._prices[(i2 * Base.kNumLenSymbols) + i];
        }

        /* access modifiers changed from: package-private */
        public void UpdateTable(int i) {
            SetPrices(i, this._tableSize, this._prices, i * Base.kNumLenSymbols);
            this._counters[i] = this._tableSize;
        }

        public void UpdateTables(int i) {
            for (int i2 = 0; i2 < i; i2++) {
                UpdateTable(i2);
            }
        }

        @Override // com.badlogic.gdx.utils.compression.lzma.Encoder.LenEncoder
        public void Encode(com.badlogic.gdx.utils.compression.rangecoder.Encoder encoder, int i, int i2) throws IOException {
            super.Encode(encoder, i, i2);
            int[] iArr = this._counters;
            int i3 = iArr[i2] - 1;
            iArr[i2] = i3;
            if (i3 == 0) {
                UpdateTable(i2);
            }
        }
    }

    /* access modifiers changed from: package-private */
    public class Optimal {
        public int BackPrev;
        public int BackPrev2;
        public int Backs0;
        public int Backs1;
        public int Backs2;
        public int Backs3;
        public int PosPrev;
        public int PosPrev2;
        public boolean Prev1IsChar;
        public boolean Prev2;
        public int Price;
        public int State;

        Optimal() {
        }

        public void MakeAsChar() {
            this.BackPrev = -1;
            this.Prev1IsChar = false;
        }

        public void MakeAsShortRep() {
            this.BackPrev = 0;
            this.Prev1IsChar = false;
        }

        public boolean IsShortRep() {
            return this.BackPrev == 0;
        }
    }

    /* access modifiers changed from: package-private */
    public void Create() {
        if (this._matchFinder == null) {
            BinTree binTree = new BinTree();
            int i = 4;
            if (this._matchFinderType == 0) {
                i = 2;
            }
            binTree.SetType(i);
            this._matchFinder = binTree;
        }
        this._literalEncoder.Create(this._numLiteralPosStateBits, this._numLiteralContextBits);
        if (this._dictionarySize != this._dictionarySizePrev || this._numFastBytesPrev != this._numFastBytes) {
            this._matchFinder.Create(this._dictionarySize, 4096, this._numFastBytes, 274);
            this._dictionarySizePrev = this._dictionarySize;
            this._numFastBytesPrev = this._numFastBytes;
        }
    }

    public Encoder() {
        this._numLiteralPosStateBits = 0;
        this._numLiteralContextBits = 3;
        this._dictionarySize = 4194304;
        this._dictionarySizePrev = -1;
        this._numFastBytesPrev = -1;
        this._matchFinderType = 1;
        this._writeEndMark = false;
        this._needReleaseMFStream = false;
        this.reps = new int[4];
        this.repLens = new int[4];
        this.processedInSize = new long[1];
        this.processedOutSize = new long[1];
        this.finished = new boolean[1];
        this.properties = new byte[5];
        this.tempPrices = new int[128];
        for (int i = 0; i < 4096; i++) {
            this._optimum[i] = new Optimal();
        }
        for (int i2 = 0; i2 < 4; i2++) {
            this._posSlotEncoder[i2] = new BitTreeEncoder(6);
        }
    }

    /* access modifiers changed from: package-private */
    public void SetWriteEndMarkerMode(boolean z) {
        this._writeEndMark = z;
    }

    /* access modifiers changed from: package-private */
    public void Init() {
        BaseInit();
        this._rangeEncoder.Init();
        com.badlogic.gdx.utils.compression.rangecoder.Encoder.InitBitModels(this._isMatch);
        com.badlogic.gdx.utils.compression.rangecoder.Encoder.InitBitModels(this._isRep0Long);
        com.badlogic.gdx.utils.compression.rangecoder.Encoder.InitBitModels(this._isRep);
        com.badlogic.gdx.utils.compression.rangecoder.Encoder.InitBitModels(this._isRepG0);
        com.badlogic.gdx.utils.compression.rangecoder.Encoder.InitBitModels(this._isRepG1);
        com.badlogic.gdx.utils.compression.rangecoder.Encoder.InitBitModels(this._isRepG2);
        com.badlogic.gdx.utils.compression.rangecoder.Encoder.InitBitModels(this._posEncoders);
        this._literalEncoder.Init();
        for (int i = 0; i < 4; i++) {
            this._posSlotEncoder[i].Init();
        }
        this._lenEncoder.Init(1 << this._posStateBits);
        this._repMatchLenEncoder.Init(1 << this._posStateBits);
        this._posAlignEncoder.Init();
        this._longestMatchWasFound = false;
        this._optimumEndIndex = 0;
        this._optimumCurrentIndex = 0;
        this._additionalOffset = 0;
    }

    /* access modifiers changed from: package-private */
    public int ReadMatchDistances() throws IOException {
        int i;
        this._numDistancePairs = this._matchFinder.GetMatches(this._matchDistances);
        int i2 = this._numDistancePairs;
        if (i2 > 0) {
            int[] iArr = this._matchDistances;
            i = iArr[i2 - 2];
            if (i == this._numFastBytes) {
                i += this._matchFinder.GetMatchLen(i - 1, iArr[i2 - 1], 273 - i);
            }
        } else {
            i = 0;
        }
        this._additionalOffset++;
        return i;
    }

    /* access modifiers changed from: package-private */
    public void MovePos(int i) throws IOException {
        if (i > 0) {
            this._matchFinder.Skip(i);
            this._additionalOffset += i;
        }
    }

    /* access modifiers changed from: package-private */
    public int GetRepLen1Price(int i, int i2) {
        return com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice0(this._isRepG0[i]) + com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice0(this._isRep0Long[(i << 4) + i2]);
    }

    /* access modifiers changed from: package-private */
    public int GetPureRepPrice(int i, int i2, int i3) {
        int i4;
        if (i == 0) {
            return com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice0(this._isRepG0[i2]) + com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice1(this._isRep0Long[(i2 << 4) + i3]);
        }
        int GetPrice1 = com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice1(this._isRepG0[i2]);
        if (i == 1) {
            i4 = com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice0(this._isRepG1[i2]);
        } else {
            GetPrice1 += com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice1(this._isRepG1[i2]);
            i4 = com.badlogic.gdx.utils.compression.rangecoder.Encoder.GetPrice(this._isRepG2[i2], i - 2);
        }
        return i4 + GetPrice1;
    }

    /* access modifiers changed from: package-private */
    public int GetRepPrice(int i, int i2, int i3, int i4) {
        return this._repMatchLenEncoder.GetPrice(i2 - 2, i4) + GetPureRepPrice(i, i3, i4);
    }

    /* access modifiers changed from: package-private */
    public int GetPosLenPrice(int i, int i2, int i3) {
        int i4;
        int GetLenToPosState = Base.GetLenToPosState(i2);
        if (i < 128) {
            i4 = this._distancesPrices[(GetLenToPosState * 128) + i];
        } else {
            i4 = this._alignPrices[i & 15] + this._posSlotPrices[(GetLenToPosState << 6) + GetPosSlot2(i)];
        }
        return i4 + this._lenEncoder.GetPrice(i2 - 2, i3);
    }

    /* access modifiers changed from: package-private */
    public int Backward(int i) {
        this._optimumEndIndex = i;
        int i2 = this._optimum[i].PosPrev;
        int i3 = this._optimum[i].BackPrev;
        while (true) {
            if (this._optimum[i].Prev1IsChar) {
                this._optimum[i2].MakeAsChar();
                Optimal[] optimalArr = this._optimum;
                int i4 = i2 - 1;
                optimalArr[i2].PosPrev = i4;
                if (optimalArr[i].Prev2) {
                    Optimal[] optimalArr2 = this._optimum;
                    optimalArr2[i4].Prev1IsChar = false;
                    optimalArr2[i4].PosPrev = optimalArr2[i].PosPrev2;
                    Optimal[] optimalArr3 = this._optimum;
                    optimalArr3[i4].BackPrev = optimalArr3[i].BackPrev2;
                }
            }
            int i5 = this._optimum[i2].BackPrev;
            int i6 = this._optimum[i2].PosPrev;
            Optimal[] optimalArr4 = this._optimum;
            optimalArr4[i2].BackPrev = i3;
            optimalArr4[i2].PosPrev = i;
            if (i2 <= 0) {
                this.backRes = optimalArr4[0].BackPrev;
                this._optimumCurrentIndex = this._optimum[0].PosPrev;
                return this._optimumCurrentIndex;
            }
            i = i2;
            i3 = i5;
            i2 = i6;
        }
    }

    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v2, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r4v18 */
    /* access modifiers changed from: package-private */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int GetOptimum(int r24) throws java.io.IOException {
        /*
        // Method dump skipped, instructions count: 1770
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.compression.lzma.Encoder.GetOptimum(int):int");
    }

    /* access modifiers changed from: package-private */
    public void WriteEndMarker(int i) throws IOException {
        if (this._writeEndMark) {
            this._rangeEncoder.Encode(this._isMatch, (this._state << 4) + i, 1);
            this._rangeEncoder.Encode(this._isRep, this._state, 0);
            this._state = Base.StateUpdateMatch(this._state);
            this._lenEncoder.Encode(this._rangeEncoder, 0, i);
            this._posSlotEncoder[Base.GetLenToPosState(2)].Encode(this._rangeEncoder, 63);
            this._rangeEncoder.EncodeDirectBits(67108863, 26);
            this._posAlignEncoder.ReverseEncode(this._rangeEncoder, 15);
        }
    }

    /* access modifiers changed from: package-private */
    public void Flush(int i) throws IOException {
        ReleaseMFStream();
        WriteEndMarker(i & this._posStateMask);
        this._rangeEncoder.FlushData();
        this._rangeEncoder.FlushStream();
    }

    public void CodeOneBlock(long[] jArr, long[] jArr2, boolean[] zArr) throws IOException {
        jArr[0] = 0;
        jArr2[0] = 0;
        zArr[0] = true;
        InputStream inputStream = this._inStream;
        if (inputStream != null) {
            this._matchFinder.SetStream(inputStream);
            this._matchFinder.Init();
            this._needReleaseMFStream = true;
            this._inStream = null;
        }
        if (!this._finished) {
            this._finished = true;
            long j = this.nowPos64;
            if (j == 0) {
                if (this._matchFinder.GetNumAvailableBytes() == 0) {
                    Flush((int) this.nowPos64);
                    return;
                }
                ReadMatchDistances();
                this._rangeEncoder.Encode(this._isMatch, (this._state << 4) + (this._posStateMask & ((int) this.nowPos64)), 0);
                this._state = Base.StateUpdateChar(this._state);
                byte GetIndexByte = this._matchFinder.GetIndexByte(0 - this._additionalOffset);
                this._literalEncoder.GetSubCoder((int) this.nowPos64, this._previousByte).Encode(this._rangeEncoder, GetIndexByte);
                this._previousByte = GetIndexByte;
                this._additionalOffset--;
                this.nowPos64++;
            }
            if (this._matchFinder.GetNumAvailableBytes() == 0) {
                Flush((int) this.nowPos64);
                return;
            }
            while (true) {
                int GetOptimum = GetOptimum((int) this.nowPos64);
                int i = this.backRes;
                int i2 = this._posStateMask & ((int) this.nowPos64);
                int i3 = (this._state << 4) + i2;
                if (GetOptimum == 1 && i == -1) {
                    this._rangeEncoder.Encode(this._isMatch, i3, 0);
                    byte GetIndexByte2 = this._matchFinder.GetIndexByte(0 - this._additionalOffset);
                    LiteralEncoder.Encoder2 GetSubCoder = this._literalEncoder.GetSubCoder((int) this.nowPos64, this._previousByte);
                    if (!Base.StateIsCharState(this._state)) {
                        GetSubCoder.EncodeMatched(this._rangeEncoder, this._matchFinder.GetIndexByte(((0 - this._repDistances[0]) - 1) - this._additionalOffset), GetIndexByte2);
                    } else {
                        GetSubCoder.Encode(this._rangeEncoder, GetIndexByte2);
                    }
                    this._previousByte = GetIndexByte2;
                    this._state = Base.StateUpdateChar(this._state);
                } else {
                    this._rangeEncoder.Encode(this._isMatch, i3, 1);
                    if (i < 4) {
                        this._rangeEncoder.Encode(this._isRep, this._state, 1);
                        if (i == 0) {
                            this._rangeEncoder.Encode(this._isRepG0, this._state, 0);
                            if (GetOptimum == 1) {
                                this._rangeEncoder.Encode(this._isRep0Long, i3, 0);
                            } else {
                                this._rangeEncoder.Encode(this._isRep0Long, i3, 1);
                            }
                        } else {
                            this._rangeEncoder.Encode(this._isRepG0, this._state, 1);
                            if (i == 1) {
                                this._rangeEncoder.Encode(this._isRepG1, this._state, 0);
                            } else {
                                this._rangeEncoder.Encode(this._isRepG1, this._state, 1);
                                this._rangeEncoder.Encode(this._isRepG2, this._state, i - 2);
                            }
                        }
                        if (GetOptimum == 1) {
                            this._state = Base.StateUpdateShortRep(this._state);
                        } else {
                            this._repMatchLenEncoder.Encode(this._rangeEncoder, GetOptimum - 2, i2);
                            this._state = Base.StateUpdateRep(this._state);
                        }
                        int i4 = this._repDistances[i];
                        if (i != 0) {
                            while (i >= 1) {
                                int[] iArr = this._repDistances;
                                iArr[i] = iArr[i - 1];
                                i--;
                            }
                            this._repDistances[0] = i4;
                        }
                    } else {
                        this._rangeEncoder.Encode(this._isRep, this._state, 0);
                        this._state = Base.StateUpdateMatch(this._state);
                        this._lenEncoder.Encode(this._rangeEncoder, GetOptimum - 2, i2);
                        int i5 = i - 4;
                        int GetPosSlot = GetPosSlot(i5);
                        this._posSlotEncoder[Base.GetLenToPosState(GetOptimum)].Encode(this._rangeEncoder, GetPosSlot);
                        if (GetPosSlot >= 4) {
                            int i6 = (GetPosSlot >> 1) - 1;
                            int i7 = ((GetPosSlot & 1) | 2) << i6;
                            int i8 = i5 - i7;
                            if (GetPosSlot < 14) {
                                BitTreeEncoder.ReverseEncode(this._posEncoders, (i7 - GetPosSlot) - 1, this._rangeEncoder, i6, i8);
                            } else {
                                this._rangeEncoder.EncodeDirectBits(i8 >> 4, i6 - 4);
                                this._posAlignEncoder.ReverseEncode(this._rangeEncoder, i8 & 15);
                                this._alignPriceCount++;
                            }
                        }
                        for (int i9 = 3; i9 >= 1; i9--) {
                            int[] iArr2 = this._repDistances;
                            iArr2[i9] = iArr2[i9 - 1];
                        }
                        this._repDistances[0] = i5;
                        this._matchPriceCount++;
                    }
                    this._previousByte = this._matchFinder.GetIndexByte((GetOptimum - 1) - this._additionalOffset);
                }
                this._additionalOffset -= GetOptimum;
                this.nowPos64 += (long) GetOptimum;
                if (this._additionalOffset == 0) {
                    if (this._matchPriceCount >= 128) {
                        FillDistancesPrices();
                    }
                    if (this._alignPriceCount >= 16) {
                        FillAlignPrices();
                    }
                    jArr[0] = this.nowPos64;
                    jArr2[0] = this._rangeEncoder.GetProcessedSizeAdd();
                    if (this._matchFinder.GetNumAvailableBytes() == 0) {
                        Flush((int) this.nowPos64);
                        return;
                    } else if (this.nowPos64 - j >= 4096) {
                        this._finished = false;
                        zArr[0] = false;
                        return;
                    }
                }
            }
        }
    }

    /* access modifiers changed from: package-private */
    public void ReleaseMFStream() {
        BinTree binTree = this._matchFinder;
        if (binTree != null && this._needReleaseMFStream) {
            binTree.ReleaseStream();
            this._needReleaseMFStream = false;
        }
    }

    /* access modifiers changed from: package-private */
    public void SetOutStream(OutputStream outputStream) {
        this._rangeEncoder.SetStream(outputStream);
    }

    /* access modifiers changed from: package-private */
    public void ReleaseOutStream() {
        this._rangeEncoder.ReleaseStream();
    }

    /* access modifiers changed from: package-private */
    public void ReleaseStreams() {
        ReleaseMFStream();
        ReleaseOutStream();
    }

    /* access modifiers changed from: package-private */
    public void SetStreams(InputStream inputStream, OutputStream outputStream, long j, long j2) {
        this._inStream = inputStream;
        this._finished = false;
        Create();
        SetOutStream(outputStream);
        Init();
        FillDistancesPrices();
        FillAlignPrices();
        this._lenEncoder.SetTableSize((this._numFastBytes + 1) - 2);
        this._lenEncoder.UpdateTables(1 << this._posStateBits);
        this._repMatchLenEncoder.SetTableSize((this._numFastBytes + 1) - 2);
        this._repMatchLenEncoder.UpdateTables(1 << this._posStateBits);
        this.nowPos64 = 0;
    }

    public void Code(InputStream inputStream, OutputStream outputStream, long j, long j2, ICodeProgress iCodeProgress) throws IOException {
        this._needReleaseMFStream = false;
        try {
            SetStreams(inputStream, outputStream, j, j2);
            while (true) {
                CodeOneBlock(this.processedInSize, this.processedOutSize, this.finished);
                if (!this.finished[0]) {
                    if (iCodeProgress != null) {
                        iCodeProgress.SetProgress(this.processedInSize[0], this.processedOutSize[0]);
                    }
                } else {
                    return;
                }
            }
        } finally {
            ReleaseStreams();
        }
    }

    public void WriteCoderProperties(OutputStream outputStream) throws IOException {
        this.properties[0] = (byte) ((((this._posStateBits * 5) + this._numLiteralPosStateBits) * 9) + this._numLiteralContextBits);
        int i = 0;
        while (i < 4) {
            int i2 = i + 1;
            this.properties[i2] = (byte) (this._dictionarySize >> (i * 8));
            i = i2;
        }
        outputStream.write(this.properties, 0, 5);
    }

    /* access modifiers changed from: package-private */
    public void FillDistancesPrices() {
        for (int i = 4; i < 128; i++) {
            int GetPosSlot = GetPosSlot(i);
            int i2 = (GetPosSlot >> 1) - 1;
            int i3 = ((GetPosSlot & 1) | 2) << i2;
            this.tempPrices[i] = BitTreeEncoder.ReverseGetPrice(this._posEncoders, (i3 - GetPosSlot) - 1, i2, i - i3);
        }
        for (int i4 = 0; i4 < 4; i4++) {
            BitTreeEncoder bitTreeEncoder = this._posSlotEncoder[i4];
            int i5 = i4 << 6;
            for (int i6 = 0; i6 < this._distTableSize; i6++) {
                this._posSlotPrices[i5 + i6] = bitTreeEncoder.GetPrice(i6);
            }
            for (int i7 = 14; i7 < this._distTableSize; i7++) {
                int[] iArr = this._posSlotPrices;
                int i8 = i5 + i7;
                iArr[i8] = iArr[i8] + ((((i7 >> 1) - 1) - 4) << 6);
            }
            int i9 = i4 * 128;
            int i10 = 0;
            while (i10 < 4) {
                this._distancesPrices[i9 + i10] = this._posSlotPrices[i5 + i10];
                i10++;
            }
            while (i10 < 128) {
                this._distancesPrices[i9 + i10] = this._posSlotPrices[GetPosSlot(i10) + i5] + this.tempPrices[i10];
                i10++;
            }
        }
        this._matchPriceCount = 0;
    }

    /* access modifiers changed from: package-private */
    public void FillAlignPrices() {
        for (int i = 0; i < 16; i++) {
            this._alignPrices[i] = this._posAlignEncoder.ReverseGetPrice(i);
        }
        this._alignPriceCount = 0;
    }

    public boolean SetDictionarySize(int i) {
        int i2 = 0;
        if (i < 1 || i > 536870912) {
            return false;
        }
        this._dictionarySize = i;
        while (i > (1 << i2)) {
            i2++;
        }
        this._distTableSize = i2 * 2;
        return true;
    }

    public boolean SetNumFastBytes(int i) {
        if (i < 5 || i > 273) {
            return false;
        }
        this._numFastBytes = i;
        return true;
    }

    public boolean SetMatchFinder(int i) {
        if (i < 0 || i > 2) {
            return false;
        }
        int i2 = this._matchFinderType;
        this._matchFinderType = i;
        if (this._matchFinder == null || i2 == this._matchFinderType) {
            return true;
        }
        this._dictionarySizePrev = -1;
        this._matchFinder = null;
        return true;
    }

    public boolean SetLcLpPb(int i, int i2, int i3) {
        if (i2 < 0 || i2 > 4 || i < 0 || i > 8 || i3 < 0 || i3 > 4) {
            return false;
        }
        this._numLiteralPosStateBits = i2;
        this._numLiteralContextBits = i;
        this._posStateBits = i3;
        this._posStateMask = (1 << this._posStateBits) - 1;
        return true;
    }

    public void SetEndMarkerMode(boolean z) {
        this._writeEndMark = z;
    }
}
