.class Lcom/trendmicro/hippo/optimizer/Block;
.super Ljava/lang/Object;
.source "Block.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field private static debug_blockCount:I


# instance fields
.field private itsBlockID:I

.field private itsEndNodeIndex:I

.field private itsLiveOnEntrySet:Ljava/util/BitSet;

.field private itsLiveOnExitSet:Ljava/util/BitSet;

.field private itsNotDefSet:Ljava/util/BitSet;

.field private itsPredecessors:[Lcom/trendmicro/hippo/optimizer/Block;

.field private itsStartNodeIndex:I

.field private itsSuccessors:[Lcom/trendmicro/hippo/optimizer/Block;

.field private itsUseBeforeDefSet:Ljava/util/BitSet;


# direct methods
.method constructor <init>(II)V
    .locals 0
    .param p1, "startNodeIndex"    # I
    .param p2, "endNodeIndex"    # I

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput p1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsStartNodeIndex:I

    .line 57
    iput p2, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsEndNodeIndex:I

    .line 58
    return-void
.end method

.method private static assignType([III)Z
    .locals 2
    .param p0, "varTypes"    # [I
    .param p1, "index"    # I
    .param p2, "type"    # I

    .line 335
    aget v0, p0, p1

    .line 336
    .local v0, "prev":I
    aget v1, p0, p1

    or-int/2addr v1, p2

    aput v1, p0, p1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static buildBlocks([Lcom/trendmicro/hippo/Node;)[Lcom/trendmicro/hippo/optimizer/Block;
    .locals 13
    .param p0, "statementNodes"    # [Lcom/trendmicro/hippo/Node;

    .line 109
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 110
    .local v0, "theTargetBlocks":Ljava/util/Map;, "Ljava/util/Map<Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/optimizer/Block$FatBlock;>;"
    new-instance v1, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v1}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    .line 113
    .local v1, "theBlocks":Lcom/trendmicro/hippo/ObjArray;
    const/4 v2, 0x0

    .line 115
    .local v2, "beginNodeIndex":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p0

    const/4 v5, 0x7

    const/4 v6, 0x6

    const/4 v7, 0x5

    const/16 v8, 0x84

    if-ge v3, v4, :cond_5

    .line 116
    aget-object v4, p0, v3

    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    if-eq v4, v7, :cond_2

    if-eq v4, v6, :cond_2

    if-eq v4, v5, :cond_2

    if-eq v4, v8, :cond_0

    goto :goto_1

    .line 119
    :cond_0
    if-eq v3, v2, :cond_4

    .line 120
    add-int/lit8 v4, v3, -0x1

    invoke-static {v2, v4}, Lcom/trendmicro/hippo/optimizer/Block;->newFatBlock(II)Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    move-result-object v4

    .line 121
    .local v4, "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    aget-object v5, p0, v2

    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    if-ne v5, v8, :cond_1

    .line 122
    aget-object v5, p0, v2

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    :cond_1
    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 126
    move v2, v3

    .line 127
    .end local v4    # "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    goto :goto_1

    .line 134
    :cond_2
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/optimizer/Block;->newFatBlock(II)Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    move-result-object v4

    .line 135
    .restart local v4    # "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    aget-object v5, p0, v2

    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    if-ne v5, v8, :cond_3

    .line 136
    aget-object v5, p0, v2

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    :cond_3
    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 140
    add-int/lit8 v2, v3, 0x1

    .line 115
    .end local v4    # "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 146
    .end local v3    # "i":I
    :cond_5
    array-length v3, p0

    if-eq v2, v3, :cond_7

    .line 147
    array-length v3, p0

    add-int/lit8 v3, v3, -0x1

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/optimizer/Block;->newFatBlock(II)Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    move-result-object v3

    .line 148
    .local v3, "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    aget-object v4, p0, v2

    invoke-virtual {v4}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    if-ne v4, v8, :cond_6

    .line 149
    aget-object v4, p0, v2

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    :cond_6
    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 156
    .end local v3    # "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    :cond_7
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_b

    .line 157
    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    .line 159
    .restart local v4    # "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    iget-object v8, v4, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->realBlock:Lcom/trendmicro/hippo/optimizer/Block;

    iget v8, v8, Lcom/trendmicro/hippo/optimizer/Block;->itsEndNodeIndex:I

    aget-object v8, p0, v8

    .line 160
    .local v8, "blockEndNode":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v8}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v9

    .line 162
    .local v9, "blockEndNodeType":I
    if-eq v9, v7, :cond_8

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    if-ge v3, v10, :cond_8

    .line 163
    add-int/lit8 v10, v3, 0x1

    invoke-virtual {v1, v10}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    .line 164
    .local v10, "fallThruTarget":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    invoke-virtual {v4, v10}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->addSuccessor(Lcom/trendmicro/hippo/optimizer/Block$FatBlock;)V

    .line 165
    invoke-virtual {v10, v4}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->addPredecessor(Lcom/trendmicro/hippo/optimizer/Block$FatBlock;)V

    .line 169
    .end local v10    # "fallThruTarget":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    :cond_8
    if-eq v9, v5, :cond_9

    if-eq v9, v6, :cond_9

    if-ne v9, v7, :cond_a

    .line 172
    :cond_9
    move-object v10, v8

    check-cast v10, Lcom/trendmicro/hippo/ast/Jump;

    iget-object v10, v10, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 173
    .local v10, "target":Lcom/trendmicro/hippo/Node;
    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    .line 174
    .local v11, "branchTargetBlock":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    iget-object v12, v11, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->realBlock:Lcom/trendmicro/hippo/optimizer/Block;

    invoke-virtual {v10, v6, v12}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 175
    invoke-virtual {v4, v11}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->addSuccessor(Lcom/trendmicro/hippo/optimizer/Block$FatBlock;)V

    .line 176
    invoke-virtual {v11, v4}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->addPredecessor(Lcom/trendmicro/hippo/optimizer/Block$FatBlock;)V

    .line 156
    .end local v4    # "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    .end local v8    # "blockEndNode":Lcom/trendmicro/hippo/Node;
    .end local v9    # "blockEndNodeType":I
    .end local v10    # "target":Lcom/trendmicro/hippo/Node;
    .end local v11    # "branchTargetBlock":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    :cond_a
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 180
    .end local v3    # "i":I
    :cond_b
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v3

    new-array v3, v3, [Lcom/trendmicro/hippo/optimizer/Block;

    .line 182
    .local v3, "result":[Lcom/trendmicro/hippo/optimizer/Block;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v5

    if-ge v4, v5, :cond_c

    .line 183
    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    .line 184
    .local v5, "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    iget-object v6, v5, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->realBlock:Lcom/trendmicro/hippo/optimizer/Block;

    .line 185
    .local v6, "b":Lcom/trendmicro/hippo/optimizer/Block;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->getSuccessors()[Lcom/trendmicro/hippo/optimizer/Block;

    move-result-object v7

    iput-object v7, v6, Lcom/trendmicro/hippo/optimizer/Block;->itsSuccessors:[Lcom/trendmicro/hippo/optimizer/Block;

    .line 186
    invoke-virtual {v5}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->getPredecessors()[Lcom/trendmicro/hippo/optimizer/Block;

    move-result-object v7

    iput-object v7, v6, Lcom/trendmicro/hippo/optimizer/Block;->itsPredecessors:[Lcom/trendmicro/hippo/optimizer/Block;

    .line 187
    iput v4, v6, Lcom/trendmicro/hippo/optimizer/Block;->itsBlockID:I

    .line 188
    aput-object v6, v3, v4

    .line 182
    .end local v5    # "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    .end local v6    # "b":Lcom/trendmicro/hippo/optimizer/Block;
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 191
    .end local v4    # "i":I
    :cond_c
    return-object v3
.end method

.method private doReachedUseDataFlow()Z
    .locals 4

    .line 436
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->clear()V

    .line 437
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsSuccessors:[Lcom/trendmicro/hippo/optimizer/Block;

    if-eqz v0, :cond_0

    .line 438
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsSuccessors:[Lcom/trendmicro/hippo/optimizer/Block;

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 439
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/trendmicro/hippo/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    invoke-virtual {v2, v1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 438
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 442
    .end local v0    # "i":I
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-static {v0, v1, v2, v3}, Lcom/trendmicro/hippo/optimizer/Block;->updateEntrySet(Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;)Z

    move-result v0

    return v0
.end method

.method private doTypeFlow(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;[I)Z
    .locals 4
    .param p1, "fn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p2, "statementNodes"    # [Lcom/trendmicro/hippo/Node;
    .param p3, "varTypes"    # [I

    .line 609
    const/4 v0, 0x0

    .line 611
    .local v0, "changed":Z
    iget v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsStartNodeIndex:I

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsEndNodeIndex:I

    if-gt v1, v2, :cond_1

    .line 612
    aget-object v2, p2, v1

    .line 613
    .local v2, "n":Lcom/trendmicro/hippo/Node;
    if-eqz v2, :cond_0

    .line 614
    invoke-static {p1, v2, p3}, Lcom/trendmicro/hippo/optimizer/Block;->findDefPoints(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)Z

    move-result v3

    or-int/2addr v0, v3

    .line 611
    .end local v2    # "n":Lcom/trendmicro/hippo/Node;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 618
    .end local v1    # "i":I
    :cond_1
    return v0
.end method

.method private static findDefPoints(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)Z
    .locals 7
    .param p0, "fn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;
    .param p2, "varTypes"    # [I

    .line 575
    const/4 v0, 0x0

    .line 576
    .local v0, "result":Z
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 577
    .local v1, "first":Lcom/trendmicro/hippo/Node;
    move-object v2, v1

    .local v2, "next":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v2, :cond_0

    .line 578
    invoke-static {p0, v2, p2}, Lcom/trendmicro/hippo/optimizer/Block;->findDefPoints(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)Z

    move-result v3

    or-int/2addr v0, v3

    .line 577
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    goto :goto_0

    .line 580
    .end local v2    # "next":Lcom/trendmicro/hippo/Node;
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0x38

    if-eq v2, v3, :cond_3

    const/16 v4, 0x9d

    if-eq v2, v4, :cond_3

    const/16 v3, 0x6b

    if-eq v2, v3, :cond_1

    const/16 v3, 0x6c

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 583
    :cond_1
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0x37

    if-ne v2, v3, :cond_5

    .line 585
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v2

    .line 586
    .local v2, "i":I
    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v3

    aget-boolean v3, v3, v2

    if-nez v3, :cond_2

    .line 587
    const/4 v3, 0x1

    invoke-static {p2, v2, v3}, Lcom/trendmicro/hippo/optimizer/Block;->assignType([III)Z

    move-result v3

    or-int/2addr v0, v3

    .line 589
    .end local v2    # "i":I
    :cond_2
    goto :goto_1

    .line 593
    :cond_3
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 594
    .local v2, "rValue":Lcom/trendmicro/hippo/Node;
    invoke-static {p0, v2, p2}, Lcom/trendmicro/hippo/optimizer/Block;->findExpressionType(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)I

    move-result v4

    .line 595
    .local v4, "theType":I
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v5

    .line 596
    .local v5, "i":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v6

    if-ne v6, v3, :cond_4

    iget-object v3, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 597
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v3

    aget-boolean v3, v3, v5

    if-nez v3, :cond_5

    .line 598
    :cond_4
    invoke-static {p2, v5, v4}, Lcom/trendmicro/hippo/optimizer/Block;->assignType([III)Z

    move-result v3

    or-int/2addr v0, v3

    .line 603
    .end local v2    # "rValue":Lcom/trendmicro/hippo/Node;
    .end local v4    # "theType":I
    .end local v5    # "i":I
    :cond_5
    :goto_1
    return v0
.end method

.method private static findExpressionType(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)I
    .locals 5
    .param p0, "fn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;
    .param p2, "varTypes"    # [I

    .line 464
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x23

    if-eq v0, v1, :cond_3

    const/16 v1, 0x25

    if-eq v0, v1, :cond_3

    const/16 v1, 0x28

    const/4 v2, 0x1

    if-eq v0, v1, :cond_2

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_3

    const/16 v1, 0x67

    if-eq v0, v1, :cond_1

    const/16 v1, 0x9d

    if-eq v0, v1, :cond_3

    const/16 v1, 0x37

    if-eq v0, v1, :cond_0

    const/16 v1, 0x38

    if-eq v0, v1, :cond_3

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    packed-switch v0, :pswitch_data_3

    .line 569
    const/4 v0, 0x3

    return v0

    .line 562
    :pswitch_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 563
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    invoke-static {p0, v0, p2}, Lcom/trendmicro/hippo/optimizer/Block;->findExpressionType(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)I

    move-result v1

    .line 564
    .local v1, "lType":I
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-static {p0, v2, p2}, Lcom/trendmicro/hippo/optimizer/Block;->findExpressionType(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)I

    move-result v2

    .line 565
    .local v2, "rType":I
    or-int v3, v1, v2

    return v3

    .line 538
    .end local v0    # "child":Lcom/trendmicro/hippo/Node;
    .end local v1    # "lType":I
    .end local v2    # "rType":I
    :pswitch_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 539
    .restart local v0    # "child":Lcom/trendmicro/hippo/Node;
    invoke-static {p0, v0, p2}, Lcom/trendmicro/hippo/optimizer/Block;->findExpressionType(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)I

    move-result v1

    .line 540
    .restart local v1    # "lType":I
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-static {p0, v2, p2}, Lcom/trendmicro/hippo/optimizer/Block;->findExpressionType(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)I

    move-result v2

    .line 541
    .restart local v2    # "rType":I
    or-int v3, v1, v2

    return v3

    .line 497
    .end local v0    # "child":Lcom/trendmicro/hippo/Node;
    .end local v1    # "lType":I
    .end local v2    # "rType":I
    :pswitch_2
    return v2

    .line 480
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    aget v0, p2, v0

    return v0

    .line 545
    :cond_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 546
    .local v0, "ifTrue":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 547
    .local v1, "ifFalse":Lcom/trendmicro/hippo/Node;
    invoke-static {p0, v0, p2}, Lcom/trendmicro/hippo/optimizer/Block;->findExpressionType(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)I

    move-result v2

    .line 548
    .local v2, "ifTrueType":I
    invoke-static {p0, v1, p2}, Lcom/trendmicro/hippo/optimizer/Block;->findExpressionType(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)I

    move-result v3

    .line 549
    .local v3, "ifFalseType":I
    or-int v4, v2, v3

    return v4

    .line 466
    .end local v0    # "ifTrue":Lcom/trendmicro/hippo/Node;
    .end local v1    # "ifFalse":Lcom/trendmicro/hippo/Node;
    .end local v2    # "ifTrueType":I
    .end local v3    # "ifFalseType":I
    :cond_2
    return v2

    .line 558
    :cond_3
    :pswitch_3
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lcom/trendmicro/hippo/optimizer/Block;->findExpressionType(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;[I)I

    move-result v0

    return v0

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x12
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1b
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x69
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private initLiveOnEntrySets(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;)V
    .locals 3
    .param p1, "fn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p2, "statementNodes"    # [Lcom/trendmicro/hippo/Node;

    .line 416
    invoke-virtual {p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarCount()I

    move-result v0

    .line 417
    .local v0, "listLength":I
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v0}, Ljava/util/BitSet;-><init>(I)V

    iput-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    .line 418
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v0}, Ljava/util/BitSet;-><init>(I)V

    iput-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    .line 419
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v0}, Ljava/util/BitSet;-><init>(I)V

    iput-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    .line 420
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1, v0}, Ljava/util/BitSet;-><init>(I)V

    iput-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    .line 421
    iget v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsStartNodeIndex:I

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsEndNodeIndex:I

    if-gt v1, v2, :cond_0

    .line 422
    aget-object v2, p2, v1

    .line 423
    .local v2, "n":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, p1, v2}, Lcom/trendmicro/hippo/optimizer/Block;->lookForVariableAccess(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;)V

    .line 421
    .end local v2    # "n":Lcom/trendmicro/hippo/Node;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 425
    .end local v1    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/BitSet;->flip(II)V

    .line 426
    return-void
.end method

.method private lookForVariableAccess(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;)V
    .locals 4
    .param p1, "fn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p2, "n"    # Lcom/trendmicro/hippo/Node;

    .line 359
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x37

    if-eq v0, v1, :cond_6

    const/16 v2, 0x38

    if-eq v0, v2, :cond_5

    const/16 v2, 0x6b

    if-eq v0, v2, :cond_2

    const/16 v2, 0x6c

    if-eq v0, v2, :cond_2

    const/16 v1, 0x8a

    if-eq v0, v1, :cond_0

    const/16 v1, 0x9d

    if-eq v0, v1, :cond_5

    .line 400
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 401
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v0, :cond_8

    .line 402
    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/optimizer/Block;->lookForVariableAccess(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;)V

    .line 403
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    goto :goto_0

    .line 364
    .end local v0    # "child":Lcom/trendmicro/hippo/Node;
    :cond_0
    iget-object v0, p1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ast/FunctionNode;->getIndexForNameNode(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 365
    .local v0, "varIndex":I
    const/4 v1, -0x1

    if-le v0, v1, :cond_1

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 366
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 368
    .end local v0    # "varIndex":I
    :cond_1
    goto :goto_2

    .line 372
    :cond_2
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 373
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    if-ne v2, v1, :cond_4

    .line 374
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v1

    .line 375
    .local v1, "varIndex":I
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v2, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v2

    if-nez v2, :cond_3

    .line 376
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    invoke-virtual {v2, v1}, Ljava/util/BitSet;->set(I)V

    .line 377
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v2, v1}, Ljava/util/BitSet;->set(I)V

    .line 378
    .end local v1    # "varIndex":I
    goto :goto_1

    .line 379
    :cond_4
    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/optimizer/Block;->lookForVariableAccess(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;)V

    .line 382
    .end local v0    # "child":Lcom/trendmicro/hippo/Node;
    :goto_1
    goto :goto_2

    .line 386
    :cond_5
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 387
    .local v0, "lhs":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 388
    .local v1, "rhs":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, p1, v1}, Lcom/trendmicro/hippo/optimizer/Block;->lookForVariableAccess(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;Lcom/trendmicro/hippo/Node;)V

    .line 389
    iget-object v2, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/BitSet;->set(I)V

    .line 391
    .end local v0    # "lhs":Lcom/trendmicro/hippo/Node;
    .end local v1    # "rhs":Lcom/trendmicro/hippo/Node;
    goto :goto_2

    .line 394
    :cond_6
    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 395
    .local v0, "varIndex":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-nez v1, :cond_7

    .line 396
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 398
    .end local v0    # "varIndex":I
    :cond_7
    nop

    .line 407
    :cond_8
    :goto_2
    return-void
.end method

.method private markAnyTypeVariables([I)V
    .locals 2
    .param p1, "varTypes"    # [I

    .line 341
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-eq v0, v1, :cond_1

    .line 342
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 343
    const/4 v1, 0x3

    invoke-static {p1, v0, v1}, Lcom/trendmicro/hippo/optimizer/Block;->assignType([III)Z

    .line 341
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 347
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private static newFatBlock(II)Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    .locals 2
    .param p0, "startNodeIndex"    # I
    .param p1, "endNodeIndex"    # I

    .line 196
    new-instance v0, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;-><init>(Lcom/trendmicro/hippo/optimizer/Block$1;)V

    .line 197
    .local v0, "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    new-instance v1, Lcom/trendmicro/hippo/optimizer/Block;

    invoke-direct {v1, p0, p1}, Lcom/trendmicro/hippo/optimizer/Block;-><init>(II)V

    iput-object v1, v0, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->realBlock:Lcom/trendmicro/hippo/optimizer/Block;

    .line 198
    return-object v0
.end method

.method private printLiveOnEntrySet(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)V
    .locals 0
    .param p1, "fn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 636
    return-void
.end method

.method private static reachingDefDataFlow(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;[Lcom/trendmicro/hippo/optimizer/Block;[I)V
    .locals 10
    .param p0, "fn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p1, "statementNodes"    # [Lcom/trendmicro/hippo/Node;
    .param p2, "theBlocks"    # [Lcom/trendmicro/hippo/optimizer/Block;
    .param p3, "varTypes"    # [I

    .line 248
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 249
    aget-object v1, p2, v0

    invoke-direct {v1, p0, p1}, Lcom/trendmicro/hippo/optimizer/Block;->initLiveOnEntrySets(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;)V

    .line 248
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 256
    .end local v0    # "i":I
    :cond_0
    array-length v0, p2

    new-array v0, v0, [Z

    .line 257
    .local v0, "visit":[Z
    array-length v1, p2

    new-array v1, v1, [Z

    .line 258
    .local v1, "doneOnce":[Z
    array-length v2, p2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    .line 259
    .local v2, "vIndex":I
    const/4 v4, 0x0

    .line 260
    .local v4, "needRescan":Z
    aput-boolean v3, v0, v2

    .line 262
    :goto_1
    aget-boolean v5, v0, v2

    const/4 v6, 0x0

    if-nez v5, :cond_1

    aget-boolean v5, v1, v2

    if-nez v5, :cond_3

    .line 263
    :cond_1
    aput-boolean v3, v1, v2

    .line 264
    aput-boolean v6, v0, v2

    .line 265
    aget-object v5, p2, v2

    invoke-direct {v5}, Lcom/trendmicro/hippo/optimizer/Block;->doReachedUseDataFlow()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 266
    aget-object v5, p2, v2

    iget-object v5, v5, Lcom/trendmicro/hippo/optimizer/Block;->itsPredecessors:[Lcom/trendmicro/hippo/optimizer/Block;

    .line 267
    .local v5, "pred":[Lcom/trendmicro/hippo/optimizer/Block;
    if-eqz v5, :cond_3

    .line 268
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    array-length v8, v5

    if-ge v7, v8, :cond_3

    .line 269
    aget-object v8, v5, v7

    iget v8, v8, Lcom/trendmicro/hippo/optimizer/Block;->itsBlockID:I

    .line 270
    .local v8, "index":I
    aput-boolean v3, v0, v8

    .line 271
    if-le v8, v2, :cond_2

    move v9, v3

    goto :goto_3

    :cond_2
    move v9, v6

    :goto_3
    or-int/2addr v4, v9

    .line 268
    .end local v8    # "index":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 276
    .end local v5    # "pred":[Lcom/trendmicro/hippo/optimizer/Block;
    .end local v7    # "i":I
    :cond_3
    if-nez v2, :cond_5

    .line 277
    if-eqz v4, :cond_4

    .line 278
    array-length v5, p2

    add-int/lit8 v2, v5, -0x1

    .line 279
    const/4 v4, 0x0

    goto :goto_1

    .line 293
    :cond_4
    aget-object v3, p2, v6

    invoke-direct {v3, p3}, Lcom/trendmicro/hippo/optimizer/Block;->markAnyTypeVariables([I)V

    .line 294
    return-void

    .line 284
    :cond_5
    add-int/lit8 v2, v2, -0x1

    goto :goto_1
.end method

.method static runFlowAnalyzes(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;)V
    .locals 7
    .param p0, "fn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p1, "statementNodes"    # [Lcom/trendmicro/hippo/Node;

    .line 62
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamCount()I

    move-result v0

    .line 63
    .local v0, "paramCount":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParamAndVarCount()I

    move-result v1

    .line 64
    .local v1, "varCount":I
    new-array v2, v1, [I

    .line 66
    .local v2, "varTypes":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-eq v3, v0, :cond_0

    .line 67
    const/4 v4, 0x3

    aput v4, v2, v3

    .line 66
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 71
    .end local v3    # "i":I
    :cond_0
    move v3, v0

    .restart local v3    # "i":I
    :goto_1
    if-eq v3, v1, :cond_1

    .line 72
    const/4 v4, 0x0

    aput v4, v2, v3

    .line 71
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 75
    .end local v3    # "i":I
    :cond_1
    invoke-static {p1}, Lcom/trendmicro/hippo/optimizer/Block;->buildBlocks([Lcom/trendmicro/hippo/Node;)[Lcom/trendmicro/hippo/optimizer/Block;

    move-result-object v3

    .line 84
    .local v3, "theBlocks":[Lcom/trendmicro/hippo/optimizer/Block;
    invoke-static {p0, p1, v3, v2}, Lcom/trendmicro/hippo/optimizer/Block;->reachingDefDataFlow(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;[Lcom/trendmicro/hippo/optimizer/Block;[I)V

    .line 85
    invoke-static {p0, p1, v3, v2}, Lcom/trendmicro/hippo/optimizer/Block;->typeFlow(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;[Lcom/trendmicro/hippo/optimizer/Block;[I)V

    .line 98
    move v4, v0

    .local v4, "i":I
    :goto_2
    if-eq v4, v1, :cond_3

    .line 99
    aget v5, v2, v4

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    .line 100
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->setIsNumberVar(I)V

    .line 98
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 104
    .end local v4    # "i":I
    :cond_3
    return-void
.end method

.method private static toString([Lcom/trendmicro/hippo/optimizer/Block;[Lcom/trendmicro/hippo/Node;)Ljava/lang/String;
    .locals 1
    .param p0, "blockList"    # [Lcom/trendmicro/hippo/optimizer/Block;
    .param p1, "statementNodes"    # [Lcom/trendmicro/hippo/Node;

    .line 203
    const/4 v0, 0x0

    return-object v0
.end method

.method private static typeFlow(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;[Lcom/trendmicro/hippo/optimizer/Block;[I)V
    .locals 10
    .param p0, "fn"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    .param p1, "statementNodes"    # [Lcom/trendmicro/hippo/Node;
    .param p2, "theBlocks"    # [Lcom/trendmicro/hippo/optimizer/Block;
    .param p3, "varTypes"    # [I

    .line 299
    array-length v0, p2

    new-array v0, v0, [Z

    .line 300
    .local v0, "visit":[Z
    array-length v1, p2

    new-array v1, v1, [Z

    .line 301
    .local v1, "doneOnce":[Z
    const/4 v2, 0x0

    .line 302
    .local v2, "vIndex":I
    const/4 v3, 0x0

    .line 303
    .local v3, "needRescan":Z
    const/4 v4, 0x1

    aput-boolean v4, v0, v2

    .line 305
    :goto_0
    aget-boolean v5, v0, v2

    if-nez v5, :cond_0

    aget-boolean v5, v1, v2

    if-nez v5, :cond_2

    .line 306
    :cond_0
    aput-boolean v4, v1, v2

    .line 307
    const/4 v5, 0x0

    aput-boolean v5, v0, v2

    .line 308
    aget-object v6, p2, v2

    invoke-direct {v6, p0, p1, p3}, Lcom/trendmicro/hippo/optimizer/Block;->doTypeFlow(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;[I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 310
    aget-object v6, p2, v2

    iget-object v6, v6, Lcom/trendmicro/hippo/optimizer/Block;->itsSuccessors:[Lcom/trendmicro/hippo/optimizer/Block;

    .line 311
    .local v6, "succ":[Lcom/trendmicro/hippo/optimizer/Block;
    if-eqz v6, :cond_2

    .line 312
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    array-length v8, v6

    if-ge v7, v8, :cond_2

    .line 313
    aget-object v8, v6, v7

    iget v8, v8, Lcom/trendmicro/hippo/optimizer/Block;->itsBlockID:I

    .line 314
    .local v8, "index":I
    aput-boolean v4, v0, v8

    .line 315
    if-ge v8, v2, :cond_1

    move v9, v4

    goto :goto_2

    :cond_1
    move v9, v5

    :goto_2
    or-int/2addr v3, v9

    .line 312
    .end local v8    # "index":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 320
    .end local v6    # "succ":[Lcom/trendmicro/hippo/optimizer/Block;
    .end local v7    # "i":I
    :cond_2
    array-length v5, p2

    sub-int/2addr v5, v4

    if-ne v2, v5, :cond_4

    .line 321
    if-eqz v3, :cond_3

    .line 322
    const/4 v2, 0x0

    .line 323
    const/4 v3, 0x0

    goto :goto_0

    .line 331
    :cond_3
    return-void

    .line 328
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static updateEntrySet(Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;)Z
    .locals 2
    .param p0, "entrySet"    # Ljava/util/BitSet;
    .param p1, "exitSet"    # Ljava/util/BitSet;
    .param p2, "useBeforeDef"    # Ljava/util/BitSet;
    .param p3, "notDef"    # Ljava/util/BitSet;

    .line 448
    invoke-virtual {p0}, Ljava/util/BitSet;->cardinality()I

    move-result v0

    .line 449
    .local v0, "card":I
    invoke-virtual {p0, p1}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 450
    invoke-virtual {p0, p3}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    .line 451
    invoke-virtual {p0, p2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 452
    invoke-virtual {p0}, Ljava/util/BitSet;->cardinality()I

    move-result v1

    if-eq v1, v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
