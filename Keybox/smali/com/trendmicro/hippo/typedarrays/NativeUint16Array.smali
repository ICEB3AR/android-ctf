.class public Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;
.super Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
.source "NativeUint16Array.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final BYTES_PER_ELEMENT:I = 0x2

.field private static final CLASS_NAME:Ljava/lang/String; = "Uint16Array"

.field private static final serialVersionUID:J = 0x6adbf67024cded41L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;-><init>()V

    .line 29
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1, "len"    # I

    .line 38
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    mul-int/lit8 v1, p1, 0x2

    int-to-double v1, v1

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;-><init>(D)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V

    .line 39
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V
    .locals 1
    .param p1, "ab"    # Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 33
    mul-int/lit8 v0, p3, 0x2

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;III)V

    .line 34
    return-void
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 49
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;

    invoke-direct {v0}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;-><init>()V

    .line 50
    .local v0, "a":Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;
    const/4 v1, 0x6

    invoke-virtual {v0, v1, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 51
    return-void
.end method


# virtual methods
.method protected bridge synthetic construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2, p3}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;

    move-result-object p1

    return-object p1
.end method

.method protected construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;
    .locals 1
    .param p1, "ab"    # Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 56
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;

    invoke-direct {v0, p1, p2, p3}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V

    return-object v0
.end method

.method public get(I)Ljava/lang/Integer;
    .locals 1
    .param p1, "i"    # I

    .line 97
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->checkIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 100
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->js_get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0

    .line 98
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 19
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->get(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getBytesPerElement()I
    .locals 1

    .line 62
    const/4 v0, 0x2

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 44
    const-string v0, "Uint16Array"

    return-object v0
.end method

.method protected js_get(I)Ljava/lang/Object;
    .locals 3
    .param p1, "index"    # I

    .line 77
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->checkIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v0, v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    mul-int/lit8 v1, p1, 0x2

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->offset:I

    add-int/2addr v1, v2

    invoke-static {}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->useLittleEndian()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readUint16([BIZ)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected js_set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "index"    # I
    .param p2, "c"    # Ljava/lang/Object;

    .line 86
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->checkIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 89
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/typedarrays/Conversions;->toUint16(Ljava/lang/Object;)I

    move-result v0

    .line 90
    .local v0, "val":I
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    mul-int/lit8 v2, p1, 0x2

    iget v3, p0, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->offset:I

    add-int/2addr v2, v3

    invoke-static {}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->useLittleEndian()Z

    move-result v3

    invoke-static {v1, v2, v0, v3}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeUint16([BIIZ)V

    .line 91
    const/4 v1, 0x0

    return-object v1
.end method

.method protected bridge synthetic realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .locals 0

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;

    move-result-object p1

    return-object p1
.end method

.method protected realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;
    .locals 1
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 68
    instance-of v0, p1, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;

    if-eqz v0, :cond_0

    .line 71
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;

    return-object v0

    .line 69
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public set(ILjava/lang/Integer;)Ljava/lang/Integer;
    .locals 1
    .param p1, "i"    # I
    .param p2, "aByte"    # Ljava/lang/Integer;

    .line 106
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->checkIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0

    .line 107
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeUint16Array;->set(ILjava/lang/Integer;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
