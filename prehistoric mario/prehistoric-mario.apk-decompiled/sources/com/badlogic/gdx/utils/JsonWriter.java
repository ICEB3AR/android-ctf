package com.badlogic.gdx.utils;

import java.io.IOException;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.regex.Pattern;

public class JsonWriter extends Writer {
    private JsonObject current;
    private boolean named;
    private OutputType outputType = OutputType.json;
    private boolean quoteLongValues = false;
    private final Array<JsonObject> stack = new Array<>();
    final Writer writer;

    public JsonWriter(Writer writer2) {
        this.writer = writer2;
    }

    public Writer getWriter() {
        return this.writer;
    }

    public void setOutputType(OutputType outputType2) {
        this.outputType = outputType2;
    }

    public void setQuoteLongValues(boolean z) {
        this.quoteLongValues = z;
    }

    public JsonWriter name(String str) throws IOException {
        JsonObject jsonObject = this.current;
        if (jsonObject == null || jsonObject.array) {
            throw new IllegalStateException("Current item must be an object.");
        }
        if (!this.current.needsComma) {
            this.current.needsComma = true;
        } else {
            this.writer.write(44);
        }
        this.writer.write(this.outputType.quoteName(str));
        this.writer.write(58);
        this.named = true;
        return this;
    }

    public JsonWriter object() throws IOException {
        requireCommaOrName();
        Array<JsonObject> array = this.stack;
        JsonObject jsonObject = new JsonObject(false);
        this.current = jsonObject;
        array.add(jsonObject);
        return this;
    }

    public JsonWriter array() throws IOException {
        requireCommaOrName();
        Array<JsonObject> array = this.stack;
        JsonObject jsonObject = new JsonObject(true);
        this.current = jsonObject;
        array.add(jsonObject);
        return this;
    }

    public JsonWriter value(Object obj) throws IOException {
        if (this.quoteLongValues && ((obj instanceof Long) || (obj instanceof Double) || (obj instanceof BigDecimal) || (obj instanceof BigInteger))) {
            obj = obj.toString();
        } else if (obj instanceof Number) {
            Number number = (Number) obj;
            long longValue = number.longValue();
            if (number.doubleValue() == ((double) longValue)) {
                obj = Long.valueOf(longValue);
            }
        }
        requireCommaOrName();
        this.writer.write(this.outputType.quoteValue(obj));
        return this;
    }

    public JsonWriter json(String str) throws IOException {
        requireCommaOrName();
        this.writer.write(str);
        return this;
    }

    private void requireCommaOrName() throws IOException {
        JsonObject jsonObject = this.current;
        if (jsonObject != null) {
            if (jsonObject.array) {
                if (!this.current.needsComma) {
                    this.current.needsComma = true;
                } else {
                    this.writer.write(44);
                }
            } else if (this.named) {
                this.named = false;
            } else {
                throw new IllegalStateException("Name must be set.");
            }
        }
    }

    public JsonWriter object(String str) throws IOException {
        return name(str).object();
    }

    public JsonWriter array(String str) throws IOException {
        return name(str).array();
    }

    public JsonWriter set(String str, Object obj) throws IOException {
        return name(str).value(obj);
    }

    public JsonWriter json(String str, String str2) throws IOException {
        return name(str).json(str2);
    }

    public JsonWriter pop() throws IOException {
        if (!this.named) {
            this.stack.pop().close();
            this.current = this.stack.size == 0 ? null : this.stack.peek();
            return this;
        }
        throw new IllegalStateException("Expected an object, array, or value since a name was set.");
    }

