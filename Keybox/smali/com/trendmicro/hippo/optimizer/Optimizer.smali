.class Lcom/trendmicro/hippo/optimizer/Optimizer;
.super Ljava/lang/Object;
.source "Optimizer.java"


# static fields
.field static final AnyType:I = 0x3

.field static final NoType:I = 0x0

.field static final NumberType:I = 0x1


# instance fields
.field private inDirectCallFunction:Z

.field private parameterUsedInNumberContext:Z

.field theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildStatementList_r(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ObjArray;)V
    .locals 2
    .param p0, "node"    # Lcom/trendmicro/hippo/Node;
    .param p1, "statements"    # Lcom/trendmicro/hippo/ObjArray;

    .line 449
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 450
    .local v0, "type":I
    const/16 v1, 0x82

    if-eq v0, v1, :cond_1

    const/16 v1, 0x8e

    if-eq v0, v1, :cond_1

    const/16 v1, 0x85

    if-eq v0, v1, :cond_1

    const/16 v1, 0x6e

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 461
    :cond_0
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    goto :goto_2

    .line 455
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 456
    .local v1, "child":Lcom/trendmicro/hippo/Node;
    :goto_1
    if-eqz v1, :cond_2

    .line 457
    invoke-static {v1, p1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->buildStatementList_r(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ObjArray;)V

    .line 458
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    goto :goto_1

    .line 460
    .end local v1    # "child":Lcom/trendmicro/hippo/Node;
    :cond_2
    nop

    .line 463
    :goto_2
    return-void
.end method

.method private convertParameter(Lcom/trendmicro/hippo/Node;)Z
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;

    .line 108
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->inDirectCallFunction:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x37

    if-ne v0, v1, :cond_0

    .line 109
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 110
    .local v0, "varIndex":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 111
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Node;->removeProp(I)V

    .line 112
    const/4 v1, 0x1

    return v1

    .line 115
    .end local v0    # "varIndex":I
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private markDCPNumberContext(Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;

    .line 98
    iget-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->inDirectCallFunction:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x37

    if-ne v0, v1, :cond_0

    .line 99
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 100
    .local v0, "varIndex":I
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->parameterUsedInNumberContext:Z

    .line 104
    .end local v0    # "varIndex":I
    :cond_0
    return-void
.end method

.method private optimizeFunction(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)V
    .locals 6
    .param p1, "theFunction"    # Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 35
    iget-object v0, p1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->requiresActivation()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 37
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isTargetOfDirectCall()Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->inDirectCallFunction:Z

    .line 38
    iput-object p1, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 40
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    .line 41
    .local v0, "statementsArray":Lcom/trendmicro/hippo/ObjArray;
    iget-object v1, p1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->buildStatementList_r(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ObjArray;)V

    .line 42
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v1

    new-array v1, v1, [Lcom/trendmicro/hippo/Node;

    .line 43
    .local v1, "theStatementNodes":[Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ObjArray;->toArray([Ljava/lang/Object;)V

    .line 45
    invoke-static {p1, v1}, Lcom/trendmicro/hippo/optimizer/Block;->runFlowAnalyzes(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;[Lcom/trendmicro/hippo/Node;)V

    .line 47
    iget-object v2, p1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->fnode:Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/FunctionNode;->requiresActivation()Z

    move-result v2

    if-nez v2, :cond_2

    .line 55
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->parameterUsedInNumberContext:Z

    .line 56
    array-length v3, v1

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v1, v2

    .line 57
    .local v4, "theStatementNode":Lcom/trendmicro/hippo/Node;
    const/4 v5, 0x1

    invoke-direct {p0, v4, v5}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    .line 56
    .end local v4    # "theStatementNode":Lcom/trendmicro/hippo/Node;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 59
    :cond_1
    iget-boolean v2, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->parameterUsedInNumberContext:Z

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->setParameterNumberContext(Z)V

    .line 62
    :cond_2
    return-void
.end method

.method private rewriteAsObjectChildren(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 4
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 430
    :goto_0
    if-eqz p2, :cond_2

    .line 431
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 432
    .local v0, "nextChild":Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x0

    invoke-direct {p0, p2, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v1

    .line 433
    .local v1, "type":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 434
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 435
    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 436
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/16 v3, 0x96

    invoke-direct {v2, v3, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 437
    .local v2, "nuChild":Lcom/trendmicro/hippo/Node;
    if-nez v0, :cond_0

    .line 438
    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    goto :goto_1

    .line 440
    :cond_0
    invoke-virtual {p1, v2, v0}, Lcom/trendmicro/hippo/Node;->addChildBefore(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 443
    .end local v2    # "nuChild":Lcom/trendmicro/hippo/Node;
    :cond_1
    :goto_1
    move-object p2, v0

    .line 444
    .end local v0    # "nextChild":Lcom/trendmicro/hippo/Node;
    .end local v1    # "type":I
    goto :goto_0

    .line 445
    :cond_2
    return-void
.end method

.method private rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I
    .locals 10
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;
    .param p2, "desired"    # I

    .line 120
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x28

    const/16 v2, 0x8

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq v0, v1, :cond_2d

    const/16 v1, 0x86

    if-eq v0, v1, :cond_2b

    const/16 v1, 0x8d

    const/16 v5, 0x96

    if-eq v0, v1, :cond_27

    const/16 v1, 0x9d

    const/16 v6, 0x97

    if-eq v0, v1, :cond_20

    const/16 v1, 0x37

    if-eq v0, v1, :cond_1d

    const/16 v7, 0x38

    if-eq v0, v7, :cond_20

    const/16 v7, 0x6b

    if-eq v0, v7, :cond_18

    const/16 v7, 0x6c

    if-eq v0, v7, :cond_18

    packed-switch v0, :pswitch_data_0

    const/4 v1, 0x2

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    packed-switch v0, :pswitch_data_3

    .line 421
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteAsObjectChildren(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 422
    return v3

    .line 396
    :pswitch_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 398
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteAsObjectChildren(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 399
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 401
    const/16 v1, 0x9

    .line 402
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 403
    .local v1, "target":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    if-eqz v1, :cond_1

    .line 408
    :goto_0
    if-eqz v0, :cond_2

    .line 409
    invoke-direct {p0, v0, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v2

    .line 410
    .local v2, "type":I
    if-ne v2, v4, :cond_0

    .line 411
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->markDCPNumberContext(Lcom/trendmicro/hippo/Node;)V

    .line 413
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 414
    .end local v2    # "type":I
    goto :goto_0

    .line 416
    :cond_1
    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteAsObjectChildren(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 418
    :cond_2
    return v3

    .line 373
    .end local v0    # "child":Lcom/trendmicro/hippo/Node;
    .end local v1    # "target":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    :pswitch_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 374
    .local v0, "arrayBase":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 375
    .local v6, "arrayIndex":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v0, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v7

    .line 376
    .local v7, "baseType":I
    if-ne v7, v4, :cond_3

    .line 377
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 378
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 379
    new-instance v8, Lcom/trendmicro/hippo/Node;

    invoke-direct {v8, v5, v0}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {p1, v8}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 383
    :cond_3
    invoke-direct {p0, v6, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v5

    .line 384
    .local v5, "indexType":I
    if-ne v5, v4, :cond_4

    .line 385
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 389
    invoke-virtual {p1, v2, v1}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 392
    :cond_4
    return v3

    .line 251
    .end local v0    # "arrayBase":Lcom/trendmicro/hippo/Node;
    .end local v5    # "indexType":I
    .end local v6    # "arrayIndex":Lcom/trendmicro/hippo/Node;
    .end local v7    # "baseType":I
    :pswitch_2
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 252
    .local v0, "lChild":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 253
    .local v5, "rChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v0, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v6

    .line 254
    .local v6, "lType":I
    invoke-direct {p0, v5, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v7

    .line 257
    .local v7, "rType":I
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 258
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 259
    return v3

    .line 261
    :cond_5
    if-ne v7, v4, :cond_a

    .line 262
    invoke-virtual {p1, v2, v1}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    goto :goto_1

    .line 266
    :cond_6
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 267
    if-ne v6, v4, :cond_a

    .line 268
    invoke-virtual {p1, v2, v4}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    goto :goto_1

    .line 272
    :cond_7
    if-ne v6, v4, :cond_9

    .line 273
    if-ne v7, v4, :cond_8

    .line 274
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 275
    return v4

    .line 277
    :cond_8
    invoke-virtual {p1, v2, v4}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    goto :goto_1

    .line 280
    :cond_9
    if-ne v7, v4, :cond_a

    .line 281
    invoke-virtual {p1, v2, v1}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 287
    :cond_a
    :goto_1
    return v3

    .line 212
    .end local v0    # "lChild":Lcom/trendmicro/hippo/Node;
    .end local v5    # "rChild":Lcom/trendmicro/hippo/Node;
    .end local v6    # "lType":I
    .end local v7    # "rType":I
    :pswitch_3
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 213
    .restart local v0    # "lChild":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 214
    .restart local v5    # "rChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v0, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v6

    .line 215
    .restart local v6    # "lType":I
    invoke-direct {p0, v5, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v7

    .line 216
    .restart local v7    # "rType":I
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->markDCPNumberContext(Lcom/trendmicro/hippo/Node;)V

    .line 217
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/optimizer/Optimizer;->markDCPNumberContext(Lcom/trendmicro/hippo/Node;)V

    .line 219
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 220
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 221
    return v3

    .line 222
    :cond_b
    if-ne v7, v4, :cond_10

    .line 223
    invoke-virtual {p1, v2, v1}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    goto :goto_2

    .line 226
    :cond_c
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 227
    if-ne v6, v4, :cond_10

    .line 228
    invoke-virtual {p1, v2, v4}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    goto :goto_2

    .line 232
    :cond_d
    if-ne v6, v4, :cond_f

    .line 233
    if-ne v7, v4, :cond_e

    .line 234
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    goto :goto_2

    .line 237
    :cond_e
    invoke-virtual {p1, v2, v4}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    goto :goto_2

    .line 241
    :cond_f
    if-ne v7, v4, :cond_10

    .line 242
    invoke-virtual {p1, v2, v1}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 247
    :cond_10
    :goto_2
    return v3

    .line 299
    .end local v0    # "lChild":Lcom/trendmicro/hippo/Node;
    .end local v5    # "rChild":Lcom/trendmicro/hippo/Node;
    .end local v6    # "lType":I
    .end local v7    # "rType":I
    :pswitch_4
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 300
    .restart local v0    # "lChild":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 301
    .local v1, "rChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v0, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v5

    .line 302
    .local v5, "lType":I
    invoke-direct {p0, v1, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v7

    .line 303
    .restart local v7    # "rType":I
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->markDCPNumberContext(Lcom/trendmicro/hippo/Node;)V

    .line 304
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->markDCPNumberContext(Lcom/trendmicro/hippo/Node;)V

    .line 305
    if-ne v5, v4, :cond_13

    .line 306
    if-ne v7, v4, :cond_11

    .line 307
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 308
    return v4

    .line 310
    :cond_11
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-nez v8, :cond_12

    .line 311
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 312
    new-instance v8, Lcom/trendmicro/hippo/Node;

    invoke-direct {v8, v6, v1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {p1, v8}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 314
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 316
    :cond_12
    return v4

    .line 318
    :cond_13
    if-ne v7, v4, :cond_15

    .line 319
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-nez v8, :cond_14

    .line 320
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 321
    new-instance v8, Lcom/trendmicro/hippo/Node;

    invoke-direct {v8, v6, v0}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {p1, v8}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 323
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 325
    :cond_14
    return v4

    .line 327
    :cond_15
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-nez v8, :cond_16

    .line 328
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 329
    new-instance v8, Lcom/trendmicro/hippo/Node;

    invoke-direct {v8, v6, v0}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {p1, v8}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 332
    :cond_16
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-nez v8, :cond_17

    .line 333
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 334
    new-instance v8, Lcom/trendmicro/hippo/Node;

    invoke-direct {v8, v6, v1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {p1, v8}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 337
    :cond_17
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 338
    return v4

    .line 151
    .end local v0    # "lChild":Lcom/trendmicro/hippo/Node;
    .end local v1    # "rChild":Lcom/trendmicro/hippo/Node;
    .end local v5    # "lType":I
    .end local v7    # "rType":I
    :cond_18
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 152
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v0, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v5

    .line 153
    .local v5, "type":I
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v6

    if-ne v6, v1, :cond_1a

    .line 154
    if-ne v5, v4, :cond_19

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v1

    if-nez v1, :cond_19

    .line 156
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 157
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->markDCPNumberContext(Lcom/trendmicro/hippo/Node;)V

    .line 158
    return v4

    .line 160
    :cond_19
    return v3

    .line 162
    :cond_1a
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const/16 v2, 0x24

    if-eq v1, v2, :cond_1c

    .line 163
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const/16 v2, 0x21

    if-ne v1, v2, :cond_1b

    goto :goto_3

    .line 166
    :cond_1b
    return v3

    .line 164
    :cond_1c
    :goto_3
    return v5

    .line 134
    .end local v0    # "child":Lcom/trendmicro/hippo/Node;
    .end local v5    # "type":I
    :cond_1d
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 135
    .local v0, "varIndex":I
    iget-boolean v1, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->inDirectCallFunction:Z

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 136
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v1

    if-eqz v1, :cond_1e

    if-ne p2, v4, :cond_1e

    .line 139
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 140
    return v4

    .line 142
    :cond_1e
    iget-object v1, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 143
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 144
    return v4

    .line 146
    :cond_1f
    return v3

    .line 170
    .end local v0    # "varIndex":I
    :cond_20
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 171
    .local v0, "lChild":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 172
    .restart local v1    # "rChild":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v1, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v7

    .line 173
    .restart local v7    # "rType":I
    iget-object v8, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v8, p1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->getVarIndex(Lcom/trendmicro/hippo/Node;)I

    move-result v8

    .line 174
    .local v8, "varIndex":I
    iget-boolean v9, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->inDirectCallFunction:Z

    if-eqz v9, :cond_23

    iget-object v9, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    .line 175
    invoke-virtual {v9, v8}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isParameter(I)Z

    move-result v9

    if-eqz v9, :cond_23

    .line 177
    if-ne v7, v4, :cond_22

    .line 178
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v5

    if-nez v5, :cond_21

    .line 179
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 180
    return v4

    .line 182
    :cond_21
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->markDCPNumberContext(Lcom/trendmicro/hippo/Node;)V

    .line 183
    return v3

    .line 185
    :cond_22
    return v7

    .line 187
    :cond_23
    iget-object v9, p0, Lcom/trendmicro/hippo/optimizer/Optimizer;->theFunction:Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    invoke-virtual {v9, v8}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->isNumberVar(I)Z

    move-result v9

    if-eqz v9, :cond_25

    .line 188
    if-eq v7, v4, :cond_24

    .line 189
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 190
    new-instance v5, Lcom/trendmicro/hippo/Node;

    invoke-direct {v5, v6, v1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {p1, v5}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 193
    :cond_24
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 194
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->markDCPNumberContext(Lcom/trendmicro/hippo/Node;)V

    .line 195
    return v4

    .line 198
    :cond_25
    if-ne v7, v4, :cond_26

    .line 199
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v2

    if-nez v2, :cond_26

    .line 200
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 201
    new-instance v2, Lcom/trendmicro/hippo/Node;

    invoke-direct {v2, v5, v1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 205
    :cond_26
    return v3

    .line 342
    .end local v0    # "lChild":Lcom/trendmicro/hippo/Node;
    .end local v1    # "rChild":Lcom/trendmicro/hippo/Node;
    .end local v7    # "rType":I
    .end local v8    # "varIndex":I
    :cond_27
    :pswitch_5
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 343
    .local v0, "arrayBase":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 344
    .local v1, "arrayIndex":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 345
    .local v6, "rValue":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v0, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v7

    .line 346
    .local v7, "baseType":I
    if-ne v7, v4, :cond_28

    .line 347
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v8

    if-nez v8, :cond_28

    .line 348
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 349
    new-instance v8, Lcom/trendmicro/hippo/Node;

    invoke-direct {v8, v5, v0}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {p1, v8}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 353
    :cond_28
    invoke-direct {p0, v1, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v8

    .line 354
    .local v8, "indexType":I
    if-ne v8, v4, :cond_29

    .line 355
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v9

    if-nez v9, :cond_29

    .line 359
    invoke-virtual {p1, v2, v4}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 362
    :cond_29
    invoke-direct {p0, v6, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v2

    .line 363
    .local v2, "rValueType":I
    if-ne v2, v4, :cond_2a

    .line 364
    invoke-direct {p0, v6}, Lcom/trendmicro/hippo/optimizer/Optimizer;->convertParameter(Lcom/trendmicro/hippo/Node;)Z

    move-result v4

    if-nez v4, :cond_2a

    .line 365
    invoke-virtual {p1, v6}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 366
    new-instance v4, Lcom/trendmicro/hippo/Node;

    invoke-direct {v4, v5, v6}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {p1, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 370
    :cond_2a
    return v3

    .line 122
    .end local v0    # "arrayBase":Lcom/trendmicro/hippo/Node;
    .end local v1    # "arrayIndex":Lcom/trendmicro/hippo/Node;
    .end local v2    # "rValueType":I
    .end local v6    # "rValue":Lcom/trendmicro/hippo/Node;
    .end local v7    # "baseType":I
    .end local v8    # "indexType":I
    :cond_2b
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 123
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v0, v4}, Lcom/trendmicro/hippo/optimizer/Optimizer;->rewriteForNumberVariables(Lcom/trendmicro/hippo/Node;I)I

    move-result v1

    .line 124
    .local v1, "type":I
    if-ne v1, v4, :cond_2c

    .line 125
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 126
    :cond_2c
    return v3

    .line 129
    .end local v0    # "child":Lcom/trendmicro/hippo/Node;
    .end local v1    # "type":I
    :cond_2d
    invoke-virtual {p1, v2, v3}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 130
    return v4

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xe
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x15
        :pswitch_2
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x24
        :pswitch_1
        :pswitch_5
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method optimize(Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 3
    .param p1, "scriptOrFn"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 26
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionCount()I

    move-result v0

    .line 27
    .local v0, "functionCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 28
    invoke-static {p1, v1}, Lcom/trendmicro/hippo/optimizer/OptFunctionNode;->get(Lcom/trendmicro/hippo/ast/ScriptNode;I)Lcom/trendmicro/hippo/optimizer/OptFunctionNode;

    move-result-object v2

    .line 29
    .local v2, "f":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/optimizer/Optimizer;->optimizeFunction(Lcom/trendmicro/hippo/optimizer/OptFunctionNode;)V

    .line 27
    .end local v2    # "f":Lcom/trendmicro/hippo/optimizer/OptFunctionNode;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 31
    .end local v1    # "i":I
    :cond_0
    return-void
.end method
