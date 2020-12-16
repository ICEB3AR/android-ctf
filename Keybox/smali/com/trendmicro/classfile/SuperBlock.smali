.class final Lcom/trendmicro/classfile/SuperBlock;
.super Ljava/lang/Object;
.source "SuperBlock.java"


# instance fields
.field private end:I

.field private index:I

.field private isInQueue:Z

.field private isInitialized:Z

.field private locals:[I

.field private stack:[I

.field private start:I


# direct methods
.method constructor <init>(III[I)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p4, "initialLocals"    # [I

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lcom/trendmicro/classfile/SuperBlock;->index:I

    .line 19
    iput p2, p0, Lcom/trendmicro/classfile/SuperBlock;->start:I

    .line 20
    iput p3, p0, Lcom/trendmicro/classfile/SuperBlock;->end:I

    .line 21
    array-length v0, p4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/trendmicro/classfile/SuperBlock;->locals:[I

    .line 22
    array-length v1, p4

    const/4 v2, 0x0

    invoke-static {p4, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 23
    new-array v0, v2, [I

    iput-object v0, p0, Lcom/trendmicro/classfile/SuperBlock;->stack:[I

    .line 24
    iput-boolean v2, p0, Lcom/trendmicro/classfile/SuperBlock;->isInitialized:Z

    .line 25
    iput-boolean v2, p0, Lcom/trendmicro/classfile/SuperBlock;->isInQueue:Z

    .line 26
    return-void
.end method

.method private mergeState([I[IILcom/trendmicro/classfile/ConstantPool;)Z
    .locals 5
    .param p1, "current"    # [I
    .param p2, "incoming"    # [I
    .param p3, "size"    # I
    .param p4, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 115
    const/4 v0, 0x0

    .line 116
    .local v0, "changed":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p3, :cond_1

    .line 117
    aget v2, p1, v1

    .line 119
    .local v2, "currentType":I
    aget v3, p1, v1

    aget v4, p2, v1

    invoke-static {v3, v4, p4}, Lcom/trendmicro/classfile/TypeInfo;->merge(IILcom/trendmicro/classfile/ConstantPool;)I

    move-result v3

    aput v3, p1, v1

    .line 120
    aget v3, p1, v1

    if-eq v2, v3, :cond_0

    .line 121
    const/4 v0, 0x1

    .line 116
    .end local v2    # "currentType":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 124
    .end local v1    # "i":I
    :cond_1
    return v0
.end method


# virtual methods
.method getEnd()I
    .locals 1

    .line 132
    iget v0, p0, Lcom/trendmicro/classfile/SuperBlock;->end:I

    return v0
.end method

.method getIndex()I
    .locals 1

    .line 29
    iget v0, p0, Lcom/trendmicro/classfile/SuperBlock;->index:I

    return v0
.end method

.method getLocals()[I
    .locals 4

    .line 33
    iget-object v0, p0, Lcom/trendmicro/classfile/SuperBlock;->locals:[I

    array-length v1, v0

    new-array v1, v1, [I

    .line 34
    .local v1, "copy":[I
    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    return-object v1
.end method

.method getStack()[I
    .locals 4

    .line 73
    iget-object v0, p0, Lcom/trendmicro/classfile/SuperBlock;->stack:[I

    array-length v1, v0

    new-array v1, v1, [I

    .line 74
    .local v1, "copy":[I
    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    return-object v1
.end method

.method getStart()I
    .locals 1

    .line 128
    iget v0, p0, Lcom/trendmicro/classfile/SuperBlock;->start:I

    return v0
.end method

.method getTrimmedLocals()[I
    .locals 7

    .line 48
    iget-object v0, p0, Lcom/trendmicro/classfile/SuperBlock;->locals:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    .line 50
    .local v0, "last":I
    :goto_0
    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/trendmicro/classfile/SuperBlock;->locals:[I

    aget v2, v1, v0

    if-nez v2, :cond_0

    add-int/lit8 v2, v0, -0x1

    aget v1, v1, v2

    .line 51
    invoke-static {v1}, Lcom/trendmicro/classfile/TypeInfo;->isTwoWords(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 52
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 54
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 56
    move v1, v0

    .line 57
    .local v1, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v0, :cond_2

    .line 58
    iget-object v3, p0, Lcom/trendmicro/classfile/SuperBlock;->locals:[I

    aget v3, v3, v2

    invoke-static {v3}, Lcom/trendmicro/classfile/TypeInfo;->isTwoWords(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 59
    add-int/lit8 v1, v1, -0x1

    .line 57
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 62
    .end local v2    # "i":I
    :cond_2
    new-array v2, v1, [I

    .line 63
    .local v2, "copy":[I
    const/4 v3, 0x0

    .local v3, "i":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_2
    if-ge v3, v1, :cond_4

    .line 64
    iget-object v5, p0, Lcom/trendmicro/classfile/SuperBlock;->locals:[I

    aget v6, v5, v4

    aput v6, v2, v3

    .line 65
    aget v5, v5, v4

    invoke-static {v5}, Lcom/trendmicro/classfile/TypeInfo;->isTwoWords(I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 66
    add-int/lit8 v4, v4, 0x1

    .line 63
    :cond_3
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 69
    .end local v3    # "i":I
    .end local v4    # "j":I
    :cond_4
    return-object v2
.end method

.method isInQueue()Z
    .locals 1

    .line 149
    iget-boolean v0, p0, Lcom/trendmicro/classfile/SuperBlock;->isInQueue:Z

    return v0
.end method

.method isInitialized()Z
    .locals 1

    .line 141
    iget-boolean v0, p0, Lcom/trendmicro/classfile/SuperBlock;->isInitialized:Z

    return v0
.end method

.method merge([II[IILcom/trendmicro/classfile/ConstantPool;)Z
    .locals 4
    .param p1, "locals"    # [I
    .param p2, "localsTop"    # I
    .param p3, "stack"    # [I
    .param p4, "stackTop"    # I
    .param p5, "pool"    # Lcom/trendmicro/classfile/ConstantPool;

    .line 80
    iget-boolean v0, p0, Lcom/trendmicro/classfile/SuperBlock;->isInitialized:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/trendmicro/classfile/SuperBlock;->locals:[I

    invoke-static {p1, v2, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 82
    new-array v0, p4, [I

    iput-object v0, p0, Lcom/trendmicro/classfile/SuperBlock;->stack:[I

    .line 83
    invoke-static {p3, v2, v0, v2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    iput-boolean v1, p0, Lcom/trendmicro/classfile/SuperBlock;->isInitialized:Z

    .line 85
    return v1

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/classfile/SuperBlock;->locals:[I

    array-length v3, v0

    if-ne v3, p2, :cond_3

    iget-object v3, p0, Lcom/trendmicro/classfile/SuperBlock;->stack:[I

    array-length v3, v3

    if-ne v3, p4, :cond_3

    .line 88
    invoke-direct {p0, v0, p1, p2, p5}, Lcom/trendmicro/classfile/SuperBlock;->mergeState([I[IILcom/trendmicro/classfile/ConstantPool;)Z

    move-result v0

    .line 90
    .local v0, "localsChanged":Z
    iget-object v3, p0, Lcom/trendmicro/classfile/SuperBlock;->stack:[I

    invoke-direct {p0, v3, p3, p4, p5}, Lcom/trendmicro/classfile/SuperBlock;->mergeState([I[IILcom/trendmicro/classfile/ConstantPool;)Z

    move-result v3

    .line 92
    .local v3, "stackChanged":Z
    if-nez v0, :cond_2

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    :cond_2
    :goto_0
    return v1

    .line 101
    .end local v0    # "localsChanged":Z
    .end local v3    # "stackChanged":Z
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad merge attempt"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setInQueue(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 153
    iput-boolean p1, p0, Lcom/trendmicro/classfile/SuperBlock;->isInQueue:Z

    .line 154
    return-void
.end method

.method setInitialized(Z)V
    .locals 0
    .param p1, "b"    # Z

    .line 145
    iput-boolean p1, p0, Lcom/trendmicro/classfile/SuperBlock;->isInitialized:Z

    .line 146
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sb "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/trendmicro/classfile/SuperBlock;->index:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
