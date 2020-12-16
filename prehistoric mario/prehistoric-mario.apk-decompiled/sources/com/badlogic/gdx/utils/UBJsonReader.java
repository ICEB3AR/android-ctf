package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.JsonValue;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;

public class UBJsonReader implements BaseJsonReader {
    public boolean oldFormat = true;

    @Override // com.badlogic.gdx.utils.BaseJsonReader
    public JsonValue parse(InputStream inputStream) {
        Throwable th;
        IOException e;
        DataInputStream dataInputStream = null;
        try {
            DataInputStream dataInputStream2 = new DataInputStream(inputStream);
            try {
                JsonValue parse = parse(dataInputStream2);
                StreamUtils.closeQuietly(dataInputStream2);
                return parse;
            } catch (IOException e2) {
                e = e2;
                dataInputStream = dataInputStream2;
                try {
                    throw new SerializationException(e);
                } catch (Throwable th2) {
                    th = th2;
                    StreamUtils.closeQuietly(dataInputStream);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                dataInputStream = dataInputStream2;
                StreamUtils.closeQuietly(dataInputStream);
                throw th;
            }
        } catch (IOException e3) {
            e = e3;
            throw new SerializationException(e);
        }
    }

    @Override // com.badlogic.gdx.utils.BaseJsonReader
    public JsonValue parse(FileHandle fileHandle) {
        try {
            return parse(fileHandle.read(8192));
        } catch (Exception e) {
            throw new SerializationException("Error parsing file: " + fileHandle, e);
        }
    }

    public JsonValue parse(DataInputStream dataInputStream) throws IOException {
        try {
            return parse(dataInputStream, dataInputStream.readByte());
        } finally {
            StreamUtils.closeQuietly(dataInputStream);
        }
    }

    /* access modifiers changed from: protected */
    public JsonValue parse(DataInputStream dataInputStream, byte b) throws IOException {
        if (b == 91) {
            return parseArray(dataInputStream);
        }
        if (b == 123) {
            return parseObject(dataInputStream);
        }
        if (b == 90) {
            return new JsonValue(JsonValue.ValueType.nullValue);
        }
        if (b == 84) {
            return new JsonValue(true);
        }
        if (b == 70) {
            return new JsonValue(false);
        }
        if (b == 66) {
            return new JsonValue((long) readUChar(dataInputStream));
        }
        if (b == 85) {
            return new JsonValue((long) readUChar(dataInputStream));
        }
        if (b == 105) {
            return new JsonValue((long) (this.oldFormat ? dataInputStream.readShort() : dataInputStream.readByte()));
        } else if (b == 73) {
            return new JsonValue((long) (this.oldFormat ? dataInputStream.readInt() : dataInputStream.readShort()));
        } else if (b == 108) {
            return new JsonValue((long) dataInputStream.readInt());
        } else {
            if (b == 76) {
                return new JsonValue(dataInputStream.readLong());
            }
            if (b == 100) {
                return new JsonValue((double) dataInputStream.readFloat());
            }
            if (b == 68) {
                return new JsonValue(dataInputStream.readDouble());
            }
            if (b == 115 || b == 83) {
                return new JsonValue(parseString(dataInputStream, b));
            }
            if (b == 97 || b == 65) {
                return parseData(dataInputStream, b);
            }
            if (b == 67) {
                return new JsonValue((long) dataInputStream.readChar());
            }
            throw new GdxRuntimeException("Unrecognized data type");
        }
    }

    /* access modifiers changed from: protected */
    public JsonValue parseArray(DataInputStream dataInputStream) throws IOException {
        byte b;
        JsonValue jsonValue = new JsonValue(JsonValue.ValueType.array);
        byte readByte = dataInputStream.readByte();
        if (readByte == 36) {
            b = dataInputStream.readByte();
            readByte = dataInputStream.readByte();
        } else {
            b = 0;
        }
        long j = -1;
        if (readByte == 35) {
            j = parseSize(dataInputStream, false, -1);
            if (j < 0) {
                throw new GdxRuntimeException("Unrecognized data type");
            } else if (j == 0) {
                return jsonValue;
            } else {
                readByte = b == 0 ? dataInputStream.readByte() : b;
            }
        }
        JsonValue jsonValue2 = null;
        long j2 = 0;
        while (dataInputStream.available() > 0 && readByte != 93) {
            JsonValue parse = parse(dataInputStream, readByte);
            parse.parent = jsonValue;
            if (jsonValue2 != null) {
                parse.prev = jsonValue2;
                jsonValue2.next = parse;
                jsonValue.size++;
            } else {
                jsonValue.child = parse;
                jsonValue.size = 1;
            }
            if (j > 0) {
                j2++;
                if (j2 >= j) {
                    break;
                }
            }
            jsonValue2 = parse;
            readByte = b == 0 ? dataInputStream.readByte() : b;
        }
        return jsonValue;
    }

    /* access modifiers changed from: protected */
    public JsonValue parseObject(DataInputStream dataInputStream) throws IOException {
        byte b;
        JsonValue jsonValue = new JsonValue(JsonValue.ValueType.object);
        byte readByte = dataInputStream.readByte();
        if (readByte == 36) {
            b = dataInputStream.readByte();
            readByte = dataInputStream.readByte();
        } else {
            b = 0;
        }
        long j = -1;
        if (readByte == 35) {
            j = parseSize(dataInputStream, false, -1);
            if (j < 0) {
                throw new GdxRuntimeException("Unrecognized data type");
            } else if (j == 0) {
                return jsonValue;
            } else {
                readByte = dataInputStream.readByte();
            }
        }
        JsonValue jsonValue2 = null;
        long j2 = 0;
        while (dataInputStream.available() > 0 && readByte != 125) {
            String parseString = parseString(dataInputStream, true, readByte);
            JsonValue parse = parse(dataInputStream, b == 0 ? dataInputStream.readByte() : b);
            parse.setName(parseString);
            parse.parent = jsonValue;
            if (jsonValue2 != null) {
                parse.prev = jsonValue2;
                jsonValue2.next = parse;
                jsonValue.size++;
            } else {
                jsonValue.child = parse;
                jsonValue.size = 1;
            }
            if (j > 0) {
                j2++;
                if (j2 >= j) {
                    break;
                }
            }
            readByte = dataInputStream.readByte();
            jsonValue2 = parse;
        }
        return jsonValue;
    }

    /* access modifiers changed from: protected */
    public JsonValue parseData(DataInputStream dataInputStream, byte b) throws IOException {
        byte readByte = dataInputStream.readByte();
        long readUInt = b == 65 ? readUInt(dataInputStream) : (long) readUChar(dataInputStream);
        JsonValue jsonValue = new JsonValue(JsonValue.ValueType.array);
        JsonValue jsonValue2 = null;
        long j = 0;
        while (j < readUInt) {
            JsonValue parse = parse(dataInputStream, readByte);
            parse.parent = jsonValue;
            if (jsonValue2 != null) {
                jsonValue2.next = parse;
                jsonValue.size++;
            } else {
                jsonValue.child = parse;
                jsonValue.size = 1;
            }
            j++;
            jsonValue2 = parse;
        }
        return jsonValue;
    }

    /* access modifiers changed from: protected */
    public String parseString(DataInputStream dataInputStream, byte b) throws IOException {
        return parseString(dataInputStream, false, b);
    }

    /* access modifiers changed from: protected */
    public String parseString(DataInputStream dataInputStream, boolean z, byte b) throws IOException {
        long j = -1;
        if (b == 83) {
            j = parseSize(dataInputStream, true, -1);
        } else if (b == 115) {
            j = (long) readUChar(dataInputStream);
        } else if (z) {
            j = parseSize(dataInputStream, b, false, -1);
        }
        if (j >= 0) {
            return j > 0 ? readString(dataInputStream, j) : BuildConfig.FLAVOR;
        }
        throw new GdxRuntimeException("Unrecognized data type, string expected");
    }

    /* access modifiers changed from: protected */
    public long parseSize(DataInputStream dataInputStream, boolean z, long j) throws IOException {
        return parseSize(dataInputStream, dataInputStream.readByte(), z, j);
    }

    /* access modifiers changed from: protected */
    public long parseSize(DataInputStream dataInputStream, byte b, boolean z, long j) throws IOException {
        int readUShort;
        if (b == 105) {
            readUShort = readUChar(dataInputStream);
        } else if (b == 73) {
            readUShort = readUShort(dataInputStream);
        } else if (b == 108) {
            return readUInt(dataInputStream);
        } else {
            if (b == 76) {
                return dataInputStream.readLong();
            }
            return z ? (((long) (((short) b) & 255)) << 24) | (((long) (((short) dataInputStream.readByte()) & 255)) << 16) | (((long) (((short) dataInputStream.readByte()) & 255)) << 8) | ((long) (((short) dataInputStream.readByte()) & 255)) : j;
        }
        return (long) readUShort;
    }

    /* access modifiers changed from: protected */
    public short readUChar(DataInputStream dataInputStream) throws IOException {
        return (short) (((short) dataInputStream.readByte()) & 255);
    }

    /* access modifiers changed from: protected */
    public int readUShort(DataInputStream dataInputStream) throws IOException {
        return dataInputStream.readShort() & 65535;
    }

    /* access modifiers changed from: protected */
    public long readUInt(DataInputStream dataInputStream) throws IOException {
        return ((long) dataInputStream.readInt()) & -1;
    }

    /* access modifiers changed from: protected */
    public String readString(DataInputStream dataInputStream, long j) throws IOException {
        byte[] bArr = new byte[((int) j)];
        dataInputStream.readFully(bArr);
        return new String(bArr, "UTF-8");
    }
}
