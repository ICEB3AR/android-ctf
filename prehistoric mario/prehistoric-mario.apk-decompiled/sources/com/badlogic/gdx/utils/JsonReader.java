package com.badlogic.gdx.utils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.utils.JsonValue;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

public class JsonReader implements BaseJsonReader {
    private static final byte[] _json_actions = init__json_actions_0();
    private static final byte[] _json_eof_actions = init__json_eof_actions_0();
    private static final short[] _json_index_offsets = init__json_index_offsets_0();
    private static final byte[] _json_indicies = init__json_indicies_0();
    private static final short[] _json_key_offsets = init__json_key_offsets_0();
    private static final byte[] _json_range_lengths = init__json_range_lengths_0();
    private static final byte[] _json_single_lengths = init__json_single_lengths_0();
    private static final byte[] _json_trans_actions = init__json_trans_actions_0();
    private static final char[] _json_trans_keys = init__json_trans_keys_0();
    private static final byte[] _json_trans_targs = init__json_trans_targs_0();
    static final int json_en_array = 23;
    static final int json_en_main = 1;
    static final int json_en_object = 5;
    static final int json_error = 0;
    static final int json_first_final = 35;
    static final int json_start = 1;
    private JsonValue current;
    private final Array<JsonValue> elements = new Array<>(8);
    private final Array<JsonValue> lastChild = new Array<>(8);
    private JsonValue root;

    public JsonValue parse(String str) {
        char[] charArray = str.toCharArray();
        return parse(charArray, 0, charArray.length);
    }

    public JsonValue parse(Reader reader) {
        try {
            char[] cArr = new char[GL20.GL_STENCIL_BUFFER_BIT];
            int i = 0;
            while (true) {
                int read = reader.read(cArr, i, cArr.length - i);
                if (read == -1) {
                    JsonValue parse = parse(cArr, 0, i);
                    StreamUtils.closeQuietly(reader);
                    return parse;
                } else if (read == 0) {
                    char[] cArr2 = new char[(cArr.length * 2)];
                    System.arraycopy(cArr, 0, cArr2, 0, cArr.length);
                    cArr = cArr2;
                } else {
                    i += read;
                }
            }
        } catch (IOException e) {
            throw new SerializationException(e);
        } catch (Throwable th) {
            StreamUtils.closeQuietly(reader);
            throw th;
        }
    }

    @Override // com.badlogic.gdx.utils.BaseJsonReader
    public JsonValue parse(InputStream inputStream) {
        try {
            JsonValue parse = parse(new InputStreamReader(inputStream, "UTF-8"));
            StreamUtils.closeQuietly(inputStream);
            return parse;
        } catch (IOException e) {
            throw new SerializationException(e);
        } catch (Throwable th) {
            StreamUtils.closeQuietly(inputStream);
            throw th;
        }
    }

