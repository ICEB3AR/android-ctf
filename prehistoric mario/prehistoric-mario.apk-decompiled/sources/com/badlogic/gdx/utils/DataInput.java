package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;

public class DataInput extends DataInputStream {
    private char[] chars = new char[32];

    public DataInput(InputStream inputStream) {
        super(inputStream);
    }

    public int readInt(boolean z) throws IOException {
        int read = read();
        int i = read & 127;
        if ((read & 128) != 0) {
            int read2 = read();
            i |= (read2 & 127) << 7;
            if ((read2 & 128) != 0) {
                int read3 = read();
                i |= (read3 & 127) << 14;
                if ((read3 & 128) != 0) {
                    int read4 = read();
                    i |= (read4 & 127) << 21;
                    if ((read4 & 128) != 0) {
                        i |= (read() & 127) << 28;
                    }
                }
            }
        }
        return z ? i : (i >>> 1) ^ (-(i & 1));
    }

    public String readString() throws IOException {
        int readInt = readInt(true);
        if (readInt == 0) {
            return null;
        }
        if (readInt == 1) {
            return BuildConfig.FLAVOR;
        }
        int i = readInt - 1;
        if (this.chars.length < i) {
            this.chars = new char[i];
        }
        char[] cArr = this.chars;
        int i2 = 0;
        int i3 = 0;
        while (i2 < i) {
            i3 = read();
            if (i3 > 127) {
                break;
            }
            cArr[i2] = (char) i3;
            i2++;
        }
        if (i2 < i) {
            readUtf8_slow(i, i2, i3);
        }
        return new String(cArr, 0, i);
    }

    private void readUtf8_slow(int i, int i2, int i3) throws IOException {
        char[] cArr = this.chars;
        while (true) {
            switch (i3 >> 4) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                    cArr[i2] = (char) i3;
                    break;
                case 12:
                case 13:
                    cArr[i2] = (char) (((i3 & 31) << 6) | (read() & 63));
                    break;
                case 14:
                    cArr[i2] = (char) (((i3 & 15) << 12) | ((read() & 63) << 6) | (read() & 63));
                    break;
            }
            i2++;
            if (i2 < i) {
                i3 = read() & 255;
            } else {
                return;
            }
        }
    }
}
