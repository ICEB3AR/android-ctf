.class final Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;
.super Ljava/lang/Object;
.source "ClassFileWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/classfile/ClassFileWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "StackMapTable"
.end annotation


# static fields
.field static final DEBUGSTACKMAP:Z = false


# instance fields
.field private locals:[I

.field private localsTop:I

.field private rawStackMap:[B

.field private rawStackMapTop:I

.field private stack:[I

.field private stackTop:I

.field private superBlockDeps:[Lcom/trendmicro/classfile/SuperBlock;

.field private superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

.field final synthetic this$0:Lcom/trendmicro/classfile/ClassFileWriter;

.field private wide:Z

.field private workList:[Lcom/trendmicro/classfile/SuperBlock;

.field private workListTop:I


# direct methods
.method constructor <init>(Lcom/trendmicro/classfile/ClassFileWriter;)V
    .locals 1
    .param p1, "this$0"    # Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1435
    iput-object p1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1436
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    .line 1437
    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    .line 1438
    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workList:[Lcom/trendmicro/classfile/SuperBlock;

    .line 1439
    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    .line 1440
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    .line 1441
    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    .line 1442
    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    .line 1443
    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 1444
    iput-boolean v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    .line 1445
    return-void
.end method

.method private addToWorkList(Lcom/trendmicro/classfile/SuperBlock;)V
    .locals 4
    .param p1, "sb"    # Lcom/trendmicro/classfile/SuperBlock;

    .line 1838
    invoke-virtual {p1}, Lcom/trendmicro/classfile/SuperBlock;->isInQueue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1839
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/trendmicro/classfile/SuperBlock;->setInQueue(Z)V

    .line 1840
    invoke-virtual {p1, v0}, Lcom/trendmicro/classfile/SuperBlock;->setInitialized(Z)V

    .line 1841
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workList:[Lcom/trendmicro/classfile/SuperBlock;

    array-length v2, v1

    if-ne v0, v2, :cond_0

    .line 1842
    mul-int/lit8 v2, v0, 0x2

    new-array v2, v2, [Lcom/trendmicro/classfile/SuperBlock;

    .line 1843
    .local v2, "tmp":[Lcom/trendmicro/classfile/SuperBlock;
    const/4 v3, 0x0

    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1844
    iput-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workList:[Lcom/trendmicro/classfile/SuperBlock;

    .line 1846
    .end local v2    # "tmp":[Lcom/trendmicro/classfile/SuperBlock;
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workList:[Lcom/trendmicro/classfile/SuperBlock;

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    aput-object p1, v0, v1

    .line 1848
    :cond_1
    return-void
.end method

.method private clearStack()V
    .locals 1

    .line 2403
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    .line 2404
    return-void
.end method

.method private computeRawStackMap()V
    .locals 13

    .line 2433
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 2434
    .local v0, "prev":Lcom/trendmicro/classfile/SuperBlock;
    invoke-virtual {v0}, Lcom/trendmicro/classfile/SuperBlock;->getTrimmedLocals()[I

    move-result-object v1

    .line 2435
    .local v1, "prevLocals":[I
    const/4 v2, -0x1

    .line 2436
    .local v2, "prevOffset":I
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    array-length v5, v4

    if-ge v3, v5, :cond_9

    .line 2437
    aget-object v4, v4, v3

    .line 2438
    .local v4, "current":Lcom/trendmicro/classfile/SuperBlock;
    invoke-virtual {v4}, Lcom/trendmicro/classfile/SuperBlock;->getTrimmedLocals()[I

    move-result-object v5

    .line 2439
    .local v5, "currentLocals":[I
    invoke-virtual {v4}, Lcom/trendmicro/classfile/SuperBlock;->getStack()[I

    move-result-object v6

    .line 2440
    .local v6, "currentStack":[I
    invoke-virtual {v4}, Lcom/trendmicro/classfile/SuperBlock;->getStart()I

    move-result v7

    sub-int/2addr v7, v2

    const/4 v8, 0x1

    sub-int/2addr v7, v8

    .line 2442
    .local v7, "offsetDelta":I
    array-length v9, v6

    if-nez v9, :cond_6

    .line 2443
    array-length v8, v1

    array-length v9, v5

    if-le v8, v9, :cond_0

    .line 2444
    array-length v8, v5

    goto :goto_1

    :cond_0
    array-length v8, v1

    .line 2445
    .local v8, "last":I
    :goto_1
    array-length v9, v1

    array-length v10, v5

    sub-int/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->abs(I)I

    move-result v9

    .line 2450
    .local v9, "delta":I
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_2
    if-ge v10, v8, :cond_2

    .line 2451
    aget v11, v1, v10

    aget v12, v5, v10

    if-eq v11, v12, :cond_1

    .line 2452
    goto :goto_3

    .line 2450
    :cond_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 2455
    :cond_2
    :goto_3
    array-length v11, v5

    if-ne v10, v11, :cond_3

    if-nez v9, :cond_3

    .line 2458
    invoke-direct {p0, v7}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeSameFrame(I)V

    goto :goto_4

    .line 2459
    :cond_3
    array-length v11, v5

    const/4 v12, 0x3

    if-ne v10, v11, :cond_4

    if-gt v9, v12, :cond_4

    .line 2462
    invoke-direct {p0, v9, v7}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeChopFrame(II)V

    goto :goto_4

    .line 2463
    :cond_4
    array-length v11, v1

    if-ne v10, v11, :cond_5

    if-gt v9, v12, :cond_5

    .line 2466
    invoke-direct {p0, v5, v9, v7}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeAppendFrame([III)V

    goto :goto_4

    .line 2470
    :cond_5
    invoke-direct {p0, v5, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeFullFrame([I[II)V

    .line 2473
    .end local v8    # "last":I
    .end local v9    # "delta":I
    .end local v10    # "j":I
    :goto_4
    goto :goto_5

    :cond_6
    array-length v9, v6

    if-ne v9, v8, :cond_8

    .line 2474
    invoke-static {v1, v5}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 2475
    invoke-direct {p0, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeSameLocalsOneStackItemFrame([II)V

    goto :goto_5

    .line 2479
    :cond_7
    invoke-direct {p0, v5, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeFullFrame([I[II)V

    goto :goto_5

    .line 2486
    :cond_8
    invoke-direct {p0, v5, v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeFullFrame([I[II)V

    .line 2489
    :goto_5
    move-object v0, v4

    .line 2490
    move-object v1, v5

    .line 2491
    invoke-virtual {v4}, Lcom/trendmicro/classfile/SuperBlock;->getStart()I

    move-result v2

    .line 2436
    .end local v4    # "current":Lcom/trendmicro/classfile/SuperBlock;
    .end local v5    # "currentLocals":[I
    .end local v6    # "currentStack":[I
    .end local v7    # "offsetDelta":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2493
    .end local v3    # "i":I
    :cond_9
    return-void
.end method

.method private execute(I)I
    .locals 14
    .param p1, "bci"    # I

    .line 1857
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->access$700(Lcom/trendmicro/classfile/ClassFileWriter;)[B

    move-result-object v0

    aget-byte v0, v0, p1

    and-int/lit16 v0, v0, 0xff

    .line 1859
    .local v0, "bc":I
    const/4 v1, 0x0

    .line 1863
    .local v1, "length":I
    const-string v2, "V"

    const/16 v3, 0x29

    const/4 v4, 0x6

    const/4 v5, 0x5

    const/4 v6, 0x0

    const/16 v7, 0x8

    const/4 v8, 0x3

    const/4 v9, 0x4

    const/4 v10, 0x2

    const/4 v11, 0x1

    packed-switch v0, :pswitch_data_0

    .line 2289
    :pswitch_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad opcode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2280
    :pswitch_1
    iput-boolean v11, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    .line 2281
    goto/16 :goto_d

    .line 1871
    :pswitch_2
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1872
    add-int/lit8 v2, p1, 0x1

    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(I)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 1873
    goto/16 :goto_d

    .line 2103
    :pswitch_3
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v2

    .line 2104
    .local v2, "type":I
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->clearStack()V

    .line 2105
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2106
    goto/16 :goto_d

    .line 2155
    .end local v2    # "type":I
    :pswitch_4
    add-int/lit8 v2, p1, 0x1

    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    .line 2156
    .local v2, "index":I
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 2157
    .local v3, "className":Ljava/lang/String;
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2158
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[L"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x3b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 2159
    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v5

    .line 2158
    invoke-static {v4, v5}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v4

    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2160
    goto/16 :goto_d

    .line 2148
    .end local v2    # "index":I
    .end local v3    # "className":Ljava/lang/String;
    :pswitch_5
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2149
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 2150
    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$700(Lcom/trendmicro/classfile/ClassFileWriter;)[B

    move-result-object v2

    add-int/lit8 v3, p1, 0x1

    aget-byte v2, v2, v3

    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$900(I)C

    move-result v2

    .line 2151
    .local v2, "componentType":C
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v3

    .line 2152
    .local v3, "index":I
    int-to-short v4, v3

    invoke-static {v4}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(I)I

    move-result v4

    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2153
    goto/16 :goto_d

    .line 2145
    .end local v2    # "componentType":C
    .end local v3    # "index":I
    :pswitch_6
    invoke-static {p1}, Lcom/trendmicro/classfile/TypeInfo;->UNINITIALIZED_VARIABLE(I)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2146
    goto/16 :goto_d

    .line 2196
    :pswitch_7
    add-int/lit8 v4, p1, 0x1

    invoke-direct {p0, v4, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v4

    .line 2197
    .local v4, "index":I
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/trendmicro/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 2198
    .local v5, "methodType":Ljava/lang/String;
    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1000(Ljava/lang/String;)I

    move-result v7

    ushr-int/lit8 v7, v7, 0x10

    .line 2199
    .local v7, "parameterCount":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-ge v8, v7, :cond_0

    .line 2200
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2199
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 2202
    .end local v8    # "i":I
    :cond_0
    invoke-virtual {v5, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 2203
    .local v3, "rParen":I
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 2204
    .local v8, "returnType":Ljava/lang/String;
    invoke-static {v8}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 2205
    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    .line 2206
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v2

    invoke-static {v8, v2}, Lcom/trendmicro/classfile/TypeInfo;->fromType(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_d

    .line 2165
    .end local v3    # "rParen":I
    .end local v4    # "index":I
    .end local v5    # "methodType":Ljava/lang/String;
    .end local v7    # "parameterCount":I
    .end local v8    # "returnType":Ljava/lang/String;
    :pswitch_8
    add-int/lit8 v5, p1, 0x1

    invoke-direct {p0, v5, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v5

    .line 2166
    .local v5, "index":I
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 2167
    invoke-static {v7}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/trendmicro/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/classfile/FieldOrMethodRef;

    .line 2168
    .local v7, "m":Lcom/trendmicro/classfile/FieldOrMethodRef;
    invoke-virtual {v7}, Lcom/trendmicro/classfile/FieldOrMethodRef;->getType()Ljava/lang/String;

    move-result-object v8

    .line 2169
    .local v8, "methodType":Ljava/lang/String;
    invoke-virtual {v7}, Lcom/trendmicro/classfile/FieldOrMethodRef;->getName()Ljava/lang/String;

    move-result-object v9

    .line 2170
    .local v9, "methodName":Ljava/lang/String;
    invoke-static {v8}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1000(Ljava/lang/String;)I

    move-result v10

    ushr-int/lit8 v10, v10, 0x10

    .line 2171
    .local v10, "parameterCount":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    if-ge v11, v10, :cond_1

    .line 2172
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2171
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 2174
    .end local v11    # "i":I
    :cond_1
    const/16 v11, 0xb8

    if-eq v0, v11, :cond_4

    .line 2175
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v11

    .line 2176
    .local v11, "instType":I
    invoke-static {v11}, Lcom/trendmicro/classfile/TypeInfo;->getTag(I)I

    move-result v12

    .line 2177
    .local v12, "tag":I
    invoke-static {v6}, Lcom/trendmicro/classfile/TypeInfo;->UNINITIALIZED_VARIABLE(I)I

    move-result v13

    if-eq v12, v13, :cond_2

    if-ne v12, v4, :cond_4

    .line 2179
    :cond_2
    const-string v4, "<init>"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2180
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 2181
    invoke-static {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1100(Lcom/trendmicro/classfile/ClassFileWriter;)S

    move-result v4

    invoke-static {v4}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(I)I

    move-result v4

    .line 2182
    .local v4, "newType":I
    invoke-direct {p0, v11, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->initializeTypeInfo(II)V

    .line 2183
    .end local v4    # "newType":I
    goto :goto_2

    .line 2184
    :cond_3
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "bad instance"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2188
    .end local v11    # "instType":I
    .end local v12    # "tag":I
    :cond_4
    :goto_2
    invoke-virtual {v8, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 2189
    .restart local v3    # "rParen":I
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {v8, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 2190
    .local v4, "returnType":Ljava/lang/String;
    invoke-static {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2191
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    .line 2192
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/trendmicro/classfile/TypeInfo;->fromType(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    goto/16 :goto_d

    .line 2210
    .end local v3    # "rParen":I
    .end local v4    # "returnType":Ljava/lang/String;
    .end local v5    # "index":I
    .end local v7    # "m":Lcom/trendmicro/classfile/FieldOrMethodRef;
    .end local v8    # "methodType":Ljava/lang/String;
    .end local v9    # "methodName":Ljava/lang/String;
    .end local v10    # "parameterCount":I
    :pswitch_9
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2213
    :pswitch_a
    add-int/lit8 v2, p1, 0x1

    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    .line 2214
    .local v2, "index":I
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 2215
    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/classfile/FieldOrMethodRef;

    .line 2216
    .local v3, "f":Lcom/trendmicro/classfile/FieldOrMethodRef;
    invoke-virtual {v3}, Lcom/trendmicro/classfile/FieldOrMethodRef;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2217
    .local v4, "fieldType":Ljava/lang/String;
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/trendmicro/classfile/TypeInfo;->fromType(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v5

    invoke-direct {p0, v5}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2218
    goto/16 :goto_d

    .line 2100
    .end local v2    # "index":I
    .end local v3    # "f":Lcom/trendmicro/classfile/FieldOrMethodRef;
    .end local v4    # "fieldType":Ljava/lang/String;
    :pswitch_b
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->clearStack()V

    .line 2101
    goto/16 :goto_d

    .line 2258
    :pswitch_c
    add-int/lit8 v2, p1, 0x1

    not-int v3, p1

    and-int/2addr v3, v8

    add-int/2addr v2, v3

    .line 2259
    .local v2, "switchStart":I
    add-int/lit8 v3, v2, 0x4

    invoke-direct {p0, v3, v9}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v3

    .line 2260
    .local v3, "low":I
    add-int/lit8 v4, v2, 0x8

    invoke-direct {p0, v4, v9}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v4

    .line 2261
    .local v4, "high":I
    sub-int v5, v4, v3

    add-int/2addr v5, v9

    mul-int/2addr v5, v9

    add-int/2addr v5, v2

    sub-int v1, v5, p1

    .line 2262
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2263
    goto/16 :goto_d

    .line 2108
    .end local v2    # "switchStart":I
    .end local v3    # "low":I
    .end local v4    # "high":I
    :pswitch_d
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v2

    .line 2109
    .local v2, "type":I
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v3

    .line 2110
    .local v3, "type2":I
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2111
    invoke-direct {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2112
    goto/16 :goto_d

    .line 2251
    .end local v2    # "type":I
    .end local v3    # "type2":I
    :pswitch_e
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v2

    .line 2252
    .local v2, "lType":J
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v4

    .line 2253
    .local v4, "lType2":J
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2254
    invoke-direct {p0, v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2255
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2256
    goto/16 :goto_d

    .line 2244
    .end local v2    # "lType":J
    .end local v4    # "lType2":J
    :pswitch_f
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v2

    .line 2245
    .restart local v2    # "lType":J
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v4

    .line 2246
    .local v4, "type":I
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2247
    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2248
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2249
    goto/16 :goto_d

    .line 2239
    .end local v2    # "lType":J
    .end local v4    # "type":I
    :pswitch_10
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v2

    .line 2240
    .restart local v2    # "lType":J
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2241
    invoke-direct {p0, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2242
    goto/16 :goto_d

    .line 2232
    .end local v2    # "lType":J
    :pswitch_11
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v2

    .line 2233
    .local v2, "type":I
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop2()J

    move-result-wide v3

    .line 2234
    .local v3, "lType":J
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2235
    invoke-direct {p0, v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push2(J)V

    .line 2236
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2237
    goto/16 :goto_d

    .line 2225
    .end local v2    # "type":I
    .end local v3    # "lType":J
    :pswitch_12
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v2

    .line 2226
    .restart local v2    # "type":I
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v3

    .line 2227
    .local v3, "type2":I
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2228
    invoke-direct {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2229
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2230
    goto/16 :goto_d

    .line 2220
    .end local v2    # "type":I
    .end local v3    # "type2":I
    :pswitch_13
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v2

    .line 2221
    .restart local v2    # "type":I
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2222
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2223
    goto/16 :goto_d

    .line 1910
    .end local v2    # "type":I
    :pswitch_14
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop2()J

    .line 1911
    goto/16 :goto_d

    .line 1882
    :pswitch_15
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1893
    :pswitch_16
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1907
    :pswitch_17
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1908
    goto/16 :goto_d

    .line 2092
    :pswitch_18
    add-int/lit8 v2, v0, -0x4b

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeAStore(I)V

    .line 2093
    goto/16 :goto_d

    .line 2074
    :pswitch_19
    add-int/lit8 v2, v0, -0x47

    invoke-direct {p0, v2, v8}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    .line 2075
    goto/16 :goto_d

    .line 2065
    :pswitch_1a
    add-int/lit8 v2, v0, -0x43

    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    .line 2066
    goto/16 :goto_d

    .line 2056
    :pswitch_1b
    add-int/lit8 v2, v0, -0x3f

    invoke-direct {p0, v2, v9}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    .line 2057
    goto/16 :goto_d

    .line 2047
    :pswitch_1c
    add-int/lit8 v2, v0, -0x3b

    invoke-direct {p0, v2, v11}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    .line 2048
    goto/16 :goto_d

    .line 2086
    :pswitch_1d
    add-int/lit8 v2, p1, 0x1

    iget-boolean v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    if-eqz v3, :cond_5

    goto :goto_3

    :cond_5
    move v10, v11

    :goto_3
    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeAStore(I)V

    .line 2087
    goto/16 :goto_d

    .line 2068
    :pswitch_1e
    add-int/lit8 v2, p1, 0x1

    iget-boolean v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    if-eqz v3, :cond_6

    goto :goto_4

    :cond_6
    move v10, v11

    :goto_4
    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    invoke-direct {p0, v2, v8}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    .line 2069
    goto/16 :goto_d

    .line 2059
    :pswitch_1f
    add-int/lit8 v2, p1, 0x1

    iget-boolean v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    if-eqz v3, :cond_7

    move v11, v10

    :cond_7
    invoke-direct {p0, v2, v11}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    .line 2060
    goto/16 :goto_d

    .line 2050
    :pswitch_20
    add-int/lit8 v2, p1, 0x1

    iget-boolean v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    if-eqz v3, :cond_8

    goto :goto_5

    :cond_8
    move v10, v11

    :goto_5
    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    invoke-direct {p0, v2, v9}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    .line 2051
    goto/16 :goto_d

    .line 2041
    :pswitch_21
    add-int/lit8 v2, p1, 0x1

    iget-boolean v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    if-eqz v3, :cond_9

    goto :goto_6

    :cond_9
    move v10, v11

    :goto_6
    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    invoke-direct {p0, v2, v11}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeStore(II)V

    .line 2042
    goto/16 :goto_d

    .line 2265
    :pswitch_22
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2266
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v2

    ushr-int/2addr v2, v7

    .line 2267
    .local v2, "typeIndex":I
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 2268
    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ConstantPool;->getConstantData(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 2269
    .local v3, "className":Ljava/lang/String;
    move-object v4, v3

    .line 2270
    .local v4, "arrayType":Ljava/lang/String;
    invoke-virtual {v4, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v7, 0x5b

    if-ne v5, v7, :cond_a

    .line 2273
    invoke-virtual {v4, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 2274
    .local v5, "elementDesc":Ljava/lang/String;
    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2275
    .local v7, "elementType":Ljava/lang/String;
    iget-object v8, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v8}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v2

    .line 2276
    invoke-static {v2}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(I)I

    move-result v8

    invoke-direct {p0, v8}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2277
    goto/16 :goto_d

    .line 2271
    .end local v5    # "elementDesc":Ljava/lang/String;
    .end local v7    # "elementType":Ljava/lang/String;
    :cond_a
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "bad array type"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 2023
    .end local v2    # "typeIndex":I
    .end local v3    # "className":Ljava/lang/String;
    .end local v4    # "arrayType":Ljava/lang/String;
    :pswitch_23
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2029
    :pswitch_24
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    goto/16 :goto_9

    .line 1999
    :pswitch_25
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2005
    :pswitch_26
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    goto/16 :goto_a

    .line 1976
    :pswitch_27
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1982
    :pswitch_28
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    goto/16 :goto_b

    .line 1935
    :pswitch_29
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 1946
    :pswitch_2a
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    goto/16 :goto_c

    .line 2083
    :pswitch_2b
    add-int/lit8 v2, v0, -0x2a

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeALoad(I)V

    .line 2084
    goto/16 :goto_d

    .line 2077
    :pswitch_2c
    add-int/lit8 v2, p1, 0x1

    iget-boolean v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    if-eqz v3, :cond_b

    goto :goto_7

    :cond_b
    move v10, v11

    :goto_7
    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeALoad(I)V

    .line 2078
    goto/16 :goto_d

    .line 2116
    :pswitch_2d
    const/16 v2, 0x12

    if-ne v0, v2, :cond_c

    .line 2117
    add-int/lit8 v2, p1, 0x1

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(I)I

    move-result v2

    .local v2, "index":I
    goto :goto_8

    .line 2119
    .end local v2    # "index":I
    :cond_c
    add-int/lit8 v2, p1, 0x1

    invoke-direct {p0, v2, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v2

    .line 2121
    .restart local v2    # "index":I
    :goto_8
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/trendmicro/classfile/ConstantPool;->getConstantType(I)B

    move-result v3

    .line 2122
    .local v3, "constType":B
    if-eq v3, v8, :cond_11

    if-eq v3, v9, :cond_10

    if-eq v3, v5, :cond_f

    if-eq v3, v4, :cond_e

    if-ne v3, v7, :cond_d

    .line 2136
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 2137
    invoke-static {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v4

    .line 2136
    const-string v5, "java/lang/String"

    invoke-static {v5, v4}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v4

    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2138
    goto :goto_d

    .line 2140
    :cond_d
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bad const type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2124
    :cond_e
    invoke-direct {p0, v8}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2125
    goto :goto_d

    .line 2130
    :cond_f
    invoke-direct {p0, v9}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2131
    goto :goto_d

    .line 2127
    :cond_10
    invoke-direct {p0, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2128
    goto :goto_d

    .line 2133
    :cond_11
    invoke-direct {p0, v11}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2134
    goto :goto_d

    .line 2038
    .end local v2    # "index":I
    .end local v3    # "constType":B
    :goto_9
    :pswitch_2e
    invoke-direct {p0, v8}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2039
    goto :goto_d

    .line 2015
    :goto_a
    :pswitch_2f
    invoke-direct {p0, v10}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2016
    goto :goto_d

    .line 1991
    :goto_b
    :pswitch_30
    invoke-direct {p0, v9}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 1992
    goto :goto_d

    .line 1962
    :goto_c
    :pswitch_31
    invoke-direct {p0, v11}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 1963
    goto :goto_d

    .line 1913
    :pswitch_32
    invoke-direct {p0, v5}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 1914
    goto :goto_d

    .line 1869
    :pswitch_33
    nop

    .line 2292
    :cond_12
    :goto_d
    if-nez v1, :cond_13

    .line 2293
    iget-boolean v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    invoke-static {v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1300(IZ)I

    move-result v1

    .line 2295
    :cond_13
    iget-boolean v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    if-eqz v2, :cond_14

    const/16 v2, 0xc4

    if-eq v0, v2, :cond_14

    .line 2296
    iput-boolean v6, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->wide:Z

    .line 2298
    :cond_14
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_30
        :pswitch_30
        :pswitch_2f
        :pswitch_2f
        :pswitch_2f
        :pswitch_2e
        :pswitch_2e
        :pswitch_31
        :pswitch_31
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2c
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_30
        :pswitch_2f
        :pswitch_2f
        :pswitch_2f
        :pswitch_2f
        :pswitch_2e
        :pswitch_2e
        :pswitch_2e
        :pswitch_2e
        :pswitch_2b
        :pswitch_2b
        :pswitch_2b
        :pswitch_2b
        :pswitch_29
        :pswitch_27
        :pswitch_25
        :pswitch_23
        :pswitch_22
        :pswitch_29
        :pswitch_29
        :pswitch_29
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1c
        :pswitch_1c
        :pswitch_1c
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1b
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_19
        :pswitch_19
        :pswitch_19
        :pswitch_19
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_18
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_15
        :pswitch_17
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_29
        :pswitch_27
        :pswitch_25
        :pswitch_23
        :pswitch_29
        :pswitch_27
        :pswitch_25
        :pswitch_23
        :pswitch_29
        :pswitch_27
        :pswitch_25
        :pswitch_23
        :pswitch_29
        :pswitch_27
        :pswitch_25
        :pswitch_23
        :pswitch_29
        :pswitch_27
        :pswitch_25
        :pswitch_23
        :pswitch_2a
        :pswitch_28
        :pswitch_26
        :pswitch_24
        :pswitch_29
        :pswitch_27
        :pswitch_29
        :pswitch_27
        :pswitch_29
        :pswitch_27
        :pswitch_29
        :pswitch_27
        :pswitch_29
        :pswitch_27
        :pswitch_29
        :pswitch_27
        :pswitch_33
        :pswitch_28
        :pswitch_26
        :pswitch_24
        :pswitch_2a
        :pswitch_26
        :pswitch_24
        :pswitch_2a
        :pswitch_28
        :pswitch_24
        :pswitch_2a
        :pswitch_28
        :pswitch_26
        :pswitch_2a
        :pswitch_2a
        :pswitch_2a
        :pswitch_29
        :pswitch_29
        :pswitch_29
        :pswitch_29
        :pswitch_29
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_33
        :pswitch_0
        :pswitch_0
        :pswitch_c
        :pswitch_0
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_17
        :pswitch_9
        :pswitch_16
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_2a
        :pswitch_3
        :pswitch_2
        :pswitch_2a
        :pswitch_17
        :pswitch_17
        :pswitch_1
        :pswitch_0
        :pswitch_17
        :pswitch_17
        :pswitch_33
    .end packed-switch
.end method

.method private executeALoad(I)V
    .locals 5
    .param p1, "localIndex"    # I

    .line 2302
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getLocal(I)I

    move-result v0

    .line 2303
    .local v0, "type":I
    invoke-static {v0}, Lcom/trendmicro/classfile/TypeInfo;->getTag(I)I

    move-result v1

    .line 2304
    .local v1, "tag":I
    const/4 v2, 0x7

    if-eq v1, v2, :cond_1

    const/4 v2, 0x6

    if-eq v1, v2, :cond_1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 2310
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad local variable type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " at index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2308
    :cond_1
    :goto_0
    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2314
    return-void
.end method

.method private executeAStore(I)V
    .locals 1
    .param p1, "localIndex"    # I

    .line 2317
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->setLocal(II)V

    .line 2318
    return-void
.end method

.method private executeBlock(Lcom/trendmicro/classfile/SuperBlock;)V
    .locals 18
    .param p1, "work"    # Lcom/trendmicro/classfile/SuperBlock;

    .line 1717
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 1718
    .local v1, "bc":I
    const/4 v2, 0x0

    .line 1727
    .local v2, "next":I
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/SuperBlock;->getStart()I

    move-result v3

    .local v3, "bci":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/SuperBlock;->getEnd()I

    move-result v4

    const/4 v5, 0x1

    if-ge v3, v4, :cond_7

    .line 1728
    iget-object v4, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->access$700(Lcom/trendmicro/classfile/ClassFileWriter;)[B

    move-result-object v4

    aget-byte v4, v4, v3

    and-int/lit16 v1, v4, 0xff

    .line 1729
    invoke-direct {v0, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->execute(I)I

    move-result v2

    .line 1736
    invoke-direct {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->isBranch(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1737
    invoke-direct {v0, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getBranchTarget(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v4

    .line 1748
    .local v4, "targetSB":Lcom/trendmicro/classfile/SuperBlock;
    invoke-direct {v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->flowInto(Lcom/trendmicro/classfile/SuperBlock;)V

    .end local v4    # "targetSB":Lcom/trendmicro/classfile/SuperBlock;
    goto :goto_2

    .line 1755
    :cond_0
    const/16 v4, 0xaa

    if-ne v1, v4, :cond_1

    .line 1756
    add-int/lit8 v4, v3, 0x1

    not-int v6, v3

    and-int/lit8 v6, v6, 0x3

    add-int/2addr v4, v6

    .line 1757
    .local v4, "switchStart":I
    const/4 v6, 0x4

    invoke-direct {v0, v4, v6}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v7

    .line 1758
    .local v7, "defaultOffset":I
    add-int v8, v3, v7

    .line 1759
    invoke-direct {v0, v8}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v8

    .line 1764
    .local v8, "targetSB":Lcom/trendmicro/classfile/SuperBlock;
    invoke-direct {v0, v8}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->flowInto(Lcom/trendmicro/classfile/SuperBlock;)V

    .line 1765
    add-int/lit8 v9, v4, 0x4

    invoke-direct {v0, v9, v6}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v9

    .line 1766
    .local v9, "low":I
    add-int/lit8 v10, v4, 0x8

    invoke-direct {v0, v10, v6}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v10

    .line 1767
    .local v10, "high":I
    sub-int v11, v10, v9

    add-int/2addr v11, v5

    .line 1768
    .local v11, "numCases":I
    add-int/lit8 v12, v4, 0xc

    .line 1769
    .local v12, "caseBase":I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_1
    if-ge v13, v11, :cond_2

    .line 1770
    mul-int/lit8 v14, v13, 0x4

    add-int/2addr v14, v12

    invoke-direct {v0, v14, v6}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v14

    add-int/2addr v14, v3

    .line 1771
    .local v14, "label":I
    invoke-direct {v0, v14}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v8

    .line 1777
    invoke-direct {v0, v8}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->flowInto(Lcom/trendmicro/classfile/SuperBlock;)V

    .line 1769
    .end local v14    # "label":I
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 1755
    .end local v4    # "switchStart":I
    .end local v7    # "defaultOffset":I
    .end local v8    # "targetSB":Lcom/trendmicro/classfile/SuperBlock;
    .end local v9    # "low":I
    .end local v10    # "high":I
    .end local v11    # "numCases":I
    .end local v12    # "caseBase":I
    .end local v13    # "i":I
    :cond_1
    :goto_2
    nop

    .line 1781
    :cond_2
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    iget-object v6, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v6}, Lcom/trendmicro/classfile/ClassFileWriter;->access$400(Lcom/trendmicro/classfile/ClassFileWriter;)I

    move-result v6

    if-ge v4, v6, :cond_6

    .line 1782
    iget-object v6, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v6}, Lcom/trendmicro/classfile/ClassFileWriter;->access$500(Lcom/trendmicro/classfile/ClassFileWriter;)[Lcom/trendmicro/classfile/ExceptionTableEntry;

    move-result-object v6

    aget-object v6, v6, v4

    .line 1783
    .local v6, "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    iget-object v7, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v8, v6, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsStartLabel:I

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v7

    int-to-short v7, v7

    .line 1784
    .local v7, "startPC":S
    iget-object v8, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v9, v6, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsEndLabel:I

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v8

    int-to-short v8, v8

    .line 1785
    .local v8, "endPC":S
    if-lt v3, v7, :cond_5

    if-lt v3, v8, :cond_3

    .line 1786
    goto :goto_5

    .line 1788
    :cond_3
    iget-object v9, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v10, v6, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    .line 1789
    invoke-virtual {v9, v10}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v9

    int-to-short v9, v9

    .line 1790
    .local v9, "handlerPC":S
    invoke-direct {v0, v9}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v15

    .line 1793
    .local v15, "sb":Lcom/trendmicro/classfile/SuperBlock;
    iget-short v10, v6, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsCatchType:S

    if-nez v10, :cond_4

    .line 1794
    iget-object v10, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1795
    invoke-static {v10}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v10

    const-string v11, "java/lang/Throwable"

    invoke-virtual {v10, v11}, Lcom/trendmicro/classfile/ConstantPool;->addClass(Ljava/lang/String;)S

    move-result v10

    .line 1794
    invoke-static {v10}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(I)I

    move-result v10

    move/from16 v16, v10

    .local v10, "exceptionType":I
    goto :goto_4

    .line 1797
    .end local v10    # "exceptionType":I
    :cond_4
    iget-short v10, v6, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsCatchType:S

    invoke-static {v10}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(I)I

    move-result v10

    move/from16 v16, v10

    .line 1799
    .local v16, "exceptionType":I
    :goto_4
    iget-object v11, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    iget v12, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    new-array v13, v5, [I

    const/4 v10, 0x0

    aput v16, v13, v10

    const/4 v14, 0x1

    iget-object v10, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1800
    invoke-static {v10}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v17

    .line 1799
    move-object v10, v15

    move-object v5, v15

    .end local v15    # "sb":Lcom/trendmicro/classfile/SuperBlock;
    .local v5, "sb":Lcom/trendmicro/classfile/SuperBlock;
    move-object/from16 v15, v17

    invoke-virtual/range {v10 .. v15}, Lcom/trendmicro/classfile/SuperBlock;->merge([II[IILcom/trendmicro/classfile/ConstantPool;)Z

    .line 1801
    invoke-direct {v0, v5}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->addToWorkList(Lcom/trendmicro/classfile/SuperBlock;)V

    .line 1781
    .end local v5    # "sb":Lcom/trendmicro/classfile/SuperBlock;
    .end local v6    # "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    .end local v7    # "startPC":S
    .end local v8    # "endPC":S
    .end local v9    # "handlerPC":S
    .end local v16    # "exceptionType":I
    :cond_5
    :goto_5
    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x1

    goto :goto_3

    .line 1727
    .end local v4    # "i":I
    :cond_6
    add-int/2addr v3, v2

    goto/16 :goto_0

    .line 1814
    .end local v3    # "bci":I
    :cond_7
    invoke-direct {v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->isSuperBlockEnd(I)Z

    move-result v3

    if-nez v3, :cond_8

    .line 1815
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/classfile/SuperBlock;->getIndex()I

    move-result v3

    const/4 v4, 0x1

    add-int/2addr v3, v4

    .line 1816
    .local v3, "nextIndex":I
    iget-object v4, v0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    array-length v5, v4

    if-ge v3, v5, :cond_8

    .line 1822
    aget-object v4, v4, v3

    invoke-direct {v0, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->flowInto(Lcom/trendmicro/classfile/SuperBlock;)V

    .line 1825
    .end local v3    # "nextIndex":I
    :cond_8
    return-void
.end method

.method private executeStore(II)V
    .locals 0
    .param p1, "localIndex"    # I
    .param p2, "typeInfo"    # I

    .line 2321
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    .line 2322
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->setLocal(II)V

    .line 2323
    return-void
.end method

.method private executeWorkList()V
    .locals 3

    .line 1702
    :goto_0
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    if-lez v0, :cond_0

    .line 1703
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workList:[Lcom/trendmicro/classfile/SuperBlock;

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    aget-object v0, v1, v0

    .line 1704
    .local v0, "work":Lcom/trendmicro/classfile/SuperBlock;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/trendmicro/classfile/SuperBlock;->setInQueue(Z)V

    .line 1705
    invoke-virtual {v0}, Lcom/trendmicro/classfile/SuperBlock;->getLocals()[I

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    .line 1706
    invoke-virtual {v0}, Lcom/trendmicro/classfile/SuperBlock;->getStack()[I

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stack:[I

    .line 1707
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    array-length v2, v2

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    .line 1708
    array-length v1, v1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    .line 1709
    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeBlock(Lcom/trendmicro/classfile/SuperBlock;)V

    .line 1710
    .end local v0    # "work":Lcom/trendmicro/classfile/SuperBlock;
    goto :goto_0

    .line 1711
    :cond_0
    return-void
.end method

.method private flowInto(Lcom/trendmicro/classfile/SuperBlock;)V
    .locals 6
    .param p1, "sb"    # Lcom/trendmicro/classfile/SuperBlock;

    .line 1832
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    iget v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v4, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v5

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/classfile/SuperBlock;->merge([II[IILcom/trendmicro/classfile/ConstantPool;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1833
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->addToWorkList(Lcom/trendmicro/classfile/SuperBlock;)V

    .line 1835
    :cond_0
    return-void
.end method

.method private getBranchTarget(I)Lcom/trendmicro/classfile/SuperBlock;
    .locals 2
    .param p1, "bci"    # I

    .line 1557
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->access$700(Lcom/trendmicro/classfile/ClassFileWriter;)[B

    move-result-object v0

    aget-byte v0, v0, p1

    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 1558
    add-int/lit8 v0, p1, 0x1

    const/4 v1, 0x4

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v0

    add-int/2addr v0, p1

    .local v0, "target":I
    goto :goto_0

    .line 1560
    .end local v0    # "target":I
    :cond_0
    add-int/lit8 v0, p1, 0x1

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v0

    int-to-short v0, v0

    add-int/2addr v0, p1

    .line 1562
    .restart local v0    # "target":I
    :goto_0
    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v1

    return-object v1
.end method

.method private getLocal(I)I
    .locals 1
    .param p1, "localIndex"    # I

    .line 2344
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    if-ge p1, v0, :cond_0

    .line 2345
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    aget v0, v0, p1

    return v0

    .line 2347
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private getOperand(I)I
    .locals 1
    .param p1, "offset"    # I

    .line 1595
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getOperand(II)I

    move-result v0

    return v0
.end method

.method private getOperand(II)I
    .locals 5
    .param p1, "start"    # I
    .param p2, "size"    # I

    .line 1604
    const/4 v0, 0x0

    .line 1605
    .local v0, "result":I
    const/4 v1, 0x4

    if-gt p2, v1, :cond_1

    .line 1608
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_0

    .line 1609
    shl-int/lit8 v2, v0, 0x8

    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->access$700(Lcom/trendmicro/classfile/ClassFileWriter;)[B

    move-result-object v3

    add-int v4, p1, v1

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    or-int v0, v2, v3

    .line 1608
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1611
    .end local v1    # "i":I
    :cond_0
    return v0

    .line 1606
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "bad operand size"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getSuperBlockDependencies()[Lcom/trendmicro/classfile/SuperBlock;
    .locals 8

    .line 1528
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    array-length v0, v0

    new-array v0, v0, [Lcom/trendmicro/classfile/SuperBlock;

    .line 1530
    .local v0, "deps":[Lcom/trendmicro/classfile/SuperBlock;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$400(Lcom/trendmicro/classfile/ClassFileWriter;)I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1531
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$500(Lcom/trendmicro/classfile/ClassFileWriter;)[Lcom/trendmicro/classfile/ExceptionTableEntry;

    move-result-object v2

    aget-object v2, v2, v1

    .line 1532
    .local v2, "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v4, v2, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsStartLabel:I

    invoke-virtual {v3, v4}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v3

    int-to-short v3, v3

    .line 1533
    .local v3, "startPC":S
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v5, v2, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    invoke-virtual {v4, v5}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v4

    int-to-short v4, v4

    .line 1534
    .local v4, "handlerPC":S
    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v5

    .line 1535
    .local v5, "handlerSB":Lcom/trendmicro/classfile/SuperBlock;
    invoke-direct {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v6

    .line 1536
    .local v6, "dep":Lcom/trendmicro/classfile/SuperBlock;
    invoke-virtual {v5}, Lcom/trendmicro/classfile/SuperBlock;->getIndex()I

    move-result v7

    aput-object v6, v0, v7

    .line 1530
    .end local v2    # "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    .end local v3    # "startPC":S
    .end local v4    # "handlerPC":S
    .end local v5    # "handlerSB":Lcom/trendmicro/classfile/SuperBlock;
    .end local v6    # "dep":Lcom/trendmicro/classfile/SuperBlock;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1538
    .end local v1    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->access$600(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/hippo/UintMap;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/UintMap;->getKeys()[I

    move-result-object v1

    .line 1539
    .local v1, "targetPCs":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 1540
    aget v3, v1, v2

    .line 1541
    .local v3, "targetPC":I
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->access$600(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/hippo/UintMap;

    move-result-object v4

    const/4 v5, -0x1

    invoke-virtual {v4, v3, v5}, Lcom/trendmicro/hippo/UintMap;->getInt(II)I

    move-result v4

    .line 1542
    .local v4, "branchPC":I
    invoke-direct {p0, v4}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v5

    .line 1543
    .local v5, "branchSB":Lcom/trendmicro/classfile/SuperBlock;
    invoke-direct {p0, v3}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v6

    .line 1544
    .local v6, "targetSB":Lcom/trendmicro/classfile/SuperBlock;
    invoke-virtual {v6}, Lcom/trendmicro/classfile/SuperBlock;->getIndex()I

    move-result v7

    aput-object v5, v0, v7

    .line 1539
    .end local v3    # "targetPC":I
    .end local v4    # "branchPC":I
    .end local v5    # "branchSB":Lcom/trendmicro/classfile/SuperBlock;
    .end local v6    # "targetSB":Lcom/trendmicro/classfile/SuperBlock;
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1547
    .end local v2    # "i":I
    :cond_1
    return-object v0
.end method

.method private getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;
    .locals 3
    .param p1, "offset"    # I

    .line 1488
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 1489
    aget-object v1, v1, v0

    .line 1490
    .local v1, "sb":Lcom/trendmicro/classfile/SuperBlock;
    if-eqz v1, :cond_1

    .line 1492
    invoke-virtual {v1}, Lcom/trendmicro/classfile/SuperBlock;->getStart()I

    move-result v2

    if-lt p1, v2, :cond_0

    invoke-virtual {v1}, Lcom/trendmicro/classfile/SuperBlock;->getEnd()I

    move-result v2

    if-ge p1, v2, :cond_0

    .line 1493
    return-object v1

    .line 1488
    .end local v1    # "sb":Lcom/trendmicro/classfile/SuperBlock;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1496
    .end local v0    # "i":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getWorstCaseWriteSize()I
    .locals 3

    .line 2502
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v1}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1400(Lcom/trendmicro/classfile/ClassFileWriter;)S

    move-result v1

    mul-int/lit8 v1, v1, 0x3

    add-int/lit8 v1, v1, 0x7

    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 2503
    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$1500(Lcom/trendmicro/classfile/ClassFileWriter;)S

    move-result v2

    mul-int/lit8 v2, v2, 0x3

    add-int/2addr v1, v2

    mul-int/2addr v0, v1

    .line 2502
    return v0
.end method

.method private initializeTypeInfo(II)V
    .locals 2
    .param p1, "prevType"    # I
    .param p2, "newType"    # I

    .line 2330
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->initializeTypeInfo(II[II)V

    .line 2331
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->initializeTypeInfo(II[II)V

    .line 2332
    return-void
.end method

.method private initializeTypeInfo(II[II)V
    .locals 2
    .param p1, "prevType"    # I
    .param p2, "newType"    # I
    .param p3, "data"    # [I
    .param p4, "dataTop"    # I

    .line 2336
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_1

    .line 2337
    aget v1, p3, v0

    if-ne v1, p1, :cond_0

    .line 2338
    aput p2, p3, v0

    .line 2336
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2341
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private isBranch(I)Z
    .locals 1
    .param p1, "opcode"    # I

    .line 1569
    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    .line 1590
    const/4 v0, 0x0

    return v0

    .line 1588
    :pswitch_0
    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x99
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xc6
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private isSuperBlockEnd(I)Z
    .locals 1
    .param p1, "opcode"    # I

    .line 1504
    const/16 v0, 0xa7

    if-eq p1, v0, :cond_0

    const/16 v0, 0xbf

    if-eq p1, v0, :cond_0

    const/16 v0, 0xc8

    if-eq p1, v0, :cond_0

    const/16 v0, 0xb0

    if-eq p1, v0, :cond_0

    const/16 v0, 0xb1

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    .line 1517
    const/4 v0, 0x0

    return v0

    .line 1515
    :cond_0
    :pswitch_0
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0xaa
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private killSuperBlock(Lcom/trendmicro/classfile/SuperBlock;)V
    .locals 11
    .param p1, "sb"    # Lcom/trendmicro/classfile/SuperBlock;

    .line 1654
    const/4 v0, 0x0

    new-array v1, v0, [I

    .line 1655
    .local v1, "locals":[I
    const/4 v2, 0x1

    new-array v3, v2, [I

    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1656
    invoke-static {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v4

    .line 1655
    const-string v5, "java/lang/Throwable"

    invoke-static {v5, v4}, Lcom/trendmicro/classfile/TypeInfo;->OBJECT(Ljava/lang/String;Lcom/trendmicro/classfile/ConstantPool;)I

    move-result v4

    aput v4, v3, v0

    .line 1662
    .local v3, "stack":[I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$400(Lcom/trendmicro/classfile/ClassFileWriter;)I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 1663
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$500(Lcom/trendmicro/classfile/ClassFileWriter;)[Lcom/trendmicro/classfile/ExceptionTableEntry;

    move-result-object v5

    aget-object v5, v5, v4

    .line 1664
    .local v5, "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    iget-object v6, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v7, v5, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsStartLabel:I

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v6

    .line 1665
    .local v6, "eteStart":I
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v8, v5, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsEndLabel:I

    invoke-virtual {v7, v8}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v7

    .line 1666
    .local v7, "eteEnd":I
    iget-object v8, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v9, v5, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsHandlerLabel:I

    invoke-virtual {v8, v9}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v8

    .line 1667
    .local v8, "handlerPC":I
    invoke-direct {p0, v8}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockFromOffset(I)Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v9

    .line 1668
    .local v9, "handlerSB":Lcom/trendmicro/classfile/SuperBlock;
    invoke-virtual {p1}, Lcom/trendmicro/classfile/SuperBlock;->getStart()I

    move-result v10

    if-le v10, v6, :cond_0

    invoke-virtual {p1}, Lcom/trendmicro/classfile/SuperBlock;->getStart()I

    move-result v10

    if-lt v10, v7, :cond_1

    .line 1669
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/classfile/SuperBlock;->getStart()I

    move-result v10

    if-le v6, v10, :cond_2

    invoke-virtual {p1}, Lcom/trendmicro/classfile/SuperBlock;->getEnd()I

    move-result v10

    if-ge v6, v10, :cond_2

    .line 1670
    invoke-virtual {v9}, Lcom/trendmicro/classfile/SuperBlock;->isInitialized()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 1671
    :cond_1
    invoke-virtual {v9}, Lcom/trendmicro/classfile/SuperBlock;->getLocals()[I

    move-result-object v1

    .line 1672
    goto :goto_1

    .line 1662
    .end local v5    # "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    .end local v6    # "eteStart":I
    .end local v7    # "eteEnd":I
    .end local v8    # "handlerPC":I
    .end local v9    # "handlerSB":Lcom/trendmicro/classfile/SuperBlock;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1679
    .end local v4    # "i":I
    :cond_3
    :goto_1
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_2
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$400(Lcom/trendmicro/classfile/ClassFileWriter;)I

    move-result v5

    if-ge v4, v5, :cond_6

    .line 1680
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$500(Lcom/trendmicro/classfile/ClassFileWriter;)[Lcom/trendmicro/classfile/ExceptionTableEntry;

    move-result-object v5

    aget-object v5, v5, v4

    .line 1681
    .restart local v5    # "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    iget-object v6, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    iget v7, v5, Lcom/trendmicro/classfile/ExceptionTableEntry;->itsStartLabel:I

    invoke-virtual {v6, v7}, Lcom/trendmicro/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v6

    .line 1682
    .restart local v6    # "eteStart":I
    invoke-virtual {p1}, Lcom/trendmicro/classfile/SuperBlock;->getStart()I

    move-result v7

    if-ne v6, v7, :cond_5

    .line 1683
    add-int/lit8 v7, v4, 0x1

    .local v7, "j":I
    :goto_3
    iget-object v8, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v8}, Lcom/trendmicro/classfile/ClassFileWriter;->access$400(Lcom/trendmicro/classfile/ClassFileWriter;)I

    move-result v8

    if-ge v7, v8, :cond_4

    .line 1684
    iget-object v8, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v8}, Lcom/trendmicro/classfile/ClassFileWriter;->access$500(Lcom/trendmicro/classfile/ClassFileWriter;)[Lcom/trendmicro/classfile/ExceptionTableEntry;

    move-result-object v8

    add-int/lit8 v9, v7, -0x1

    iget-object v10, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v10}, Lcom/trendmicro/classfile/ClassFileWriter;->access$500(Lcom/trendmicro/classfile/ClassFileWriter;)[Lcom/trendmicro/classfile/ExceptionTableEntry;

    move-result-object v10

    aget-object v10, v10, v7

    aput-object v10, v8, v9

    .line 1683
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 1686
    .end local v7    # "j":I
    :cond_4
    iget-object v7, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v7}, Lcom/trendmicro/classfile/ClassFileWriter;->access$410(Lcom/trendmicro/classfile/ClassFileWriter;)I

    .line 1687
    add-int/lit8 v4, v4, -0x1

    .line 1679
    .end local v5    # "ete":Lcom/trendmicro/classfile/ExceptionTableEntry;
    .end local v6    # "eteStart":I
    :cond_5
    add-int/2addr v4, v2

    goto :goto_2

    .line 1691
    .end local v4    # "i":I
    :cond_6
    array-length v7, v1

    array-length v9, v3

    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1692
    invoke-static {v4}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v10

    .line 1691
    move-object v5, p1

    move-object v6, v1

    move-object v8, v3

    invoke-virtual/range {v5 .. v10}, Lcom/trendmicro/classfile/SuperBlock;->merge([II[IILcom/trendmicro/classfile/ConstantPool;)Z

    .line 1694
    invoke-virtual {p1}, Lcom/trendmicro/classfile/SuperBlock;->getEnd()I

    move-result v4

    sub-int/2addr v4, v2

    .line 1695
    .local v4, "end":I
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$700(Lcom/trendmicro/classfile/ClassFileWriter;)[B

    move-result-object v2

    const/16 v5, -0x41

    aput-byte v5, v2, v4

    .line 1696
    invoke-virtual {p1}, Lcom/trendmicro/classfile/SuperBlock;->getStart()I

    move-result v2

    .local v2, "bci":I
    :goto_4
    if-ge v2, v4, :cond_7

    .line 1697
    iget-object v5, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v5}, Lcom/trendmicro/classfile/ClassFileWriter;->access$700(Lcom/trendmicro/classfile/ClassFileWriter;)[B

    move-result-object v5

    aput-byte v0, v5, v2

    .line 1696
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 1699
    .end local v2    # "bci":I
    :cond_7
    return-void
.end method

.method private pop()I
    .locals 2

    .line 2370
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    aget v0, v0, v1

    return v0
.end method

.method private pop2()J
    .locals 6

    .line 2395
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v0

    int-to-long v0, v0

    .line 2396
    .local v0, "type":J
    long-to-int v2, v0

    invoke-static {v2}, Lcom/trendmicro/classfile/TypeInfo;->isTwoWords(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2397
    return-wide v0

    .line 2399
    :cond_0
    const/16 v2, 0x20

    shl-long v2, v0, v2

    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->pop()I

    move-result v4

    const v5, 0xffffff

    and-int/2addr v4, v5

    int-to-long v4, v4

    or-long/2addr v2, v4

    return-wide v2
.end method

.method private push(I)V
    .locals 4
    .param p1, "typeInfo"    # I

    .line 2361
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stack:[I

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 2362
    mul-int/lit8 v0, v0, 0x2

    const/4 v1, 0x4

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-array v0, v0, [I

    .line 2363
    .local v0, "tmp":[I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2364
    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stack:[I

    .line 2366
    .end local v0    # "tmp":[I
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stack:[I

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->stackTop:I

    aput p1, v0, v1

    .line 2367
    return-void
.end method

.method private push2(J)V
    .locals 4
    .param p1, "typeInfo"    # J

    .line 2380
    const-wide/32 v0, 0xffffff

    and-long v2, p1, v0

    long-to-int v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2381
    const/16 v2, 0x20

    ushr-long/2addr p1, v2

    .line 2382
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-eqz v2, :cond_0

    .line 2383
    and-long/2addr v0, p1

    long-to-int v0, v0

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->push(I)V

    .line 2385
    :cond_0
    return-void
.end method

.method private setLocal(II)V
    .locals 4
    .param p1, "localIndex"    # I
    .param p2, "typeInfo"    # I

    .line 2351
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    if-lt p1, v0, :cond_0

    .line 2352
    add-int/lit8 v1, p1, 0x1

    new-array v1, v1, [I

    .line 2353
    .local v1, "tmp":[I
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2354
    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    .line 2355
    add-int/lit8 v0, p1, 0x1

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->localsTop:I

    .line 2357
    .end local v1    # "tmp":[I
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->locals:[I

    aput p2, v0, p1

    .line 2358
    return-void
.end method

.method private verify()V
    .locals 8

    .line 1618
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->access$100(Lcom/trendmicro/classfile/ClassFileWriter;)[I

    move-result-object v0

    .line 1619
    .local v0, "initialLocals":[I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    const/4 v7, 0x0

    aget-object v1, v1, v7

    array-length v3, v0

    new-array v4, v7, [I

    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    .line 1620
    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$800(Lcom/trendmicro/classfile/ClassFileWriter;)Lcom/trendmicro/classfile/ConstantPool;

    move-result-object v6

    .line 1619
    const/4 v5, 0x0

    move-object v2, v0

    invoke-virtual/range {v1 .. v6}, Lcom/trendmicro/classfile/SuperBlock;->merge([II[IILcom/trendmicro/classfile/ConstantPool;)Z

    .line 1624
    const/4 v1, 0x1

    new-array v2, v1, [Lcom/trendmicro/classfile/SuperBlock;

    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    aget-object v3, v3, v7

    aput-object v3, v2, v7

    iput-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workList:[Lcom/trendmicro/classfile/SuperBlock;

    .line 1625
    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->workListTop:I

    .line 1626
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeWorkList()V

    .line 1629
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 1630
    aget-object v2, v2, v1

    .line 1631
    .local v2, "sb":Lcom/trendmicro/classfile/SuperBlock;
    invoke-virtual {v2}, Lcom/trendmicro/classfile/SuperBlock;->isInitialized()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1632
    invoke-direct {p0, v2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->killSuperBlock(Lcom/trendmicro/classfile/SuperBlock;)V

    .line 1629
    .end local v2    # "sb":Lcom/trendmicro/classfile/SuperBlock;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1635
    .end local v1    # "i":I
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->executeWorkList()V

    .line 1636
    return-void
.end method

.method private writeAppendFrame([III)V
    .locals 5
    .param p1, "locals"    # [I
    .param p2, "localsDelta"    # I
    .param p3, "offsetDelta"    # I

    .line 2552
    array-length v0, p1

    sub-int/2addr v0, p2

    .line 2553
    .local v0, "start":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit16 v4, p2, 0xfb

    int-to-byte v4, v4

    aput-byte v4, v1, v2

    .line 2554
    invoke-static {p3, v1, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2555
    invoke-direct {p0, p1, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeTypes([II)I

    move-result v1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2556
    return-void
.end method

.method private writeChopFrame(II)V
    .locals 4
    .param p1, "localsDelta"    # I
    .param p2, "offsetDelta"    # I

    .line 2559
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    rsub-int v3, p1, 0xfb

    int-to-byte v3, v3

    aput-byte v3, v0, v1

    .line 2560
    invoke-static {p2, v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2561
    return-void
.end method

.method private writeFullFrame([I[II)V
    .locals 4
    .param p1, "locals"    # [I
    .param p2, "stack"    # [I
    .param p3, "offsetDelta"    # I

    .line 2540
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    const/4 v3, -0x1

    aput-byte v3, v0, v1

    .line 2541
    invoke-static {p3, v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2542
    array-length v1, p1

    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    invoke-static {v1, v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2544
    invoke-direct {p0, p1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeTypes([I)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2545
    array-length v1, p2

    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    invoke-static {v1, v2, v0}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2547
    invoke-direct {p0, p2}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeTypes([I)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2548
    return-void
.end method

.method private writeSameFrame(I)V
    .locals 4
    .param p1, "offsetDelta"    # I

    .line 2507
    const/16 v0, 0x3f

    if-gt p1, v0, :cond_0

    .line 2511
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    goto :goto_0

    .line 2515
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    const/4 v3, -0x5

    aput-byte v3, v0, v1

    .line 2516
    invoke-static {p1, v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2519
    :goto_0
    return-void
.end method

.method private writeSameLocalsOneStackItemFrame([II)V
    .locals 4
    .param p1, "stack"    # [I
    .param p2, "offsetDelta"    # I

    .line 2522
    const/16 v0, 0x3f

    if-gt p2, v0, :cond_0

    .line 2526
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, p2, 0x40

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    goto :goto_0

    .line 2531
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    const/16 v3, -0x9

    aput-byte v3, v0, v1

    .line 2532
    invoke-static {p2, v0, v2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2535
    :goto_0
    const/4 v0, 0x0

    aget v0, p1, v0

    invoke-direct {p0, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeType(I)I

    .line 2536
    return-void
.end method

.method private writeType(I)I
    .locals 4
    .param p1, "type"    # I

    .line 2575
    and-int/lit16 v0, p1, 0xff

    .line 2576
    .local v0, "tag":I
    iget-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 2577
    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 2579
    :cond_0
    ushr-int/lit8 v1, p1, 0x8

    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    invoke-static {v1, v2, v3}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result v1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2582
    :cond_1
    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    return v1
.end method

.method private writeTypes([I)I
    .locals 1
    .param p1, "types"    # [I

    .line 2564
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeTypes([II)I

    move-result v0

    return v0
.end method

.method private writeTypes([II)I
    .locals 2
    .param p1, "types"    # [I
    .param p2, "start"    # I

    .line 2568
    move v0, p2

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 2569
    aget v1, p1, v0

    invoke-direct {p0, v1}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->writeType(I)I

    move-result v1

    iput v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    .line 2568
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2571
    .end local v0    # "i":I
    :cond_0
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    return v0
.end method


# virtual methods
.method computeWriteSize()I
    .locals 2

    .line 2416
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getWorstCaseWriteSize()I

    move-result v0

    .line 2417
    .local v0, "writeSize":I
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    .line 2418
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->computeRawStackMap()V

    .line 2419
    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v1, v1, 0x2

    return v1
.end method

.method generate()V
    .locals 6

    .line 1448
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->access$000(Lcom/trendmicro/classfile/ClassFileWriter;)I

    move-result v0

    new-array v0, v0, [Lcom/trendmicro/classfile/SuperBlock;

    iput-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    .line 1449
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v0}, Lcom/trendmicro/classfile/ClassFileWriter;->access$100(Lcom/trendmicro/classfile/ClassFileWriter;)[I

    move-result-object v0

    .line 1451
    .local v0, "initialLocals":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$000(Lcom/trendmicro/classfile/ClassFileWriter;)I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1452
    iget-object v2, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v2}, Lcom/trendmicro/classfile/ClassFileWriter;->access$200(Lcom/trendmicro/classfile/ClassFileWriter;)[I

    move-result-object v2

    aget v2, v2, v1

    .line 1454
    .local v2, "start":I
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->access$000(Lcom/trendmicro/classfile/ClassFileWriter;)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v1, v3, :cond_0

    .line 1455
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->access$300(Lcom/trendmicro/classfile/ClassFileWriter;)I

    move-result v3

    .local v3, "end":I
    goto :goto_1

    .line 1457
    .end local v3    # "end":I
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->this$0:Lcom/trendmicro/classfile/ClassFileWriter;

    invoke-static {v3}, Lcom/trendmicro/classfile/ClassFileWriter;->access$200(Lcom/trendmicro/classfile/ClassFileWriter;)[I

    move-result-object v3

    add-int/lit8 v4, v1, 0x1

    aget v3, v3, v4

    .line 1459
    .restart local v3    # "end":I
    :goto_1
    iget-object v4, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    new-instance v5, Lcom/trendmicro/classfile/SuperBlock;

    invoke-direct {v5, v1, v2, v3, v0}, Lcom/trendmicro/classfile/SuperBlock;-><init>(III[I)V

    aput-object v5, v4, v1

    .line 1451
    .end local v2    # "start":I
    .end local v3    # "end":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1472
    .end local v1    # "i":I
    :cond_1
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->getSuperBlockDependencies()[Lcom/trendmicro/classfile/SuperBlock;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlockDeps:[Lcom/trendmicro/classfile/SuperBlock;

    .line 1474
    invoke-direct {p0}, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->verify()V

    .line 1485
    return-void
.end method

.method write([BI)I
    .locals 3
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .line 2423
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/lit8 v0, v0, 0x2

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt32(I[BI)I

    move-result p2

    .line 2424
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->superBlocks:[Lcom/trendmicro/classfile/SuperBlock;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0, p1, p2}, Lcom/trendmicro/classfile/ClassFileWriter;->putInt16(I[BI)I

    move-result p2

    .line 2425
    iget-object v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMap:[B

    iget v1, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2426
    iget v0, p0, Lcom/trendmicro/classfile/ClassFileWriter$StackMapTable;->rawStackMapTop:I

    add-int/2addr v0, p2

    return v0
.end method
