.class public Lcom/trendmicro/hippo/typedarrays/NativeDataView;
.super Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;
.source "NativeDataView.java"


# static fields
.field public static final CLASS_NAME:Ljava/lang/String; = "DataView"

.field private static final Id_constructor:I = 0x1

.field private static final Id_getFloat32:I = 0x8

.field private static final Id_getFloat64:I = 0x9

.field private static final Id_getInt16:I = 0x4

.field private static final Id_getInt32:I = 0x6

.field private static final Id_getInt8:I = 0x2

.field private static final Id_getUint16:I = 0x5

.field private static final Id_getUint32:I = 0x7

.field private static final Id_getUint8:I = 0x3

.field private static final Id_setFloat32:I = 0x10

.field private static final Id_setFloat64:I = 0x11

.field private static final Id_setInt16:I = 0xc

.field private static final Id_setInt32:I = 0xe

.field private static final Id_setInt8:I = 0xa

.field private static final Id_setUint16:I = 0xd

.field private static final Id_setUint32:I = 0xf

.field private static final Id_setUint8:I = 0xb

.field private static final MAX_PROTOTYPE_ID:I = 0x11

.field private static final serialVersionUID:J = 0x13d128f92f39bdf8L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;-><init>()V

    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V
    .locals 0
    .param p1, "ab"    # Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V

    .line 36
    return-void
.end method

