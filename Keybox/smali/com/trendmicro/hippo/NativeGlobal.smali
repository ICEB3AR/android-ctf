.class public Lcom/trendmicro/hippo/NativeGlobal;
.super Ljava/lang/Object;
.source "NativeGlobal.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lcom/trendmicro/hippo/IdFunctionCall;


# static fields
.field private static final FTAG:Ljava/lang/Object;

.field private static final INVALID_UTF8:I = 0x7fffffff

.field private static final Id_decodeURI:I = 0x1

.field private static final Id_decodeURIComponent:I = 0x2

.field private static final Id_encodeURI:I = 0x3

.field private static final Id_encodeURIComponent:I = 0x4

.field private static final Id_escape:I = 0x5

.field private static final Id_eval:I = 0x6

.field private static final Id_isFinite:I = 0x7

.field private static final Id_isNaN:I = 0x8

.field private static final Id_isXMLName:I = 0x9

.field private static final Id_new_CommonError:I = 0xe

.field private static final Id_parseFloat:I = 0xa

.field private static final Id_parseInt:I = 0xb

.field private static final Id_unescape:I = 0xc

.field private static final Id_uneval:I = 0xd

.field private static final LAST_SCOPE_FUNCTION_ID:I = 0xd

.field private static final URI_DECODE_RESERVED:Ljava/lang/String; = ";/?:@&=+$,#"

