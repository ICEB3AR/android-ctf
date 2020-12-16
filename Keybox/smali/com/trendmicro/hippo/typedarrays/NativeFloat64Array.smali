.class public Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;
.super Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
.source "NativeFloat64Array.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<",
        "Ljava/lang/Double;",
        ">;"
    }
.end annotation


# static fields
.field private static final BYTES_PER_ELEMENT:I = 0x8

.field private static final CLASS_NAME:Ljava/lang/String; = "Float64Array"

.field private static final serialVersionUID:J = -0x116c18c98c4965e7L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1, "len"    # I

    .line 39
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    mul-int/lit8 v1, p1, 0x8

    int-to-double v1, v1

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;-><init>(D)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V
    .locals 1
    .param p1, "ab"    # Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 34
    mul-int/lit8 v0, p3, 0x8

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;III)V

    .line 35
    return-void
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 50
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;

    invoke-direct {v0}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;-><init>()V

    .line 51
    .local v0, "a":Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;
    const/4 v1, 0x6

    invoke-virtual {v0, v1, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 52
    return-void
.end method


# virtual methods
.method protected construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;
    .locals 1
    .param p1, "ab"    # Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 57
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;

    invoke-direct {v0, p1, p2, p3}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V

    return-object v0
.end method

.method protected bridge synthetic construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .locals 0

    .line 20
    invoke-virtual {p0, p1, p2, p3}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;

    move-result-object p1

    return-object p1
.end method

.method public get(I)Ljava/lang/Double;
    .locals 1
    .param p1, "i"    # I

    .line 100
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->checkIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 103
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->js_get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    return-object v0

    .line 101
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 20
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->get(I)Ljava/lang/Double;

    move-result-object p1

    return-object p1
.end method

.method public getBytesPerElement()I
    .locals 1

    .line 63
    const/16 v0, 0x8

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 45
    const-string v0, "Float64Array"

    return-object v0
.end method

.method protected js_get(I)Ljava/lang/Object;
    .locals 4
    .param p1, "index"    # I

    .line 78
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->checkIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v0, v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    mul-int/lit8 v1, p1, 0x8

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->offset:I

    add-int/2addr v1, v2

    invoke-static {}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->useLittleEndian()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readUint64Primitive([BIZ)J

    move-result-wide v0

    .line 82
    .local v0, "base":J
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    return-object v2
.end method

.method protected js_set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "index"    # I
    .param p2, "c"    # Ljava/lang/Object;

    .line 88
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->checkIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 91
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 92
    .local v0, "val":D
    invoke-static {v0, v1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    .line 93
    .local v2, "base":J
    iget-object v4, p0, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v4, v4, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    mul-int/lit8 v5, p1, 0x8

    iget v6, p0, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->offset:I

    add-int/2addr v5, v6

    invoke-static {}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->useLittleEndian()Z

    move-result v6

    invoke-static {v4, v5, v2, v3, v6}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeUint64([BIJZ)V

    .line 94
    const/4 v4, 0x0

    return-object v4
.end method

.method protected realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;
    .locals 1
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 69
    instance-of v0, p1, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;

    if-eqz v0, :cond_0

    .line 72
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;

    return-object v0

    .line 70
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method protected bridge synthetic realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .locals 0

    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;

    move-result-object p1

    return-object p1
.end method

.method public set(ILjava/lang/Double;)Ljava/lang/Double;
    .locals 1
    .param p1, "i"    # I
    .param p2, "aByte"    # Ljava/lang/Double;

    .line 109
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->checkIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 112
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    return-object v0

    .line 110
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 20
    check-cast p2, Ljava/lang/Double;

    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat64Array;->set(ILjava/lang/Double;)Ljava/lang/Double;

    move-result-object p1

    return-object p1
.end method
