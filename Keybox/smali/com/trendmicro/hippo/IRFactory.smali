.class public final Lcom/trendmicro/hippo/IRFactory;
.super Lcom/trendmicro/hippo/Parser;
.source "IRFactory.java"


# static fields
.field private static final ALWAYS_FALSE_BOOLEAN:I = -0x1

.field private static final ALWAYS_TRUE_BOOLEAN:I = 0x1

.field private static final LOOP_DO_WHILE:I = 0x0

.field private static final LOOP_FOR:I = 0x2

.field private static final LOOP_WHILE:I = 0x1


# instance fields
.field private decompiler:Lcom/trendmicro/hippo/Decompiler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 93
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser;-><init>()V

    .line 90
    new-instance v0, Lcom/trendmicro/hippo/Decompiler;

    invoke-direct {v0}, Lcom/trendmicro/hippo/Decompiler;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    .line 94
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/CompilerEnvirons;)V
    .locals 1
    .param p1, "env"    # Lcom/trendmicro/hippo/CompilerEnvirons;

    .line 97
    invoke-virtual {p1}, Lcom/trendmicro/hippo/CompilerEnvirons;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/IRFactory;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 98
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;)V
    .locals 1
    .param p1, "env"    # Lcom/trendmicro/hippo/CompilerEnvirons;
    .param p2, "errorReporter"    # Lcom/trendmicro/hippo/ErrorReporter;

    .line 101
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/Parser;-><init>(Lcom/trendmicro/hippo/CompilerEnvirons;Lcom/trendmicro/hippo/ErrorReporter;)V

    .line 90
    new-instance v0, Lcom/trendmicro/hippo/Decompiler;

    invoke-direct {v0}, Lcom/trendmicro/hippo/Decompiler;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    .line 102
    return-void
.end method