    @Override // com.badlogic.gdx.utils.BaseJsonReader
    public JsonValue parse(FileHandle fileHandle) {
        try {
            return parse(fileHandle.reader("UTF-8"));
        } catch (Exception e) {
            throw new SerializationException("Error parsing file: " + fileHandle, e);
        }
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:325:0x001a */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:333:0x0062 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:338:0x00a2 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:339:0x00a4 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:219:0x0304 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:348:0x033a */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:327:0x0371 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:331:0x001a */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:342:0x00a2 */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r6v7, types: [int] */
    /* JADX WARN: Type inference failed for: r8v13 */
    /* JADX WARN: Type inference failed for: r20v2, types: [int] */
    /* JADX WARN: Type inference failed for: r11v11 */
    /* JADX WARN: Type inference failed for: r12v44, types: [byte[]] */
    /* JADX WARN: Type inference failed for: r11v16, types: [byte, int] */
    /* JADX WARN: Type inference failed for: r13v37, types: [int] */
    /* JADX WARN: Type inference failed for: r11v17 */
    /* JADX WARN: Type inference failed for: r13v38 */
    /* JADX WARN: Type inference failed for: r11v19 */
    /* JADX WARN: Type inference failed for: r11v22 */
    /* JADX WARN: Type inference failed for: r11v23 */
    /* JADX WARN: Type inference failed for: r11v24 */
    /* JADX WARN: Type inference failed for: r13v42, types: [int] */
    /* JADX WARN: Type inference failed for: r17v34, types: [int] */
    /* JADX WARN: Type inference failed for: r13v44 */
    /* JADX WARNING: Code restructure failed: missing block: B:167:0x023f, code lost:
        r4 = 2;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:225:0x0322 */
    /* JADX WARNING: Removed duplicated region for block: B:235:0x0352  */
    /* JADX WARNING: Removed duplicated region for block: B:237:0x035d  */
    /* JADX WARNING: Removed duplicated region for block: B:239:0x0365  */
    /* JADX WARNING: Removed duplicated region for block: B:303:0x0456  */
    /* JADX WARNING: Removed duplicated region for block: B:311:0x04a6  */
    /* JADX WARNING: Removed duplicated region for block: B:355:0x0163 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x00e7 A[Catch:{ RuntimeException -> 0x0446 }] */
    /* JADX WARNING: Unknown variable types count: 4 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.badlogic.gdx.utils.JsonValue parse(char[] r29, int r30, int r31) {
        /*
        // Method dump skipped, instructions count: 1336
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.JsonReader.parse(char[], int, int):com.badlogic.gdx.utils.JsonValue");
    }

    private static byte[] init__json_actions_0() {
        return new byte[]{0, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 2, 0, 7, 2, 0, 8, 2, 1, 3, 2, 1, 5};
    }

    private static short[] init__json_key_offsets_0() {
        return new short[]{0, 0, 11, 13, 14, 16, 25, 31, 37, 39, 50, 57, 64, 73, 74, 83, 85, 87, 96, 98, 100, 101, 103, 105, 116, 123, 130, 141, 142, 153, 155, 157, 168, 170, 172, 174, 179, 184, 184};
    }

    private static char[] init__json_trans_keys_0() {
        return new char[]{'\r', ' ', '\"', ',', '/', ':', '[', ']', '{', '\t', '\n', '*', '/', '\"', '*', '/', '\r', ' ', '\"', ',', '/', ':', '}', '\t', '\n', '\r', ' ', '/', ':', '\t', '\n', '\r', ' ', '/', ':', '\t', '\n', '*', '/', '\r', ' ', '\"', ',', '/', ':', '[', ']', '{', '\t', '\n', '\t', '\n', '\r', ' ', ',', '/', '}', '\t', '\n', '\r', ' ', ',', '/', '}', '\r', ' ', '\"', ',', '/', ':', '}', '\t', '\n', '\"', '\r', ' ', '\"', ',', '/', ':', '}', '\t', '\n', '*', '/', '*', '/', '\r', ' ', '\"', ',', '/', ':', '}', '\t', '\n', '*', '/', '*', '/', '\"', '*', '/', '*', '/', '\r', ' ', '\"', ',', '/', ':', '[', ']', '{', '\t', '\n', '\t', '\n', '\r', ' ', ',', '/', ']', '\t', '\n', '\r', ' ', ',', '/', ']', '\r', ' ', '\"', ',', '/', ':', '[', ']', '{', '\t', '\n', '\"', '\r', ' ', '\"', ',', '/', ':', '[', ']', '{', '\t', '\n', '*', '/', '*', '/', '\r', ' ', '\"', ',', '/', ':', '[', ']', '{', '\t', '\n', '*', '/', '*', '/', '*', '/', '\r', ' ', '/', '\t', '\n', '\r', ' ', '/', '\t', '\n', 0};
    }

    private static byte[] init__json_single_lengths_0() {
        return new byte[]{0, 9, 2, 1, 2, 7, 4, 4, 2, 9, 7, 7, 7, 1, 7, 2, 2, 7, 2, 2, 1, 2, 2, 9, 7, 7, 9, 1, 9, 2, 2, 9, 2, 2, 2, 3, 3, 0, 0};
    }

    private static byte[] init__json_range_lengths_0() {
        return new byte[]{0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0};
    }

    private static short[] init__json_index_offsets_0() {
        return new short[]{0, 0, 11, 14, 16, 19, 28, 34, 40, 43, 54, 62, 70, 79, 81, 90, 93, 96, 105, 108, 111, 113, 116, 119, 130, 138, 146, 157, 159, 170, 173, 176, 187, 190, 193, 196, 201, 206, 207};
    }

    private static byte[] init__json_indicies_0() {
        return new byte[]{1, 1, 2, 3, 4, 3, 5, 3, 6, 1, 0, 7, 7, 3, 8, 3, 9, 9, 3, 11, 11, 12, 13, 14, 3, 15, 11, 10, 16, 16, 17, 18, 16, 3, 19, 19, 20, 21, 19, 3, 22, 22, 3, 21, 21, 24, 3, 25, 3, 26, 3, 27, 21, 23, 28, 29, 29, 28, 30, 31, 32, 3, 33, 34, 34, 33, 13, 35, 15, 3, 34, 34, 12, 36, 37, 3, 15, 34, 10, 16, 3, 36, 36, 12, 3, 38, 3, 3, 36, 10, 39, 39, 3, 40, 40, 3, 13, 13, 12, 3, 41, 3, 15, 13, 10, 42, 42, 3, 43, 43, 3, 28, 3, 44, 44, 3, 45, 45, 3, 47, 47, 48, 49, 50, 3, 51, 52, 53, 47, 46, 54, 55, 55, 54, 56, 57, 58, 3, 59, 60, 60, 59, 49, 61, 52, 3, 60, 60, 48, 62, 63, 3, 51, 52, 53, 60, 46, 54, 3, 62, 62, 48, 3, 64, 3, 51, 3, 53, 62, 46, 65, 65, 3, 66, 66, 3, 49, 49, 48, 3, 67, 3, 51, 52, 53, 49, 46, 68, 68, 3, 69, 69, 3, 70, 70, 3, 8, 8, 71, 8, 3, 72, 72, 73, 72, 3, 3, 3, 0};
    }

    private static byte[] init__json_trans_targs_0() {
        return new byte[]{35, 1, 3, 0, 4, 36, 36, 36, 36, 1, 6, 5, 13, 17, 22, 37, 7, 8, 9, 7, 8, 9, 7, 10, 20, 21, 11, 11, 11, 12, 17, 19, 37, 11, 12, 19, 14, 16, 15, 14, 12, 18, 17, 11, 9, 5, 24, 23, 27, 31, 34, 25, 38, 25, 25, 26, 31, 33, 38, 25, 26, 33, 28, 30, 29, 28, 26, 32, 31, 25, 23, 2, 36, 2};
    }

    private static byte[] init__json_trans_actions_0() {
        return new byte[]{13, 0, 15, 0, 0, 7, 3, 11, 1, 11, 17, 0, 20, 0, 0, 5, 1, 1, 1, 0, 0, 0, 11, 13, 15, 0, 7, 3, 1, 1, 1, 1, 23, 0, 0, 0, 0, 0, 0, 11, 11, 0, 11, 11, 11, 11, 13, 0, 15, 0, 0, 7, 9, 3, 1, 1, 1, 1, 26, 0, 0, 0, 0, 0, 0, 11, 11, 0, 11, 11, 11, 1, 0, 0};
    }

    private static byte[] init__json_eof_actions_0() {
        return new byte[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0};
    }

    private void addChild(String str, JsonValue jsonValue) {
        jsonValue.setName(str);
        JsonValue jsonValue2 = this.current;
        if (jsonValue2 == null) {
            this.current = jsonValue;
            this.root = jsonValue;
        } else if (jsonValue2.isArray() || this.current.isObject()) {
            JsonValue jsonValue3 = this.current;
            jsonValue.parent = jsonValue3;
            if (jsonValue3.size == 0) {
                this.current.child = jsonValue;
            } else {
                JsonValue pop = this.lastChild.pop();
                pop.next = jsonValue;
                jsonValue.prev = pop;
            }
            this.lastChild.add(jsonValue);
            this.current.size++;
        } else {
            this.root = this.current;
        }
    }

    /* access modifiers changed from: protected */
    public void startObject(String str) {
        JsonValue jsonValue = new JsonValue(JsonValue.ValueType.object);
        if (this.current != null) {
            addChild(str, jsonValue);
        }
        this.elements.add(jsonValue);
        this.current = jsonValue;
    }

    /* access modifiers changed from: protected */
    public void startArray(String str) {
        JsonValue jsonValue = new JsonValue(JsonValue.ValueType.array);
        if (this.current != null) {
            addChild(str, jsonValue);
        }
        this.elements.add(jsonValue);
        this.current = jsonValue;
    }

    /* access modifiers changed from: protected */
    public void pop() {
        this.root = this.elements.pop();
        if (this.current.size > 0) {
            this.lastChild.pop();
        }
        this.current = this.elements.size > 0 ? this.elements.peek() : null;
    }

    /* access modifiers changed from: protected */
    public void string(String str, String str2) {
        addChild(str, new JsonValue(str2));
    }

    /* access modifiers changed from: protected */
    public void number(String str, double d, String str2) {
        addChild(str, new JsonValue(d, str2));
    }

    /* access modifiers changed from: protected */
    public void number(String str, long j, String str2) {
        addChild(str, new JsonValue(j, str2));
    }

    /* access modifiers changed from: protected */
    public void bool(String str, boolean z) {
        addChild(str, new JsonValue(z));
    }

    private String unescape(String str) {
        int length = str.length();
        StringBuilder stringBuilder = new StringBuilder(length + 16);
        int i = 0;
        while (i < length) {
            int i2 = i + 1;
            char charAt = str.charAt(i);
            if (charAt != '\\') {
                stringBuilder.append(charAt);
            } else if (i2 == length) {
                break;
            } else {
                i = i2 + 1;
                char charAt2 = str.charAt(i2);
                if (charAt2 == 'u') {
                    i2 = i + 4;
                    stringBuilder.append(Character.toChars(Integer.parseInt(str.substring(i, i2), 16)));
                } else {
                    if (!(charAt2 == '\"' || charAt2 == '/' || charAt2 == '\\')) {
                        if (charAt2 == 'b') {
                            charAt2 = '\b';
                        } else if (charAt2 == 'f') {
                            charAt2 = '\f';
                        } else if (charAt2 == 'n') {
                            charAt2 = '\n';
                        } else if (charAt2 == 'r') {
                            charAt2 = '\r';
                        } else if (charAt2 == 't') {
                            charAt2 = '\t';
                        } else {
                            throw new SerializationException("Illegal escaped character: \\" + charAt2);
                        }
                    }
                    stringBuilder.append(charAt2);
                }
            }
            i = i2;
        }
        return stringBuilder.toString();
    }
}
