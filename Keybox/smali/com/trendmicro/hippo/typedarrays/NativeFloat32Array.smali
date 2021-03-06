.class public Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;
.super Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
.source "NativeFloat32Array.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# static fields
.field private static final BYTES_PER_ELEMENT:I = 0x4

.field private static final CLASS_NAME:Ljava/lang/String; = "Float32Array"

.field private static final serialVersionUID:J = -0x7c649d0bb32e7e0cL


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

    mul-int/lit8 v1, p1, 0x4

    int-to-double v1, v1

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;-><init>(D)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V
    .locals 1
    .param p1, "ab"    # Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 34
    mul-int/lit8 v0, p3, 0x4

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
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;

    invoke-direct {v0}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;-><init>()V

    .line 51
    .local v0, "a":Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;
    const/4 v1, 0x6

    invoke-virtual {v0, v1, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 52
    return-void
.end method


# virtual methods
.method protected construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;
    .locals 1
    .param p1, "ab"    # Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 57
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;

    invoke-direct {v0, p1, p2, p3}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;-><init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V

    return-object v0
.end method

.method protected bridge synthetic construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .locals 0

    .line 20
    invoke-virtual {p0, p1, p2, p3}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->construct(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;

    move-result-object p1

    return-object p1
.end method

.method public get(I)Ljava/lang/Float;
    .locals 1
    .param p1, "i"    # I

    .line 98
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->checkIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->js_get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0

    .line 99
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 0

    .line 20
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->get(I)Ljava/lang/Float;

    move-result-object p1

    return-object p1
.end method

.method public getBytesPerElement()I
    .locals 1

    .line 63
    const/4 v0, 0x4

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 45
    const-string v0, "Float32Array"

    return-object v0
.end method

.method protected js_get(I)Ljava/lang/Object;
    .locals 3
    .param p1, "index"    # I

    .line 78
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->checkIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v0, v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    mul-int/lit8 v1, p1, 0x4

    iget v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->offset:I

    add-int/2addr v1, v2

    invoke-static {}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->useLittleEndian()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readFloat32([BIZ)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected js_set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "index"    # I
    .param p2, "c"    # Ljava/lang/Object;

    .line 87
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->checkIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 90
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 91
    .local v0, "val":D
    iget-object v2, p0, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    mul-int/lit8 v3, p1, 0x4

    iget v4, p0, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->offset:I

    add-int/2addr v3, v4

    invoke-static {}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->useLittleEndian()Z

    move-result v4

    invoke-static {v2, v3, v0, v1, v4}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeFloat32([BIDZ)V

    .line 92
    const/4 v2, 0x0

    return-object v2
.end method

.method protected realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;
    .locals 1
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 69
    instance-of v0, p1, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;

    if-eqz v0, :cond_0

    .line 72
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;

    return-object v0

    .line 70
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method protected bridge synthetic realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .locals 0

    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;

    move-result-object p1

    return-object p1
.end method

.method public set(ILjava/lang/Float;)Ljava/lang/Float;
    .locals 1
    .param p1, "i"    # I
    .param p2, "aByte"    # Ljava/lang/Float;

    .line 107
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->checkIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 110
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0

    .line 108
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 20
    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeFloat32Array;->set(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    return-object p1
.end method
