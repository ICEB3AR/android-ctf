.class public Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeArrayBuffer.java"


# static fields
.field public static final CLASS_NAME:Ljava/lang/String; = "ArrayBuffer"

.field private static final ConstructorId_isView:I = -0x1

.field private static final EMPTY_BUF:[B

.field public static final EMPTY_BUFFER:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

.field private static final Id_byteLength:I = 0x1

.field private static final Id_constructor:I = 0x1

.field private static final Id_slice:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x1

.field private static final MAX_PROTOTYPE_ID:I = 0x2

.field private static final serialVersionUID:J = 0x2b2a67072621073dL


# instance fields
.field final buffer:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->EMPTY_BUF:[B

    .line 30
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    invoke-direct {v0}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->EMPTY_BUFFER:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 51
    sget-object v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->EMPTY_BUF:[B

    iput-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    .line 52
    return-void
.end method

.method public constructor <init>(D)V
    .locals 4
    .param p1, "len"    # D

    .line 58
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 59
    const-wide v0, 0x41dfffffffc00000L    # 2.147483647E9

    cmpl-double v0, p1, v0

    const-string v1, "RangeError"

    if-gez v0, :cond_3

    .line 62
    const-wide/high16 v2, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v0, p1, v2

    const-string v2, "Negative array length "

    if-eqz v0, :cond_2

    .line 66
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v0

    .line 67
    .local v0, "intLen":I
    if-ltz v0, :cond_1

    .line 70
    if-nez v0, :cond_0

    .line 71
    sget-object v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->EMPTY_BUF:[B

    iput-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    goto :goto_0

    .line 73
    :cond_0
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    .line 75
    :goto_0
    return-void

    .line 68
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    .line 63
    .end local v0    # "intLen":I
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 60
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "length parameter ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, ") is too large "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 42
    new-instance v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    invoke-direct {v0}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;-><init>()V

    .line 43
    .local v0, "na":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1, p2}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 44
    return-void
.end method

.method private static isArg([Ljava/lang/Object;I)Z
    .locals 2
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "i"    # I

    .line 153
    array-length v0, p0

    if-le v0, p1, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p0, p1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .locals 1
    .param p0, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 146
    instance-of v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    if-eqz v0, :cond_0

    .line 148
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    return-object v0

    .line 147
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 123
    const-string v0, "ArrayBuffer"

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 124
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 126
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 127
    .local v0, "id":I
    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_6

    const-wide/16 v4, 0x0

    if-eq v0, v2, :cond_4

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 136
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    move-result-object v1

    .line 137
    .local v1, "self":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    invoke-static {p5, v3}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->isArg([Ljava/lang/Object;I)Z

    move-result v6

    if-eqz v6, :cond_1

    aget-object v3, p5, v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v4

    :cond_1
    move-wide v3, v4

    .line 138
    .local v3, "start":D
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->isArg([Ljava/lang/Object;I)Z

    move-result v5

    if-eqz v5, :cond_2

    aget-object v2, p5, v2

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v5

    goto :goto_0

    :cond_2
    iget-object v2, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    array-length v2, v2

    int-to-double v5, v2

    .line 139
    .local v5, "end":D
    :goto_0
    invoke-virtual {v1, v3, v4, v5, v6}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->slice(DD)Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    move-result-object v2

    return-object v2

    .line 141
    .end local v1    # "self":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .end local v3    # "start":D
    .end local v5    # "end":D
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 132
    :cond_4
    invoke-static {p5, v3}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->isArg([Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_5

    aget-object v1, p5, v3

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v4

    :cond_5
    move-wide v1, v4

    .line 133
    .local v1, "length":D
    new-instance v3, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    invoke-direct {v3, v1, v2}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;-><init>(D)V

    return-object v3

    .line 129
    .end local v1    # "length":D
    :cond_6
    invoke-static {p5, v3}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->isArg([Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_7

    aget-object v1, p5, v3

    instance-of v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;

    if-eqz v1, :cond_7

    goto :goto_1

    :cond_7
    move v2, v3

    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 6
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 202
    const-string v2, "ArrayBuffer"

    const/4 v3, -0x1

    const-string v4, "isView"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 203
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 232
    const-string v0, "byteLength"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 233
    const/4 v0, 0x5

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->instanceIdInfo(II)I

    move-result v0

    return v0

    .line 235
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 176
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 177
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 178
    .local v2, "s_length":I
    const/4 v3, 0x5

    if-ne v2, v3, :cond_0

    const-string v1, "slice"

    const/4 v0, 0x2

    goto :goto_0

    .line 179
    :cond_0
    const/16 v3, 0xb

    if-ne v2, v3, :cond_1

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 180
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    if-eq v1, p1, :cond_2

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v0, 0x0

    .line 184
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_2
    return v0
.end method

.method public getBuffer()[B
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 37
    const-string v0, "ArrayBuffer"

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .line 216
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    const-string v0, "byteLength"

    return-object v0

    .line 217
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I

    .line 223
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 224
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    array-length v0, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 226
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    array-length v0, v0

    return v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 210
    const/4 v0, 0x1

    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 161
    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 163
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "slice"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 164
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 162
    :cond_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 166
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    const-string v2, "ArrayBuffer"

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 167
    return-void
.end method

.method public slice(DD)Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .locals 7
    .param p1, "s"    # D
    .param p3, "e"    # D

    .line 108
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    array-length v1, v0

    int-to-double v1, v1

    const-wide/16 v3, 0x0

    cmpg-double v5, p3, v3

    if-gez v5, :cond_0

    array-length v0, v0

    int-to-double v5, v0

    add-double/2addr v5, p3

    goto :goto_0

    :cond_0
    move-wide v5, p3

    :goto_0
    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v0

    .line 109
    .local v0, "end":I
    int-to-double v1, v0

    cmpg-double v5, p1, v3

    if-gez v5, :cond_1

    iget-object v5, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    array-length v5, v5

    int-to-double v5, v5

    add-double/2addr v5, p1

    goto :goto_1

    :cond_1
    move-wide v5, p1

    :goto_1
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(DD)D

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v1

    .line 110
    .local v1, "start":I
    sub-int v2, v0, v1

    .line 112
    .local v2, "len":I
    new-instance v3, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    int-to-double v4, v2

    invoke-direct {v3, v4, v5}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;-><init>(D)V

    .line 113
    .local v3, "newBuf":Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    iget-object v4, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    iget-object v5, v3, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->buffer:[B

    const/4 v6, 0x0

    invoke-static {v4, v1, v5, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    return-object v3
.end method
