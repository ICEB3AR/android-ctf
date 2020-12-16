package com.badlogic.gdx.utils;

import java.io.DataInput;
import java.io.DataInputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

public class LittleEndianInputStream extends FilterInputStream implements DataInput {
    private DataInputStream din;

    public LittleEndianInputStream(InputStream inputStream) {
        super(inputStream);
        this.din = new DataInputStream(inputStream);
    }

    @Override // java.io.DataInput
    public void readFully(byte[] bArr) throws IOException {
        this.din.readFully(bArr);
    }

    @Override // java.io.DataInput
    public void readFully(byte[] bArr, int i, int i2) throws IOException {
        this.din.readFully(bArr, i, i2);
    }

    @Override // java.io.DataInput
    public int skipBytes(int i) throws IOException {
        return this.din.skipBytes(i);
    }

    @Override // java.io.DataInput
    public boolean readBoolean() throws IOException {
        return this.din.readBoolean();
    }

    @Override // java.io.DataInput
    public byte readByte() throws IOException {
        return this.din.readByte();
    }

    @Override // java.io.DataInput
    public int readUnsignedByte() throws IOException {
        return this.din.readUnsignedByte();
    }

    @Override // java.io.DataInput
    public short readShort() throws IOException {
        return (short) ((this.din.read() & 255) | (this.din.read() << 8));
    }

    @Override // java.io.DataInput
    public int readUnsignedShort() throws IOException {
        return (this.din.read() & 255) | ((this.din.read() & 255) << 8);
    }

    @Override // java.io.DataInput
    public char readChar() throws IOException {
        return this.din.readChar();
    }

    @Override // java.io.DataInput
    public int readInt() throws IOException {
        int[] iArr = new int[4];
        for (int i = 3; i >= 0; i--) {
            iArr[i] = this.din.read();
        }
        return (iArr[3] & 255) | ((iArr[0] & 255) << 24) | ((iArr[1] & 255) << 16) | ((iArr[2] & 255) << 8);
    }

    @Override // java.io.DataInput
    public long readLong() throws IOException {
        int[] iArr = new int[8];
        for (int i = 7; i >= 0; i--) {
            iArr[i] = this.din.read();
        }
        return ((long) (iArr[7] & 255)) | (((long) (iArr[0] & 255)) << 56) | (((long) (iArr[1] & 255)) << 48) | (((long) (iArr[2] & 255)) << 40) | (((long) (iArr[3] & 255)) << 32) | (((long) (iArr[4] & 255)) << 24) | (((long) (iArr[5] & 255)) << 16) | (((long) (iArr[6] & 255)) << 8);
    }

    @Override // java.io.DataInput
    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readInt());
    }

    @Override // java.io.DataInput
    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readLong());
    }

    @Override // java.io.DataInput
    public final String readLine() throws IOException {
        return this.din.readLine();
    }

    @Override // java.io.DataInput
    public String readUTF() throws IOException {
        return this.din.readUTF();
    }
}