.field static final serialVersionUID:J = 0x546211ef26c230caL


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 755
    const-string v0, "Global"

    sput-object v0, Lcom/trendmicro/hippo/NativeGlobal;->FTAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static constructError(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/EcmaError;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 509
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method public static constructError(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;IILjava/lang/String;)Lcom/trendmicro/hippo/EcmaError;
    .locals 6
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "sourceName"    # Ljava/lang/String;
    .param p5, "lineNumber"    # I
    .param p6, "columnNumber"    # I
    .param p7, "lineSource"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 527
    move-object v0, p1

    move-object v1, p2

    move-object v2, p4

    move v3, p5

    move-object v4, p7

    move v5, p6

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    return-object v0
.end method

.method private static decode(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 16
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "fullUri"    # Z

    .line 612
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 613
    .local v1, "buf":[C
    const/4 v2, 0x0

    .line 615
    .local v2, "bufTop":I
    const/4 v3, 0x0

    .local v3, "k":I
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v4

    .local v4, "length":I
    :goto_0
    const/4 v5, 0x0

    if-eq v3, v4, :cond_18

    .line 616
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 617
    .local v6, "C":C
    const/16 v7, 0x25

    if-eq v6, v7, :cond_1

    .line 618
    if-eqz v1, :cond_0

    .line 619
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "bufTop":I
    .local v5, "bufTop":I
    aput-char v6, v1, v2

    move v2, v5

    .line 621
    .end local v5    # "bufTop":I
    .restart local v2    # "bufTop":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_7

    .line 623
    :cond_1
    if-nez v1, :cond_2

    .line 626
    new-array v1, v4, [C

    .line 627
    invoke-virtual {v0, v5, v3, v1, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 628
    move v2, v3

    .line 630
    :cond_2
    move v5, v3

    .line 631
    .local v5, "start":I
    add-int/lit8 v8, v3, 0x3

    if-gt v8, v4, :cond_17

    .line 633
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    add-int/lit8 v9, v3, 0x2

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v8, v9}, Lcom/trendmicro/hippo/NativeGlobal;->unHex(CC)I

    move-result v8

    .line 634
    .local v8, "B":I
    if-ltz v8, :cond_16

    .line 635
    add-int/lit8 v3, v3, 0x3

    .line 636
    and-int/lit16 v9, v8, 0x80

    if-nez v9, :cond_3

    .line 637
    int-to-char v6, v8

    goto/16 :goto_5

    .line 642
    :cond_3
    and-int/lit16 v9, v8, 0xc0

    const/16 v10, 0x80

    if-eq v9, v10, :cond_15

    .line 645
    and-int/lit8 v9, v8, 0x20

    if-nez v9, :cond_4

    .line 646
    const/4 v9, 0x1

    .local v9, "utf8Tail":I
    and-int/lit8 v11, v8, 0x1f

    .line 647
    .local v11, "ucs4Char":I
    const/16 v12, 0x80

    .local v12, "minUcs4Char":I
    goto :goto_1

    .line 648
    .end local v9    # "utf8Tail":I
    .end local v11    # "ucs4Char":I
    .end local v12    # "minUcs4Char":I
    :cond_4
    and-int/lit8 v9, v8, 0x10

    if-nez v9, :cond_5

    .line 649
    const/4 v9, 0x2

    .restart local v9    # "utf8Tail":I
    and-int/lit8 v11, v8, 0xf

    .line 650
    .restart local v11    # "ucs4Char":I
    const/16 v12, 0x800

    .restart local v12    # "minUcs4Char":I
    goto :goto_1

    .line 651
    .end local v9    # "utf8Tail":I
    .end local v11    # "ucs4Char":I
    .end local v12    # "minUcs4Char":I
    :cond_5
    and-int/lit8 v9, v8, 0x8

    if-nez v9, :cond_6

    .line 652
    const/4 v9, 0x3

    .restart local v9    # "utf8Tail":I
    and-int/lit8 v11, v8, 0x7

    .line 653
    .restart local v11    # "ucs4Char":I
    const/high16 v12, 0x10000

    .restart local v12    # "minUcs4Char":I
    goto :goto_1

    .line 654
    .end local v9    # "utf8Tail":I
    .end local v11    # "ucs4Char":I
    .end local v12    # "minUcs4Char":I
    :cond_6
    and-int/lit8 v9, v8, 0x4

    if-nez v9, :cond_7

    .line 655
    const/4 v9, 0x4

    .restart local v9    # "utf8Tail":I
    and-int/lit8 v11, v8, 0x3

    .line 656
    .restart local v11    # "ucs4Char":I
    const/high16 v12, 0x200000

    .restart local v12    # "minUcs4Char":I
    goto :goto_1

    .line 657
    .end local v9    # "utf8Tail":I
    .end local v11    # "ucs4Char":I
    .end local v12    # "minUcs4Char":I
    :cond_7
    and-int/lit8 v9, v8, 0x2

    if-nez v9, :cond_14

    .line 658
    const/4 v9, 0x5

    .restart local v9    # "utf8Tail":I
    and-int/lit8 v11, v8, 0x1

    .line 659
    .restart local v11    # "ucs4Char":I
    const/high16 v12, 0x4000000

    .line 664
    .restart local v12    # "minUcs4Char":I
    :goto_1
    mul-int/lit8 v13, v9, 0x3

    add-int/2addr v13, v3

    if-gt v13, v4, :cond_13

    .line 666
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_2
    if-eq v13, v9, :cond_a

    .line 667
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-ne v14, v7, :cond_9

    .line 669
    add-int/lit8 v14, v3, 0x1

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    add-int/lit8 v15, v3, 0x2

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    invoke-static {v14, v15}, Lcom/trendmicro/hippo/NativeGlobal;->unHex(CC)I

    move-result v8

    .line 670
    if-ltz v8, :cond_8

    and-int/lit16 v14, v8, 0xc0

    if-ne v14, v10, :cond_8

    .line 672
    shl-int/lit8 v14, v11, 0x6

    and-int/lit8 v15, v8, 0x3f

    or-int v11, v14, v15

    .line 673
    add-int/lit8 v3, v3, 0x3

    .line 666
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 671
    :cond_8
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v7

    throw v7

    .line 668
    :cond_9
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v7

    throw v7

    .line 676
    .end local v13    # "j":I
    :cond_a
    const v7, 0xd800

    if-lt v11, v12, :cond_d

    if-lt v11, v7, :cond_b

    const v10, 0xdfff

    if-gt v11, v10, :cond_b

    goto :goto_3

    .line 679
    :cond_b
    const v10, 0xfffe

    if-eq v11, v10, :cond_c

    const v10, 0xffff

    if-ne v11, v10, :cond_e

    .line 680
    :cond_c
    const v11, 0xfffd

    goto :goto_4

    .line 678
    :cond_d
    :goto_3
    const v11, 0x7fffffff

    .line 682
    :cond_e
    :goto_4
    const/high16 v10, 0x10000

    if-lt v11, v10, :cond_10

    .line 683
    sub-int/2addr v11, v10

    .line 684
    const v10, 0xfffff

    if-gt v11, v10, :cond_f

    .line 687
    ushr-int/lit8 v10, v11, 0xa

    add-int/2addr v10, v7

    int-to-char v7, v10

    .line 688
    .local v7, "H":C
    and-int/lit16 v10, v11, 0x3ff

    const v13, 0xdc00

    add-int/2addr v10, v13

    int-to-char v6, v10

    .line 689
    add-int/lit8 v10, v2, 0x1

    .end local v2    # "bufTop":I
    .local v10, "bufTop":I
    aput-char v7, v1, v2

    .line 690
    .end local v7    # "H":C
    move v2, v10

    goto :goto_5

    .line 685
    .end local v10    # "bufTop":I
    .restart local v2    # "bufTop":I
    :cond_f
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v7

    throw v7

    .line 691
    :cond_10
    int-to-char v6, v11

    .line 694
    .end local v9    # "utf8Tail":I
    .end local v11    # "ucs4Char":I
    .end local v12    # "minUcs4Char":I
    :goto_5
    if-eqz p1, :cond_12

    const-string v7, ";/?:@&=+$,#"

    invoke-virtual {v7, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_12

    .line 695
    move v7, v5

    .local v7, "x":I
    :goto_6
    if-eq v7, v3, :cond_11

    .line 696
    add-int/lit8 v9, v2, 0x1

    .end local v2    # "bufTop":I
    .local v9, "bufTop":I
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v10

    aput-char v10, v1, v2

    .line 695
    add-int/lit8 v7, v7, 0x1

    move v2, v9

    goto :goto_6

    .end local v7    # "x":I
    .end local v9    # "bufTop":I
    .restart local v2    # "bufTop":I
    :cond_11
    goto :goto_7

    .line 699
    :cond_12
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "bufTop":I
    .local v7, "bufTop":I
    aput-char v6, v1, v2

    move v2, v7

    .line 702
    .end local v5    # "start":I
    .end local v6    # "C":C
    .end local v7    # "bufTop":I
    .end local v8    # "B":I
    .restart local v2    # "bufTop":I
    :goto_7
    goto/16 :goto_0

    .line 665
    .restart local v5    # "start":I
    .restart local v6    # "C":C
    .restart local v8    # "B":I
    .local v9, "utf8Tail":I
    .restart local v11    # "ucs4Char":I
    .restart local v12    # "minUcs4Char":I
    :cond_13
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v7

    throw v7

    .line 662
    .end local v9    # "utf8Tail":I
    .end local v11    # "ucs4Char":I
    .end local v12    # "minUcs4Char":I
    :cond_14
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v7

    throw v7

    .line 644
    :cond_15
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v7

    throw v7

    .line 634
    :cond_16
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v7

    throw v7

    .line 632
    .end local v8    # "B":I
    :cond_17
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v7

    throw v7

    .line 703
    .end local v3    # "k":I
    .end local v4    # "length":I
    .end local v5    # "start":I
    .end local v6    # "C":C
    :cond_18
    if-nez v1, :cond_19

    move-object v3, v0

    goto :goto_8

    :cond_19
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1, v5, v2}, Ljava/lang/String;-><init>([CII)V

    :goto_8
    return-object v3
.end method

.method private static encode(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 10
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "fullUri"    # Z

    .line 540
    const/4 v0, 0x0

    .line 541
    .local v0, "utf8buf":[B
    const/4 v1, 0x0

    .line 543
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "k":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .local v3, "length":I
    :goto_0
    if-eq v2, v3, :cond_9

    .line 544
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 545
    .local v4, "C":C
    invoke-static {v4, p1}, Lcom/trendmicro/hippo/NativeGlobal;->encodeUnescaped(CZ)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 546
    if-eqz v1, :cond_8

    .line 547
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5

    .line 550
    :cond_0
    if-nez v1, :cond_1

    .line 551
    new-instance v5, Ljava/lang/StringBuilder;

    add-int/lit8 v6, v3, 0x3

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object v1, v5

    .line 552
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 553
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 554
    const/4 v5, 0x6

    new-array v0, v5, [B

    .line 556
    :cond_1
    const v5, 0xdfff

    const v6, 0xdc00

    if-gt v6, v4, :cond_3

    if-le v4, v5, :cond_2

    goto :goto_1

    .line 557
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v5

    throw v5

    .line 560
    :cond_3
    :goto_1
    const v7, 0xd800

    if-lt v4, v7, :cond_7

    const v8, 0xdbff

    if-ge v8, v4, :cond_4

    goto :goto_2

    .line 563
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 564
    if-eq v2, v3, :cond_6

    .line 567
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 568
    .local v8, "C2":C
    if-gt v6, v8, :cond_5

    if-gt v8, v5, :cond_5

    .line 571
    sub-int v5, v4, v7

    shl-int/lit8 v5, v5, 0xa

    sub-int v6, v8, v6

    add-int/2addr v5, v6

    const/high16 v6, 0x10000

    add-int/2addr v5, v6

    .local v5, "V":I
    goto :goto_3

    .line 569
    .end local v5    # "V":I
    :cond_5
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v5

    throw v5

    .line 565
    .end local v8    # "C2":C
    :cond_6
    invoke-static {}, Lcom/trendmicro/hippo/NativeGlobal;->uriError()Lcom/trendmicro/hippo/EcmaError;

    move-result-object v5

    throw v5

    .line 561
    :cond_7
    :goto_2
    move v5, v4

    .line 573
    .restart local v5    # "V":I
    :goto_3
    invoke-static {v0, v5}, Lcom/trendmicro/hippo/NativeGlobal;->oneUcs4ToUtf8Char([BI)I

    move-result v6

    .line 574
    .local v6, "L":I
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_4
    if-ge v7, v6, :cond_8

    .line 575
    aget-byte v8, v0, v7

    and-int/lit16 v8, v8, 0xff

    .line 576
    .local v8, "d":I
    const/16 v9, 0x25

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 577
    ushr-int/lit8 v9, v8, 0x4

    invoke-static {v9}, Lcom/trendmicro/hippo/NativeGlobal;->toHexChar(I)C

    move-result v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 578
    and-int/lit8 v9, v8, 0xf

    invoke-static {v9}, Lcom/trendmicro/hippo/NativeGlobal;->toHexChar(I)C

    move-result v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 574
    .end local v8    # "d":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 543
    .end local v4    # "C":C
    .end local v5    # "V":I
    .end local v6    # "L":I
    .end local v7    # "j":I
    :cond_8
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 582
    .end local v2    # "k":I
    .end local v3    # "length":I
    :cond_9
    if-nez v1, :cond_a

    move-object v2, p0

    goto :goto_6

    :cond_a
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_6
    return-object v2
.end method

.method private static encodeUnescaped(CZ)Z
    .locals 3
    .param p0, "c"    # C
    .param p1, "fullUri"    # Z

    .line 707
    const/4 v0, 0x1

    const/16 v1, 0x41

    if-gt v1, p0, :cond_0

    const/16 v1, 0x5a

    if-le p0, v1, :cond_2

    :cond_0
    const/16 v1, 0x61

    if-gt v1, p0, :cond_1

    const/16 v1, 0x7a

    if-le p0, v1, :cond_2

    :cond_1
    const/16 v1, 0x30

    if-gt v1, p0, :cond_3

    const/16 v1, 0x39

    if-gt p0, v1, :cond_3

    .line 709
    :cond_2
    return v0

    .line 711
    :cond_3
    const-string v1, "-_.!~*\'()"

    invoke-virtual {v1, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_4

    .line 712
    return v0

    .line 714
    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_6

    .line 715
    const-string v2, ";/?:@&=+$,#"

    invoke-virtual {v2, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_5

    goto :goto_0

    :cond_5
    move v0, v1

    :goto_0
    return v0

    .line 717
    :cond_6
    return v1
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 17
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 31
    move-object/from16 v9, p1

    new-instance v1, Lcom/trendmicro/hippo/NativeGlobal;

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeGlobal;-><init>()V

    .line 33
    .local v1, "obj":Lcom/trendmicro/hippo/NativeGlobal;
    const/4 v0, 0x1

    move v7, v0

    .local v7, "id":I
    :goto_0
    const/16 v0, 0xd

    if-gt v7, v0, :cond_1

    .line 35
    const/4 v0, 0x1

    .line 36
    .local v0, "arity":I
    packed-switch v7, :pswitch_data_0

    .line 78
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 75
    :pswitch_0
    const-string v2, "uneval"

    .line 76
    .local v2, "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto/16 :goto_1

    .line 72
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_1
    const-string v2, "unescape"

    .line 73
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 68
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_2
    const-string v2, "parseInt"

    .line 69
    .restart local v2    # "name":Ljava/lang/String;
    const/4 v0, 0x2

    .line 70
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 65
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_3
    const-string v2, "parseFloat"

    .line 66
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 62
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_4
    const-string v2, "isXMLName"

    .line 63
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 59
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_5
    const-string v2, "isNaN"

    .line 60
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 56
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_6
    const-string v2, "isFinite"

    .line 57
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 53
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_7
    const-string v2, "eval"

    .line 54
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 50
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_8
    const-string v2, "escape"

    .line 51
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 47
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_9
    const-string v2, "encodeURIComponent"

    .line 48
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 44
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_a
    const-string v2, "encodeURI"

    .line 45
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 41
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_b
    const-string v2, "decodeURIComponent"

    .line 42
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    goto :goto_1

    .line 38
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_c
    const-string v2, "decodeURI"

    .line 39
    .restart local v2    # "name":Ljava/lang/String;
    move v8, v0

    move-object v10, v2

    .line 80
    .end local v0    # "arity":I
    .end local v2    # "name":Ljava/lang/String;
    .local v8, "arity":I
    .local v10, "name":Ljava/lang/String;
    :goto_1
    new-instance v11, Lcom/trendmicro/hippo/IdFunctionObject;

    sget-object v2, Lcom/trendmicro/hippo/NativeGlobal;->FTAG:Ljava/lang/Object;

    move-object v0, v11

    move v3, v7

    move-object v4, v10

    move v5, v8

    move-object/from16 v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/trendmicro/hippo/IdFunctionObject;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V

    .line 82
    .local v0, "f":Lcom/trendmicro/hippo/IdFunctionObject;
    if-eqz p2, :cond_0

    .line 83
    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->sealObject()V

    .line 85
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->exportAsScopeProperty()V

    .line 33
    .end local v0    # "f":Lcom/trendmicro/hippo/IdFunctionObject;
    .end local v8    # "arity":I
    .end local v10    # "name":Ljava/lang/String;
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 88
    .end local v7    # "id":I
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    const-string v2, "NaN"

    const/4 v3, 0x7

    invoke-static {v9, v2, v0, v3}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 91
    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 93
    invoke-static {v4, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 91
    const-string v2, "Infinity"

    invoke-static {v9, v2, v0, v3}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 95
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    const-string v2, "undefined"

    invoke-static {v9, v2, v0, v3}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 103
    invoke-static {}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->values()[Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    move-result-object v0

    array-length v10, v0

    const/4 v2, 0x0

    move v11, v2

    :goto_2
    if-ge v11, v10, :cond_4

    aget-object v12, v0, v11

    .line 104
    .local v12, "error":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    sget-object v2, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->Error:Lcom/trendmicro/hippo/TopLevel$NativeErrors;

    if-ne v12, v2, :cond_2

    .line 106
    move-object/from16 v14, p0

    goto :goto_3

    .line 108
    :cond_2
    invoke-virtual {v12}, Lcom/trendmicro/hippo/TopLevel$NativeErrors;->name()Ljava/lang/String;

    move-result-object v13

    .line 109
    .local v13, "name":Ljava/lang/String;
    sget-object v2, Lcom/trendmicro/hippo/TopLevel$Builtins;->Error:Lcom/trendmicro/hippo/TopLevel$Builtins;

    sget-object v3, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 110
    move-object/from16 v14, p0

    invoke-static {v14, v9, v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->newBuiltinObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/trendmicro/hippo/ScriptableObject;

    .line 113
    .local v15, "errorProto":Lcom/trendmicro/hippo/ScriptableObject;
    const-string v2, "name"

    invoke-virtual {v15, v2, v15, v13}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 114
    const-string v2, "message"

    const-string v3, ""

    invoke-virtual {v15, v2, v15, v3}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 115
    new-instance v16, Lcom/trendmicro/hippo/IdFunctionObject;

    sget-object v4, Lcom/trendmicro/hippo/NativeGlobal;->FTAG:Ljava/lang/Object;

    const/16 v5, 0xe

    const/4 v7, 0x1

    move-object/from16 v2, v16

    move-object v3, v1

    move-object v6, v13

    move-object/from16 v8, p1

    invoke-direct/range {v2 .. v8}, Lcom/trendmicro/hippo/IdFunctionObject;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V

    .line 118
    .local v2, "ctor":Lcom/trendmicro/hippo/IdFunctionObject;
    invoke-virtual {v2, v15}, Lcom/trendmicro/hippo/IdFunctionObject;->markAsConstructor(Lcom/trendmicro/hippo/Scriptable;)V

    .line 119
    const-string v3, "constructor"

    invoke-virtual {v15, v3, v15, v2}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 120
    const/4 v4, 0x2

    invoke-virtual {v15, v3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->setAttributes(Ljava/lang/String;I)V

    .line 121
    if-eqz p2, :cond_3

    .line 122
    invoke-virtual {v15}, Lcom/trendmicro/hippo/ScriptableObject;->sealObject()V

    .line 123
    invoke-virtual {v2}, Lcom/trendmicro/hippo/IdFunctionObject;->sealObject()V

    .line 125
    :cond_3
    invoke-virtual {v2}, Lcom/trendmicro/hippo/IdFunctionObject;->exportAsScopeProperty()V

    .line 103
    .end local v2    # "ctor":Lcom/trendmicro/hippo/IdFunctionObject;
    .end local v12    # "error":Lcom/trendmicro/hippo/TopLevel$NativeErrors;
    .end local v13    # "name":Ljava/lang/String;
    .end local v15    # "errorProto":Lcom/trendmicro/hippo/ScriptableObject;
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 127
    :cond_4
    move-object/from16 v14, p0

    return-void

    :pswitch_data_0
    .packed-switch 0x1
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
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static isEvalFunction(Ljava/lang/Object;)Z
    .locals 3
    .param p0, "functionObj"    # Ljava/lang/Object;

    .line 490
    instance-of v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;

    if-eqz v0, :cond_0

    .line 491
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/IdFunctionObject;

    .line 492
    .local v0, "function":Lcom/trendmicro/hippo/IdFunctionObject;
    sget-object v1, Lcom/trendmicro/hippo/NativeGlobal;->FTAG:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v1

    const/4 v2, 0x6

    if-ne v1, v2, :cond_0

    .line 493
    const/4 v1, 0x1

    return v1

    .line 496
    .end local v0    # "function":Lcom/trendmicro/hippo/IdFunctionObject;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private js_escape([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14
    .param p1, "args"    # [Ljava/lang/Object;

    .line 374
    const/4 v0, 0x1

    .line 375
    .local v0, "URL_XALPHAS":I
    const/4 v1, 0x2

    .line 376
    .local v1, "URL_XPALPHAS":I
    const/4 v2, 0x4

    .line 378
    .local v2, "URL_PATH":I
    const/4 v3, 0x0

    invoke-static {p1, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v3

    .line 380
    .local v3, "s":Ljava/lang/String;
    const/4 v4, 0x7

    .line 381
    .local v4, "mask":I
    array-length v5, p1

    const/4 v6, 0x1

    if-le v5, v6, :cond_1

    .line 382
    aget-object v5, p1, v6

    invoke-static {v5}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v5

    .line 383
    .local v5, "d":D
    cmpl-double v7, v5, v5

    if-nez v7, :cond_0

    double-to-int v7, v5

    move v4, v7

    int-to-double v7, v7

    cmpl-double v7, v7, v5

    if-nez v7, :cond_0

    and-int/lit8 v7, v4, -0x8

    if-nez v7, :cond_0

    goto :goto_0

    .line 386
    :cond_0
    const-string v7, "msg.bad.esc.mask"

    invoke-static {v7}, Lcom/trendmicro/hippo/Context;->reportRuntimeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v7

    throw v7

    .line 390
    .end local v5    # "d":D
    :cond_1
    :goto_0
    const/4 v5, 0x0

    .line 391
    .local v5, "sb":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .local v6, "k":I
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    .local v7, "L":I
    :goto_1
    if-eq v6, v7, :cond_c

    .line 392
    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 393
    .local v8, "c":I
    const/16 v9, 0x2b

    if-eqz v4, :cond_6

    const/16 v10, 0x30

    if-lt v8, v10, :cond_2

    const/16 v10, 0x39

    if-le v8, v10, :cond_5

    :cond_2
    const/16 v10, 0x41

    if-lt v8, v10, :cond_3

    const/16 v10, 0x5a

    if-le v8, v10, :cond_5

    :cond_3
    const/16 v10, 0x61

    if-lt v8, v10, :cond_4

    const/16 v10, 0x7a

    if-le v8, v10, :cond_5

    :cond_4
    const/16 v10, 0x40

    if-eq v8, v10, :cond_5

    const/16 v10, 0x2a

    if-eq v8, v10, :cond_5

    const/16 v10, 0x5f

    if-eq v8, v10, :cond_5

    const/16 v10, 0x2d

    if-eq v8, v10, :cond_5

    const/16 v10, 0x2e

    if-eq v8, v10, :cond_5

    and-int/lit8 v10, v4, 0x4

    if-eqz v10, :cond_6

    const/16 v10, 0x2f

    if-eq v8, v10, :cond_5

    if-ne v8, v9, :cond_6

    .line 399
    :cond_5
    if-eqz v5, :cond_b

    .line 400
    int-to-char v9, v8

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 403
    :cond_6
    if-nez v5, :cond_7

    .line 404
    new-instance v10, Ljava/lang/StringBuilder;

    add-int/lit8 v11, v7, 0x3

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object v5, v10

    .line 405
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 410
    :cond_7
    const/16 v10, 0x100

    const/16 v11, 0x25

    if-ge v8, v10, :cond_9

    .line 411
    const/16 v10, 0x20

    if-ne v8, v10, :cond_8

    const/4 v10, 0x2

    if-ne v4, v10, :cond_8

    .line 412
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 413
    goto :goto_5

    .line 415
    :cond_8
    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 416
    const/4 v9, 0x2

    .local v9, "hexSize":I
    goto :goto_2

    .line 418
    .end local v9    # "hexSize":I
    :cond_9
    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 419
    const/16 v9, 0x75

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 420
    const/4 v9, 0x4

    .line 424
    .restart local v9    # "hexSize":I
    :goto_2
    add-int/lit8 v10, v9, -0x1

    mul-int/lit8 v10, v10, 0x4

    .local v10, "shift":I
    :goto_3
    if-ltz v10, :cond_b

    .line 425
    shr-int v11, v8, v10

    and-int/lit8 v11, v11, 0xf

    .line 426
    .local v11, "digit":I
    const/16 v12, 0xa

    if-ge v11, v12, :cond_a

    add-int/lit8 v12, v11, 0x30

    goto :goto_4

    :cond_a
    add-int/lit8 v12, v11, 0x37

    .line 427
    .local v12, "hc":I
    :goto_4
    int-to-char v13, v12

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 424
    .end local v11    # "digit":I
    .end local v12    # "hc":I
    add-int/lit8 v10, v10, -0x4

    goto :goto_3

    .line 391
    .end local v8    # "c":I
    .end local v9    # "hexSize":I
    .end local v10    # "shift":I
    :cond_b
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1

    .line 432
    .end local v6    # "k":I
    .end local v7    # "L":I
    :cond_c
    if-nez v5, :cond_d

    move-object v6, v3

    goto :goto_6

    :cond_d
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_6
    return-object v6
.end method

.method private js_eval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 484
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v6

    .line 485
    .local v6, "global":Lcom/trendmicro/hippo/Scriptable;
    const-string v4, "eval code"

    const/4 v5, 0x1

    move-object v0, p1

    move-object v1, v6

    move-object v2, v6

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/ScriptRuntime;->evalSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static js_parseFloat([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13
    .param p0, "args"    # [Ljava/lang/Object;

    .line 265
    array-length v0, p0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 266
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v0

    .line 268
    :cond_0
    const/4 v0, 0x0

    aget-object v1, p0, v0

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 269
    .local v1, "s":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 270
    .local v2, "len":I
    const/4 v3, 0x0

    .line 274
    .local v3, "start":I
    :goto_0
    if-ne v3, v2, :cond_1

    .line 275
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v0

    .line 277
    :cond_1
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 278
    .local v4, "c":C
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v5

    if-nez v5, :cond_12

    .line 279
    nop

    .line 284
    move v5, v3

    .line 285
    .local v5, "i":I
    const/16 v6, 0x2b

    const/16 v7, 0x2d

    if-eq v4, v6, :cond_2

    if-ne v4, v7, :cond_4

    .line 286
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 287
    if-ne v5, v2, :cond_3

    .line 288
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v0

    .line 290
    :cond_3
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 293
    :cond_4
    const/16 v8, 0x49

    if-ne v4, v8, :cond_7

    .line 295
    add-int/lit8 v6, v5, 0x8

    if-gt v6, v2, :cond_6

    const-string v6, "Infinity"

    const/16 v8, 0x8

    invoke-virtual {v1, v5, v6, v0, v8}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 297
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v7, :cond_5

    .line 298
    const-wide/high16 v6, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .local v6, "d":D
    goto :goto_1

    .line 300
    .end local v6    # "d":D
    :cond_5
    const-wide/high16 v6, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 302
    .restart local v6    # "d":D
    :goto_1
    invoke-static {v6, v7}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    return-object v0

    .line 304
    .end local v6    # "d":D
    :cond_6
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v0

    .line 308
    :cond_7
    const/4 v0, -0x1

    .line 309
    .local v0, "decimal":I
    const/4 v8, -0x1

    .line 310
    .local v8, "exponent":I
    const/4 v9, 0x0

    .line 311
    .local v9, "exponentValid":Z
    :goto_2
    const/4 v10, -0x1

    if-ge v5, v2, :cond_10

    .line 312
    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-eq v11, v6, :cond_d

    const/16 v12, 0x45

    if-eq v11, v12, :cond_a

    const/16 v12, 0x65

    if-eq v11, v12, :cond_a

    if-eq v11, v7, :cond_d

    const/16 v12, 0x2e

    if-eq v11, v12, :cond_8

    packed-switch v11, :pswitch_data_0

    .line 348
    goto :goto_4

    .line 342
    :pswitch_0
    if-eq v8, v10, :cond_f

    .line 343
    const/4 v9, 0x1

    goto :goto_3

    .line 314
    :cond_8
    if-eq v0, v10, :cond_9

    .line 315
    goto :goto_4

    .line 316
    :cond_9
    move v0, v5

    .line 317
    goto :goto_3

    .line 321
    :cond_a
    if-eq v8, v10, :cond_b

    .line 322
    goto :goto_4

    .line 323
    :cond_b
    add-int/lit8 v11, v2, -0x1

    if-ne v5, v11, :cond_c

    .line 324
    goto :goto_4

    .line 326
    :cond_c
    move v8, v5

    .line 327
    goto :goto_3

    .line 332
    :cond_d
    add-int/lit8 v11, v5, -0x1

    if-eq v8, v11, :cond_e

    .line 333
    goto :goto_4

    .line 334
    :cond_e
    add-int/lit8 v11, v2, -0x1

    if-ne v5, v11, :cond_f

    .line 335
    add-int/lit8 v5, v5, -0x1

    .line 336
    goto :goto_4

    .line 311
    :cond_f
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 352
    :cond_10
    :goto_4
    if-eq v8, v10, :cond_11

    if-nez v9, :cond_11

    .line 353
    move v5, v8

    .line 355
    :cond_11
    invoke-virtual {v1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 357
    :try_start_0
    invoke-static {v1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v6

    .line 359
    :catch_0
    move-exception v6

    .line 360
    .local v6, "ex":Ljava/lang/NumberFormatException;
    sget-object v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v7

    .line 281
    .end local v0    # "decimal":I
    .end local v5    # "i":I
    .end local v6    # "ex":Ljava/lang/NumberFormatException;
    .end local v8    # "exponent":I
    .end local v9    # "exponentValid":Z
    :cond_12
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x30
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
.end method

.method static js_parseInt([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p0, "args"    # [Ljava/lang/Object;

    .line 209
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v1

    .line 210
    .local v1, "s":Ljava/lang/String;
    const/4 v2, 0x1

    invoke-static {p0, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32([Ljava/lang/Object;I)I

    move-result v3

    .line 212
    .local v3, "radix":I
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    .line 213
    .local v4, "len":I
    if-nez v4, :cond_0

    .line 214
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v0

    .line 216
    :cond_0
    const/4 v5, 0x0

    .line 217
    .local v5, "negative":Z
    const/4 v6, 0x0

    .line 220
    .local v6, "start":I
    :cond_1
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 221
    .local v7, "c":C
    invoke-static {v7}, Lcom/trendmicro/hippo/ScriptRuntime;->isStrWhiteSpaceChar(I)Z

    move-result v8

    if-nez v8, :cond_2

    .line 222
    goto :goto_0

    .line 223
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 224
    if-lt v6, v4, :cond_1

    .line 226
    :goto_0
    const/16 v8, 0x2b

    if-eq v7, v8, :cond_4

    const/16 v8, 0x2d

    if-ne v7, v8, :cond_3

    move v0, v2

    :cond_3
    move v5, v0

    if-eqz v0, :cond_5

    .line 227
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 229
    :cond_5
    const/4 v0, -0x1

    .line 230
    .local v0, "NO_RADIX":I
    const/16 v8, 0x58

    const/16 v9, 0x78

    const/16 v10, 0x30

    if-nez v3, :cond_6

    .line 231
    const/4 v3, -0x1

    goto :goto_1

    .line 232
    :cond_6
    const/4 v11, 0x2

    if-lt v3, v11, :cond_e

    const/16 v11, 0x24

    if-le v3, v11, :cond_7

    goto :goto_5

    .line 234
    :cond_7
    const/16 v11, 0x10

    if-ne v3, v11, :cond_9

    sub-int v11, v4, v6

    if-le v11, v2, :cond_9

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-ne v11, v10, :cond_9

    .line 235
    add-int/lit8 v11, v6, 0x1

    invoke-virtual {v1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 236
    if-eq v7, v9, :cond_8

    if-ne v7, v8, :cond_9

    .line 237
    :cond_8
    add-int/lit8 v6, v6, 0x2

    .line 240
    :cond_9
    :goto_1
    const/4 v11, -0x1

    if-ne v3, v11, :cond_c

    .line 241
    const/16 v3, 0xa

    .line 242
    sub-int v11, v4, v6

    if-le v11, v2, :cond_c

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v10, :cond_c

    .line 243
    add-int/lit8 v2, v6, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 244
    if-eq v7, v9, :cond_b

    if-ne v7, v8, :cond_a

    goto :goto_2

    .line 247
    :cond_a
    if-gt v10, v7, :cond_c

    const/16 v2, 0x39

    if-gt v7, v2, :cond_c

    .line 248
    const/16 v3, 0x8

    .line 249
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 245
    :cond_b
    :goto_2
    const/16 v3, 0x10

    .line 246
    add-int/lit8 v6, v6, 0x2

    .line 254
    :cond_c
    :goto_3
    invoke-static {v1, v6, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->stringPrefixToNumber(Ljava/lang/String;II)D

    move-result-wide v8

    .line 255
    .local v8, "d":D
    if-eqz v5, :cond_d

    neg-double v10, v8

    goto :goto_4

    :cond_d
    move-wide v10, v8

    :goto_4
    invoke-static {v10, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    return-object v2

    .line 233
    .end local v8    # "d":D
    :cond_e
    :goto_5
    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    return-object v2
.end method

.method private js_unescape([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14
    .param p1, "args"    # [Ljava/lang/Object;

    .line 441
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v1

    .line 442
    .local v1, "s":Ljava/lang/String;
    const/16 v2, 0x25

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 443
    .local v3, "firstEscapePos":I
    if-ltz v3, :cond_4

    .line 444
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    .line 445
    .local v4, "L":I
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    .line 446
    .local v5, "buf":[C
    move v6, v3

    .line 447
    .local v6, "destination":I
    move v7, v3

    .local v7, "k":I
    :goto_0
    if-eq v7, v4, :cond_3

    .line 448
    aget-char v8, v5, v7

    .line 449
    .local v8, "c":C
    add-int/lit8 v7, v7, 0x1

    .line 450
    if-ne v8, v2, :cond_2

    if-eq v7, v4, :cond_2

    .line 452
    aget-char v9, v5, v7

    const/16 v10, 0x75

    if-ne v9, v10, :cond_0

    .line 453
    add-int/lit8 v9, v7, 0x1

    .line 454
    .local v9, "start":I
    add-int/lit8 v10, v7, 0x5

    .local v10, "end":I
    goto :goto_1

    .line 456
    .end local v9    # "start":I
    .end local v10    # "end":I
    :cond_0
    move v9, v7

    .line 457
    .restart local v9    # "start":I
    add-int/lit8 v10, v7, 0x2

    .line 459
    .restart local v10    # "end":I
    :goto_1
    if-gt v10, v4, :cond_2

    .line 460
    const/4 v11, 0x0

    .line 461
    .local v11, "x":I
    move v12, v9

    .local v12, "i":I
    :goto_2
    if-eq v12, v10, :cond_1

    .line 462
    aget-char v13, v5, v12

    invoke-static {v13, v11}, Lcom/trendmicro/hippo/Kit;->xDigitToInt(II)I

    move-result v11

    .line 461
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 464
    .end local v12    # "i":I
    :cond_1
    if-ltz v11, :cond_2

    .line 465
    int-to-char v8, v11

    .line 466
    move v7, v10

    .line 470
    .end local v9    # "start":I
    .end local v10    # "end":I
    .end local v11    # "x":I
    :cond_2
    aput-char v8, v5, v6

    .line 471
    nop

    .end local v8    # "c":C
    add-int/lit8 v6, v6, 0x1

    .line 472
    goto :goto_0

    .line 473
    .end local v7    # "k":I
    :cond_3
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v5, v0, v6}, Ljava/lang/String;-><init>([CII)V

    move-object v1, v2

    .line 475
    .end local v4    # "L":I
    .end local v5    # "buf":[C
    .end local v6    # "destination":I
    :cond_4
    return-object v1
.end method

.method private static oneUcs4ToUtf8Char([BI)I
    .locals 6
    .param p0, "utf8Buffer"    # [B
    .param p1, "ucs4Char"    # I

    .line 732
    const/4 v0, 0x1

    .line 735
    .local v0, "utf8Length":I
    and-int/lit8 v1, p1, -0x80

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 736
    int-to-byte v1, p1

    aput-byte v1, p0, v2

    goto :goto_2

    .line 739
    :cond_0
    ushr-int/lit8 v1, p1, 0xb

    .line 740
    .local v1, "a":I
    const/4 v0, 0x2

    .line 741
    :goto_0
    if-eqz v1, :cond_1

    .line 742
    ushr-int/lit8 v1, v1, 0x5

    .line 743
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 745
    :cond_1
    move v3, v0

    .line 746
    .local v3, "i":I
    :goto_1
    add-int/lit8 v3, v3, -0x1

    if-lez v3, :cond_2

    .line 747
    and-int/lit8 v4, p1, 0x3f

    or-int/lit16 v4, v4, 0x80

    int-to-byte v4, v4

    aput-byte v4, p0, v3

    .line 748
    ushr-int/lit8 p1, p1, 0x6

    goto :goto_1

    .line 750
    :cond_2
    rsub-int/lit8 v4, v0, 0x8

    const/4 v5, 0x1

    shl-int v4, v5, v4

    rsub-int v4, v4, 0x100

    add-int/2addr v4, p1

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    .line 752
    .end local v1    # "a":I
    .end local v3    # "i":I
    :goto_2
    return v0
.end method

.method private static toHexChar(I)C
    .locals 1
    .param p0, "i"    # I

    .line 586
    shr-int/lit8 v0, p0, 0x4

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 587
    :cond_0
    const/16 v0, 0xa

    if-ge p0, v0, :cond_1

    add-int/lit8 v0, p0, 0x30

    goto :goto_0

    :cond_1
    add-int/lit8 v0, p0, -0xa

    add-int/lit8 v0, v0, 0x41

    :goto_0
    int-to-char v0, v0

    return v0
.end method

.method private static unHex(C)I
    .locals 1
    .param p0, "c"    # C

    .line 591
    const/16 v0, 0x41

    if-gt v0, p0, :cond_0

    const/16 v0, 0x46

    if-gt p0, v0, :cond_0

    .line 592
    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    return v0

    .line 593
    :cond_0
    const/16 v0, 0x61

    if-gt v0, p0, :cond_1

    const/16 v0, 0x66

    if-gt p0, v0, :cond_1

    .line 594
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    return v0

    .line 595
    :cond_1
    const/16 v0, 0x30

    if-gt v0, p0, :cond_2

    const/16 v0, 0x39

    if-gt p0, v0, :cond_2

    .line 596
    add-int/lit8 v0, p0, -0x30

    return v0

    .line 598
    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method private static unHex(CC)I
    .locals 3
    .param p0, "c1"    # C
    .param p1, "c2"    # C

    .line 603
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeGlobal;->unHex(C)I

    move-result v0

    .line 604
    .local v0, "i1":I
    invoke-static {p1}, Lcom/trendmicro/hippo/NativeGlobal;->unHex(C)I

    move-result v1

    .line 605
    .local v1, "i2":I
    if-ltz v0, :cond_0

    if-ltz v1, :cond_0

    .line 606
    shl-int/lit8 v2, v0, 0x4

    or-int/2addr v2, v1

    return v2

    .line 608
    :cond_0
    const/4 v2, -0x1

    return v2
.end method

.method private static uriError()Lcom/trendmicro/hippo/EcmaError;
    .locals 2

    .line 721
    nop

    .line 722
    const-string v0, "msg.bad.uri"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 721
    const-string v1, "URIError"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 133
    sget-object v0, Lcom/trendmicro/hippo/NativeGlobal;->FTAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 134
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 135
    .local v0, "methodId":I
    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_5

    .line 199
    :pswitch_0
    invoke-static {p2, p3, p1, p5}, Lcom/trendmicro/hippo/NativeError;->make(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;[Ljava/lang/Object;)Lcom/trendmicro/hippo/NativeError;

    move-result-object v1

    return-object v1

    .line 191
    :pswitch_1
    array-length v1, p5

    if-eqz v1, :cond_0

    .line 192
    aget-object v1, p5, v2

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 193
    .local v1, "value":Ljava/lang/Object;
    :goto_0
    invoke-static {p2, p3, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->uneval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 188
    .end local v1    # "value":Ljava/lang/Object;
    :pswitch_2
    invoke-direct {p0, p5}, Lcom/trendmicro/hippo/NativeGlobal;->js_unescape([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 185
    :pswitch_3
    invoke-static {p5}, Lcom/trendmicro/hippo/NativeGlobal;->js_parseInt([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 182
    :pswitch_4
    invoke-static {p5}, Lcom/trendmicro/hippo/NativeGlobal;->js_parseFloat([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 174
    :pswitch_5
    array-length v1, p5

    if-nez v1, :cond_1

    .line 175
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1

    :cond_1
    aget-object v1, p5, v2

    .line 176
    .local v1, "name":Ljava/lang/Object;
    :goto_1
    invoke-static {p3}, Lcom/trendmicro/hippo/xml/XMLLib;->extractFromScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/xml/XMLLib;

    move-result-object v2

    .line 177
    .local v2, "xmlLib":Lcom/trendmicro/hippo/xml/XMLLib;
    nop

    .line 178
    invoke-virtual {v2, p2, v1}, Lcom/trendmicro/hippo/xml/XMLLib;->isXMLName(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Z

    move-result v3

    .line 177
    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    return-object v3

    .line 164
    .end local v1    # "name":Ljava/lang/Object;
    .end local v2    # "xmlLib":Lcom/trendmicro/hippo/xml/XMLLib;
    :pswitch_6
    array-length v3, p5

    if-ge v3, v1, :cond_2

    .line 165
    const/4 v1, 0x1

    .local v1, "result":Z
    goto :goto_2

    .line 167
    .end local v1    # "result":Z
    :cond_2
    aget-object v3, p5, v2

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v3

    .line 168
    .local v3, "d":D
    cmpl-double v5, v3, v3

    if-eqz v5, :cond_3

    goto :goto_2

    :cond_3
    move v1, v2

    .line 170
    .end local v3    # "d":D
    .restart local v1    # "result":Z
    :goto_2
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v2

    return-object v2

    .line 155
    .end local v1    # "result":Z
    :pswitch_7
    array-length v3, p5

    if-ge v3, v1, :cond_4

    .line 156
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v1

    .line 158
    :cond_4
    aget-object v1, p5, v2

    invoke-static {v1}, Lcom/trendmicro/hippo/NativeNumber;->isFinite(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 152
    :pswitch_8
    invoke-direct {p0, p2, p3, p5}, Lcom/trendmicro/hippo/NativeGlobal;->js_eval(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 149
    :pswitch_9
    invoke-direct {p0, p5}, Lcom/trendmicro/hippo/NativeGlobal;->js_escape([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 144
    :pswitch_a
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v3

    .line 145
    .local v3, "str":Ljava/lang/String;
    const/4 v4, 0x3

    if-ne v0, v4, :cond_5

    goto :goto_3

    :cond_5
    move v1, v2

    :goto_3
    invoke-static {v3, v1}, Lcom/trendmicro/hippo/NativeGlobal;->encode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 138
    .end local v3    # "str":Ljava/lang/String;
    :pswitch_b
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v3

    .line 139
    .restart local v3    # "str":Ljava/lang/String;
    if-ne v0, v1, :cond_6

    goto :goto_4

    :cond_6
    move v1, v2

    :goto_4
    invoke-static {v3, v1}, Lcom/trendmicro/hippo/NativeGlobal;->decode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 202
    .end local v0    # "methodId":I
    .end local v3    # "str":Ljava/lang/String;
    :cond_7
    :goto_5
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->unknown()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_b
        :pswitch_a
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
