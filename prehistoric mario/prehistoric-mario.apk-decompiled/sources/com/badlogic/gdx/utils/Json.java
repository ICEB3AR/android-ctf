package com.badlogic.gdx.utils;

import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.utils.IntSet;
import com.badlogic.gdx.utils.JsonValue;
import com.badlogic.gdx.utils.JsonWriter;
import com.badlogic.gdx.utils.ObjectMap;
import com.badlogic.gdx.utils.ObjectSet;
import com.badlogic.gdx.utils.reflect.ArrayReflection;
import com.badlogic.gdx.utils.reflect.ClassReflection;
import com.badlogic.gdx.utils.reflect.Constructor;
import com.badlogic.gdx.utils.reflect.Field;
import com.badlogic.gdx.utils.reflect.ReflectionException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.security.AccessControlException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Json {
    private static final boolean debug = false;
    private final ObjectMap<Class, Object[]> classToDefaultValues;
    private final ObjectMap<Class, Serializer> classToSerializer;
    private final ObjectMap<Class, String> classToTag;
    private Serializer defaultSerializer;
    private boolean enumNames;
    private final Object[] equals1;
    private final Object[] equals2;
    private boolean ignoreDeprecated;
    private boolean ignoreUnknownFields;
    private JsonWriter.OutputType outputType;
    private boolean quoteLongValues;
    private boolean readDeprecated;
    private boolean sortFields;
    private final ObjectMap<String, Class> tagToClass;
    private String typeName;
    private final ObjectMap<Class, OrderedMap<String, FieldMetadata>> typeToFields;
    private boolean usePrototypes;
    private JsonWriter writer;

    public static abstract class ReadOnlySerializer<T> implements Serializer<T> {
        @Override // com.badlogic.gdx.utils.Json.Serializer
        public abstract T read(Json json, JsonValue jsonValue, Class cls);

        @Override // com.badlogic.gdx.utils.Json.Serializer
        public void write(Json json, T t, Class cls) {
        }
    }

    public interface Serializable {
        void read(Json json, JsonValue jsonValue);

        void write(Json json);
    }

    public interface Serializer<T> {
        T read(Json json, JsonValue jsonValue, Class cls);

        void write(Json json, T t, Class cls);
    }

    /* access modifiers changed from: protected */
    public boolean ignoreUnknownField(Class cls, String str) {
        return false;
    }

    public Json() {
        this.typeName = "class";
        this.usePrototypes = true;
        this.enumNames = true;
        this.typeToFields = new ObjectMap<>();
        this.tagToClass = new ObjectMap<>();
        this.classToTag = new ObjectMap<>();
        this.classToSerializer = new ObjectMap<>();
        this.classToDefaultValues = new ObjectMap<>();
        this.equals1 = new Object[]{null};
        this.equals2 = new Object[]{null};
        this.outputType = JsonWriter.OutputType.minimal;
    }

    public Json(JsonWriter.OutputType outputType2) {
        this.typeName = "class";
        this.usePrototypes = true;
        this.enumNames = true;
        this.typeToFields = new ObjectMap<>();
        this.tagToClass = new ObjectMap<>();
        this.classToTag = new ObjectMap<>();
        this.classToSerializer = new ObjectMap<>();
        this.classToDefaultValues = new ObjectMap<>();
        this.equals1 = new Object[]{null};
        this.equals2 = new Object[]{null};
        this.outputType = outputType2;
    }

    public void setIgnoreUnknownFields(boolean z) {
        this.ignoreUnknownFields = z;
    }

    public boolean getIgnoreUnknownFields() {
        return this.ignoreUnknownFields;
    }

    public void setIgnoreDeprecated(boolean z) {
        this.ignoreDeprecated = z;
    }

    public void setReadDeprecated(boolean z) {
        this.readDeprecated = z;
    }

    public void setOutputType(JsonWriter.OutputType outputType2) {
        this.outputType = outputType2;
    }

    public void setQuoteLongValues(boolean z) {
        this.quoteLongValues = z;
    }

    public void setEnumNames(boolean z) {
        this.enumNames = z;
    }

    public void addClassTag(String str, Class cls) {
        this.tagToClass.put(str, cls);
        this.classToTag.put(cls, str);
    }

    public Class getClass(String str) {
        return this.tagToClass.get(str);
    }

    public String getTag(Class cls) {
        return this.classToTag.get(cls);
    }

    public void setTypeName(String str) {
        this.typeName = str;
    }

    public void setDefaultSerializer(Serializer serializer) {
        this.defaultSerializer = serializer;
    }

    public <T> void setSerializer(Class<T> cls, Serializer<T> serializer) {
        this.classToSerializer.put(cls, serializer);
    }

    public <T> Serializer<T> getSerializer(Class<T> cls) {
        return this.classToSerializer.get(cls);
    }

    public void setUsePrototypes(boolean z) {
        this.usePrototypes = z;
    }

    public void setElementType(Class cls, String str, Class cls2) {
        FieldMetadata fieldMetadata = getFields(cls).get(str);
        if (fieldMetadata != null) {
            fieldMetadata.elementType = cls2;
            return;
        }
        throw new SerializationException("Field not found: " + str + " (" + cls.getName() + ")");
    }

    public void setDeprecated(Class cls, String str, boolean z) {
        FieldMetadata fieldMetadata = getFields(cls).get(str);
        if (fieldMetadata != null) {
            fieldMetadata.deprecated = z;
            return;
        }
        throw new SerializationException("Field not found: " + str + " (" + cls.getName() + ")");
    }

    public void setSortFields(boolean z) {
        this.sortFields = z;
    }

    private OrderedMap<String, FieldMetadata> getFields(Class cls) {
        OrderedMap<String, FieldMetadata> orderedMap = this.typeToFields.get(cls);
        if (orderedMap != null) {
            return orderedMap;
        }
        Array array = new Array();
        for (Class cls2 = cls; cls2 != Object.class; cls2 = cls2.getSuperclass()) {
            array.add(cls2);
        }
        ArrayList arrayList = new ArrayList();
        for (int i = array.size - 1; i >= 0; i--) {
            Collections.addAll(arrayList, ClassReflection.getDeclaredFields((Class) array.get(i)));
        }
        OrderedMap<String, FieldMetadata> orderedMap2 = new OrderedMap<>(arrayList.size());
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            Field field = (Field) arrayList.get(i2);
            if (!field.isTransient() && !field.isStatic() && !field.isSynthetic()) {
                if (!field.isAccessible()) {
                    try {
                        field.setAccessible(true);
                    } catch (AccessControlException unused) {
                    }
                }
                orderedMap2.put(field.getName(), new FieldMetadata(field));
            }
        }
        if (this.sortFields) {
            orderedMap2.keys.sort();
        }
        this.typeToFields.put(cls, orderedMap2);
        return orderedMap2;
    }

    public String toJson(Object obj) {
        return toJson(obj, obj == null ? null : obj.getClass(), (Class) null);
    }

    public String toJson(Object obj, Class cls) {
        return toJson(obj, cls, (Class) null);
    }

    public String toJson(Object obj, Class cls, Class cls2) {
        StringWriter stringWriter = new StringWriter();
        toJson(obj, cls, cls2, stringWriter);
        return stringWriter.toString();
    }

    public void toJson(Object obj, FileHandle fileHandle) {
        toJson(obj, obj == null ? null : obj.getClass(), (Class) null, fileHandle);
    }

    public void toJson(Object obj, Class cls, FileHandle fileHandle) {
        toJson(obj, cls, (Class) null, fileHandle);
    }

    public void toJson(Object obj, Class cls, Class cls2, FileHandle fileHandle) {
        Writer writer2 = null;
        try {
            writer2 = fileHandle.writer(false, "UTF-8");
            toJson(obj, cls, cls2, writer2);
            StreamUtils.closeQuietly(writer2);
        } catch (Exception e) {
            throw new SerializationException("Error writing file: " + fileHandle, e);
        } catch (Throwable th) {
            StreamUtils.closeQuietly(writer2);
            throw th;
        }
    }

    public void toJson(Object obj, Writer writer2) {
        toJson(obj, obj == null ? null : obj.getClass(), (Class) null, writer2);
    }

    public void toJson(Object obj, Class cls, Writer writer2) {
        toJson(obj, cls, (Class) null, writer2);
    }

    public void toJson(Object obj, Class cls, Class cls2, Writer writer2) {
        setWriter(writer2);
        try {
            writeValue(obj, cls, cls2);
        } finally {
            StreamUtils.closeQuietly(this.writer);
            this.writer = null;
        }
    }

    public void setWriter(Writer writer2) {
        if (!(writer2 instanceof JsonWriter)) {
            writer2 = new JsonWriter(writer2);
        }
        this.writer = (JsonWriter) writer2;
        this.writer.setOutputType(this.outputType);
        this.writer.setQuoteLongValues(this.quoteLongValues);
    }

    public JsonWriter getWriter() {
        return this.writer;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0070, code lost:
        if (java.util.Arrays.deepEquals(r12.equals1, r12.equals2) != false) goto L_0x0072;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void writeFields(java.lang.Object r13) {
        /*
        // Method dump skipped, instructions count: 243
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.Json.writeFields(java.lang.Object):void");
    }

    private Object[] getDefaultValues(Class cls) {
        if (!this.usePrototypes) {
            return null;
        }
        if (this.classToDefaultValues.containsKey(cls)) {
            return this.classToDefaultValues.get(cls);
        }
        try {
            Object newInstance = newInstance(cls);
            OrderedMap<String, FieldMetadata> fields = getFields(cls);
            Object[] objArr = new Object[fields.size];
            this.classToDefaultValues.put(cls, objArr);
            int i = 0;
            ObjectMap.Values<FieldMetadata> it = fields.values().iterator();
            while (it.hasNext()) {
                FieldMetadata fieldMetadata = (FieldMetadata) it.next();
                if (!this.ignoreDeprecated || !fieldMetadata.deprecated) {
                    Field field = fieldMetadata.field;
                    int i2 = i + 1;
                    try {
                        objArr[i] = field.get(newInstance);
                        i = i2;
                    } catch (ReflectionException e) {
                        throw new SerializationException("Error accessing field: " + field.getName() + " (" + cls.getName() + ")", e);
                    } catch (SerializationException e2) {
                        e2.addTrace(field + " (" + cls.getName() + ")");
                        throw e2;
                    } catch (RuntimeException e3) {
                        SerializationException serializationException = new SerializationException(e3);
                        serializationException.addTrace(field + " (" + cls.getName() + ")");
                        throw serializationException;
                    }
                }
            }
            return objArr;
        } catch (Exception unused) {
            this.classToDefaultValues.put(cls, null);
            return null;
        }
    }

    public void writeField(Object obj, String str) {
        writeField(obj, str, str, null);
    }

    public void writeField(Object obj, String str, Class cls) {
        writeField(obj, str, str, cls);
    }

    public void writeField(Object obj, String str, String str2) {
        writeField(obj, str, str2, null);
    }

    public void writeField(Object obj, String str, String str2, Class cls) {
        Class<?> cls2 = obj.getClass();
        FieldMetadata fieldMetadata = getFields(cls2).get(str);
        if (fieldMetadata != null) {
            Field field = fieldMetadata.field;
            if (cls == null) {
                cls = fieldMetadata.elementType;
            }
            try {
                this.writer.name(str2);
                writeValue(field.get(obj), field.getType(), cls);
            } catch (ReflectionException e) {
                throw new SerializationException("Error accessing field: " + field.getName() + " (" + cls2.getName() + ")", e);
            } catch (SerializationException e2) {
                e2.addTrace(field + " (" + cls2.getName() + ")");
                throw e2;
            } catch (Exception e3) {
                SerializationException serializationException = new SerializationException(e3);
                serializationException.addTrace(field + " (" + cls2.getName() + ")");
                throw serializationException;
            }
        } else {
            throw new SerializationException("Field not found: " + str + " (" + cls2.getName() + ")");
        }
    }

    public void writeValue(String str, Object obj) {
        try {
            this.writer.name(str);
            if (obj == null) {
                writeValue(obj, (Class) null, (Class) null);
            } else {
                writeValue(obj, obj.getClass(), (Class) null);
            }
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeValue(String str, Object obj, Class cls) {
        try {
            this.writer.name(str);
            writeValue(obj, cls, (Class) null);
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeValue(String str, Object obj, Class cls, Class cls2) {
        try {
            this.writer.name(str);
            writeValue(obj, cls, cls2);
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeValue(Object obj) {
        if (obj == null) {
            writeValue(obj, (Class) null, (Class) null);
        } else {
            writeValue(obj, obj.getClass(), (Class) null);
        }
    }

    public void writeValue(Object obj, Class cls) {
        writeValue(obj, cls, (Class) null);
    }

    public void writeValue(Object obj, Class cls, Class cls2) {
        if (obj == null) {
            try {
                this.writer.value(null);
            } catch (IOException e) {
                throw new SerializationException(e);
            }
        } else {
            if (!((cls != null && cls.isPrimitive()) || cls == String.class || cls == Integer.class || cls == Boolean.class || cls == Float.class || cls == Long.class || cls == Double.class || cls == Short.class || cls == Byte.class)) {
                if (cls != Character.class) {
                    Class<?> cls3 = obj.getClass();
                    if (cls3.isPrimitive() || cls3 == String.class || cls3 == Integer.class || cls3 == Boolean.class || cls3 == Float.class || cls3 == Long.class || cls3 == Double.class || cls3 == Short.class || cls3 == Byte.class || cls3 == Character.class) {
                        writeObjectStart(cls3, null);
                        writeValue("value", obj);
                        writeObjectEnd();
                        return;
                    } else if (obj instanceof Serializable) {
                        writeObjectStart(cls3, cls);
                        ((Serializable) obj).write(this);
                        writeObjectEnd();
                        return;
                    } else {
                        Serializer serializer = this.classToSerializer.get(cls3);
                        if (serializer != null) {
                            serializer.write(this, obj, cls);
                            return;
                        }
                        int i = 0;
                        if (obj instanceof Array) {
                            if (cls == null || cls3 == cls || cls3 == Array.class) {
                                writeArrayStart();
                                Array array = (Array) obj;
                                int i2 = array.size;
                                while (i < i2) {
                                    writeValue(array.get(i), cls2, (Class) null);
                                    i++;
                                }
                                writeArrayEnd();
                                return;
                            }
                            throw new SerializationException("Serialization of an Array other than the known type is not supported.\nKnown type: " + cls + "\nActual type: " + cls3);
                        } else if (obj instanceof Queue) {
                            if (cls == null || cls3 == cls || cls3 == Queue.class) {
                                writeArrayStart();
                                Queue queue = (Queue) obj;
                                int i3 = queue.size;
                                while (i < i3) {
                                    writeValue(queue.get(i), cls2, (Class) null);
                                    i++;
                                }
                                writeArrayEnd();
                                return;
                            }
                            throw new SerializationException("Serialization of a Queue other than the known type is not supported.\nKnown type: " + cls + "\nActual type: " + cls3);
                        } else if (obj instanceof Collection) {
                            if (this.typeName == null || cls3 == ArrayList.class || (cls != null && cls == cls3)) {
                                writeArrayStart();
                                for (Object obj2 : (Collection) obj) {
                                    writeValue(obj2, cls2, (Class) null);
                                }
                                writeArrayEnd();
                                return;
                            }
                            writeObjectStart(cls3, cls);
                            writeArrayStart("items");
                            for (Object obj3 : (Collection) obj) {
                                writeValue(obj3, cls2, (Class) null);
                            }
                            writeArrayEnd();
                            writeObjectEnd();
                            return;
                        } else if (cls3.isArray()) {
                            if (cls2 == null) {
                                cls2 = cls3.getComponentType();
                            }
                            int length = ArrayReflection.getLength(obj);
                            writeArrayStart();
                            while (i < length) {
                                writeValue(ArrayReflection.get(obj, i), cls2, (Class) null);
                                i++;
                            }
                            writeArrayEnd();
                            return;
                        } else if (obj instanceof ObjectMap) {
                            if (cls == null) {
                                cls = ObjectMap.class;
                            }
                            writeObjectStart(cls3, cls);
                            ObjectMap.Entries it = ((ObjectMap) obj).entries().iterator();
                            while (it.hasNext()) {
                                ObjectMap.Entry entry = (ObjectMap.Entry) it.next();
                                this.writer.name(convertToString((Object) entry.key));
                                writeValue((Object) entry.value, cls2, (Class) null);
                            }
                            writeObjectEnd();
                            return;
                        } else if (obj instanceof ObjectSet) {
                            if (cls == null) {
                                cls = ObjectSet.class;
                            }
                            writeObjectStart(cls3, cls);
                            this.writer.name("values");
                            writeArrayStart();
                            ObjectSet.ObjectSetIterator it2 = ((ObjectSet) obj).iterator();
                            while (it2.hasNext()) {
                                writeValue(it2.next(), cls2, (Class) null);
                            }
                            writeArrayEnd();
                            writeObjectEnd();
                            return;
                        } else if (obj instanceof IntSet) {
                            if (cls == null) {
                                cls = IntSet.class;
                            }
                            writeObjectStart(cls3, cls);
                            this.writer.name("values");
                            writeArrayStart();
                            IntSet.IntSetIterator it3 = ((IntSet) obj).iterator();
                            while (it3.hasNext) {
                                writeValue(Integer.valueOf(it3.next()), Integer.class, (Class) null);
                            }
                            writeArrayEnd();
                            writeObjectEnd();
                            return;
                        } else if (obj instanceof ArrayMap) {
                            if (cls == null) {
                                cls = ArrayMap.class;
                            }
                            writeObjectStart(cls3, cls);
                            ArrayMap arrayMap = (ArrayMap) obj;
                            int i4 = arrayMap.size;
                            while (i < i4) {
                                this.writer.name(convertToString((Object) arrayMap.keys[i]));
                                writeValue((Object) arrayMap.values[i], cls2, (Class) null);
                                i++;
                            }
                            writeObjectEnd();
                            return;
                        } else if (obj instanceof Map) {
                            if (cls == null) {
                                cls = HashMap.class;
                            }
                            writeObjectStart(cls3, cls);
                            for (Map.Entry entry2 : ((Map) obj).entrySet()) {
                                this.writer.name(convertToString(entry2.getKey()));
                                writeValue(entry2.getValue(), cls2, (Class) null);
                            }
                            writeObjectEnd();
                            return;
                        } else if (!ClassReflection.isAssignableFrom(Enum.class, cls3)) {
                            writeObjectStart(cls3, cls);
                            writeFields(obj);
                            writeObjectEnd();
                            return;
                        } else if (this.typeName == null || (cls != null && cls == cls3)) {
                            this.writer.value(convertToString((Enum) obj));
                            return;
                        } else {
                            if (cls3.getEnumConstants() == null) {
                                cls3 = cls3.getSuperclass();
                            }
                            writeObjectStart(cls3, null);
                            this.writer.name("value");
                            this.writer.value(convertToString((Enum) obj));
                            writeObjectEnd();
                            return;
                        }
                    }
                }
            }
            this.writer.value(obj);
        }
    }

    public void writeObjectStart(String str) {
        try {
            this.writer.name(str);
            writeObjectStart();
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeObjectStart(String str, Class cls, Class cls2) {
        try {
            this.writer.name(str);
            writeObjectStart(cls, cls2);
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeObjectStart() {
        try {
            this.writer.object();
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeObjectStart(Class cls, Class cls2) {
        try {
            this.writer.object();
            if (cls2 == null || cls2 != cls) {
                writeType(cls);
            }
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeObjectEnd() {
        try {
            this.writer.pop();
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeArrayStart(String str) {
        try {
            this.writer.name(str);
            this.writer.array();
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeArrayStart() {
        try {
            this.writer.array();
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeArrayEnd() {
        try {
            this.writer.pop();
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    public void writeType(Class cls) {
        if (this.typeName != null) {
            String tag = getTag(cls);
            if (tag == null) {
                tag = cls.getName();
            }
            try {
                this.writer.set(this.typeName, tag);
            } catch (IOException e) {
                throw new SerializationException(e);
            }
        }
    }

    public <T> T fromJson(Class<T> cls, Reader reader) {
        return (T) readValue(cls, (Class) null, new JsonReader().parse(reader));
    }

    public <T> T fromJson(Class<T> cls, Class cls2, Reader reader) {
        return (T) readValue(cls, cls2, new JsonReader().parse(reader));
    }

    public <T> T fromJson(Class<T> cls, InputStream inputStream) {
        return (T) readValue(cls, (Class) null, new JsonReader().parse(inputStream));
    }

    public <T> T fromJson(Class<T> cls, Class cls2, InputStream inputStream) {
        return (T) readValue(cls, cls2, new JsonReader().parse(inputStream));
    }

    public <T> T fromJson(Class<T> cls, FileHandle fileHandle) {
        try {
            return (T) readValue(cls, (Class) null, new JsonReader().parse(fileHandle));
        } catch (Exception e) {
            throw new SerializationException("Error reading file: " + fileHandle, e);
        }
    }

    public <T> T fromJson(Class<T> cls, Class cls2, FileHandle fileHandle) {
        try {
            return (T) readValue(cls, cls2, new JsonReader().parse(fileHandle));
        } catch (Exception e) {
            throw new SerializationException("Error reading file: " + fileHandle, e);
        }
    }

    public <T> T fromJson(Class<T> cls, char[] cArr, int i, int i2) {
        return (T) readValue(cls, (Class) null, new JsonReader().parse(cArr, i, i2));
    }

    public <T> T fromJson(Class<T> cls, Class cls2, char[] cArr, int i, int i2) {
        return (T) readValue(cls, cls2, new JsonReader().parse(cArr, i, i2));
    }

    public <T> T fromJson(Class<T> cls, String str) {
        return (T) readValue(cls, (Class) null, new JsonReader().parse(str));
    }

    public <T> T fromJson(Class<T> cls, Class cls2, String str) {
        return (T) readValue(cls, cls2, new JsonReader().parse(str));
    }

    public void readField(Object obj, String str, JsonValue jsonValue) {
        readField(obj, str, str, (Class) null, jsonValue);
    }

    public void readField(Object obj, String str, Class cls, JsonValue jsonValue) {
        readField(obj, str, str, cls, jsonValue);
    }

    public void readField(Object obj, String str, String str2, JsonValue jsonValue) {
        readField(obj, str, str2, (Class) null, jsonValue);
    }

    public void readField(Object obj, String str, String str2, Class cls, JsonValue jsonValue) {
        Class<?> cls2 = obj.getClass();
        FieldMetadata fieldMetadata = getFields(cls2).get(str);
        if (fieldMetadata != null) {
            Field field = fieldMetadata.field;
            if (cls == null) {
                cls = fieldMetadata.elementType;
            }
            readField(obj, field, str2, cls, jsonValue);
            return;
        }
        throw new SerializationException("Field not found: " + str + " (" + cls2.getName() + ")");
    }

    public void readField(Object obj, Field field, String str, Class cls, JsonValue jsonValue) {
        JsonValue jsonValue2 = jsonValue.get(str);
        if (jsonValue2 != null) {
            try {
                field.set(obj, readValue(field.getType(), cls, jsonValue2));
            } catch (ReflectionException e) {
                throw new SerializationException("Error accessing field: " + field.getName() + " (" + field.getDeclaringClass().getName() + ")", e);
            } catch (SerializationException e2) {
                e2.addTrace(field.getName() + " (" + field.getDeclaringClass().getName() + ")");
                throw e2;
            } catch (RuntimeException e3) {
                SerializationException serializationException = new SerializationException(e3);
                serializationException.addTrace(jsonValue2.trace());
                serializationException.addTrace(field.getName() + " (" + field.getDeclaringClass().getName() + ")");
                throw serializationException;
            }
        }
    }

    public void readFields(Object obj, JsonValue jsonValue) {
        Class<?> cls = obj.getClass();
        OrderedMap<String, FieldMetadata> fields = getFields(cls);
        for (JsonValue jsonValue2 = jsonValue.child; jsonValue2 != null; jsonValue2 = jsonValue2.next) {
            FieldMetadata fieldMetadata = fields.get(jsonValue2.name().replace(" ", "_"));
            if (fieldMetadata == null) {
                if (!jsonValue2.name.equals(this.typeName) && !this.ignoreUnknownFields && !ignoreUnknownField(cls, jsonValue2.name)) {
                    SerializationException serializationException = new SerializationException("Field not found: " + jsonValue2.name + " (" + cls.getName() + ")");
                    serializationException.addTrace(jsonValue2.trace());
                    throw serializationException;
                }
            } else if (!this.ignoreDeprecated || this.readDeprecated || !fieldMetadata.deprecated) {
                Field field = fieldMetadata.field;
                try {
                    field.set(obj, readValue(field.getType(), fieldMetadata.elementType, jsonValue2));
                } catch (ReflectionException e) {
                    throw new SerializationException("Error accessing field: " + field.getName() + " (" + cls.getName() + ")", e);
                } catch (SerializationException e2) {
                    e2.addTrace(field.getName() + " (" + cls.getName() + ")");
                    throw e2;
                } catch (RuntimeException e3) {
                    SerializationException serializationException2 = new SerializationException(e3);
                    serializationException2.addTrace(jsonValue2.trace());
                    serializationException2.addTrace(field.getName() + " (" + cls.getName() + ")");
                    throw serializationException2;
                }
            }
        }
    }

    public <T> T readValue(String str, Class<T> cls, JsonValue jsonValue) {
        return (T) readValue(cls, (Class) null, jsonValue.get(str));
    }

    public <T> T readValue(String str, Class<T> cls, T t, JsonValue jsonValue) {
        JsonValue jsonValue2 = jsonValue.get(str);
        return jsonValue2 == null ? t : (T) readValue(cls, (Class) null, jsonValue2);
    }

    public <T> T readValue(String str, Class<T> cls, Class cls2, JsonValue jsonValue) {
        return (T) readValue(cls, cls2, jsonValue.get(str));
    }

    public <T> T readValue(String str, Class<T> cls, Class cls2, T t, JsonValue jsonValue) {
        return (T) readValue(cls, cls2, t, jsonValue.get(str));
    }

    public <T> T readValue(Class<T> cls, Class cls2, T t, JsonValue jsonValue) {
        return jsonValue == null ? t : (T) readValue(cls, cls2, jsonValue);
    }

    public <T> T readValue(Class<T> cls, JsonValue jsonValue) {
        return (T) readValue(cls, (Class) null, jsonValue);
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:9:0x0018 */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX DEBUG: Type inference failed for r9v38. Raw type applied. Possible types: java.lang.Class<com.badlogic.gdx.utils.Array> */
    /* JADX WARN: Type inference failed for: r8v0, types: [com.badlogic.gdx.utils.Json] */
    /* JADX WARN: Type inference failed for: r11v0, types: [com.badlogic.gdx.utils.JsonValue, T] */
    /* JADX WARN: Type inference failed for: r9v47, types: [T, com.badlogic.gdx.utils.ObjectSet] */
    /* JADX WARN: Type inference failed for: r9v78, types: [com.badlogic.gdx.utils.Queue] */
    /* JADX WARN: Type inference failed for: r9v82, types: [com.badlogic.gdx.utils.Array] */
    /* JADX WARNING: Code restructure failed: missing block: B:109:0x017a, code lost:
        if (r9 == java.lang.Object.class) goto L_0x017c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:211:0x02d1, code lost:
        if (r9 != java.lang.Boolean.class) goto L_0x02dc;
     */
    /* JADX WARNING: Removed duplicated region for block: B:218:0x02ec  */
    /* JADX WARNING: Removed duplicated region for block: B:291:0x03b6 A[RETURN] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public <T> T readValue(java.lang.Class<T> r9, java.lang.Class r10, com.badlogic.gdx.utils.JsonValue r11) {
        /*
        // Method dump skipped, instructions count: 951
        */
        throw new UnsupportedOperationException("Method not decompiled: com.badlogic.gdx.utils.Json.readValue(java.lang.Class, java.lang.Class, com.badlogic.gdx.utils.JsonValue):java.lang.Object");
    }

    public void copyFields(Object obj, Object obj2) {
        OrderedMap<String, FieldMetadata> fields = getFields(obj.getClass());
        ObjectMap.Entries<String, FieldMetadata> it = getFields(obj.getClass()).iterator();
        while (it.hasNext()) {
            ObjectMap.Entry entry = (ObjectMap.Entry) it.next();
            FieldMetadata fieldMetadata = fields.get(entry.key);
            Field field = entry.value.field;
            if (fieldMetadata != null) {
                try {
                    fieldMetadata.field.set(obj2, field.get(obj));
                } catch (ReflectionException e) {
                    throw new SerializationException("Error copying field: " + field.getName(), e);
                }
            } else {
                throw new SerializationException("To object is missing field" + ((String) entry.key));
            }
        }
    }

    private String convertToString(Enum r2) {
        return this.enumNames ? r2.name() : r2.toString();
    }

    private String convertToString(Object obj) {
        if (obj instanceof Enum) {
            return convertToString((Enum) obj);
        }
        if (obj instanceof Class) {
            return ((Class) obj).getName();
        }
        return String.valueOf(obj);
    }

    /* access modifiers changed from: protected */
    public Object newInstance(Class cls) {
        try {
            return ClassReflection.newInstance(cls);
        } catch (Exception e) {
            e = e;
            try {
                Constructor declaredConstructor = ClassReflection.getDeclaredConstructor(cls, new Class[0]);
                declaredConstructor.setAccessible(true);
                return declaredConstructor.newInstance(new Object[0]);
            } catch (SecurityException unused) {
                throw new SerializationException("Error constructing instance of class: " + cls.getName(), e);
            } catch (ReflectionException unused2) {
                if (ClassReflection.isAssignableFrom(Enum.class, cls)) {
                    if (cls.getEnumConstants() == null) {
                        cls = cls.getSuperclass();
                    }
                    return cls.getEnumConstants()[0];
                } else if (cls.isArray()) {
                    throw new SerializationException("Encountered JSON object when expected array of type: " + cls.getName(), e);
                } else if (!ClassReflection.isMemberClass(cls) || ClassReflection.isStaticClass(cls)) {
                    throw new SerializationException("Class cannot be created (missing no-arg constructor): " + cls.getName(), e);
                } else {
                    throw new SerializationException("Class cannot be created (non-static member class): " + cls.getName(), e);
                }
            } catch (Exception e2) {
                e = e2;
                throw new SerializationException("Error constructing instance of class: " + cls.getName(), e);
            }
        }
    }

    public String prettyPrint(Object obj) {
        return prettyPrint(obj, 0);
    }

    public String prettyPrint(String str) {
        return prettyPrint(str, 0);
    }

    public String prettyPrint(Object obj, int i) {
        return prettyPrint(toJson(obj), i);
    }

    public String prettyPrint(String str, int i) {
        return new JsonReader().parse(str).prettyPrint(this.outputType, i);
    }

    public String prettyPrint(Object obj, JsonValue.PrettyPrintSettings prettyPrintSettings) {
        return prettyPrint(toJson(obj), prettyPrintSettings);
    }

    public String prettyPrint(String str, JsonValue.PrettyPrintSettings prettyPrintSettings) {
        return new JsonReader().parse(str).prettyPrint(prettyPrintSettings);
    }

    /* access modifiers changed from: private */
    public static class FieldMetadata {
        boolean deprecated;
        Class elementType;
        final Field field;

        public FieldMetadata(Field field2) {
            this.field = field2;
            this.elementType = field2.getElementType((ClassReflection.isAssignableFrom(ObjectMap.class, field2.getType()) || ClassReflection.isAssignableFrom(Map.class, field2.getType())) ? 1 : 0);
            this.deprecated = field2.isAnnotationPresent(Deprecated.class);
        }
    }
}
