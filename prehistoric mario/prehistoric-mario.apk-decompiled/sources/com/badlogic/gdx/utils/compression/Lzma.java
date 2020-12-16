package com.badlogic.gdx.utils.compression;

import com.badlogic.gdx.utils.compression.lzma.Decoder;
import com.badlogic.gdx.utils.compression.lzma.Encoder;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Lzma {

    static class CommandLine {
        public static final int kBenchmak = 2;
        public static final int kDecode = 1;
        public static final int kEncode = 0;
        public int Algorithm = 2;
        public int Command = -1;
        public int DictionarySize = 8388608;
        public boolean DictionarySizeIsDefined = false;
        public boolean Eos = false;
        public int Fb = 128;
        public boolean FbIsDefined = false;
        public String InFile;
        public int Lc = 3;
        public int Lp = 0;
        public int MatchFinder = 1;
        public int NumBenchmarkPasses = 10;
        public String OutFile;
        public int Pb = 2;

        CommandLine() {
        }
    }

    public static void compress(InputStream inputStream, OutputStream outputStream) throws IOException {
        CommandLine commandLine = new CommandLine();
        boolean z = commandLine.Eos;
        Encoder encoder = new Encoder();
        if (!encoder.SetAlgorithm(commandLine.Algorithm)) {
            throw new RuntimeException("Incorrect compression mode");
        } else if (!encoder.SetDictionarySize(commandLine.DictionarySize)) {
            throw new RuntimeException("Incorrect dictionary size");
        } else if (!encoder.SetNumFastBytes(commandLine.Fb)) {
            throw new RuntimeException("Incorrect -fb value");
        } else if (!encoder.SetMatchFinder(commandLine.MatchFinder)) {
            throw new RuntimeException("Incorrect -mf value");
        } else if (encoder.SetLcLpPb(commandLine.Lc, commandLine.Lp, commandLine.Pb)) {
            encoder.SetEndMarkerMode(z);
            encoder.WriteCoderProperties(outputStream);
            long j = -1;
            if (!z) {
                long available = (long) inputStream.available();
                if (available != 0) {
                    j = available;
                }
            }
            for (int i = 0; i < 8; i++) {
                outputStream.write(((int) (j >>> (i * 8))) & 255);
            }
            encoder.Code(inputStream, outputStream, -1, -1, null);
        } else {
            throw new RuntimeException("Incorrect -lc or -lp or -pb value");
        }
    }

    public static void decompress(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[5];
        if (inputStream.read(bArr, 0, 5) == 5) {
            Decoder decoder = new Decoder();
            if (decoder.SetDecoderProperties(bArr)) {
                long j = 0;
                for (int i = 0; i < 8; i++) {
                    int read = inputStream.read();
                    if (read >= 0) {
                        j |= ((long) read) << (i * 8);
                    } else {
                        throw new RuntimeException("Can't read stream size");
                    }
                }
                if (!decoder.Code(inputStream, outputStream, j)) {
                    throw new RuntimeException("Error in data stream");
                }
                return;
            }
            throw new RuntimeException("Incorrect stream properties");
        }
        throw new RuntimeException("input .lzma file is too short");
    }
}
