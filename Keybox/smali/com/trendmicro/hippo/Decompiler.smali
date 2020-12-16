.class public Lcom/trendmicro/hippo/Decompiler;
.super Ljava/lang/Object;
.source "Decompiler.java"


# static fields
.field public static final CASE_GAP_PROP:I = 0x3

.field private static final FUNCTION_END:I = 0xa7

.field public static final INDENT_GAP_PROP:I = 0x2

.field public static final INITIAL_INDENT_PROP:I = 0x1

.field public static final ONLY_BODY_FLAG:I = 0x1

.field public static final TO_SOURCE_FLAG:I = 0x2

.field private static final printSource:Z = false


# instance fields
.field private sourceBuffer:[C

.field private sourceTop:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 891
    const/16 v0, 0x80

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    return-void
.end method

.method private append(C)V
    .locals 2
    .param p1, "c"    # C

    .line 216
    iget v0, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    iget-object v1, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    array-length v1, v1

    if-ne v0, v1, :cond_0

    .line 217
    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->increaseSourceCapacity(I)V

    .line 219
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    iget v1, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    aput-char p1, v0, v1

    .line 220
    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    .line 221
    return-void
.end method

.method private appendString(Ljava/lang/String;)V
    .locals 7
    .param p1, "str"    # Ljava/lang/String;

    .line 193
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 194
    .local v0, "L":I
    const/4 v1, 0x1

    .line 195
    .local v1, "lengthEncodingSize":I
    const v2, 0x8000

    if-lt v0, v2, :cond_0

    .line 196
    const/4 v1, 0x2

    .line 198
    :cond_0
    iget v3, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    add-int/2addr v3, v1

    add-int/2addr v3, v0

    .line 199
    .local v3, "nextTop":I
    iget-object v4, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    array-length v4, v4

    if-le v3, v4, :cond_1

    .line 200
    invoke-direct {p0, v3}, Lcom/trendmicro/hippo/Decompiler;->increaseSourceCapacity(I)V

    .line 202
    :cond_1
    if-lt v0, v2, :cond_2

    .line 205
    iget-object v4, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    iget v5, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    ushr-int/lit8 v6, v0, 0x10

    or-int/2addr v2, v6

    int-to-char v2, v2

    aput-char v2, v4, v5

    .line 206
    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    .line 208
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    iget v4, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    int-to-char v5, v0

    aput-char v5, v2, v4

    .line 209
    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    .line 210
    const/4 v5, 0x0

    invoke-virtual {p1, v5, v0, v2, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 211
    iput v3, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    .line 212
    return-void
.end method

.method public static decompile(Ljava/lang/String;ILcom/trendmicro/hippo/UintMap;)Ljava/lang/String;
    .locals 18
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "flags"    # I
    .param p2, "properties"    # Lcom/trendmicro/hippo/UintMap;

    .line 261
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 262
    .local v2, "length":I
    if-nez v2, :cond_0

    const-string v3, ""

    return-object v3

    .line 264
    :cond_0
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lcom/trendmicro/hippo/UintMap;->getInt(II)I

    move-result v5

    .line 265
    .local v5, "indent":I
    if-ltz v5, :cond_31

    .line 266
    const/4 v6, 0x2

    const/4 v7, 0x4

    invoke-virtual {v1, v6, v7}, Lcom/trendmicro/hippo/UintMap;->getInt(II)I

    move-result v8

    .line 267
    .local v8, "indentGap":I
    if-ltz v8, :cond_30

    .line 268
    const/4 v9, 0x3

    invoke-virtual {v1, v9, v6}, Lcom/trendmicro/hippo/UintMap;->getInt(II)I

    move-result v9

    .line 269
    .local v9, "caseGap":I
    if-ltz v9, :cond_2f

    .line 271
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 272
    .local v10, "result":Ljava/lang/StringBuilder;
    and-int/lit8 v11, p1, 0x1

    if-eqz v11, :cond_1

    move v11, v3

    goto :goto_0

    :cond_1
    move v11, v4

    .line 273
    .local v11, "justFunctionBody":Z
    :goto_0
    and-int/lit8 v12, p1, 0x2

    if-eqz v12, :cond_2

    move v12, v3

    goto :goto_1

    :cond_2
    move v12, v4

    .line 302
    .local v12, "toSource":Z
    :goto_1
    const/4 v13, 0x0

    .line 303
    .local v13, "braceNesting":I
    const/4 v14, 0x0

    .line 304
    .local v14, "afterFirstEOL":Z
    const/4 v15, 0x0

    .line 306
    .local v15, "i":I
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v7, 0x89

    if-ne v4, v7, :cond_3

    .line 307
    add-int/lit8 v15, v15, 0x1

    .line 308
    const/4 v4, -0x1

    .local v4, "topFunctionType":I
    goto :goto_2

    .line 310
    .end local v4    # "topFunctionType":I
    :cond_3
    add-int/lit8 v4, v15, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 313
    .restart local v4    # "topFunctionType":I
    :goto_2
    const/16 v3, 0xa

    const/16 v7, 0x20

    if-nez v12, :cond_5

    .line 315
    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 316
    const/16 v16, 0x0

    move/from16 v3, v16

    .local v3, "j":I
    :goto_3
    if-ge v3, v5, :cond_4

    .line 317
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 316
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .end local v3    # "j":I
    :cond_4
    goto :goto_4

    .line 319
    :cond_5
    if-ne v4, v6, :cond_6

    .line 320
    const/16 v3, 0x28

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 324
    :cond_6
    :goto_4
    if-ge v15, v2, :cond_2c

    .line 325
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v3, 0x27

    const/4 v7, 0x1

    if-eq v6, v7, :cond_1f

    const/4 v7, 0x4

    if-eq v6, v7, :cond_1e

    const/16 v7, 0x32

    if-eq v6, v7, :cond_1d

    const/16 v7, 0x43

    if-eq v6, v7, :cond_1c

    const/16 v7, 0x49

    if-eq v6, v7, :cond_1b

    const/16 v7, 0xa1

    if-eq v6, v7, :cond_1a

    const/16 v7, 0xa7

    if-eq v6, v7, :cond_19

    const/16 v7, 0x34

    if-eq v6, v7, :cond_18

    const/16 v7, 0x35

    if-eq v6, v7, :cond_17

    const/16 v7, 0x90

    if-eq v6, v7, :cond_16

    const/16 v7, 0x91

    if-eq v6, v7, :cond_15

    const/16 v7, 0x93

    if-eq v6, v7, :cond_14

    const/16 v7, 0x94

    if-eq v6, v7, :cond_13

    const/16 v7, 0xa4

    if-eq v6, v7, :cond_7

    const/16 v7, 0xa5

    if-eq v6, v7, :cond_10

    packed-switch v6, :pswitch_data_0

    packed-switch v6, :pswitch_data_1

    packed-switch v6, :pswitch_data_2

    packed-switch v6, :pswitch_data_3

    packed-switch v6, :pswitch_data_4

    .line 803
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Token: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 804
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Lcom/trendmicro/hippo/Token;->name(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 726
    :pswitch_0
    const-string v3, "const "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 727
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 568
    :pswitch_1
    const-string v3, "let "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 325
    :cond_7
    :pswitch_2
    const/16 v6, 0x28

    goto/16 :goto_6

    .line 722
    :pswitch_3
    const-string v3, "void "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 723
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 526
    :pswitch_4
    const-string v3, "finally "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 522
    :pswitch_5
    const-string v3, "catch "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 523
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 506
    :pswitch_6
    const-string v3, "with "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 564
    :pswitch_7
    const-string v3, "var "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 544
    :pswitch_8
    const-string v6, "continue"

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    invoke-static {v0, v2, v15}, Lcom/trendmicro/hippo/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v6

    if-ne v3, v6, :cond_8

    .line 546
    const/16 v6, 0x20

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v6, 0x28

    goto/16 :goto_8

    .line 545
    :cond_8
    const/16 v6, 0x20

    const/16 v6, 0x28

    goto/16 :goto_8

    .line 538
    :pswitch_9
    const/16 v6, 0x20

    const-string v7, "break"

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 539
    invoke-static {v0, v2, v15}, Lcom/trendmicro/hippo/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v7

    if-ne v3, v7, :cond_9

    .line 540
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v6, 0x28

    goto/16 :goto_8

    .line 539
    :cond_9
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 498
    :pswitch_a
    const-string v3, "for "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 514
    :pswitch_b
    const-string v3, "do "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 515
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 510
    :pswitch_c
    const-string v3, "while "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 511
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 554
    :pswitch_d
    const-string v3, "default"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 550
    :pswitch_e
    const-string v3, "case "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 534
    :pswitch_f
    const-string v3, "switch "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 535
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 494
    :pswitch_10
    const-string v3, "else "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 495
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 490
    :pswitch_11
    const-string v3, "if "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 491
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 370
    :pswitch_12
    add-int/lit8 v15, v15, 0x1

    .line 371
    const-string v3, "function "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    move/from16 v17, v2

    const/16 v0, 0x20

    goto/16 :goto_c

    .line 478
    :pswitch_13
    const/16 v3, 0x2e

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 479
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 754
    :pswitch_14
    const-string v3, "--"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 755
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 750
    :pswitch_15
    const-string v3, "++"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 751
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 654
    :pswitch_16
    const-string v3, " && "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 655
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 650
    :pswitch_17
    const-string v3, " || "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 651
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 641
    :pswitch_18
    invoke-static {v0, v2, v15}, Lcom/trendmicro/hippo/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v3

    const/4 v6, 0x1

    if-ne v6, v3, :cond_a

    .line 643
    const/16 v3, 0x3a

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v6, 0x28

    goto/16 :goto_8

    .line 646
    :cond_a
    const-string v3, " : "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 647
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 628
    :pswitch_19
    const-string v3, " ? "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 629
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 600
    :pswitch_1a
    const-string v3, " %= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 601
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 596
    :pswitch_1b
    const-string v3, " /= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 597
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 592
    :pswitch_1c
    const-string v3, " *= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 593
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 588
    :pswitch_1d
    const-string v3, " -= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 589
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 584
    :pswitch_1e
    const-string v3, " += "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 624
    :pswitch_1f
    const-string v3, " >>>= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 625
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 620
    :pswitch_20
    const-string v3, " >>= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 616
    :pswitch_21
    const-string v3, " <<= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 612
    :pswitch_22
    const-string v3, " &= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 613
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 608
    :pswitch_23
    const-string v3, " ^= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 609
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 604
    :pswitch_24
    const-string v3, " |= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 605
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 580
    :pswitch_25
    const-string v3, " = "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 581
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 379
    :pswitch_26
    const-string v3, ", "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 417
    :pswitch_27
    const/16 v3, 0x29

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 418
    const/16 v3, 0x56

    invoke-static {v0, v2, v15}, Lcom/trendmicro/hippo/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v6

    if-ne v3, v6, :cond_b

    .line 419
    const/16 v3, 0x20

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v6, 0x28

    goto/16 :goto_8

    .line 418
    :cond_b
    const/16 v6, 0x28

    goto/16 :goto_8

    .line 413
    :pswitch_28
    const/16 v6, 0x28

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 414
    goto/16 :goto_8

    .line 390
    :pswitch_29
    const/16 v6, 0x28

    add-int/lit8 v13, v13, -0x1

    .line 395
    if-eqz v11, :cond_c

    if-nez v13, :cond_c

    .line 396
    move/from16 v17, v2

    const/16 v0, 0x20

    goto/16 :goto_c

    .line 398
    :cond_c
    const/16 v3, 0x7d

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 399
    invoke-static {v0, v2, v15}, Lcom/trendmicro/hippo/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v3

    const/4 v7, 0x1

    if-eq v3, v7, :cond_e

    const/16 v7, 0x72

    if-eq v3, v7, :cond_d

    const/16 v7, 0x76

    if-eq v3, v7, :cond_d

    const/16 v7, 0xa7

    if-eq v3, v7, :cond_e

    goto :goto_5

    .line 406
    :cond_d
    sub-int/2addr v5, v8

    .line 407
    const/16 v3, 0x20

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 402
    :cond_e
    sub-int/2addr v5, v8

    .line 403
    nop

    .line 410
    :goto_5
    move/from16 v17, v2

    const/16 v0, 0x20

    goto/16 :goto_c

    .line 383
    :pswitch_2a
    const/16 v6, 0x28

    add-int/lit8 v13, v13, 0x1

    .line 384
    invoke-static {v0, v2, v15}, Lcom/trendmicro/hippo/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v3

    const/4 v7, 0x1

    if-ne v7, v3, :cond_f

    .line 385
    add-int/2addr v5, v8

    .line 386
    :cond_f
    const/16 v3, 0x7b

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 387
    move/from16 v17, v2

    const/16 v0, 0x20

    goto/16 :goto_c

    .line 427
    :pswitch_2b
    const/16 v6, 0x28

    const/16 v3, 0x5d

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 428
    goto/16 :goto_8

    .line 423
    :pswitch_2c
    const/16 v6, 0x28

    const/16 v3, 0x5b

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 424
    goto/16 :goto_8

    .line 572
    :pswitch_2d
    const/16 v6, 0x28

    const/16 v3, 0x3b

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 573
    invoke-static {v0, v2, v15}, Lcom/trendmicro/hippo/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v3

    const/4 v7, 0x1

    if-eq v7, v3, :cond_20

    .line 575
    const/16 v3, 0x20

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_8

    .line 518
    :pswitch_2e
    const/16 v6, 0x28

    const-string v3, "try "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    goto/16 :goto_8

    .line 674
    :pswitch_2f
    const/16 v6, 0x28

    const-string v3, " !== "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 675
    goto/16 :goto_8

    .line 670
    :pswitch_30
    const/16 v6, 0x28

    const-string v3, " === "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 671
    goto/16 :goto_8

    .line 354
    :pswitch_31
    const/16 v6, 0x28

    const-string v3, "true"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    goto/16 :goto_8

    .line 358
    :pswitch_32
    const/16 v6, 0x28

    const-string v3, "false"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    goto/16 :goto_8

    .line 366
    :pswitch_33
    const/16 v6, 0x28

    const-string v3, "this"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    goto/16 :goto_8

    .line 362
    :pswitch_34
    const/16 v6, 0x28

    const-string v3, "null"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    goto/16 :goto_8

    .line 346
    :pswitch_35
    const/16 v6, 0x28

    add-int/lit8 v3, v15, 0x1

    const/4 v7, 0x1

    invoke-static {v0, v3, v7, v10}, Lcom/trendmicro/hippo/Decompiler;->printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I

    move-result v15

    .line 347
    const/4 v6, 0x2

    const/16 v7, 0x20

    goto/16 :goto_4

    .line 350
    :pswitch_36
    const/16 v6, 0x28

    add-int/lit8 v3, v15, 0x1

    invoke-static {v0, v3, v10}, Lcom/trendmicro/hippo/Decompiler;->printSourceNumber(Ljava/lang/String;ILjava/lang/StringBuilder;)I

    move-result v15

    .line 351
    const/4 v6, 0x2

    const/16 v7, 0x20

    goto/16 :goto_4

    .line 342
    :pswitch_37
    const/16 v6, 0x28

    add-int/lit8 v3, v15, 0x1

    const/4 v7, 0x0

    invoke-static {v0, v3, v7, v10}, Lcom/trendmicro/hippo/Decompiler;->printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I

    move-result v15

    .line 343
    const/4 v6, 0x2

    const/16 v7, 0x20

    goto/16 :goto_4

    .line 718
    :pswitch_38
    const/16 v6, 0x28

    const-string v3, "typeof "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 719
    goto/16 :goto_8

    .line 486
    :pswitch_39
    const/16 v6, 0x28

    const-string v3, "delete "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 487
    goto/16 :goto_8

    .line 482
    :pswitch_3a
    const/16 v6, 0x28

    const-string v3, "new "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    goto/16 :goto_8

    .line 746
    :pswitch_3b
    const/16 v6, 0x28

    const/16 v3, 0x2d

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 747
    goto/16 :goto_8

    .line 742
    :pswitch_3c
    const/16 v6, 0x28

    const/16 v3, 0x2b

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 743
    goto/16 :goto_8

    .line 738
    :pswitch_3d
    const/16 v6, 0x28

    const/16 v3, 0x7e

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 739
    goto/16 :goto_8

    .line 734
    :pswitch_3e
    const/16 v6, 0x28

    const/16 v3, 0x21

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 735
    goto/16 :goto_8

    .line 774
    :pswitch_3f
    const/16 v6, 0x28

    const-string v3, " % "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 775
    goto/16 :goto_8

    .line 770
    :pswitch_40
    const/16 v6, 0x28

    const-string v3, " / "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 771
    goto/16 :goto_8

    .line 766
    :pswitch_41
    const/16 v6, 0x28

    const-string v3, " * "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 767
    goto/16 :goto_8

    .line 762
    :pswitch_42
    const/16 v6, 0x28

    const-string v3, " - "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 763
    goto/16 :goto_8

    .line 758
    :pswitch_43
    const/16 v6, 0x28

    const-string v3, " + "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 759
    goto/16 :goto_8

    .line 714
    :pswitch_44
    const/16 v6, 0x28

    const-string v3, " >>> "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 715
    goto/16 :goto_8

    .line 710
    :pswitch_45
    const/16 v6, 0x28

    const-string v3, " >> "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 711
    goto/16 :goto_8

    .line 706
    :pswitch_46
    const/16 v6, 0x28

    const-string v3, " << "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 707
    goto/16 :goto_8

    .line 694
    :pswitch_47
    const/16 v6, 0x28

    const-string v3, " >= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 695
    goto/16 :goto_8

    .line 698
    :pswitch_48
    const/16 v6, 0x28

    const-string v3, " > "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 699
    goto/16 :goto_8

    .line 686
    :pswitch_49
    const/16 v6, 0x28

    const-string v3, " <= "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 687
    goto/16 :goto_8

    .line 690
    :pswitch_4a
    const/16 v6, 0x28

    const-string v3, " < "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 691
    goto/16 :goto_8

    .line 682
    :pswitch_4b
    const/16 v6, 0x28

    const-string v3, " != "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 683
    goto/16 :goto_8

    .line 678
    :pswitch_4c
    const/16 v6, 0x28

    const-string v3, " == "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 679
    goto/16 :goto_8

    .line 666
    :pswitch_4d
    const/16 v6, 0x28

    const-string v3, " & "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 667
    goto/16 :goto_8

    .line 662
    :pswitch_4e
    const/16 v6, 0x28

    const-string v3, " ^ "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 663
    goto/16 :goto_8

    .line 658
    :pswitch_4f
    const/16 v6, 0x28

    const-string v3, " | "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 659
    goto/16 :goto_8

    .line 798
    :cond_10
    const/16 v6, 0x28

    const-string v3, " => "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 799
    goto/16 :goto_8

    .line 329
    :goto_6
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v7, 0x98

    if-ne v3, v7, :cond_11

    .line 330
    const-string v3, "get "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 331
    :cond_11
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v7, 0x99

    if-ne v3, v7, :cond_12

    .line 332
    const-string v3, "set "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    :cond_12
    :goto_7
    add-int/lit8 v15, v15, 0x1

    .line 335
    add-int/lit8 v3, v15, 0x1

    const/4 v7, 0x0

    invoke-static {v0, v3, v7, v10}, Lcom/trendmicro/hippo/Decompiler;->printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I

    move-result v3

    .line 337
    .end local v15    # "i":I
    .local v3, "i":I
    const/4 v7, 0x1

    add-int/lit8 v15, v3, 0x1

    .line 338
    .end local v3    # "i":I
    .restart local v15    # "i":I
    move/from16 v17, v2

    const/16 v0, 0x20

    goto/16 :goto_c

    .line 790
    :cond_13
    const/16 v6, 0x28

    const/16 v3, 0x40

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 791
    goto :goto_8

    .line 786
    :cond_14
    const/16 v6, 0x28

    const-string v3, ".("

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 787
    goto :goto_8

    .line 778
    :cond_15
    const/16 v6, 0x28

    const-string v3, "::"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 779
    goto :goto_8

    .line 782
    :cond_16
    const/16 v6, 0x28

    const-string v3, ".."

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 783
    goto :goto_8

    .line 702
    :cond_17
    const/16 v6, 0x28

    const-string v3, " instanceof "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 703
    goto :goto_8

    .line 502
    :cond_18
    const/16 v6, 0x28

    const-string v3, " in "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    goto :goto_8

    .line 376
    :cond_19
    const/16 v6, 0x28

    goto :goto_8

    .line 794
    :cond_1a
    const/16 v6, 0x28

    const-string v3, "debugger;\n"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 795
    goto :goto_8

    .line 730
    :cond_1b
    const/16 v6, 0x28

    const-string v3, "yield "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 731
    goto :goto_8

    .line 637
    :cond_1c
    const/16 v6, 0x28

    const-string v3, ": "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 638
    goto :goto_8

    .line 530
    :cond_1d
    const/16 v6, 0x28

    const-string v3, "throw "

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    goto :goto_8

    .line 558
    :cond_1e
    const/16 v6, 0x28

    const-string v3, "return"

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 559
    const/16 v3, 0x53

    invoke-static {v0, v2, v15}, Lcom/trendmicro/hippo/Decompiler;->getNext(Ljava/lang/String;II)I

    move-result v7

    if-eq v3, v7, :cond_20

    .line 560
    const/16 v3, 0x20

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_8

    .line 431
    :cond_1f
    const/16 v6, 0x28

    if-eqz v12, :cond_21

    .line 806
    :cond_20
    :goto_8
    move/from16 v17, v2

    const/16 v0, 0x20

    goto/16 :goto_c

    .line 432
    :cond_21
    const/4 v7, 0x1

    .line 433
    .local v7, "newLine":Z
    if-nez v14, :cond_23

    .line 434
    const/4 v14, 0x1

    .line 435
    if-eqz v11, :cond_22

    .line 439
    const/4 v6, 0x0

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 440
    sub-int/2addr v5, v8

    .line 441
    const/4 v7, 0x0

    goto :goto_9

    .line 435
    :cond_22
    const/4 v6, 0x0

    goto :goto_9

    .line 433
    :cond_23
    const/4 v6, 0x0

    .line 444
    :goto_9
    if-eqz v7, :cond_24

    .line 445
    const/16 v6, 0xa

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 452
    :cond_24
    add-int/lit8 v6, v15, 0x1

    if-ge v6, v2, :cond_2b

    .line 453
    const/4 v6, 0x0

    .line 454
    .local v6, "less":I
    add-int/lit8 v3, v15, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 455
    .local v3, "nextToken":I
    const/16 v1, 0x74

    if-eq v3, v1, :cond_28

    const/16 v1, 0x75

    if-ne v3, v1, :cond_25

    move/from16 v17, v2

    goto :goto_a

    .line 459
    :cond_25
    const/16 v1, 0x57

    if-ne v3, v1, :cond_26

    .line 460
    move v6, v8

    move/from16 v17, v2

    goto :goto_b

    .line 466
    :cond_26
    const/16 v1, 0x27

    if-ne v3, v1, :cond_27

    .line 467
    add-int/lit8 v1, v15, 0x2

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Decompiler;->getSourceStringEnd(Ljava/lang/String;I)I

    move-result v1

    .line 468
    .local v1, "afterName":I
    move/from16 v17, v2

    .end local v2    # "length":I
    .local v17, "length":I
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v0, 0x68

    if-ne v2, v0, :cond_29

    .line 469
    move v6, v8

    goto :goto_b

    .line 466
    .end local v1    # "afterName":I
    .end local v17    # "length":I
    .restart local v2    # "length":I
    :cond_27
    move/from16 v17, v2

    .end local v2    # "length":I
    .restart local v17    # "length":I
    goto :goto_b

    .line 455
    .end local v17    # "length":I
    .restart local v2    # "length":I
    :cond_28
    move/from16 v17, v2

    .line 458
    .end local v2    # "length":I
    .restart local v17    # "length":I
    :goto_a
    sub-int v6, v8, v9

    .line 472
    :cond_29
    :goto_b
    if-ge v6, v5, :cond_2a

    .line 473
    const/16 v0, 0x20

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 472
    add-int/lit8 v6, v6, 0x1

    goto :goto_b

    :cond_2a
    const/16 v0, 0x20

    .line 474
    .end local v3    # "nextToken":I
    .end local v6    # "less":I
    goto :goto_c

    .line 452
    .end local v17    # "length":I
    .restart local v2    # "length":I
    :cond_2b
    move/from16 v17, v2

    const/16 v0, 0x20

    .line 806
    .end local v2    # "length":I
    .end local v7    # "newLine":Z
    .restart local v17    # "length":I
    :goto_c
    const/4 v1, 0x1

    add-int/2addr v15, v1

    move-object/from16 v1, p2

    move v7, v0

    move/from16 v2, v17

    const/4 v6, 0x2

    move-object/from16 v0, p0

    goto/16 :goto_4

    .line 809
    .end local v17    # "length":I
    .restart local v2    # "length":I
    :cond_2c
    move/from16 v17, v2

    .end local v2    # "length":I
    .restart local v17    # "length":I
    if-nez v12, :cond_2d

    .line 811
    if-nez v11, :cond_2e

    .line 812
    const/16 v0, 0xa

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_d

    .line 814
    :cond_2d
    const/4 v0, 0x2

    if-ne v4, v0, :cond_2e

    .line 815
    const/16 v0, 0x29

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 819
    :cond_2e
    :goto_d
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 269
    .end local v4    # "topFunctionType":I
    .end local v10    # "result":Ljava/lang/StringBuilder;
    .end local v11    # "justFunctionBody":Z
    .end local v12    # "toSource":Z
    .end local v13    # "braceNesting":I
    .end local v14    # "afterFirstEOL":Z
    .end local v15    # "i":I
    .end local v17    # "length":I
    .restart local v2    # "length":I
    :cond_2f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 267
    .end local v9    # "caseGap":I
    :cond_30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 265
    .end local v8    # "indentGap":I
    :cond_31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x27
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_37
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x52
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x71
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x98
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getNext(Ljava/lang/String;II)I
    .locals 1
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "length"    # I
    .param p2, "i"    # I

    .line 824
    add-int/lit8 v0, p2, 0x1

    if-ge v0, p1, :cond_0

    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static getSourceStringEnd(Ljava/lang/String;I)I
    .locals 2
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "offset"    # I

    .line 829
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/trendmicro/hippo/Decompiler;->printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I

    move-result v0

    return v0
.end method

.method private increaseSourceCapacity(I)V
    .locals 5
    .param p1, "minimalCapacity"    # I

    .line 226
    iget-object v0, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    array-length v0, v0

    if-gt p1, v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 227
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x2

    .line 228
    .local v0, "newCapacity":I
    if-ge v0, p1, :cond_1

    .line 229
    move v0, p1

    .line 231
    :cond_1
    new-array v1, v0, [C

    .line 232
    .local v1, "tmp":[C
    iget-object v2, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    iget v3, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    const/4 v4, 0x0

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    iput-object v1, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    .line 234
    return-void
.end method

.method private static printSourceNumber(Ljava/lang/String;ILjava/lang/StringBuilder;)I
    .locals 9
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .line 858
    const-wide/16 v0, 0x0

    .line 859
    .local v0, "number":D
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 860
    .local v2, "type":C
    add-int/lit8 p1, p1, 0x1

    .line 861
    const/16 v3, 0x53

    if-ne v2, v3, :cond_1

    .line 862
    if-eqz p2, :cond_0

    .line 863
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 864
    .local v3, "ival":I
    int-to-double v0, v3

    .line 866
    .end local v3    # "ival":I
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 867
    :cond_1
    const/16 v3, 0x4a

    if-eq v2, v3, :cond_3

    const/16 v4, 0x44

    if-ne v2, v4, :cond_2

    goto :goto_0

    .line 883
    :cond_2
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3}, Ljava/lang/RuntimeException;-><init>()V

    throw v3

    .line 868
    :cond_3
    :goto_0
    if-eqz p2, :cond_5

    .line 870
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    int-to-long v4, v4

    const/16 v6, 0x30

    shl-long/2addr v4, v6

    .line 871
    .local v4, "lbits":J
    add-int/lit8 v6, p1, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    int-to-long v6, v6

    const/16 v8, 0x20

    shl-long/2addr v6, v8

    or-long/2addr v4, v6

    .line 872
    add-int/lit8 v6, p1, 0x2

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    int-to-long v6, v6

    const/16 v8, 0x10

    shl-long/2addr v6, v8

    or-long/2addr v4, v6

    .line 873
    add-int/lit8 v6, p1, 0x3

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    int-to-long v6, v6

    or-long/2addr v4, v6

    .line 874
    if-ne v2, v3, :cond_4

    .line 875
    long-to-double v0, v4

    goto :goto_1

    .line 877
    :cond_4
    invoke-static {v4, v5}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    .line 880
    .end local v4    # "lbits":J
    :cond_5
    :goto_1
    add-int/lit8 p1, p1, 0x4

    .line 885
    :goto_2
    if-eqz p2, :cond_6

    .line 886
    const/16 v3, 0xa

    invoke-static {v0, v1, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 888
    :cond_6
    return p1
.end method

.method private static printSourceString(Ljava/lang/String;IZLjava/lang/StringBuilder;)I
    .locals 4
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "asQuotedString"    # Z
    .param p3, "sb"    # Ljava/lang/StringBuilder;

    .line 836
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 837
    .local v0, "length":I
    add-int/lit8 p1, p1, 0x1

    .line 838
    const v1, 0x8000

    and-int/2addr v1, v0

    if-eqz v1, :cond_0

    .line 839
    and-int/lit16 v1, v0, 0x7fff

    shl-int/lit8 v1, v1, 0x10

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    or-int v0, v1, v2

    .line 840
    add-int/lit8 p1, p1, 0x1

    .line 842
    :cond_0
    if-eqz p3, :cond_2

    .line 843
    add-int v1, p1, v0

    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 844
    .local v1, "str":Ljava/lang/String;
    if-nez p2, :cond_1

    .line 845
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 847
    :cond_1
    const/16 v2, 0x22

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 848
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 849
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 852
    .end local v1    # "str":Ljava/lang/String;
    :cond_2
    :goto_0
    add-int v1, p1, v0

    return v1
.end method

.method private sourceToString(I)Ljava/lang/String;
    .locals 3
    .param p1, "offset"    # I

    .line 238
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    if-ge v0, p1, :cond_1

    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 239
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/trendmicro/hippo/Decompiler;->sourceBuffer:[C

    iget v2, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    sub-int/2addr v2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method


# virtual methods
.method addEOL(I)V
    .locals 1
    .param p1, "token"    # I

    .line 113
    if-ltz p1, :cond_0

    const/16 v0, 0xa6

    if-gt p1, v0, :cond_0

    .line 116
    int-to-char v0, p1

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 117
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 118
    return-void

    .line 114
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method addName(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 122
    const/16 v0, 0x27

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 123
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Decompiler;->appendString(Ljava/lang/String;)V

    .line 124
    return-void
.end method

.method addNumber(D)V
    .locals 8
    .param p1, "n"    # D

    .line 140
    const/16 v0, 0x28

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 159
    double-to-long v0, p1

    .line 160
    .local v0, "lbits":J
    long-to-double v2, v0

    cmpl-double v2, v2, p1

    const/16 v3, 0x10

    const/16 v4, 0x20

    const/16 v5, 0x30

    if-eqz v2, :cond_0

    .line 163
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 164
    const/16 v2, 0x44

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 165
    shr-long v5, v0, v5

    long-to-int v2, v5

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 166
    shr-long v4, v0, v4

    long-to-int v2, v4

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 167
    shr-long v2, v0, v3

    long-to-int v2, v2

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 168
    long-to-int v2, v0

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    goto :goto_0

    .line 173
    :cond_0
    const-wide/16 v6, 0x0

    cmp-long v2, v0, v6

    if-gez v2, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 177
    :cond_1
    const-wide/32 v6, 0xffff

    cmp-long v2, v0, v6

    if-gtz v2, :cond_2

    .line 178
    const/16 v2, 0x53

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 179
    long-to-int v2, v0

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    goto :goto_0

    .line 182
    :cond_2
    const/16 v2, 0x4a

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 183
    shr-long v5, v0, v5

    long-to-int v2, v5

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 184
    shr-long v4, v0, v4

    long-to-int v2, v4

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 185
    shr-long v2, v0, v3

    long-to-int v2, v2

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 186
    long-to-int v2, v0

    int-to-char v2, v2

    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 189
    :goto_0
    return-void
.end method

.method addRegexp(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "regexp"    # Ljava/lang/String;
    .param p2, "flags"    # Ljava/lang/String;

    .line 134
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->appendString(Ljava/lang/String;)V

    .line 136
    return-void
.end method

.method addString(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 128
    const/16 v0, 0x29

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 129
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Decompiler;->appendString(Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method addToken(I)V
    .locals 1
    .param p1, "token"    # I

    .line 105
    if-ltz p1, :cond_0

    const/16 v0, 0xa6

    if-gt p1, v0, :cond_0

    .line 108
    int-to-char v0, p1

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 109
    return-void

    .line 106
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method getCurrentOffset()I
    .locals 1

    .line 83
    iget v0, p0, Lcom/trendmicro/hippo/Decompiler;->sourceTop:I

    return v0
.end method

.method getEncodedSource()Ljava/lang/String;
    .locals 1

    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Decompiler;->sourceToString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method markFunctionEnd(I)I
    .locals 2
    .param p1, "functionStart"    # I

    .line 98
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Decompiler;->getCurrentOffset()I

    move-result v0

    .line 99
    .local v0, "offset":I
    const/16 v1, 0xa7

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 100
    return v0
.end method

.method markFunctionStart(I)I
    .locals 2
    .param p1, "functionType"    # I

    .line 88
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Decompiler;->getCurrentOffset()I

    move-result v0

    .line 89
    .local v0, "savedOffset":I
    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    .line 90
    const/16 v1, 0x6e

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Decompiler;->addToken(I)V

    .line 91
    int-to-char v1, p1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/Decompiler;->append(C)V

    .line 93
    :cond_0
    return v0
.end method
