package com.badlogic.gdx.utils;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringWriter;
import java.nio.Buffer;
import java.nio.ByteBuffer;

public final class StreamUtils {
    public static final int DEFAULT_BUFFER_SIZE = 4096;
    public static final byte[] EMPTY_BYTES = new byte[0];

    public static void copyStream(InputStream inputStream, OutputStream outputStream) throws IOException {
        copyStream(inputStream, outputStream, new byte[DEFAULT_BUFFER_SIZE]);
    }

    public static void copyStream(InputStream inputStream, OutputStream outputStream, int i) throws IOException {
        copyStream(inputStream, outputStream, new byte[i]);
    }

    public static void copyStream(InputStream inputStream, OutputStream outputStream, byte[] bArr) throws IOException {
        while (true) {
            int read = inputStream.read(bArr);
            if (read != -1) {
                outputStream.write(bArr, 0, read);
            } else {
                return;
            }
        }
    }

    public static void copyStream(InputStream inputStream, ByteBuffer byteBuffer) throws IOException {
        copyStream(inputStream, byteBuffer, new byte[DEFAULT_BUFFER_SIZE]);
    }

    public static void copyStream(InputStream inputStream, ByteBuffer byteBuffer, int i) throws IOException {
        copyStream(inputStream, byteBuffer, new byte[i]);
    }

    public static int copyStream(InputStream inputStream, ByteBuffer byteBuffer, byte[] bArr) throws IOException {
        int position = byteBuffer.position();
        int i = 0;
        while (true) {
            int read = inputStream.read(bArr);
            if (read != -1) {
                BufferUtils.copy(bArr, 0, (Buffer) byteBuffer, read);
                i += read;
                byteBuffer.position(position + i);
            } else {
                byteBuffer.position(position);
                return i;
            }
        }
    }

    public static byte[] copyStreamToByteArray(InputStream inputStream) throws IOException {
        return copyStreamToByteArray(inputStream, inputStream.available());
    }

    public static byte[] copyStreamToByteArray(InputStream inputStream, int i) throws IOException {
        OptimizedByteArrayOutputStream optimizedByteArrayOutputStream = new OptimizedByteArrayOutputStream(Math.max(0, i));
        copyStream(inputStream, optimizedByteArrayOutputStream);
        return optimizedByteArrayOutputStream.toByteArray();
    }

    public static String copyStreamToString(InputStream inputStream) throws IOException {
        return copyStreamToString(inputStream, inputStream.available(), null);
    }

    public static String copyStreamToString(InputStream inputStream, int i) throws IOException {
        return copyStreamToString(inputStream, i, null);
    }

    public static String copyStreamToString(InputStream inputStream, int i, String str) throws IOException {
        InputStreamReader inputStreamReader = str == null ? new InputStreamReader(inputStream) : new InputStreamReader(inputStream, str);
        StringWriter stringWriter = new StringWriter(Math.max(0, i));
        char[] cArr = new char[DEFAULT_BUFFER_SIZE];
        while (true) {
            int read = inputStreamReader.read(cArr);
            if (read == -1) {
                return stringWriter.toString();
            }
            stringWriter.write(cArr, 0, read);
        }
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Throwable unused) {
            }
        }
    }

    public static class OptimizedByteArrayOutputStream extends ByteArrayOutputStream {
        public OptimizedByteArrayOutputStream(int i) {
            super(i);
        }

        public synchronized byte[] toByteArray() {
            if (this.count == this.buf.length) {
                return this.buf;
            }
            return super.toByteArray();
        }

        public byte[] getBuffer() {
            return this.buf;
        }
    }
}
