.class public abstract Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
.super Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;
.source "NativeTypedArrayView.java"

# interfaces
.implements Ljava/util/List;
.implements Ljava/util/RandomAccess;
.implements Lcom/trendmicro/hippo/ExternalArrayData;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;",
        "Ljava/util/List<",
        "TT;>;",
        "Ljava/util/RandomAccess;",
        "Lcom/trendmicro/hippo/ExternalArrayData;"
    }
.end annotation


# static fields
.field private static final Id_BYTES_PER_ELEMENT:I = 0x5

.field private static final Id_constructor:I = 0x1

.field private static final Id_get:I = 0x3

.field private static final Id_length:I = 0x4

.field private static final Id_set:I = 0x4

.field private static final Id_subarray:I = 0x5

.field private static final Id_toString:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x5

.field protected static final MAX_PROTOTYPE_ID:I = 0x6

.field private static final SymbolId_iterator:I = 0x6


# instance fields
.field protected final length:I


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 43
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-direct {p0}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    .line 45
    return-void
.end method

.method protected constructor <init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;III)V
    .locals 0
    .param p1, "ab"    # Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "byteLen"    # I

    .line 49
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-direct {p0, p1, p2, p4}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V

    .line 50
    iput p3, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    .line 51
    return-void
.end method

.method private js_constructor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Context;",
            "Lcom/trendmicro/hippo/Scriptable;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<",
            "TT;>;"
        }
    .end annotation

    .line 114
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x0

    invoke-static {p3, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 115
    sget-object v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->EMPTY_BUFFER:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    invoke-virtual {p0, v1, v0, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v0

    return-object v0

    .line 118
    :cond_0
    aget-object v1, p3, v0

    .line 119
    .local v1, "arg0":Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 120
    sget-object v2, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->EMPTY_BUFFER:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    invoke-virtual {p0, v2, v0, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v0

    return-object v0

    .line 123
    :cond_1
    instance-of v2, v1, Ljava/lang/Number;

    if-nez v2, :cond_13

    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_2

    goto/16 :goto_6

    .line 130
    :cond_2
    instance-of v2, v1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    if-eqz v2, :cond_4

    .line 132
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    .line 133
    .local v2, "src":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v3, v2, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v4

    mul-int/2addr v3, v4

    invoke-direct {p0, p1, p2, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->makeArrayBuffer(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    move-result-object v3

    .line 134
    .local v3, "na":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    iget v4, v2, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    invoke-virtual {p0, v3, v0, v4}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v0

    .line 136
    .local v0, "v":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget v5, v2, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v4, v5, :cond_3

    .line 137
    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 136
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 139
    .end local v4    # "i":I
    :cond_3
    return-object v0

    .line 142
    .end local v0    # "v":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .end local v2    # "src":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .end local v3    # "na":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    :cond_4
    instance-of v2, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    if-eqz v2, :cond_b

    .line 144
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    .line 145
    .local v2, "na":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    const/4 v3, 0x1

    invoke-static {p3, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_5

    aget-object v0, p3, v3

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    .line 148
    .local v0, "byteOff":I
    :cond_5
    const/4 v3, 0x2

    invoke-static {p3, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 149
    aget-object v3, p3, v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v4

    mul-int/2addr v3, v4

    .local v3, "byteLen":I
    goto :goto_1

    .line 151
    .end local v3    # "byteLen":I
    :cond_6
    invoke-virtual {v2}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->getLength()I

    move-result v3

    sub-int/2addr v3, v0

    .line 154
    .restart local v3    # "byteLen":I
    :goto_1
    const-string v4, "RangeError"

    if-ltz v0, :cond_a

    iget-object v5, v2, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    array-length v5, v5

    if-gt v0, v5, :cond_a

    .line 157
    if-ltz v3, :cond_9

    add-int v5, v0, v3

    iget-object v6, v2, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    array-length v6, v6

    if-gt v5, v6, :cond_9

    .line 160
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v5

    rem-int v5, v0, v5

    if-nez v5, :cond_8

    .line 163
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v5

    rem-int v5, v3, v5

    if-nez v5, :cond_7

    .line 167
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v4

    div-int v4, v3, v4

    invoke-virtual {p0, v2, v0, v4}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v4

    return-object v4

    .line 164
    :cond_7
    const-string v5, "offset and buffer must be a multiple of the byte size"

    invoke-static {v4, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v4

    throw v4

    .line 161
    :cond_8
    const-string v5, "offset must be a multiple of the byte size"

    invoke-static {v4, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v4

    throw v4

    .line 158
    :cond_9
    const-string v5, "length out of range"

    invoke-static {v4, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v4

    throw v4

    .line 155
    :cond_a
    const-string v5, "offset out of range"

    invoke-static {v4, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v4

    throw v4

    .line 170
    .end local v0    # "byteOff":I
    .end local v2    # "na":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .end local v3    # "byteLen":I
    :cond_b
    instance-of v2, v1, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v2, :cond_10

    .line 172
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/NativeArray;

    .line 174
    .local v2, "array":Lcom/trendmicro/hippo/NativeArray;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/NativeArray;->size()I

    move-result v3

    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v4

    mul-int/2addr v3, v4

    invoke-direct {p0, p1, p2, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->makeArrayBuffer(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    move-result-object v3

    .line 175
    .local v3, "na":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/NativeArray;->size()I

    move-result v4

    invoke-virtual {p0, v3, v0, v4}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v0

    .line 176
    .local v0, "v":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_2
    invoke-virtual {v2}, Lcom/trendmicro/hippo/NativeArray;->size()I

    move-result v5

    if-ge v4, v5, :cond_f

    .line 179
    invoke-virtual {v2, v4, v2}, Lcom/trendmicro/hippo/NativeArray;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    .line 180
    .local v5, "value":Ljava/lang/Object;
    sget-object v6, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v5, v6, :cond_e

    sget-object v6, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v5, v6, :cond_c

    goto :goto_3

    .line 183
    :cond_c
    instance-of v6, v5, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v6, :cond_d

    .line 184
    move-object v6, v5

    check-cast v6, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v6}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v0, v4, v6}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 187
    :cond_d
    invoke-virtual {v0, v4, v5}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 181
    :cond_e
    :goto_3
    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v0, v4, v6}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 176
    .end local v5    # "value":Ljava/lang/Object;
    :goto_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 190
    .end local v4    # "i":I
    :cond_f
    return-object v0

    .line 193
    .end local v0    # "v":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .end local v2    # "array":Lcom/trendmicro/hippo/NativeArray;
    .end local v3    # "na":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    :cond_10
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->isArrayObject(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 195
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->getArrayElements(Lcom/trendmicro/hippo/Scriptable;)[Ljava/lang/Object;

    move-result-object v2

    .line 197
    .local v2, "arrayElements":[Ljava/lang/Object;
    array-length v3, v2

    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v4

    mul-int/2addr v3, v4

    invoke-direct {p0, p1, p2, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->makeArrayBuffer(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    move-result-object v3

    .line 198
    .restart local v3    # "na":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    array-length v4, v2

    invoke-virtual {p0, v3, v0, v4}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v0

    .line 199
    .restart local v0    # "v":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_5
    array-length v5, v2

    if-ge v4, v5, :cond_11

    .line 200
    aget-object v5, v2, v4

    invoke-virtual {v0, v4, v5}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 199
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 202
    .end local v4    # "i":I
    :cond_11
    return-object v0

    .line 204
    .end local v0    # "v":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .end local v2    # "arrayElements":[Ljava/lang/Object;
    .end local v3    # "na":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    :cond_12
    const-string v0, "Error"

    const-string v2, "invalid argument"

    invoke-static {v0, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 125
    :cond_13
    :goto_6
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v2

    .line 126
    .local v2, "length":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v3

    mul-int/2addr v3, v2

    invoke-direct {p0, p1, p2, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->makeArrayBuffer(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    move-result-object v3

    .line 127
    .local v3, "buffer":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    invoke-virtual {p0, v3, v0, v2}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v0

    return-object v0
.end method

.method private js_subarray(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;II)Ljava/lang/Object;
    .locals 8
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "s"    # I
    .param p4, "e"    # I

    .line 251
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    if-gez p3, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    add-int/2addr v0, p3

    goto :goto_0

    :cond_0
    move v0, p3

    .line 252
    .local v0, "start":I
    :goto_0
    if-gez p4, :cond_1

    iget v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    add-int/2addr v1, p4

    goto :goto_1

    :cond_1
    move v1, p4

    .line 255
    .local v1, "end":I
    :goto_1
    const/4 v2, 0x0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 256
    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 257
    sub-int v3, v1, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 258
    .local v3, "len":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v4

    mul-int/2addr v4, v0

    iget-object v5, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->getLength()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 260
    .local v4, "byteOff":I
    nop

    .line 261
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getClassName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    aput-object v7, v6, v2

    const/4 v2, 0x1

    .line 262
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    const/4 v2, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    .line 261
    invoke-virtual {p1, p2, v5, v6}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 260
    return-object v2
.end method

.method private makeArrayBuffer(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "length"    # I

    .line 108
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 109
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 108
    const-string v1, "ArrayBuffer"

    invoke-virtual {p1, p2, v1, v0}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    return-object v0
.end method

.method private setRange(Lcom/trendmicro/hippo/NativeArray;I)V
    .locals 3
    .param p1, "a"    # Lcom/trendmicro/hippo/NativeArray;
    .param p2, "off"    # I

    .line 235
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    const-string v1, "RangeError"

    if-gt p2, v0, :cond_2

    .line 238
    invoke-virtual {p1}, Lcom/trendmicro/hippo/NativeArray;->size()I

    move-result v0

    add-int/2addr v0, p2

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-gt v0, v2, :cond_1

    .line 242
    move v0, p2

    .line 243
    .local v0, "pos":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/NativeArray;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 244
    .local v2, "val":Ljava/lang/Object;
    invoke-virtual {p0, v0, v2}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 245
    nop

    .end local v2    # "val":Ljava/lang/Object;
    add-int/lit8 v0, v0, 0x1

    .line 246
    goto :goto_0

    .line 247
    :cond_0
    return-void

    .line 239
    .end local v0    # "pos":I
    :cond_1
    const-string v0, "offset + length out of range"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 236
    :cond_2
    const-string v0, "offset out of range"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private setRange(Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;I)V
    .locals 4
    .param p2, "off"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<",
            "TT;>;I)V"
        }
    .end annotation

    .line 209
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "v":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    const-string v1, "RangeError"

    if-ge p2, v0, :cond_5

    .line 213
    iget v2, p1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    sub-int/2addr v0, p2

    if-gt v2, v0, :cond_4

    .line 217
    iget-object v0, p1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    if-ne v0, v1, :cond_2

    .line 219
    iget v0, p1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    new-array v0, v0, [Ljava/lang/Object;

    .line 220
    .local v0, "tmp":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v1, v2, :cond_0

    .line 221
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    .line 220
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 223
    .end local v1    # "i":I
    :cond_0
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    iget v2, p1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v1, v2, :cond_1

    .line 224
    add-int v2, v1, p2

    aget-object v3, v0, v1

    invoke-virtual {p0, v2, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 223
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 226
    .end local v0    # "tmp":[Ljava/lang/Object;
    .end local v1    # "i":I
    :cond_1
    goto :goto_3

    .line 227
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget v1, p1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v0, v1, :cond_3

    .line 228
    add-int v1, v0, p2

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 227
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 231
    .end local v0    # "i":I
    :cond_3
    :goto_3
    return-void

    .line 214
    :cond_4
    const-string v0, "source array too long"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 210
    :cond_5
    const-string v0, "offset out of range"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .line 659
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .local p2, "aByte":Ljava/lang/Object;, "TT;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 652
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "aByte":Ljava/lang/Object;, "TT;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection<",
            "+TT;>;)Z"
        }
    .end annotation

    .line 673
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .local p2, "bytes":Ljava/util/Collection;, "Ljava/util/Collection<+TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+TT;>;)Z"
        }
    .end annotation

    .line 666
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "bytes":Ljava/util/Collection;, "Ljava/util/Collection<+TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected checkIndex(I)Z
    .locals 1
    .param p1, "index"    # I

    .line 92
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    if-ltz p1, :cond_1

    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-lt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public clear()V
    .locals 1

    .line 680
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected abstract construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;",
            "II)",
            "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<",
            "TT;>;"
        }
    .end annotation
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 516
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 523
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "objects":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 524
    .local v1, "o":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 525
    const/4 v0, 0x0

    return v0

    .line 527
    .end local v1    # "o":Ljava/lang/Object;
    :cond_0
    goto :goto_0

    .line 528
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public delete(I)V
    .locals 0
    .param p1, "index"    # I

    .line 76
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 592
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x0

    :try_start_0
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    .line 593
    .local v1, "v":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    iget v3, v1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-eq v2, v3, :cond_0

    .line 594
    return v0

    .line 596
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v2, v3, :cond_2

    .line 597
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v3, :cond_1

    .line 598
    return v0

    .line 596
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 601
    .end local v2    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0

    .line 602
    .end local v1    # "v":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    :catch_0
    move-exception v1

    .line 603
    .local v1, "cce":Ljava/lang/ClassCastException;
    return v0
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 271
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 272
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 274
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 275
    .local v0, "id":I
    const-string v1, "invalid arguments"

    const-string v2, "Error"

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    .line 333
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 331
    :pswitch_0
    new-instance v1, Lcom/trendmicro/hippo/NativeArrayIterator;

    sget-object v2, Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;->VALUES:Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;

    invoke-direct {v1, p3, p4, v2}, Lcom/trendmicro/hippo/NativeArrayIterator;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeArrayIterator$ARRAY_ITERATOR_TYPE;)V

    return-object v1

    .line 322
    :pswitch_1
    array-length v5, p5

    if-lez v5, :cond_2

    .line 323
    invoke-virtual {p0, p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v1

    .line 324
    .local v1, "self":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    aget-object v2, p5, v4

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v2

    .line 325
    .local v2, "start":I
    invoke-static {p5, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v4

    if-eqz v4, :cond_1

    aget-object v3, p5, v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v3

    goto :goto_0

    :cond_1
    iget v3, v1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    .line 326
    .local v3, "end":I
    :goto_0
    invoke-direct {v1, p2, p3, v2, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_subarray(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;II)Ljava/lang/Object;

    move-result-object v4

    return-object v4

    .line 328
    .end local v1    # "self":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .end local v2    # "start":I
    .end local v3    # "end":I
    :cond_2
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 299
    :pswitch_2
    array-length v5, p5

    if-lez v5, :cond_8

    .line 300
    invoke-virtual {p0, p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v5

    .line 301
    .local v5, "self":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    aget-object v6, p5, v4

    instance-of v6, v6, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    if-eqz v6, :cond_4

    .line 302
    invoke-static {p5, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_3

    aget-object v1, p5, v3

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    goto :goto_1

    :cond_3
    move v1, v4

    .line 303
    .local v1, "offset":I
    :goto_1
    aget-object v2, p5, v4

    check-cast v2, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    invoke-direct {v5, v2, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->setRange(Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;I)V

    .line 304
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v2

    .line 306
    .end local v1    # "offset":I
    :cond_4
    aget-object v6, p5, v4

    instance-of v6, v6, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v6, :cond_6

    .line 307
    invoke-static {p5, v3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_5

    aget-object v1, p5, v3

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    goto :goto_2

    :cond_5
    move v1, v4

    .line 308
    .restart local v1    # "offset":I
    :goto_2
    aget-object v2, p5, v4

    check-cast v2, Lcom/trendmicro/hippo/NativeArray;

    invoke-direct {v5, v2, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->setRange(Lcom/trendmicro/hippo/NativeArray;I)V

    .line 309
    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v2

    .line 311
    .end local v1    # "offset":I
    :cond_6
    aget-object v6, p5, v4

    instance-of v6, v6, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v6, :cond_7

    .line 313
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1

    .line 315
    :cond_7
    const/4 v6, 0x2

    invoke-static {p5, v6}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->isArg([Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 316
    aget-object v1, p5, v4

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    aget-object v2, p5, v3

    invoke-virtual {v5, v1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 319
    .end local v5    # "self":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    :cond_8
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 293
    :pswitch_3
    array-length v3, p5

    if-lez v3, :cond_9

    .line 294
    invoke-virtual {p0, p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v1

    aget-object v2, p5, v4

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 296
    :cond_9
    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 280
    :pswitch_4
    invoke-virtual {p0, p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v1

    .line 281
    .local v1, "realThis":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getArrayLength()I

    move-result v2

    .line 282
    .local v2, "arrayLength":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 283
    .local v3, "builder":Ljava/lang/StringBuilder;
    if-lez v2, :cond_a

    .line 284
    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    :cond_a
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_3
    if-ge v4, v2, :cond_b

    .line 287
    const/16 v5, 0x2c

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 288
    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 290
    .end local v4    # "i":I
    :cond_b
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 277
    .end local v1    # "realThis":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .end local v2    # "arrayLength":I
    .end local v3    # "builder":Ljava/lang/StringBuilder;
    :pswitch_5
    invoke-direct {p0, p2, p3, p5}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_constructor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 2
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 412
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "BYTES_PER_ELEMENT"

    invoke-virtual {p1, v1, p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 413
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 453
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 454
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 455
    .local v2, "s_length":I
    const/4 v3, 0x6

    if-ne v2, v3, :cond_0

    const-string v1, "length"

    const/4 v0, 0x4

    goto :goto_0

    .line 456
    :cond_0
    const/16 v3, 0x11

    if-ne v2, v3, :cond_1

    const-string v1, "BYTES_PER_ELEMENT"

    const/4 v0, 0x5

    .line 457
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    if-eq v1, p1, :cond_2

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v0, 0x0

    .line 461
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_2
    if-nez v0, :cond_3

    .line 462
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 464
    :cond_3
    const/4 v1, 0x5

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->instanceIdInfo(II)I

    move-result v1

    return v1
.end method

.method protected findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "k"    # Lcom/trendmicro/hippo/Symbol;

    .line 360
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 361
    const/4 v0, 0x6

    return v0

    .line 363
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 10
    .param p1, "s"    # Ljava/lang/String;

    .line 373
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 374
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 375
    .local v2, "s_length":I
    const/16 v3, 0x73

    const/4 v4, 0x0

    const/16 v5, 0x74

    const/4 v6, 0x3

    if-ne v2, v6, :cond_1

    .line 376
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 377
    .local v4, "c":I
    const/16 v6, 0x67

    const/16 v7, 0x65

    const/4 v8, 0x1

    const/4 v9, 0x2

    if-ne v4, v6, :cond_0

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_4

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_4

    const/4 v0, 0x3

    goto :goto_1

    .line 378
    :cond_0
    if-ne v4, v3, :cond_4

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_4

    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_4

    const/4 v0, 0x4

    goto :goto_1

    .line 380
    .end local v4    # "c":I
    :cond_1
    const/16 v6, 0x8

    if-ne v2, v6, :cond_3

    .line 381
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 382
    .restart local v4    # "c":I
    if-ne v4, v3, :cond_2

    const-string v1, "subarray"

    const/4 v0, 0x5

    goto :goto_0

    .line 383
    :cond_2
    if-ne v4, v5, :cond_4

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 385
    .end local v4    # "c":I
    :cond_3
    const/16 v3, 0xb

    if-ne v2, v3, :cond_4

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 386
    :cond_4
    :goto_0
    if-eqz v1, :cond_5

    if-eq v1, p1, :cond_5

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const/4 v0, 0x0

    .line 390
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_5
    :goto_1
    return v0
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 58
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getArrayElement(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .line 482
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getArrayLength()I
    .locals 1

    .line 493
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    return v0
.end method

.method public abstract getBytesPerElement()I
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 3

    .line 81
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    new-array v0, v0, [Ljava/lang/Object;

    .line 82
    .local v0, "ret":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v1, v2, :cond_0

    .line 83
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 82
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 85
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .line 426
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 429
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 428
    :cond_0
    const-string v0, "BYTES_PER_ELEMENT"

    return-object v0

    .line 427
    :cond_1
    const-string v0, "length"

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I

    .line 436
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 442
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 440
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getBytesPerElement()I

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 438
    :cond_1
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 420
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x5

    return v0
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 64
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->checkIndex(I)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 610
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x0

    .line 611
    .local v0, "hc":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v1, v2, :cond_0

    .line 612
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 611
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 614
    .end local v1    # "i":I
    :cond_0
    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .line 535
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v0, v1, :cond_1

    .line 536
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 537
    return v0

    .line 535
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 540
    .end local v0    # "i":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 13
    .param p1, "id"    # I

    .line 339
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    const/4 v0, 0x6

    if-ne p1, v0, :cond_0

    .line 340
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getClassName()Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    const/4 v6, 0x0

    const-string v5, "[Symbol.iterator]"

    move-object v1, p0

    move v3, p1

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->initPrototypeMethod(Ljava/lang/Object;ILcom/trendmicro/hippo/Symbol;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 341
    return-void

    .line 344
    :cond_0
    const/4 v0, 0x0

    .line 346
    .local v0, "fnName":Ljava/lang/String;
    const/4 v1, 0x1

    if-eq p1, v1, :cond_5

    const/4 v1, 0x2

    if-eq p1, v1, :cond_4

    const/4 v1, 0x3

    if-eq p1, v1, :cond_3

    const/4 v1, 0x4

    if-eq p1, v1, :cond_2

    const/4 v1, 0x5

    if-ne p1, v1, :cond_1

    .line 351
    const/4 v1, 0x2

    .local v1, "arity":I
    const-string v2, "subarray"

    .local v2, "s":Ljava/lang/String;
    goto :goto_0

    .line 352
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 350
    :cond_2
    const/4 v1, 0x2

    .restart local v1    # "arity":I
    const-string v2, "set"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 349
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_3
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "get"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 348
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_4
    const/4 v1, 0x0

    .restart local v1    # "arity":I
    const-string v2, "toString"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_0

    .line 347
    .end local v1    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :cond_5
    const/4 v1, 0x1

    .restart local v1    # "arity":I
    const-string v2, "constructor"

    .line 354
    .restart local v2    # "s":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->getClassName()Ljava/lang/String;

    move-result-object v8

    move-object v7, p0

    move v9, p1

    move-object v10, v2

    move-object v11, v0

    move v12, v1

    invoke-virtual/range {v7 .. v12}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 355
    return-void
.end method

.method public isEmpty()Z
    .locals 1

    .line 509
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 621
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;I)V

    return-object v0
.end method

.method protected abstract js_get(I)Ljava/lang/Object;
.end method

.method protected abstract js_set(ILjava/lang/Object;)Ljava/lang/Object;
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .line 547
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 548
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 549
    return v0

    .line 547
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 552
    .end local v0    # "i":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator<",
            "TT;>;"
        }
    .end annotation

    .line 628
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;I)V

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .locals 1
    .param p1, "start"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator<",
            "TT;>;"
        }
    .end annotation

    .line 635
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->checkIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 638
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;

    invoke-direct {v0, p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;I)V

    return-object v0

    .line 636
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "val"    # Ljava/lang/Object;

    .line 70
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1, p3}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 71
    return-void
.end method

.method protected abstract realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Scriptable;",
            "Lcom/trendmicro/hippo/IdFunctionObject;",
            ")",
            "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<",
            "TT;>;"
        }
    .end annotation
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 687
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 694
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 701
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "objects":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 708
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "objects":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setArrayElement(ILjava/lang/Object;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 488
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 489
    return-void
.end method

.method public size()I
    .locals 1

    .line 502
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .locals 1
    .param p1, "i"    # I
    .param p2, "i2"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 645
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 3

    .line 559
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    new-array v0, v0, [Ljava/lang/Object;

    .line 560
    .local v0, "a":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v1, v2, :cond_0

    .line 561
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    .line 560
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 563
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">([TU;)[TU;"
        }
    .end annotation

    .line 572
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    .local p1, "ts":[Ljava/lang/Object;, "[TU;"
    array-length v0, p1

    iget v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-lt v0, v1, :cond_0

    .line 573
    move-object v0, p1

    .local v0, "a":[Ljava/lang/Object;, "[TU;"
    goto :goto_0

    .line 575
    .end local v0    # "a":[Ljava/lang/Object;, "[TU;"
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    iget v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 578
    .restart local v0    # "a":[Ljava/lang/Object;, "[TU;"
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v1, v2, :cond_1

    .line 580
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 583
    nop

    .line 578
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 581
    :catch_0
    move-exception v2

    .line 582
    .local v2, "cce":Ljava/lang/ClassCastException;
    new-instance v3, Ljava/lang/ArrayStoreException;

    invoke-direct {v3}, Ljava/lang/ArrayStoreException;-><init>()V

    throw v3

    .line 585
    .end local v1    # "i":I
    .end local v2    # "cce":Ljava/lang/ClassCastException;
    :cond_1
    return-object v0
.end method
