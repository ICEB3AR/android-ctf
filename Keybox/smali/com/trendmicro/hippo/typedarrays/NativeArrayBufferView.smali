.class public abstract Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeArrayBufferView.java"


# static fields
.field private static final Id_buffer:I = 0x1

.field private static final Id_byteLength:I = 0x3

.field private static final Id_byteOffset:I = 0x2

.field protected static final MAX_INSTANCE_ID:I = 0x3

.field private static final serialVersionUID:J = 0x5f8a921134035913L

.field private static useLittleEndian:Ljava/lang/Boolean;


# instance fields
.field protected final arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

.field protected final byteLength:I

.field protected final offset:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    const/4 v0, 0x0

    sput-object v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->useLittleEndian:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 35
    sget-object v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;->EMPTY_BUFFER:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    iput-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->offset:I

    .line 37
    iput v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->byteLength:I

    .line 38
    return-void
.end method

.method protected constructor <init>(Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;II)V
    .locals 0
    .param p1, "ab"    # Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .param p2, "offset"    # I
    .param p3, "byteLength"    # I

    .line 41
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 42
    iput p2, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->offset:I

    .line 43
    iput p3, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->byteLength:I

    .line 44
    iput-object p1, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    .line 45
    return-void
.end method

.method protected static isArg([Ljava/lang/Object;I)Z
    .locals 2
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "i"    # I

    .line 82
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

.method protected static useLittleEndian()Z
    .locals 2

    .line 69
    sget-object v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->useLittleEndian:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    .line 70
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getCurrentContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 72
    .local v0, "ctx":Lcom/trendmicro/hippo/Context;
    if-nez v0, :cond_0

    .line 73
    const/4 v1, 0x0

    return v1

    .line 75
    :cond_0
    const/16 v1, 0x13

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->useLittleEndian:Ljava/lang/Boolean;

    .line 77
    .end local v0    # "ctx":Lcom/trendmicro/hippo/Context;
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->useLittleEndian:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method


# virtual methods
.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 126
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 127
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 128
    .local v2, "s_length":I
    const/4 v3, 0x6

    if-ne v2, v3, :cond_0

    const-string v1, "buffer"

    const/4 v0, 0x1

    goto :goto_0

    .line 129
    :cond_0
    const/16 v3, 0xa

    if-ne v2, v3, :cond_2

    .line 130
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 131
    .local v3, "c":I
    const/16 v4, 0x4c

    if-ne v3, v4, :cond_1

    const-string v1, "byteLength"

    const/4 v0, 0x3

    goto :goto_0

    .line 132
    :cond_1
    const/16 v4, 0x4f

    if-ne v3, v4, :cond_2

    const-string v1, "byteOffset"

    const/4 v0, 0x2

    .line 134
    .end local v3    # "c":I
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 138
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_3
    if-nez v0, :cond_4

    .line 139
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 141
    :cond_4
    const/4 v1, 0x5

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->instanceIdInfo(II)I

    move-result v1

    return v1
.end method

.method public getBuffer()Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    return-object v0
.end method

.method public getByteLength()I
    .locals 1

    .line 65
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->byteLength:I

    return v0
.end method

.method public getByteOffset()I
    .locals 1

    .line 58
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->offset:I

    return v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .line 96
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 100
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 99
    :cond_0
    const-string v0, "byteLength"

    return-object v0

    .line 98
    :cond_1
    const-string v0, "byteOffset"

    return-object v0

    .line 97
    :cond_2
    const-string v0, "buffer"

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I

    .line 107
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 115
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 113
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->byteLength:I

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 111
    :cond_1
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->offset:I

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 109
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeArrayBufferView;->arrayBuffer:Lcom/trendmicro/hippo/typedarrays/NativeArrayBuffer;

    return-object v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 90
    const/4 v0, 0x3

    return v0
.end method