.method private determinePos([Ljava/lang/Object;)I
    .locals 4
    .param p1, "args"    # [Ljava/lang/Object;

    .line 52
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 53
    aget-object v0, p1, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 54
    .local v0, "doublePos":D
    invoke-static {v0, v1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v2

    if-nez v2, :cond_0

    .line 57
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v2

    return v2

    .line 55
    :cond_0
    const-string v2, "RangeError"

    const-string v3, "offset out of range"

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 59
    .end local v0    # "doublePos":D
    :cond_1
    return v0
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 46
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    invoke-direct {v0}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;-><init>()V

    .line 47
    .local v0, "dv":Lcom/trendmicro/hippo/typedarrays/NativeDataView;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 48
    return-void
.end method

.method private js_constructor([Ljava/lang/Object;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;
    .locals 7
    .param p1, "args"    # [Ljava/lang/Object;

    .line 78
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_6

    aget-object v1, p1, v0

    instance-of v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    if-eqz v1, :cond_6

    .line 82
    aget-object v0, p1, v0

    check-cast v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    .line 85
    .local v0, "ab":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v2

    const-string v3, "offset out of range"

    const-string v4, "RangeError"

    if-eqz v2, :cond_1

    .line 86
    aget-object v1, p1, v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v1

    .line 87
    .local v1, "doublePos":D
    invoke-static {v1, v2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v5

    if-nez v5, :cond_0

    .line 90
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v1

    .line 91
    .local v1, "pos":I
    goto :goto_0

    .line 88
    .local v1, "doublePos":D
    :cond_0
    invoke-static {v4, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3

    .line 92
    .end local v1    # "doublePos":D
    :cond_1
    const/4 v1, 0x0

    .line 96
    .local v1, "pos":I
    :goto_0
    const/4 v2, 0x2

    invoke-static {p1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 97
    aget-object v2, p1, v2

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v5

    .line 98
    .local v5, "doublePos":D
    invoke-static {v5, v6}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v2

    if-nez v2, :cond_2

    .line 101
    invoke-static {v5, v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v2

    .line 102
    .end local v5    # "doublePos":D
    .local v2, "len":I
    goto :goto_1

    .line 99
    .end local v2    # "len":I
    .restart local v5    # "doublePos":D
    :cond_2
    invoke-static {v4, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2

    .line 103
    .end local v5    # "doublePos":D
    :cond_3
    invoke-virtual {v0}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->getLength()I

    move-result v2

    sub-int/2addr v2, v1

    .line 106
    .restart local v2    # "len":I
    :goto_1
    if-ltz v2, :cond_5

    .line 109
    if-ltz v1, :cond_4

    add-int v5, v1, v2

    invoke-virtual {v0}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->getLength()I

    move-result v6

    if-gt v5, v6, :cond_4

    .line 112
    new-instance v3, Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    invoke-direct {v3, v0, v1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V

    return-object v3

    .line 110
    :cond_4
    invoke-static {v4, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3

    .line 107
    :cond_5
    const-string v3, "length out of range"

    invoke-static {v4, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3

    .line 79
    .end local v0    # "ab":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .end local v1    # "pos":I
    .end local v2    # "len":I
    :cond_6
    const-string v0, "TypeError"

    const-string v1, "Missing parameters"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private js_getFloat(I[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "bytes"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .line 139
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->determinePos([Ljava/lang/Object;)I

    move-result v0

    .line 140
    .local v0, "pos":I
    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->rangeCheck(II)V

    .line 142
    const/4 v1, 0x1

    invoke-static {p2, v1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    if-le p1, v1, :cond_0

    aget-object v2, p2, v1

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 144
    .local v1, "littleEndian":Z
    :goto_0
    const/4 v2, 0x4

    if-eq p1, v2, :cond_2

    const/16 v2, 0x8

    if-ne p1, v2, :cond_1

    .line 148
    iget-object v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v3, v0

    invoke-static {v2, v3, v1}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readFloat64([BIZ)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 150
    :cond_1
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 146
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v3, v0

    invoke-static {v2, v3, v1}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readFloat32([BIZ)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method private js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "bytes"    # I
    .param p2, "signed"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .line 117
    invoke-direct {p0, p3}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->determinePos([Ljava/lang/Object;)I

    move-result v0

    .line 118
    .local v0, "pos":I
    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->rangeCheck(II)V

    .line 120
    const/4 v1, 0x1

    invoke-static {p3, v1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_0

    if-le p1, v1, :cond_0

    aget-object v2, p3, v1

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 122
    .local v2, "littleEndian":Z
    :goto_0
    if-eq p1, v1, :cond_5

    const/4 v1, 0x2

    if-eq p1, v1, :cond_3

    const/4 v1, 0x4

    if-ne p1, v1, :cond_2

    .line 130
    if-eqz p2, :cond_1

    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v3, v0

    invoke-static {v1, v3, v2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readInt32([BIZ)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    .line 131
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v3, v0

    invoke-static {v1, v3, v2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readUint32([BIZ)Ljava/lang/Object;

    move-result-object v1

    .line 130
    :goto_1
    return-object v1

    .line 133
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 127
    :cond_3
    if-eqz p2, :cond_4

    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v3, v0

    invoke-static {v1, v3, v2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readInt16([BIZ)Ljava/lang/Object;

    move-result-object v1

    goto :goto_2

    .line 128
    :cond_4
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v3, v0

    invoke-static {v1, v3, v2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readUint16([BIZ)Ljava/lang/Object;

    move-result-object v1

    .line 127
    :goto_2
    return-object v1

    .line 124
    :cond_5
    if-eqz p2, :cond_6

    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v3, v0

    invoke-static {v1, v3}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readInt8([BI)Ljava/lang/Object;

    move-result-object v1

    goto :goto_3

    .line 125
    :cond_6
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v3, v0

    invoke-static {v1, v3}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readUint8([BI)Ljava/lang/Object;

    move-result-object v1

    .line 124
    :goto_3
    return-object v1
.end method

.method private js_setFloat(I[Ljava/lang/Object;)V
    .locals 8
    .param p1, "bytes"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .line 221
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->determinePos([Ljava/lang/Object;)I

    move-result v0

    .line 222
    .local v0, "pos":I
    const-string v1, "offset out of range"

    const-string v2, "RangeError"

    if-ltz v0, :cond_5

    .line 226
    const/4 v3, 0x2

    invoke-static {p2, v3}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    if-le p1, v5, :cond_0

    aget-object v3, p2, v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 228
    .local v3, "littleEndian":Z
    :goto_0
    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 229
    .local v6, "val":D
    array-length v4, p2

    if-le v4, v5, :cond_1

    .line 230
    aget-object v4, p2, v5

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v6

    .line 233
    :cond_1
    add-int v4, v0, p1

    iget v5, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->byteLength:I

    if-gt v4, v5, :cond_4

    .line 237
    const/4 v1, 0x4

    if-eq p1, v1, :cond_3

    const/16 v1, 0x8

    if-ne p1, v1, :cond_2

    .line 242
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v2, v0

    invoke-static {v1, v2, v6, v7, v3}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeFloat64([BIDZ)V

    .line 243
    goto :goto_1

    .line 245
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 239
    :cond_3
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v2, v0

    invoke-static {v1, v2, v6, v7, v3}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeFloat32([BIDZ)V

    .line 240
    nop

    .line 247
    :goto_1
    return-void

    .line 234
    :cond_4
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 223
    .end local v3    # "littleEndian":Z
    .end local v6    # "val":D
    :cond_5
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private js_setInt(IZ[Ljava/lang/Object;)V
    .locals 9
    .param p1, "bytes"    # I
    .param p2, "signed"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .line 156
    invoke-direct {p0, p3}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->determinePos([Ljava/lang/Object;)I

    move-result v0

    .line 157
    .local v0, "pos":I
    const-string v1, "offset out of range"

    const-string v2, "RangeError"

    if-ltz v0, :cond_e

    .line 161
    const/4 v3, 0x2

    invoke-static {p3, v3}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->isArg([Ljava/lang/Object;I)Z

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_0

    if-le p1, v6, :cond_0

    aget-object v4, p3, v3

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v6

    goto :goto_0

    :cond_0
    move v4, v5

    .line 163
    .local v4, "littleEndian":Z
    :goto_0
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 164
    .local v5, "val":Ljava/lang/Object;
    array-length v7, p3

    if-le v7, v6, :cond_1

    .line 165
    aget-object v5, p3, v6

    .line 168
    :cond_1
    if-eq p1, v6, :cond_a

    if-eq p1, v3, :cond_6

    const/4 v3, 0x4

    if-ne p1, v3, :cond_5

    .line 200
    if-eqz p2, :cond_3

    .line 201
    invoke-static {v5}, Lcom/trendmicro/hippo/typedarrays/Conversions;->toInt32(Ljava/lang/Object;)I

    move-result v3

    .line 202
    .local v3, "value":I
    add-int v6, v0, p1

    iget v7, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->byteLength:I

    if-gt v6, v7, :cond_2

    .line 205
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v2, v0

    invoke-static {v1, v2, v3, v4}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeInt32([BIIZ)V

    .line 206
    .end local v3    # "value":I
    goto/16 :goto_1

    .line 203
    .restart local v3    # "value":I
    :cond_2
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 207
    .end local v3    # "value":I
    :cond_3
    invoke-static {v5}, Lcom/trendmicro/hippo/typedarrays/Conversions;->toUint32(Ljava/lang/Object;)J

    move-result-wide v6

    .line 208
    .local v6, "value":J
    add-int v3, v0, p1

    iget v8, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->byteLength:I

    if-gt v3, v8, :cond_4

    .line 211
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v2, v0

    invoke-static {v1, v2, v6, v7, v4}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeUint32([BIJZ)V

    .line 213
    .end local v6    # "value":J
    goto/16 :goto_1

    .line 209
    .restart local v6    # "value":J
    :cond_4
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 215
    .end local v6    # "value":J
    :cond_5
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 185
    :cond_6
    if-eqz p2, :cond_8

    .line 186
    invoke-static {v5}, Lcom/trendmicro/hippo/typedarrays/Conversions;->toInt16(Ljava/lang/Object;)I

    move-result v3

    .line 187
    .restart local v3    # "value":I
    add-int v6, v0, p1

    iget v7, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->byteLength:I

    if-gt v6, v7, :cond_7

    .line 190
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v2, v0

    invoke-static {v1, v2, v3, v4}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeInt16([BIIZ)V

    .line 191
    .end local v3    # "value":I
    goto :goto_1

    .line 188
    .restart local v3    # "value":I
    :cond_7
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 192
    .end local v3    # "value":I
    :cond_8
    invoke-static {v5}, Lcom/trendmicro/hippo/typedarrays/Conversions;->toUint16(Ljava/lang/Object;)I

    move-result v3

    .line 193
    .restart local v3    # "value":I
    add-int v6, v0, p1

    iget v7, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->byteLength:I

    if-gt v6, v7, :cond_9

    .line 196
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v2, v0

    invoke-static {v1, v2, v3, v4}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeUint16([BIIZ)V

    .line 198
    .end local v3    # "value":I
    goto :goto_1

    .line 194
    .restart local v3    # "value":I
    :cond_9
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 170
    .end local v3    # "value":I
    :cond_a
    if-eqz p2, :cond_c

    .line 171
    invoke-static {v5}, Lcom/trendmicro/hippo/typedarrays/Conversions;->toInt8(Ljava/lang/Object;)I

    move-result v3

    .line 172
    .restart local v3    # "value":I
    add-int v6, v0, p1

    iget v7, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->byteLength:I

    if-gt v6, v7, :cond_b

    .line 175
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v2, v0

    invoke-static {v1, v2, v3}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeInt8([BII)V

    .line 176
    .end local v3    # "value":I
    goto :goto_1

    .line 173
    .restart local v3    # "value":I
    :cond_b
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 177
    .end local v3    # "value":I
    :cond_c
    invoke-static {v5}, Lcom/trendmicro/hippo/typedarrays/Conversions;->toUint8(Ljava/lang/Object;)I

    move-result v3

    .line 178
    .restart local v3    # "value":I
    add-int v6, v0, p1

    iget v7, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->byteLength:I

    if-gt v6, v7, :cond_d

    .line 181
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->offset:I

    add-int/2addr v2, v0

    invoke-static {v1, v2, v3}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeUint8([BII)V

    .line 183
    .end local v3    # "value":I
    nop

    .line 217
    :goto_1
    return-void

    .line 179
    .restart local v3    # "value":I
    :cond_d
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 158
    .end local v3    # "value":I
    .end local v4    # "littleEndian":Z
    .end local v5    # "val":Ljava/lang/Object;
    :cond_e
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private rangeCheck(II)V
    .locals 2
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 64
    if-ltz p1, :cond_0

    add-int v0, p1, p2

    iget v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->byteLength:I

    if-gt v0, v1, :cond_0

    .line 67
    return-void

    .line 65
    :cond_0
    const-string v0, "RangeError"

    const-string v1, "offset out of range"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;
    .locals 1
    .param p0, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 71
    instance-of v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    if-eqz v0, :cond_0

    .line 73
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    return-object v0

    .line 72
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 255
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 256
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 258
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 259
    .local v0, "id":I
    const/16 v1, 0x8

    const/4 v2, 0x2

    const/4 v3, 0x4

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_0

    .line 303
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 300
    :pswitch_0
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v2

    invoke-direct {v2, v1, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_setFloat(I[Ljava/lang/Object;)V

    .line 301
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 297
    :pswitch_1
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v3, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_setFloat(I[Ljava/lang/Object;)V

    .line 298
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 294
    :pswitch_2
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v3, v4, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 295
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 291
    :pswitch_3
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v3, v5, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 292
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 288
    :pswitch_4
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v2, v4, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 289
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 285
    :pswitch_5
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v2, v5, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 286
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 282
    :pswitch_6
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v5, v4, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 283
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 279
    :pswitch_7
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v5, v5, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_setInt(IZ[Ljava/lang/Object;)V

    .line 280
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 277
    :pswitch_8
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v2

    invoke-direct {v2, v1, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_getFloat(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 275
    :pswitch_9
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v3, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_getFloat(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 273
    :pswitch_a
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v3, v4, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 271
    :pswitch_b
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v3, v5, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 269
    :pswitch_c
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v2, v4, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 267
    :pswitch_d
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v2, v5, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 265
    :pswitch_e
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v5, v4, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 263
    :pswitch_f
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    invoke-direct {v1, v5, v5, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_getInt(IZ[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 261
    :pswitch_10
    invoke-direct {p0, p5}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->js_constructor([Ljava/lang/Object;)Lcom/trendmicro/hippo/typedarrays/NativeDataView;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 8
    .param p1, "s"    # Ljava/lang/String;

    .line 341
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 342
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x32

    const/16 v4, 0x73

    const/16 v5, 0x67

    const/4 v6, 0x0

    packed-switch v2, :pswitch_data_0

    goto/16 :goto_0

    .line 388
    :pswitch_0
    const-string v1, "constructor"

    const/4 v0, 0x1

    goto/16 :goto_0

    .line 376
    :pswitch_1
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 377
    .local v2, "c":I
    const/16 v6, 0x34

    const/16 v7, 0x9

    if-ne v2, v5, :cond_1

    .line 378
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 379
    if-ne v2, v3, :cond_0

    const-string v1, "getFloat32"

    const/16 v0, 0x8

    goto/16 :goto_0

    .line 380
    :cond_0
    if-ne v2, v6, :cond_c

    const-string v1, "getFloat64"

    const/16 v0, 0x9

    goto/16 :goto_0

    .line 382
    :cond_1
    if-ne v2, v4, :cond_c

    .line 383
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 384
    if-ne v2, v3, :cond_2

    const-string v1, "setFloat32"

    const/16 v0, 0x10

    goto/16 :goto_0

    .line 385
    :cond_2
    if-ne v2, v6, :cond_c

    const-string v1, "setFloat64"

    const/16 v0, 0x11

    goto/16 :goto_0

    .line 364
    .end local v2    # "c":I
    :pswitch_2
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 365
    .restart local v2    # "c":I
    const/16 v6, 0x36

    const/16 v7, 0x8

    if-ne v2, v5, :cond_4

    .line 366
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 367
    if-ne v2, v3, :cond_3

    const-string v1, "getUint32"

    const/4 v0, 0x7

    goto/16 :goto_0

    .line 368
    :cond_3
    if-ne v2, v6, :cond_c

    const-string v1, "getUint16"

    const/4 v0, 0x5

    goto/16 :goto_0

    .line 370
    :cond_4
    if-ne v2, v4, :cond_c

    .line 371
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 372
    if-ne v2, v3, :cond_5

    const-string v1, "setUint32"

    const/16 v0, 0xf

    goto :goto_0

    .line 373
    :cond_5
    if-ne v2, v6, :cond_c

    const-string v1, "setUint16"

    const/16 v0, 0xd

    goto :goto_0

    .line 347
    .end local v2    # "c":I
    :pswitch_3
    const/4 v2, 0x6

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 348
    .restart local v2    # "c":I
    const/16 v3, 0x31

    if-ne v2, v3, :cond_7

    .line 349
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 350
    if-ne v2, v5, :cond_6

    const-string v1, "getInt16"

    const/4 v0, 0x4

    goto :goto_0

    .line 351
    :cond_6
    if-ne v2, v4, :cond_c

    const-string v1, "setInt16"

    const/16 v0, 0xc

    goto :goto_0

    .line 353
    :cond_7
    const/16 v3, 0x33

    if-ne v2, v3, :cond_9

    .line 354
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 355
    if-ne v2, v5, :cond_8

    const-string v1, "getInt32"

    const/4 v0, 0x6

    goto :goto_0

    .line 356
    :cond_8
    if-ne v2, v4, :cond_c

    const-string v1, "setInt32"

    const/16 v0, 0xe

    goto :goto_0

    .line 358
    :cond_9
    const/16 v3, 0x74

    if-ne v2, v3, :cond_c

    .line 359
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 360
    if-ne v2, v5, :cond_a

    const-string v1, "getUint8"

    const/4 v0, 0x3

    goto :goto_0

    .line 361
    :cond_a
    if-ne v2, v4, :cond_c

    const-string v1, "setUint8"

    const/16 v0, 0xb

    goto :goto_0

    .line 343
    .end local v2    # "c":I
    :pswitch_4
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 344
    .restart local v2    # "c":I
    if-ne v2, v5, :cond_b

    const-string v1, "getInt8"

    const/4 v0, 0x2

    goto :goto_0

    .line 345
    :cond_b
    if-ne v2, v4, :cond_c

    const-string v1, "setInt8"

    const/16 v0, 0xa

    .line 390
    .end local v2    # "c":I
    :cond_c
    :goto_0
    if-eqz v1, :cond_d

    if-eq v1, p1, :cond_d

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    const/4 v0, 0x0

    .line 394
    .end local v1    # "X":Ljava/lang/String;
    :cond_d
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 41
    const-string v0, "DataView"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 311
    packed-switch p1, :pswitch_data_0

    .line 329
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 328
    :pswitch_0
    const/4 v0, 0x2

    .local v0, "arity":I
    const-string v1, "setFloat64"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 327
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setFloat32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 326
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setUint32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 325
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setInt32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 324
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setUint16"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 323
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setInt16"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 322
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setUint8"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 321
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "setInt8"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 320
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getFloat64"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 319
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getFloat32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 318
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getUint32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 317
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getInt32"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 316
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getUint16"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 315
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getInt16"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 314
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getUint8"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 313
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_f
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "getInt8"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 312
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_10
    const/4 v0, 0x3

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 331
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/typedarrays/NativeDataView;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 332
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
