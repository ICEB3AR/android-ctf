.class public Lcom/trendmicro/hippo/NodeTransformer;
.super Ljava/lang/Object;
.source "NodeTransformer.java"


# instance fields
.field private hasFinally:Z

.field private loopEnds:Lcom/trendmicro/hippo/ObjArray;

.field private loops:Lcom/trendmicro/hippo/ObjArray;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method private static addBeforeCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p0, "parent"    # Lcom/trendmicro/hippo/Node;
    .param p1, "previous"    # Lcom/trendmicro/hippo/Node;
    .param p2, "current"    # Lcom/trendmicro/hippo/Node;
    .param p3, "toAdd"    # Lcom/trendmicro/hippo/Node;

    .line 535
    if-nez p1, :cond_1

    .line 536
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    if-eq p2, v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 537
    :cond_0
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    goto :goto_0

    .line 539
    :cond_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    if-eq p2, v0, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 540
    :cond_2
    invoke-virtual {p0, p3, p1}, Lcom/trendmicro/hippo/Node;->addChildAfter(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 542
    :goto_0
    return-object p3
.end method

.method private static replaceCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p0, "parent"    # Lcom/trendmicro/hippo/Node;
    .param p1, "previous"    # Lcom/trendmicro/hippo/Node;
    .param p2, "current"    # Lcom/trendmicro/hippo/Node;
    .param p3, "replacement"    # Lcom/trendmicro/hippo/Node;

    .line 548
    if-nez p1, :cond_1

    .line 549
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    if-eq p2, v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 550
    :cond_0
    invoke-virtual {p0, p2, p3}, Lcom/trendmicro/hippo/Node;->replaceChild(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_0

    .line 551
    :cond_1
    iget-object v0, p1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    if-ne v0, p2, :cond_2

    .line 554
    invoke-virtual {p0, p1, p3}, Lcom/trendmicro/hippo/Node;->replaceChildAfter(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    goto :goto_0

    .line 556
    :cond_2
    invoke-virtual {p0, p2, p3}, Lcom/trendmicro/hippo/Node;->replaceChild(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 558
    :goto_0
    return-object p3
.end method

.method private transformCompilationUnit(Lcom/trendmicro/hippo/ast/ScriptNode;Z)V
    .locals 9
    .param p1, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p2, "inStrictMode"    # Z

    .line 54
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/NodeTransformer;->loops:Lcom/trendmicro/hippo/ObjArray;

    .line 55
    new-instance v0, Lcom/trendmicro/hippo/ObjArray;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjArray;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/NodeTransformer;->loopEnds:Lcom/trendmicro/hippo/ObjArray;

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/NodeTransformer;->hasFinally:Z

    .line 61
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v1

    const/4 v2, 0x1

    const/16 v3, 0x6e

    if-ne v1, v3, :cond_1

    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 62
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->requiresActivation()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v0

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v2

    .line 63
    .local v1, "createScopeObjects":Z
    :goto_1
    if-nez v1, :cond_2

    move v0, v2

    :cond_2
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->flattenSymbolTable(Z)V

    .line 67
    move-object v3, p0

    move-object v4, p1

    move-object v5, p1

    move-object v6, p1

    move v7, v1

    move v8, p2

    invoke-direct/range {v3 .. v8}, Lcom/trendmicro/hippo/NodeTransformer;->transformCompilationUnit_r(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/Scope;ZZ)V

    .line 69
    return-void
.end method

.method private transformCompilationUnit_r(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/Scope;ZZ)V
    .locals 18
    .param p1, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p2, "parent"    # Lcom/trendmicro/hippo/Node;
    .param p3, "scope"    # Lcom/trendmicro/hippo/ast/Scope;
    .param p4, "createScopeObjects"    # Z
    .param p5, "inStrictMode"    # Z

    .line 77
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    const/4 v0, 0x0

    .line 80
    .local v0, "node":Lcom/trendmicro/hippo/Node;
    :goto_0
    const/4 v1, 0x0

    .line 81
    .local v1, "previous":Lcom/trendmicro/hippo/Node;
    if-nez v0, :cond_0

    .line 82
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    move-object v10, v1

    goto :goto_1

    .line 84
    :cond_0
    move-object v1, v0

    .line 85
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    move-object v10, v1

    .line 87
    .end local v1    # "previous":Lcom/trendmicro/hippo/Node;
    .local v10, "previous":Lcom/trendmicro/hippo/Node;
    :goto_1
    if-nez v0, :cond_1

    .line 88
    nop

    .line 412
    .end local v10    # "previous":Lcom/trendmicro/hippo/Node;
    return-void

    .line 91
    .restart local v10    # "previous":Lcom/trendmicro/hippo/Node;
    :cond_1
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    .line 92
    .local v1, "type":I
    const/16 v2, 0x9a

    const/16 v3, 0x82

    const/16 v4, 0x9f

    const/16 v5, 0x27

    if-eqz p4, :cond_5

    const/16 v11, 0x9e

    if-eq v1, v3, :cond_2

    const/16 v12, 0x85

    if-eq v1, v12, :cond_2

    if-ne v1, v11, :cond_5

    :cond_2
    instance-of v12, v0, Lcom/trendmicro/hippo/ast/Scope;

    if-eqz v12, :cond_5

    .line 97
    move-object v12, v0

    check-cast v12, Lcom/trendmicro/hippo/ast/Scope;

    .line 98
    .local v12, "newScope":Lcom/trendmicro/hippo/ast/Scope;
    invoke-virtual {v12}, Lcom/trendmicro/hippo/ast/Scope;->getSymbolTable()Ljava/util/Map;

    move-result-object v13

    if-eqz v13, :cond_5

    .line 101
    new-instance v13, Lcom/trendmicro/hippo/Node;

    if-ne v1, v11, :cond_3

    move v11, v4

    goto :goto_2

    .line 102
    :cond_3
    move v11, v2

    :goto_2
    invoke-direct {v13, v11}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v11, v13

    .line 103
    .local v11, "let":Lcom/trendmicro/hippo/Node;
    new-instance v13, Lcom/trendmicro/hippo/Node;

    invoke-direct {v13, v2}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 104
    .local v13, "innerLet":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v11, v13}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 105
    invoke-virtual {v12}, Lcom/trendmicro/hippo/ast/Scope;->getSymbolTable()Ljava/util/Map;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_4

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 106
    .local v15, "name":Ljava/lang/String;
    invoke-static {v5, v15}, Lcom/trendmicro/hippo/Node;->newString(ILjava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-virtual {v13, v3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 107
    .end local v15    # "name":Ljava/lang/String;
    const/16 v3, 0x82

    goto :goto_3

    .line 108
    :cond_4
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/trendmicro/hippo/ast/Scope;->setSymbolTable(Ljava/util/Map;)V

    .line 109
    move-object v3, v0

    .line 110
    .local v3, "oldNode":Lcom/trendmicro/hippo/Node;
    invoke-static {v8, v10, v0, v11}, Lcom/trendmicro/hippo/NodeTransformer;->replaceCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 111
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    .line 112
    invoke-virtual {v11, v3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    move v11, v1

    goto :goto_4

    .line 116
    .end local v3    # "oldNode":Lcom/trendmicro/hippo/Node;
    .end local v11    # "let":Lcom/trendmicro/hippo/Node;
    .end local v12    # "newScope":Lcom/trendmicro/hippo/ast/Scope;
    .end local v13    # "innerLet":Lcom/trendmicro/hippo/Node;
    :cond_5
    move v11, v1

    .end local v1    # "type":I
    .local v11, "type":I
    :goto_4
    const/4 v1, 0x3

    if-eq v11, v1, :cond_38

    const/4 v3, 0x4

    const/16 v12, 0x88

    const/16 v13, 0x7c

    const/16 v14, 0x52

    if-eq v11, v3, :cond_2d

    const/4 v3, 0x7

    if-eq v11, v3, :cond_28

    const/16 v3, 0x31

    const/16 v15, 0x8

    if-eq v11, v15, :cond_1c

    const/16 v15, 0x26

    if-eq v11, v15, :cond_1b

    if-eq v11, v5, :cond_1d

    const/16 v15, 0x49

    if-eq v11, v15, :cond_1a

    if-eq v11, v14, :cond_19

    const/16 v15, 0x73

    if-eq v11, v15, :cond_18

    const/16 v15, 0x8a

    if-eq v11, v15, :cond_16

    if-eq v11, v4, :cond_d

    packed-switch v11, :pswitch_data_0

    packed-switch v11, :pswitch_data_1

    packed-switch v11, :pswitch_data_2

    packed-switch v11, :pswitch_data_3

    goto/16 :goto_1a

    .line 127
    :pswitch_0
    iget-object v2, v6, Lcom/trendmicro/hippo/NodeTransformer;->loops:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/ObjArray;->push(Ljava/lang/Object;)V

    .line 128
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 129
    .local v2, "leave":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v3

    if-eq v3, v1, :cond_6

    .line 130
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 132
    :cond_6
    iget-object v1, v6, Lcom/trendmicro/hippo/NodeTransformer;->loopEnds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ObjArray;->push(Ljava/lang/Object;)V

    .line 133
    goto/16 :goto_1a

    .line 222
    .end local v2    # "leave":Lcom/trendmicro/hippo/Node;
    :pswitch_1
    move-object v2, v0

    check-cast v2, Lcom/trendmicro/hippo/ast/Jump;

    .line 223
    .local v2, "jump":Lcom/trendmicro/hippo/ast/Jump;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/Jump;->getJumpStatement()Lcom/trendmicro/hippo/ast/Jump;

    move-result-object v3

    .line 224
    .local v3, "jumpStatement":Lcom/trendmicro/hippo/ast/Jump;
    if-nez v3, :cond_7

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 226
    :cond_7
    iget-object v4, v6, Lcom/trendmicro/hippo/NodeTransformer;->loops:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v4

    .line 227
    .local v4, "i":I
    :goto_5
    if-eqz v4, :cond_c

    .line 233
    add-int/lit8 v4, v4, -0x1

    .line 234
    iget-object v5, v6, Lcom/trendmicro/hippo/NodeTransformer;->loops:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v5, v4}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/Node;

    .line 235
    .local v5, "n":Lcom/trendmicro/hippo/Node;
    if-ne v5, v3, :cond_9

    .line 236
    nop

    .line 253
    .end local v4    # "i":I
    .end local v5    # "n":Lcom/trendmicro/hippo/Node;
    const/16 v1, 0x79

    if-ne v11, v1, :cond_8

    .line 254
    iget-object v1, v3, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    iput-object v1, v2, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    goto :goto_6

    .line 256
    :cond_8
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/Jump;->getContinue()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    iput-object v1, v2, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 258
    :goto_6
    const/4 v1, 0x5

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/ast/Jump;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 260
    move-object v12, v10

    move-object v10, v0

    goto/16 :goto_1b

    .line 239
    .restart local v4    # "i":I
    .restart local v5    # "n":Lcom/trendmicro/hippo/Node;
    :cond_9
    invoke-virtual {v5}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v15

    .line 240
    .local v15, "elemtype":I
    if-ne v15, v13, :cond_a

    .line 241
    new-instance v13, Lcom/trendmicro/hippo/Node;

    invoke-direct {v13, v1}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 242
    .local v13, "leave":Lcom/trendmicro/hippo/Node;
    invoke-static {v8, v10, v0, v13}, Lcom/trendmicro/hippo/NodeTransformer;->addBeforeCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .end local v13    # "leave":Lcom/trendmicro/hippo/Node;
    goto :goto_7

    .line 244
    :cond_a
    if-ne v15, v14, :cond_b

    .line 245
    move-object v13, v5

    check-cast v13, Lcom/trendmicro/hippo/ast/Jump;

    .line 246
    .local v13, "tryNode":Lcom/trendmicro/hippo/ast/Jump;
    new-instance v1, Lcom/trendmicro/hippo/ast/Jump;

    invoke-direct {v1, v12}, Lcom/trendmicro/hippo/ast/Jump;-><init>(I)V

    .line 247
    .local v1, "jsrFinally":Lcom/trendmicro/hippo/ast/Jump;
    invoke-virtual {v13}, Lcom/trendmicro/hippo/ast/Jump;->getFinally()Lcom/trendmicro/hippo/Node;

    move-result-object v12

    iput-object v12, v1, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 248
    invoke-static {v8, v10, v0, v1}, Lcom/trendmicro/hippo/NodeTransformer;->addBeforeCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    goto :goto_8

    .line 244
    .end local v1    # "jsrFinally":Lcom/trendmicro/hippo/ast/Jump;
    .end local v13    # "tryNode":Lcom/trendmicro/hippo/ast/Jump;
    :cond_b
    :goto_7
    nop

    .line 251
    .end local v5    # "n":Lcom/trendmicro/hippo/Node;
    .end local v15    # "elemtype":I
    :goto_8
    const/4 v1, 0x3

    const/16 v12, 0x88

    const/16 v13, 0x7c

    goto :goto_5

    .line 231
    :cond_c
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 268
    .end local v2    # "jump":Lcom/trendmicro/hippo/ast/Jump;
    .end local v3    # "jumpStatement":Lcom/trendmicro/hippo/ast/Jump;
    .end local v4    # "i":I
    :pswitch_2
    invoke-virtual {v6, v0, v7}, Lcom/trendmicro/hippo/NodeTransformer;->visitNew(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 269
    goto/16 :goto_1a

    .line 273
    :cond_d
    :pswitch_3
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 274
    .local v1, "child":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v12

    if-ne v12, v2, :cond_10

    .line 277
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v2

    const/16 v3, 0x6e

    if-ne v2, v3, :cond_f

    move-object v2, v7

    check-cast v2, Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 278
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/FunctionNode;->requiresActivation()Z

    move-result v2

    if-eqz v2, :cond_e

    goto :goto_9

    :cond_e
    const/4 v14, 0x0

    goto :goto_a

    :cond_f
    :goto_9
    const/4 v14, 0x1

    :goto_a
    move v2, v14

    .line 279
    .local v2, "createWith":Z
    invoke-virtual {v6, v2, v8, v10, v0}, Lcom/trendmicro/hippo/NodeTransformer;->visitLet(ZLcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 280
    move-object v12, v10

    move-object v10, v0

    goto/16 :goto_1b

    .line 288
    .end local v1    # "child":Lcom/trendmicro/hippo/Node;
    .end local v2    # "createWith":Z
    :cond_10
    :pswitch_4
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x82

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 289
    .local v1, "result":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .local v2, "cursor":Lcom/trendmicro/hippo/Node;
    :goto_b
    if-eqz v2, :cond_15

    .line 292
    move-object v12, v2

    .line 293
    .local v12, "n":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 294
    invoke-virtual {v12}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v13

    if-ne v13, v5, :cond_13

    .line 295
    invoke-virtual {v12}, Lcom/trendmicro/hippo/Node;->hasChildren()Z

    move-result v13

    if-nez v13, :cond_11

    .line 296
    goto :goto_b

    .line 297
    :cond_11
    invoke-virtual {v12}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v13

    .line 298
    .local v13, "init":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v12, v13}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 299
    invoke-virtual {v12, v3}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 300
    new-instance v14, Lcom/trendmicro/hippo/Node;

    const/16 v15, 0x9b

    if-ne v11, v15, :cond_12

    .line 301
    const/16 v15, 0x9c

    goto :goto_c

    .line 302
    :cond_12
    const/16 v15, 0x8

    :goto_c
    invoke-direct {v14, v15, v12, v13}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v12, v14

    .line 304
    .end local v13    # "init":Lcom/trendmicro/hippo/Node;
    goto :goto_d

    .line 307
    :cond_13
    invoke-virtual {v12}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v13

    if-ne v13, v4, :cond_14

    .line 310
    :goto_d
    new-instance v13, Lcom/trendmicro/hippo/Node;

    const/16 v14, 0x86

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getLineno()I

    move-result v15

    invoke-direct {v13, v14, v12, v15}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    .line 311
    .local v13, "pop":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1, v13}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 312
    .end local v12    # "n":Lcom/trendmicro/hippo/Node;
    .end local v13    # "pop":Lcom/trendmicro/hippo/Node;
    goto :goto_b

    .line 308
    .restart local v12    # "n":Lcom/trendmicro/hippo/Node;
    :cond_14
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 313
    .end local v2    # "cursor":Lcom/trendmicro/hippo/Node;
    .end local v12    # "n":Lcom/trendmicro/hippo/Node;
    :cond_15
    invoke-static {v8, v10, v0, v1}, Lcom/trendmicro/hippo/NodeTransformer;->replaceCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 314
    move-object v12, v10

    move-object v10, v0

    goto/16 :goto_1b

    .line 318
    .end local v1    # "result":Lcom/trendmicro/hippo/Node;
    :cond_16
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/trendmicro/hippo/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v1

    .line 319
    .local v1, "defining":Lcom/trendmicro/hippo/ast/Scope;
    if-eqz v1, :cond_17

    .line 320
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->setScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 323
    .end local v1    # "defining":Lcom/trendmicro/hippo/ast/Scope;
    :cond_17
    goto/16 :goto_1a

    .line 121
    :cond_18
    :pswitch_5
    iget-object v1, v6, Lcom/trendmicro/hippo/NodeTransformer;->loops:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ObjArray;->push(Ljava/lang/Object;)V

    .line 122
    iget-object v1, v6, Lcom/trendmicro/hippo/NodeTransformer;->loopEnds:Lcom/trendmicro/hippo/ObjArray;

    move-object v2, v0

    check-cast v2, Lcom/trendmicro/hippo/ast/Jump;

    iget-object v2, v2, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ObjArray;->push(Ljava/lang/Object;)V

    .line 123
    goto/16 :goto_1a

    .line 138
    :cond_19
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/ast/Jump;

    .line 139
    .local v1, "jump":Lcom/trendmicro/hippo/ast/Jump;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Jump;->getFinally()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 140
    .local v2, "finallytarget":Lcom/trendmicro/hippo/Node;
    if-eqz v2, :cond_39

    .line 141
    const/4 v3, 0x1

    iput-boolean v3, v6, Lcom/trendmicro/hippo/NodeTransformer;->hasFinally:Z

    .line 142
    iget-object v3, v6, Lcom/trendmicro/hippo/NodeTransformer;->loops:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/ObjArray;->push(Ljava/lang/Object;)V

    .line 143
    iget-object v3, v6, Lcom/trendmicro/hippo/NodeTransformer;->loopEnds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ObjArray;->push(Ljava/lang/Object;)V

    goto/16 :goto_1a

    .line 157
    .end local v1    # "jump":Lcom/trendmicro/hippo/ast/Jump;
    .end local v2    # "finallytarget":Lcom/trendmicro/hippo/Node;
    :cond_1a
    move-object v1, v7

    check-cast v1, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->addResumptionPoint(Lcom/trendmicro/hippo/Node;)V

    .line 158
    goto/16 :goto_1a

    .line 264
    :cond_1b
    invoke-virtual {v6, v0, v7}, Lcom/trendmicro/hippo/NodeTransformer;->visitCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V

    .line 265
    goto/16 :goto_1a

    .line 356
    :cond_1c
    if-eqz p5, :cond_1d

    .line 357
    const/16 v1, 0x4a

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 365
    :cond_1d
    :pswitch_6
    if-eqz p4, :cond_1e

    .line 366
    goto/16 :goto_1a

    .line 369
    :cond_1e
    const/16 v1, 0x1f

    if-ne v11, v5, :cond_1f

    .line 370
    move-object v2, v0

    .local v2, "nameSource":Lcom/trendmicro/hippo/Node;
    goto :goto_e

    .line 372
    .end local v2    # "nameSource":Lcom/trendmicro/hippo/Node;
    :cond_1f
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 373
    .restart local v2    # "nameSource":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    if-eq v4, v3, :cond_21

    .line 374
    if-ne v11, v1, :cond_20

    .line 375
    goto/16 :goto_1a

    .line 377
    :cond_20
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 380
    :cond_21
    :goto_e
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v3

    if-eqz v3, :cond_22

    .line 381
    goto/16 :goto_1a

    .line 383
    :cond_22
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v3

    .line 384
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v9, v3}, Lcom/trendmicro/hippo/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v4

    .line 385
    .local v4, "defining":Lcom/trendmicro/hippo/ast/Scope;
    if-eqz v4, :cond_39

    .line 386
    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/Node;->setScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 387
    if-ne v11, v5, :cond_23

    .line 388
    const/16 v1, 0x37

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    goto/16 :goto_1a

    .line 389
    :cond_23
    const/16 v5, 0x29

    const/16 v12, 0x8

    if-eq v11, v12, :cond_27

    const/16 v12, 0x4a

    if-ne v11, v12, :cond_24

    goto :goto_f

    .line 393
    :cond_24
    const/16 v12, 0x9c

    if-ne v11, v12, :cond_25

    .line 394
    const/16 v1, 0x9d

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 395
    invoke-virtual {v2, v5}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    goto/16 :goto_1a

    .line 396
    :cond_25
    if-ne v11, v1, :cond_26

    .line 398
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v5, 0x2c

    invoke-direct {v1, v5}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 399
    .local v1, "n":Lcom/trendmicro/hippo/Node;
    invoke-static {v8, v10, v0, v1}, Lcom/trendmicro/hippo/NodeTransformer;->replaceCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 400
    .end local v1    # "n":Lcom/trendmicro/hippo/Node;
    move-object v12, v10

    move-object v10, v0

    goto/16 :goto_1b

    .line 401
    :cond_26
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 391
    :cond_27
    :goto_f
    const/16 v1, 0x38

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 392
    invoke-virtual {v2, v5}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    goto/16 :goto_1a

    .line 331
    .end local v2    # "nameSource":Lcom/trendmicro/hippo/Node;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "defining":Lcom/trendmicro/hippo/ast/Scope;
    :cond_28
    :pswitch_7
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 332
    .local v1, "child":Lcom/trendmicro/hippo/Node;
    const/4 v2, 0x7

    if-ne v11, v2, :cond_2c

    .line 333
    :goto_10
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0x1a

    if-ne v2, v3, :cond_29

    .line 334
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    goto :goto_10

    .line 336
    :cond_29
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0xc

    if-eq v2, v3, :cond_2a

    .line 337
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_2c

    .line 338
    :cond_2a
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 339
    .local v2, "first":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 340
    .local v3, "last":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    const-string v12, "undefined"

    if-ne v4, v5, :cond_2b

    .line 341
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 342
    move-object v1, v3

    goto :goto_11

    .line 343
    :cond_2b
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    if-ne v4, v5, :cond_2c

    .line 344
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 345
    move-object v1, v2

    .line 349
    .end local v2    # "first":Lcom/trendmicro/hippo/Node;
    .end local v3    # "last":Lcom/trendmicro/hippo/Node;
    :cond_2c
    :goto_11
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    const/16 v3, 0x21

    if-ne v2, v3, :cond_39

    .line 350
    const/16 v2, 0x22

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    goto/16 :goto_1a

    .line 162
    .end local v1    # "child":Lcom/trendmicro/hippo/Node;
    :cond_2d
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getType()I

    move-result v1

    const/16 v2, 0x6e

    if-ne v1, v2, :cond_2e

    move-object v1, v7

    check-cast v1, Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 163
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->isGenerator()Z

    move-result v1

    if-eqz v1, :cond_2e

    const/16 v17, 0x1

    goto :goto_12

    :cond_2e
    const/16 v17, 0x0

    :goto_12
    move/from16 v12, v17

    .line 164
    .local v12, "isGenerator":Z
    if-eqz v12, :cond_2f

    .line 165
    const/16 v1, 0x14

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 174
    :cond_2f
    iget-boolean v1, v6, Lcom/trendmicro/hippo/NodeTransformer;->hasFinally:Z

    if-nez v1, :cond_30

    .line 175
    goto/16 :goto_1a

    .line 176
    :cond_30
    const/4 v1, 0x0

    .line 177
    .local v1, "unwindBlock":Lcom/trendmicro/hippo/Node;
    iget-object v2, v6, Lcom/trendmicro/hippo/NodeTransformer;->loops:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjArray;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    move-object v13, v1

    .end local v1    # "unwindBlock":Lcom/trendmicro/hippo/Node;
    .local v2, "i":I
    .local v13, "unwindBlock":Lcom/trendmicro/hippo/Node;
    :goto_13
    if-ltz v2, :cond_35

    .line 178
    iget-object v1, v6, Lcom/trendmicro/hippo/NodeTransformer;->loops:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Node;

    .line 179
    .local v1, "n":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v3

    .line 180
    .local v3, "elemtype":I
    if-eq v3, v14, :cond_32

    const/16 v4, 0x7c

    if-ne v3, v4, :cond_31

    goto :goto_14

    :cond_31
    const/16 v15, 0x82

    goto :goto_17

    :cond_32
    const/16 v4, 0x7c

    .line 182
    :goto_14
    if-ne v3, v14, :cond_33

    .line 183
    new-instance v5, Lcom/trendmicro/hippo/ast/Jump;

    const/16 v15, 0x88

    invoke-direct {v5, v15}, Lcom/trendmicro/hippo/ast/Jump;-><init>(I)V

    .line 184
    .local v5, "jsrnode":Lcom/trendmicro/hippo/ast/Jump;
    move-object/from16 v17, v1

    check-cast v17, Lcom/trendmicro/hippo/ast/Jump;

    invoke-virtual/range {v17 .. v17}, Lcom/trendmicro/hippo/ast/Jump;->getFinally()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 185
    .local v4, "jsrtarget":Lcom/trendmicro/hippo/Node;
    iput-object v4, v5, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 186
    move-object v4, v5

    .line 187
    .end local v5    # "jsrnode":Lcom/trendmicro/hippo/ast/Jump;
    .local v4, "unwind":Lcom/trendmicro/hippo/Node;
    const/4 v5, 0x3

    goto :goto_15

    .line 188
    .end local v4    # "unwind":Lcom/trendmicro/hippo/Node;
    :cond_33
    const/16 v15, 0x88

    new-instance v4, Lcom/trendmicro/hippo/Node;

    const/4 v5, 0x3

    invoke-direct {v4, v5}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 190
    .restart local v4    # "unwind":Lcom/trendmicro/hippo/Node;
    :goto_15
    if-nez v13, :cond_34

    .line 191
    new-instance v5, Lcom/trendmicro/hippo/Node;

    .line 192
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getLineno()I

    move-result v14

    const/16 v15, 0x82

    invoke-direct {v5, v15, v14}, Lcom/trendmicro/hippo/Node;-><init>(II)V

    move-object v13, v5

    goto :goto_16

    .line 190
    :cond_34
    const/16 v15, 0x82

    .line 194
    :goto_16
    invoke-virtual {v13, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 177
    .end local v1    # "n":Lcom/trendmicro/hippo/Node;
    .end local v3    # "elemtype":I
    .end local v4    # "unwind":Lcom/trendmicro/hippo/Node;
    :goto_17
    add-int/lit8 v2, v2, -0x1

    const/16 v14, 0x52

    goto :goto_13

    .line 197
    .end local v2    # "i":I
    :cond_35
    if-eqz v13, :cond_39

    .line 198
    move-object v1, v0

    .line 199
    .local v1, "returnNode":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v14

    .line 200
    .local v14, "returnExpr":Lcom/trendmicro/hippo/Node;
    invoke-static {v8, v10, v0, v13}, Lcom/trendmicro/hippo/NodeTransformer;->replaceCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v15

    .line 201
    .end local v0    # "node":Lcom/trendmicro/hippo/Node;
    .local v15, "node":Lcom/trendmicro/hippo/Node;
    if-eqz v14, :cond_37

    if-eqz v12, :cond_36

    goto :goto_18

    .line 204
    :cond_36
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x87

    invoke-direct {v0, v2, v14}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    move-object v5, v0

    .line 205
    .local v5, "store":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v13, v5}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 206
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x41

    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v4, v0

    .line 207
    .end local v1    # "returnNode":Lcom/trendmicro/hippo/Node;
    .local v4, "returnNode":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v13, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 209
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v5

    move-object/from16 v3, p3

    move-object/from16 v16, v4

    .end local v4    # "returnNode":Lcom/trendmicro/hippo/Node;
    .local v16, "returnNode":Lcom/trendmicro/hippo/Node;
    move/from16 v4, p4

    move-object/from16 v17, v5

    .end local v5    # "store":Lcom/trendmicro/hippo/Node;
    .local v17, "store":Lcom/trendmicro/hippo/Node;
    move/from16 v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/NodeTransformer;->transformCompilationUnit_r(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/Scope;ZZ)V

    .line 214
    .end local v17    # "store":Lcom/trendmicro/hippo/Node;
    goto :goto_19

    .line 202
    .end local v16    # "returnNode":Lcom/trendmicro/hippo/Node;
    .restart local v1    # "returnNode":Lcom/trendmicro/hippo/Node;
    :cond_37
    :goto_18
    invoke-virtual {v13, v1}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 80
    .end local v1    # "returnNode":Lcom/trendmicro/hippo/Node;
    .end local v10    # "previous":Lcom/trendmicro/hippo/Node;
    .end local v11    # "type":I
    .end local v12    # "isGenerator":Z
    .end local v13    # "unwindBlock":Lcom/trendmicro/hippo/Node;
    .end local v14    # "returnExpr":Lcom/trendmicro/hippo/Node;
    :goto_19
    move-object v0, v15

    goto/16 :goto_0

    .line 150
    .end local v15    # "node":Lcom/trendmicro/hippo/Node;
    .restart local v0    # "node":Lcom/trendmicro/hippo/Node;
    .restart local v10    # "previous":Lcom/trendmicro/hippo/Node;
    .restart local v11    # "type":I
    :cond_38
    :pswitch_8
    iget-object v1, v6, Lcom/trendmicro/hippo/NodeTransformer;->loopEnds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_39

    iget-object v1, v6, Lcom/trendmicro/hippo/NodeTransformer;->loopEnds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->peek()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_39

    .line 151
    iget-object v1, v6, Lcom/trendmicro/hippo/NodeTransformer;->loopEnds:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->pop()Ljava/lang/Object;

    .line 152
    iget-object v1, v6, Lcom/trendmicro/hippo/NodeTransformer;->loops:Lcom/trendmicro/hippo/ObjArray;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjArray;->pop()Ljava/lang/Object;

    .line 408
    :cond_39
    :goto_1a
    move-object v12, v10

    move-object v10, v0

    .end local v0    # "node":Lcom/trendmicro/hippo/Node;
    .local v10, "node":Lcom/trendmicro/hippo/Node;
    .local v12, "previous":Lcom/trendmicro/hippo/Node;
    :goto_1b
    nop

    .line 409
    instance-of v0, v10, Lcom/trendmicro/hippo/ast/Scope;

    if-eqz v0, :cond_3a

    move-object v0, v10

    check-cast v0, Lcom/trendmicro/hippo/ast/Scope;

    move-object v3, v0

    goto :goto_1c

    :cond_3a
    move-object v3, v9

    .line 408
    :goto_1c
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v10

    move/from16 v4, p4

    move/from16 v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/NodeTransformer;->transformCompilationUnit_r(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/Scope;ZZ)V

    .line 411
    .end local v11    # "type":I
    .end local v12    # "previous":Lcom/trendmicro/hippo/Node;
    move-object v0, v10

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1e
        :pswitch_2
        :pswitch_6
        :pswitch_7
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x79
        :pswitch_1
        :pswitch_1
        :pswitch_4
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x83
        :pswitch_5
        :pswitch_8
        :pswitch_5
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x9a
        :pswitch_3
        :pswitch_4
        :pswitch_6
    .end packed-switch
.end method


# virtual methods
.method public final transform(Lcom/trendmicro/hippo/ast/ScriptNode;Lcom/trendmicro/hippo/CompilerEnvirons;)V
    .locals 1
    .param p1, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p2, "env"    # Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 33
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/trendmicro/hippo/NodeTransformer;->transform(Lcom/trendmicro/hippo/ast/ScriptNode;ZLcom/trendmicro/hippo/CompilerEnvirons;)V

    .line 34
    return-void
.end method

.method public final transform(Lcom/trendmicro/hippo/ast/ScriptNode;ZLcom/trendmicro/hippo/CompilerEnvirons;)V
    .locals 3
    .param p1, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;
    .param p2, "inStrictMode"    # Z
    .param p3, "env"    # Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 38
    move v0, p2

    .line 42
    .local v0, "useStrictMode":Z
    invoke-virtual {p3}, Lcom/trendmicro/hippo/CompilerEnvirons;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0xc8

    if-lt v1, v2, :cond_0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->isInStrictMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 43
    const/4 v0, 0x1

    .line 45
    :cond_0
    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/NodeTransformer;->transformCompilationUnit(Lcom/trendmicro/hippo/ast/ScriptNode;Z)V

    .line 46
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionCount()I

    move-result v2

    if-eq v1, v2, :cond_1

    .line 47
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getFunctionNode(I)Lcom/trendmicro/hippo/ast/FunctionNode;

    move-result-object v2

    .line 48
    .local v2, "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    invoke-virtual {p0, v2, v0, p3}, Lcom/trendmicro/hippo/NodeTransformer;->transform(Lcom/trendmicro/hippo/ast/ScriptNode;ZLcom/trendmicro/hippo/CompilerEnvirons;)V

    .line 46
    .end local v2    # "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 50
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method protected visitCall(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 0
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 418
    return-void
.end method

.method protected visitLet(ZLcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 20
    .param p1, "createWith"    # Z
    .param p2, "parent"    # Lcom/trendmicro/hippo/Node;
    .param p3, "previous"    # Lcom/trendmicro/hippo/Node;
    .param p4, "scopeNode"    # Lcom/trendmicro/hippo/Node;

    .line 423
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual/range {p4 .. p4}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 424
    .local v3, "vars":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 425
    .local v4, "body":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 426
    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 427
    invoke-virtual/range {p4 .. p4}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    const/16 v6, 0x9f

    if-ne v5, v6, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 430
    .local v5, "isExpression":Z
    :goto_0
    const/16 v7, 0x9a

    const/16 v12, 0x86

    const/16 v13, 0x5a

    if-eqz p1, :cond_9

    .line 431
    new-instance v15, Lcom/trendmicro/hippo/Node;

    if-eqz v5, :cond_1

    const/16 v16, 0xa0

    move/from16 v8, v16

    goto :goto_1

    :cond_1
    const/16 v8, 0x82

    :goto_1
    invoke-direct {v15, v8}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v8, v15

    .line 432
    .local v8, "result":Lcom/trendmicro/hippo/Node;
    invoke-static {v0, v1, v2, v8}, Lcom/trendmicro/hippo/NodeTransformer;->replaceCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v8

    .line 433
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 434
    .local v15, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v11, Lcom/trendmicro/hippo/Node;

    const/16 v9, 0x43

    invoke-direct {v11, v9}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v9, v11

    .line 435
    .local v9, "objectLiteral":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .local v10, "v":Lcom/trendmicro/hippo/Node;
    :goto_2
    if-eqz v10, :cond_8

    .line 436
    move-object v11, v10

    .line 437
    .local v11, "current":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v11}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v14

    if-ne v14, v6, :cond_5

    .line 439
    const/16 v14, 0x16

    .line 440
    invoke-virtual {v11, v14}, Lcom/trendmicro/hippo/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    .line 441
    .local v14, "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-virtual {v11}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v19

    .line 442
    .local v19, "c":Lcom/trendmicro/hippo/Node;
    invoke-virtual/range {v19 .. v19}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v6

    if-ne v6, v7, :cond_4

    .line 444
    if-eqz v5, :cond_2

    .line 445
    new-instance v6, Lcom/trendmicro/hippo/Node;

    invoke-virtual/range {v19 .. v19}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    invoke-direct {v6, v13, v7, v4}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v4, v6

    goto :goto_3

    .line 447
    :cond_2
    new-instance v6, Lcom/trendmicro/hippo/Node;

    new-instance v7, Lcom/trendmicro/hippo/Node;

    .line 448
    invoke-virtual/range {v19 .. v19}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v13

    invoke-direct {v7, v12, v13}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    const/16 v13, 0x82

    invoke-direct {v6, v13, v7, v4}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v4, v6

    .line 453
    :goto_3
    if-eqz v14, :cond_3

    .line 454
    invoke-virtual {v15, v14}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 455
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_4
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_3

    .line 456
    new-instance v7, Lcom/trendmicro/hippo/Node;

    .line 457
    const-wide/16 v17, 0x0

    invoke-static/range {v17 .. v18}, Lcom/trendmicro/hippo/Node;->newNumber(D)Lcom/trendmicro/hippo/Node;

    move-result-object v13

    const/16 v12, 0x7f

    invoke-direct {v7, v12, v13}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 456
    invoke-virtual {v9, v7}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 455
    add-int/lit8 v6, v6, 0x1

    const/16 v12, 0x86

    goto :goto_4

    .line 460
    .end local v6    # "i":I
    :cond_3
    invoke-virtual/range {v19 .. v19}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v11

    goto :goto_5

    .line 442
    :cond_4
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 462
    .end local v14    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v19    # "c":Lcom/trendmicro/hippo/Node;
    :cond_5
    :goto_5
    invoke-virtual {v11}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v6

    const/16 v7, 0x27

    if-ne v6, v7, :cond_7

    .line 463
    invoke-virtual {v11}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->getIndexObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v15, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 464
    invoke-virtual {v11}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 465
    .local v6, "init":Lcom/trendmicro/hippo/Node;
    if-nez v6, :cond_6

    .line 466
    new-instance v7, Lcom/trendmicro/hippo/Node;

    const-wide/16 v12, 0x0

    invoke-static {v12, v13}, Lcom/trendmicro/hippo/Node;->newNumber(D)Lcom/trendmicro/hippo/Node;

    move-result-object v14

    const/16 v12, 0x7f

    invoke-direct {v7, v12, v14}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    move-object v6, v7

    .line 468
    :cond_6
    invoke-virtual {v9, v6}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 435
    .end local v6    # "init":Lcom/trendmicro/hippo/Node;
    .end local v11    # "current":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v10}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v10

    const/16 v6, 0x9f

    const/16 v7, 0x9a

    const/16 v12, 0x86

    const/16 v13, 0x5a

    goto/16 :goto_2

    .line 462
    .restart local v11    # "current":Lcom/trendmicro/hippo/Node;
    :cond_7
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 470
    .end local v10    # "v":Lcom/trendmicro/hippo/Node;
    .end local v11    # "current":Lcom/trendmicro/hippo/Node;
    :cond_8
    const/16 v6, 0xc

    invoke-virtual {v15}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v9, v6, v7}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 471
    new-instance v6, Lcom/trendmicro/hippo/Node;

    const/4 v7, 0x2

    invoke-direct {v6, v7, v9}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 472
    .local v6, "newVars":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v8, v6}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 473
    new-instance v7, Lcom/trendmicro/hippo/Node;

    const/16 v10, 0x7c

    invoke-direct {v7, v10, v4}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {v8, v7}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 474
    new-instance v7, Lcom/trendmicro/hippo/Node;

    const/4 v10, 0x3

    invoke-direct {v7, v10}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    invoke-virtual {v8, v7}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 475
    .end local v9    # "objectLiteral":Lcom/trendmicro/hippo/Node;
    .end local v15    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    goto/16 :goto_b

    .line 476
    .end local v6    # "newVars":Lcom/trendmicro/hippo/Node;
    .end local v8    # "result":Lcom/trendmicro/hippo/Node;
    :cond_9
    new-instance v6, Lcom/trendmicro/hippo/Node;

    if-eqz v5, :cond_a

    const/16 v7, 0x5a

    goto :goto_6

    :cond_a
    const/16 v7, 0x82

    :goto_6
    invoke-direct {v6, v7}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 477
    .local v6, "result":Lcom/trendmicro/hippo/Node;
    invoke-static {v0, v1, v2, v6}, Lcom/trendmicro/hippo/NodeTransformer;->replaceCurrent(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v8

    .line 478
    .end local v6    # "result":Lcom/trendmicro/hippo/Node;
    .restart local v8    # "result":Lcom/trendmicro/hippo/Node;
    new-instance v6, Lcom/trendmicro/hippo/Node;

    const/16 v7, 0x5a

    invoke-direct {v6, v7}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 479
    .local v6, "newVars":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    .local v7, "v":Lcom/trendmicro/hippo/Node;
    :goto_7
    if-eqz v7, :cond_10

    .line 480
    move-object v9, v7

    .line 481
    .local v9, "current":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v9}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v10

    const/16 v11, 0x9f

    if-ne v10, v11, :cond_d

    .line 483
    invoke-virtual {v9}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .line 484
    .local v10, "c":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v10}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v12

    const/16 v13, 0x9a

    if-ne v12, v13, :cond_c

    .line 486
    if-eqz v5, :cond_b

    .line 487
    new-instance v12, Lcom/trendmicro/hippo/Node;

    invoke-virtual {v10}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v14

    const/16 v15, 0x5a

    invoke-direct {v12, v15, v14, v4}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v4, v12

    goto :goto_8

    .line 489
    :cond_b
    new-instance v12, Lcom/trendmicro/hippo/Node;

    new-instance v14, Lcom/trendmicro/hippo/Node;

    .line 490
    invoke-virtual {v10}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v15

    const/16 v11, 0x86

    invoke-direct {v14, v11, v15}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    const/16 v11, 0x82

    invoke-direct {v12, v11, v14, v4}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v4, v12

    .line 494
    :goto_8
    move-object v11, v9

    check-cast v11, Lcom/trendmicro/hippo/ast/Scope;

    move-object v12, v2

    check-cast v12, Lcom/trendmicro/hippo/ast/Scope;

    invoke-static {v11, v12}, Lcom/trendmicro/hippo/ast/Scope;->joinScopes(Lcom/trendmicro/hippo/ast/Scope;Lcom/trendmicro/hippo/ast/Scope;)V

    .line 496
    invoke-virtual {v10}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v9

    goto :goto_9

    .line 484
    :cond_c
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v11

    throw v11

    .line 481
    .end local v10    # "c":Lcom/trendmicro/hippo/Node;
    :cond_d
    const/16 v13, 0x9a

    .line 498
    :goto_9
    invoke-virtual {v9}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v10

    const/16 v11, 0x27

    if-ne v10, v11, :cond_f

    .line 499
    invoke-virtual {v9}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/trendmicro/hippo/Node;->newString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .line 500
    .local v10, "stringNode":Lcom/trendmicro/hippo/Node;
    move-object v12, v2

    check-cast v12, Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v10, v12}, Lcom/trendmicro/hippo/Node;->setScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 501
    invoke-virtual {v9}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v12

    .line 502
    .local v12, "init":Lcom/trendmicro/hippo/Node;
    if-nez v12, :cond_e

    .line 503
    new-instance v14, Lcom/trendmicro/hippo/Node;

    const-wide/16 v15, 0x0

    invoke-static/range {v15 .. v16}, Lcom/trendmicro/hippo/Node;->newNumber(D)Lcom/trendmicro/hippo/Node;

    move-result-object v11

    const/16 v13, 0x7f

    invoke-direct {v14, v13, v11}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    move-object v12, v14

    goto :goto_a

    .line 502
    :cond_e
    const/16 v13, 0x7f

    const-wide/16 v15, 0x0

    .line 505
    :goto_a
    new-instance v11, Lcom/trendmicro/hippo/Node;

    const/16 v14, 0x38

    invoke-direct {v11, v14, v10, v12}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    invoke-virtual {v6, v11}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 479
    .end local v9    # "current":Lcom/trendmicro/hippo/Node;
    .end local v10    # "stringNode":Lcom/trendmicro/hippo/Node;
    .end local v12    # "init":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v7}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v7

    goto/16 :goto_7

    .line 498
    .restart local v9    # "current":Lcom/trendmicro/hippo/Node;
    :cond_f
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v10

    throw v10

    .line 507
    .end local v7    # "v":Lcom/trendmicro/hippo/Node;
    .end local v9    # "current":Lcom/trendmicro/hippo/Node;
    :cond_10
    if-eqz v5, :cond_11

    .line 508
    invoke-virtual {v8, v6}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 509
    const/16 v7, 0x5a

    invoke-virtual {v2, v7}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 510
    invoke-virtual {v8, v2}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 511
    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 512
    instance-of v7, v4, Lcom/trendmicro/hippo/ast/Scope;

    if-eqz v7, :cond_12

    .line 513
    move-object v7, v4

    check-cast v7, Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/Scope;->getParentScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v7

    .line 514
    .local v7, "scopeParent":Lcom/trendmicro/hippo/ast/Scope;
    move-object v9, v4

    check-cast v9, Lcom/trendmicro/hippo/ast/Scope;

    move-object v10, v2

    check-cast v10, Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/ast/Scope;->setParentScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 515
    move-object v9, v2

    check-cast v9, Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v9, v7}, Lcom/trendmicro/hippo/ast/Scope;->setParentScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 516
    .end local v7    # "scopeParent":Lcom/trendmicro/hippo/ast/Scope;
    goto :goto_b

    .line 518
    :cond_11
    new-instance v7, Lcom/trendmicro/hippo/Node;

    const/16 v9, 0x86

    invoke-direct {v7, v9, v6}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {v8, v7}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 519
    const/16 v7, 0x82

    invoke-virtual {v2, v7}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 520
    invoke-virtual {v8, v2}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 521
    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/Node;->addChildrenToBack(Lcom/trendmicro/hippo/Node;)V

    .line 522
    instance-of v7, v4, Lcom/trendmicro/hippo/ast/Scope;

    if-eqz v7, :cond_12

    .line 523
    move-object v7, v4

    check-cast v7, Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/Scope;->getParentScope()Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v7

    .line 524
    .restart local v7    # "scopeParent":Lcom/trendmicro/hippo/ast/Scope;
    move-object v9, v4

    check-cast v9, Lcom/trendmicro/hippo/ast/Scope;

    move-object v10, v2

    check-cast v10, Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/ast/Scope;->setParentScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 525
    move-object v9, v2

    check-cast v9, Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {v9, v7}, Lcom/trendmicro/hippo/ast/Scope;->setParentScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 529
    .end local v7    # "scopeParent":Lcom/trendmicro/hippo/ast/Scope;
    :cond_12
    :goto_b
    return-object v8
.end method

.method protected visitNew(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/ScriptNode;)V
    .locals 0
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;
    .param p2, "tree"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 415
    return-void
.end method
