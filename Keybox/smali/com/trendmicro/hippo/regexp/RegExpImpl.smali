.class public Lcom/trendmicro/hippo/regexp/RegExpImpl;
.super Ljava/lang/Object;
.source "RegExpImpl.java"

# interfaces
.implements Lcom/trendmicro/hippo/RegExpProxy;


# instance fields
.field protected input:Ljava/lang/String;

.field protected lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

.field protected lastParen:Lcom/trendmicro/hippo/regexp/SubString;

.field protected leftContext:Lcom/trendmicro/hippo/regexp/SubString;

.field protected multiline:Z

.field protected parens:[Lcom/trendmicro/hippo/regexp/SubString;

.field protected rightContext:Lcom/trendmicro/hippo/regexp/SubString;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;IZ)Lcom/trendmicro/hippo/regexp/NativeRegExp;
    .locals 5
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "optarg"    # I
    .param p4, "forceFlat"    # Z

    .line 138
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 139
    .local v0, "topScope":Lcom/trendmicro/hippo/Scriptable;
    array-length v1, p2

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    aget-object v1, p2, v2

    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v1, v3, :cond_0

    goto :goto_1

    .line 142
    :cond_0
    aget-object v1, p2, v2

    instance-of v1, v1, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    if-eqz v1, :cond_1

    .line 143
    aget-object v1, p2, v2

    check-cast v1, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    .local v1, "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    goto :goto_2

    .line 145
    .end local v1    # "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    :cond_1
    aget-object v1, p2, v2

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 147
    .local v1, "src":Ljava/lang/String;
    array-length v3, p2

    if-ge p3, v3, :cond_2

    .line 148
    aput-object v1, p2, v2

    .line 149
    aget-object v2, p2, p3

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .local v2, "opt":Ljava/lang/String;
    goto :goto_0

    .line 151
    .end local v2    # "opt":Ljava/lang/String;
    :cond_2
    const/4 v2, 0x0

    .line 153
    .restart local v2    # "opt":Ljava/lang/String;
    :goto_0
    invoke-static {p0, v1, v2, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->compileRE(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/trendmicro/hippo/regexp/RECompiled;

    move-result-object v3

    .line 154
    .local v3, "compiled":Lcom/trendmicro/hippo/regexp/RECompiled;
    new-instance v4, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    invoke-direct {v4, v0, v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RECompiled;)V

    move-object v1, v4

    .local v4, "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    goto :goto_2

    .line 140
    .end local v1    # "src":Ljava/lang/String;
    .end local v2    # "opt":Ljava/lang/String;
    .end local v3    # "compiled":Lcom/trendmicro/hippo/regexp/RECompiled;
    .end local v4    # "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    :cond_3
    :goto_1
    const-string v1, ""

    invoke-static {p0, v1, v1, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->compileRE(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/trendmicro/hippo/regexp/RECompiled;

    move-result-object v1

    .line 141
    .local v1, "compiled":Lcom/trendmicro/hippo/regexp/RECompiled;
    new-instance v2, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    invoke-direct {v2, v0, v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RECompiled;)V

    move-object v1, v2

    .line 142
    .local v1, "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    nop

    .line 156
    :goto_2
    return-object v1
.end method

.method private static do_replace(Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/regexp/RegExpImpl;)V
    .locals 10
    .param p0, "rdata"    # Lcom/trendmicro/hippo/regexp/GlobData;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "regExpImpl"    # Lcom/trendmicro/hippo/regexp/RegExpImpl;

    .line 491
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    .line 492
    .local v0, "charBuf":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 493
    .local v1, "cp":I
    iget-object v2, p0, Lcom/trendmicro/hippo/regexp/GlobData;->repstr:Ljava/lang/String;

    .line 494
    .local v2, "da":Ljava/lang/String;
    iget v3, p0, Lcom/trendmicro/hippo/regexp/GlobData;->dollar:I

    .line 495
    .local v3, "dp":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_3

    .line 496
    const/4 v4, 0x1

    new-array v4, v4, [I

    .line 498
    .local v4, "skip":[I
    :cond_0
    sub-int v5, v3, v1

    .line 499
    .local v5, "len":I
    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 500
    move v1, v3

    .line 501
    invoke-static {p1, p2, v2, v3, v4}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->interpretDollar(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/regexp/RegExpImpl;Ljava/lang/String;I[I)Lcom/trendmicro/hippo/regexp/SubString;

    move-result-object v6

    .line 503
    .local v6, "sub":Lcom/trendmicro/hippo/regexp/SubString;
    if-eqz v6, :cond_2

    .line 504
    iget v5, v6, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    .line 505
    if-lez v5, :cond_1

    .line 506
    iget-object v7, v6, Lcom/trendmicro/hippo/regexp/SubString;->str:Ljava/lang/String;

    iget v8, v6, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    iget v9, v6, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    add-int/2addr v9, v5

    invoke-virtual {v0, v7, v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 508
    :cond_1
    const/4 v7, 0x0

    aget v8, v4, v7

    add-int/2addr v1, v8

    .line 509
    aget v7, v4, v7

    add-int/2addr v3, v7

    goto :goto_0

    .line 511
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 513
    :goto_0
    const/16 v7, 0x24

    invoke-virtual {v2, v7, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 514
    .end local v5    # "len":I
    .end local v6    # "sub":Lcom/trendmicro/hippo/regexp/SubString;
    if-gez v3, :cond_0

    .line 516
    .end local v4    # "skip":[I
    :cond_3
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    .line 517
    .local v4, "daL":I
    if-le v4, v1, :cond_4

    .line 518
    invoke-virtual {v2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 520
    :cond_4
    return-void
.end method

.method private static find_split(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILcom/trendmicro/hippo/RegExpProxy;Lcom/trendmicro/hippo/Scriptable;[I[I[Z[[Ljava/lang/String;)I
    .locals 15
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "target"    # Ljava/lang/String;
    .param p3, "separator"    # Ljava/lang/String;
    .param p4, "version"    # I
    .param p5, "reProxy"    # Lcom/trendmicro/hippo/RegExpProxy;
    .param p6, "re"    # Lcom/trendmicro/hippo/Scriptable;
    .param p7, "ip"    # [I
    .param p8, "matchlen"    # [I
    .param p9, "matched"    # [Z
    .param p10, "parensp"    # [[Ljava/lang/String;

    .line 639
    move-object/from16 v10, p2

    move-object/from16 v11, p3

    move/from16 v12, p4

    const/4 v0, 0x0

    aget v13, p7, v0

    .line 640
    .local v13, "i":I
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v14

    .line 647
    .local v14, "length":I
    const/16 v1, 0x78

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-ne v12, v1, :cond_5

    if-nez p6, :cond_5

    .line 648
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v4, v3, :cond_5

    invoke-virtual {v11, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x20

    if-ne v4, v5, :cond_5

    .line 651
    if-nez v13, :cond_1

    .line 652
    :goto_0
    if-ge v13, v14, :cond_0

    invoke-virtual {v10, v13}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 653
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 654
    :cond_0
    aput v13, p7, v0

    .line 658
    :cond_1
    if-ne v13, v14, :cond_2

    .line 659
    return v2

    .line 662
    :cond_2
    :goto_1
    if-ge v13, v14, :cond_3

    .line 663
    invoke-virtual {v10, v13}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_3

    .line 664
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 667
    :cond_3
    move v1, v13

    .line 668
    .local v1, "j":I
    :goto_2
    if-ge v1, v14, :cond_4

    invoke-virtual {v10, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 669
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 672
    :cond_4
    sub-int v2, v1, v13

    aput v2, p8, v0

    .line 673
    return v13

    .line 686
    .end local v1    # "j":I
    :cond_5
    if-le v13, v14, :cond_6

    .line 687
    return v2

    .line 694
    :cond_6
    if-eqz p6, :cond_7

    .line 695
    move-object/from16 v0, p5

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    invoke-interface/range {v0 .. v9}, Lcom/trendmicro/hippo/RegExpProxy;->find_split(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;[I[I[Z[[Ljava/lang/String;)I

    move-result v0

    return v0

    .line 704
    :cond_7
    if-eqz v12, :cond_8

    const/16 v4, 0x82

    if-ge v12, v4, :cond_8

    if-nez v14, :cond_8

    .line 706
    return v2

    .line 718
    :cond_8
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_c

    .line 719
    if-ne v12, v1, :cond_a

    .line 720
    if-ne v13, v14, :cond_9

    .line 721
    aput v3, p8, v0

    .line 722
    return v13

    .line 724
    :cond_9
    add-int/lit8 v0, v13, 0x1

    return v0

    .line 726
    :cond_a
    if-ne v13, v14, :cond_b

    goto :goto_3

    :cond_b
    add-int/lit8 v2, v13, 0x1

    :goto_3
    return v2

    .line 732
    :cond_c
    aget v1, p7, v0

    if-lt v1, v14, :cond_d

    .line 733
    return v14

    .line 735
    :cond_d
    aget v0, p7, v0

    invoke-virtual {v10, v11, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 737
    .end local v13    # "i":I
    .local v0, "i":I
    if-eq v0, v2, :cond_e

    move v1, v0

    goto :goto_4

    :cond_e
    move v1, v14

    :goto_4
    return v1
.end method

.method private static interpretDollar(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/regexp/RegExpImpl;Ljava/lang/String;I[I)Lcom/trendmicro/hippo/regexp/SubString;
    .locals 10
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "res"    # Lcom/trendmicro/hippo/regexp/RegExpImpl;
    .param p2, "da"    # Ljava/lang/String;
    .param p3, "dp"    # I
    .param p4, "skip"    # [I

    .line 401
    invoke-virtual {p2, p3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x24

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 404
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    .line 405
    .local v0, "version":I
    const/16 v2, 0x8c

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    if-gt v0, v2, :cond_1

    .line 408
    if-lez p3, :cond_1

    add-int/lit8 v4, p3, -0x1

    invoke-virtual {p2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x5c

    if-ne v4, v5, :cond_1

    .line 409
    return-object v3

    .line 411
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    .line 412
    .local v4, "daL":I
    add-int/lit8 v5, p3, 0x1

    if-lt v5, v4, :cond_2

    .line 413
    return-object v3

    .line 415
    :cond_2
    add-int/lit8 v5, p3, 0x1

    invoke-virtual {p2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 416
    .local v5, "dc":C
    invoke-static {v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isDigit(C)Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_b

    .line 418
    if-eqz v0, :cond_5

    if-gt v0, v2, :cond_5

    .line 421
    const/16 v1, 0x30

    if-ne v5, v1, :cond_3

    .line 422
    return-object v3

    .line 424
    :cond_3
    const/4 v1, 0x0

    .line 425
    .local v1, "num":I
    move v2, p3

    .line 426
    .local v2, "cp":I
    :goto_0
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v4, :cond_a

    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    move v5, v3

    invoke-static {v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 428
    mul-int/lit8 v3, v1, 0xa

    add-int/lit8 v6, v5, -0x30

    add-int/2addr v3, v6

    .line 429
    .local v3, "tmp":I
    if-ge v3, v1, :cond_4

    .line 430
    goto :goto_2

    .line 431
    :cond_4
    move v1, v3

    goto :goto_0

    .line 435
    .end local v1    # "num":I
    .end local v2    # "cp":I
    .end local v3    # "tmp":I
    :cond_5
    iget-object v1, p1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->parens:[Lcom/trendmicro/hippo/regexp/SubString;

    if-nez v1, :cond_6

    move v1, v7

    goto :goto_1

    :cond_6
    array-length v1, v1

    .line 436
    .local v1, "parenCount":I
    :goto_1
    add-int/lit8 v2, v5, -0x30

    .line 437
    .local v2, "num":I
    if-le v2, v1, :cond_7

    .line 438
    return-object v3

    .line 439
    :cond_7
    add-int/lit8 v6, p3, 0x2

    .line 440
    .local v6, "cp":I
    add-int/lit8 v8, p3, 0x2

    if-ge v8, v4, :cond_8

    .line 441
    add-int/lit8 v8, p3, 0x2

    invoke-virtual {p2, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 442
    invoke-static {v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isDigit(C)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 443
    mul-int/lit8 v8, v2, 0xa

    add-int/lit8 v9, v5, -0x30

    add-int/2addr v8, v9

    .line 444
    .local v8, "tmp":I
    if-gt v8, v1, :cond_8

    .line 445
    add-int/lit8 v6, v6, 0x1

    .line 446
    move v2, v8

    .line 450
    .end local v8    # "tmp":I
    :cond_8
    if-nez v2, :cond_9

    return-object v3

    :cond_9
    move v1, v2

    move v2, v6

    .line 453
    .end local v6    # "cp":I
    .local v1, "num":I
    .local v2, "cp":I
    :cond_a
    :goto_2
    add-int/lit8 v1, v1, -0x1

    .line 454
    sub-int v3, v2, p3

    aput v3, p4, v7

    .line 455
    invoke-virtual {p1, v1}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->getParenSubString(I)Lcom/trendmicro/hippo/regexp/SubString;

    move-result-object v3

    return-object v3

    .line 458
    .end local v1    # "num":I
    .end local v2    # "cp":I
    :cond_b
    const/4 v2, 0x2

    aput v2, p4, v7

    .line 459
    if-eq v5, v1, :cond_11

    const/16 v1, 0x2b

    if-eq v5, v1, :cond_10

    const/16 v1, 0x60

    if-eq v5, v1, :cond_e

    const/16 v1, 0x26

    if-eq v5, v1, :cond_d

    const/16 v1, 0x27

    if-eq v5, v1, :cond_c

    .line 482
    return-object v3

    .line 480
    :cond_c
    iget-object v1, p1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->rightContext:Lcom/trendmicro/hippo/regexp/SubString;

    return-object v1

    .line 463
    :cond_d
    iget-object v1, p1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    return-object v1

    .line 467
    :cond_e
    const/16 v1, 0x78

    if-ne v0, v1, :cond_f

    .line 475
    iget-object v1, p1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    iput v7, v1, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    .line 476
    iget-object v1, p1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    iget-object v2, p1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    iget v2, v2, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    iput v2, v1, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    .line 478
    :cond_f
    iget-object v1, p1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    return-object v1

    .line 465
    :cond_10
    iget-object v1, p1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastParen:Lcom/trendmicro/hippo/regexp/SubString;

    return-object v1

    .line 461
    :cond_11
    new-instance v1, Lcom/trendmicro/hippo/regexp/SubString;

    const-string v2, "$"

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/regexp/SubString;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method private static matchOrReplace(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/regexp/RegExpImpl;Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/regexp/NativeRegExp;)Ljava/lang/Object;
    .locals 19
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "reImpl"    # Lcom/trendmicro/hippo/regexp/RegExpImpl;
    .param p5, "data"    # Lcom/trendmicro/hippo/regexp/GlobData;
    .param p6, "re"    # Lcom/trendmicro/hippo/regexp/NativeRegExp;

    .line 167
    move-object/from16 v7, p4

    move-object/from16 v8, p5

    iget-object v9, v8, Lcom/trendmicro/hippo/regexp/GlobData;->str:Ljava/lang/String;

    .line 168
    .local v9, "str":Ljava/lang/String;
    invoke-virtual/range {p6 .. p6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getFlags()I

    move-result v0

    const/4 v10, 0x1

    and-int/2addr v0, v10

    const/4 v11, 0x0

    if-eqz v0, :cond_0

    move v0, v10

    goto :goto_0

    :cond_0
    move v0, v11

    :goto_0
    iput-boolean v0, v8, Lcom/trendmicro/hippo/regexp/GlobData;->global:Z

    .line 169
    new-array v0, v10, [I

    aput v11, v0, v11

    move-object v12, v0

    .line 170
    .local v12, "indexp":[I
    const/4 v13, 0x0

    .line 171
    .local v13, "result":Ljava/lang/Object;
    iget v0, v8, Lcom/trendmicro/hippo/regexp/GlobData;->mode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 172
    const/4 v6, 0x0

    move-object/from16 v0, p6

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p4

    move-object v4, v9

    move-object v5, v12

    invoke-virtual/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->executeRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v0

    .line 174
    .end local v13    # "result":Ljava/lang/Object;
    .local v0, "result":Ljava/lang/Object;
    if-eqz v0, :cond_1

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 175
    iget-object v1, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object/from16 v15, p6

    goto/16 :goto_5

    .line 177
    :cond_1
    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object/from16 v15, p6

    goto/16 :goto_5

    .line 178
    .end local v0    # "result":Ljava/lang/Object;
    .restart local v13    # "result":Ljava/lang/Object;
    :cond_2
    iget-boolean v0, v8, Lcom/trendmicro/hippo/regexp/GlobData;->global:Z

    const/4 v14, 0x2

    if-eqz v0, :cond_a

    .line 179
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    move-object/from16 v15, p6

    iput-object v0, v15, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 180
    const/4 v0, 0x0

    move-object/from16 v16, v13

    move v13, v0

    .local v13, "count":I
    .local v16, "result":Ljava/lang/Object;
    :goto_1
    aget v0, v12, v11

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v0, v1, :cond_9

    .line 181
    const/4 v6, 0x0

    move-object/from16 v0, p6

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p4

    move-object v4, v9

    move-object v5, v12

    invoke-virtual/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->executeRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v6

    .line 183
    .end local v16    # "result":Ljava/lang/Object;
    .local v6, "result":Ljava/lang/Object;
    if-eqz v6, :cond_8

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 184
    goto :goto_3

    .line 185
    :cond_3
    iget v0, v8, Lcom/trendmicro/hippo/regexp/GlobData;->mode:I

    if-ne v0, v10, :cond_4

    .line 186
    move-object/from16 v5, p0

    move-object/from16 v4, p1

    invoke-static {v8, v5, v4, v13, v7}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->match_glob(Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILcom/trendmicro/hippo/regexp/RegExpImpl;)V

    goto :goto_2

    .line 188
    :cond_4
    move-object/from16 v5, p0

    move-object/from16 v4, p1

    iget v0, v8, Lcom/trendmicro/hippo/regexp/GlobData;->mode:I

    if-eq v0, v14, :cond_5

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 189
    :cond_5
    iget-object v3, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    .line 190
    .local v3, "lastMatch":Lcom/trendmicro/hippo/regexp/SubString;
    iget v2, v8, Lcom/trendmicro/hippo/regexp/GlobData;->leftIndex:I

    .line 191
    .local v2, "leftIndex":I
    iget v0, v3, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    sub-int v16, v0, v2

    .line 192
    .local v16, "leftlen":I
    iget v0, v3, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    iget v1, v3, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    add-int/2addr v0, v1

    iput v0, v8, Lcom/trendmicro/hippo/regexp/GlobData;->leftIndex:I

    .line 193
    move-object/from16 v0, p5

    move-object/from16 v1, p0

    move/from16 v17, v2

    .end local v2    # "leftIndex":I
    .local v17, "leftIndex":I
    move-object/from16 v2, p1

    move-object/from16 v18, v3

    .end local v3    # "lastMatch":Lcom/trendmicro/hippo/regexp/SubString;
    .local v18, "lastMatch":Lcom/trendmicro/hippo/regexp/SubString;
    move-object/from16 v3, p4

    move/from16 v4, v17

    move/from16 v5, v16

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->replace_glob(Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RegExpImpl;II)V

    .line 195
    .end local v16    # "leftlen":I
    .end local v17    # "leftIndex":I
    .end local v18    # "lastMatch":Lcom/trendmicro/hippo/regexp/SubString;
    :goto_2
    iget-object v0, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    iget v0, v0, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    if-nez v0, :cond_7

    .line 196
    aget v0, v12, v11

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v0, v1, :cond_6

    .line 197
    goto :goto_3

    .line 198
    :cond_6
    aget v0, v12, v11

    add-int/2addr v0, v10

    aput v0, v12, v11

    .line 180
    :cond_7
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v16, v6

    goto :goto_1

    .end local v13    # "count":I
    :cond_8
    :goto_3
    move-object v0, v6

    goto :goto_5

    .end local v6    # "result":Ljava/lang/Object;
    .restart local v13    # "count":I
    .local v16, "result":Ljava/lang/Object;
    :cond_9
    move-object/from16 v0, v16

    goto :goto_5

    .line 202
    .end local v16    # "result":Ljava/lang/Object;
    .local v13, "result":Ljava/lang/Object;
    :cond_a
    move-object/from16 v15, p6

    .line 203
    iget v0, v8, Lcom/trendmicro/hippo/regexp/GlobData;->mode:I

    if-ne v0, v14, :cond_b

    .line 204
    move v6, v11

    goto :goto_4

    .line 205
    :cond_b
    move v6, v10

    .line 202
    :goto_4
    move-object/from16 v0, p6

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p4

    move-object v4, v9

    move-object v5, v12

    invoke-virtual/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->executeRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v0

    .line 208
    .end local v13    # "result":Ljava/lang/Object;
    .restart local v0    # "result":Ljava/lang/Object;
    :goto_5
    return-object v0
.end method

.method private static match_glob(Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ILcom/trendmicro/hippo/regexp/RegExpImpl;)V
    .locals 4
    .param p0, "mdata"    # Lcom/trendmicro/hippo/regexp/GlobData;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "count"    # I
    .param p4, "reImpl"    # Lcom/trendmicro/hippo/regexp/RegExpImpl;

    .line 307
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/GlobData;->arrayobj:Lcom/trendmicro/hippo/Scriptable;

    if-nez v0, :cond_0

    .line 308
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/GlobData;->arrayobj:Lcom/trendmicro/hippo/Scriptable;

    .line 310
    :cond_0
    iget-object v0, p4, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    .line 311
    .local v0, "matchsub":Lcom/trendmicro/hippo/regexp/SubString;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v1

    .line 312
    .local v1, "matchstr":Ljava/lang/String;
    iget-object v2, p0, Lcom/trendmicro/hippo/regexp/GlobData;->arrayobj:Lcom/trendmicro/hippo/Scriptable;

    iget-object v3, p0, Lcom/trendmicro/hippo/regexp/GlobData;->arrayobj:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v2, p3, v3, v1}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 313
    return-void
.end method

.method private static replace_glob(Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RegExpImpl;II)V
    .locals 8
    .param p0, "rdata"    # Lcom/trendmicro/hippo/regexp/GlobData;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "reImpl"    # Lcom/trendmicro/hippo/regexp/RegExpImpl;
    .param p4, "leftIndex"    # I
    .param p5, "leftlen"    # I

    .line 324
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/GlobData;->lambda:Lcom/trendmicro/hippo/Function;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 327
    iget-object v0, p3, Lcom/trendmicro/hippo/regexp/RegExpImpl;->parens:[Lcom/trendmicro/hippo/regexp/SubString;

    .line 328
    .local v0, "parens":[Lcom/trendmicro/hippo/regexp/SubString;
    if-nez v0, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    array-length v2, v0

    .line 329
    .local v2, "parenCount":I
    :goto_0
    add-int/lit8 v3, v2, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    .line 330
    .local v3, "args":[Ljava/lang/Object;
    iget-object v4, p3, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    .line 331
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_2

    .line 332
    aget-object v4, v0, v1

    .line 333
    .local v4, "sub":Lcom/trendmicro/hippo/regexp/SubString;
    if-eqz v4, :cond_1

    .line 334
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v4}, Lcom/trendmicro/hippo/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    goto :goto_2

    .line 336
    :cond_1
    add-int/lit8 v5, v1, 0x1

    sget-object v6, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aput-object v6, v3, v5

    .line 331
    .end local v4    # "sub":Lcom/trendmicro/hippo/regexp/SubString;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 339
    .end local v1    # "i":I
    :cond_2
    add-int/lit8 v1, v2, 0x1

    iget-object v4, p3, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    iget v4, v4, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    .line 340
    add-int/lit8 v1, v2, 0x2

    iget-object v4, p0, Lcom/trendmicro/hippo/regexp/GlobData;->str:Ljava/lang/String;

    aput-object v4, v3, v1

    .line 345
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v1

    if-eq p3, v1, :cond_3

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 346
    :cond_3
    new-instance v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;

    invoke-direct {v1}, Lcom/trendmicro/hippo/regexp/RegExpImpl;-><init>()V

    .line 347
    .local v1, "re2":Lcom/trendmicro/hippo/regexp/RegExpImpl;
    iget-boolean v4, p3, Lcom/trendmicro/hippo/regexp/RegExpImpl;->multiline:Z

    iput-boolean v4, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->multiline:Z

    .line 348
    iget-object v4, p3, Lcom/trendmicro/hippo/regexp/RegExpImpl;->input:Ljava/lang/String;

    iput-object v4, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->input:Ljava/lang/String;

    .line 349
    invoke-static {p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->setRegExpProxy(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/RegExpProxy;)V

    .line 351
    :try_start_0
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 352
    .local v4, "parent":Lcom/trendmicro/hippo/Scriptable;
    iget-object v5, p0, Lcom/trendmicro/hippo/regexp/GlobData;->lambda:Lcom/trendmicro/hippo/Function;

    invoke-interface {v5, p1, v4, v4, v3}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 353
    .local v5, "result":Ljava/lang/Object;
    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v4, v6

    .line 355
    .end local v5    # "result":Ljava/lang/Object;
    .local v4, "lambdaStr":Ljava/lang/String;
    invoke-static {p1, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->setRegExpProxy(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/RegExpProxy;)V

    .line 356
    nop

    .line 357
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    .line 358
    .end local v1    # "re2":Lcom/trendmicro/hippo/regexp/RegExpImpl;
    .end local v2    # "parenCount":I
    .end local v3    # "args":[Ljava/lang/Object;
    .local v0, "replen":I
    goto :goto_4

    .line 355
    .end local v4    # "lambdaStr":Ljava/lang/String;
    .local v0, "parens":[Lcom/trendmicro/hippo/regexp/SubString;
    .restart local v1    # "re2":Lcom/trendmicro/hippo/regexp/RegExpImpl;
    .restart local v2    # "parenCount":I
    .restart local v3    # "args":[Ljava/lang/Object;
    :catchall_0
    move-exception v4

    invoke-static {p1, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->setRegExpProxy(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/RegExpProxy;)V

    .line 356
    throw v4

    .line 359
    .end local v0    # "parens":[Lcom/trendmicro/hippo/regexp/SubString;
    .end local v1    # "re2":Lcom/trendmicro/hippo/regexp/RegExpImpl;
    .end local v2    # "parenCount":I
    .end local v3    # "args":[Ljava/lang/Object;
    :cond_4
    const/4 v4, 0x0

    .line 360
    .restart local v4    # "lambdaStr":Ljava/lang/String;
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/GlobData;->repstr:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 361
    .local v0, "replen":I
    iget v2, p0, Lcom/trendmicro/hippo/regexp/GlobData;->dollar:I

    if-ltz v2, :cond_7

    .line 362
    const/4 v2, 0x1

    new-array v2, v2, [I

    .line 363
    .local v2, "skip":[I
    iget v3, p0, Lcom/trendmicro/hippo/regexp/GlobData;->dollar:I

    .line 365
    .local v3, "dp":I
    :cond_5
    iget-object v5, p0, Lcom/trendmicro/hippo/regexp/GlobData;->repstr:Ljava/lang/String;

    invoke-static {p1, p3, v5, v3, v2}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->interpretDollar(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/regexp/RegExpImpl;Ljava/lang/String;I[I)Lcom/trendmicro/hippo/regexp/SubString;

    move-result-object v5

    .line 367
    .local v5, "sub":Lcom/trendmicro/hippo/regexp/SubString;
    if-eqz v5, :cond_6

    .line 368
    iget v6, v5, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    aget v7, v2, v1

    sub-int/2addr v6, v7

    add-int/2addr v0, v6

    .line 369
    aget v6, v2, v1

    add-int/2addr v3, v6

    goto :goto_3

    .line 371
    :cond_6
    add-int/lit8 v3, v3, 0x1

    .line 373
    :goto_3
    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/GlobData;->repstr:Ljava/lang/String;

    const/16 v7, 0x24

    invoke-virtual {v6, v7, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 374
    .end local v5    # "sub":Lcom/trendmicro/hippo/regexp/SubString;
    if-gez v3, :cond_5

    .line 378
    .end local v2    # "skip":[I
    .end local v3    # "dp":I
    :cond_7
    :goto_4
    add-int v1, p5, v0

    iget-object v2, p3, Lcom/trendmicro/hippo/regexp/RegExpImpl;->rightContext:Lcom/trendmicro/hippo/regexp/SubString;

    iget v2, v2, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    add-int/2addr v1, v2

    .line 379
    .local v1, "growth":I
    iget-object v2, p0, Lcom/trendmicro/hippo/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    .line 380
    .local v2, "charBuf":Ljava/lang/StringBuilder;
    if-nez v2, :cond_8

    .line 381
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object v2, v3

    .line 382
    iput-object v2, p0, Lcom/trendmicro/hippo/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    goto :goto_5

    .line 384
    :cond_8
    iget-object v3, p0, Lcom/trendmicro/hippo/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/2addr v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    .line 387
    :goto_5
    iget-object v3, p3, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    iget-object v3, v3, Lcom/trendmicro/hippo/regexp/SubString;->str:Ljava/lang/String;

    add-int v5, p4, p5

    invoke-virtual {v2, v3, p4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 388
    iget-object v3, p0, Lcom/trendmicro/hippo/regexp/GlobData;->lambda:Lcom/trendmicro/hippo/Function;

    if-eqz v3, :cond_9

    .line 389
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6

    .line 391
    :cond_9
    invoke-static {p0, p1, p3}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->do_replace(Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/regexp/RegExpImpl;)V

    .line 393
    :goto_6
    return-void
.end method


# virtual methods
.method public action(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 21
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;
    .param p5, "actionType"    # I

    .line 46
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p4

    move/from16 v11, p5

    new-instance v0, Lcom/trendmicro/hippo/regexp/GlobData;

    invoke-direct {v0}, Lcom/trendmicro/hippo/regexp/GlobData;-><init>()V

    move-object v12, v0

    .line 47
    .local v12, "data":Lcom/trendmicro/hippo/regexp/GlobData;
    iput v11, v12, Lcom/trendmicro/hippo/regexp/GlobData;->mode:I

    .line 48
    invoke-static/range {p3 .. p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v12, Lcom/trendmicro/hippo/regexp/GlobData;->str:Ljava/lang/String;

    .line 50
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq v11, v1, :cond_f

    const/4 v2, 0x2

    if-eq v11, v2, :cond_1

    const/4 v2, 0x3

    if-ne v11, v2, :cond_0

    .line 61
    invoke-static {v8, v9, v10, v1, v0}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->createRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;IZ)Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move-result-object v13

    .line 62
    .local v13, "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p0

    move-object v5, v12

    move-object v6, v13

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->matchOrReplace(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/regexp/RegExpImpl;Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/regexp/NativeRegExp;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 129
    .end local v13    # "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 68
    :cond_1
    array-length v3, v10

    if-lez v3, :cond_2

    aget-object v3, v10, v0

    instance-of v3, v3, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    if-nez v3, :cond_3

    :cond_2
    array-length v3, v10

    if-le v3, v2, :cond_4

    :cond_3
    move v3, v1

    goto :goto_0

    :cond_4
    move v3, v0

    :goto_0
    move v13, v3

    .line 70
    .local v13, "useRE":Z
    const/4 v3, 0x0

    .line 71
    .local v3, "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    const/4 v4, 0x0

    .line 72
    .local v4, "search":Ljava/lang/String;
    if-eqz v13, :cond_5

    .line 73
    invoke-static {v8, v9, v10, v2, v1}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->createRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;IZ)Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move-result-object v3

    move-object v14, v3

    move-object v15, v4

    goto :goto_2

    .line 75
    :cond_5
    array-length v5, v10

    if-ge v5, v1, :cond_6

    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1

    :cond_6
    aget-object v5, v10, v0

    .line 76
    .local v5, "arg0":Ljava/lang/Object;
    :goto_1
    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object v14, v3

    move-object v15, v4

    .line 79
    .end local v3    # "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    .end local v4    # "search":Ljava/lang/String;
    .end local v5    # "arg0":Ljava/lang/Object;
    .local v14, "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    .local v15, "search":Ljava/lang/String;
    :goto_2
    array-length v3, v10

    if-ge v3, v2, :cond_7

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_3

    :cond_7
    aget-object v1, v10, v1

    :goto_3
    move-object v6, v1

    .line 80
    .local v6, "arg1":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 81
    .local v1, "repstr":Ljava/lang/String;
    const/4 v2, 0x0

    .line 82
    .local v2, "lambda":Lcom/trendmicro/hippo/Function;
    instance-of v3, v6, Lcom/trendmicro/hippo/Function;

    if-eqz v3, :cond_8

    .line 83
    move-object v2, v6

    check-cast v2, Lcom/trendmicro/hippo/Function;

    move-object v5, v1

    move-object v4, v2

    goto :goto_4

    .line 85
    :cond_8
    invoke-static {v6}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    move-object v5, v1

    move-object v4, v2

    .line 88
    .end local v1    # "repstr":Ljava/lang/String;
    .end local v2    # "lambda":Lcom/trendmicro/hippo/Function;
    .local v4, "lambda":Lcom/trendmicro/hippo/Function;
    .local v5, "repstr":Ljava/lang/String;
    :goto_4
    iput-object v4, v12, Lcom/trendmicro/hippo/regexp/GlobData;->lambda:Lcom/trendmicro/hippo/Function;

    .line 89
    iput-object v5, v12, Lcom/trendmicro/hippo/regexp/GlobData;->repstr:Ljava/lang/String;

    .line 90
    if-nez v5, :cond_9

    const/4 v1, -0x1

    goto :goto_5

    :cond_9
    const/16 v1, 0x24

    invoke-virtual {v5, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    :goto_5
    iput v1, v12, Lcom/trendmicro/hippo/regexp/GlobData;->dollar:I

    .line 91
    const/4 v1, 0x0

    iput-object v1, v12, Lcom/trendmicro/hippo/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    .line 92
    iput v0, v12, Lcom/trendmicro/hippo/regexp/GlobData;->leftIndex:I

    .line 95
    if-eqz v13, :cond_a

    .line 96
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v16, v4

    .end local v4    # "lambda":Lcom/trendmicro/hippo/Function;
    .local v16, "lambda":Lcom/trendmicro/hippo/Function;
    move-object/from16 v4, p0

    move-object/from16 v17, v5

    .end local v5    # "repstr":Ljava/lang/String;
    .local v17, "repstr":Ljava/lang/String;
    move-object v5, v12

    move-object/from16 v18, v6

    .end local v6    # "arg1":Ljava/lang/Object;
    .local v18, "arg1":Ljava/lang/Object;
    move-object v6, v14

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->matchOrReplace(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/regexp/RegExpImpl;Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/regexp/NativeRegExp;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    .local v0, "val":Ljava/lang/Object;
    goto :goto_6

    .line 99
    .end local v0    # "val":Ljava/lang/Object;
    .end local v16    # "lambda":Lcom/trendmicro/hippo/Function;
    .end local v17    # "repstr":Ljava/lang/String;
    .end local v18    # "arg1":Ljava/lang/Object;
    .restart local v4    # "lambda":Lcom/trendmicro/hippo/Function;
    .restart local v5    # "repstr":Ljava/lang/String;
    .restart local v6    # "arg1":Ljava/lang/Object;
    :cond_a
    move-object/from16 v16, v4

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    .end local v4    # "lambda":Lcom/trendmicro/hippo/Function;
    .end local v5    # "repstr":Ljava/lang/String;
    .end local v6    # "arg1":Ljava/lang/Object;
    .restart local v16    # "lambda":Lcom/trendmicro/hippo/Function;
    .restart local v17    # "repstr":Ljava/lang/String;
    .restart local v18    # "arg1":Ljava/lang/Object;
    iget-object v2, v12, Lcom/trendmicro/hippo/regexp/GlobData;->str:Ljava/lang/String;

    .line 100
    .local v2, "str":Ljava/lang/String;
    invoke-virtual {v2, v15}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 101
    .local v3, "index":I
    if-ltz v3, :cond_b

    .line 102
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v4

    .line 103
    .local v4, "slen":I
    iput-object v1, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastParen:Lcom/trendmicro/hippo/regexp/SubString;

    .line 104
    new-instance v1, Lcom/trendmicro/hippo/regexp/SubString;

    invoke-direct {v1, v2, v0, v3}, Lcom/trendmicro/hippo/regexp/SubString;-><init>(Ljava/lang/String;II)V

    iput-object v1, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    .line 105
    new-instance v0, Lcom/trendmicro/hippo/regexp/SubString;

    invoke-direct {v0, v2, v3, v4}, Lcom/trendmicro/hippo/regexp/SubString;-><init>(Ljava/lang/String;II)V

    iput-object v0, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    .line 106
    new-instance v0, Lcom/trendmicro/hippo/regexp/SubString;

    add-int v1, v3, v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v3

    sub-int/2addr v5, v4

    invoke-direct {v0, v2, v1, v5}, Lcom/trendmicro/hippo/regexp/SubString;-><init>(Ljava/lang/String;II)V

    iput-object v0, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->rightContext:Lcom/trendmicro/hippo/regexp/SubString;

    .line 107
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 108
    .end local v4    # "slen":I
    .restart local v0    # "val":Ljava/lang/Object;
    move-object v6, v0

    goto :goto_6

    .line 109
    .end local v0    # "val":Ljava/lang/Object;
    :cond_b
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object v6, v0

    .line 113
    .end local v2    # "str":Ljava/lang/String;
    .end local v3    # "index":I
    .local v6, "val":Ljava/lang/Object;
    :goto_6
    iget-object v0, v12, Lcom/trendmicro/hippo/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    if-nez v0, :cond_e

    .line 114
    iget-boolean v0, v12, Lcom/trendmicro/hippo/regexp/GlobData;->global:Z

    if-nez v0, :cond_d

    if-eqz v6, :cond_d

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 115
    invoke-virtual {v6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_7

    .line 120
    :cond_c
    iget-object v5, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    .line 121
    .local v5, "lc":Lcom/trendmicro/hippo/regexp/SubString;
    iget v4, v5, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    iget v3, v5, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    move-object v0, v12

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v19, v3

    move-object/from16 v3, p0

    move-object/from16 v20, v5

    .end local v5    # "lc":Lcom/trendmicro/hippo/regexp/SubString;
    .local v20, "lc":Lcom/trendmicro/hippo/regexp/SubString;
    move/from16 v5, v19

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->replace_glob(Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RegExpImpl;II)V

    goto :goto_8

    .line 118
    .end local v20    # "lc":Lcom/trendmicro/hippo/regexp/SubString;
    :cond_d
    :goto_7
    iget-object v0, v12, Lcom/trendmicro/hippo/regexp/GlobData;->str:Ljava/lang/String;

    return-object v0

    .line 123
    :cond_e
    :goto_8
    iget-object v0, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->rightContext:Lcom/trendmicro/hippo/regexp/SubString;

    .line 124
    .local v0, "rc":Lcom/trendmicro/hippo/regexp/SubString;
    iget-object v1, v12, Lcom/trendmicro/hippo/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    iget-object v2, v0, Lcom/trendmicro/hippo/regexp/SubString;->str:Ljava/lang/String;

    iget v3, v0, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    iget v4, v0, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    iget v5, v0, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    add-int/2addr v4, v5

    invoke-virtual {v1, v2, v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 125
    iget-object v1, v12, Lcom/trendmicro/hippo/regexp/GlobData;->charBuf:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 53
    .end local v0    # "rc":Lcom/trendmicro/hippo/regexp/SubString;
    .end local v6    # "val":Ljava/lang/Object;
    .end local v13    # "useRE":Z
    .end local v14    # "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    .end local v15    # "search":Ljava/lang/String;
    .end local v16    # "lambda":Lcom/trendmicro/hippo/Function;
    .end local v17    # "repstr":Ljava/lang/String;
    .end local v18    # "arg1":Ljava/lang/Object;
    :cond_f
    invoke-static {v8, v9, v10, v1, v0}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->createRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;IZ)Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move-result-object v13

    .line 54
    .local v13, "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p0

    move-object v5, v12

    move-object v6, v13

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->matchOrReplace(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;Lcom/trendmicro/hippo/regexp/RegExpImpl;Lcom/trendmicro/hippo/regexp/GlobData;Lcom/trendmicro/hippo/regexp/NativeRegExp;)Ljava/lang/Object;

    move-result-object v0

    .line 56
    .local v0, "rval":Ljava/lang/Object;
    iget-object v1, v12, Lcom/trendmicro/hippo/regexp/GlobData;->arrayobj:Lcom/trendmicro/hippo/Scriptable;

    if-nez v1, :cond_10

    move-object v1, v0

    goto :goto_9

    :cond_10
    iget-object v1, v12, Lcom/trendmicro/hippo/regexp/GlobData;->arrayobj:Lcom/trendmicro/hippo/Scriptable;

    :goto_9
    return-object v1
.end method

.method public compileRegExp(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "flags"    # Ljava/lang/String;

    .line 31
    const/4 v0, 0x0

    invoke-static {p1, p2, p3, v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->compileRE(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/trendmicro/hippo/regexp/RECompiled;

    move-result-object v0

    return-object v0
.end method

.method public find_split(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;[I[I[Z[[Ljava/lang/String;)I
    .locals 14
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "target"    # Ljava/lang/String;
    .param p4, "separator"    # Ljava/lang/String;
    .param p5, "reObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p6, "ip"    # [I
    .param p7, "matchlen"    # [I
    .param p8, "matched"    # [Z
    .param p9, "parensp"    # [[Ljava/lang/String;

    .line 219
    move-object v7, p0

    const/4 v8, 0x0

    aget v0, p6, v8

    .line 220
    .local v0, "i":I
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v9

    .line 223
    .local v9, "length":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v10

    .line 224
    .local v10, "version":I
    move-object/from16 v11, p5

    check-cast v11, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move v12, v0

    .line 228
    .end local v0    # "i":I
    .local v11, "re":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    .local v12, "i":I
    :goto_0
    aget v13, p6, v8

    .line 229
    .local v13, "ipsave":I
    aput v12, p6, v8

    .line 230
    const/4 v6, 0x0

    move-object v0, v11

    move-object v1, p1

    move-object/from16 v2, p2

    move-object v3, p0

    move-object/from16 v4, p3

    move-object/from16 v5, p6

    invoke-virtual/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->executeRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v0

    .line 232
    .local v0, "ret":Ljava/lang/Object;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    .line 234
    aput v13, p6, v8

    .line 235
    aput v2, p7, v8

    .line 236
    aput-boolean v8, p8, v8

    .line 237
    return v9

    .line 239
    :cond_0
    aget v1, p6, v8

    .line 240
    .end local v12    # "i":I
    .local v1, "i":I
    aput v13, p6, v8

    .line 241
    aput-boolean v2, p8, v8

    .line 243
    iget-object v3, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    .line 244
    .local v3, "sep":Lcom/trendmicro/hippo/regexp/SubString;
    iget v4, v3, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    aput v4, p7, v8

    .line 245
    aget v4, p7, v8

    if-nez v4, :cond_3

    .line 252
    aget v4, p6, v8

    if-ne v1, v4, :cond_3

    .line 259
    if-ne v1, v9, :cond_2

    .line 260
    const/16 v4, 0x78

    if-ne v10, v4, :cond_1

    .line 261
    aput v2, p7, v8

    .line 262
    move v2, v1

    .local v2, "result":I
    goto :goto_1

    .line 265
    .end local v2    # "result":I
    :cond_1
    const/4 v2, -0x1

    .line 266
    .restart local v2    # "result":I
    goto :goto_1

    .line 268
    .end local v2    # "result":I
    :cond_2
    add-int/lit8 v12, v1, 0x1

    .line 269
    .end local v1    # "i":I
    .restart local v12    # "i":I
    goto :goto_0

    .line 273
    .end local v12    # "i":I
    .restart local v1    # "i":I
    :cond_3
    aget v2, p7, v8

    sub-int v2, v1, v2

    .line 274
    .restart local v2    # "result":I
    nop

    .line 276
    .end local v0    # "ret":Ljava/lang/Object;
    .end local v3    # "sep":Lcom/trendmicro/hippo/regexp/SubString;
    .end local v13    # "ipsave":I
    :goto_1
    iget-object v0, v7, Lcom/trendmicro/hippo/regexp/RegExpImpl;->parens:[Lcom/trendmicro/hippo/regexp/SubString;

    if-nez v0, :cond_4

    move v0, v8

    goto :goto_2

    :cond_4
    array-length v0, v0

    .line 277
    .local v0, "size":I
    :goto_2
    new-array v3, v0, [Ljava/lang/String;

    aput-object v3, p9, v8

    .line 278
    const/4 v3, 0x0

    .local v3, "num":I
    :goto_3
    if-ge v3, v0, :cond_5

    .line 279
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->getParenSubString(I)Lcom/trendmicro/hippo/regexp/SubString;

    move-result-object v4

    .line 280
    .local v4, "parsub":Lcom/trendmicro/hippo/regexp/SubString;
    aget-object v5, p9, v8

    invoke-virtual {v4}, Lcom/trendmicro/hippo/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    .line 278
    .end local v4    # "parsub":Lcom/trendmicro/hippo/regexp/SubString;
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 282
    .end local v3    # "num":I
    :cond_5
    return v2
.end method

.method getParenSubString(I)Lcom/trendmicro/hippo/regexp/SubString;
    .locals 2
    .param p1, "i"    # I

    .line 291
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/RegExpImpl;->parens:[Lcom/trendmicro/hippo/regexp/SubString;

    if-eqz v0, :cond_0

    array-length v1, v0

    if-ge p1, v1, :cond_0

    .line 292
    aget-object v0, v0, p1

    .line 293
    .local v0, "parsub":Lcom/trendmicro/hippo/regexp/SubString;
    if-eqz v0, :cond_0

    .line 294
    return-object v0

    .line 297
    .end local v0    # "parsub":Lcom/trendmicro/hippo/regexp/SubString;
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/regexp/SubString;

    invoke-direct {v0}, Lcom/trendmicro/hippo/regexp/SubString;-><init>()V

    return-object v0
.end method

.method public isRegExp(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 25
    instance-of v0, p1, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    return v0
.end method

.method public js_split(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 26
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "target"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 532
    move-object/from16 v11, p3

    move-object/from16 v12, p4

    const/4 v13, 0x0

    move-object/from16 v14, p1

    move-object/from16 v15, p2

    invoke-virtual {v14, v15, v13}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v10

    .line 535
    .local v10, "result":Lcom/trendmicro/hippo/Scriptable;
    array-length v0, v12

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    aget-object v0, v12, v1

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v0, v2, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v13

    :goto_0
    move/from16 v16, v0

    .line 536
    .local v16, "limited":Z
    const-wide/16 v2, 0x0

    .line 537
    .local v2, "limit":J
    if-eqz v16, :cond_2

    .line 539
    aget-object v0, v12, v1

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v2

    .line 540
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v0

    int-to-long v4, v0

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    .line 541
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v1

    int-to-long v2, v0

    move-wide/from16 v17, v2

    goto :goto_1

    .line 540
    :cond_1
    move-wide/from16 v17, v2

    goto :goto_1

    .line 537
    :cond_2
    move-wide/from16 v17, v2

    .line 545
    .end local v2    # "limit":J
    .local v17, "limit":J
    :goto_1
    array-length v0, v12

    if-lt v0, v1, :cond_f

    aget-object v0, v12, v13

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v2, :cond_3

    move-object v14, v10

    goto/16 :goto_b

    .line 550
    :cond_3
    const/4 v0, 0x0

    .line 551
    .local v0, "separator":Ljava/lang/String;
    new-array v9, v1, [I

    .line 552
    .local v9, "matchlen":[I
    const/4 v2, 0x0

    .line 553
    .local v2, "re":Lcom/trendmicro/hippo/Scriptable;
    const/4 v3, 0x0

    .line 554
    .local v3, "reProxy":Lcom/trendmicro/hippo/RegExpProxy;
    aget-object v4, v12, v13

    instance-of v4, v4, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v4, :cond_5

    .line 555
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v3

    .line 556
    if-eqz v3, :cond_4

    .line 557
    aget-object v4, v12, v13

    check-cast v4, Lcom/trendmicro/hippo/Scriptable;

    .line 558
    .local v4, "test":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v3, v4}, Lcom/trendmicro/hippo/RegExpProxy;->isRegExp(Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 559
    move-object v2, v4

    move-object/from16 v19, v2

    move-object/from16 v20, v3

    goto :goto_2

    .line 563
    .end local v4    # "test":Lcom/trendmicro/hippo/Scriptable;
    :cond_4
    move-object/from16 v19, v2

    move-object/from16 v20, v3

    goto :goto_2

    .line 554
    :cond_5
    move-object/from16 v19, v2

    move-object/from16 v20, v3

    .line 563
    .end local v2    # "re":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "reProxy":Lcom/trendmicro/hippo/RegExpProxy;
    .local v19, "re":Lcom/trendmicro/hippo/Scriptable;
    .local v20, "reProxy":Lcom/trendmicro/hippo/RegExpProxy;
    :goto_2
    if-nez v19, :cond_6

    .line 564
    aget-object v2, v12, v13

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 565
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    aput v2, v9, v13

    move-object/from16 v21, v0

    goto :goto_3

    .line 563
    :cond_6
    move-object/from16 v21, v0

    .line 569
    .end local v0    # "separator":Ljava/lang/String;
    .local v21, "separator":Ljava/lang/String;
    :goto_3
    new-array v0, v1, [I

    aput v13, v0, v13

    move-object/from16 v22, v0

    .line 571
    .local v22, "ip":[I
    const/4 v0, 0x0

    .line 572
    .local v0, "len":I
    new-array v2, v1, [Z

    aput-boolean v13, v2, v13

    move-object/from16 v23, v2

    .line 573
    .local v23, "matched":[Z
    new-array v1, v1, [[Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v2, v1, v13

    move-object/from16 v24, v1

    .line 574
    .local v24, "parens":[[Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v8

    move v7, v0

    .line 575
    .end local v0    # "len":I
    .local v7, "len":I
    .local v8, "version":I
    :goto_4
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, v21

    move v4, v8

    move-object/from16 v5, v20

    move-object/from16 v6, v19

    move v13, v7

    .end local v7    # "len":I
    .local v13, "len":I
    move-object/from16 v7, v22

    move v12, v8

    .end local v8    # "version":I
    .local v12, "version":I
    move-object v8, v9

    move-object/from16 v25, v9

    .end local v9    # "matchlen":[I
    .local v25, "matchlen":[I
    move-object/from16 v9, v23

    move-object v14, v10

    .end local v10    # "result":Lcom/trendmicro/hippo/Scriptable;
    .local v14, "result":Lcom/trendmicro/hippo/Scriptable;
    move-object/from16 v10, v24

    invoke-static/range {v0 .. v10}, Lcom/trendmicro/hippo/regexp/RegExpImpl;->find_split(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILcom/trendmicro/hippo/RegExpProxy;Lcom/trendmicro/hippo/Scriptable;[I[I[Z[[Ljava/lang/String;)I

    move-result v0

    move v1, v0

    .local v1, "match":I
    if-ltz v0, :cond_e

    .line 579
    if-eqz v16, :cond_7

    int-to-long v2, v13

    cmp-long v0, v2, v17

    if-gez v0, :cond_e

    :cond_7
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v0

    if-le v1, v0, :cond_8

    .line 580
    goto/16 :goto_9

    .line 583
    :cond_8
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_9

    .line 584
    move-object/from16 v0, p3

    move-object v2, v0

    const/4 v0, 0x0

    .local v0, "substr":Ljava/lang/String;
    goto :goto_5

    .line 586
    .end local v0    # "substr":Ljava/lang/String;
    :cond_9
    const/4 v0, 0x0

    aget v2, v22, v0

    invoke-virtual {v11, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 588
    .local v2, "substr":Ljava/lang/String;
    :goto_5
    invoke-interface {v14, v13, v14, v2}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 589
    add-int/lit8 v7, v13, 0x1

    .line 595
    .end local v13    # "len":I
    .restart local v7    # "len":I
    if-eqz v19, :cond_c

    aget-boolean v3, v23, v0

    if-eqz v3, :cond_c

    .line 596
    aget-object v3, v24, v0

    array-length v0, v3

    .line 597
    .local v0, "size":I
    const/4 v3, 0x0

    .local v3, "num":I
    :goto_6
    if-ge v3, v0, :cond_b

    .line 598
    if-eqz v16, :cond_a

    int-to-long v4, v7

    cmp-long v4, v4, v17

    if-ltz v4, :cond_a

    .line 599
    goto :goto_7

    .line 600
    :cond_a
    const/4 v4, 0x0

    aget-object v5, v24, v4

    aget-object v4, v5, v3

    invoke-interface {v14, v7, v14, v4}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 601
    add-int/lit8 v7, v7, 0x1

    .line 597
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 603
    .end local v3    # "num":I
    :cond_b
    :goto_7
    const/4 v3, 0x0

    aput-boolean v3, v23, v3

    goto :goto_8

    .line 595
    .end local v0    # "size":I
    :cond_c
    move v3, v0

    .line 605
    :goto_8
    aget v0, v25, v3

    add-int/2addr v0, v1

    aput v0, v22, v3

    .line 607
    const/16 v0, 0x82

    if-ge v12, v0, :cond_d

    if-eqz v12, :cond_d

    .line 614
    if-nez v16, :cond_d

    aget v0, v22, v3

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v0, v3, :cond_d

    .line 615
    goto :goto_a

    .line 617
    .end local v2    # "substr":Ljava/lang/String;
    :cond_d
    move v8, v12

    move-object v10, v14

    move-object/from16 v9, v25

    const/4 v13, 0x0

    move-object/from16 v14, p1

    move-object/from16 v12, p4

    goto/16 :goto_4

    .line 618
    .end local v7    # "len":I
    .restart local v13    # "len":I
    :cond_e
    :goto_9
    move v7, v13

    .end local v13    # "len":I
    .restart local v7    # "len":I
    :goto_a
    return-object v14

    .line 545
    .end local v1    # "match":I
    .end local v7    # "len":I
    .end local v12    # "version":I
    .end local v14    # "result":Lcom/trendmicro/hippo/Scriptable;
    .end local v19    # "re":Lcom/trendmicro/hippo/Scriptable;
    .end local v20    # "reProxy":Lcom/trendmicro/hippo/RegExpProxy;
    .end local v21    # "separator":Ljava/lang/String;
    .end local v22    # "ip":[I
    .end local v23    # "matched":[Z
    .end local v24    # "parens":[[Ljava/lang/String;
    .end local v25    # "matchlen":[I
    .restart local v10    # "result":Lcom/trendmicro/hippo/Scriptable;
    :cond_f
    move-object v14, v10

    .line 546
    .end local v10    # "result":Lcom/trendmicro/hippo/Scriptable;
    .restart local v14    # "result":Lcom/trendmicro/hippo/Scriptable;
    :goto_b
    const/4 v0, 0x0

    invoke-interface {v14, v0, v14, v11}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 547
    return-object v14
.end method

.method public wrapRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "compiled"    # Ljava/lang/Object;

    .line 38
    new-instance v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move-object v1, p3

    check-cast v1, Lcom/trendmicro/hippo/regexp/RECompiled;

    invoke-direct {v0, p2, v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RECompiled;)V

    return-object v0
.end method