    @Override // java.io.Writer
    public void write(char[] cArr, int i, int i2) throws IOException {
        this.writer.write(cArr, i, i2);
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() throws IOException {
        this.writer.flush();
    }

    @Override // java.io.Closeable, java.io.Writer, java.lang.AutoCloseable
    public void close() throws IOException {
        while (this.stack.size > 0) {
            pop();
        }
        this.writer.close();
    }

    /* access modifiers changed from: private */
    public class JsonObject {
        final boolean array;
        boolean needsComma;

        JsonObject(boolean z) throws IOException {
            this.array = z;
            JsonWriter.this.writer.write(z ? 91 : 123);
        }

        /* access modifiers changed from: package-private */
        public void close() throws IOException {
            JsonWriter.this.writer.write(this.array ? 93 : 125);
        }
    }

    public enum OutputType {
        json,
        javascript,
        minimal;
        
        private static Pattern javascriptPattern = Pattern.compile("^[a-zA-Z_$][a-zA-Z_$0-9]*$");
        private static Pattern minimalNamePattern = Pattern.compile("^[^\":,}/ ][^:]*$");
        private static Pattern minimalValuePattern = Pattern.compile("^[^\":,{\\[\\]/ ][^}\\],]*$");

        public String quoteValue(Object obj) {
            int length;
            if (obj == null) {
                return "null";
            }
            String obj2 = obj.toString();
            if ((obj instanceof Number) || (obj instanceof Boolean)) {
                return obj2;
            }
            StringBuilder stringBuilder = new StringBuilder(obj2);
            stringBuilder.replace('\\', "\\\\").replace('\r', "\\r").replace('\n', "\\n").replace('\t', "\\t");
            if (this == minimal && !obj2.equals("true") && !obj2.equals("false") && !obj2.equals("null") && !obj2.contains("//") && !obj2.contains("/*") && (length = stringBuilder.length()) > 0 && stringBuilder.charAt(length - 1) != ' ' && minimalValuePattern.matcher(stringBuilder).matches()) {
                return stringBuilder.toString();
            }
            return '\"' + stringBuilder.replace('\"', "\\\"").toString() + '\"';
        }

        /* JADX WARNING: Code restructure failed: missing block: B:3:0x0030, code lost:
            if (r1 != 2) goto L_0x0065;
         */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public java.lang.String quoteName(java.lang.String r5) {
            /*
            // Method dump skipped, instructions count: 132
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.JsonWriter.OutputType.quoteName(java.lang.String):java.lang.String");
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: com.badlogic.gdx.utils.JsonWriter$1  reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$badlogic$gdx$utils$JsonWriter$OutputType = new int[OutputType.values().length];

        /* JADX WARNING: Can't wrap try/catch for region: R(6:0|1|2|3|4|6) */
        /* JADX WARNING: Code restructure failed: missing block: B:7:?, code lost:
            return;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Missing exception handler attribute for start block: B:3:0x0014 */
        static {
            /*
                com.badlogic.gdx.utils.JsonWriter$OutputType[] r0 = com.badlogic.gdx.utils.JsonWriter.OutputType.values()
                int r0 = r0.length
                int[] r0 = new int[r0]
                com.badlogic.gdx.utils.JsonWriter.AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonWriter$OutputType = r0
                int[] r0 = com.badlogic.gdx.utils.JsonWriter.AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonWriter$OutputType     // Catch:{ NoSuchFieldError -> 0x0014 }
                com.badlogic.gdx.utils.JsonWriter$OutputType r1 = com.badlogic.gdx.utils.JsonWriter.OutputType.minimal     // Catch:{ NoSuchFieldError -> 0x0014 }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x0014 }
                r2 = 1
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x0014 }
            L_0x0014:
                int[] r0 = com.badlogic.gdx.utils.JsonWriter.AnonymousClass1.$SwitchMap$com$badlogic$gdx$utils$JsonWriter$OutputType     // Catch:{ NoSuchFieldError -> 0x001f }
                com.badlogic.gdx.utils.JsonWriter$OutputType r1 = com.badlogic.gdx.utils.JsonWriter.OutputType.javascript     // Catch:{ NoSuchFieldError -> 0x001f }
                int r1 = r1.ordinal()     // Catch:{ NoSuchFieldError -> 0x001f }
                r2 = 2
                r0[r1] = r2     // Catch:{ NoSuchFieldError -> 0x001f }
            L_0x001f:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.JsonWriter.AnonymousClass1.<clinit>():void");
        }
    }
}