.method private addSwitchCase(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V
    .locals 4
    .param p1, "switchBlock"    # Lcom/trendmicro/hippo/Node;
    .param p2, "caseExpression"    # Lcom/trendmicro/hippo/Node;
    .param p3, "statements"    # Lcom/trendmicro/hippo/Node;

    .line 1398
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x82

    if-ne v0, v1, :cond_2

    .line 1399
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/Jump;

    .line 1400
    .local v0, "switchNode":Lcom/trendmicro/hippo/ast/Jump;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Jump;->getType()I

    move-result v1

    const/16 v2, 0x73

    if-ne v1, v2, :cond_1

    .line 1402
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1403
    .local v1, "gotoTarget":Lcom/trendmicro/hippo/Node;
    if-eqz p2, :cond_0

    .line 1404
    new-instance v2, Lcom/trendmicro/hippo/ast/Jump;

    const/16 v3, 0x74

    invoke-direct {v2, v3, p2}, Lcom/trendmicro/hippo/ast/Jump;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 1405
    .local v2, "caseNode":Lcom/trendmicro/hippo/ast/Jump;
    iput-object v1, v2, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 1406
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1407
    .end local v2    # "caseNode":Lcom/trendmicro/hippo/ast/Jump;
    goto :goto_0

    .line 1408
    :cond_0
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/Jump;->setDefault(Lcom/trendmicro/hippo/Node;)V

    .line 1410
    :goto_0
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1411
    invoke-virtual {p1, p3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1412
    return-void

    .line 1400
    .end local v1    # "gotoTarget":Lcom/trendmicro/hippo/Node;
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1398
    .end local v0    # "switchNode":Lcom/trendmicro/hippo/ast/Jump;
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private arrayCompTransformHelper(Lcom/trendmicro/hippo/ast/ArrayComprehension;Ljava/lang/String;)Lcom/trendmicro/hippo/Node;
    .locals 24
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ArrayComprehension;
    .param p2, "arrayName"    # Ljava/lang/String;

    .line 290
    move-object/from16 v9, p0

    iget-object v0, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x54

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 291
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->getLineno()I

    move-result v10

    .line 292
    .local v10, "lineno":I
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->getResult()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 294
    .local v0, "expr":Lcom/trendmicro/hippo/Node;
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->getLoops()Ljava/util/List;

    move-result-object v11

    .line 295
    .local v11, "loops":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;>;"
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    .line 298
    .local v12, "numLoops":I
    new-array v13, v12, [Lcom/trendmicro/hippo/Node;

    .line 299
    .local v13, "iterators":[Lcom/trendmicro/hippo/Node;
    new-array v14, v12, [Lcom/trendmicro/hippo/Node;

    .line 301
    .local v14, "iteratedObjs":[Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x0

    move-object v15, v0

    .end local v0    # "expr":Lcom/trendmicro/hippo/Node;
    .local v1, "i":I
    .local v15, "expr":Lcom/trendmicro/hippo/Node;
    :goto_0
    const/16 v0, 0x59

    const-string v2, " "

    const/16 v3, 0x58

    const/4 v4, 0x0

    if-ge v1, v12, :cond_3

    .line 302
    invoke-interface {v11, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;

    .line 303
    .local v5, "acl":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    iget-object v6, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v6, v2}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 304
    iget-object v2, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v6, 0x78

    invoke-virtual {v2, v6}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 305
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->isForEach()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 306
    iget-object v2, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v6, "each "

    invoke-virtual {v2, v6}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 308
    :cond_0
    iget-object v2, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 310
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->getIterator()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    .line 311
    .local v2, "iter":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v6, 0x0

    .line 312
    .local v6, "name":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v7

    const/16 v8, 0x27

    if-ne v7, v8, :cond_1

    .line 313
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getString()Ljava/lang/String;

    move-result-object v3

    .line 314
    .end local v6    # "name":Ljava/lang/String;
    .local v3, "name":Ljava/lang/String;
    iget-object v6, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v6, v3}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    goto :goto_1

    .line 317
    .end local v3    # "name":Ljava/lang/String;
    .restart local v6    # "name":Ljava/lang/String;
    :cond_1
    invoke-virtual {v9, v2}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 318
    iget-object v7, v9, Lcom/trendmicro/hippo/IRFactory;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v6

    .line 319
    invoke-virtual {v9, v3, v6, v4}, Lcom/trendmicro/hippo/IRFactory;->defineSymbol(ILjava/lang/String;Z)V

    .line 320
    const/16 v3, 0x5a

    const/16 v7, 0x5b

    .line 323
    invoke-virtual {v9, v6}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v8

    .line 321
    invoke-direct {v9, v7, v2, v8}, Lcom/trendmicro/hippo/IRFactory;->createAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v7

    .line 320
    invoke-direct {v9, v3, v7, v15}, Lcom/trendmicro/hippo/IRFactory;->createBinary(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    move-object v15, v3

    move-object v3, v6

    .line 326
    .end local v6    # "name":Ljava/lang/String;
    .restart local v3    # "name":Ljava/lang/String;
    :goto_1
    invoke-virtual {v9, v3}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 329
    .local v6, "init":Lcom/trendmicro/hippo/Node;
    const/16 v7, 0x9a

    invoke-virtual {v9, v7, v3, v4}, Lcom/trendmicro/hippo/IRFactory;->defineSymbol(ILjava/lang/String;Z)V

    .line 330
    aput-object v6, v13, v1

    .line 332
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->isForOf()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 333
    iget-object v4, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v7, "of "

    invoke-virtual {v4, v7}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    goto :goto_2

    .line 335
    :cond_2
    iget-object v4, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v7, 0x34

    invoke-virtual {v4, v7}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 337
    :goto_2
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->getIteratedObject()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-virtual {v9, v4}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    aput-object v4, v14, v1

    .line 338
    iget-object v4, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v4, v0}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 301
    .end local v2    # "iter":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "acl":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    .end local v6    # "init":Lcom/trendmicro/hippo/Node;
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 342
    .end local v1    # "i":I
    :cond_3
    const/16 v1, 0x26

    .line 343
    move-object/from16 v8, p2

    invoke-virtual {v9, v8}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    const/4 v7, 0x0

    const-string v6, "push"

    invoke-direct {v9, v5, v7, v6, v4}, Lcom/trendmicro/hippo/IRFactory;->createPropertyGet(Lcom/trendmicro/hippo/Node;Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 342
    invoke-direct {v9, v1, v4}, Lcom/trendmicro/hippo/IRFactory;->createCallOrNew(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 347
    .local v6, "call":Lcom/trendmicro/hippo/Node;
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v4, 0x86

    invoke-direct {v1, v4, v6, v10}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    .line 349
    .local v1, "body":Lcom/trendmicro/hippo/Node;
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->getFilter()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 350
    iget-object v4, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 351
    iget-object v2, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v4, 0x71

    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 352
    iget-object v2, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 353
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->getFilter()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {v9, v2}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-direct {v9, v2, v1, v7, v10}, Lcom/trendmicro/hippo/IRFactory;->createIf(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 354
    iget-object v2, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 358
    :cond_4
    const/4 v0, 0x0

    .line 360
    .local v0, "pushed":I
    add-int/lit8 v2, v12, -0x1

    move-object/from16 v16, v1

    move v1, v0

    move v0, v2

    .local v0, "i":I
    .local v1, "pushed":I
    .local v16, "body":Lcom/trendmicro/hippo/Node;
    :goto_3
    if-ltz v0, :cond_6

    .line 361
    :try_start_0
    invoke-interface {v11, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;

    move-object/from16 v17, v2

    .line 362
    .local v17, "acl":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    nop

    .line 363
    invoke-virtual/range {v17 .. v17}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->getLineno()I

    move-result v2

    .line 362
    invoke-direct {v9, v7, v2}, Lcom/trendmicro/hippo/IRFactory;->createLoopNode(Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v2

    move-object v5, v2

    .line 364
    .local v5, "loop":Lcom/trendmicro/hippo/ast/Scope;
    invoke-virtual {v9, v5}, Lcom/trendmicro/hippo/IRFactory;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 365
    add-int/lit8 v18, v1, 0x1

    .line 366
    .end local v1    # "pushed":I
    .local v18, "pushed":I
    const/16 v2, 0x9a

    :try_start_1
    aget-object v4, v13, v0

    aget-object v19, v14, v0

    .line 371
    invoke-virtual/range {v17 .. v17}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->isForEach()Z

    move-result v20

    .line 372
    invoke-virtual/range {v17 .. v17}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->isForOf()Z

    move-result v21
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 366
    move-object/from16 v1, p0

    move-object v3, v5

    move-object/from16 v22, v5

    .end local v5    # "loop":Lcom/trendmicro/hippo/ast/Scope;
    .local v22, "loop":Lcom/trendmicro/hippo/ast/Scope;
    move-object/from16 v5, v19

    move-object/from16 v23, v6

    .end local v6    # "call":Lcom/trendmicro/hippo/Node;
    .local v23, "call":Lcom/trendmicro/hippo/Node;
    move-object/from16 v6, v16

    move-object/from16 v19, v7

    move/from16 v7, v20

    move/from16 v8, v21

    :try_start_2
    invoke-direct/range {v1 .. v8}, Lcom/trendmicro/hippo/IRFactory;->createForIn(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;ZZ)Lcom/trendmicro/hippo/Node;

    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object/from16 v16, v1

    .line 360
    .end local v17    # "acl":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    .end local v22    # "loop":Lcom/trendmicro/hippo/ast/Scope;
    add-int/lit8 v0, v0, -0x1

    move-object/from16 v8, p2

    move/from16 v1, v18

    move-object/from16 v7, v19

    move-object/from16 v6, v23

    goto :goto_3

    .line 375
    .end local v0    # "i":I
    :catchall_0
    move-exception v0

    move/from16 v1, v18

    goto :goto_4

    .end local v23    # "call":Lcom/trendmicro/hippo/Node;
    .restart local v6    # "call":Lcom/trendmicro/hippo/Node;
    :catchall_1
    move-exception v0

    move-object/from16 v23, v6

    move/from16 v1, v18

    .end local v6    # "call":Lcom/trendmicro/hippo/Node;
    .restart local v23    # "call":Lcom/trendmicro/hippo/Node;
    goto :goto_4

    .end local v18    # "pushed":I
    .end local v23    # "call":Lcom/trendmicro/hippo/Node;
    .restart local v1    # "pushed":I
    .restart local v6    # "call":Lcom/trendmicro/hippo/Node;
    :catchall_2
    move-exception v0

    move-object/from16 v23, v6

    .end local v6    # "call":Lcom/trendmicro/hippo/Node;
    .restart local v23    # "call":Lcom/trendmicro/hippo/Node;
    :goto_4
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v1, :cond_5

    .line 376
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 375
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 378
    .end local v2    # "i":I
    :cond_5
    throw v0

    .line 360
    .end local v23    # "call":Lcom/trendmicro/hippo/Node;
    .restart local v0    # "i":I
    .restart local v6    # "call":Lcom/trendmicro/hippo/Node;
    :cond_6
    move-object/from16 v23, v6

    .line 375
    .end local v0    # "i":I
    .end local v6    # "call":Lcom/trendmicro/hippo/Node;
    .restart local v23    # "call":Lcom/trendmicro/hippo/Node;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_6
    if-ge v0, v1, :cond_7

    .line 376
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 375
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 378
    .end local v0    # "i":I
    :cond_7
    nop

    .line 380
    iget-object v0, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x55

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 384
    move-object/from16 v2, v23

    .end local v23    # "call":Lcom/trendmicro/hippo/Node;
    .local v2, "call":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v2, v15}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 385
    return-object v16
.end method

.method private closeSwitch(Lcom/trendmicro/hippo/Node;)V
    .locals 4
    .param p1, "switchBlock"    # Lcom/trendmicro/hippo/Node;

    .line 1416
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x82

    if-ne v0, v1, :cond_2

    .line 1417
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/Jump;

    .line 1418
    .local v0, "switchNode":Lcom/trendmicro/hippo/ast/Jump;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Jump;->getType()I

    move-result v1

    const/16 v2, 0x73

    if-ne v1, v2, :cond_1

    .line 1420
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1423
    .local v1, "switchBreakTarget":Lcom/trendmicro/hippo/Node;
    iput-object v1, v0, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 1425
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Jump;->getDefault()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 1426
    .local v2, "defaultTarget":Lcom/trendmicro/hippo/Node;
    if-nez v2, :cond_0

    .line 1427
    move-object v2, v1

    .line 1430
    :cond_0
    const/4 v3, 0x5

    invoke-direct {p0, v3, v2}, Lcom/trendmicro/hippo/IRFactory;->makeJump(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/ast/Jump;

    move-result-object v3

    invoke-virtual {p1, v3, v0}, Lcom/trendmicro/hippo/Node;->addChildAfter(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 1432
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1433
    return-void

    .line 1418
    .end local v1    # "switchBreakTarget":Lcom/trendmicro/hippo/Node;
    .end local v2    # "defaultTarget":Lcom/trendmicro/hippo/Node;
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1416
    .end local v0    # "switchNode":Lcom/trendmicro/hippo/ast/Jump;
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private createAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 9
    .param p1, "assignType"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/Node;
    .param p3, "right"    # Lcom/trendmicro/hippo/Node;

    .line 2223
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/IRFactory;->makeReference(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 2224
    .local v0, "ref":Lcom/trendmicro/hippo/Node;
    if-nez v0, :cond_3

    .line 2225
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const/16 v2, 0x42

    if-eq v1, v2, :cond_1

    .line 2226
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const/16 v2, 0x43

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 2234
    :cond_0
    const-string v1, "msg.bad.assign.left"

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->reportError(Ljava/lang/String;)V

    .line 2235
    return-object p3

    .line 2228
    :cond_1
    :goto_0
    const/16 v1, 0x5b

    if-eq p1, v1, :cond_2

    .line 2229
    const-string v1, "msg.bad.destruct.op"

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->reportError(Ljava/lang/String;)V

    .line 2230
    return-object p3

    .line 2232
    :cond_2
    const/4 v1, -0x1

    invoke-virtual {p0, v1, p2, p3}, Lcom/trendmicro/hippo/IRFactory;->createDestructuringAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    return-object v1

    .line 2237
    :cond_3
    move-object p2, v0

    .line 2240
    packed-switch p1, :pswitch_data_0

    .line 2254
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 2253
    :pswitch_0
    const/16 v1, 0x19

    .local v1, "assignOp":I
    goto :goto_1

    .line 2252
    .end local v1    # "assignOp":I
    :pswitch_1
    const/16 v1, 0x18

    .restart local v1    # "assignOp":I
    goto :goto_1

    .line 2251
    .end local v1    # "assignOp":I
    :pswitch_2
    const/16 v1, 0x17

    .restart local v1    # "assignOp":I
    goto :goto_1

    .line 2250
    .end local v1    # "assignOp":I
    :pswitch_3
    const/16 v1, 0x16

    .restart local v1    # "assignOp":I
    goto :goto_1

    .line 2249
    .end local v1    # "assignOp":I
    :pswitch_4
    const/16 v1, 0x15

    .restart local v1    # "assignOp":I
    goto :goto_1

    .line 2248
    .end local v1    # "assignOp":I
    :pswitch_5
    const/16 v1, 0x14

    .restart local v1    # "assignOp":I
    goto :goto_1

    .line 2247
    .end local v1    # "assignOp":I
    :pswitch_6
    const/16 v1, 0x13

    .restart local v1    # "assignOp":I
    goto :goto_1

    .line 2246
    .end local v1    # "assignOp":I
    :pswitch_7
    const/16 v1, 0x12

    .restart local v1    # "assignOp":I
    goto :goto_1

    .line 2245
    .end local v1    # "assignOp":I
    :pswitch_8
    const/16 v1, 0xb

    .restart local v1    # "assignOp":I
    goto :goto_1

    .line 2244
    .end local v1    # "assignOp":I
    :pswitch_9
    const/16 v1, 0xa

    .restart local v1    # "assignOp":I
    goto :goto_1

    .line 2243
    .end local v1    # "assignOp":I
    :pswitch_a
    const/16 v1, 0x9

    .line 2257
    .restart local v1    # "assignOp":I
    :goto_1
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    .line 2258
    .local v2, "nodeType":I
    const/16 v3, 0x8b

    const/16 v4, 0x21

    if-eq v2, v4, :cond_6

    const/16 v5, 0x24

    if-eq v2, v5, :cond_6

    const/16 v4, 0x27

    if-eq v2, v4, :cond_5

    const/16 v4, 0x44

    if-ne v2, v4, :cond_4

    .line 2278
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 2279
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->checkMutableReference(Lcom/trendmicro/hippo/Node;)V

    .line 2280
    new-instance v4, Lcom/trendmicro/hippo/Node;

    invoke-direct {v4, v3}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v3, v4

    .line 2281
    .local v3, "opLeft":Lcom/trendmicro/hippo/Node;
    new-instance v4, Lcom/trendmicro/hippo/Node;

    invoke-direct {v4, v1, v3, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2282
    .local v4, "op":Lcom/trendmicro/hippo/Node;
    new-instance v5, Lcom/trendmicro/hippo/Node;

    const/16 v6, 0x8f

    invoke-direct {v5, v6, v0, v4}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v5

    .line 2286
    .end local v3    # "opLeft":Lcom/trendmicro/hippo/Node;
    .end local v4    # "op":Lcom/trendmicro/hippo/Node;
    :cond_4
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 2260
    :cond_5
    new-instance v3, Lcom/trendmicro/hippo/Node;

    invoke-direct {v3, v1, p2, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2261
    .local v3, "op":Lcom/trendmicro/hippo/Node;
    const/16 v4, 0x31

    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/trendmicro/hippo/Node;->newString(ILjava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 2262
    .local v4, "lvalueLeft":Lcom/trendmicro/hippo/Node;
    new-instance v5, Lcom/trendmicro/hippo/Node;

    const/16 v6, 0x8

    invoke-direct {v5, v6, v4, v3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v5

    .line 2266
    .end local v3    # "op":Lcom/trendmicro/hippo/Node;
    .end local v4    # "lvalueLeft":Lcom/trendmicro/hippo/Node;
    :cond_6
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 2267
    .local v5, "obj":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 2269
    .local v6, "id":Lcom/trendmicro/hippo/Node;
    if-ne v2, v4, :cond_7

    .line 2270
    const/16 v4, 0x8c

    goto :goto_2

    .line 2271
    :cond_7
    const/16 v4, 0x8d

    :goto_2
    nop

    .line 2273
    .local v4, "type":I
    new-instance v7, Lcom/trendmicro/hippo/Node;

    invoke-direct {v7, v3}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v3, v7

    .line 2274
    .local v3, "opLeft":Lcom/trendmicro/hippo/Node;
    new-instance v7, Lcom/trendmicro/hippo/Node;

    invoke-direct {v7, v1, v3, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2275
    .local v7, "op":Lcom/trendmicro/hippo/Node;
    new-instance v8, Lcom/trendmicro/hippo/Node;

    invoke-direct {v8, v4, v5, v6, v7}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v8

    .line 2242
    .end local v1    # "assignOp":I
    .end local v2    # "nodeType":I
    .end local v3    # "opLeft":Lcom/trendmicro/hippo/Node;
    .end local v4    # "type":I
    .end local v5    # "obj":Lcom/trendmicro/hippo/Node;
    .end local v6    # "id":Lcom/trendmicro/hippo/Node;
    .end local v7    # "op":Lcom/trendmicro/hippo/Node;
    :pswitch_b
    invoke-virtual {p0, p2, p3}, Lcom/trendmicro/hippo/IRFactory;->simpleAssignment(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x5b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private createBinary(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 7
    .param p1, "nodeType"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/Node;
    .param p3, "right"    # Lcom/trendmicro/hippo/Node;

    .line 2093
    const/16 v0, 0x69

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-eq p1, v0, :cond_f

    const/16 v0, 0x6a

    if-eq p1, v0, :cond_d

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    const/16 v2, 0x1c

    const/16 v3, 0x28

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_3

    .line 2171
    :pswitch_0
    iget v4, p3, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v4, v3, :cond_11

    .line 2172
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v4

    .line 2173
    .local v4, "rd":D
    iget v6, p2, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v6, v3, :cond_0

    .line 2175
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v0

    div-double/2addr v0, v4

    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/Node;->setDouble(D)V

    .line 2176
    return-object p2

    .line 2177
    :cond_0
    cmpl-double v0, v4, v0

    if-nez v0, :cond_1

    .line 2180
    new-instance v0, Lcom/trendmicro/hippo/Node;

    invoke-direct {v0, v2, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    return-object v0

    .line 2182
    .end local v4    # "rd":D
    :cond_1
    goto/16 :goto_3

    .line 2149
    :pswitch_1
    iget v4, p2, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v4, v3, :cond_4

    .line 2150
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v4

    .line 2151
    .local v4, "ld":D
    iget v6, p3, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v6, v3, :cond_2

    .line 2153
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v0

    mul-double/2addr v0, v4

    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/Node;->setDouble(D)V

    .line 2154
    return-object p2

    .line 2155
    :cond_2
    cmpl-double v0, v4, v0

    if-nez v0, :cond_3

    .line 2157
    new-instance v0, Lcom/trendmicro/hippo/Node;

    invoke-direct {v0, v2, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    return-object v0

    .line 2155
    .end local v4    # "ld":D
    :cond_3
    goto :goto_0

    .line 2159
    :cond_4
    iget v4, p3, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v4, v3, :cond_5

    .line 2160
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v3

    cmpl-double v0, v3, v0

    if-nez v0, :cond_11

    .line 2163
    new-instance v0, Lcom/trendmicro/hippo/Node;

    invoke-direct {v0, v2, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    return-object v0

    .line 2159
    :cond_5
    :goto_0
    goto/16 :goto_3

    .line 2128
    :pswitch_2
    iget v0, p2, Lcom/trendmicro/hippo/Node;->type:I

    const-wide/16 v4, 0x0

    if-ne v0, v3, :cond_8

    .line 2129
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v0

    .line 2130
    .local v0, "ld":D
    iget v2, p3, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v2, v3, :cond_6

    .line 2132
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v2

    sub-double v2, v0, v2

    invoke-virtual {p2, v2, v3}, Lcom/trendmicro/hippo/Node;->setDouble(D)V

    .line 2133
    return-object p2

    .line 2134
    :cond_6
    cmpl-double v2, v0, v4

    if-nez v2, :cond_7

    .line 2136
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/16 v3, 0x1d

    invoke-direct {v2, v3, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    return-object v2

    .line 2134
    .end local v0    # "ld":D
    :cond_7
    goto :goto_1

    .line 2138
    :cond_8
    iget v0, p3, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v0, v3, :cond_9

    .line 2139
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v0

    cmpl-double v0, v0, v4

    if-nez v0, :cond_11

    .line 2142
    new-instance v0, Lcom/trendmicro/hippo/Node;

    invoke-direct {v0, v2, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    return-object v0

    .line 2138
    :cond_9
    :goto_1
    goto :goto_3

    .line 2097
    :pswitch_3
    iget v0, p2, Lcom/trendmicro/hippo/Node;->type:I

    const/16 v1, 0xa

    const/16 v2, 0x29

    if-ne v0, v2, :cond_b

    .line 2099
    iget v0, p3, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v0, v2, :cond_a

    .line 2100
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v0

    .local v0, "s2":Ljava/lang/String;
    goto :goto_2

    .line 2101
    .end local v0    # "s2":Ljava/lang/String;
    :cond_a
    iget v0, p3, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v0, v3, :cond_11

    .line 2102
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v2

    invoke-static {v2, v3, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v0

    .line 2106
    .restart local v0    # "s2":Ljava/lang/String;
    :goto_2
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v1

    .line 2107
    .local v1, "s1":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/trendmicro/hippo/Node;->setString(Ljava/lang/String;)V

    .line 2108
    return-object p2

    .line 2109
    .end local v0    # "s2":Ljava/lang/String;
    .end local v1    # "s1":Ljava/lang/String;
    :cond_b
    iget v0, p2, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v0, v3, :cond_11

    .line 2110
    iget v0, p3, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v0, v3, :cond_c

    .line 2111
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v0

    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v2

    add-double/2addr v0, v2

    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/Node;->setDouble(D)V

    .line 2112
    return-object p2

    .line 2113
    :cond_c
    iget v0, p3, Lcom/trendmicro/hippo/Node;->type:I

    if-ne v0, v2, :cond_11

    .line 2115
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v2

    invoke-static {v2, v3, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v0

    .line 2116
    .local v0, "s1":Ljava/lang/String;
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v1

    .line 2117
    .local v1, "s2":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Lcom/trendmicro/hippo/Node;->setString(Ljava/lang/String;)V

    .line 2118
    return-object p3

    .line 2190
    .end local v0    # "s1":Ljava/lang/String;
    .end local v1    # "s2":Ljava/lang/String;
    :cond_d
    invoke-static {p2}, Lcom/trendmicro/hippo/IRFactory;->isAlwaysDefinedBoolean(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 2191
    .local v0, "leftStatus":I
    if-ne v0, v1, :cond_e

    .line 2193
    return-object p2

    .line 2194
    :cond_e
    if-ne v0, v2, :cond_11

    .line 2196
    return-object p3

    .line 2206
    .end local v0    # "leftStatus":I
    :cond_f
    invoke-static {p2}, Lcom/trendmicro/hippo/IRFactory;->isAlwaysDefinedBoolean(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 2207
    .restart local v0    # "leftStatus":I
    if-ne v0, v2, :cond_10

    .line 2209
    return-object p2

    .line 2210
    :cond_10
    if-ne v0, v1, :cond_11

    .line 2212
    return-object p3

    .line 2218
    .end local v0    # "leftStatus":I
    :cond_11
    :goto_3
    new-instance v0, Lcom/trendmicro/hippo/Node;

    invoke-direct {v0, p1, p2, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x15
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private createCallOrNew(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "nodeType"    # I
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 1972
    const/4 v0, 0x0

    .line 1973
    .local v0, "type":I
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const-string v2, "eval"

    const/16 v3, 0x27

    if-ne v1, v3, :cond_2

    .line 1974
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v1

    .line 1975
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1976
    const/4 v0, 0x1

    goto :goto_0

    .line 1977
    :cond_0
    const-string v2, "With"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1978
    const/4 v0, 0x2

    .line 1980
    .end local v1    # "name":Ljava/lang/String;
    :cond_1
    :goto_0
    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v1

    const/16 v3, 0x21

    if-ne v1, v3, :cond_1

    .line 1981
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v1

    .line 1982
    .restart local v1    # "name":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1983
    const/4 v0, 0x1

    .line 1986
    .end local v1    # "name":Ljava/lang/String;
    :cond_3
    :goto_1
    new-instance v1, Lcom/trendmicro/hippo/Node;

    invoke-direct {v1, p1, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 1987
    .local v1, "node":Lcom/trendmicro/hippo/Node;
    if-eqz v0, :cond_4

    .line 1989
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->setRequiresActivation()V

    .line 1990
    const/16 v2, 0xa

    invoke-virtual {v1, v2, v0}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 1992
    :cond_4
    return-object v1
.end method

.method private createCatch(Ljava/lang/String;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;
    .locals 7
    .param p1, "varName"    # Ljava/lang/String;
    .param p2, "catchCond"    # Lcom/trendmicro/hippo/Node;
    .param p3, "stmts"    # Lcom/trendmicro/hippo/Node;
    .param p4, "lineno"    # I

    .line 1453
    if-nez p2, :cond_0

    .line 1454
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x81

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object p2, v0

    .line 1456
    :cond_0
    new-instance v6, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x7d

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    move-object v0, v6

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)V

    return-object v6
.end method

.method private createCondExpr(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "cond"    # Lcom/trendmicro/hippo/Node;
    .param p2, "ifTrue"    # Lcom/trendmicro/hippo/Node;
    .param p3, "ifFalse"    # Lcom/trendmicro/hippo/Node;

    .line 1891
    invoke-static {p1}, Lcom/trendmicro/hippo/IRFactory;->isAlwaysDefinedBoolean(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 1892
    .local v0, "condStatus":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1893
    return-object p2

    .line 1894
    :cond_0
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 1895
    return-object p3

    .line 1897
    :cond_1
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x67

    invoke-direct {v1, v2, p1, p2, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v1
.end method

.method private createElementGet(Lcom/trendmicro/hippo/Node;Ljava/lang/String;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;
    .param p2, "namespace"    # Ljava/lang/String;
    .param p3, "elem"    # Lcom/trendmicro/hippo/Node;
    .param p4, "memberTypeFlags"    # I

    .line 2051
    if-nez p2, :cond_1

    if-nez p4, :cond_1

    .line 2054
    if-eqz p1, :cond_0

    .line 2055
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x24

    invoke-direct {v0, v1, p1, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v0

    .line 2054
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 2057
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/IRFactory;->createMemberRefGet(Lcom/trendmicro/hippo/Node;Ljava/lang/String;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method private createExprStatementNoReturn(Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "expr"    # Lcom/trendmicro/hippo/Node;
    .param p2, "lineno"    # I

    .line 1436
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x86

    invoke-direct {v0, v1, p1, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    return-object v0
.end method

.method private createFor(Lcom/trendmicro/hippo/ast/Scope;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 9
    .param p1, "loop"    # Lcom/trendmicro/hippo/ast/Scope;
    .param p2, "init"    # Lcom/trendmicro/hippo/Node;
    .param p3, "test"    # Lcom/trendmicro/hippo/Node;
    .param p4, "incr"    # Lcom/trendmicro/hippo/Node;
    .param p5, "body"    # Lcom/trendmicro/hippo/Node;

    .line 1518
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x9a

    if-ne v0, v1, :cond_0

    .line 1522
    invoke-static {p1}, Lcom/trendmicro/hippo/ast/Scope;->splitScope(Lcom/trendmicro/hippo/ast/Scope;)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    .line 1523
    .local v0, "let":Lcom/trendmicro/hippo/ast/Scope;
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/Scope;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 1524
    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/ast/Scope;->addChildrenToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1525
    const/4 v4, 0x2

    new-instance v7, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x81

    invoke-direct {v7, v1}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v2, p0

    move-object v3, p1

    move-object v5, p5

    move-object v6, p3

    move-object v8, p4

    invoke-direct/range {v2 .. v8}, Lcom/trendmicro/hippo/IRFactory;->createLoop(Lcom/trendmicro/hippo/ast/Jump;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/Scope;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1527
    return-object v0

    .line 1529
    .end local v0    # "let":Lcom/trendmicro/hippo/ast/Scope;
    :cond_0
    const/4 v4, 0x2

    move-object v2, p0

    move-object v3, p1

    move-object v5, p5

    move-object v6, p3

    move-object v7, p2

    move-object v8, p4

    invoke-direct/range {v2 .. v8}, Lcom/trendmicro/hippo/IRFactory;->createLoop(Lcom/trendmicro/hippo/ast/Jump;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method private createForIn(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;ZZ)Lcom/trendmicro/hippo/Node;
    .locals 21
    .param p1, "declType"    # I
    .param p2, "loop"    # Lcom/trendmicro/hippo/Node;
    .param p3, "lhs"    # Lcom/trendmicro/hippo/Node;
    .param p4, "obj"    # Lcom/trendmicro/hippo/Node;
    .param p5, "body"    # Lcom/trendmicro/hippo/Node;
    .param p6, "isForEach"    # Z
    .param p7, "isForOf"    # Z

    .line 1589
    move-object/from16 v7, p0

    move-object/from16 v8, p3

    const/4 v0, -0x1

    .line 1590
    .local v0, "destructuring":I
    const/4 v1, 0x0

    .line 1592
    .local v1, "destructuringLen":I
    invoke-virtual/range {p3 .. p3}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v2

    .line 1593
    .local v2, "type":I
    const/4 v3, 0x0

    const-string v4, "msg.bad.for.in.lhs"

    const/16 v9, 0x9a

    const/16 v5, 0x42

    const/16 v10, 0x7b

    const/16 v6, 0x43

    if-eq v2, v10, :cond_5

    if-ne v2, v9, :cond_0

    goto :goto_1

    .line 1609
    :cond_0
    if-eq v2, v5, :cond_3

    if-ne v2, v6, :cond_1

    goto :goto_0

    .line 1616
    :cond_1
    invoke-direct {v7, v8}, Lcom/trendmicro/hippo/IRFactory;->makeReference(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 1617
    .local v5, "lvalue":Lcom/trendmicro/hippo/Node;
    if-nez v5, :cond_2

    .line 1618
    invoke-virtual {v7, v4}, Lcom/trendmicro/hippo/IRFactory;->reportError(Ljava/lang/String;)V

    .line 1619
    return-object v3

    .line 1617
    :cond_2
    move v11, v0

    move v12, v1

    move v13, v2

    move-object v14, v5

    goto/16 :goto_4

    .line 1610
    .end local v5    # "lvalue":Lcom/trendmicro/hippo/Node;
    :cond_3
    :goto_0
    move v0, v2

    .line 1611
    move-object/from16 v5, p3

    .line 1612
    .restart local v5    # "lvalue":Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x0

    .line 1613
    instance-of v3, v8, Lcom/trendmicro/hippo/ast/ArrayLiteral;

    if-eqz v3, :cond_4

    .line 1614
    move-object v3, v8

    check-cast v3, Lcom/trendmicro/hippo/ast/ArrayLiteral;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->getDestructuringLength()I

    move-result v1

    move v11, v0

    move v12, v1

    move v13, v2

    move-object v14, v5

    goto :goto_4

    .line 1613
    :cond_4
    move v11, v0

    move v12, v1

    move v13, v2

    move-object v14, v5

    goto :goto_4

    .line 1594
    .end local v5    # "lvalue":Lcom/trendmicro/hippo/Node;
    :cond_5
    :goto_1
    invoke-virtual/range {p3 .. p3}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v11

    .line 1595
    .local v11, "kid":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v11}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v12

    .line 1596
    .local v12, "kidType":I
    if-eq v12, v5, :cond_8

    if-ne v12, v6, :cond_6

    goto :goto_2

    .line 1603
    :cond_6
    const/16 v5, 0x27

    if-ne v12, v5, :cond_7

    .line 1604
    invoke-virtual {v11}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/trendmicro/hippo/Node;->newString(ILjava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    move-object v5, v3

    .local v3, "lvalue":Lcom/trendmicro/hippo/Node;
    goto :goto_3

    .line 1606
    .end local v3    # "lvalue":Lcom/trendmicro/hippo/Node;
    :cond_7
    invoke-virtual {v7, v4}, Lcom/trendmicro/hippo/IRFactory;->reportError(Ljava/lang/String;)V

    .line 1607
    return-object v3

    .line 1598
    :cond_8
    :goto_2
    move v0, v12

    move v2, v12

    .line 1599
    move-object v3, v11

    .line 1600
    .restart local v3    # "lvalue":Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x0

    .line 1601
    instance-of v4, v11, Lcom/trendmicro/hippo/ast/ArrayLiteral;

    if-eqz v4, :cond_9

    .line 1602
    move-object v4, v11

    check-cast v4, Lcom/trendmicro/hippo/ast/ArrayLiteral;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->getDestructuringLength()I

    move-result v1

    move-object v5, v3

    goto :goto_3

    .line 1601
    :cond_9
    move-object v5, v3

    .line 1609
    .end local v3    # "lvalue":Lcom/trendmicro/hippo/Node;
    .end local v11    # "kid":Lcom/trendmicro/hippo/Node;
    .end local v12    # "kidType":I
    .restart local v5    # "lvalue":Lcom/trendmicro/hippo/Node;
    :goto_3
    move v11, v0

    move v12, v1

    move v13, v2

    move-object v14, v5

    .line 1623
    .end local v0    # "destructuring":I
    .end local v1    # "destructuringLen":I
    .end local v2    # "type":I
    .end local v5    # "lvalue":Lcom/trendmicro/hippo/Node;
    .local v11, "destructuring":I
    .local v12, "destructuringLen":I
    .local v13, "type":I
    .local v14, "lvalue":Lcom/trendmicro/hippo/Node;
    :goto_4
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x8e

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v15, v0

    .line 1624
    .local v15, "localBlock":Lcom/trendmicro/hippo/Node;
    const/4 v0, -0x1

    if-eqz p6, :cond_a

    const/16 v1, 0x3b

    goto :goto_5

    .line 1625
    :cond_a
    if-eqz p7, :cond_b

    const/16 v1, 0x3d

    goto :goto_5

    .line 1626
    :cond_b
    if-eq v11, v0, :cond_c

    .line 1627
    const/16 v1, 0x3c

    goto :goto_5

    .line 1628
    :cond_c
    const/16 v1, 0x3a

    :goto_5
    move v5, v1

    .line 1629
    .local v5, "initType":I
    new-instance v1, Lcom/trendmicro/hippo/Node;

    move-object/from16 v4, p4

    invoke-direct {v1, v5, v4}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    move-object v3, v1

    .line 1630
    .local v3, "init":Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x3

    invoke-virtual {v3, v1, v15}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 1631
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/16 v9, 0x3e

    invoke-direct {v2, v9}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v9, v2

    .line 1632
    .local v9, "cond":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v9, v1, v15}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 1633
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/16 v10, 0x3f

    invoke-direct {v2, v10}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v10, v2

    .line 1634
    .local v10, "id":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v10, v1, v15}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 1636
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x82

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v2, v1

    .line 1638
    .local v2, "newBody":Lcom/trendmicro/hippo/Node;
    if-eq v11, v0, :cond_f

    .line 1639
    move/from16 v1, p1

    invoke-virtual {v7, v1, v14, v10}, Lcom/trendmicro/hippo/IRFactory;->createDestructuringAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 1640
    .local v0, "assign":Lcom/trendmicro/hippo/Node;
    if-nez p6, :cond_e

    if-nez p7, :cond_e

    if-eq v11, v6, :cond_d

    const/4 v6, 0x2

    if-eq v12, v6, :cond_e

    .line 1646
    :cond_d
    const-string v6, "msg.bad.for.in.destruct"

    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/IRFactory;->reportError(Ljava/lang/String;)V

    .line 1651
    :cond_e
    move-object v6, v0

    goto :goto_6

    .line 1649
    .end local v0    # "assign":Lcom/trendmicro/hippo/Node;
    :cond_f
    move/from16 v1, p1

    invoke-virtual {v7, v14, v10}, Lcom/trendmicro/hippo/IRFactory;->simpleAssignment(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    move-object v6, v0

    .line 1651
    .local v6, "assign":Lcom/trendmicro/hippo/Node;
    :goto_6
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x86

    invoke-direct {v0, v1, v6}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1652
    move-object/from16 v1, p5

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1654
    move-object/from16 v16, p2

    check-cast v16, Lcom/trendmicro/hippo/ast/Jump;

    const/16 v17, 0x1

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v16, v2

    .end local v2    # "newBody":Lcom/trendmicro/hippo/Node;
    .local v16, "newBody":Lcom/trendmicro/hippo/Node;
    move/from16 v2, v17

    move-object/from16 v20, v3

    .end local v3    # "init":Lcom/trendmicro/hippo/Node;
    .local v20, "init":Lcom/trendmicro/hippo/Node;
    move-object/from16 v3, v16

    move-object v4, v9

    move/from16 v17, v5

    .end local v5    # "initType":I
    .local v17, "initType":I
    move-object/from16 v5, v18

    move-object/from16 v18, v6

    .end local v6    # "assign":Lcom/trendmicro/hippo/Node;
    .local v18, "assign":Lcom/trendmicro/hippo/Node;
    move-object/from16 v6, v19

    invoke-direct/range {v0 .. v6}, Lcom/trendmicro/hippo/IRFactory;->createLoop(Lcom/trendmicro/hippo/ast/Jump;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 1655
    .end local p2    # "loop":Lcom/trendmicro/hippo/Node;
    .local v0, "loop":Lcom/trendmicro/hippo/Node;
    move-object/from16 v1, v20

    .end local v20    # "init":Lcom/trendmicro/hippo/Node;
    .local v1, "init":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 1656
    const/16 v2, 0x7b

    if-eq v13, v2, :cond_10

    const/16 v2, 0x9a

    if-ne v13, v2, :cond_11

    .line 1657
    :cond_10
    invoke-virtual {v0, v8}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 1658
    :cond_11
    invoke-virtual {v15, v0}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1660
    return-object v15
.end method

.method private createIf(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;
    .locals 6
    .param p1, "cond"    # Lcom/trendmicro/hippo/Node;
    .param p2, "ifTrue"    # Lcom/trendmicro/hippo/Node;
    .param p3, "ifFalse"    # Lcom/trendmicro/hippo/Node;
    .param p4, "lineno"    # I

    .line 1858
    invoke-static {p1}, Lcom/trendmicro/hippo/IRFactory;->isAlwaysDefinedBoolean(Lcom/trendmicro/hippo/Node;)I

    move-result v0

    .line 1859
    .local v0, "condStatus":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1860
    return-object p2

    .line 1861
    :cond_0
    const/4 v1, -0x1

    const/16 v2, 0x82

    if-ne v0, v1, :cond_2

    .line 1862
    if-eqz p3, :cond_1

    .line 1863
    return-object p3

    .line 1866
    :cond_1
    new-instance v1, Lcom/trendmicro/hippo/Node;

    invoke-direct {v1, v2, p4}, Lcom/trendmicro/hippo/Node;-><init>(II)V

    return-object v1

    .line 1869
    :cond_2
    new-instance v1, Lcom/trendmicro/hippo/Node;

    invoke-direct {v1, v2, p4}, Lcom/trendmicro/hippo/Node;-><init>(II)V

    .line 1870
    .local v1, "result":Lcom/trendmicro/hippo/Node;
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 1871
    .local v2, "ifNotTarget":Lcom/trendmicro/hippo/Node;
    new-instance v3, Lcom/trendmicro/hippo/ast/Jump;

    const/4 v4, 0x7

    invoke-direct {v3, v4, p1}, Lcom/trendmicro/hippo/ast/Jump;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 1872
    .local v3, "IFNE":Lcom/trendmicro/hippo/ast/Jump;
    iput-object v2, v3, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 1874
    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1875
    invoke-virtual {v1, p2}, Lcom/trendmicro/hippo/Node;->addChildrenToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1877
    if-eqz p3, :cond_3

    .line 1878
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 1879
    .local v4, "endTarget":Lcom/trendmicro/hippo/Node;
    const/4 v5, 0x5

    invoke-direct {p0, v5, v4}, Lcom/trendmicro/hippo/IRFactory;->makeJump(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/ast/Jump;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1880
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1881
    invoke-virtual {v1, p3}, Lcom/trendmicro/hippo/Node;->addChildrenToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1882
    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1883
    .end local v4    # "endTarget":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 1884
    :cond_3
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1887
    :goto_0
    return-object v1
.end method

.method private createIncDec(IZLcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "nodeType"    # I
    .param p2, "post"    # Z
    .param p3, "child"    # Lcom/trendmicro/hippo/Node;

    .line 1997
    invoke-direct {p0, p3}, Lcom/trendmicro/hippo/IRFactory;->makeReference(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object p3

    .line 1998
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 2000
    .local v0, "childType":I
    const/16 v1, 0x21

    if-eq v0, v1, :cond_1

    const/16 v1, 0x24

    if-eq v0, v1, :cond_1

    const/16 v1, 0x27

    if-eq v0, v1, :cond_1

    const/16 v1, 0x44

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 2017
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 2005
    :cond_1
    :goto_0
    new-instance v1, Lcom/trendmicro/hippo/Node;

    invoke-direct {v1, p1, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 2006
    .local v1, "n":Lcom/trendmicro/hippo/Node;
    const/4 v2, 0x0

    .line 2007
    .local v2, "incrDecrMask":I
    const/16 v3, 0x6c

    if-ne p1, v3, :cond_2

    .line 2008
    or-int/lit8 v2, v2, 0x1

    .line 2010
    :cond_2
    if-eqz p2, :cond_3

    .line 2011
    or-int/lit8 v2, v2, 0x2

    .line 2013
    :cond_3
    const/16 v3, 0xd

    invoke-virtual {v1, v3, v2}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 2014
    return-object v1
.end method

.method private createLoop(Lcom/trendmicro/hippo/ast/Jump;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 16
    .param p1, "loop"    # Lcom/trendmicro/hippo/ast/Jump;
    .param p2, "loopType"    # I
    .param p3, "body"    # Lcom/trendmicro/hippo/Node;
    .param p4, "cond"    # Lcom/trendmicro/hippo/Node;
    .param p5, "init"    # Lcom/trendmicro/hippo/Node;
    .param p6, "incr"    # Lcom/trendmicro/hippo/Node;

    .line 1535
    move-object/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, p3

    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 1536
    .local v3, "bodyTarget":Lcom/trendmicro/hippo/Node;
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 1537
    .local v4, "condTarget":Lcom/trendmicro/hippo/Node;
    const/16 v5, 0x81

    const/4 v6, 0x2

    if-ne v1, v6, :cond_0

    invoke-virtual/range {p4 .. p4}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v7

    if-ne v7, v5, :cond_0

    .line 1538
    new-instance v7, Lcom/trendmicro/hippo/Node;

    const/16 v8, 0x2d

    invoke-direct {v7, v8}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .end local p4    # "cond":Lcom/trendmicro/hippo/Node;
    .local v7, "cond":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 1540
    .end local v7    # "cond":Lcom/trendmicro/hippo/Node;
    .restart local p4    # "cond":Lcom/trendmicro/hippo/Node;
    :cond_0
    move-object/from16 v7, p4

    .end local p4    # "cond":Lcom/trendmicro/hippo/Node;
    .restart local v7    # "cond":Lcom/trendmicro/hippo/Node;
    :goto_0
    new-instance v8, Lcom/trendmicro/hippo/ast/Jump;

    const/4 v9, 0x6

    invoke-direct {v8, v9, v7}, Lcom/trendmicro/hippo/ast/Jump;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 1541
    .local v8, "IFEQ":Lcom/trendmicro/hippo/ast/Jump;
    iput-object v3, v8, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 1542
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v9

    .line 1544
    .local v9, "breakTarget":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1545
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/ast/Jump;->addChildrenToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1546
    const/4 v10, 0x1

    if-eq v1, v10, :cond_1

    if-ne v1, v6, :cond_2

    .line 1548
    :cond_1
    new-instance v11, Lcom/trendmicro/hippo/Node;

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/Jump;->getLineno()I

    move-result v12

    invoke-direct {v11, v5, v12}, Lcom/trendmicro/hippo/Node;-><init>(II)V

    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/ast/Jump;->addChildrenToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1550
    :cond_2
    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1551
    invoke-virtual {v0, v8}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1552
    invoke-virtual {v0, v9}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1554
    iput-object v9, v0, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 1555
    move-object v11, v4

    .line 1557
    .local v11, "continueTarget":Lcom/trendmicro/hippo/Node;
    if-eq v1, v10, :cond_4

    if-ne v1, v6, :cond_3

    goto :goto_1

    :cond_3
    move-object/from16 v12, p0

    move-object/from16 v14, p5

    move-object/from16 v15, p6

    goto :goto_5

    .line 1559
    :cond_4
    :goto_1
    const/4 v10, 0x5

    move-object/from16 v12, p0

    invoke-direct {v12, v10, v4}, Lcom/trendmicro/hippo/IRFactory;->makeJump(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/ast/Jump;

    move-result-object v10

    invoke-virtual {v0, v10}, Lcom/trendmicro/hippo/ast/Jump;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 1561
    if-ne v1, v6, :cond_8

    .line 1562
    invoke-virtual/range {p5 .. p5}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v6

    .line 1563
    .local v6, "initType":I
    const/16 v10, 0x86

    if-eq v6, v5, :cond_6

    .line 1564
    const/16 v13, 0x7b

    if-eq v6, v13, :cond_5

    const/16 v13, 0x9a

    if-eq v6, v13, :cond_5

    .line 1565
    new-instance v13, Lcom/trendmicro/hippo/Node;

    move-object/from16 v14, p5

    invoke-direct {v13, v10, v14}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .end local p5    # "init":Lcom/trendmicro/hippo/Node;
    .local v13, "init":Lcom/trendmicro/hippo/Node;
    goto :goto_2

    .line 1564
    .end local v13    # "init":Lcom/trendmicro/hippo/Node;
    .restart local p5    # "init":Lcom/trendmicro/hippo/Node;
    :cond_5
    move-object/from16 v14, p5

    .line 1567
    move-object v13, v14

    .end local p5    # "init":Lcom/trendmicro/hippo/Node;
    .restart local v13    # "init":Lcom/trendmicro/hippo/Node;
    :goto_2
    invoke-virtual {v0, v13}, Lcom/trendmicro/hippo/ast/Jump;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    goto :goto_3

    .line 1563
    .end local v13    # "init":Lcom/trendmicro/hippo/Node;
    .restart local p5    # "init":Lcom/trendmicro/hippo/Node;
    :cond_6
    move-object/from16 v14, p5

    move-object v13, v14

    .line 1569
    .end local p5    # "init":Lcom/trendmicro/hippo/Node;
    .restart local v13    # "init":Lcom/trendmicro/hippo/Node;
    :goto_3
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v14

    .line 1570
    .local v14, "incrTarget":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0, v14, v2}, Lcom/trendmicro/hippo/ast/Jump;->addChildAfter(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 1571
    invoke-virtual/range {p6 .. p6}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v15

    if-eq v15, v5, :cond_7

    .line 1572
    new-instance v5, Lcom/trendmicro/hippo/Node;

    move-object/from16 v15, p6

    invoke-direct {v5, v10, v15}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 1573
    .end local p6    # "incr":Lcom/trendmicro/hippo/Node;
    .local v5, "incr":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0, v5, v14}, Lcom/trendmicro/hippo/ast/Jump;->addChildAfter(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v15, v5

    goto :goto_4

    .line 1571
    .end local v5    # "incr":Lcom/trendmicro/hippo/Node;
    .restart local p6    # "incr":Lcom/trendmicro/hippo/Node;
    :cond_7
    move-object/from16 v15, p6

    .line 1575
    .end local p6    # "incr":Lcom/trendmicro/hippo/Node;
    .local v15, "incr":Lcom/trendmicro/hippo/Node;
    :goto_4
    move-object v11, v14

    goto :goto_6

    .line 1561
    .end local v6    # "initType":I
    .end local v13    # "init":Lcom/trendmicro/hippo/Node;
    .end local v14    # "incrTarget":Lcom/trendmicro/hippo/Node;
    .end local v15    # "incr":Lcom/trendmicro/hippo/Node;
    .restart local p5    # "init":Lcom/trendmicro/hippo/Node;
    .restart local p6    # "incr":Lcom/trendmicro/hippo/Node;
    :cond_8
    move-object/from16 v14, p5

    move-object/from16 v15, p6

    .line 1579
    :goto_5
    move-object v13, v14

    .end local p5    # "init":Lcom/trendmicro/hippo/Node;
    .end local p6    # "incr":Lcom/trendmicro/hippo/Node;
    .restart local v13    # "init":Lcom/trendmicro/hippo/Node;
    .restart local v15    # "incr":Lcom/trendmicro/hippo/Node;
    :goto_6
    invoke-virtual {v0, v11}, Lcom/trendmicro/hippo/ast/Jump;->setContinue(Lcom/trendmicro/hippo/Node;)V

    .line 1580
    return-object v0
.end method

.method private createLoopNode(Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/ast/Scope;
    .locals 2
    .param p1, "loopLabel"    # Lcom/trendmicro/hippo/Node;
    .param p2, "lineno"    # I

    .line 1509
    const/16 v0, 0x85

    invoke-virtual {p0, v0, p2}, Lcom/trendmicro/hippo/IRFactory;->createScopeNode(II)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v0

    .line 1510
    .local v0, "result":Lcom/trendmicro/hippo/ast/Scope;
    if-eqz p1, :cond_0

    .line 1511
    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/ast/Jump;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/ast/Jump;->setLoop(Lcom/trendmicro/hippo/ast/Jump;)V

    .line 1513
    :cond_0
    return-object v0
.end method

.method private createMemberRefGet(Lcom/trendmicro/hippo/Node;Ljava/lang/String;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;
    .param p2, "namespace"    # Ljava/lang/String;
    .param p3, "elem"    # Lcom/trendmicro/hippo/Node;
    .param p4, "memberTypeFlags"    # I

    .line 2063
    const/4 v0, 0x0

    .line 2064
    .local v0, "nsNode":Lcom/trendmicro/hippo/Node;
    if-eqz p2, :cond_1

    .line 2066
    const-string v1, "*"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2067
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x2a

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v0, v1

    goto :goto_0

    .line 2069
    :cond_0
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 2073
    :cond_1
    :goto_0
    if-nez p1, :cond_3

    .line 2074
    if-nez p2, :cond_2

    .line 2075
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x50

    invoke-direct {v1, v2, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .local v1, "ref":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .line 2077
    .end local v1    # "ref":Lcom/trendmicro/hippo/Node;
    :cond_2
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x51

    invoke-direct {v1, v2, v0, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .restart local v1    # "ref":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .line 2080
    .end local v1    # "ref":Lcom/trendmicro/hippo/Node;
    :cond_3
    if-nez p2, :cond_4

    .line 2081
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x4e

    invoke-direct {v1, v2, p1, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .restart local v1    # "ref":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .line 2083
    .end local v1    # "ref":Lcom/trendmicro/hippo/Node;
    :cond_4
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x4f

    invoke-direct {v1, v2, p1, v0, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 2086
    .restart local v1    # "ref":Lcom/trendmicro/hippo/Node;
    :goto_1
    if-eqz p4, :cond_5

    .line 2087
    const/16 v2, 0x10

    invoke-virtual {v1, v2, p4}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 2089
    :cond_5
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/16 v3, 0x44

    invoke-direct {v2, v3, v1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    return-object v2
.end method

.method private createPropertyGet(Lcom/trendmicro/hippo/Node;Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "target"    # Lcom/trendmicro/hippo/Node;
    .param p2, "namespace"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "memberTypeFlags"    # I

    .line 2023
    if-nez p2, :cond_2

    if-nez p4, :cond_2

    .line 2024
    if-nez p1, :cond_0

    .line 2025
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 2027
    :cond_0
    const/16 v0, 0x21

    invoke-virtual {p0, p3, v0}, Lcom/trendmicro/hippo/IRFactory;->checkActivationName(Ljava/lang/String;I)V

    .line 2028
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->isSpecialProperty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2029
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x48

    invoke-direct {v0, v1, p1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 2030
    .local v0, "ref":Lcom/trendmicro/hippo/Node;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, p3}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 2031
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x44

    invoke-direct {v1, v2, v0}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    return-object v1

    .line 2033
    .end local v0    # "ref":Lcom/trendmicro/hippo/Node;
    :cond_1
    new-instance v1, Lcom/trendmicro/hippo/Node;

    invoke-static {p3}, Lcom/trendmicro/hippo/Node;->newString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-direct {v1, v0, p1, v2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v1

    .line 2035
    :cond_2
    invoke-static {p3}, Lcom/trendmicro/hippo/Node;->newString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 2036
    .local v0, "elem":Lcom/trendmicro/hippo/Node;
    or-int/lit8 p4, p4, 0x1

    .line 2037
    invoke-direct {p0, p1, p2, v0, p4}, Lcom/trendmicro/hippo/IRFactory;->createMemberRefGet(Lcom/trendmicro/hippo/Node;Ljava/lang/String;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    return-object v1
.end method

.method private createString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 1440
    invoke-static {p1}, Lcom/trendmicro/hippo/Node;->newString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method private createTryCatchFinally(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;
    .locals 20
    .param p1, "tryBlock"    # Lcom/trendmicro/hippo/Node;
    .param p2, "catchBlocks"    # Lcom/trendmicro/hippo/Node;
    .param p3, "finallyBlock"    # Lcom/trendmicro/hippo/Node;
    .param p4, "lineno"    # I

    .line 1681
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    const/16 v3, 0x82

    if-eqz v2, :cond_1

    .line 1682
    invoke-virtual/range {p3 .. p3}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    if-ne v4, v3, :cond_0

    .line 1683
    invoke-virtual/range {p3 .. p3}, Lcom/trendmicro/hippo/Node;->hasChildren()Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    .line 1686
    .local v4, "hasFinally":Z
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v5

    if-ne v5, v3, :cond_2

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Node;->hasChildren()Z

    move-result v3

    if-nez v3, :cond_2

    if-nez v4, :cond_2

    .line 1689
    return-object v1

    .line 1692
    :cond_2
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Node;->hasChildren()Z

    move-result v3

    .line 1695
    .local v3, "hasCatch":Z
    if-nez v4, :cond_3

    if-nez v3, :cond_3

    .line 1697
    return-object v1

    .line 1700
    :cond_3
    new-instance v5, Lcom/trendmicro/hippo/Node;

    const/16 v6, 0x8e

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 1701
    .local v5, "handlerBlock":Lcom/trendmicro/hippo/Node;
    new-instance v7, Lcom/trendmicro/hippo/ast/Jump;

    const/16 v8, 0x52

    move/from16 v9, p4

    invoke-direct {v7, v8, v1, v9}, Lcom/trendmicro/hippo/ast/Jump;-><init>(ILcom/trendmicro/hippo/Node;I)V

    .line 1702
    .local v7, "pn":Lcom/trendmicro/hippo/ast/Jump;
    const/4 v8, 0x3

    invoke-virtual {v7, v8, v5}, Lcom/trendmicro/hippo/ast/Jump;->putProp(ILjava/lang/Object;)V

    .line 1704
    const/4 v10, 0x5

    if-eqz v3, :cond_7

    .line 1706
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v11

    .line 1707
    .local v11, "endCatch":Lcom/trendmicro/hippo/Node;
    invoke-direct {v0, v10, v11}, Lcom/trendmicro/hippo/IRFactory;->makeJump(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/ast/Jump;

    move-result-object v12

    invoke-virtual {v7, v12}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1710
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v12

    .line 1711
    .local v12, "catchTarget":Lcom/trendmicro/hippo/Node;
    iput-object v12, v7, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 1713
    invoke-virtual {v7, v12}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1763
    new-instance v13, Lcom/trendmicro/hippo/Node;

    invoke-direct {v13, v6}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    move-object v6, v13

    .line 1766
    .local v6, "catchScopeBlock":Lcom/trendmicro/hippo/Node;
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v13

    .line 1767
    .local v13, "cb":Lcom/trendmicro/hippo/Node;
    const/4 v14, 0x0

    .line 1768
    .local v14, "hasDefault":Z
    const/4 v15, 0x0

    .line 1769
    .local v15, "scopeIndex":I
    :goto_1
    if-eqz v13, :cond_5

    .line 1770
    invoke-virtual {v13}, Lcom/trendmicro/hippo/Node;->getLineno()I

    move-result v10

    .line 1772
    .local v10, "catchLineNo":I
    invoke-virtual {v13}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v8

    .line 1773
    .local v8, "name":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v8}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1774
    .local v1, "cond":Lcom/trendmicro/hippo/Node;
    move/from16 v16, v3

    .end local v3    # "hasCatch":Z
    .local v16, "hasCatch":Z
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 1775
    .local v3, "catchStatement":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v13, v8}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 1776
    invoke-virtual {v13, v1}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 1777
    invoke-virtual {v13, v3}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 1783
    new-instance v9, Lcom/trendmicro/hippo/Node;

    move-object/from16 v17, v12

    const/4 v12, 0x3

    .end local v12    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .local v17, "catchTarget":Lcom/trendmicro/hippo/Node;
    invoke-direct {v9, v12}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    invoke-virtual {v3, v9}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1784
    const/4 v9, 0x5

    invoke-direct {v0, v9, v11}, Lcom/trendmicro/hippo/IRFactory;->makeJump(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/ast/Jump;

    move-result-object v12

    invoke-virtual {v3, v12}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1788
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v9

    const/16 v12, 0x81

    if-ne v9, v12, :cond_4

    .line 1789
    move-object v9, v3

    .line 1790
    .local v9, "condStmt":Lcom/trendmicro/hippo/Node;
    const/4 v12, 0x1

    move v14, v12

    .end local v14    # "hasDefault":Z
    .local v12, "hasDefault":Z
    goto :goto_2

    .line 1792
    .end local v9    # "condStmt":Lcom/trendmicro/hippo/Node;
    .end local v12    # "hasDefault":Z
    .restart local v14    # "hasDefault":Z
    :cond_4
    const/4 v9, 0x0

    invoke-direct {v0, v1, v3, v9, v10}, Lcom/trendmicro/hippo/IRFactory;->createIf(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v9

    .line 1798
    .restart local v9    # "condStmt":Lcom/trendmicro/hippo/Node;
    :goto_2
    new-instance v12, Lcom/trendmicro/hippo/Node;

    move-object/from16 v18, v1

    .end local v1    # "cond":Lcom/trendmicro/hippo/Node;
    .local v18, "cond":Lcom/trendmicro/hippo/Node;
    const/16 v1, 0x39

    .line 1799
    move-object/from16 v19, v3

    .end local v3    # "catchStatement":Lcom/trendmicro/hippo/Node;
    .local v19, "catchStatement":Lcom/trendmicro/hippo/Node;
    invoke-direct {v0, v5}, Lcom/trendmicro/hippo/IRFactory;->createUseLocal(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-direct {v12, v1, v8, v3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v1, v12

    .line 1800
    .local v1, "catchScope":Lcom/trendmicro/hippo/Node;
    const/4 v3, 0x3

    invoke-virtual {v1, v3, v6}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 1801
    const/16 v3, 0xe

    invoke-virtual {v1, v3, v15}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 1802
    invoke-virtual {v6, v1}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1805
    nop

    .line 1806
    invoke-direct {v0, v6}, Lcom/trendmicro/hippo/IRFactory;->createUseLocal(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-direct {v0, v3, v9, v10}, Lcom/trendmicro/hippo/IRFactory;->createWith(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 1805
    invoke-virtual {v6, v3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1810
    invoke-virtual {v13}, Lcom/trendmicro/hippo/Node;->getNext()Lcom/trendmicro/hippo/Node;

    move-result-object v13

    .line 1811
    nop

    .end local v1    # "catchScope":Lcom/trendmicro/hippo/Node;
    .end local v8    # "name":Lcom/trendmicro/hippo/Node;
    .end local v9    # "condStmt":Lcom/trendmicro/hippo/Node;
    .end local v10    # "catchLineNo":I
    .end local v18    # "cond":Lcom/trendmicro/hippo/Node;
    .end local v19    # "catchStatement":Lcom/trendmicro/hippo/Node;
    add-int/lit8 v15, v15, 0x1

    .line 1812
    move-object/from16 v1, p1

    move/from16 v9, p4

    move/from16 v3, v16

    move-object/from16 v12, v17

    const/4 v8, 0x3

    const/4 v10, 0x5

    goto :goto_1

    .line 1813
    .end local v16    # "hasCatch":Z
    .end local v17    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .local v3, "hasCatch":Z
    .local v12, "catchTarget":Lcom/trendmicro/hippo/Node;
    :cond_5
    move/from16 v16, v3

    move-object/from16 v17, v12

    .end local v3    # "hasCatch":Z
    .end local v12    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .restart local v16    # "hasCatch":Z
    .restart local v17    # "catchTarget":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1814
    if-nez v14, :cond_6

    .line 1816
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v3, 0x33

    invoke-direct {v1, v3}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 1817
    .local v1, "rethrow":Lcom/trendmicro/hippo/Node;
    const/4 v3, 0x3

    invoke-virtual {v1, v3, v5}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 1818
    invoke-virtual {v7, v1}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1821
    .end local v1    # "rethrow":Lcom/trendmicro/hippo/Node;
    :cond_6
    invoke-virtual {v7, v11}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    goto :goto_3

    .line 1704
    .end local v6    # "catchScopeBlock":Lcom/trendmicro/hippo/Node;
    .end local v11    # "endCatch":Lcom/trendmicro/hippo/Node;
    .end local v13    # "cb":Lcom/trendmicro/hippo/Node;
    .end local v14    # "hasDefault":Z
    .end local v15    # "scopeIndex":I
    .end local v16    # "hasCatch":Z
    .end local v17    # "catchTarget":Lcom/trendmicro/hippo/Node;
    .restart local v3    # "hasCatch":Z
    :cond_7
    move/from16 v16, v3

    .line 1824
    .end local v3    # "hasCatch":Z
    .restart local v16    # "hasCatch":Z
    :goto_3
    if-eqz v4, :cond_8

    .line 1825
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1826
    .local v1, "finallyTarget":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v7, v1}, Lcom/trendmicro/hippo/ast/Jump;->setFinally(Lcom/trendmicro/hippo/Node;)V

    .line 1829
    const/16 v3, 0x88

    invoke-direct {v0, v3, v1}, Lcom/trendmicro/hippo/IRFactory;->makeJump(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/ast/Jump;

    move-result-object v3

    invoke-virtual {v7, v3}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1832
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 1833
    .local v3, "finallyEnd":Lcom/trendmicro/hippo/Node;
    const/4 v6, 0x5

    invoke-direct {v0, v6, v3}, Lcom/trendmicro/hippo/IRFactory;->makeJump(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/ast/Jump;

    move-result-object v6

    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1835
    invoke-virtual {v7, v1}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1836
    new-instance v6, Lcom/trendmicro/hippo/Node;

    const/16 v8, 0x7e

    invoke-direct {v6, v8, v2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 1837
    .local v6, "fBlock":Lcom/trendmicro/hippo/Node;
    const/4 v8, 0x3

    invoke-virtual {v6, v8, v5}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 1838
    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1840
    invoke-virtual {v7, v3}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1842
    .end local v1    # "finallyTarget":Lcom/trendmicro/hippo/Node;
    .end local v3    # "finallyEnd":Lcom/trendmicro/hippo/Node;
    .end local v6    # "fBlock":Lcom/trendmicro/hippo/Node;
    :cond_8
    invoke-virtual {v5, v7}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1843
    return-object v5
.end method

.method private createUnary(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "nodeType"    # I
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 1902
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 1903
    .local v0, "childType":I
    const/16 v1, 0x2d

    const/16 v2, 0x27

    const/16 v3, 0x28

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_4

    .line 1932
    :pswitch_1
    if-ne v0, v2, :cond_7

    .line 1933
    const/16 v1, 0x8a

    invoke-virtual {p2, v1}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 1934
    return-object p2

    .line 1906
    :pswitch_2
    if-ne v0, v2, :cond_0

    .line 1909
    const/16 v1, 0x31

    invoke-virtual {p2, v1}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 1910
    move-object v1, p2

    .line 1911
    .local v1, "left":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/trendmicro/hippo/Node;->newString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 1912
    .local v2, "right":Lcom/trendmicro/hippo/Node;
    new-instance v3, Lcom/trendmicro/hippo/Node;

    invoke-direct {v3, p1, v1, v2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v1, v3

    .line 1913
    .end local v2    # "right":Lcom/trendmicro/hippo/Node;
    .local v1, "n":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .end local v1    # "n":Lcom/trendmicro/hippo/Node;
    :cond_0
    const/16 v2, 0x21

    if-eq v0, v2, :cond_3

    const/16 v2, 0x24

    if-ne v0, v2, :cond_1

    goto :goto_0

    .line 1921
    :cond_1
    const/16 v2, 0x44

    if-ne v0, v2, :cond_2

    .line 1922
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1923
    .local v1, "ref":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p2, v1}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 1924
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/16 v3, 0x46

    invoke-direct {v2, v3, v1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    move-object v1, v2

    .line 1925
    .local v1, "n":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .line 1927
    .end local v1    # "n":Lcom/trendmicro/hippo/Node;
    :cond_2
    new-instance v2, Lcom/trendmicro/hippo/Node;

    new-instance v3, Lcom/trendmicro/hippo/Node;

    invoke-direct {v3, v1}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    invoke-direct {v2, p1, v3, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v1, v2

    .restart local v1    # "n":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .line 1916
    .end local v1    # "n":Lcom/trendmicro/hippo/Node;
    :cond_3
    :goto_0
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1917
    .local v1, "left":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 1918
    .restart local v2    # "right":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p2, v1}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 1919
    invoke-virtual {p2, v2}, Lcom/trendmicro/hippo/Node;->removeChild(Lcom/trendmicro/hippo/Node;)V

    .line 1920
    new-instance v3, Lcom/trendmicro/hippo/Node;

    invoke-direct {v3, p1, v1, v2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v1, v3

    .line 1921
    .end local v2    # "right":Lcom/trendmicro/hippo/Node;
    .local v1, "n":Lcom/trendmicro/hippo/Node;
    nop

    .line 1929
    :goto_1
    return-object v1

    .line 1945
    .end local v1    # "n":Lcom/trendmicro/hippo/Node;
    :pswitch_3
    if-ne v0, v3, :cond_7

    .line 1946
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v1

    neg-double v1, v1

    invoke-virtual {p2, v1, v2}, Lcom/trendmicro/hippo/Node;->setDouble(D)V

    .line 1947
    return-object p2

    .line 1938
    :pswitch_4
    if-ne v0, v3, :cond_7

    .line 1939
    invoke-virtual {p2}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v1

    .line 1940
    .local v1, "value":I
    not-int v2, v1

    int-to-double v2, v2

    invoke-virtual {p2, v2, v3}, Lcom/trendmicro/hippo/Node;->setDouble(D)V

    .line 1941
    return-object p2

    .line 1951
    .end local v1    # "value":I
    :pswitch_5
    invoke-static {p2}, Lcom/trendmicro/hippo/IRFactory;->isAlwaysDefinedBoolean(Lcom/trendmicro/hippo/Node;)I

    move-result v2

    .line 1952
    .local v2, "status":I
    if-eqz v2, :cond_7

    .line 1954
    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    .line 1955
    const/16 v3, 0x2c

    .local v3, "type":I
    goto :goto_2

    .line 1957
    .end local v3    # "type":I
    :cond_4
    const/16 v3, 0x2d

    .line 1959
    .restart local v3    # "type":I
    :goto_2
    if-eq v0, v1, :cond_6

    const/16 v1, 0x2c

    if-ne v0, v1, :cond_5

    goto :goto_3

    .line 1963
    :cond_5
    new-instance v1, Lcom/trendmicro/hippo/Node;

    invoke-direct {v1, v3}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    return-object v1

    .line 1960
    :cond_6
    :goto_3
    invoke-virtual {p2, v3}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 1961
    return-object p2

    .line 1968
    .end local v2    # "status":I
    .end local v3    # "type":I
    :cond_7
    :goto_4
    new-instance v1, Lcom/trendmicro/hippo/Node;

    invoke-direct {v1, p1, p2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1a
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private createUseLocal(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "localBlock"    # Lcom/trendmicro/hippo/Node;

    .line 2290
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x8e

    if-ne v1, v0, :cond_0

    .line 2291
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x36

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 2292
    .local v0, "result":Lcom/trendmicro/hippo/Node;
    const/4 v1, 0x3

    invoke-virtual {v0, v1, p1}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 2293
    return-object v0

    .line 2290
    .end local v0    # "result":Lcom/trendmicro/hippo/Node;
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private createWith(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "obj"    # Lcom/trendmicro/hippo/Node;
    .param p2, "body"    # Lcom/trendmicro/hippo/Node;
    .param p3, "lineno"    # I

    .line 1847
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->setRequiresActivation()V

    .line 1848
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x82

    invoke-direct {v0, v1, p3}, Lcom/trendmicro/hippo/Node;-><init>(II)V

    .line 1849
    .local v0, "result":Lcom/trendmicro/hippo/Node;
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/4 v2, 0x2

    invoke-direct {v1, v2, p1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1850
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x7c

    invoke-direct {v1, v2, p2, p3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    .line 1851
    .local v1, "bodyNode":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->addChildrenToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1852
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1853
    return-object v0
.end method

.method private genExprTransformHelper(Lcom/trendmicro/hippo/ast/GeneratorExpression;)Lcom/trendmicro/hippo/Node;
    .locals 24
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/GeneratorExpression;

    .line 703
    move-object/from16 v9, p0

    iget-object v0, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 704
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->getLineno()I

    move-result v10

    .line 705
    .local v10, "lineno":I
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->getResult()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 707
    .local v0, "expr":Lcom/trendmicro/hippo/Node;
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->getLoops()Ljava/util/List;

    move-result-object v11

    .line 708
    .local v11, "loops":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;>;"
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    .line 711
    .local v12, "numLoops":I
    new-array v13, v12, [Lcom/trendmicro/hippo/Node;

    .line 712
    .local v13, "iterators":[Lcom/trendmicro/hippo/Node;
    new-array v14, v12, [Lcom/trendmicro/hippo/Node;

    .line 714
    .local v14, "iteratedObjs":[Lcom/trendmicro/hippo/Node;
    const/4 v2, 0x0

    move-object v15, v0

    .end local v0    # "expr":Lcom/trendmicro/hippo/Node;
    .local v2, "i":I
    .local v15, "expr":Lcom/trendmicro/hippo/Node;
    :goto_0
    const-string v0, " "

    const/16 v8, 0x59

    if-ge v2, v12, :cond_2

    .line 715
    invoke-interface {v11, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;

    .line 716
    .local v3, "acl":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    iget-object v4, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v4, v0}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 717
    iget-object v0, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v4, 0x78

    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 718
    iget-object v0, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 720
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->getIterator()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 721
    .local v0, "iter":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v4, 0x0

    .line 722
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v5

    const/16 v6, 0x27

    const/4 v7, 0x0

    if-ne v5, v6, :cond_0

    .line 723
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->getString()Ljava/lang/String;

    move-result-object v4

    .line 724
    iget-object v5, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v5, v4}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    goto :goto_1

    .line 727
    :cond_0
    invoke-virtual {v9, v0}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 728
    iget-object v5, v9, Lcom/trendmicro/hippo/IRFactory;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v4

    .line 729
    invoke-virtual {v9, v1, v4, v7}, Lcom/trendmicro/hippo/IRFactory;->defineSymbol(ILjava/lang/String;Z)V

    .line 730
    const/16 v5, 0x5a

    const/16 v6, 0x5b

    .line 733
    invoke-virtual {v9, v4}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 731
    invoke-direct {v9, v6, v0, v1}, Lcom/trendmicro/hippo/IRFactory;->createAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 730
    invoke-direct {v9, v5, v1, v15}, Lcom/trendmicro/hippo/IRFactory;->createBinary(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    move-object v15, v1

    .line 736
    :goto_1
    invoke-virtual {v9, v4}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 739
    .local v1, "init":Lcom/trendmicro/hippo/Node;
    const/16 v5, 0x9a

    invoke-virtual {v9, v5, v4, v7}, Lcom/trendmicro/hippo/IRFactory;->defineSymbol(ILjava/lang/String;Z)V

    .line 740
    aput-object v1, v13, v2

    .line 742
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->isForOf()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 743
    iget-object v5, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v6, "of "

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    goto :goto_2

    .line 745
    :cond_1
    iget-object v5, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v6, 0x34

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 747
    :goto_2
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->getIteratedObject()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    invoke-virtual {v9, v5}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    aput-object v5, v14, v2

    .line 748
    iget-object v5, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v5, v8}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 714
    .end local v0    # "iter":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v1    # "init":Lcom/trendmicro/hippo/Node;
    .end local v3    # "acl":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    .end local v4    # "name":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    const/16 v1, 0x58

    goto/16 :goto_0

    .line 752
    .end local v2    # "i":I
    :cond_2
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x49

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->getLineno()I

    move-result v3

    invoke-direct {v1, v2, v15, v3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    move-object v7, v1

    .line 754
    .local v7, "yield":Lcom/trendmicro/hippo/Node;
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x86

    invoke-direct {v1, v2, v7, v10}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    .line 756
    .local v1, "body":Lcom/trendmicro/hippo/Node;
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->getFilter()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    const/4 v6, 0x0

    if-eqz v2, :cond_3

    .line 757
    iget-object v2, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 758
    iget-object v0, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x71

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 759
    iget-object v0, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x58

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 760
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->getFilter()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    invoke-direct {v9, v0, v1, v6, v10}, Lcom/trendmicro/hippo/IRFactory;->createIf(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 761
    iget-object v0, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v0, v8}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 765
    :cond_3
    const/4 v0, 0x0

    .line 767
    .local v0, "pushed":I
    add-int/lit8 v2, v12, -0x1

    move-object/from16 v16, v1

    move v1, v0

    move v0, v2

    .local v0, "i":I
    .local v1, "pushed":I
    .local v16, "body":Lcom/trendmicro/hippo/Node;
    :goto_3
    if-ltz v0, :cond_5

    .line 768
    :try_start_0
    invoke-interface {v11, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;

    move-object/from16 v17, v2

    .line 769
    .local v17, "acl":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    nop

    .line 770
    invoke-virtual/range {v17 .. v17}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->getLineno()I

    move-result v2

    .line 769
    invoke-direct {v9, v6, v2}, Lcom/trendmicro/hippo/IRFactory;->createLoopNode(Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v2

    move-object v5, v2

    .line 771
    .local v5, "loop":Lcom/trendmicro/hippo/ast/Scope;
    invoke-virtual {v9, v5}, Lcom/trendmicro/hippo/IRFactory;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 772
    add-int/lit8 v18, v1, 0x1

    .line 773
    .end local v1    # "pushed":I
    .local v18, "pushed":I
    const/16 v2, 0x9a

    :try_start_1
    aget-object v4, v13, v0

    aget-object v19, v14, v0

    .line 778
    invoke-virtual/range {v17 .. v17}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->isForEach()Z

    move-result v20

    .line 779
    invoke-virtual/range {v17 .. v17}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->isForOf()Z

    move-result v21
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 773
    move-object/from16 v1, p0

    move-object v3, v5

    move-object/from16 v22, v5

    .end local v5    # "loop":Lcom/trendmicro/hippo/ast/Scope;
    .local v22, "loop":Lcom/trendmicro/hippo/ast/Scope;
    move-object/from16 v5, v19

    move-object/from16 v19, v6

    move-object/from16 v6, v16

    move-object/from16 v23, v7

    .end local v7    # "yield":Lcom/trendmicro/hippo/Node;
    .local v23, "yield":Lcom/trendmicro/hippo/Node;
    move/from16 v7, v20

    move/from16 v20, v10

    move v10, v8

    .end local v10    # "lineno":I
    .local v20, "lineno":I
    move/from16 v8, v21

    :try_start_2
    invoke-direct/range {v1 .. v8}, Lcom/trendmicro/hippo/IRFactory;->createForIn(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;ZZ)Lcom/trendmicro/hippo/Node;

    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object/from16 v16, v1

    .line 767
    .end local v17    # "acl":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    .end local v22    # "loop":Lcom/trendmicro/hippo/ast/Scope;
    add-int/lit8 v0, v0, -0x1

    move v8, v10

    move/from16 v1, v18

    move-object/from16 v6, v19

    move/from16 v10, v20

    move-object/from16 v7, v23

    goto :goto_3

    .line 782
    .end local v0    # "i":I
    :catchall_0
    move-exception v0

    move/from16 v1, v18

    goto :goto_4

    .end local v20    # "lineno":I
    .end local v23    # "yield":Lcom/trendmicro/hippo/Node;
    .restart local v7    # "yield":Lcom/trendmicro/hippo/Node;
    .restart local v10    # "lineno":I
    :catchall_1
    move-exception v0

    move-object/from16 v23, v7

    move/from16 v20, v10

    move/from16 v1, v18

    .end local v7    # "yield":Lcom/trendmicro/hippo/Node;
    .end local v10    # "lineno":I
    .restart local v20    # "lineno":I
    .restart local v23    # "yield":Lcom/trendmicro/hippo/Node;
    goto :goto_4

    .end local v18    # "pushed":I
    .end local v20    # "lineno":I
    .end local v23    # "yield":Lcom/trendmicro/hippo/Node;
    .restart local v1    # "pushed":I
    .restart local v7    # "yield":Lcom/trendmicro/hippo/Node;
    .restart local v10    # "lineno":I
    :catchall_2
    move-exception v0

    move-object/from16 v23, v7

    move/from16 v20, v10

    .end local v7    # "yield":Lcom/trendmicro/hippo/Node;
    .end local v10    # "lineno":I
    .restart local v20    # "lineno":I
    .restart local v23    # "yield":Lcom/trendmicro/hippo/Node;
    :goto_4
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_5
    if-ge v2, v1, :cond_4

    .line 783
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 782
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 785
    .end local v2    # "i":I
    :cond_4
    throw v0

    .line 767
    .end local v20    # "lineno":I
    .end local v23    # "yield":Lcom/trendmicro/hippo/Node;
    .restart local v0    # "i":I
    .restart local v7    # "yield":Lcom/trendmicro/hippo/Node;
    .restart local v10    # "lineno":I
    :cond_5
    move-object/from16 v23, v7

    move/from16 v20, v10

    move v10, v8

    .line 782
    .end local v0    # "i":I
    .end local v7    # "yield":Lcom/trendmicro/hippo/Node;
    .end local v10    # "lineno":I
    .restart local v20    # "lineno":I
    .restart local v23    # "yield":Lcom/trendmicro/hippo/Node;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_6
    if-ge v0, v1, :cond_6

    .line 783
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 782
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 785
    .end local v0    # "i":I
    :cond_6
    nop

    .line 787
    iget-object v0, v9, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v0, v10}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 789
    return-object v16
.end method

.method private getPropKey(Lcom/trendmicro/hippo/Node;)Ljava/lang/Object;
    .locals 3
    .param p1, "id"    # Lcom/trendmicro/hippo/Node;

    .line 968
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/Name;

    if-eqz v0, :cond_0

    .line 969
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 970
    .local v0, "s":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 971
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getIndexObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 972
    .local v0, "key":Ljava/lang/Object;
    goto :goto_0

    .end local v0    # "key":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/StringLiteral;

    if-eqz v0, :cond_1

    .line 973
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/StringLiteral;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/StringLiteral;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 974
    .local v0, "s":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/Decompiler;->addString(Ljava/lang/String;)V

    .line 975
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getIndexObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 976
    .local v0, "key":Ljava/lang/Object;
    goto :goto_0

    .end local v0    # "key":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/NumberLiteral;

    if-eqz v0, :cond_2

    .line 977
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/NumberLiteral;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/NumberLiteral;->getNumber()D

    move-result-wide v0

    .line 978
    .local v0, "n":D
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addNumber(D)V

    .line 979
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->getIndexObject(D)Ljava/lang/Object;

    move-result-object v0

    .line 980
    .local v0, "key":Ljava/lang/Object;
    nop

    .line 983
    :goto_0
    return-object v0

    .line 981
    .end local v0    # "key":Ljava/lang/Object;
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private initFunction(Lcom/trendmicro/hippo/ast/FunctionNode;ILcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;
    .locals 10
    .param p1, "fnNode"    # Lcom/trendmicro/hippo/ast/FunctionNode;
    .param p2, "functionIndex"    # I
    .param p3, "statements"    # Lcom/trendmicro/hippo/Node;
    .param p4, "functionType"    # I

    .line 1462
    invoke-virtual {p1, p4}, Lcom/trendmicro/hippo/ast/FunctionNode;->setFunctionType(I)V

    .line 1463
    invoke-virtual {p1, p3}, Lcom/trendmicro/hippo/ast/FunctionNode;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1465
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionCount()I

    move-result v0

    .line 1466
    .local v0, "functionCount":I
    if-eqz v0, :cond_0

    .line 1468
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->setRequiresActivation()V

    .line 1471
    :cond_0
    const/4 v1, 0x2

    const/16 v2, 0x6e

    if-ne p4, v1, :cond_1

    .line 1472
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionName()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v1

    .line 1473
    .local v1, "name":Lcom/trendmicro/hippo/ast/Name;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->length()I

    move-result v3

    if-eqz v3, :cond_1

    .line 1474
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->getSymbol(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Symbol;

    move-result-object v3

    if-nez v3, :cond_1

    .line 1482
    new-instance v3, Lcom/trendmicro/hippo/ast/Symbol;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lcom/trendmicro/hippo/ast/Symbol;-><init>(ILjava/lang/String;)V

    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/ast/FunctionNode;->putSymbol(Lcom/trendmicro/hippo/ast/Symbol;)V

    .line 1483
    new-instance v3, Lcom/trendmicro/hippo/Node;

    const/16 v4, 0x86

    new-instance v5, Lcom/trendmicro/hippo/Node;

    const/16 v6, 0x8

    const/16 v7, 0x31

    .line 1486
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    .line 1485
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/Node;->newString(ILjava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v7

    new-instance v8, Lcom/trendmicro/hippo/Node;

    const/16 v9, 0x40

    invoke-direct {v8, v9}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    invoke-direct {v5, v6, v7, v8}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    invoke-direct {v3, v4, v5}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 1488
    .local v3, "setFn":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p3, v3}, Lcom/trendmicro/hippo/Node;->addChildrenToFront(Lcom/trendmicro/hippo/Node;)V

    .line 1493
    .end local v1    # "name":Lcom/trendmicro/hippo/ast/Name;
    .end local v3    # "setFn":Lcom/trendmicro/hippo/Node;
    :cond_1
    invoke-virtual {p3}, Lcom/trendmicro/hippo/Node;->getLastChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1494
    .local v1, "lastStmt":Lcom/trendmicro/hippo/Node;
    const/4 v3, 0x4

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v4

    if-eq v4, v3, :cond_3

    .line 1495
    :cond_2
    new-instance v4, Lcom/trendmicro/hippo/Node;

    invoke-direct {v4, v3}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    invoke-virtual {p3, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1498
    :cond_3
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/Node;->newString(ILjava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 1499
    .local v2, "result":Lcom/trendmicro/hippo/Node;
    const/4 v3, 0x1

    invoke-virtual {v2, v3, p2}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 1500
    return-object v2
.end method

.method private static isAlwaysDefinedBoolean(Lcom/trendmicro/hippo/Node;)I
    .locals 6
    .param p0, "node"    # Lcom/trendmicro/hippo/Node;

    .line 2320
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x28

    const/4 v2, 0x1

    const/4 v3, -0x1

    if-eq v0, v1, :cond_2

    const/16 v1, 0x2a

    if-eq v0, v1, :cond_1

    const/16 v1, 0x2c

    if-eq v0, v1, :cond_1

    const/16 v1, 0x2d

    if-eq v0, v1, :cond_0

    .line 2334
    const/4 v0, 0x0

    return v0

    .line 2325
    :cond_0
    return v2

    .line 2323
    :cond_1
    return v3

    .line 2327
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Node;->getDouble()D

    move-result-wide v0

    .line 2328
    .local v0, "num":D
    cmpl-double v4, v0, v0

    if-nez v4, :cond_3

    const-wide/16 v4, 0x0

    cmpl-double v4, v0, v4

    if-eqz v4, :cond_3

    .line 2329
    return v2

    .line 2331
    :cond_3
    return v3
.end method

.method private makeJump(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/ast/Jump;
    .locals 1
    .param p1, "type"    # I
    .param p2, "target"    # Lcom/trendmicro/hippo/Node;

    .line 2297
    new-instance v0, Lcom/trendmicro/hippo/ast/Jump;

    invoke-direct {v0, p1}, Lcom/trendmicro/hippo/ast/Jump;-><init>(I)V

    .line 2298
    .local v0, "n":Lcom/trendmicro/hippo/ast/Jump;
    iput-object p2, v0, Lcom/trendmicro/hippo/ast/Jump;->target:Lcom/trendmicro/hippo/Node;

    .line 2299
    return-object v0
.end method

.method private makeReference(Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/Node;

    .line 2303
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    .line 2304
    .local v0, "type":I
    const/16 v1, 0x21

    if-eq v0, v1, :cond_1

    const/16 v1, 0x24

    if-eq v0, v1, :cond_1

    const/16 v1, 0x44

    if-eq v0, v1, :cond_1

    const/16 v2, 0x26

    if-eq v0, v2, :cond_0

    const/16 v1, 0x27

    if-eq v0, v1, :cond_1

    .line 2315
    const/4 v1, 0x0

    return-object v1

    .line 2311
    :cond_0
    const/16 v2, 0x47

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/Node;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 2312
    new-instance v2, Lcom/trendmicro/hippo/Node;

    invoke-direct {v2, v1, p1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;)V

    return-object v2

    .line 2309
    :cond_1
    return-object p1
.end method

.method private transformArrayComp(Lcom/trendmicro/hippo/ast/ArrayComprehension;)Lcom/trendmicro/hippo/Node;
    .locals 9
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ArrayComprehension;

    .line 265
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->getLineno()I

    move-result v0

    .line 266
    .local v0, "lineno":I
    const/16 v1, 0x9e

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/IRFactory;->createScopeNode(II)Lcom/trendmicro/hippo/ast/Scope;

    move-result-object v1

    .line 267
    .local v1, "scopeNode":Lcom/trendmicro/hippo/ast/Scope;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v2

    .line 268
    .local v2, "arrayName":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 270
    const/16 v3, 0x9a

    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p0, v3, v2, v4}, Lcom/trendmicro/hippo/IRFactory;->defineSymbol(ILjava/lang/String;Z)V

    .line 271
    new-instance v3, Lcom/trendmicro/hippo/Node;

    const/16 v4, 0x82

    invoke-direct {v3, v4, v0}, Lcom/trendmicro/hippo/Node;-><init>(II)V

    .line 272
    .local v3, "block":Lcom/trendmicro/hippo/Node;
    const/16 v4, 0x1e

    const-string v5, "Array"

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/trendmicro/hippo/IRFactory;->createCallOrNew(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 273
    .local v4, "newArray":Lcom/trendmicro/hippo/Node;
    new-instance v5, Lcom/trendmicro/hippo/Node;

    const/16 v6, 0x86

    const/16 v7, 0x5b

    .line 275
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v8

    .line 274
    invoke-direct {p0, v7, v8, v4}, Lcom/trendmicro/hippo/IRFactory;->createAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v7

    invoke-direct {v5, v6, v7, v0}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    .line 278
    .local v5, "init":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 279
    invoke-direct {p0, p1, v2}, Lcom/trendmicro/hippo/IRFactory;->arrayCompTransformHelper(Lcom/trendmicro/hippo/ast/ArrayComprehension;Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 280
    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/Scope;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 281
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/trendmicro/hippo/ast/Scope;->addChildToBack(Lcom/trendmicro/hippo/Node;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    nop

    .line 284
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 282
    return-object v1

    .line 284
    .end local v3    # "block":Lcom/trendmicro/hippo/Node;
    .end local v4    # "newArray":Lcom/trendmicro/hippo/Node;
    .end local v5    # "init":Lcom/trendmicro/hippo/Node;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 285
    throw v3
.end method

.method private transformArrayLiteral(Lcom/trendmicro/hippo/ast/ArrayLiteral;)Lcom/trendmicro/hippo/Node;
    .locals 7
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ArrayLiteral;

    .line 389
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->isDestructuring()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 390
    return-object p1

    .line 392
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x54

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 393
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->getElements()Ljava/util/List;

    move-result-object v0

    .line 394
    .local v0, "elems":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x42

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 395
    .local v1, "array":Lcom/trendmicro/hippo/Node;
    const/4 v2, 0x0

    .line 396
    .local v2, "skipIndexes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 397
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/ast/AstNode;

    .line 398
    .local v4, "elem":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v5

    const/16 v6, 0x81

    if-eq v5, v6, :cond_1

    .line 399
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    goto :goto_1

    .line 401
    :cond_1
    if-nez v2, :cond_2

    .line 402
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object v2, v5

    .line 404
    :cond_2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 406
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v3, v5, :cond_3

    .line 407
    iget-object v5, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v6, 0x5a

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 396
    .end local v4    # "elem":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 409
    .end local v3    # "i":I
    :cond_4
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v4, 0x55

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 410
    const/16 v3, 0x15

    .line 411
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->getDestructuringLength()I

    move-result v4

    .line 410
    invoke-virtual {v1, v3, v4}, Lcom/trendmicro/hippo/Node;->putIntProp(II)V

    .line 412
    if-eqz v2, :cond_6

    .line 413
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [I

    .line 414
    .local v3, "skips":[I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_5

    .line 415
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aput v5, v3, v4

    .line 414
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 416
    .end local v4    # "i":I
    :cond_5
    const/16 v4, 0xb

    invoke-virtual {v1, v4, v3}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 418
    .end local v3    # "skips":[I
    :cond_6
    return-object v1
.end method

.method private transformAssignment(Lcom/trendmicro/hippo/ast/Assignment;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/Assignment;

    .line 422
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Assignment;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->removeParens(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 423
    .local v0, "left":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v1, 0x0

    .line 424
    .local v1, "target":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->isDestructuring(Lcom/trendmicro/hippo/Node;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 425
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 426
    move-object v1, v0

    goto :goto_0

    .line 428
    :cond_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 430
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Assignment;->getType()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 431
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Assignment;->getType()I

    move-result v2

    .line 433
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Assignment;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 431
    invoke-direct {p0, v2, v1, v3}, Lcom/trendmicro/hippo/IRFactory;->createAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    return-object v2
.end method

.method private transformBlock(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 437
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/Scope;

    if-eqz v0, :cond_0

    .line 438
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/Scope;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 441
    :cond_0
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 442
    .local v0, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/Node;>;"
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Node;

    .line 443
    .local v2, "kid":Lcom/trendmicro/hippo/Node;
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 444
    nop

    .end local v2    # "kid":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 445
    :cond_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->removeChildren()V

    .line 446
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Node;

    .line 447
    .restart local v2    # "kid":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->addChildToBack(Lcom/trendmicro/hippo/Node;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 448
    .end local v2    # "kid":Lcom/trendmicro/hippo/Node;
    goto :goto_1

    .line 449
    :cond_2
    nop

    .line 451
    instance-of v1, p1, Lcom/trendmicro/hippo/ast/Scope;

    if-eqz v1, :cond_3

    .line 452
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 449
    :cond_3
    return-object p1

    .line 451
    .end local v0    # "kids":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/Node;>;"
    :catchall_0
    move-exception v0

    instance-of v1, p1, Lcom/trendmicro/hippo/ast/Scope;

    if-eqz v1, :cond_4

    .line 452
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 454
    :cond_4
    throw v0
.end method

.method private transformBreak(Lcom/trendmicro/hippo/ast/BreakStatement;)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/BreakStatement;

    .line 458
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x79

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 459
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/BreakStatement;->getBreakLabel()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 460
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/BreakStatement;->getBreakLabel()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 462
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x53

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 463
    return-object p1
.end method

.method private transformCondExpr(Lcom/trendmicro/hippo/ast/ConditionalExpression;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ConditionalExpression;

    .line 467
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->getTestExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 468
    .local v0, "test":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x67

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 469
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->getTrueExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 470
    .local v1, "ifTrue":Lcom/trendmicro/hippo/Node;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x68

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 471
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->getFalseExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 472
    .local v2, "ifFalse":Lcom/trendmicro/hippo/Node;
    invoke-direct {p0, v0, v1, v2}, Lcom/trendmicro/hippo/IRFactory;->createCondExpr(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    return-object v3
.end method

.method private transformContinue(Lcom/trendmicro/hippo/ast/ContinueStatement;)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ContinueStatement;

    .line 476
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x7a

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 477
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ContinueStatement;->getLabel()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 478
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ContinueStatement;->getLabel()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 480
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x53

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 481
    return-object p1
.end method

.method private transformDefaultXmlNamepace(Lcom/trendmicro/hippo/ast/UnaryExpression;)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/UnaryExpression;

    .line 1384
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x75

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1385
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v1, " xml"

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 1386
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v1, " namespace"

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 1387
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1388
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->getOperand()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 1389
    .local v0, "child":Lcom/trendmicro/hippo/Node;
    const/16 v1, 0x4b

    invoke-direct {p0, v1, v0}, Lcom/trendmicro/hippo/IRFactory;->createUnary(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    return-object v1
.end method

.method private transformDoLoop(Lcom/trendmicro/hippo/ast/DoLoop;)Lcom/trendmicro/hippo/Node;
    .locals 8
    .param p1, "loop"    # Lcom/trendmicro/hippo/ast/DoLoop;

    .line 485
    const/16 v0, 0x85

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/DoLoop;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 486
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 488
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x77

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 489
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x56

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 490
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/DoLoop;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 491
    .local v4, "body":Lcom/trendmicro/hippo/Node;
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x57

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 492
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x76

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 493
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 494
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/DoLoop;->getCondition()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 495
    .local v5, "cond":Lcom/trendmicro/hippo/Node;
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x59

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 496
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x53

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 497
    const/4 v3, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/IRFactory;->createLoop(Lcom/trendmicro/hippo/ast/Jump;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 500
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 497
    return-object v0

    .line 500
    .end local v4    # "body":Lcom/trendmicro/hippo/Node;
    .end local v5    # "cond":Lcom/trendmicro/hippo/Node;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 501
    throw v0
.end method

.method private transformElementGet(Lcom/trendmicro/hippo/ast/ElementGet;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ElementGet;

    .line 507
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ElementGet;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 508
    .local v0, "target":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x54

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 509
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ElementGet;->getElement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 510
    .local v1, "element":Lcom/trendmicro/hippo/Node;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x55

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 511
    new-instance v2, Lcom/trendmicro/hippo/Node;

    const/16 v3, 0x24

    invoke-direct {v2, v3, v0, v1}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    return-object v2
.end method

.method private transformExprStmt(Lcom/trendmicro/hippo/ast/ExpressionStatement;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ExpressionStatement;

    .line 515
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 516
    .local v0, "expr":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x53

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 517
    new-instance v1, Lcom/trendmicro/hippo/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->getType()I

    move-result v2

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->getLineno()I

    move-result v3

    invoke-direct {v1, v2, v0, v3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    return-object v1
.end method

.method private transformForInLoop(Lcom/trendmicro/hippo/ast/ForInLoop;)Lcom/trendmicro/hippo/Node;
    .locals 10
    .param p1, "loop"    # Lcom/trendmicro/hippo/ast/ForInLoop;

    .line 521
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x78

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 522
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->isForEach()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 523
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v1, "each "

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 524
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 526
    const/16 v0, 0x85

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/ForInLoop;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 527
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 529
    const/4 v0, -0x1

    .line 530
    .local v0, "declType":I
    :try_start_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->getIterator()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    .line 531
    .local v1, "iter":Lcom/trendmicro/hippo/ast/AstNode;
    instance-of v2, v1, Lcom/trendmicro/hippo/ast/VariableDeclaration;

    if-eqz v2, :cond_1

    .line 532
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/ast/VariableDeclaration;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->getType()I

    move-result v2

    move v0, v2

    .line 534
    :cond_1
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 535
    .local v5, "lhs":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->isForOf()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 536
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v3, "of "

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    goto :goto_0

    .line 538
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x34

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 540
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->getIteratedObject()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 541
    .local v6, "obj":Lcom/trendmicro/hippo/Node;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x59

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 542
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x56

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 543
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v7

    .line 544
    .local v7, "body":Lcom/trendmicro/hippo/Node;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x57

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 545
    nop

    .line 546
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->isForEach()Z

    move-result v8

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->isForOf()Z

    move-result v9

    .line 545
    move-object v2, p0

    move v3, v0

    move-object v4, p1

    invoke-direct/range {v2 .. v9}, Lcom/trendmicro/hippo/IRFactory;->createForIn(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;ZZ)Lcom/trendmicro/hippo/Node;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 548
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 545
    return-object v2

    .line 548
    .end local v0    # "declType":I
    .end local v1    # "iter":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v5    # "lhs":Lcom/trendmicro/hippo/Node;
    .end local v6    # "obj":Lcom/trendmicro/hippo/Node;
    .end local v7    # "body":Lcom/trendmicro/hippo/Node;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 549
    throw v0
.end method

.method private transformForLoop(Lcom/trendmicro/hippo/ast/ForLoop;)Lcom/trendmicro/hippo/Node;
    .locals 8
    .param p1, "loop"    # Lcom/trendmicro/hippo/ast/ForLoop;

    .line 553
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x78

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 554
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 555
    const/16 v0, 0x85

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/ForLoop;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 558
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 559
    .local v0, "savedScope":Lcom/trendmicro/hippo/ast/Scope;
    iput-object p1, p0, Lcom/trendmicro/hippo/IRFactory;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 561
    :try_start_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForLoop;->getInitializer()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 562
    .local v4, "init":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x53

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 563
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForLoop;->getCondition()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 564
    .local v5, "test":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 565
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForLoop;->getIncrement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v6

    .line 566
    .local v6, "incr":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 567
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x56

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 568
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ForLoop;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v7

    .line 569
    .local v7, "body":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x57

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 570
    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/trendmicro/hippo/IRFactory;->createFor(Lcom/trendmicro/hippo/ast/Scope;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 572
    iput-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 570
    return-object v1

    .line 572
    .end local v4    # "init":Lcom/trendmicro/hippo/Node;
    .end local v5    # "test":Lcom/trendmicro/hippo/Node;
    .end local v6    # "incr":Lcom/trendmicro/hippo/Node;
    .end local v7    # "body":Lcom/trendmicro/hippo/Node;
    :catchall_0
    move-exception v1

    iput-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 573
    throw v1
.end method

.method private transformFunction(Lcom/trendmicro/hippo/ast/FunctionNode;)Lcom/trendmicro/hippo/Node;
    .locals 13
    .param p1, "fn"    # Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 577
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v0

    .line 578
    .local v0, "functionType":I
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/Decompiler;->markFunctionStart(I)I

    move-result v1

    .line 579
    .local v1, "start":I
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->decompileFunctionHeader(Lcom/trendmicro/hippo/ast/FunctionNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 580
    .local v2, "mexpr":Lcom/trendmicro/hippo/Node;
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->addFunction(Lcom/trendmicro/hippo/ast/FunctionNode;)I

    move-result v3

    .line 582
    .local v3, "index":I
    new-instance v4, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;

    invoke-direct {v4, p0, p1}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;-><init>(Lcom/trendmicro/hippo/Parser;Lcom/trendmicro/hippo/ast/FunctionNode;)V

    .line 586
    .local v4, "savedVars":Lcom/trendmicro/hippo/Parser$PerFunctionVariables;
    const/16 v5, 0x17

    const/4 v6, 0x1

    :try_start_0
    invoke-virtual {p1, v5}, Lcom/trendmicro/hippo/ast/FunctionNode;->getProp(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/hippo/Node;

    .line 587
    .local v7, "destructuring":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1, v5}, Lcom/trendmicro/hippo/ast/FunctionNode;->removeProp(I)V

    .line 589
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/AstNode;->getLineno()I

    move-result v5

    .line 590
    .local v5, "lineno":I
    iget v8, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    add-int/2addr v8, v6

    iput v8, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    .line 591
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v8

    .line 593
    .local v8, "body":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->isExpressionClosure()Z

    move-result v9

    if-nez v9, :cond_0

    .line 594
    iget-object v9, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v10, 0x57

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 596
    :cond_0
    iget-object v9, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v9, v1}, Lcom/trendmicro/hippo/Decompiler;->markFunctionEnd(I)I

    move-result v9

    invoke-virtual {p1, v1, v9}, Lcom/trendmicro/hippo/ast/FunctionNode;->setEncodedSourceBounds(II)V

    .line 598
    const/4 v9, 0x2

    if-eq v0, v9, :cond_1

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->isExpressionClosure()Z

    move-result v10

    if-nez v10, :cond_1

    .line 601
    iget-object v10, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v10, v6}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 604
    :cond_1
    if-eqz v7, :cond_2

    .line 605
    new-instance v10, Lcom/trendmicro/hippo/Node;

    const/16 v11, 0x86

    invoke-direct {v10, v11, v7, v5}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    invoke-virtual {v8, v10}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 609
    :cond_2
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v10

    .line 610
    .local v10, "syntheticType":I
    invoke-direct {p0, p1, v3, v8, v10}, Lcom/trendmicro/hippo/IRFactory;->initFunction(Lcom/trendmicro/hippo/ast/FunctionNode;ILcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v11

    .line 611
    .local v11, "pn":Lcom/trendmicro/hippo/Node;
    if-eqz v2, :cond_3

    .line 612
    const/16 v12, 0x5b

    invoke-direct {p0, v12, v2, v11}, Lcom/trendmicro/hippo/IRFactory;->createAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v12

    move-object v11, v12

    .line 613
    if-eq v10, v9, :cond_3

    .line 614
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getLineno()I

    move-result v9

    invoke-direct {p0, v11, v9}, Lcom/trendmicro/hippo/IRFactory;->createExprStatementNoReturn(Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v11, v9

    .line 617
    :cond_3
    nop

    .line 620
    iget v9, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    sub-int/2addr v9, v6

    iput v9, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    .line 621
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->restore()V

    .line 617
    return-object v11

    .line 620
    .end local v5    # "lineno":I
    .end local v7    # "destructuring":Lcom/trendmicro/hippo/Node;
    .end local v8    # "body":Lcom/trendmicro/hippo/Node;
    .end local v10    # "syntheticType":I
    .end local v11    # "pn":Lcom/trendmicro/hippo/Node;
    :catchall_0
    move-exception v5

    iget v7, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    sub-int/2addr v7, v6

    iput v7, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    .line 621
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->restore()V

    .line 622
    throw v5
.end method

.method private transformFunctionCall(Lcom/trendmicro/hippo/ast/FunctionCall;)Lcom/trendmicro/hippo/Node;
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/FunctionCall;

    .line 626
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionCall;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    const/16 v1, 0x26

    invoke-direct {p0, v1, v0}, Lcom/trendmicro/hippo/IRFactory;->createCallOrNew(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 627
    .local v0, "call":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionCall;->getLineno()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->setLineno(I)V

    .line 628
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x58

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 629
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionCall;->getArguments()Ljava/util/List;

    move-result-object v1

    .line 630
    .local v1, "args":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 631
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/AstNode;

    .line 632
    .local v3, "arg":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 633
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v2, v4, :cond_0

    .line 634
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v5, 0x5a

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 630
    .end local v3    # "arg":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 637
    .end local v2    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x59

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 638
    return-object v0
.end method

.method private transformGenExpr(Lcom/trendmicro/hippo/ast/GeneratorExpression;)Lcom/trendmicro/hippo/Node;
    .locals 14
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/GeneratorExpression;

    .line 644
    new-instance v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;-><init>()V

    .line 645
    .local v0, "fn":Lcom/trendmicro/hippo/ast/FunctionNode;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->getNextTempName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->setSourceName(Ljava/lang/String;)V

    .line 646
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setIsGenerator()V

    .line 647
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ast/FunctionNode;->setFunctionType(I)V

    .line 648
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->setRequiresActivation()V

    .line 650
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v2

    .line 651
    .local v2, "functionType":I
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/Decompiler;->markFunctionStart(I)I

    move-result v3

    .line 652
    .local v3, "start":I
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompileFunctionHeader(Lcom/trendmicro/hippo/ast/FunctionNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 653
    .local v4, "mexpr":Lcom/trendmicro/hippo/Node;
    iget-object v5, p0, Lcom/trendmicro/hippo/IRFactory;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v5, v0}, Lcom/trendmicro/hippo/ast/ScriptNode;->addFunction(Lcom/trendmicro/hippo/ast/FunctionNode;)I

    move-result v5

    .line 655
    .local v5, "index":I
    new-instance v6, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;

    invoke-direct {v6, p0, v0}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;-><init>(Lcom/trendmicro/hippo/Parser;Lcom/trendmicro/hippo/ast/FunctionNode;)V

    .line 659
    .local v6, "savedVars":Lcom/trendmicro/hippo/Parser$PerFunctionVariables;
    const/16 v7, 0x17

    const/4 v8, 0x1

    :try_start_0
    invoke-virtual {v0, v7}, Lcom/trendmicro/hippo/ast/FunctionNode;->getProp(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/trendmicro/hippo/Node;

    .line 660
    .local v9, "destructuring":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0, v7}, Lcom/trendmicro/hippo/ast/FunctionNode;->removeProp(I)V

    .line 662
    iget v7, p1, Lcom/trendmicro/hippo/ast/GeneratorExpression;->lineno:I

    .line 663
    .local v7, "lineno":I
    iget v10, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    add-int/2addr v10, v8

    iput v10, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    .line 664
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->genExprTransformHelper(Lcom/trendmicro/hippo/ast/GeneratorExpression;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .line 666
    .local v10, "body":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->isExpressionClosure()Z

    move-result v11

    if-nez v11, :cond_0

    .line 667
    iget-object v11, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v12, 0x57

    invoke-virtual {v11, v12}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 669
    :cond_0
    iget-object v11, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v11, v3}, Lcom/trendmicro/hippo/Decompiler;->markFunctionEnd(I)I

    move-result v11

    invoke-virtual {v0, v3, v11}, Lcom/trendmicro/hippo/ast/FunctionNode;->setEncodedSourceBounds(II)V

    .line 671
    if-eq v2, v1, :cond_1

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->isExpressionClosure()Z

    move-result v11

    if-nez v11, :cond_1

    .line 674
    iget-object v11, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v11, v8}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 677
    :cond_1
    if-eqz v9, :cond_2

    .line 678
    new-instance v11, Lcom/trendmicro/hippo/Node;

    const/16 v12, 0x86

    invoke-direct {v11, v12, v9, v7}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    invoke-virtual {v10, v11}, Lcom/trendmicro/hippo/Node;->addChildToFront(Lcom/trendmicro/hippo/Node;)V

    .line 682
    :cond_2
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v11

    .line 683
    .local v11, "syntheticType":I
    invoke-direct {p0, v0, v5, v10, v11}, Lcom/trendmicro/hippo/IRFactory;->initFunction(Lcom/trendmicro/hippo/ast/FunctionNode;ILcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v12

    .line 684
    .local v12, "pn":Lcom/trendmicro/hippo/Node;
    if-eqz v4, :cond_3

    .line 685
    const/16 v13, 0x5b

    invoke-direct {p0, v13, v4, v12}, Lcom/trendmicro/hippo/IRFactory;->createAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v13

    move-object v12, v13

    .line 686
    if-eq v11, v1, :cond_3

    .line 687
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/FunctionNode;->getLineno()I

    move-result v1

    invoke-direct {p0, v12, v1}, Lcom/trendmicro/hippo/IRFactory;->createExprStatementNoReturn(Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v12, v1

    .line 691
    .end local v7    # "lineno":I
    .end local v9    # "destructuring":Lcom/trendmicro/hippo/Node;
    .end local v10    # "body":Lcom/trendmicro/hippo/Node;
    .end local v11    # "syntheticType":I
    :cond_3
    iget v1, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    sub-int/2addr v1, v8

    iput v1, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    .line 692
    invoke-virtual {v6}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->restore()V

    .line 693
    nop

    .line 695
    const/16 v1, 0x26

    invoke-direct {p0, v1, v12}, Lcom/trendmicro/hippo/IRFactory;->createCallOrNew(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 696
    .local v1, "call":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->getLineno()I

    move-result v7

    invoke-virtual {v1, v7}, Lcom/trendmicro/hippo/Node;->setLineno(I)V

    .line 697
    iget-object v7, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v8, 0x58

    invoke-virtual {v7, v8}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 698
    iget-object v7, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v8, 0x59

    invoke-virtual {v7, v8}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 699
    return-object v1

    .line 691
    .end local v1    # "call":Lcom/trendmicro/hippo/Node;
    .end local v12    # "pn":Lcom/trendmicro/hippo/Node;
    :catchall_0
    move-exception v1

    iget v7, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    sub-int/2addr v7, v8

    iput v7, p0, Lcom/trendmicro/hippo/IRFactory;->nestingOfFunction:I

    .line 692
    invoke-virtual {v6}, Lcom/trendmicro/hippo/Parser$PerFunctionVariables;->restore()V

    .line 693
    throw v1
.end method

.method private transformIf(Lcom/trendmicro/hippo/ast/IfStatement;)Lcom/trendmicro/hippo/Node;
    .locals 7
    .param p1, "n"    # Lcom/trendmicro/hippo/ast/IfStatement;

    .line 793
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x71

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 794
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 795
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/IfStatement;->getCondition()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 796
    .local v0, "cond":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 797
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x56

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 798
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/IfStatement;->getThenPart()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 799
    .local v1, "ifTrue":Lcom/trendmicro/hippo/Node;
    const/4 v3, 0x0

    .line 800
    .local v3, "ifFalse":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/IfStatement;->getElsePart()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    const/16 v5, 0x57

    if-eqz v4, :cond_0

    .line 801
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 802
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v6, 0x72

    invoke-virtual {v4, v6}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 803
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 804
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/IfStatement;->getElsePart()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 806
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v5}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 807
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/IfStatement;->getLineno()I

    move-result v2

    invoke-direct {p0, v0, v1, v3, v2}, Lcom/trendmicro/hippo/IRFactory;->createIf(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    return-object v2
.end method

.method private transformInfix(Lcom/trendmicro/hippo/ast/InfixExpression;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/InfixExpression;

    .line 811
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 812
    .local v0, "left":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 813
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 814
    .local v1, "right":Lcom/trendmicro/hippo/Node;
    instance-of v2, p1, Lcom/trendmicro/hippo/ast/XmlDotQuery;

    if-eqz v2, :cond_0

    .line 815
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x59

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 817
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->getType()I

    move-result v2

    invoke-direct {p0, v2, v0, v1}, Lcom/trendmicro/hippo/IRFactory;->createBinary(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    return-object v2
.end method

.method private transformLabeledStatement(Lcom/trendmicro/hippo/ast/LabeledStatement;)Lcom/trendmicro/hippo/Node;
    .locals 7
    .param p1, "ls"    # Lcom/trendmicro/hippo/ast/LabeledStatement;

    .line 821
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getFirstLabel()Lcom/trendmicro/hippo/ast/Label;

    move-result-object v0

    .line 822
    .local v0, "label":Lcom/trendmicro/hippo/ast/Label;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getLabels()Ljava/util/List;

    move-result-object v1

    .line 823
    .local v1, "labels":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/Label;>;"
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Label;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 824
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/16 v3, 0x68

    const/4 v4, 0x1

    if-le v2, v4, :cond_0

    .line 826
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v1, v4, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/ast/Label;

    .line 827
    .local v4, "lb":Lcom/trendmicro/hippo/ast/Label;
    iget-object v5, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 828
    iget-object v5, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/Label;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 829
    .end local v4    # "lb":Lcom/trendmicro/hippo/ast/Label;
    goto :goto_0

    .line 831
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getStatement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v2

    const/16 v4, 0x82

    if-ne v2, v4, :cond_1

    .line 833
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x43

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 834
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x56

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    goto :goto_1

    .line 836
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 838
    :goto_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getStatement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 839
    .local v2, "statement":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->getStatement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v3

    if-ne v3, v4, :cond_2

    .line 840
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v5, 0x57

    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 845
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Node;->newTarget()Lcom/trendmicro/hippo/Node;

    move-result-object v3

    .line 846
    .local v3, "breakTarget":Lcom/trendmicro/hippo/Node;
    new-instance v5, Lcom/trendmicro/hippo/Node;

    invoke-direct {v5, v4, v0, v2, v3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    move-object v4, v5

    .line 847
    .local v4, "block":Lcom/trendmicro/hippo/Node;
    iput-object v3, v0, Lcom/trendmicro/hippo/ast/Label;->target:Lcom/trendmicro/hippo/Node;

    .line 849
    return-object v4
.end method

.method private transformLetNode(Lcom/trendmicro/hippo/ast/LetNode;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/LetNode;

    .line 853
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 855
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x9a

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 856
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 857
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/LetNode;->getVariables()Lcom/trendmicro/hippo/ast/VariableDeclaration;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformVariableInitializers(Lcom/trendmicro/hippo/ast/VariableDeclaration;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 858
    .local v0, "vars":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 859
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/LetNode;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 860
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/LetNode;->getType()I

    move-result v1

    const/16 v2, 0x9f

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 861
    .local v1, "letExpr":Z
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/LetNode;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 862
    if-eqz v1, :cond_1

    .line 863
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v3, " "

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    goto :goto_1

    .line 865
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x56

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 867
    :goto_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/LetNode;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/ast/LetNode;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 868
    if-nez v1, :cond_2

    .line 869
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x57

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 872
    :cond_2
    nop

    .line 874
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 872
    return-object p1

    .line 874
    .end local v0    # "vars":Lcom/trendmicro/hippo/Node;
    .end local v1    # "letExpr":Z
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 875
    throw v0
.end method

.method private transformLiteral(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 879
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 880
    return-object p1
.end method

.method private transformName(Lcom/trendmicro/hippo/ast/Name;)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/Name;

    .line 884
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 885
    return-object p1
.end method

.method private transformNewExpr(Lcom/trendmicro/hippo/ast/NewExpression;)Lcom/trendmicro/hippo/Node;
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/NewExpression;

    .line 889
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x1e

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 890
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/NewExpression;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/trendmicro/hippo/IRFactory;->createCallOrNew(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 891
    .local v0, "nx":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/NewExpression;->getLineno()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Node;->setLineno(I)V

    .line 892
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/NewExpression;->getArguments()Ljava/util/List;

    move-result-object v1

    .line 893
    .local v1, "args":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x58

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 894
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 895
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/AstNode;

    .line 896
    .local v3, "arg":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 897
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v2, v4, :cond_0

    .line 898
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v5, 0x5a

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 894
    .end local v3    # "arg":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 901
    .end local v2    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x59

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 902
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/NewExpression;->getInitializer()Lcom/trendmicro/hippo/ast/ObjectLiteral;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 903
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/NewExpression;->getInitializer()Lcom/trendmicro/hippo/ast/ObjectLiteral;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->transformObjectLiteral(Lcom/trendmicro/hippo/ast/ObjectLiteral;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 905
    :cond_2
    return-object v0
.end method

.method private transformNumber(Lcom/trendmicro/hippo/ast/NumberLiteral;)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/NumberLiteral;

    .line 909
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/NumberLiteral;->getNumber()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addNumber(D)V

    .line 910
    return-object p1
.end method

.method private transformObjectLiteral(Lcom/trendmicro/hippo/ast/ObjectLiteral;)Lcom/trendmicro/hippo/Node;
    .locals 13
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ObjectLiteral;

    .line 914
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->isDestructuring()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 915
    return-object p1

    .line 920
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x56

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 921
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->getElements()Ljava/util/List;

    move-result-object v0

    .line 922
    .local v0, "elems":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/ObjectProperty;>;"
    new-instance v1, Lcom/trendmicro/hippo/Node;

    const/16 v2, 0x43

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 924
    .local v1, "object":Lcom/trendmicro/hippo/Node;
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 925
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .local v2, "properties":[Ljava/lang/Object;
    goto/16 :goto_3

    .line 927
    .end local v2    # "properties":[Ljava/lang/Object;
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "size":I
    const/4 v4, 0x0

    .line 928
    .local v4, "i":I
    new-array v5, v3, [Ljava/lang/Object;

    .line 929
    .local v5, "properties":[Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trendmicro/hippo/ast/ObjectProperty;

    .line 930
    .local v7, "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isGetterMethod()Z

    move-result v8

    const/16 v9, 0xa4

    const/16 v10, 0x99

    const/16 v11, 0x98

    if-eqz v8, :cond_2

    .line 931
    iget-object v8, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v8, v11}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    goto :goto_1

    .line 932
    :cond_2
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isSetterMethod()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 933
    iget-object v8, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v8, v10}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    goto :goto_1

    .line 934
    :cond_3
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isNormalMethod()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 935
    iget-object v8, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v8, v9}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 938
    :cond_4
    :goto_1
    add-int/lit8 v8, v4, 0x1

    .end local v4    # "i":I
    .local v8, "i":I
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v12

    invoke-direct {p0, v12}, Lcom/trendmicro/hippo/IRFactory;->getPropKey(Lcom/trendmicro/hippo/Node;)Ljava/lang/Object;

    move-result-object v12

    aput-object v12, v5, v4

    .line 942
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isMethod()Z

    move-result v4

    if-nez v4, :cond_5

    .line 943
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v4, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 946
    :cond_5
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 947
    .local v4, "right":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isGetterMethod()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 948
    invoke-direct {p0, v11, v4}, Lcom/trendmicro/hippo/IRFactory;->createUnary(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    goto :goto_2

    .line 949
    :cond_6
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isSetterMethod()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 950
    invoke-direct {p0, v10, v4}, Lcom/trendmicro/hippo/IRFactory;->createUnary(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    goto :goto_2

    .line 951
    :cond_7
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isNormalMethod()Z

    move-result v10

    if-eqz v10, :cond_8

    .line 952
    invoke-direct {p0, v9, v4}, Lcom/trendmicro/hippo/IRFactory;->createUnary(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 954
    :cond_8
    :goto_2
    invoke-virtual {v1, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 956
    if-ge v8, v3, :cond_9

    .line 957
    iget-object v9, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v10, 0x5a

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 959
    .end local v4    # "right":Lcom/trendmicro/hippo/Node;
    .end local v7    # "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    :cond_9
    move v4, v8

    goto/16 :goto_0

    .line 929
    .end local v8    # "i":I
    .local v4, "i":I
    :cond_a
    move-object v2, v5

    .line 961
    .end local v3    # "size":I
    .end local v4    # "i":I
    .end local v5    # "properties":[Ljava/lang/Object;
    .restart local v2    # "properties":[Ljava/lang/Object;
    :goto_3
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v4, 0x57

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 962
    const/16 v3, 0xc

    invoke-virtual {v1, v3, v2}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 963
    return-object v1
.end method

.method private transformParenExpr(Lcom/trendmicro/hippo/ast/ParenthesizedExpression;)Lcom/trendmicro/hippo/Node;
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    .line 987
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 988
    .local v0, "expr":Lcom/trendmicro/hippo/ast/AstNode;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x58

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 989
    const/4 v1, 0x1

    .line 990
    .local v1, "count":I
    :goto_0
    instance-of v3, v0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    if-eqz v3, :cond_0

    .line 991
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 992
    add-int/lit8 v1, v1, 0x1

    .line 993
    move-object v3, v0

    check-cast v3, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    goto :goto_0

    .line 995
    :cond_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 996
    .local v2, "result":Lcom/trendmicro/hippo/Node;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_1

    .line 997
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v5, 0x59

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 996
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 999
    .end local v3    # "i":I
    :cond_1
    const/16 v3, 0x13

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v3, v4}, Lcom/trendmicro/hippo/Node;->putProp(ILjava/lang/Object;)V

    .line 1000
    return-object v2
.end method

.method private transformPropertyGet(Lcom/trendmicro/hippo/ast/PropertyGet;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/PropertyGet;

    .line 1004
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/PropertyGet;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 1005
    .local v0, "target":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/PropertyGet;->getProperty()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 1006
    .local v1, "name":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x6d

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1007
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 1008
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {p0, v0, v2, v1, v3}, Lcom/trendmicro/hippo/IRFactory;->createPropertyGet(Lcom/trendmicro/hippo/Node;Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    return-object v2
.end method

.method private transformRegExp(Lcom/trendmicro/hippo/ast/RegExpLiteral;)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/RegExpLiteral;

    .line 1012
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/RegExpLiteral;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/RegExpLiteral;->getFlags()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addRegexp(Ljava/lang/String;Ljava/lang/String;)V

    .line 1013
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->addRegExp(Lcom/trendmicro/hippo/ast/RegExpLiteral;)V

    .line 1014
    return-object p1
.end method

.method private transformReturn(Lcom/trendmicro/hippo/ast/ReturnStatement;)Lcom/trendmicro/hippo/Node;
    .locals 7
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ReturnStatement;

    .line 1018
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v1, 0x19

    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/ast/ReturnStatement;->getProp(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1019
    .local v0, "expClosure":Z
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v2, 0x1b

    invoke-virtual {p1, v2}, Lcom/trendmicro/hippo/ast/ReturnStatement;->getProp(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1020
    .local v1, "isArrow":Z
    const/4 v2, 0x4

    if-eqz v0, :cond_0

    .line 1021
    if-nez v1, :cond_1

    .line 1022
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v4, " "

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    goto :goto_0

    .line 1025
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1027
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ReturnStatement;->getReturnValue()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    .line 1028
    .local v3, "rv":Lcom/trendmicro/hippo/ast/AstNode;
    if-nez v3, :cond_2

    const/4 v4, 0x0

    goto :goto_1

    :cond_2
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 1029
    .local v4, "value":Lcom/trendmicro/hippo/Node;
    :goto_1
    if-nez v0, :cond_3

    iget-object v5, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v6, 0x53

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1030
    :cond_3
    if-nez v3, :cond_4

    .line 1031
    new-instance v5, Lcom/trendmicro/hippo/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ReturnStatement;->getLineno()I

    move-result v6

    invoke-direct {v5, v2, v6}, Lcom/trendmicro/hippo/Node;-><init>(II)V

    goto :goto_2

    .line 1032
    :cond_4
    new-instance v5, Lcom/trendmicro/hippo/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ReturnStatement;->getLineno()I

    move-result v6

    invoke-direct {v5, v2, v4, v6}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    .line 1030
    :goto_2
    return-object v5
.end method

.method private transformScript(Lcom/trendmicro/hippo/ast/ScriptNode;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 1036
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x89

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1037
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1038
    :cond_0
    iput-object p1, p0, Lcom/trendmicro/hippo/IRFactory;->currentScope:Lcom/trendmicro/hippo/ast/Scope;

    .line 1039
    new-instance v0, Lcom/trendmicro/hippo/Node;

    const/16 v1, 0x82

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/Node;-><init>(I)V

    .line 1040
    .local v0, "body":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Node;

    .line 1041
    .local v2, "kid":Lcom/trendmicro/hippo/Node;
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1042
    .end local v2    # "kid":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 1043
    :cond_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ScriptNode;->removeChildren()V

    .line 1044
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Node;->getFirstChild()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1045
    .local v1, "children":Lcom/trendmicro/hippo/Node;
    if-eqz v1, :cond_2

    .line 1046
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/ast/ScriptNode;->addChildrenToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1048
    :cond_2
    return-object p1
.end method

.method private transformString(Lcom/trendmicro/hippo/ast/StringLiteral;)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/StringLiteral;

    .line 1052
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/StringLiteral;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addString(Ljava/lang/String;)V

    .line 1053
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/StringLiteral;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/trendmicro/hippo/Node;->newString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method private transformSwitch(Lcom/trendmicro/hippo/ast/SwitchStatement;)Lcom/trendmicro/hippo/Node;
    .locals 11
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/SwitchStatement;

    .line 1096
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x73

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1097
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1098
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/SwitchStatement;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 1099
    .local v0, "switchExpr":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1100
    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/SwitchStatement;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1102
    new-instance v1, Lcom/trendmicro/hippo/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/SwitchStatement;->getLineno()I

    move-result v2

    const/16 v3, 0x82

    invoke-direct {v1, v3, p1, v2}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    .line 1103
    .local v1, "block":Lcom/trendmicro/hippo/Node;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x56

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1105
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/SwitchStatement;->getCases()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/SwitchCase;

    .line 1106
    .local v3, "sc":Lcom/trendmicro/hippo/ast/SwitchCase;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/SwitchCase;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v4

    .line 1107
    .local v4, "expr":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v5, 0x0

    .line 1109
    .local v5, "caseExpr":Lcom/trendmicro/hippo/Node;
    if-eqz v4, :cond_0

    .line 1110
    iget-object v6, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v7, 0x74

    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1111
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    goto :goto_1

    .line 1113
    :cond_0
    iget-object v6, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v7, 0x75

    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1115
    :goto_1
    iget-object v6, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v7, 0x68

    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1117
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/SwitchCase;->getStatements()Ljava/util/List;

    move-result-object v6

    .line 1118
    .local v6, "stmts":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    new-instance v7, Lcom/trendmicro/hippo/ast/Block;

    invoke-direct {v7}, Lcom/trendmicro/hippo/ast/Block;-><init>()V

    .line 1119
    .local v7, "body":Lcom/trendmicro/hippo/Node;
    if-eqz v6, :cond_1

    .line 1120
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/trendmicro/hippo/ast/AstNode;

    .line 1121
    .local v9, "kid":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v9}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    invoke-virtual {v7, v10}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1122
    .end local v9    # "kid":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_2

    .line 1124
    :cond_1
    invoke-direct {p0, v1, v5, v7}, Lcom/trendmicro/hippo/IRFactory;->addSwitchCase(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)V

    .line 1125
    .end local v3    # "sc":Lcom/trendmicro/hippo/ast/SwitchCase;
    .end local v4    # "expr":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v5    # "caseExpr":Lcom/trendmicro/hippo/Node;
    .end local v6    # "stmts":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    .end local v7    # "body":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 1126
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x57

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1127
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->closeSwitch(Lcom/trendmicro/hippo/Node;)V

    .line 1128
    return-object v1
.end method

.method private transformThrow(Lcom/trendmicro/hippo/ast/ThrowStatement;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ThrowStatement;

    .line 1132
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x32

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1133
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ThrowStatement;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 1134
    .local v0, "value":Lcom/trendmicro/hippo/Node;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x53

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1135
    new-instance v2, Lcom/trendmicro/hippo/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ThrowStatement;->getLineno()I

    move-result v3

    invoke-direct {v2, v1, v0, v3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    return-object v2
.end method

.method private transformTry(Lcom/trendmicro/hippo/ast/TryStatement;)Lcom/trendmicro/hippo/Node;
    .locals 11
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/TryStatement;

    .line 1139
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x52

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1140
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x56

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1141
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/TryStatement;->getTryBlock()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 1142
    .local v0, "tryBlock":Lcom/trendmicro/hippo/Node;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x57

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1144
    new-instance v2, Lcom/trendmicro/hippo/ast/Block;

    invoke-direct {v2}, Lcom/trendmicro/hippo/ast/Block;-><init>()V

    .line 1145
    .local v2, "catchBlocks":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/TryStatement;->getCatchClauses()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trendmicro/hippo/ast/CatchClause;

    .line 1146
    .local v5, "cc":Lcom/trendmicro/hippo/ast/CatchClause;
    iget-object v6, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v7, 0x7d

    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1147
    iget-object v6, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v7, 0x58

    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1149
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/CatchClause;->getVarName()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v6

    invoke-virtual {v6}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    .line 1150
    .local v6, "varName":Ljava/lang/String;
    iget-object v7, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 1152
    const/4 v7, 0x0

    .line 1153
    .local v7, "catchCond":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/CatchClause;->getCatchCondition()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v8

    .line 1154
    .local v8, "ccc":Lcom/trendmicro/hippo/ast/AstNode;
    if-eqz v8, :cond_0

    .line 1155
    iget-object v9, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const-string v10, " "

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 1156
    iget-object v9, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v10, 0x71

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1157
    invoke-virtual {p0, v8}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v7

    goto :goto_1

    .line 1159
    :cond_0
    new-instance v9, Lcom/trendmicro/hippo/ast/EmptyExpression;

    invoke-direct {v9}, Lcom/trendmicro/hippo/ast/EmptyExpression;-><init>()V

    move-object v7, v9

    .line 1161
    :goto_1
    iget-object v9, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v10, 0x59

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1162
    iget-object v9, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v9, v1}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1164
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/CatchClause;->getBody()Lcom/trendmicro/hippo/ast/Block;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v9

    .line 1165
    .local v9, "body":Lcom/trendmicro/hippo/Node;
    iget-object v10, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v10, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1167
    nop

    .line 1168
    invoke-virtual {v5}, Lcom/trendmicro/hippo/ast/CatchClause;->getLineno()I

    move-result v10

    .line 1167
    invoke-direct {p0, v6, v7, v9, v10}, Lcom/trendmicro/hippo/IRFactory;->createCatch(Ljava/lang/String;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    invoke-virtual {v2, v10}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1169
    .end local v5    # "cc":Lcom/trendmicro/hippo/ast/CatchClause;
    .end local v6    # "varName":Ljava/lang/String;
    .end local v7    # "catchCond":Lcom/trendmicro/hippo/Node;
    .end local v8    # "ccc":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v9    # "body":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 1170
    :cond_1
    const/4 v4, 0x0

    .line 1171
    .local v4, "finallyBlock":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/TryStatement;->getFinallyBlock()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 1172
    iget-object v5, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v6, 0x7e

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1173
    iget-object v5, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v5, v1}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1174
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/TryStatement;->getFinallyBlock()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 1175
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1177
    :cond_2
    nop

    .line 1178
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/TryStatement;->getLineno()I

    move-result v1

    .line 1177
    invoke-direct {p0, v0, v2, v4, v1}, Lcom/trendmicro/hippo/IRFactory;->createTryCatchFinally(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    return-object v1
.end method

.method private transformUnary(Lcom/trendmicro/hippo/ast/UnaryExpression;)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/UnaryExpression;

    .line 1182
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->getType()I

    move-result v0

    .line 1183
    .local v0, "type":I
    const/16 v1, 0x4b

    if-ne v0, v1, :cond_0

    .line 1184
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->transformDefaultXmlNamepace(Lcom/trendmicro/hippo/ast/UnaryExpression;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    return-object v1

    .line 1186
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->isPrefix()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1187
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1189
    :cond_1
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->getOperand()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1190
    .local v1, "child":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->isPostfix()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1191
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1193
    :cond_2
    const/16 v2, 0x6b

    if-eq v0, v2, :cond_4

    const/16 v2, 0x6c

    if-ne v0, v2, :cond_3

    goto :goto_0

    .line 1196
    :cond_3
    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/IRFactory;->createUnary(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    return-object v2

    .line 1194
    :cond_4
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/UnaryExpression;->isPostfix()Z

    move-result v2

    invoke-direct {p0, v0, v2, v1}, Lcom/trendmicro/hippo/IRFactory;->createIncDec(IZLcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    return-object v2
.end method

.method private transformVariableInitializers(Lcom/trendmicro/hippo/ast/VariableDeclaration;)Lcom/trendmicro/hippo/Node;
    .locals 11
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/VariableDeclaration;

    .line 1214
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->getVariables()Ljava/util/List;

    move-result-object v0

    .line 1215
    .local v0, "vars":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/VariableInitializer;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    const/4 v2, 0x0

    .line 1216
    .local v2, "i":I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trendmicro/hippo/ast/VariableInitializer;

    .line 1217
    .local v4, "var":Lcom/trendmicro/hippo/ast/VariableInitializer;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/VariableInitializer;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    .line 1218
    .local v5, "target":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/VariableInitializer;->getInitializer()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v6

    .line 1220
    .local v6, "init":Lcom/trendmicro/hippo/ast/AstNode;
    const/4 v7, 0x0

    .line 1221
    .local v7, "left":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/VariableInitializer;->isDestructuring()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1222
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 1223
    move-object v7, v5

    goto :goto_1

    .line 1225
    :cond_0
    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v7

    .line 1228
    :goto_1
    const/4 v8, 0x0

    .line 1229
    .local v8, "right":Lcom/trendmicro/hippo/Node;
    if-eqz v6, :cond_1

    .line 1230
    iget-object v9, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v10, 0x5b

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1231
    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v8

    .line 1234
    :cond_1
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/VariableInitializer;->isDestructuring()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 1235
    if-nez v8, :cond_2

    .line 1236
    invoke-virtual {p1, v7}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    goto :goto_2

    .line 1238
    :cond_2
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->getType()I

    move-result v9

    invoke-virtual {p0, v9, v7, v8}, Lcom/trendmicro/hippo/IRFactory;->createDestructuringAssignment(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v9

    .line 1240
    .local v9, "d":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1, v9}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1241
    .end local v9    # "d":Lcom/trendmicro/hippo/Node;
    goto :goto_2

    .line 1243
    :cond_3
    if-eqz v8, :cond_4

    .line 1244
    invoke-virtual {v7, v8}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1246
    :cond_4
    invoke-virtual {p1, v7}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1248
    :goto_2
    add-int/lit8 v9, v2, 0x1

    .end local v2    # "i":I
    .local v9, "i":I
    add-int/lit8 v10, v1, -0x1

    if-ge v2, v10, :cond_5

    .line 1249
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v10, 0x5a

    invoke-virtual {v2, v10}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1251
    .end local v4    # "var":Lcom/trendmicro/hippo/ast/VariableInitializer;
    .end local v5    # "target":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v6    # "init":Lcom/trendmicro/hippo/ast/AstNode;
    .end local v7    # "left":Lcom/trendmicro/hippo/Node;
    .end local v8    # "right":Lcom/trendmicro/hippo/Node;
    :cond_5
    move v2, v9

    goto :goto_0

    .line 1252
    .end local v9    # "i":I
    .restart local v2    # "i":I
    :cond_6
    return-object p1
.end method

.method private transformVariables(Lcom/trendmicro/hippo/ast/VariableDeclaration;)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/VariableDeclaration;

    .line 1200
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->getType()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1201
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->transformVariableInitializers(Lcom/trendmicro/hippo/ast/VariableDeclaration;)Lcom/trendmicro/hippo/Node;

    .line 1205
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->getParent()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    .line 1206
    .local v0, "parent":Lcom/trendmicro/hippo/ast/AstNode;
    instance-of v1, v0, Lcom/trendmicro/hippo/ast/Loop;

    if-nez v1, :cond_0

    instance-of v1, v0, Lcom/trendmicro/hippo/ast/LetNode;

    if-nez v1, :cond_0

    .line 1208
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x53

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1210
    :cond_0
    return-object p1
.end method

.method private transformWhileLoop(Lcom/trendmicro/hippo/ast/WhileLoop;)Lcom/trendmicro/hippo/Node;
    .locals 8
    .param p1, "loop"    # Lcom/trendmicro/hippo/ast/WhileLoop;

    .line 1256
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x76

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1257
    const/16 v0, 0x85

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/ast/WhileLoop;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 1258
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->pushScope(Lcom/trendmicro/hippo/ast/Scope;)V

    .line 1260
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1261
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/WhileLoop;->getCondition()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v5

    .line 1262
    .local v5, "cond":Lcom/trendmicro/hippo/Node;
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x59

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1263
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x56

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1264
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/WhileLoop;->getBody()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 1265
    .local v4, "body":Lcom/trendmicro/hippo/Node;
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x57

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1266
    const/4 v3, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/IRFactory;->createLoop(Lcom/trendmicro/hippo/ast/Jump;ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1268
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 1266
    return-object v0

    .line 1268
    .end local v4    # "body":Lcom/trendmicro/hippo/Node;
    .end local v5    # "cond":Lcom/trendmicro/hippo/Node;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IRFactory;->popScope()V

    .line 1269
    throw v0
.end method

.method private transformWith(Lcom/trendmicro/hippo/ast/WithStatement;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/WithStatement;

    .line 1273
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x7c

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1274
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x58

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1275
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/WithStatement;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 1276
    .local v0, "expr":Lcom/trendmicro/hippo/Node;
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x59

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1277
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v2, 0x56

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1278
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/WithStatement;->getStatement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1279
    .local v1, "stmt":Lcom/trendmicro/hippo/Node;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x57

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 1280
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/WithStatement;->getLineno()I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/trendmicro/hippo/IRFactory;->createWith(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    return-object v2
.end method

.method private transformXmlLiteral(Lcom/trendmicro/hippo/ast/XmlLiteral;)Lcom/trendmicro/hippo/Node;
    .locals 13
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/XmlLiteral;

    .line 1295
    new-instance v0, Lcom/trendmicro/hippo/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/XmlLiteral;->getLineno()I

    move-result v1

    const/16 v2, 0x1e

    invoke-direct {v0, v2, v1}, Lcom/trendmicro/hippo/Node;-><init>(II)V

    .line 1296
    .local v0, "pnXML":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/XmlLiteral;->getFragments()Ljava/util/List;

    move-result-object v1

    .line 1298
    .local v1, "frags":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/XmlFragment;>;"
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ast/XmlString;

    .line 1299
    .local v2, "first":Lcom/trendmicro/hippo/ast/XmlString;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/XmlString;->getXml()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "<>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    .line 1300
    .local v3, "anon":Z
    if-eqz v3, :cond_0

    const-string v4, "XMLList"

    goto :goto_0

    :cond_0
    const-string v4, "XML"

    :goto_0
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/IRFactory;->createName(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1302
    const/4 v4, 0x0

    .line 1303
    .local v4, "pn":Lcom/trendmicro/hippo/Node;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/trendmicro/hippo/ast/XmlFragment;

    .line 1304
    .local v6, "frag":Lcom/trendmicro/hippo/ast/XmlFragment;
    instance-of v7, v6, Lcom/trendmicro/hippo/ast/XmlString;

    const/16 v8, 0x15

    if-eqz v7, :cond_2

    .line 1305
    move-object v7, v6

    check-cast v7, Lcom/trendmicro/hippo/ast/XmlString;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/XmlString;->getXml()Ljava/lang/String;

    move-result-object v7

    .line 1306
    .local v7, "xml":Ljava/lang/String;
    iget-object v9, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v9, v7}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 1307
    if-nez v4, :cond_1

    .line 1308
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/IRFactory;->createString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    goto :goto_2

    .line 1310
    :cond_1
    invoke-direct {p0, v7}, Lcom/trendmicro/hippo/IRFactory;->createString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v9

    invoke-direct {p0, v8, v4, v9}, Lcom/trendmicro/hippo/IRFactory;->createBinary(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 1312
    .end local v7    # "xml":Ljava/lang/String;
    :goto_2
    goto :goto_5

    .line 1313
    :cond_2
    move-object v7, v6

    check-cast v7, Lcom/trendmicro/hippo/ast/XmlExpression;

    .line 1314
    .local v7, "xexpr":Lcom/trendmicro/hippo/ast/XmlExpression;
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/XmlExpression;->isXmlAttribute()Z

    move-result v9

    .line 1316
    .local v9, "isXmlAttr":Z
    iget-object v10, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v11, 0x56

    invoke-virtual {v10, v11}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1317
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/XmlExpression;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v10

    instance-of v10, v10, Lcom/trendmicro/hippo/ast/EmptyExpression;

    if-eqz v10, :cond_3

    .line 1318
    const-string v10, ""

    invoke-direct {p0, v10}, Lcom/trendmicro/hippo/IRFactory;->createString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .local v10, "expr":Lcom/trendmicro/hippo/Node;
    goto :goto_3

    .line 1320
    .end local v10    # "expr":Lcom/trendmicro/hippo/Node;
    :cond_3
    invoke-virtual {v7}, Lcom/trendmicro/hippo/ast/XmlExpression;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v10

    invoke-virtual {p0, v10}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .line 1322
    .restart local v10    # "expr":Lcom/trendmicro/hippo/Node;
    :goto_3
    iget-object v11, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v12, 0x57

    invoke-virtual {v11, v12}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1323
    if-eqz v9, :cond_4

    .line 1325
    const/16 v11, 0x4c

    invoke-direct {p0, v11, v10}, Lcom/trendmicro/hippo/IRFactory;->createUnary(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .line 1326
    nop

    .line 1327
    const-string v11, "\""

    invoke-direct {p0, v11}, Lcom/trendmicro/hippo/IRFactory;->createString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v12

    .line 1326
    invoke-direct {p0, v8, v12, v10}, Lcom/trendmicro/hippo/IRFactory;->createBinary(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v12

    .line 1329
    .local v12, "prepend":Lcom/trendmicro/hippo/Node;
    nop

    .line 1331
    invoke-direct {p0, v11}, Lcom/trendmicro/hippo/IRFactory;->createString(Ljava/lang/String;)Lcom/trendmicro/hippo/Node;

    move-result-object v11

    .line 1329
    invoke-direct {p0, v8, v12, v11}, Lcom/trendmicro/hippo/IRFactory;->createBinary(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .line 1332
    .end local v12    # "prepend":Lcom/trendmicro/hippo/Node;
    goto :goto_4

    .line 1333
    :cond_4
    const/16 v11, 0x4d

    invoke-direct {p0, v11, v10}, Lcom/trendmicro/hippo/IRFactory;->createUnary(ILcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v10

    .line 1335
    :goto_4
    invoke-direct {p0, v8, v4, v10}, Lcom/trendmicro/hippo/IRFactory;->createBinary(ILcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/Node;)Lcom/trendmicro/hippo/Node;

    move-result-object v4

    .line 1337
    .end local v6    # "frag":Lcom/trendmicro/hippo/ast/XmlFragment;
    .end local v7    # "xexpr":Lcom/trendmicro/hippo/ast/XmlExpression;
    .end local v9    # "isXmlAttr":Z
    .end local v10    # "expr":Lcom/trendmicro/hippo/Node;
    :goto_5
    goto/16 :goto_1

    .line 1339
    :cond_5
    invoke-virtual {v0, v4}, Lcom/trendmicro/hippo/Node;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 1340
    return-object v0
.end method

.method private transformXmlMemberGet(Lcom/trendmicro/hippo/ast/XmlMemberGet;)Lcom/trendmicro/hippo/Node;
    .locals 5
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/XmlMemberGet;

    .line 1344
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->getMemberRef()Lcom/trendmicro/hippo/ast/XmlRef;

    move-result-object v0

    .line 1345
    .local v0, "ref":Lcom/trendmicro/hippo/ast/XmlRef;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    .line 1346
    .local v1, "pn":Lcom/trendmicro/hippo/Node;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/XmlRef;->isAttributeAccess()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 1347
    .local v2, "flags":I
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/XmlMemberGet;->getType()I

    move-result v3

    const/16 v4, 0x90

    if-ne v3, v4, :cond_1

    .line 1348
    or-int/lit8 v2, v2, 0x4

    .line 1349
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    goto :goto_1

    .line 1351
    :cond_1
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v4, 0x6d

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1353
    :goto_1
    invoke-direct {p0, v1, v0, v2}, Lcom/trendmicro/hippo/IRFactory;->transformXmlRef(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/XmlRef;I)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    return-object v3
.end method

.method private transformXmlRef(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/XmlRef;I)Lcom/trendmicro/hippo/Node;
    .locals 5
    .param p1, "pn"    # Lcom/trendmicro/hippo/Node;
    .param p2, "node"    # Lcom/trendmicro/hippo/ast/XmlRef;
    .param p3, "memberTypeFlags"    # I

    .line 1364
    and-int/lit8 v0, p3, 0x2

    if-eqz v0, :cond_0

    .line 1365
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x94

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1366
    :cond_0
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/XmlRef;->getNamespace()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v0

    .line 1367
    .local v0, "namespace":Lcom/trendmicro/hippo/ast/Name;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 1368
    .local v1, "ns":Ljava/lang/String;
    :goto_0
    if-eqz v1, :cond_2

    .line 1369
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 1370
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x91

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1372
    :cond_2
    instance-of v2, p2, Lcom/trendmicro/hippo/ast/XmlPropRef;

    if-eqz v2, :cond_3

    .line 1373
    move-object v2, p2

    check-cast v2, Lcom/trendmicro/hippo/ast/XmlPropRef;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/XmlPropRef;->getPropName()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    .line 1374
    .local v2, "name":Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 1375
    invoke-direct {p0, p1, v1, v2, p3}, Lcom/trendmicro/hippo/IRFactory;->createPropertyGet(Lcom/trendmicro/hippo/Node;Ljava/lang/String;Ljava/lang/String;I)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    return-object v3

    .line 1377
    .end local v2    # "name":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x54

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1378
    move-object v2, p2

    check-cast v2, Lcom/trendmicro/hippo/ast/XmlElemRef;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/XmlElemRef;->getExpression()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v2

    .line 1379
    .local v2, "expr":Lcom/trendmicro/hippo/Node;
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v4, 0x55

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1380
    invoke-direct {p0, p1, v1, v2, p3}, Lcom/trendmicro/hippo/IRFactory;->createElementGet(Lcom/trendmicro/hippo/Node;Ljava/lang/String;Lcom/trendmicro/hippo/Node;I)Lcom/trendmicro/hippo/Node;

    move-result-object v3

    return-object v3
.end method

.method private transformXmlRef(Lcom/trendmicro/hippo/ast/XmlRef;)Lcom/trendmicro/hippo/Node;
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/XmlRef;

    .line 1358
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/XmlRef;->isAttributeAccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1359
    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1360
    .local v0, "memberTypeFlags":I
    :goto_0
    const/4 v1, 0x0

    invoke-direct {p0, v1, p1, v0}, Lcom/trendmicro/hippo/IRFactory;->transformXmlRef(Lcom/trendmicro/hippo/Node;Lcom/trendmicro/hippo/ast/XmlRef;I)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    return-object v1
.end method

.method private transformYield(Lcom/trendmicro/hippo/ast/Yield;)Lcom/trendmicro/hippo/Node;
    .locals 4
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/Yield;

    .line 1284
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x49

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 1285
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Yield;->getValue()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Yield;->getValue()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 1286
    .local v0, "kid":Lcom/trendmicro/hippo/Node;
    :goto_0
    if-eqz v0, :cond_1

    .line 1287
    new-instance v2, Lcom/trendmicro/hippo/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Yield;->getLineno()I

    move-result v3

    invoke-direct {v2, v1, v0, v3}, Lcom/trendmicro/hippo/Node;-><init>(ILcom/trendmicro/hippo/Node;I)V

    return-object v2

    .line 1288
    :cond_1
    new-instance v2, Lcom/trendmicro/hippo/Node;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/Yield;->getLineno()I

    move-result v3

    invoke-direct {v2, v1, v3}, Lcom/trendmicro/hippo/Node;-><init>(II)V

    return-object v2
.end method


# virtual methods
.method decompile(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 2375
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v0

    const/16 v1, 0x21

    if-eq v0, v1, :cond_5

    const/16 v1, 0x24

    if-eq v0, v1, :cond_4

    const/16 v1, 0x2b

    if-eq v0, v1, :cond_3

    const/16 v1, 0x81

    if-eq v0, v1, :cond_2

    const/16 v1, 0x42

    if-eq v0, v1, :cond_1

    const/16 v1, 0x43

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    .line 2403
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unexpected token: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2404
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v1

    invoke-static {v1}, Lcom/trendmicro/hippo/Token;->typeToName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2403
    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;

    goto :goto_0

    .line 2383
    :pswitch_0
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/ast/StringLiteral;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/StringLiteral;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addString(Ljava/lang/String;)V

    .line 2384
    goto :goto_0

    .line 2389
    :pswitch_1
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/ast/NumberLiteral;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/NumberLiteral;->getNumber()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addNumber(D)V

    .line 2390
    goto :goto_0

    .line 2386
    :pswitch_2
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    move-object v1, p1

    check-cast v1, Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    .line 2387
    goto :goto_0

    .line 2380
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ObjectLiteral;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompileObjectLiteral(Lcom/trendmicro/hippo/ast/ObjectLiteral;)V

    .line 2381
    goto :goto_0

    .line 2377
    :cond_1
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ArrayLiteral;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompileArrayLiteral(Lcom/trendmicro/hippo/ast/ArrayLiteral;)V

    .line 2378
    goto :goto_0

    .line 2395
    :cond_2
    goto :goto_0

    .line 2400
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2401
    goto :goto_0

    .line 2397
    :cond_4
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ElementGet;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompileElementGet(Lcom/trendmicro/hippo/ast/ElementGet;)V

    .line 2398
    goto :goto_0

    .line 2392
    :cond_5
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/PropertyGet;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompilePropertyGet(Lcom/trendmicro/hippo/ast/PropertyGet;)V

    .line 2393
    nop

    .line 2406
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x27
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method decompileArrayLiteral(Lcom/trendmicro/hippo/ast/ArrayLiteral;)V
    .locals 6
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ArrayLiteral;

    .line 2410
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x54

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2411
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ArrayLiteral;->getElements()Ljava/util/List;

    move-result-object v0

    .line 2412
    .local v0, "elems":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 2413
    .local v1, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 2414
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/AstNode;

    .line 2415
    .local v3, "elem":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2416
    add-int/lit8 v4, v1, -0x1

    if-ge v2, v4, :cond_0

    .line 2417
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v5, 0x5a

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2413
    .end local v3    # "elem":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2420
    .end local v2    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x55

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2421
    return-void
.end method

.method decompileElementGet(Lcom/trendmicro/hippo/ast/ElementGet;)V
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ElementGet;

    .line 2453
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ElementGet;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2454
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x54

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2455
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ElementGet;->getElement()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2456
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x55

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2457
    return-void
.end method

.method decompileFunctionHeader(Lcom/trendmicro/hippo/ast/FunctionNode;)Lcom/trendmicro/hippo/Node;
    .locals 8
    .param p1, "fn"    # Lcom/trendmicro/hippo/ast/FunctionNode;

    .line 2344
    const/4 v0, 0x0

    .line 2345
    .local v0, "mexpr":Lcom/trendmicro/hippo/Node;
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionName()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2346
    iget-object v1, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Decompiler;->addName(Ljava/lang/String;)V

    goto :goto_0

    .line 2347
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getMemberExprNode()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 2348
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getMemberExprNode()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    .line 2350
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getFunctionType()I

    move-result v1

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v2, :cond_2

    move v1, v4

    goto :goto_1

    :cond_2
    move v1, v3

    .line 2351
    .local v1, "isArrow":Z
    :goto_1
    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getLp()I

    move-result v2

    const/4 v5, -0x1

    if-ne v2, v5, :cond_3

    move v3, v4

    :cond_3
    move v2, v3

    .line 2352
    .local v2, "noParen":Z
    if-nez v2, :cond_4

    .line 2353
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v5, 0x58

    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2355
    :cond_4
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->getParams()Ljava/util/List;

    move-result-object v3

    .line 2356
    .local v3, "params":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_6

    .line 2357
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2358
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    sub-int/2addr v6, v4

    if-ge v5, v6, :cond_5

    .line 2359
    iget-object v6, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v7, 0x5a

    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2356
    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 2362
    .end local v5    # "i":I
    :cond_6
    if-nez v2, :cond_7

    .line 2363
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v5, 0x59

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2365
    :cond_7
    if-eqz v1, :cond_8

    .line 2366
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v5, 0xa5

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2368
    :cond_8
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/FunctionNode;->isExpressionClosure()Z

    move-result v4

    if-nez v4, :cond_9

    .line 2369
    iget-object v4, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v5, 0x56

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/Decompiler;->addEOL(I)V

    .line 2371
    :cond_9
    return-object v0
.end method

.method decompileObjectLiteral(Lcom/trendmicro/hippo/ast/ObjectLiteral;)V
    .locals 7
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/ObjectLiteral;

    .line 2425
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x56

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2426
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->getElements()Ljava/util/List;

    move-result-object v0

    .line 2427
    .local v0, "props":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/ObjectProperty;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 2428
    .local v1, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 2429
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/ObjectProperty;

    .line 2430
    .local v3, "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v5, 0x1a

    .line 2431
    invoke-virtual {v3, v5}, Lcom/trendmicro/hippo/ast/ObjectProperty;->getProp(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 2432
    .local v4, "destructuringShorthand":Z
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ObjectProperty;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2433
    if-nez v4, :cond_0

    .line 2434
    iget-object v5, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v6, 0x68

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2435
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/ObjectProperty;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2437
    :cond_0
    add-int/lit8 v5, v1, -0x1

    if-ge v2, v5, :cond_1

    .line 2438
    iget-object v5, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v6, 0x5a

    invoke-virtual {v5, v6}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2428
    .end local v3    # "prop":Lcom/trendmicro/hippo/ast/ObjectProperty;
    .end local v4    # "destructuringShorthand":Z
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2441
    .end local v2    # "i":I
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v3, 0x57

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2442
    return-void
.end method

.method decompilePropertyGet(Lcom/trendmicro/hippo/ast/PropertyGet;)V
    .locals 2
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/PropertyGet;

    .line 2446
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/PropertyGet;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2447
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    const/16 v1, 0x6d

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 2448
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/PropertyGet;->getProperty()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->decompile(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 2449
    return-void
.end method

.method isDestructuring(Lcom/trendmicro/hippo/Node;)Z
    .locals 1
    .param p1, "n"    # Lcom/trendmicro/hippo/Node;

    .line 2339
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/DestructuringForm;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/DestructuringForm;

    .line 2340
    invoke-interface {v0}, Lcom/trendmicro/hippo/ast/DestructuringForm;->isDestructuring()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2339
    :goto_0
    return v0
.end method

.method public transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "node"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 136
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v0

    const/16 v1, 0x42

    if-eq v0, v1, :cond_f

    const/16 v1, 0x43

    if-eq v0, v1, :cond_e

    const/16 v1, 0x81

    if-eq v0, v1, :cond_d

    const/16 v1, 0x82

    if-eq v0, v1, :cond_c

    sparse-switch v0, :sswitch_data_0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    .line 207
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    if-eqz v0, :cond_0

    .line 208
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ExpressionStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformExprStmt(Lcom/trendmicro/hippo/ast/ExpressionStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 210
    :cond_0
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/Assignment;

    if-eqz v0, :cond_1

    .line 211
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/Assignment;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformAssignment(Lcom/trendmicro/hippo/ast/Assignment;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 213
    :cond_1
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/UnaryExpression;

    if-eqz v0, :cond_2

    .line 214
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/UnaryExpression;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformUnary(Lcom/trendmicro/hippo/ast/UnaryExpression;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 216
    :cond_2
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/XmlMemberGet;

    if-eqz v0, :cond_3

    .line 217
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/XmlMemberGet;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformXmlMemberGet(Lcom/trendmicro/hippo/ast/XmlMemberGet;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 219
    :cond_3
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/InfixExpression;

    if-eqz v0, :cond_4

    .line 220
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/InfixExpression;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformInfix(Lcom/trendmicro/hippo/ast/InfixExpression;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 222
    :cond_4
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/VariableDeclaration;

    if-eqz v0, :cond_5

    .line 223
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/VariableDeclaration;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformVariables(Lcom/trendmicro/hippo/ast/VariableDeclaration;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 225
    :cond_5
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    if-eqz v0, :cond_6

    .line 226
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformParenExpr(Lcom/trendmicro/hippo/ast/ParenthesizedExpression;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 228
    :cond_6
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/LabeledStatement;

    if-eqz v0, :cond_7

    .line 229
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/LabeledStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformLabeledStatement(Lcom/trendmicro/hippo/ast/LabeledStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 231
    :cond_7
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/LetNode;

    if-eqz v0, :cond_8

    .line 232
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/LetNode;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformLetNode(Lcom/trendmicro/hippo/ast/LetNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 234
    :cond_8
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/XmlRef;

    if-eqz v0, :cond_9

    .line 235
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/XmlRef;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformXmlRef(Lcom/trendmicro/hippo/ast/XmlRef;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 237
    :cond_9
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/XmlLiteral;

    if-eqz v0, :cond_a

    .line 238
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/XmlLiteral;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformXmlLiteral(Lcom/trendmicro/hippo/ast/XmlLiteral;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 240
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t transform: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :pswitch_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ContinueStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformContinue(Lcom/trendmicro/hippo/ast/ContinueStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 144
    :pswitch_1
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/BreakStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformBreak(Lcom/trendmicro/hippo/ast/BreakStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 154
    :pswitch_2
    instance-of v0, p1, Lcom/trendmicro/hippo/ast/ForInLoop;

    if-eqz v0, :cond_b

    .line 155
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ForInLoop;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformForInLoop(Lcom/trendmicro/hippo/ast/ForInLoop;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 157
    :cond_b
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ForLoop;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformForLoop(Lcom/trendmicro/hippo/ast/ForLoop;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 150
    :pswitch_3
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/DoLoop;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformDoLoop(Lcom/trendmicro/hippo/ast/DoLoop;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 201
    :pswitch_4
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/WhileLoop;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformWhileLoop(Lcom/trendmicro/hippo/ast/WhileLoop;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 193
    :pswitch_5
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/StringLiteral;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformString(Lcom/trendmicro/hippo/ast/StringLiteral;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 181
    :pswitch_6
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/NumberLiteral;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformNumber(Lcom/trendmicro/hippo/ast/NumberLiteral;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 179
    :pswitch_7
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/Name;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformName(Lcom/trendmicro/hippo/ast/Name;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 146
    :pswitch_8
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionCall;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformFunctionCall(Lcom/trendmicro/hippo/ast/FunctionCall;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 161
    :sswitch_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/GeneratorExpression;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformGenExpr(Lcom/trendmicro/hippo/ast/GeneratorExpression;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 176
    :pswitch_9
    :sswitch_1
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->transformLiteral(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 138
    :sswitch_2
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ArrayComprehension;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformArrayComp(Lcom/trendmicro/hippo/ast/ArrayComprehension;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 191
    :sswitch_3
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ScriptNode;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformScript(Lcom/trendmicro/hippo/ast/ScriptNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 203
    :sswitch_4
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/WithStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformWith(Lcom/trendmicro/hippo/ast/WithStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 195
    :sswitch_5
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/SwitchStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformSwitch(Lcom/trendmicro/hippo/ast/SwitchStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 169
    :sswitch_6
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/IfStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformIf(Lcom/trendmicro/hippo/ast/IfStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 159
    :sswitch_7
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/FunctionNode;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformFunction(Lcom/trendmicro/hippo/ast/FunctionNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 167
    :sswitch_8
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ConditionalExpression;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformCondExpr(Lcom/trendmicro/hippo/ast/ConditionalExpression;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 199
    :sswitch_9
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/TryStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformTry(Lcom/trendmicro/hippo/ast/TryStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 205
    :sswitch_a
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/Yield;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformYield(Lcom/trendmicro/hippo/ast/Yield;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 197
    :sswitch_b
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ThrowStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformThrow(Lcom/trendmicro/hippo/ast/ThrowStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 187
    :sswitch_c
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/RegExpLiteral;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformRegExp(Lcom/trendmicro/hippo/ast/RegExpLiteral;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 163
    :sswitch_d
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ElementGet;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformElementGet(Lcom/trendmicro/hippo/ast/ElementGet;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 165
    :sswitch_e
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/PropertyGet;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformPropertyGet(Lcom/trendmicro/hippo/ast/PropertyGet;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 183
    :sswitch_f
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/NewExpression;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformNewExpr(Lcom/trendmicro/hippo/ast/NewExpression;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 189
    :sswitch_10
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ReturnStatement;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformReturn(Lcom/trendmicro/hippo/ast/ReturnStatement;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 142
    :cond_c
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->transformBlock(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 152
    :cond_d
    return-object p1

    .line 185
    :cond_e
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ObjectLiteral;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformObjectLiteral(Lcom/trendmicro/hippo/ast/ObjectLiteral;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    .line 140
    :cond_f
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ast/ArrayLiteral;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/IRFactory;->transformArrayLiteral(Lcom/trendmicro/hippo/ast/ArrayLiteral;)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_10
        0x1e -> :sswitch_f
        0x21 -> :sswitch_e
        0x24 -> :sswitch_d
        0x30 -> :sswitch_c
        0x32 -> :sswitch_b
        0x49 -> :sswitch_a
        0x52 -> :sswitch_9
        0x67 -> :sswitch_8
        0x6e -> :sswitch_7
        0x71 -> :sswitch_6
        0x73 -> :sswitch_5
        0x7c -> :sswitch_4
        0x89 -> :sswitch_3
        0x9e -> :sswitch_2
        0xa1 -> :sswitch_1
        0xa3 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x26
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x76
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public transformTree(Lcom/trendmicro/hippo/ast/AstRoot;)Lcom/trendmicro/hippo/ast/ScriptNode;
    .locals 4
    .param p1, "root"    # Lcom/trendmicro/hippo/ast/AstRoot;

    .line 109
    iput-object p1, p0, Lcom/trendmicro/hippo/IRFactory;->currentScriptOrFn:Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 110
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstRoot;->isInStrictMode()Z

    move-result v0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/IRFactory;->inUseStrictDirective:Z

    .line 111
    iget-object v0, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/Decompiler;->getCurrentOffset()I

    move-result v0

    .line 117
    .local v0, "sourceStartOffset":I
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/IRFactory;->transform(Lcom/trendmicro/hippo/ast/AstNode;)Lcom/trendmicro/hippo/Node;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/ScriptNode;

    .line 119
    .local v1, "script":Lcom/trendmicro/hippo/ast/ScriptNode;
    iget-object v2, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/Decompiler;->getCurrentOffset()I

    move-result v2

    .line 120
    .local v2, "sourceEndOffset":I
    invoke-virtual {v1, v0, v2}, Lcom/trendmicro/hippo/ast/ScriptNode;->setEncodedSourceBounds(II)V

    .line 123
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->compilerEnv:Lcom/trendmicro/hippo/CompilerEnvirons;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/CompilerEnvirons;->isGeneratingSource()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 124
    iget-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/Decompiler;->getEncodedSource()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/ScriptNode;->setEncodedSource(Ljava/lang/String;)V

    .line 127
    :cond_0
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/trendmicro/hippo/IRFactory;->decompiler:Lcom/trendmicro/hippo/Decompiler;

    .line 128
    return-object v1
.end method
