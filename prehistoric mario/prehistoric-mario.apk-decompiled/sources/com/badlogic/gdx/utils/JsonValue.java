package com.badlogic.gdx.utils;

import com.alles.platformer.BuildConfig;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.utils.JsonWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class JsonValue implements Iterable<JsonValue> {
    public JsonValue child;
    private double doubleValue;
    private long longValue;
    public String name;
    public JsonValue next;
    public JsonValue parent;
    public JsonValue prev;
    public int size;
    private String stringValue;
    private ValueType type;

    public static class PrettyPrintSettings {
        public JsonWriter.OutputType outputType;
        public int singleLineColumns;
        public boolean wrapNumericArrays;
    }

    public enum ValueType {
        object,
        array,
        stringValue,
        doubleValue,
        longValue,
        booleanValue,
        nullValue
    }

    public JsonValue(ValueType valueType) {
        this.type = valueType;
    }

    public JsonValue(String str) {
        set(str);
    }

    public JsonValue(double d) {
        set(d, (String) null);
    }

    public JsonValue(long j) {
        set(j, (String) null);
    }

    public JsonValue(double d, String str) {
        set(d, str);
    }

    public JsonValue(long j, String str) {
        set(j, str);
    }

    public JsonValue(boolean z) {
        set(z);
    }

    public JsonValue get(int i) {
        JsonValue jsonValue = this.child;
        while (jsonValue != null && i > 0) {
            i--;
            jsonValue = jsonValue.next;
        }
        return jsonValue;
    }

    public JsonValue get(String str) {
        JsonValue jsonValue = this.child;
        while (jsonValue != null) {
            String str2 = jsonValue.name;
            if (str2 != null && str2.equalsIgnoreCase(str)) {
                break;
            }
            jsonValue = jsonValue.next;
        }
        return jsonValue;
    }

    public boolean has(String str) {
        return get(str) != null;
    }

    public JsonValue require(int i) {
        JsonValue jsonValue = this.child;
        while (jsonValue != null && i > 0) {
            i--;
            jsonValue = jsonValue.next;
        }
        if (jsonValue != null) {
            return jsonValue;
        }
        throw new IllegalArgumentException("Child not found with index: " + i);
    }

    public JsonValue require(String str) {
        JsonValue jsonValue = this.child;
        while (jsonValue != null) {
            String str2 = jsonValue.name;
            if (str2 != null && str2.equalsIgnoreCase(str)) {
                break;
            }
            jsonValue = jsonValue.next;
        }
        if (jsonValue != null) {
            return jsonValue;
        }
        throw new IllegalArgumentException("Child not found with name: " + str);
    }

    public JsonValue remove(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue == null) {
            return null;
        }
        JsonValue jsonValue2 = jsonValue.prev;
        if (jsonValue2 == null) {
            this.child = jsonValue.next;
            JsonValue jsonValue3 = this.child;
            if (jsonValue3 != null) {
                jsonValue3.prev = null;
            }
        } else {
            jsonValue2.next = jsonValue.next;
            JsonValue jsonValue4 = jsonValue.next;
            if (jsonValue4 != null) {
                jsonValue4.prev = jsonValue2;
            }
        }
        this.size--;
        return jsonValue;
    }

    public JsonValue remove(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue == null) {
            return null;
        }
        JsonValue jsonValue2 = jsonValue.prev;
        if (jsonValue2 == null) {
            this.child = jsonValue.next;
            JsonValue jsonValue3 = this.child;
            if (jsonValue3 != null) {
                jsonValue3.prev = null;
            }
        } else {
            jsonValue2.next = jsonValue.next;
            JsonValue jsonValue4 = jsonValue.next;
            if (jsonValue4 != null) {
                jsonValue4.prev = jsonValue2;
            }
        }
        this.size--;
        return jsonValue;
    }

    public boolean notEmpty() {
        return this.size > 0;
    }

    public boolean isEmpty() {
        return this.size == 0;
    }

    @Deprecated
    public int size() {
        return this.size;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: com.badlogic.gdx.utils.JsonValue$1  reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType = new int[ValueType.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(12:0|1|2|3|4|5|6|7|8|9|10|12) */
        /* JADX WARNING: Code restructure failed: missing block: B:13:?, code lost:
            return;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        /* JADX WARNING: Missing exception handler attribute for start block: B:5:0x001f */
        /* JADX WARNING: Missing exception handler attribute for start block: B:7:0x002a */
        /* JADX WARNING: Missing exception handler attribute for start block: B:9:0x0035 */
        static {
            /*
                com.badlogic.gdx.utils.JsonValue$ValueType[] r0 = com.badlogic.gdx.utils.JsonValue.ValueType.values()
                int r0 = r0.length
                int[] r0 = new int[r0]
                com.badlogic.gdx.utils.JsonValue.AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType = r0
                int[] r0 = com.badlogic.gdx.utils.JsonValue.AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType     // Catch:{ NoSuchFieldError -> 0x0014 }
                com.badlogic.gdx.utils.JsonValue$ValueType r1 = com.badlogic.gdx.utils.JsonValue.ValueType.stringValue     // Catch:{ NoSuchFieldError -> 0x0014 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0014 }
                r2 = 1
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0014 }
            L_0x0014:
                int[] r0 = com.badlogic.gdx.utils.JsonValue.AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType     // Catch:{ NoSuchFieldError -> 0x001f }
                com.badlogic.gdx.utils.JsonValue$ValueType r1 = com.badlogic.gdx.utils.JsonValue.ValueType.doubleValue     // Catch:{ NoSuchFieldError -> 0x001f }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x001f }
                r2 = 2
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x001f }
            L_0x001f:
                int[] r0 = com.badlogic.gdx.utils.JsonValue.AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType     // Catch:{ NoSuchFieldError -> 0x002a }
                com.badlogic.gdx.utils.JsonValue$ValueType r1 = com.badlogic.gdx.utils.JsonValue.ValueType.longValue     // Catch:{ NoSuchFieldError -> 0x002a }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x002a }
                r2 = 3
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x002a }
            L_0x002a:
                int[] r0 = com.badlogic.gdx.utils.JsonValue.AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType     // Catch:{ NoSuchFieldError -> 0x0035 }
                com.badlogic.gdx.utils.JsonValue$ValueType r1 = com.badlogic.gdx.utils.JsonValue.ValueType.booleanValue     // Catch:{ NoSuchFieldError -> 0x0035 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0035 }
                r2 = 4
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0035 }
            L_0x0035:
                int[] r0 = com.badlogic.gdx.utils.JsonValue.AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType     // Catch:{ NoSuchFieldError -> 0x0040 }
                com.badlogic.gdx.utils.JsonValue$ValueType r1 = com.badlogic.gdx.utils.JsonValue.ValueType.nullValue     // Catch:{ NoSuchFieldError -> 0x0040 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0040 }
                r2 = 5
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0040 }
            L_0x0040:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.JsonValue.AnonymousClass1.<clinit>():void");
        }
    }

    public String asString() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        if (i == 1) {
            return this.stringValue;
        }
        if (i == 2) {
            String str = this.stringValue;
            return str != null ? str : Double.toString(this.doubleValue);
        } else if (i == 3) {
            String str2 = this.stringValue;
            return str2 != null ? str2 : Long.toString(this.longValue);
        } else if (i == 4) {
            return this.longValue != 0 ? "true" : "false";
        } else {
            if (i == 5) {
                return null;
            }
            throw new IllegalStateException("Value cannot be converted to string: " + this.type);
        }
    }

    public float asFloat() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        if (i == 1) {
            return Float.parseFloat(this.stringValue);
        }
        if (i == 2) {
            return (float) this.doubleValue;
        }
        if (i == 3) {
            return (float) this.longValue;
        }
        if (i == 4) {
            return this.longValue != 0 ? 1.0f : 0.0f;
        }
        throw new IllegalStateException("Value cannot be converted to float: " + this.type);
    }

    public double asDouble() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        if (i == 1) {
            return Double.parseDouble(this.stringValue);
        }
        if (i == 2) {
            return this.doubleValue;
        }
        if (i == 3) {
            return (double) this.longValue;
        }
        if (i == 4) {
            return this.longValue != 0 ? 1.0d : 0.0d;
        }
        throw new IllegalStateException("Value cannot be converted to double: " + this.type);
    }

    public long asLong() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        if (i == 1) {
            return Long.parseLong(this.stringValue);
        }
        if (i == 2) {
            return (long) this.doubleValue;
        }
        if (i == 3) {
            return this.longValue;
        }
        if (i == 4) {
            return this.longValue != 0 ? 1 : 0;
        }
        throw new IllegalStateException("Value cannot be converted to long: " + this.type);
    }

    public int asInt() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        if (i == 1) {
            return Integer.parseInt(this.stringValue);
        }
        if (i == 2) {
            return (int) this.doubleValue;
        }
        if (i == 3) {
            return (int) this.longValue;
        }
        if (i != 4) {
            throw new IllegalStateException("Value cannot be converted to int: " + this.type);
        } else if (this.longValue != 0) {
            return 1;
        } else {
            return 0;
        }
    }

    public boolean asBoolean() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        if (i == 1) {
            return this.stringValue.equalsIgnoreCase("true");
        }
        if (i != 2) {
            if (i != 3) {
                if (i != 4) {
                    throw new IllegalStateException("Value cannot be converted to boolean: " + this.type);
                } else if (this.longValue != 0) {
                    return true;
                } else {
                    return false;
                }
            } else if (this.longValue != 0) {
                return true;
            } else {
                return false;
            }
        } else if (this.doubleValue != 0.0d) {
            return true;
        } else {
            return false;
        }
    }

    public byte asByte() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        if (i == 1) {
            return Byte.parseByte(this.stringValue);
        }
        if (i == 2) {
            return (byte) ((int) this.doubleValue);
        }
        if (i == 3) {
            return (byte) ((int) this.longValue);
        }
        if (i != 4) {
            throw new IllegalStateException("Value cannot be converted to byte: " + this.type);
        } else if (this.longValue != 0) {
            return 1;
        } else {
            return 0;
        }
    }

    public short asShort() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        if (i == 1) {
            return Short.parseShort(this.stringValue);
        }
        if (i == 2) {
            return (short) ((int) this.doubleValue);
        }
        if (i == 3) {
            return (short) ((int) this.longValue);
        }
        if (i != 4) {
            throw new IllegalStateException("Value cannot be converted to short: " + this.type);
        } else if (this.longValue != 0) {
            return 1;
        } else {
            return 0;
        }
    }

    public char asChar() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        if (i != 1) {
            if (i == 2) {
                return (char) ((int) this.doubleValue);
            }
            if (i == 3) {
                return (char) ((int) this.longValue);
            }
            if (i != 4) {
                throw new IllegalStateException("Value cannot be converted to char: " + this.type);
            } else if (this.longValue != 0) {
                return 1;
            } else {
                return 0;
            }
        } else if (this.stringValue.length() == 0) {
            return 0;
        } else {
            return this.stringValue.charAt(0);
        }
    }

    public String[] asStringArray() {
        String str;
        if (this.type == ValueType.array) {
            String[] strArr = new String[this.size];
            int i = 0;
            JsonValue jsonValue = this.child;
            while (jsonValue != null) {
                int i2 = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
                if (i2 == 1) {
                    str = jsonValue.stringValue;
                } else if (i2 == 2) {
                    str = this.stringValue;
                    if (str == null) {
                        str = Double.toString(jsonValue.doubleValue);
                    }
                } else if (i2 == 3) {
                    str = this.stringValue;
                    if (str == null) {
                        str = Long.toString(jsonValue.longValue);
                    }
                } else if (i2 == 4) {
                    str = jsonValue.longValue != 0 ? "true" : "false";
                } else if (i2 == 5) {
                    str = null;
                } else {
                    throw new IllegalStateException("Value cannot be converted to string: " + jsonValue.type);
                }
                strArr[i] = str;
                jsonValue = jsonValue.next;
                i++;
            }
            return strArr;
        }
        throw new IllegalStateException("Value is not an array: " + this.type);
    }

    public float[] asFloatArray() {
        float f;
        if (this.type == ValueType.array) {
            float[] fArr = new float[this.size];
            int i = 0;
            JsonValue jsonValue = this.child;
            while (jsonValue != null) {
                int i2 = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
                if (i2 == 1) {
                    f = Float.parseFloat(jsonValue.stringValue);
                } else if (i2 == 2) {
                    f = (float) jsonValue.doubleValue;
                } else if (i2 == 3) {
                    f = (float) jsonValue.longValue;
                } else if (i2 == 4) {
                    f = jsonValue.longValue != 0 ? 1.0f : 0.0f;
                } else {
                    throw new IllegalStateException("Value cannot be converted to float: " + jsonValue.type);
                }
                fArr[i] = f;
                jsonValue = jsonValue.next;
                i++;
            }
            return fArr;
        }
        throw new IllegalStateException("Value is not an array: " + this.type);
    }

    public double[] asDoubleArray() {
        double d;
        if (this.type == ValueType.array) {
            double[] dArr = new double[this.size];
            int i = 0;
            JsonValue jsonValue = this.child;
            while (jsonValue != null) {
                int i2 = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
                if (i2 == 1) {
                    d = Double.parseDouble(jsonValue.stringValue);
                } else if (i2 == 2) {
                    d = jsonValue.doubleValue;
                } else if (i2 == 3) {
                    d = (double) jsonValue.longValue;
                } else if (i2 == 4) {
                    d = jsonValue.longValue != 0 ? 1.0d : 0.0d;
                } else {
                    throw new IllegalStateException("Value cannot be converted to double: " + jsonValue.type);
                }
                dArr[i] = d;
                jsonValue = jsonValue.next;
                i++;
            }
            return dArr;
        }
        throw new IllegalStateException("Value is not an array: " + this.type);
    }

    public long[] asLongArray() {
        long j;
        if (this.type == ValueType.array) {
            long[] jArr = new long[this.size];
            int i = 0;
            JsonValue jsonValue = this.child;
            while (jsonValue != null) {
                int i2 = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
                if (i2 == 1) {
                    j = Long.parseLong(jsonValue.stringValue);
                } else if (i2 == 2) {
                    j = (long) jsonValue.doubleValue;
                } else if (i2 == 3) {
                    j = jsonValue.longValue;
                } else if (i2 == 4) {
                    j = 0;
                    if (jsonValue.longValue != 0) {
                        j = 1;
                    }
                } else {
                    throw new IllegalStateException("Value cannot be converted to long: " + jsonValue.type);
                }
                jArr[i] = j;
                jsonValue = jsonValue.next;
                i++;
            }
            return jArr;
        }
        throw new IllegalStateException("Value is not an array: " + this.type);
    }

    public int[] asIntArray() {
        int i;
        if (this.type == ValueType.array) {
            int[] iArr = new int[this.size];
            JsonValue jsonValue = this.child;
            int i2 = 0;
            while (jsonValue != null) {
                int i3 = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
                if (i3 == 1) {
                    i = Integer.parseInt(jsonValue.stringValue);
                } else if (i3 == 2) {
                    i = (int) jsonValue.doubleValue;
                } else if (i3 == 3) {
                    i = (int) jsonValue.longValue;
                } else if (i3 == 4) {
                    i = jsonValue.longValue != 0 ? 1 : 0;
                } else {
                    throw new IllegalStateException("Value cannot be converted to int: " + jsonValue.type);
                }
                iArr[i2] = i;
                jsonValue = jsonValue.next;
                i2++;
            }
            return iArr;
        }
        throw new IllegalStateException("Value is not an array: " + this.type);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x002c, code lost:
        if (r1.longValue != 0) goto L_0x002e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0030, code lost:
        r4 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x004f, code lost:
        if (r1.longValue == 0) goto L_0x002e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0058, code lost:
        if (r1.doubleValue == 0.0d) goto L_0x002e;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean[] asBooleanArray() {
        /*
        // Method dump skipped, instructions count: 131
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.JsonValue.asBooleanArray():boolean[]");
    }

    public byte[] asByteArray() {
        byte b;
        int i;
        if (this.type == ValueType.array) {
            byte[] bArr = new byte[this.size];
            JsonValue jsonValue = this.child;
            int i2 = 0;
            while (jsonValue != null) {
                int i3 = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
                if (i3 != 1) {
                    if (i3 == 2) {
                        i = (int) jsonValue.doubleValue;
                    } else if (i3 == 3) {
                        i = (int) jsonValue.longValue;
                    } else if (i3 == 4) {
                        b = jsonValue.longValue != 0 ? (byte) 1 : 0;
                    } else {
                        throw new IllegalStateException("Value cannot be converted to byte: " + jsonValue.type);
                    }
                    b = (byte) i;
                } else {
                    b = Byte.parseByte(jsonValue.stringValue);
                }
                bArr[i2] = b;
                jsonValue = jsonValue.next;
                i2++;
            }
            return bArr;
        }
        throw new IllegalStateException("Value is not an array: " + this.type);
    }

    public short[] asShortArray() {
        short s;
        int i;
        if (this.type == ValueType.array) {
            short[] sArr = new short[this.size];
            JsonValue jsonValue = this.child;
            int i2 = 0;
            while (jsonValue != null) {
                int i3 = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
                if (i3 != 1) {
                    if (i3 == 2) {
                        i = (int) jsonValue.doubleValue;
                    } else if (i3 == 3) {
                        i = (int) jsonValue.longValue;
                    } else if (i3 == 4) {
                        s = jsonValue.longValue != 0 ? (short) 1 : 0;
                    } else {
                        throw new IllegalStateException("Value cannot be converted to short: " + jsonValue.type);
                    }
                    s = (short) i;
                } else {
                    s = Short.parseShort(jsonValue.stringValue);
                }
                sArr[i2] = s;
                jsonValue = jsonValue.next;
                i2++;
            }
            return sArr;
        }
        throw new IllegalStateException("Value is not an array: " + this.type);
    }

    public char[] asCharArray() {
        char c;
        int i;
        if (this.type == ValueType.array) {
            char[] cArr = new char[this.size];
            JsonValue jsonValue = this.child;
            int i2 = 0;
            while (jsonValue != null) {
                int i3 = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[jsonValue.type.ordinal()];
                if (i3 != 1) {
                    if (i3 == 2) {
                        i = (int) jsonValue.doubleValue;
                    } else if (i3 == 3) {
                        i = (int) jsonValue.longValue;
                    } else if (i3 != 4) {
                        throw new IllegalStateException("Value cannot be converted to char: " + jsonValue.type);
                    } else if (jsonValue.longValue != 0) {
                        c = 1;
                        cArr[i2] = c;
                        jsonValue = jsonValue.next;
                        i2++;
                    }
                    c = (char) i;
                    cArr[i2] = c;
                    jsonValue = jsonValue.next;
                    i2++;
                } else if (jsonValue.stringValue.length() != 0) {
                    c = jsonValue.stringValue.charAt(0);
                    cArr[i2] = c;
                    jsonValue = jsonValue.next;
                    i2++;
                }
                c = 0;
                cArr[i2] = c;
                jsonValue = jsonValue.next;
                i2++;
            }
            return cArr;
        }
        throw new IllegalStateException("Value is not an array: " + this.type);
    }

    public boolean hasChild(String str) {
        return getChild(str) != null;
    }

    public JsonValue getChild(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue == null) {
            return null;
        }
        return jsonValue.child;
    }

    public String getString(String str, String str2) {
        JsonValue jsonValue = get(str);
        return (jsonValue == null || !jsonValue.isValue() || jsonValue.isNull()) ? str2 : jsonValue.asString();
    }

    public float getFloat(String str, float f) {
        JsonValue jsonValue = get(str);
        return (jsonValue == null || !jsonValue.isValue() || jsonValue.isNull()) ? f : jsonValue.asFloat();
    }

    public double getDouble(String str, double d) {
        JsonValue jsonValue = get(str);
        return (jsonValue == null || !jsonValue.isValue() || jsonValue.isNull()) ? d : jsonValue.asDouble();
    }

    public long getLong(String str, long j) {
        JsonValue jsonValue = get(str);
        return (jsonValue == null || !jsonValue.isValue() || jsonValue.isNull()) ? j : jsonValue.asLong();
    }

    public int getInt(String str, int i) {
        JsonValue jsonValue = get(str);
        return (jsonValue == null || !jsonValue.isValue() || jsonValue.isNull()) ? i : jsonValue.asInt();
    }

    public boolean getBoolean(String str, boolean z) {
        JsonValue jsonValue = get(str);
        return (jsonValue == null || !jsonValue.isValue() || jsonValue.isNull()) ? z : jsonValue.asBoolean();
    }

    public byte getByte(String str, byte b) {
        JsonValue jsonValue = get(str);
        return (jsonValue == null || !jsonValue.isValue() || jsonValue.isNull()) ? b : jsonValue.asByte();
    }

    public short getShort(String str, short s) {
        JsonValue jsonValue = get(str);
        return (jsonValue == null || !jsonValue.isValue() || jsonValue.isNull()) ? s : jsonValue.asShort();
    }

    public char getChar(String str, char c) {
        JsonValue jsonValue = get(str);
        return (jsonValue == null || !jsonValue.isValue() || jsonValue.isNull()) ? c : jsonValue.asChar();
    }

    public String getString(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue != null) {
            return jsonValue.asString();
        }
        throw new IllegalArgumentException("Named value not found: " + str);
    }

    public float getFloat(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue != null) {
            return jsonValue.asFloat();
        }
        throw new IllegalArgumentException("Named value not found: " + str);
    }

    public double getDouble(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue != null) {
            return jsonValue.asDouble();
        }
        throw new IllegalArgumentException("Named value not found: " + str);
    }

    public long getLong(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue != null) {
            return jsonValue.asLong();
        }
        throw new IllegalArgumentException("Named value not found: " + str);
    }

    public int getInt(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue != null) {
            return jsonValue.asInt();
        }
        throw new IllegalArgumentException("Named value not found: " + str);
    }

    public boolean getBoolean(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue != null) {
            return jsonValue.asBoolean();
        }
        throw new IllegalArgumentException("Named value not found: " + str);
    }

    public byte getByte(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue != null) {
            return jsonValue.asByte();
        }
        throw new IllegalArgumentException("Named value not found: " + str);
    }

    public short getShort(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue != null) {
            return jsonValue.asShort();
        }
        throw new IllegalArgumentException("Named value not found: " + str);
    }

    public char getChar(String str) {
        JsonValue jsonValue = get(str);
        if (jsonValue != null) {
            return jsonValue.asChar();
        }
        throw new IllegalArgumentException("Named value not found: " + str);
    }

    public String getString(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue != null) {
            return jsonValue.asString();
        }
        throw new IllegalArgumentException("Indexed value not found: " + this.name);
    }

    public float getFloat(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue != null) {
            return jsonValue.asFloat();
        }
        throw new IllegalArgumentException("Indexed value not found: " + this.name);
    }

    public double getDouble(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue != null) {
            return jsonValue.asDouble();
        }
        throw new IllegalArgumentException("Indexed value not found: " + this.name);
    }

    public long getLong(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue != null) {
            return jsonValue.asLong();
        }
        throw new IllegalArgumentException("Indexed value not found: " + this.name);
    }

    public int getInt(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue != null) {
            return jsonValue.asInt();
        }
        throw new IllegalArgumentException("Indexed value not found: " + this.name);
    }

    public boolean getBoolean(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue != null) {
            return jsonValue.asBoolean();
        }
        throw new IllegalArgumentException("Indexed value not found: " + this.name);
    }

    public byte getByte(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue != null) {
            return jsonValue.asByte();
        }
        throw new IllegalArgumentException("Indexed value not found: " + this.name);
    }

    public short getShort(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue != null) {
            return jsonValue.asShort();
        }
        throw new IllegalArgumentException("Indexed value not found: " + this.name);
    }

    public char getChar(int i) {
        JsonValue jsonValue = get(i);
        if (jsonValue != null) {
            return jsonValue.asChar();
        }
        throw new IllegalArgumentException("Indexed value not found: " + this.name);
    }

    public ValueType type() {
        return this.type;
    }

    public void setType(ValueType valueType) {
        if (valueType != null) {
            this.type = valueType;
            return;
        }
        throw new IllegalArgumentException("type cannot be null.");
    }

    public boolean isArray() {
        return this.type == ValueType.array;
    }

    public boolean isObject() {
        return this.type == ValueType.object;
    }

    public boolean isString() {
        return this.type == ValueType.stringValue;
    }

    public boolean isNumber() {
        return this.type == ValueType.doubleValue || this.type == ValueType.longValue;
    }

    public boolean isDouble() {
        return this.type == ValueType.doubleValue;
    }

    public boolean isLong() {
        return this.type == ValueType.longValue;
    }

    public boolean isBoolean() {
        return this.type == ValueType.booleanValue;
    }

    public boolean isNull() {
        return this.type == ValueType.nullValue;
    }

    public boolean isValue() {
        int i = AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonValue$ValueType[this.type.ordinal()];
        return i == 1 || i == 2 || i == 3 || i == 4 || i == 5;
    }

    public String name() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public JsonValue parent() {
        return this.parent;
    }

    public JsonValue child() {
        return this.child;
    }

    public void addChild(String str, JsonValue jsonValue) {
        if (str != null) {
            jsonValue.name = str;
            addChild(jsonValue);
            return;
        }
        throw new IllegalArgumentException("name cannot be null.");
    }

    public void addChild(JsonValue jsonValue) {
        jsonValue.parent = this;
        JsonValue jsonValue2 = this.child;
        if (jsonValue2 == null) {
            this.child = jsonValue;
            return;
        }
        while (true) {
            JsonValue jsonValue3 = jsonValue2.next;
            if (jsonValue3 == null) {
                jsonValue2.next = jsonValue;
                return;
            }
            jsonValue2 = jsonValue3;
        }
    }

    public JsonValue next() {
        return this.next;
    }

    public void setNext(JsonValue jsonValue) {
        this.next = jsonValue;
    }

    public JsonValue prev() {
        return this.prev;
    }

    public void setPrev(JsonValue jsonValue) {
        this.prev = jsonValue;
    }

    public void set(String str) {
        this.stringValue = str;
        this.type = str == null ? ValueType.nullValue : ValueType.stringValue;
    }

    public void set(double d, String str) {
        this.doubleValue = d;
        this.longValue = (long) d;
        this.stringValue = str;
        this.type = ValueType.doubleValue;
    }

    public void set(long j, String str) {
        this.longValue = j;
        this.doubleValue = (double) j;
        this.stringValue = str;
        this.type = ValueType.longValue;
    }

    public void set(boolean z) {
        this.longValue = z ? 1 : 0;
        this.type = ValueType.booleanValue;
    }

    public String toJson(JsonWriter.OutputType outputType) {
        if (isValue()) {
            return asString();
        }
        StringBuilder stringBuilder = new StringBuilder((int) GL20.GL_NEVER);
        json(this, stringBuilder, outputType);
        return stringBuilder.toString();
    }

    private void json(JsonValue jsonValue, StringBuilder stringBuilder, JsonWriter.OutputType outputType) {
        if (jsonValue.isObject()) {
            if (jsonValue.child == null) {
                stringBuilder.append("{}");
                return;
            }
            stringBuilder.length();
            stringBuilder.append('{');
            for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
                stringBuilder.append(outputType.quoteName(jsonValue2.name));
                stringBuilder.append(':');
                json(jsonValue2, stringBuilder, outputType);
                if (jsonValue2.next != null) {
                    stringBuilder.append(',');
                }
            }
            stringBuilder.append('}');
        } else if (jsonValue.isArray()) {
            if (jsonValue.child == null) {
                stringBuilder.append("[]");
                return;
            }
            stringBuilder.length();
            stringBuilder.append('[');
            for (JsonValue jsonValue3 = jsonValue.child; jsonValue3 != null; jsonValue3 = jsonValue3.next) {
                json(jsonValue3, stringBuilder, outputType);
                if (jsonValue3.next != null) {
                    stringBuilder.append(',');
                }
            }
            stringBuilder.append(']');
        } else if (jsonValue.isString()) {
            stringBuilder.append(outputType.quoteValue(jsonValue.asString()));
        } else if (jsonValue.isDouble()) {
            double asDouble = jsonValue.asDouble();
            double asLong = (double) jsonValue.asLong();
            if (asDouble == asLong) {
                asDouble = asLong;
            }
            stringBuilder.append(asDouble);
        } else if (jsonValue.isLong()) {
            stringBuilder.append(jsonValue.asLong());
        } else if (jsonValue.isBoolean()) {
            stringBuilder.append(jsonValue.asBoolean());
        } else if (jsonValue.isNull()) {
            stringBuilder.append("null");
        } else {
            throw new SerializationException("Unknown object type: " + jsonValue);
        }
    }

    public String toString() {
        String str;
        if (!isValue()) {
            StringBuilder sb = new StringBuilder();
            if (this.name == null) {
                str = BuildConfig.FLAVOR;
            } else {
                str = this.name + ": ";
            }
            sb.append(str);
            sb.append(prettyPrint(JsonWriter.OutputType.minimal, 0));
            return sb.toString();
        } else if (this.name == null) {
            return asString();
        } else {
            return this.name + ": " + asString();
        }
    }

    public String prettyPrint(JsonWriter.OutputType outputType, int i) {
        PrettyPrintSettings prettyPrintSettings = new PrettyPrintSettings();
        prettyPrintSettings.outputType = outputType;
        prettyPrintSettings.singleLineColumns = i;
        return prettyPrint(prettyPrintSettings);
    }

    public String prettyPrint(PrettyPrintSettings prettyPrintSettings) {
        StringBuilder stringBuilder = new StringBuilder((int) GL20.GL_NEVER);
        prettyPrint(this, stringBuilder, 0, prettyPrintSettings);
        return stringBuilder.toString();
    }

    private void prettyPrint(JsonValue jsonValue, StringBuilder stringBuilder, int i, PrettyPrintSettings prettyPrintSettings) {
        JsonWriter.OutputType outputType = prettyPrintSettings.outputType;
        if (jsonValue.isObject()) {
            if (jsonValue.child == null) {
                stringBuilder.append("{}");
                return;
            }
            boolean z = !isFlat(jsonValue);
            int length = stringBuilder.length();
            loop0:
            while (true) {
                stringBuilder.append(z ? "{\n" : "{ ");
                for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
                    if (z) {
                        indent(i, stringBuilder);
                    }
                    stringBuilder.append(outputType.quoteName(jsonValue2.name));
                    stringBuilder.append(": ");
                    prettyPrint(jsonValue2, stringBuilder, i + 1, prettyPrintSettings);
                    if ((!z || outputType != JsonWriter.OutputType.minimal) && jsonValue2.next != null) {
                        stringBuilder.append(',');
                    }
                    stringBuilder.append(z ? '\n' : ' ');
                    if (!z && stringBuilder.length() - length > prettyPrintSettings.singleLineColumns) {
                        stringBuilder.setLength(length);
                        z = true;
                    }
                }
                break loop0;
            }
            if (z) {
                indent(i - 1, stringBuilder);
            }
            stringBuilder.append('}');
        } else if (jsonValue.isArray()) {
            if (jsonValue.child == null) {
                stringBuilder.append("[]");
                return;
            }
            boolean z2 = !isFlat(jsonValue);
            boolean z3 = prettyPrintSettings.wrapNumericArrays || !isNumeric(jsonValue);
            int length2 = stringBuilder.length();
            loop2:
            while (true) {
                stringBuilder.append(z2 ? "[\n" : "[ ");
                for (JsonValue jsonValue3 = jsonValue.child; jsonValue3 != null; jsonValue3 = jsonValue3.next) {
                    if (z2) {
                        indent(i, stringBuilder);
                    }
                    prettyPrint(jsonValue3, stringBuilder, i + 1, prettyPrintSettings);
                    if ((!z2 || outputType != JsonWriter.OutputType.minimal) && jsonValue3.next != null) {
                        stringBuilder.append(',');
                    }
                    stringBuilder.append(z2 ? '\n' : ' ');
                    if (z3 && !z2 && stringBuilder.length() - length2 > prettyPrintSettings.singleLineColumns) {
                        stringBuilder.setLength(length2);
                        z2 = true;
                    }
                }
                break loop2;
            }
            if (z2) {
                indent(i - 1, stringBuilder);
            }
            stringBuilder.append(']');
        } else if (jsonValue.isString()) {
            stringBuilder.append(outputType.quoteValue(jsonValue.asString()));
        } else if (jsonValue.isDouble()) {
            double asDouble = jsonValue.asDouble();
            double asLong = (double) jsonValue.asLong();
            if (asDouble == asLong) {
                asDouble = asLong;
            }
            stringBuilder.append(asDouble);
        } else if (jsonValue.isLong()) {
            stringBuilder.append(jsonValue.asLong());
        } else if (jsonValue.isBoolean()) {
            stringBuilder.append(jsonValue.asBoolean());
        } else if (jsonValue.isNull()) {
            stringBuilder.append("null");
        } else {
            throw new SerializationException("Unknown object type: " + jsonValue);
        }
    }

    public void prettyPrint(JsonWriter.OutputType outputType, Writer writer) throws IOException {
        PrettyPrintSettings prettyPrintSettings = new PrettyPrintSettings();
        prettyPrintSettings.outputType = outputType;
        prettyPrint(this, writer, 0, prettyPrintSettings);
    }

    private void prettyPrint(JsonValue jsonValue, Writer writer, int i, PrettyPrintSettings prettyPrintSettings) throws IOException {
        JsonWriter.OutputType outputType = prettyPrintSettings.outputType;
        if (jsonValue.isObject()) {
            if (jsonValue.child == null) {
                writer.append("{}");
                return;
            }
            boolean z = !isFlat(jsonValue) || jsonValue.size > 6;
            writer.append((CharSequence) (z ? "{\n" : "{ "));
            for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
                if (z) {
                    indent(i, writer);
                }
                writer.append((CharSequence) outputType.quoteName(jsonValue2.name));
                writer.append(": ");
                prettyPrint(jsonValue2, writer, i + 1, prettyPrintSettings);
                if ((!z || outputType != JsonWriter.OutputType.minimal) && jsonValue2.next != null) {
                    writer.append(',');
                }
                writer.append(z ? '\n' : ' ');
            }
            if (z) {
                indent(i - 1, writer);
            }
            writer.append('}');
        } else if (jsonValue.isArray()) {
            if (jsonValue.child == null) {
                writer.append("[]");
                return;
            }
            boolean z2 = !isFlat(jsonValue);
            writer.append((CharSequence) (z2 ? "[\n" : "[ "));
            for (JsonValue jsonValue3 = jsonValue.child; jsonValue3 != null; jsonValue3 = jsonValue3.next) {
                if (z2) {
                    indent(i, writer);
                }
                prettyPrint(jsonValue3, writer, i + 1, prettyPrintSettings);
                if ((!z2 || outputType != JsonWriter.OutputType.minimal) && jsonValue3.next != null) {
                    writer.append(',');
                }
                writer.append(z2 ? '\n' : ' ');
            }
            if (z2) {
                indent(i - 1, writer);
            }
            writer.append(']');
        } else if (jsonValue.isString()) {
            writer.append((CharSequence) outputType.quoteValue(jsonValue.asString()));
        } else if (jsonValue.isDouble()) {
            double asDouble = jsonValue.asDouble();
            double asLong = (double) jsonValue.asLong();
            if (asDouble == asLong) {
                asDouble = asLong;
            }
            writer.append((CharSequence) Double.toString(asDouble));
        } else if (jsonValue.isLong()) {
            writer.append((CharSequence) Long.toString(jsonValue.asLong()));
        } else if (jsonValue.isBoolean()) {
            writer.append((CharSequence) Boolean.toString(jsonValue.asBoolean()));
        } else if (jsonValue.isNull()) {
            writer.append("null");
        } else {
            throw new SerializationException("Unknown object type: " + jsonValue);
        }
    }

    private static boolean isFlat(JsonValue jsonValue) {
        for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
            if (jsonValue2.isObject() || jsonValue2.isArray()) {
                return false;
            }
        }
        return true;
    }

    private static boolean isNumeric(JsonValue jsonValue) {
        for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
            if (!jsonValue2.isNumber()) {
                return false;
            }
        }
        return true;
    }

    private static void indent(int i, StringBuilder stringBuilder) {
        for (int i2 = 0; i2 < i; i2++) {
            stringBuilder.append('\t');
        }
    }

    private static void indent(int i, Writer writer) throws IOException {
        for (int i2 = 0; i2 < i; i2++) {
            writer.append('\t');
        }
    }

    /* Return type fixed from 'com.badlogic.gdx.utils.JsonValue$JsonIterator' to match base method */
    @Override // java.lang.Iterable
    public Iterator<JsonValue> iterator() {
        return new JsonIterator();
    }

    public class JsonIterator implements Iterator<JsonValue>, Iterable<JsonValue> {
        JsonValue current;
        JsonValue entry = JsonValue.this.child;

        @Override // java.lang.Iterable
        public Iterator<JsonValue> iterator() {
            return this;
        }

        public JsonIterator() {
        }

        public boolean hasNext() {
            return this.entry != null;
        }

        @Override // java.util.Iterator
        public JsonValue next() {
            this.current = this.entry;
            JsonValue jsonValue = this.current;
            if (jsonValue != null) {
                this.entry = jsonValue.next;
                return this.current;
            }
            throw new NoSuchElementException();
        }

        public void remove() {
            if (this.current.prev == null) {
                JsonValue.this.child = this.current.next;
                if (JsonValue.this.child != null) {
                    JsonValue.this.child.prev = null;
                }
            } else {
                this.current.prev.next = this.current.next;
                if (this.current.next != null) {
                    this.current.next.prev = this.current.prev;
                }
            }
            JsonValue jsonValue = JsonValue.this;
            jsonValue.size--;
        }
    }

    public String trace() {
        JsonValue jsonValue = this.parent;
        String str = "[]";
        if (jsonValue != null) {
            if (jsonValue.type == ValueType.array) {
                int i = 0;
                JsonValue jsonValue2 = this.parent.child;
                while (true) {
                    if (jsonValue2 == null) {
                        break;
                    } else if (jsonValue2 == this) {
                        str = "[" + i + "]";
                        break;
                    } else {
                        jsonValue2 = jsonValue2.next;
                        i++;
                    }
                }
            } else if (this.name.indexOf(46) != -1) {
                str = ".\"" + this.name.replace("\"", "\\\"") + "\"";
            } else {
                str = '.' + this.name;
            }
            return this.parent.trace() + str;
        } else if (this.type == ValueType.array) {
            return str;
        } else {
            return this.type == ValueType.object ? "{}" : BuildConfig.FLAVOR;
        }
    }
}
