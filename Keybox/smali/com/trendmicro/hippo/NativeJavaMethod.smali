.class public Lcom/trendmicro/hippo/NativeJavaMethod;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "NativeJavaMethod.java"


# static fields
.field private static final PREFERENCE_AMBIGUOUS:I = 0x3

.field private static final PREFERENCE_EQUAL:I = 0x0

.field private static final PREFERENCE_FIRST_ARG:I = 0x1

.field private static final PREFERENCE_SECOND_ARG:I = 0x2

.field private static final debug:Z = false

.field private static final serialVersionUID:J = -0x2fbeb1018d019700L


# instance fields
.field private functionName:Ljava/lang/String;

.field methods:[Lcom/trendmicro/hippo/MemberBox;

.field private transient overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/trendmicro/hippo/ResolvedOverload;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/MemberBox;Ljava/lang/String;)V
    .locals 2
    .param p1, "method"    # Lcom/trendmicro/hippo/MemberBox;
    .param p2, "name"    # Ljava/lang/String;

    .line 41
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 42
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->functionName:Ljava/lang/String;

    .line 43
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/trendmicro/hippo/MemberBox;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/String;)V
    .locals 1
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "name"    # Ljava/lang/String;

    .line 48
    new-instance v0, Lcom/trendmicro/hippo/MemberBox;

    invoke-direct {v0, p1}, Lcom/trendmicro/hippo/MemberBox;-><init>(Ljava/lang/reflect/Method;)V

    invoke-direct {p0, v0, p2}, Lcom/trendmicro/hippo/NativeJavaMethod;-><init>(Lcom/trendmicro/hippo/MemberBox;Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method constructor <init>([Lcom/trendmicro/hippo/MemberBox;)V
    .locals 1
    .param p1, "methods"    # [Lcom/trendmicro/hippo/MemberBox;

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 30
    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/MemberBox;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->functionName:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    .line 32
    return-void
.end method

.method constructor <init>([Lcom/trendmicro/hippo/MemberBox;Ljava/lang/String;)V
    .locals 0
    .param p1, "methods"    # [Lcom/trendmicro/hippo/MemberBox;
    .param p2, "name"    # Ljava/lang/String;

    .line 35
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 36
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->functionName:Ljava/lang/String;

    .line 37
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    .line 38
    return-void
.end method

.method static findFunction(Lcom/trendmicro/hippo/Context;[Lcom/trendmicro/hippo/MemberBox;[Ljava/lang/Object;)I
    .locals 17
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "methodsOrCtors"    # [Lcom/trendmicro/hippo/MemberBox;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 287
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    array-length v2, v0

    const/4 v3, -0x1

    if-nez v2, :cond_0

    .line 288
    return v3

    .line 289
    :cond_0
    array-length v2, v0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v2, v5, :cond_5

    .line 290
    aget-object v2, v0, v4

    .line 291
    .local v2, "member":Lcom/trendmicro/hippo/MemberBox;
    iget-object v5, v2, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 292
    .local v5, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v6, v5

    .line 294
    .local v6, "alength":I
    iget-boolean v7, v2, Lcom/trendmicro/hippo/MemberBox;->vararg:Z

    if-eqz v7, :cond_1

    .line 295
    add-int/lit8 v6, v6, -0x1

    .line 296
    array-length v7, v1

    if-le v6, v7, :cond_2

    .line 297
    return v3

    .line 300
    :cond_1
    array-length v7, v1

    if-eq v6, v7, :cond_2

    .line 301
    return v3

    .line 304
    :cond_2
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_0
    if-eq v7, v6, :cond_4

    .line 305
    aget-object v8, v1, v7

    aget-object v9, v5, v7

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeJavaObject;->canConvert(Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 308
    return v3

    .line 304
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 312
    .end local v7    # "j":I
    :cond_4
    return v4

    .line 315
    .end local v2    # "member":Lcom/trendmicro/hippo/MemberBox;
    .end local v5    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v6    # "alength":I
    :cond_5
    const/4 v2, -0x1

    .line 316
    .local v2, "firstBestFit":I
    const/4 v6, 0x0

    .line 317
    .local v6, "extraBestFits":[I
    const/4 v7, 0x0

    .line 320
    .local v7, "extraBestFitsCount":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    array-length v9, v0

    if-ge v8, v9, :cond_18

    .line 321
    aget-object v9, v0, v8

    .line 322
    .local v9, "member":Lcom/trendmicro/hippo/MemberBox;
    iget-object v10, v9, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 323
    .local v10, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v11, v10

    .line 324
    .local v11, "alength":I
    iget-boolean v12, v9, Lcom/trendmicro/hippo/MemberBox;->vararg:Z

    if-eqz v12, :cond_6

    .line 325
    add-int/lit8 v11, v11, -0x1

    .line 326
    array-length v12, v1

    if-le v11, v12, :cond_7

    .line 327
    goto/16 :goto_7

    .line 330
    :cond_6
    array-length v12, v1

    if-eq v11, v12, :cond_7

    .line 331
    goto/16 :goto_7

    .line 334
    :cond_7
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_2
    if-ge v12, v11, :cond_9

    .line 335
    aget-object v13, v1, v12

    aget-object v14, v10, v12

    invoke-static {v13, v14}, Lcom/trendmicro/hippo/NativeJavaObject;->canConvert(Ljava/lang/Object;Ljava/lang/Class;)Z

    move-result v13

    if-nez v13, :cond_8

    .line 338
    goto/16 :goto_7

    .line 334
    :cond_8
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 341
    .end local v12    # "j":I
    :cond_9
    if-gez v2, :cond_a

    .line 343
    move v2, v8

    move v4, v5

    goto/16 :goto_9

    .line 349
    :cond_a
    const/4 v12, 0x0

    .line 351
    .local v12, "betterCount":I
    const/4 v13, 0x0

    .line 353
    .local v13, "worseCount":I
    const/4 v14, -0x1

    .local v14, "j":I
    :goto_3
    if-eq v14, v7, :cond_13

    .line 355
    if-ne v14, v3, :cond_b

    .line 356
    move v15, v2

    .local v15, "bestFitIndex":I
    goto :goto_4

    .line 358
    .end local v15    # "bestFitIndex":I
    :cond_b
    aget v15, v6, v14

    .line 360
    .restart local v15    # "bestFitIndex":I
    :goto_4
    aget-object v4, v0, v15

    .line 361
    .local v4, "bestFit":Lcom/trendmicro/hippo/MemberBox;
    const/16 v3, 0xd

    move-object/from16 v5, p0

    invoke-virtual {v5, v3}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 362
    invoke-virtual {v4}, Lcom/trendmicro/hippo/MemberBox;->isPublic()Z

    move-result v3

    invoke-virtual {v9}, Lcom/trendmicro/hippo/MemberBox;->isPublic()Z

    move-result v5

    if-eq v3, v5, :cond_d

    .line 367
    invoke-virtual {v4}, Lcom/trendmicro/hippo/MemberBox;->isPublic()Z

    move-result v3

    if-nez v3, :cond_c

    .line 368
    add-int/lit8 v12, v12, 0x1

    move/from16 v16, v11

    goto :goto_5

    .line 370
    :cond_c
    add-int/lit8 v13, v13, 0x1

    move/from16 v16, v11

    goto :goto_5

    .line 372
    :cond_d
    iget-boolean v3, v9, Lcom/trendmicro/hippo/MemberBox;->vararg:Z

    iget-object v5, v4, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    move/from16 v16, v11

    .end local v11    # "alength":I
    .local v16, "alength":I
    iget-boolean v11, v4, Lcom/trendmicro/hippo/MemberBox;->vararg:Z

    invoke-static {v1, v10, v3, v5, v11}, Lcom/trendmicro/hippo/NativeJavaMethod;->preferSignature([Ljava/lang/Object;[Ljava/lang/Class;Z[Ljava/lang/Class;Z)I

    move-result v3

    .line 376
    .local v3, "preference":I
    const/4 v5, 0x3

    if-ne v3, v5, :cond_e

    .line 377
    goto :goto_6

    .line 378
    :cond_e
    const/4 v5, 0x1

    if-ne v3, v5, :cond_f

    .line 379
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 380
    :cond_f
    const/4 v5, 0x2

    if-ne v3, v5, :cond_10

    .line 381
    add-int/lit8 v13, v13, 0x1

    .line 353
    .end local v3    # "preference":I
    .end local v4    # "bestFit":Lcom/trendmicro/hippo/MemberBox;
    .end local v15    # "bestFitIndex":I
    :goto_5
    add-int/lit8 v14, v14, 0x1

    move/from16 v11, v16

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    goto :goto_3

    .line 383
    .restart local v3    # "preference":I
    .restart local v4    # "bestFit":Lcom/trendmicro/hippo/MemberBox;
    .restart local v15    # "bestFitIndex":I
    :cond_10
    if-eqz v3, :cond_11

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 389
    :cond_11
    invoke-virtual {v4}, Lcom/trendmicro/hippo/MemberBox;->isStatic()Z

    move-result v5

    if-eqz v5, :cond_15

    .line 390
    invoke-virtual {v4}, Lcom/trendmicro/hippo/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v5

    .line 391
    invoke-virtual {v9}, Lcom/trendmicro/hippo/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v11

    .line 390
    invoke-virtual {v5, v11}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 400
    const/4 v5, -0x1

    if-ne v14, v5, :cond_12

    .line 401
    move v2, v8

    const/4 v4, 0x1

    goto :goto_9

    .line 403
    :cond_12
    aput v8, v6, v14

    goto :goto_7

    .line 353
    .end local v3    # "preference":I
    .end local v4    # "bestFit":Lcom/trendmicro/hippo/MemberBox;
    .end local v15    # "bestFitIndex":I
    .end local v16    # "alength":I
    .restart local v11    # "alength":I
    :cond_13
    move/from16 v16, v11

    .line 414
    .end local v11    # "alength":I
    .end local v14    # "j":I
    .restart local v16    # "alength":I
    :goto_6
    add-int/lit8 v3, v7, 0x1

    if-ne v12, v3, :cond_14

    .line 418
    move v2, v8

    .line 419
    const/4 v3, 0x0

    move v7, v3

    const/4 v4, 0x1

    .end local v7    # "extraBestFitsCount":I
    .local v3, "extraBestFitsCount":I
    goto :goto_9

    .line 420
    .end local v3    # "extraBestFitsCount":I
    .restart local v7    # "extraBestFitsCount":I
    :cond_14
    add-int/lit8 v3, v7, 0x1

    if-ne v13, v3, :cond_16

    .line 320
    .end local v9    # "member":Lcom/trendmicro/hippo/MemberBox;
    .end local v10    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v12    # "betterCount":I
    .end local v13    # "worseCount":I
    .end local v16    # "alength":I
    :cond_15
    :goto_7
    const/4 v4, 0x1

    goto :goto_9

    .line 428
    .restart local v9    # "member":Lcom/trendmicro/hippo/MemberBox;
    .restart local v10    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v12    # "betterCount":I
    .restart local v13    # "worseCount":I
    .restart local v16    # "alength":I
    :cond_16
    if-nez v6, :cond_17

    .line 430
    array-length v3, v0

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    new-array v6, v3, [I

    goto :goto_8

    .line 428
    :cond_17
    const/4 v4, 0x1

    .line 432
    :goto_8
    aput v8, v6, v7

    .line 433
    add-int/lit8 v7, v7, 0x1

    .line 320
    .end local v9    # "member":Lcom/trendmicro/hippo/MemberBox;
    .end local v10    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v12    # "betterCount":I
    .end local v13    # "worseCount":I
    .end local v16    # "alength":I
    :goto_9
    add-int/lit8 v8, v8, 0x1

    move v5, v4

    const/4 v3, -0x1

    const/4 v4, 0x0

    goto/16 :goto_1

    .line 438
    .end local v8    # "i":I
    :cond_18
    if-gez v2, :cond_19

    .line 440
    const/4 v3, -0x1

    return v3

    .line 441
    :cond_19
    if-nez v7, :cond_1a

    .line 443
    return v2

    .line 447
    :cond_1a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 448
    .local v3, "buf":Ljava/lang/StringBuilder;
    const/4 v4, -0x1

    .local v4, "j":I
    :goto_a
    if-eq v4, v7, :cond_1c

    .line 450
    const/4 v5, -0x1

    if-ne v4, v5, :cond_1b

    .line 451
    move v8, v2

    .local v8, "bestFitIndex":I
    goto :goto_b

    .line 453
    .end local v8    # "bestFitIndex":I
    :cond_1b
    aget v8, v6, v4

    .line 455
    .restart local v8    # "bestFitIndex":I
    :goto_b
    const-string v9, "\n    "

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    aget-object v9, v0, v8

    invoke-virtual {v9}, Lcom/trendmicro/hippo/MemberBox;->toJavaDeclaration()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    .end local v8    # "bestFitIndex":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 459
    .end local v4    # "j":I
    :cond_1c
    aget-object v4, v0, v2

    .line 460
    .local v4, "firstFitMember":Lcom/trendmicro/hippo/MemberBox;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/MemberBox;->getName()Ljava/lang/String;

    move-result-object v5

    .line 461
    .local v5, "memberName":Ljava/lang/String;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    .line 463
    .local v8, "memberClass":Ljava/lang/String;
    const/4 v9, 0x0

    aget-object v9, v0, v9

    invoke-virtual {v9}, Lcom/trendmicro/hippo/MemberBox;->isCtor()Z

    move-result v9

    if-eqz v9, :cond_1d

    .line 464
    nop

    .line 466
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 464
    const-string v11, "msg.constructor.ambiguous"

    invoke-static {v11, v5, v9, v10}, Lcom/trendmicro/hippo/Context;->reportRuntimeError3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v9

    throw v9

    .line 468
    :cond_1d
    nop

    .line 470
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 468
    const-string v11, "msg.method.ambiguous"

    invoke-static {v11, v8, v5, v9, v10}, Lcom/trendmicro/hippo/Context;->reportRuntimeError4(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v9

    throw v9
.end method

.method private static preferSignature([Ljava/lang/Object;[Ljava/lang/Class;Z[Ljava/lang/Class;Z)I
    .locals 9
    .param p0, "args"    # [Ljava/lang/Object;
    .param p2, "vararg1"    # Z
    .param p4, "vararg2"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Class<",
            "*>;Z[",
            "Ljava/lang/Class<",
            "*>;Z)I"
        }
    .end annotation

    .line 491
    .local p1, "sig1":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local p3, "sig2":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 492
    .local v0, "totalPreference":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_9

    .line 493
    if-eqz p2, :cond_0

    array-length v2, p1

    if-lt v1, v2, :cond_0

    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    aget-object v2, p1, v2

    goto :goto_1

    :cond_0
    aget-object v2, p1, v1

    .line 494
    .local v2, "type1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    if-eqz p4, :cond_1

    array-length v3, p3

    if-lt v1, v3, :cond_1

    array-length v3, p3

    add-int/lit8 v3, v3, -0x1

    aget-object v3, p3, v3

    goto :goto_2

    :cond_1
    aget-object v3, p3, v1

    .line 495
    .local v3, "type2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_2
    if-ne v2, v3, :cond_2

    .line 496
    goto :goto_4

    .line 498
    :cond_2
    aget-object v4, p0, v1

    .line 502
    .local v4, "arg":Ljava/lang/Object;
    invoke-static {v4, v2}, Lcom/trendmicro/hippo/NativeJavaObject;->getConversionWeight(Ljava/lang/Object;Ljava/lang/Class;)I

    move-result v5

    .line 503
    .local v5, "rank1":I
    invoke-static {v4, v3}, Lcom/trendmicro/hippo/NativeJavaObject;->getConversionWeight(Ljava/lang/Object;Ljava/lang/Class;)I

    move-result v6

    .line 506
    .local v6, "rank2":I
    if-ge v5, v6, :cond_3

    .line 507
    const/4 v7, 0x1

    .local v7, "preference":I
    goto :goto_3

    .line 508
    .end local v7    # "preference":I
    :cond_3
    if-le v5, v6, :cond_4

    .line 509
    const/4 v7, 0x2

    .restart local v7    # "preference":I
    goto :goto_3

    .line 512
    .end local v7    # "preference":I
    :cond_4
    if-nez v5, :cond_7

    .line 513
    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 514
    const/4 v7, 0x2

    .restart local v7    # "preference":I
    goto :goto_3

    .line 515
    .end local v7    # "preference":I
    :cond_5
    invoke-virtual {v3, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 516
    const/4 v7, 0x1

    .restart local v7    # "preference":I
    goto :goto_3

    .line 518
    .end local v7    # "preference":I
    :cond_6
    const/4 v7, 0x3

    .restart local v7    # "preference":I
    goto :goto_3

    .line 521
    .end local v7    # "preference":I
    :cond_7
    const/4 v7, 0x3

    .line 525
    .restart local v7    # "preference":I
    :goto_3
    or-int/2addr v0, v7

    .line 527
    const/4 v8, 0x3

    if-ne v0, v8, :cond_8

    .line 528
    goto :goto_5

    .line 492
    .end local v2    # "type1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "type2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "arg":Ljava/lang/Object;
    .end local v5    # "rank1":I
    .end local v6    # "rank2":I
    .end local v7    # "preference":I
    :cond_8
    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 531
    .end local v1    # "j":I
    :cond_9
    :goto_5
    return v0
.end method

.method private static printDebug(Ljava/lang/String;Lcom/trendmicro/hippo/MemberBox;[Ljava/lang/Object;)V
    .locals 0
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "member"    # Lcom/trendmicro/hippo/MemberBox;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 555
    return-void
.end method

.method static scriptSignature([Ljava/lang/Object;)Ljava/lang/String;
    .locals 5
    .param p0, "values"    # [Ljava/lang/Object;

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .local v0, "sig":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-eq v1, v2, :cond_9

    .line 61
    aget-object v2, p0, v1

    .line 64
    .local v2, "value":Ljava/lang/Object;
    if-nez v2, :cond_0

    .line 65
    const-string v3, "null"

    .local v3, "s":Ljava/lang/String;
    goto :goto_1

    .line 66
    .end local v3    # "s":Ljava/lang/String;
    :cond_0
    instance-of v3, v2, Ljava/lang/Boolean;

    if-eqz v3, :cond_1

    .line 67
    const-string v3, "boolean"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1

    .line 68
    .end local v3    # "s":Ljava/lang/String;
    :cond_1
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 69
    const-string v3, "string"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1

    .line 70
    .end local v3    # "s":Ljava/lang/String;
    :cond_2
    instance-of v3, v2, Ljava/lang/Number;

    if-eqz v3, :cond_3

    .line 71
    const-string v3, "number"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1

    .line 72
    .end local v3    # "s":Ljava/lang/String;
    :cond_3
    instance-of v3, v2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v3, :cond_7

    .line 73
    instance-of v3, v2, Lcom/trendmicro/hippo/Undefined;

    if-eqz v3, :cond_4

    .line 74
    const-string v3, "undefined"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1

    .line 75
    .end local v3    # "s":Ljava/lang/String;
    :cond_4
    instance-of v3, v2, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v3, :cond_5

    .line 76
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v3}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v3

    .line 77
    .local v3, "wrapped":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 78
    .local v3, "s":Ljava/lang/String;
    goto :goto_1

    .end local v3    # "s":Ljava/lang/String;
    :cond_5
    instance-of v3, v2, Lcom/trendmicro/hippo/Function;

    if-eqz v3, :cond_6

    .line 79
    const-string v3, "function"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1

    .line 81
    .end local v3    # "s":Ljava/lang/String;
    :cond_6
    const-string v3, "object"

    .restart local v3    # "s":Ljava/lang/String;
    goto :goto_1

    .line 84
    .end local v3    # "s":Ljava/lang/String;
    :cond_7
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Lcom/trendmicro/hippo/JavaMembers;->javaSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    .line 87
    .restart local v3    # "s":Ljava/lang/String;
    :goto_1
    if-eqz v1, :cond_8

    .line 88
    const/16 v4, 0x2c

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 90
    :cond_8
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .end local v2    # "value":Ljava/lang/Object;
    .end local v3    # "s":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 92
    .end local v1    # "i":I
    :cond_9
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 136
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    array-length v0, v0

    if-eqz v0, :cond_d

    .line 140
    invoke-virtual {p0, p1, p4}, Lcom/trendmicro/hippo/NativeJavaMethod;->findCachedFunction(Lcom/trendmicro/hippo/Context;[Ljava/lang/Object;)I

    move-result v0

    .line 141
    .local v0, "index":I
    if-ltz v0, :cond_c

    .line 148
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    aget-object v1, v1, v0

    .line 149
    .local v1, "meth":Lcom/trendmicro/hippo/MemberBox;
    iget-object v2, v1, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    .line 151
    .local v2, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    iget-boolean v3, v1, Lcom/trendmicro/hippo/MemberBox;->vararg:Z

    if-eqz v3, :cond_4

    .line 153
    array-length v3, v2

    new-array v3, v3, [Ljava/lang/Object;

    .line 154
    .local v3, "newArgs":[Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v2

    add-int/lit8 v5, v5, -0x1

    if-ge v4, v5, :cond_0

    .line 155
    aget-object v5, p4, v4

    aget-object v6, v2, v4

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v3, v4

    .line 154
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 162
    .end local v4    # "i":I
    :cond_0
    array-length v4, p4

    array-length v5, v2

    if-ne v4, v5, :cond_2

    array-length v4, p4

    add-int/lit8 v4, v4, -0x1

    aget-object v4, p4, v4

    if-eqz v4, :cond_1

    array-length v4, p4

    add-int/lit8 v4, v4, -0x1

    aget-object v4, p4, v4

    instance-of v4, v4, Lcom/trendmicro/hippo/NativeArray;

    if-nez v4, :cond_1

    array-length v4, p4

    add-int/lit8 v4, v4, -0x1

    aget-object v4, p4, v4

    instance-of v4, v4, Lcom/trendmicro/hippo/NativeJavaArray;

    if-eqz v4, :cond_2

    .line 168
    :cond_1
    array-length v4, p4

    add-int/lit8 v4, v4, -0x1

    aget-object v4, p4, v4

    array-length v5, v2

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v2, v5

    invoke-static {v4, v5}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    .local v4, "varArgs":Ljava/lang/Object;
    goto :goto_2

    .line 172
    .end local v4    # "varArgs":Ljava/lang/Object;
    :cond_2
    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    aget-object v4, v2, v4

    .line 173
    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    .line 174
    .local v4, "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    array-length v5, p4

    array-length v6, v2

    sub-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    invoke-static {v4, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v5

    .line 176
    .local v5, "varArgs":Ljava/lang/Object;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-static {v5}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v7

    if-ge v6, v7, :cond_3

    .line 177
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    add-int/2addr v7, v6

    aget-object v7, p4, v7

    invoke-static {v7, v4}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    .line 179
    .local v7, "value":Ljava/lang/Object;
    invoke-static {v5, v6, v7}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 176
    .end local v7    # "value":Ljava/lang/Object;
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_3
    move-object v4, v5

    .line 184
    .end local v5    # "varArgs":Ljava/lang/Object;
    .end local v6    # "i":I
    .local v4, "varArgs":Ljava/lang/Object;
    :goto_2
    array-length v5, v2

    add-int/lit8 v5, v5, -0x1

    aput-object v4, v3, v5

    .line 186
    move-object p4, v3

    .line 187
    .end local v3    # "newArgs":[Ljava/lang/Object;
    .end local v4    # "varArgs":Ljava/lang/Object;
    goto :goto_4

    .line 189
    :cond_4
    move-object v3, p4

    .line 190
    .local v3, "origArgs":[Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    array-length v5, p4

    if-ge v4, v5, :cond_7

    .line 191
    aget-object v5, p4, v4

    .line 192
    .local v5, "arg":Ljava/lang/Object;
    aget-object v6, v2, v4

    invoke-static {v5, v6}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    .line 193
    .local v6, "coerced":Ljava/lang/Object;
    if-eq v6, v5, :cond_6

    .line 194
    if-ne v3, p4, :cond_5

    .line 195
    invoke-virtual {p4}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v7

    move-object p4, v7

    check-cast p4, [Ljava/lang/Object;

    .line 197
    :cond_5
    aput-object v6, p4, v4

    .line 190
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v6    # "coerced":Ljava/lang/Object;
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 202
    .end local v3    # "origArgs":[Ljava/lang/Object;
    .end local v4    # "i":I
    :cond_7
    :goto_4
    invoke-virtual {v1}, Lcom/trendmicro/hippo/MemberBox;->isStatic()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 203
    const/4 v3, 0x0

    .local v3, "javaObject":Ljava/lang/Object;
    goto :goto_6

    .line 205
    .end local v3    # "javaObject":Ljava/lang/Object;
    :cond_8
    move-object v3, p3

    .line 206
    .local v3, "o":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/MemberBox;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v4

    .line 208
    .local v4, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_5
    if-eqz v3, :cond_b

    .line 213
    instance-of v5, v3, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v5, :cond_a

    .line 214
    move-object v5, v3

    check-cast v5, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v5}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v5

    .line 215
    .local v5, "javaObject":Ljava/lang/Object;
    invoke-virtual {v4, v5}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 216
    move-object v3, v5

    .line 226
    .end local v4    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "javaObject":Ljava/lang/Object;
    .local v3, "javaObject":Ljava/lang/Object;
    :goto_6
    invoke-virtual {v1, v3, p4}, Lcom/trendmicro/hippo/MemberBox;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 227
    .local v4, "retval":Ljava/lang/Object;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    .line 237
    .local v5, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getWrapFactory()Lcom/trendmicro/hippo/WrapFactory;

    move-result-object v6

    invoke-virtual {v6, p1, p2, v4, v5}, Lcom/trendmicro/hippo/WrapFactory;->wrap(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    .line 246
    .local v6, "wrapped":Ljava/lang/Object;
    if-nez v6, :cond_9

    sget-object v7, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v5, v7, :cond_9

    .line 247
    sget-object v6, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 249
    :cond_9
    return-object v6

    .line 219
    .end local v5    # "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "wrapped":Ljava/lang/Object;
    .local v3, "o":Lcom/trendmicro/hippo/Scriptable;
    .local v4, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_a
    invoke-interface {v3}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v3

    goto :goto_5

    .line 209
    :cond_b
    nop

    .line 210
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaMethod;->getFunctionName()Ljava/lang/String;

    move-result-object v5

    .line 211
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    .line 209
    const-string v8, "msg.nonjava.method"

    invoke-static {v8, v5, v6, v7}, Lcom/trendmicro/hippo/Context;->reportRuntimeError3(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v5

    throw v5

    .line 142
    .end local v1    # "meth":Lcom/trendmicro/hippo/MemberBox;
    .end local v2    # "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "o":Lcom/trendmicro/hippo/Scriptable;
    .end local v4    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_c
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    .line 143
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaMethod;->getFunctionName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0x28

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 144
    invoke-static {p4}, Lcom/trendmicro/hippo/NativeJavaMethod;->scriptSignature([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 145
    .local v2, "sig":Ljava/lang/String;
    const-string v3, "msg.java.no_such_method"

    invoke-static {v3, v2}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v3

    throw v3

    .line 137
    .end local v0    # "index":I
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "sig":Ljava/lang/String;
    :cond_d
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "No methods defined for call"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method decompile(II)Ljava/lang/String;
    .locals 3
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .local v0, "sb":Ljava/lang/StringBuilder;
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 100
    .local v1, "justbody":Z
    :goto_0
    if-nez v1, :cond_1

    .line 101
    const-string v2, "function "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaMethod;->getFunctionName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    const-string v2, "() {"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    :cond_1
    const-string v2, "/*\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeJavaMethod;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    if-eqz v1, :cond_2

    const-string v2, "*/\n"

    goto :goto_1

    :cond_2
    const-string v2, "*/}\n"

    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method findCachedFunction(Lcom/trendmicro/hippo/Context;[Ljava/lang/Object;)I
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 253
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    array-length v1, v0

    const/4 v2, 0x1

    if-le v1, v2, :cond_5

    .line 254
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    if-eqz v0, :cond_2

    .line 255
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ResolvedOverload;

    .line 256
    .local v1, "ovl":Lcom/trendmicro/hippo/ResolvedOverload;
    invoke-virtual {v1, p2}, Lcom/trendmicro/hippo/ResolvedOverload;->matches([Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 257
    iget v0, v1, Lcom/trendmicro/hippo/ResolvedOverload;->index:I

    return v0

    .line 259
    .end local v1    # "ovl":Lcom/trendmicro/hippo/ResolvedOverload;
    :cond_0
    goto :goto_0

    :cond_1
    goto :goto_1

    .line 261
    :cond_2
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 263
    :goto_1
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    invoke-static {p1, v0, p2}, Lcom/trendmicro/hippo/NativeJavaMethod;->findFunction(Lcom/trendmicro/hippo/Context;[Lcom/trendmicro/hippo/MemberBox;[Ljava/lang/Object;)I

    move-result v0

    .line 266
    .local v0, "index":I
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v1

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    if-ge v1, v2, :cond_4

    .line 267
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    monitor-enter v1

    .line 268
    :try_start_0
    new-instance v2, Lcom/trendmicro/hippo/ResolvedOverload;

    invoke-direct {v2, p2, v0}, Lcom/trendmicro/hippo/ResolvedOverload;-><init>([Ljava/lang/Object;I)V

    .line 269
    .local v2, "ovl":Lcom/trendmicro/hippo/ResolvedOverload;
    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 270
    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->overloadCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(ILjava/lang/Object;)V

    .line 272
    .end local v2    # "ovl":Lcom/trendmicro/hippo/ResolvedOverload;
    :cond_3
    monitor-exit v1

    goto :goto_2

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 274
    :cond_4
    :goto_2
    return v0

    .line 276
    .end local v0    # "index":I
    :cond_5
    invoke-static {p1, v0, p2}, Lcom/trendmicro/hippo/NativeJavaMethod;->findFunction(Lcom/trendmicro/hippo/Context;[Lcom/trendmicro/hippo/MemberBox;[Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->functionName:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v2, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    array-length v2, v2

    .local v2, "N":I
    :goto_0
    if-eq v1, v2, :cond_1

    .line 117
    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lcom/trendmicro/hippo/MemberBox;->isMethod()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 118
    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lcom/trendmicro/hippo/MemberBox;->method()Ljava/lang/reflect/Method;

    move-result-object v3

    .line 119
    .local v3, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lcom/trendmicro/hippo/JavaMembers;->javaSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    const/16 v4, 0x20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 121
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .end local v3    # "method":Ljava/lang/reflect/Method;
    goto :goto_1

    .line 123
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lcom/trendmicro/hippo/MemberBox;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    :goto_1
    iget-object v3, p0, Lcom/trendmicro/hippo/NativeJavaMethod;->methods:[Lcom/trendmicro/hippo/MemberBox;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/trendmicro/hippo/MemberBox;->argTypes:[Ljava/lang/Class;

    invoke-static {v3}, Lcom/trendmicro/hippo/JavaMembers;->liveConnectSignature([Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 115
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 128
    .end local v1    # "i":I
    .end local v2    # "N":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
