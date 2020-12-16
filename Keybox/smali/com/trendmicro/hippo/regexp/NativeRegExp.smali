.class public Lcom/trendmicro/hippo/regexp/NativeRegExp;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeRegExp.java"

# interfaces
.implements Lcom/trendmicro/hippo/Function;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final ANCHOR_BOL:I = -0x2

.field private static final INDEX_LEN:I = 0x2

.field private static final Id_compile:I = 0x1

.field private static final Id_exec:I = 0x4

.field private static final Id_global:I = 0x3

.field private static final Id_ignoreCase:I = 0x4

.field private static final Id_lastIndex:I = 0x1

.field private static final Id_multiline:I = 0x5

.field private static final Id_prefix:I = 0x6

.field private static final Id_source:I = 0x2

.field private static final Id_test:I = 0x5

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field public static final JSREG_FOLD:I = 0x2

.field public static final JSREG_GLOB:I = 0x1

.field public static final JSREG_MULTILINE:I = 0x4

.field public static final MATCH:I = 0x1

.field private static final MAX_INSTANCE_ID:I = 0x5

.field private static final MAX_PROTOTYPE_ID:I = 0x6

.field public static final PREFIX:I = 0x2

.field private static final REGEXP_TAG:Ljava/lang/Object;

.field private static final REOP_ALNUM:B = 0x9t

.field private static final REOP_ALT:B = 0x1ft

.field private static final REOP_ALTPREREQ:B = 0x35t

.field private static final REOP_ALTPREREQ2:B = 0x37t

.field private static final REOP_ALTPREREQi:B = 0x36t

.field private static final REOP_ASSERT:B = 0x29t

.field private static final REOP_ASSERTNOTTEST:B = 0x2ct

.field private static final REOP_ASSERTTEST:B = 0x2bt

.field private static final REOP_ASSERT_NOT:B = 0x2at

.field private static final REOP_BACKREF:B = 0xdt

.field private static final REOP_BOL:B = 0x2t

.field private static final REOP_CLASS:B = 0x16t

.field private static final REOP_DIGIT:B = 0x7t

.field private static final REOP_DOT:B = 0x6t

.field private static final REOP_EMPTY:B = 0x1t

.field private static final REOP_END:B = 0x39t

.field private static final REOP_ENDCHILD:B = 0x31t

.field private static final REOP_EOL:B = 0x3t

.field private static final REOP_FLAT:B = 0xet

.field private static final REOP_FLAT1:B = 0xft

.field private static final REOP_FLAT1i:B = 0x11t

.field private static final REOP_FLATi:B = 0x10t

.field private static final REOP_JUMP:B = 0x20t

.field private static final REOP_LPAREN:B = 0x1dt

.field private static final REOP_MINIMALOPT:B = 0x2ft

.field private static final REOP_MINIMALPLUS:B = 0x2et

.field private static final REOP_MINIMALQUANT:B = 0x30t

.field private static final REOP_MINIMALREPEAT:B = 0x34t

.field private static final REOP_MINIMALSTAR:B = 0x2dt

.field private static final REOP_NCLASS:B = 0x17t

.field private static final REOP_NONALNUM:B = 0xat

.field private static final REOP_NONDIGIT:B = 0x8t

.field private static final REOP_NONSPACE:B = 0xct

.field private static final REOP_OPT:B = 0x1ct

.field private static final REOP_PLUS:B = 0x1bt

.field private static final REOP_QUANT:B = 0x19t

.field private static final REOP_REPEAT:B = 0x33t

.field private static final REOP_RPAREN:B = 0x1et

.field private static final REOP_SIMPLE_END:B = 0x17t

.field private static final REOP_SIMPLE_START:B = 0x1t

.field private static final REOP_SPACE:B = 0xbt

.field private static final REOP_STAR:B = 0x1at

.field private static final REOP_UCFLAT1:B = 0x12t

.field private static final REOP_UCFLAT1i:B = 0x13t

.field private static final REOP_WBDRY:B = 0x4t

.field private static final REOP_WNONBDRY:B = 0x5t

.field public static final TEST:I = 0x0

.field private static final debug:Z = false

.field private static final serialVersionUID:J = 0x44e828d6a0fb3a60L


# instance fields
.field lastIndex:Ljava/lang/Object;

.field private lastIndexAttr:I

.field private re:Lcom/trendmicro/hippo/regexp/RECompiled;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    nop

    .line 42
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->REGEXP_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 218
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 2774
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 2775
    const/4 v0, 0x6

    iput v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndexAttr:I

    .line 218
    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RECompiled;)V
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "regexpCompiled"    # Lcom/trendmicro/hippo/regexp/RECompiled;

    .line 140
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 2774
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 2775
    const/4 v1, 0x6

    iput v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndexAttr:I

    .line 141
    iput-object p2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    .line 142
    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 143
    sget-object v0, Lcom/trendmicro/hippo/TopLevel$Builtins;->RegExp:Lcom/trendmicro/hippo/TopLevel$Builtins;

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->setBuiltinProtoAndParent(Lcom/trendmicro/hippo/ScriptableObject;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/TopLevel$Builtins;)V

    .line 144
    return-void
.end method

.method private static addCharacterRangeToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;CC)V
    .locals 7
    .param p0, "cs"    # Lcom/trendmicro/hippo/regexp/RECharSet;
    .param p1, "c1"    # C
    .param p2, "c2"    # C

    .line 1506
    div-int/lit8 v0, p1, 0x8

    .line 1507
    .local v0, "byteIndex1":I
    div-int/lit8 v1, p2, 0x8

    .line 1509
    .local v1, "byteIndex2":I
    iget v2, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    if-ge p2, v2, :cond_2

    if-gt p1, p2, :cond_2

    .line 1514
    and-int/lit8 v2, p1, 0x7

    int-to-char p1, v2

    .line 1515
    and-int/lit8 v2, p2, 0x7

    int-to-char p2, v2

    .line 1517
    const/16 v2, 0xff

    if-ne v0, v1, :cond_0

    .line 1518
    iget-object v3, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->bits:[B

    aget-byte v4, v3, v0

    sub-int v5, p2, p1

    rsub-int/lit8 v5, v5, 0x7

    shr-int/2addr v2, v5

    shl-int/2addr v2, p1

    or-int/2addr v2, v4

    int-to-byte v2, v2

    aput-byte v2, v3, v0

    goto :goto_1

    .line 1521
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->bits:[B

    aget-byte v4, v3, v0

    shl-int v5, v2, p1

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v3, v0

    .line 1522
    add-int/lit8 v3, v0, 0x1

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 1523
    iget-object v4, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->bits:[B

    const/4 v5, -0x1

    aput-byte v5, v4, v3

    .line 1522
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1524
    :cond_1
    iget-object v4, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->bits:[B

    aget-byte v5, v4, v1

    rsub-int/lit8 v6, p2, 0x7

    shr-int/2addr v2, v6

    or-int/2addr v2, v5

    int-to-byte v2, v2

    aput-byte v2, v4, v1

    .line 1526
    .end local v3    # "i":I
    :goto_1
    return-void

    .line 1510
    :cond_2
    const-string v2, "SyntaxError"

    const-string v3, "invalid range in character class"

    invoke-static {v2, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v2

    throw v2
.end method

.method private static addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V
    .locals 5
    .param p0, "cs"    # Lcom/trendmicro/hippo/regexp/RECharSet;
    .param p1, "c"    # C

    .line 1491
    div-int/lit8 v0, p1, 0x8

    .line 1492
    .local v0, "byteIndex":I
    iget v1, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    if-ge p1, v1, :cond_0

    .line 1496
    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/RECharSet;->bits:[B

    aget-byte v2, v1, v0

    const/4 v3, 0x1

    and-int/lit8 v4, p1, 0x7

    shl-int/2addr v3, v4

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 1497
    return-void

    .line 1493
    :cond_0
    const-string v1, "SyntaxError"

    const-string v2, "invalid range in character class"

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private static addIndex([BII)I
    .locals 2
    .param p0, "array"    # [B
    .param p1, "pc"    # I
    .param p2, "index"    # I

    .line 1209
    if-ltz p2, :cond_1

    .line 1210
    const v0, 0xffff

    if-gt p2, v0, :cond_0

    .line 1212
    shr-int/lit8 v0, p2, 0x8

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 1213
    add-int/lit8 v0, p1, 0x1

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 1214
    add-int/lit8 v0, p1, 0x2

    return v0

    .line 1211
    :cond_0
    const-string v0, "Too complex regexp"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0

    .line 1209
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private static backrefMatcher(Lcom/trendmicro/hippo/regexp/REGlobalData;ILjava/lang/String;I)Z
    .locals 9
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "parenIndex"    # I
    .param p2, "input"    # Ljava/lang/String;
    .param p3, "end"    # I

    .line 1461
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    array-length v0, v0

    if-lt p1, v0, :cond_0

    goto :goto_1

    .line 1463
    :cond_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/regexp/REGlobalData;->parensIndex(I)I

    move-result v0

    .line 1464
    .local v0, "parenContent":I
    const/4 v2, -0x1

    const/4 v3, 0x1

    if-ne v0, v2, :cond_1

    .line 1465
    return v3

    .line 1467
    :cond_1
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/regexp/REGlobalData;->parensLength(I)I

    move-result v2

    .line 1468
    .local v2, "len":I
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v4, v2

    if-le v4, p3, :cond_2

    .line 1469
    return v1

    .line 1471
    :cond_2
    iget-object v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v4, v4, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/lit8 v4, v4, 0x2

    if-eqz v4, :cond_4

    .line 1472
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_5

    .line 1473
    add-int v5, v0, v4

    invoke-virtual {p2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 1474
    .local v5, "c1":C
    iget v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v6, v4

    invoke-virtual {p2, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 1475
    .local v6, "c2":C
    if-eq v5, v6, :cond_3

    invoke-static {v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v7

    invoke-static {v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v8

    if-eq v7, v8, :cond_3

    .line 1476
    return v1

    .line 1472
    .end local v5    # "c1":C
    .end local v6    # "c2":C
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1479
    .end local v4    # "i":I
    :cond_4
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p2, v0, p2, v4, v2}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v4

    if-nez v4, :cond_5

    .line 1480
    return v1

    .line 1482
    :cond_5
    iget v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1483
    return v3

    .line 1462
    .end local v0    # "parenContent":I
    .end local v2    # "len":I
    :cond_6
    :goto_1
    return v1
.end method

.method private static calculateBitmapSize(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RENode;[CII)Z
    .locals 18
    .param p0, "state"    # Lcom/trendmicro/hippo/regexp/CompilerState;
    .param p1, "target"    # Lcom/trendmicro/hippo/regexp/RENode;
    .param p2, "src"    # [C
    .param p3, "index"    # I
    .param p4, "end"    # I

    .line 557
    move-object/from16 v0, p1

    move/from16 v1, p3

    move/from16 v2, p4

    const/4 v3, 0x0

    .line 562
    .local v3, "rangeStart":C
    const/4 v4, 0x0

    .line 563
    .local v4, "max":I
    const/4 v5, 0x0

    .line 565
    .local v5, "inRange":Z
    const/4 v6, 0x0

    iput v6, v0, Lcom/trendmicro/hippo/regexp/RENode;->bmsize:I

    .line 566
    const/4 v7, 0x1

    iput-boolean v7, v0, Lcom/trendmicro/hippo/regexp/RENode;->sense:Z

    .line 568
    if-ne v1, v2, :cond_0

    .line 569
    return v7

    .line 571
    :cond_0
    aget-char v8, p2, v1

    const/16 v9, 0x5e

    if-ne v8, v9, :cond_1

    .line 572
    add-int/lit8 v1, v1, 0x1

    .line 573
    .end local p3    # "index":I
    .local v1, "index":I
    iput-boolean v6, v0, Lcom/trendmicro/hippo/regexp/RENode;->sense:Z

    .line 576
    :cond_1
    :goto_0
    if-eq v1, v2, :cond_13

    .line 577
    const/4 v8, 0x0

    .line 578
    .local v8, "localMax":I
    const/4 v9, 0x2

    .line 579
    .local v9, "nDigits":I
    aget-char v10, p2, v1

    const/16 v11, 0x5c

    const-string v12, ""

    const-string v13, "msg.bad.range"

    if-eq v10, v11, :cond_2

    .line 683
    add-int/lit8 v10, v1, 0x1

    .end local v1    # "index":I
    .local v10, "index":I
    aget-char v1, p2, v1

    move v8, v1

    move v1, v10

    .end local v8    # "localMax":I
    .local v1, "localMax":I
    goto/16 :goto_5

    .line 581
    .end local v10    # "index":I
    .local v1, "index":I
    .restart local v8    # "localMax":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 582
    add-int/lit8 v10, v1, 0x1

    .end local v1    # "index":I
    .restart local v10    # "index":I
    aget-char v1, p2, v1

    .line 583
    .local v1, "c":C
    const/16 v11, 0x44

    if-eq v1, v11, :cond_5

    const/16 v11, 0x53

    if-eq v1, v11, :cond_5

    const/16 v11, 0x57

    if-eq v1, v11, :cond_5

    const/16 v11, 0x66

    if-eq v1, v11, :cond_b

    const/16 v11, 0x6e

    if-eq v1, v11, :cond_a

    packed-switch v1, :pswitch_data_0

    packed-switch v1, :pswitch_data_1

    packed-switch v1, :pswitch_data_2

    .line 678
    move v8, v1

    .line 679
    move v1, v10

    goto/16 :goto_5

    .line 600
    :pswitch_0
    const/16 v8, 0xb

    .line 601
    move v1, v10

    goto/16 :goto_5

    .line 610
    :pswitch_1
    add-int/lit8 v9, v9, 0x2

    .line 613
    :pswitch_2
    const/4 v11, 0x0

    .line 614
    .local v11, "n":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_1
    if-ge v14, v9, :cond_4

    if-ge v10, v2, :cond_4

    .line 615
    add-int/lit8 v15, v10, 0x1

    .end local v10    # "index":I
    .local v15, "index":I
    aget-char v1, p2, v10

    .line 616
    invoke-static {v1, v11}, Lcom/trendmicro/hippo/Kit;->xDigitToInt(II)I

    move-result v11

    .line 617
    if-gez v11, :cond_3

    .line 620
    add-int/lit8 v10, v14, 0x1

    sub-int v10, v15, v10

    .line 621
    .end local v15    # "index":I
    .restart local v10    # "index":I
    const/16 v11, 0x5c

    .line 622
    goto :goto_2

    .line 614
    .end local v10    # "index":I
    .restart local v15    # "index":I
    :cond_3
    add-int/lit8 v14, v14, 0x1

    move v10, v15

    goto :goto_1

    .line 625
    .end local v15    # "index":I
    .restart local v10    # "index":I
    :cond_4
    :goto_2
    move v8, v11

    .line 626
    move v1, v10

    goto/16 :goto_5

    .line 597
    .end local v11    # "n":I
    .end local v14    # "i":I
    :pswitch_3
    const/16 v8, 0x9

    .line 598
    move v1, v10

    goto/16 :goto_5

    .line 583
    :cond_5
    :pswitch_4
    move-object/from16 v11, p0

    goto/16 :goto_8

    .line 594
    :pswitch_5
    const/16 v8, 0xd

    .line 595
    move v1, v10

    goto/16 :goto_5

    .line 628
    :pswitch_6
    if-eqz v5, :cond_6

    .line 629
    invoke-static {v13, v12}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 630
    return v6

    .line 632
    :cond_6
    const/16 v8, 0x39

    .line 633
    move v1, v10

    goto :goto_5

    .line 603
    :pswitch_7
    if-ge v10, v2, :cond_7

    aget-char v11, p2, v10

    invoke-static {v11}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isControlLetter(C)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 604
    add-int/lit8 v11, v10, 0x1

    .end local v10    # "index":I
    .local v11, "index":I
    aget-char v10, p2, v10

    and-int/lit8 v10, v10, 0x1f

    int-to-char v8, v10

    goto :goto_3

    .line 606
    .end local v11    # "index":I
    .restart local v10    # "index":I
    :cond_7
    add-int/lit8 v11, v10, -0x1

    .line 607
    .end local v10    # "index":I
    .restart local v11    # "index":I
    :goto_3
    const/16 v8, 0x5c

    .line 608
    move v1, v11

    goto :goto_5

    .line 585
    .end local v11    # "index":I
    .restart local v10    # "index":I
    :pswitch_8
    const/16 v8, 0x8

    .line 586
    move v1, v10

    goto :goto_5

    .line 659
    :pswitch_9
    add-int/lit8 v11, v1, -0x30

    .line 660
    .local v11, "n":I
    aget-char v1, p2, v10

    .line 661
    const/16 v14, 0x30

    if-gt v14, v1, :cond_9

    const/16 v15, 0x37

    if-gt v1, v15, :cond_9

    .line 662
    add-int/lit8 v10, v10, 0x1

    .line 663
    mul-int/lit8 v16, v11, 0x8

    add-int/lit8 v17, v1, -0x30

    add-int v11, v16, v17

    .line 664
    aget-char v1, p2, v10

    .line 665
    if-gt v14, v1, :cond_9

    if-gt v1, v15, :cond_9

    .line 666
    add-int/lit8 v10, v10, 0x1

    .line 667
    mul-int/lit8 v14, v11, 0x8

    add-int/lit8 v15, v1, -0x30

    add-int/2addr v14, v15

    .line 668
    .restart local v14    # "i":I
    const/16 v15, 0xff

    if-gt v14, v15, :cond_8

    .line 669
    move v11, v14

    goto :goto_4

    .line 671
    :cond_8
    add-int/lit8 v10, v10, -0x1

    .line 674
    .end local v14    # "i":I
    :cond_9
    :goto_4
    move v8, v11

    .line 675
    move v1, v10

    goto :goto_5

    .line 591
    .end local v11    # "n":I
    :cond_a
    const/16 v8, 0xa

    .line 592
    move v1, v10

    goto :goto_5

    .line 588
    :cond_b
    const/16 v8, 0xc

    .line 589
    move v1, v10

    .line 686
    .end local v10    # "index":I
    .local v1, "index":I
    :goto_5
    if-eqz v5, :cond_d

    .line 687
    if-le v3, v8, :cond_c

    .line 688
    invoke-static {v13, v12}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 689
    return v6

    .line 691
    :cond_c
    const/4 v5, 0x0

    goto :goto_6

    .line 694
    :cond_d
    add-int/lit8 v10, v2, -0x1

    if-ge v1, v10, :cond_e

    .line 695
    aget-char v10, p2, v1

    const/16 v11, 0x2d

    if-ne v10, v11, :cond_e

    .line 696
    add-int/lit8 v1, v1, 0x1

    .line 697
    const/4 v5, 0x1

    .line 698
    int-to-char v3, v8

    .line 699
    goto/16 :goto_0

    .line 703
    :cond_e
    :goto_6
    move-object/from16 v11, p0

    iget v10, v11, Lcom/trendmicro/hippo/regexp/CompilerState;->flags:I

    and-int/lit8 v10, v10, 0x2

    if-eqz v10, :cond_10

    .line 704
    int-to-char v10, v8

    invoke-static {v10}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v10

    .line 705
    .local v10, "cu":C
    int-to-char v12, v8

    invoke-static {v12}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->downcase(C)C

    move-result v12

    .line 706
    .local v12, "cd":C
    if-lt v10, v12, :cond_f

    move v13, v10

    goto :goto_7

    :cond_f
    move v13, v12

    :goto_7
    move v8, v13

    .line 708
    .end local v10    # "cu":C
    .end local v12    # "cd":C
    :cond_10
    if-le v8, v4, :cond_11

    .line 709
    move v4, v8

    .line 710
    .end local v8    # "localMax":I
    :cond_11
    goto/16 :goto_0

    .line 639
    .local v1, "c":C
    .restart local v8    # "localMax":I
    .local v10, "index":I
    :goto_8
    if-eqz v5, :cond_12

    .line 640
    invoke-static {v13, v12}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    return v6

    .line 643
    :cond_12
    const/high16 v6, 0x10000

    iput v6, v0, Lcom/trendmicro/hippo/regexp/RENode;->bmsize:I

    .line 644
    return v7

    .line 711
    .end local v8    # "localMax":I
    .end local v9    # "nDigits":I
    .end local v10    # "index":I
    .local v1, "index":I
    :cond_13
    move-object/from16 v11, p0

    add-int/lit8 v6, v4, 0x1

    iput v6, v0, Lcom/trendmicro/hippo/regexp/RENode;->bmsize:I

    .line 712
    return v7

    nop

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_9
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x62
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x72
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_2
    .end packed-switch
.end method

.method private static classMatcher(Lcom/trendmicro/hippo/regexp/REGlobalData;Lcom/trendmicro/hippo/regexp/RECharSet;C)Z
    .locals 4
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "charSet"    # Lcom/trendmicro/hippo/regexp/RECharSet;
    .param p2, "ch"    # C

    .line 1738
    iget-boolean v0, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->converted:Z

    if-nez v0, :cond_0

    .line 1739
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->processCharSet(Lcom/trendmicro/hippo/regexp/REGlobalData;Lcom/trendmicro/hippo/regexp/RECharSet;)V

    .line 1742
    :cond_0
    shr-int/lit8 v0, p2, 0x3

    .line 1743
    .local v0, "byteIndex":I
    iget v1, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    iget v1, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    if-ge p2, v1, :cond_2

    iget-object v1, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->bits:[B

    aget-byte v1, v1, v0

    and-int/lit8 v3, p2, 0x7

    shl-int v3, v2, v3

    and-int/2addr v1, v3

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :cond_2
    :goto_0
    iget-boolean v1, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->sense:Z

    xor-int/2addr v1, v2

    return v1
.end method

.method static compileRE(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/trendmicro/hippo/regexp/RECompiled;
    .locals 10
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "global"    # Ljava/lang/String;
    .param p3, "flat"    # Z

    .line 285
    new-instance v0, Lcom/trendmicro/hippo/regexp/RECompiled;

    invoke-direct {v0, p1}, Lcom/trendmicro/hippo/regexp/RECompiled;-><init>(Ljava/lang/String;)V

    .line 286
    .local v0, "regexp":Lcom/trendmicro/hippo/regexp/RECompiled;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 287
    .local v1, "length":I
    const/4 v2, 0x0

    .line 288
    .local v2, "flags":I
    if-eqz p2, :cond_4

    .line 289
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 290
    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 291
    .local v4, "c":C
    const/4 v5, 0x0

    .line 292
    .local v5, "f":I
    const/16 v6, 0x67

    const-string v7, "msg.invalid.re.flag"

    if-ne v4, v6, :cond_0

    .line 293
    const/4 v5, 0x1

    goto :goto_1

    .line 294
    :cond_0
    const/16 v6, 0x69

    if-ne v4, v6, :cond_1

    .line 295
    const/4 v5, 0x2

    goto :goto_1

    .line 296
    :cond_1
    const/16 v6, 0x6d

    if-ne v4, v6, :cond_2

    .line 297
    const/4 v5, 0x4

    goto :goto_1

    .line 299
    :cond_2
    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    :goto_1
    and-int v6, v2, v5

    if-eqz v6, :cond_3

    .line 302
    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    :cond_3
    or-int/2addr v2, v5

    .line 289
    .end local v4    # "c":C
    .end local v5    # "f":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 307
    .end local v3    # "i":I
    :cond_4
    iput v2, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    .line 309
    new-instance v3, Lcom/trendmicro/hippo/regexp/CompilerState;

    iget-object v4, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    invoke-direct {v3, p0, v4, v1, v2}, Lcom/trendmicro/hippo/regexp/CompilerState;-><init>(Lcom/trendmicro/hippo/Context;[CII)V

    .line 310
    .local v3, "state":Lcom/trendmicro/hippo/regexp/CompilerState;
    const/4 v4, 0x0

    if-eqz p3, :cond_5

    if-lez v1, :cond_5

    .line 314
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v6, 0xe

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 315
    iget-object v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iget-object v6, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->cpbegin:[C

    aget-char v6, v6, v4

    iput-char v6, v5, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    .line 316
    iget-object v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v1, v5, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    .line 317
    iget-object v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v4, v5, Lcom/trendmicro/hippo/regexp/RENode;->flatIndex:I

    .line 318
    iget v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/lit8 v5, v5, 0x5

    iput v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    goto :goto_2

    .line 320
    :cond_5
    invoke-static {v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->parseDisjunction(Lcom/trendmicro/hippo/regexp/CompilerState;)Z

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_6

    .line 321
    return-object v6

    .line 325
    :cond_6
    iget v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->maxBackReference:I

    iget v7, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->parenCount:I

    if-le v5, v7, :cond_7

    .line 326
    new-instance v5, Lcom/trendmicro/hippo/regexp/CompilerState;

    iget-object v7, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    invoke-direct {v5, p0, v7, v1, v2}, Lcom/trendmicro/hippo/regexp/CompilerState;-><init>(Lcom/trendmicro/hippo/Context;[CII)V

    move-object v3, v5

    .line 327
    iget v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->parenCount:I

    iput v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->backReferenceLimit:I

    .line 328
    invoke-static {v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->parseDisjunction(Lcom/trendmicro/hippo/regexp/CompilerState;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 329
    return-object v6

    .line 333
    :cond_7
    :goto_2
    iget v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    const/4 v6, 0x1

    add-int/2addr v5, v6

    new-array v5, v5, [B

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->program:[B

    .line 334
    iget v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->classCount:I

    if-eqz v5, :cond_8

    .line 335
    iget v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->classCount:I

    new-array v5, v5, [Lcom/trendmicro/hippo/regexp/RECharSet;

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->classList:[Lcom/trendmicro/hippo/regexp/RECharSet;

    .line 336
    iget v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->classCount:I

    iput v5, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->classCount:I

    .line 338
    :cond_8
    iget-object v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    invoke-static {v3, v0, v4, v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->emitREBytecode(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RECompiled;ILcom/trendmicro/hippo/regexp/RENode;)I

    move-result v5

    .line 339
    .local v5, "endPC":I
    iget-object v7, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->program:[B

    add-int/lit8 v8, v5, 0x1

    .end local v5    # "endPC":I
    .local v8, "endPC":I
    const/16 v9, 0x39

    aput-byte v9, v7, v5

    .line 349
    iget v5, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->parenCount:I

    iput v5, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->parenCount:I

    .line 352
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->program:[B

    aget-byte v4, v5, v4

    const/4 v5, -0x2

    const/4 v7, 0x2

    if-eq v4, v7, :cond_a

    const/16 v9, 0x1f

    if-eq v4, v9, :cond_9

    packed-switch v4, :pswitch_data_0

    goto :goto_3

    .line 355
    :pswitch_0
    iget-object v4, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->program:[B

    invoke-static {v4, v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v4

    int-to-char v4, v4

    iput v4, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->anchorCh:I

    .line 356
    goto :goto_3

    .line 359
    :pswitch_1
    iget-object v4, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->program:[B

    aget-byte v4, v4, v6

    and-int/lit16 v4, v4, 0xff

    int-to-char v4, v4

    iput v4, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->anchorCh:I

    .line 360
    goto :goto_3

    .line 363
    :pswitch_2
    iget-object v4, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->program:[B

    invoke-static {v4, v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v4

    .line 364
    .local v4, "k":I
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    aget-char v5, v5, v4

    iput v5, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->anchorCh:I

    .line 365
    goto :goto_3

    .line 370
    .end local v4    # "k":I
    :cond_9
    iget-object v4, v3, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 371
    .local v4, "n":Lcom/trendmicro/hippo/regexp/RENode;
    iget-object v6, v4, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    iget-byte v6, v6, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    if-ne v6, v7, :cond_b

    iget-object v6, v4, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    iget-byte v6, v6, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    if-ne v6, v7, :cond_b

    .line 372
    iput v5, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->anchorCh:I

    goto :goto_3

    .line 367
    .end local v4    # "n":Lcom/trendmicro/hippo/regexp/RENode;
    :cond_a
    iput v5, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->anchorCh:I

    .line 368
    nop

    .line 382
    :cond_b
    :goto_3
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V
    .locals 2
    .param p0, "state"    # Lcom/trendmicro/hippo/regexp/CompilerState;
    .param p1, "c"    # C

    .line 771
    new-instance v0, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 772
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput-char p1, v0, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    .line 773
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    const/4 v1, 0x1

    iput v1, v0, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    .line 774
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    const/4 v1, -0x1

    iput v1, v0, Lcom/trendmicro/hippo/regexp/RENode;->flatIndex:I

    .line 775
    iget v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 776
    return-void
.end method

.method private static downcase(C)C
    .locals 2
    .param p0, "ch"    # C

    .line 435
    const/16 v0, 0x80

    if-ge p0, v0, :cond_1

    .line 436
    const/16 v0, 0x41

    if-gt v0, p0, :cond_0

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_0

    .line 437
    add-int/lit8 v0, p0, 0x20

    int-to-char v0, v0

    return v0

    .line 439
    :cond_0
    return p0

    .line 441
    :cond_1
    invoke-static {p0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    .line 442
    .local v1, "cl":C
    if-ge v1, v0, :cond_2

    move v0, p0

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0
.end method

.method private static emitREBytecode(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RECompiled;ILcom/trendmicro/hippo/regexp/RENode;)I
    .locals 8
    .param p0, "state"    # Lcom/trendmicro/hippo/regexp/CompilerState;
    .param p1, "re"    # Lcom/trendmicro/hippo/regexp/RECompiled;
    .param p2, "pc"    # I
    .param p3, "t"    # Lcom/trendmicro/hippo/regexp/RENode;

    .line 1229
    iget-object v0, p1, Lcom/trendmicro/hippo/regexp/RECompiled;->program:[B

    .line 1231
    .local v0, "program":[B
    :goto_0
    if-eqz p3, :cond_1a

    .line 1232
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "pc":I
    .local v1, "pc":I
    iget-byte v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    aput-byte v2, v0, p2

    .line 1233
    iget-byte p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    const/4 v2, 0x1

    if-eq p2, v2, :cond_19

    const/16 v3, 0x16

    if-eq p2, v3, :cond_17

    const/16 v3, 0x19

    const/4 v4, -0x1

    if-eq p2, v3, :cond_f

    const/16 v3, 0x1d

    if-eq p2, v3, :cond_e

    const/16 v3, 0x1f

    if-eq p2, v3, :cond_d

    const/16 v3, 0xd

    if-eq p2, v3, :cond_c

    const/16 v3, 0xe

    if-eq p2, v3, :cond_5

    const/16 v3, 0x29

    if-eq p2, v3, :cond_4

    const/16 v3, 0x2a

    if-eq p2, v3, :cond_3

    packed-switch p2, :pswitch_data_0

    move p2, v1

    goto/16 :goto_b

    .line 1240
    :pswitch_0
    iget-byte p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    const/16 v3, 0x36

    if-ne p2, v3, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    :goto_1
    move p2, v2

    .line 1241
    .local p2, "ignoreCase":Z
    iget-char v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    if-eqz p2, :cond_1

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v2

    :cond_1
    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    .line 1242
    add-int/lit8 v1, v1, 0x2

    .line 1243
    iget v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    if-eqz p2, :cond_2

    int-to-char v2, v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v2

    :cond_2
    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    .line 1244
    add-int/lit8 v1, v1, 0x2

    goto/16 :goto_6

    .line 1318
    .end local p2    # "ignoreCase":Z
    :cond_3
    move p2, v1

    .line 1319
    .local p2, "nextTermFixup":I
    add-int/lit8 v1, v1, 0x2

    .line 1320
    iget-object v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    invoke-static {p0, p1, v1, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->emitREBytecode(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RECompiled;ILcom/trendmicro/hippo/regexp/RENode;)I

    move-result v1

    .line 1321
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "pc":I
    .local v2, "pc":I
    const/16 v3, 0x2c

    aput-byte v3, v0, v1

    .line 1322
    invoke-static {v0, p2, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->resolveForwardJump([BII)V

    .line 1323
    move p2, v2

    goto/16 :goto_b

    .line 1311
    .end local v2    # "pc":I
    .end local p2    # "nextTermFixup":I
    .restart local v1    # "pc":I
    :cond_4
    move p2, v1

    .line 1312
    .restart local p2    # "nextTermFixup":I
    add-int/lit8 v1, v1, 0x2

    .line 1313
    iget-object v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    invoke-static {p0, p1, v1, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->emitREBytecode(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RECompiled;ILcom/trendmicro/hippo/regexp/RENode;)I

    move-result v1

    .line 1314
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "pc":I
    .restart local v2    # "pc":I
    const/16 v3, 0x2b

    aput-byte v3, v0, v1

    .line 1315
    invoke-static {v0, p2, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->resolveForwardJump([BII)V

    .line 1316
    move p2, v2

    goto/16 :goto_b

    .line 1268
    .end local v2    # "pc":I
    .end local p2    # "nextTermFixup":I
    .restart local v1    # "pc":I
    :cond_5
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->flatIndex:I

    if-eq p2, v4, :cond_6

    .line 1269
    :goto_2
    iget-object p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    if-eqz p2, :cond_6

    iget-object p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    iget-byte p2, p2, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    if-ne p2, v3, :cond_6

    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->flatIndex:I

    iget v5, p3, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    add-int/2addr p2, v5

    iget-object v5, p3, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    iget v5, v5, Lcom/trendmicro/hippo/regexp/RENode;->flatIndex:I

    if-ne p2, v5, :cond_6

    .line 1272
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    iget-object v5, p3, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    iget v5, v5, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    add-int/2addr p2, v5

    iput p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    .line 1273
    iget-object p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    iget-object p2, p2, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    iput-object p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    goto :goto_2

    .line 1276
    :cond_6
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->flatIndex:I

    if-eq p2, v4, :cond_8

    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    if-le p2, v2, :cond_8

    .line 1277
    iget p2, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->flags:I

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_7

    .line 1278
    add-int/lit8 p2, v1, -0x1

    const/16 v2, 0x10

    aput-byte v2, v0, p2

    goto :goto_3

    .line 1280
    :cond_7
    add-int/lit8 p2, v1, -0x1

    aput-byte v3, v0, p2

    .line 1281
    :goto_3
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->flatIndex:I

    invoke-static {v0, v1, p2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1282
    .end local v1    # "pc":I
    .local p2, "pc":I
    iget v1, p3, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    invoke-static {v0, p2, v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    goto/16 :goto_b

    .line 1285
    .end local p2    # "pc":I
    .restart local v1    # "pc":I
    :cond_8
    iget-char p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    const/16 v2, 0x100

    if-ge p2, v2, :cond_a

    .line 1286
    iget p2, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->flags:I

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_9

    .line 1287
    add-int/lit8 p2, v1, -0x1

    const/16 v2, 0x11

    aput-byte v2, v0, p2

    goto :goto_4

    .line 1289
    :cond_9
    add-int/lit8 p2, v1, -0x1

    const/16 v2, 0xf

    aput-byte v2, v0, p2

    .line 1290
    :goto_4
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "pc":I
    .restart local p2    # "pc":I
    iget-char v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    goto/16 :goto_b

    .line 1293
    .end local p2    # "pc":I
    .restart local v1    # "pc":I
    :cond_a
    iget p2, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->flags:I

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_b

    .line 1294
    add-int/lit8 p2, v1, -0x1

    const/16 v2, 0x13

    aput-byte v2, v0, p2

    goto :goto_5

    .line 1296
    :cond_b
    add-int/lit8 p2, v1, -0x1

    const/16 v2, 0x12

    aput-byte v2, v0, p2

    .line 1297
    :goto_5
    iget-char p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    invoke-static {v0, v1, p2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1300
    .end local v1    # "pc":I
    .restart local p2    # "pc":I
    goto/16 :goto_b

    .line 1308
    .end local p2    # "pc":I
    .restart local v1    # "pc":I
    :cond_c
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->parenIndex:I

    invoke-static {v0, v1, p2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1309
    .end local v1    # "pc":I
    .restart local p2    # "pc":I
    goto/16 :goto_b

    .line 1247
    .end local p2    # "pc":I
    .restart local v1    # "pc":I
    :cond_d
    :goto_6
    iget-object p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1248
    .local p2, "nextAlt":Lcom/trendmicro/hippo/regexp/RENode;
    move v2, v1

    .line 1249
    .local v2, "nextAltFixup":I
    add-int/lit8 v1, v1, 0x2

    .line 1250
    iget-object v3, p3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    invoke-static {p0, p1, v1, v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->emitREBytecode(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RECompiled;ILcom/trendmicro/hippo/regexp/RENode;)I

    move-result v1

    .line 1251
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "pc":I
    .local v3, "pc":I
    const/16 v4, 0x20

    aput-byte v4, v0, v1

    .line 1252
    move v1, v3

    .line 1253
    .local v1, "nextTermFixup":I
    add-int/lit8 v3, v3, 0x2

    .line 1254
    invoke-static {v0, v2, v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->resolveForwardJump([BII)V

    .line 1255
    invoke-static {p0, p1, v3, p2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->emitREBytecode(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RECompiled;ILcom/trendmicro/hippo/regexp/RENode;)I

    move-result v3

    .line 1257
    add-int/lit8 v5, v3, 0x1

    .end local v3    # "pc":I
    .local v5, "pc":I
    aput-byte v4, v0, v3

    .line 1258
    move v2, v5

    .line 1259
    add-int/lit8 v5, v5, 0x2

    .line 1261
    invoke-static {v0, v1, v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->resolveForwardJump([BII)V

    .line 1262
    invoke-static {v0, v2, v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->resolveForwardJump([BII)V

    .line 1263
    move p2, v5

    goto/16 :goto_b

    .line 1302
    .end local v2    # "nextAltFixup":I
    .end local v5    # "pc":I
    .end local p2    # "nextAlt":Lcom/trendmicro/hippo/regexp/RENode;
    .local v1, "pc":I
    :cond_e
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->parenIndex:I

    invoke-static {v0, v1, p2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1303
    .end local v1    # "pc":I
    .local p2, "pc":I
    iget-object v1, p3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    invoke-static {p0, p1, p2, v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->emitREBytecode(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RECompiled;ILcom/trendmicro/hippo/regexp/RENode;)I

    move-result p2

    .line 1304
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "pc":I
    .restart local v1    # "pc":I
    const/16 v2, 0x1e

    aput-byte v2, v0, p2

    .line 1305
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->parenIndex:I

    invoke-static {v0, v1, p2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1306
    .end local v1    # "pc":I
    .restart local p2    # "pc":I
    goto/16 :goto_b

    .line 1325
    .end local p2    # "pc":I
    .restart local v1    # "pc":I
    :cond_f
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->min:I

    if-nez p2, :cond_11

    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->max:I

    if-ne p2, v4, :cond_11

    .line 1326
    add-int/lit8 p2, v1, -0x1

    iget-boolean v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->greedy:Z

    if-eqz v2, :cond_10

    const/16 v2, 0x1a

    goto :goto_7

    :cond_10
    const/16 v2, 0x2d

    :goto_7
    aput-byte v2, v0, p2

    goto :goto_a

    .line 1328
    :cond_11
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->min:I

    if-nez p2, :cond_13

    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->max:I

    if-ne p2, v2, :cond_13

    .line 1329
    add-int/lit8 p2, v1, -0x1

    iget-boolean v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->greedy:Z

    if-eqz v2, :cond_12

    const/16 v2, 0x1c

    goto :goto_8

    :cond_12
    const/16 v2, 0x2f

    :goto_8
    aput-byte v2, v0, p2

    goto :goto_a

    .line 1331
    :cond_13
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->min:I

    if-ne p2, v2, :cond_15

    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->max:I

    if-ne p2, v4, :cond_15

    .line 1332
    add-int/lit8 p2, v1, -0x1

    iget-boolean v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->greedy:Z

    if-eqz v2, :cond_14

    const/16 v2, 0x1b

    goto :goto_9

    :cond_14
    const/16 v2, 0x2e

    :goto_9
    aput-byte v2, v0, p2

    goto :goto_a

    .line 1334
    :cond_15
    iget-boolean p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->greedy:Z

    if-nez p2, :cond_16

    add-int/lit8 p2, v1, -0x1

    const/16 v3, 0x30

    aput-byte v3, v0, p2

    .line 1335
    :cond_16
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->min:I

    invoke-static {v0, v1, p2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1337
    .end local v1    # "pc":I
    .restart local p2    # "pc":I
    iget v1, p3, Lcom/trendmicro/hippo/regexp/RENode;->max:I

    add-int/2addr v1, v2

    invoke-static {v0, p2, v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result v1

    .line 1339
    .end local p2    # "pc":I
    .restart local v1    # "pc":I
    :goto_a
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->parenCount:I

    invoke-static {v0, v1, p2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1340
    .end local v1    # "pc":I
    .restart local p2    # "pc":I
    iget v1, p3, Lcom/trendmicro/hippo/regexp/RENode;->parenIndex:I

    invoke-static {v0, p2, v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1341
    move v1, p2

    .line 1342
    .local v1, "nextTermFixup":I
    add-int/lit8 p2, p2, 0x2

    .line 1343
    iget-object v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    invoke-static {p0, p1, p2, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->emitREBytecode(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RECompiled;ILcom/trendmicro/hippo/regexp/RENode;)I

    move-result p2

    .line 1344
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "pc":I
    .local v2, "pc":I
    const/16 v3, 0x31

    aput-byte v3, v0, p2

    .line 1345
    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->resolveForwardJump([BII)V

    .line 1346
    move p2, v2

    goto :goto_b

    .line 1348
    .end local v2    # "pc":I
    .local v1, "pc":I
    :cond_17
    iget-boolean p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->sense:Z

    if-nez p2, :cond_18

    .line 1349
    add-int/lit8 p2, v1, -0x1

    const/16 v2, 0x17

    aput-byte v2, v0, p2

    .line 1350
    :cond_18
    iget p2, p3, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    invoke-static {v0, v1, p2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    move-result p2

    .line 1351
    .end local v1    # "pc":I
    .restart local p2    # "pc":I
    iget-object v1, p1, Lcom/trendmicro/hippo/regexp/RECompiled;->classList:[Lcom/trendmicro/hippo/regexp/RECharSet;

    iget v2, p3, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    new-instance v3, Lcom/trendmicro/hippo/regexp/RECharSet;

    iget v4, p3, Lcom/trendmicro/hippo/regexp/RENode;->bmsize:I

    iget v5, p3, Lcom/trendmicro/hippo/regexp/RENode;->startIndex:I

    iget v6, p3, Lcom/trendmicro/hippo/regexp/RENode;->kidlen:I

    iget-boolean v7, p3, Lcom/trendmicro/hippo/regexp/RENode;->sense:Z

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/trendmicro/hippo/regexp/RECharSet;-><init>(IIIZ)V

    aput-object v3, v1, v2

    .line 1353
    goto :goto_b

    .line 1235
    .end local p2    # "pc":I
    .restart local v1    # "pc":I
    :cond_19
    add-int/lit8 v1, v1, -0x1

    .line 1236
    move p2, v1

    .line 1357
    .end local v1    # "pc":I
    .restart local p2    # "pc":I
    :goto_b
    iget-object p3, p3, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    goto/16 :goto_0

    .line 1359
    :cond_1a
    return p2

    nop

    :pswitch_data_0
    .packed-switch 0x35
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static escapeRegExp(Ljava/lang/Object;)Ljava/lang/String;
    .locals 7
    .param p0, "src"    # Ljava/lang/Object;

    .line 226
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 228
    .local v0, "s":Ljava/lang/String;
    const/4 v1, 0x0

    .line 229
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 230
    .local v2, "start":I
    const/16 v3, 0x2f

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 231
    .local v4, "slash":I
    :goto_0
    const/4 v5, -0x1

    if-le v4, v5, :cond_3

    .line 232
    if-eq v4, v2, :cond_0

    add-int/lit8 v5, v4, -0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5c

    if-eq v5, v6, :cond_2

    .line 233
    :cond_0
    if-nez v1, :cond_1

    .line 234
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object v1, v5

    .line 236
    :cond_1
    invoke-virtual {v1, v0, v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 237
    const-string v5, "\\/"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    add-int/lit8 v2, v4, 0x1

    .line 240
    :cond_2
    add-int/lit8 v5, v4, 0x1

    invoke-virtual {v0, v3, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    goto :goto_0

    .line 242
    :cond_3
    if-eqz v1, :cond_4

    .line 243
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1, v0, v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 244
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 246
    :cond_4
    return-object v0
.end method

.method private execSub(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 18
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scopeObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "matchType"    # I

    .line 252
    move-object/from16 v7, p0

    move-object/from16 v8, p3

    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getImpl(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/regexp/RegExpImpl;

    move-result-object v9

    .line 254
    .local v9, "reImpl":Lcom/trendmicro/hippo/regexp/RegExpImpl;
    array-length v0, v8

    const/4 v10, 0x0

    if-nez v0, :cond_1

    .line 255
    iget-object v0, v9, Lcom/trendmicro/hippo/regexp/RegExpImpl;->input:Ljava/lang/String;

    .line 256
    .local v0, "str":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 257
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    goto :goto_0

    .line 256
    :cond_0
    move-object v11, v0

    goto :goto_0

    .line 260
    .end local v0    # "str":Ljava/lang/String;
    :cond_1
    aget-object v0, v8, v10

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    .line 262
    .local v11, "str":Ljava/lang/String;
    :goto_0
    const-wide/16 v0, 0x0

    .line 263
    .local v0, "d":D
    iget-object v2, v7, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v2, v2, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    const/4 v12, 0x1

    and-int/2addr v2, v12

    if-eqz v2, :cond_2

    .line 264
    iget-object v2, v7, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v0

    move-wide v13, v0

    goto :goto_1

    .line 263
    :cond_2
    move-wide v13, v0

    .line 268
    .end local v0    # "d":D
    .local v13, "d":D
    :goto_1
    const-wide/16 v15, 0x0

    cmpg-double v0, v13, v15

    if-ltz v0, :cond_6

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    int-to-double v0, v0

    cmpg-double v0, v0, v13

    if-gez v0, :cond_3

    goto :goto_4

    .line 273
    :cond_3
    new-array v0, v12, [I

    double-to-int v1, v13

    aput v1, v0, v10

    move-object/from16 v17, v0

    .line 274
    .local v17, "indexp":[I
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v9

    move-object v4, v11

    move-object/from16 v5, v17

    move/from16 v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->executeRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;

    move-result-object v0

    .line 275
    .local v0, "rval":Ljava/lang/Object;
    iget-object v1, v7, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/2addr v1, v12

    if-eqz v1, :cond_7

    .line 276
    if-eqz v0, :cond_5

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_4

    goto :goto_2

    .line 277
    :cond_4
    aget v1, v17, v10

    int-to-double v1, v1

    move-wide v15, v1

    goto :goto_3

    :cond_5
    :goto_2
    nop

    .line 276
    :goto_3
    invoke-static/range {v15 .. v16}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v7, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    goto :goto_5

    .line 269
    .end local v0    # "rval":Ljava/lang/Object;
    .end local v17    # "indexp":[I
    :cond_6
    :goto_4
    invoke-static/range {v15 .. v16}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, v7, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 270
    const/4 v0, 0x0

    .line 280
    .restart local v0    # "rval":Ljava/lang/Object;
    :cond_7
    :goto_5
    return-object v0
.end method

.method private static executeREBytecode(Lcom/trendmicro/hippo/regexp/REGlobalData;Ljava/lang/String;I)Z
    .locals 24
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "end"    # I

    .line 1940
    move-object/from16 v7, p0

    move/from16 v8, p2

    const/4 v0, 0x0

    .line 1941
    .local v0, "pc":I
    iget-object v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v9, v1, Lcom/trendmicro/hippo/regexp/RECompiled;->program:[B

    .line 1942
    .local v9, "program":[B
    const/16 v10, 0x39

    .line 1943
    .local v10, "continuationOp":I
    const/4 v11, 0x0

    .line 1944
    .local v11, "continuationPc":I
    const/4 v12, 0x0

    .line 1946
    .local v12, "result":Z
    add-int/lit8 v13, v0, 0x1

    .end local v0    # "pc":I
    .local v13, "pc":I
    aget-byte v14, v9, v0

    .line 1952
    .local v14, "op":I
    iget-object v0, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v0, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->anchorCh:I

    const/4 v15, 0x0

    const/16 v16, 0x1

    if-gez v0, :cond_2

    invoke-static {v14}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1953
    const/16 v17, 0x0

    .line 1954
    .local v17, "anchor":Z
    :goto_0
    iget v0, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-gt v0, v8, :cond_1

    .line 1955
    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v14

    move-object v3, v9

    move v4, v13

    move/from16 v5, p2

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->simpleMatch(Lcom/trendmicro/hippo/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v0

    .line 1956
    .local v0, "match":I
    if-ltz v0, :cond_0

    .line 1957
    const/16 v17, 0x1

    .line 1958
    move v1, v0

    .line 1959
    .end local v13    # "pc":I
    .local v1, "pc":I
    add-int/lit8 v13, v1, 0x1

    .end local v1    # "pc":I
    .restart local v13    # "pc":I
    aget-byte v14, v9, v1

    .line 1960
    goto :goto_1

    .line 1962
    :cond_0
    iget v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->skipped:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->skipped:I

    .line 1963
    iget v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1964
    .end local v0    # "match":I
    goto :goto_0

    .line 1965
    :cond_1
    :goto_1
    if-nez v17, :cond_2

    .line 1966
    return v15

    .line 1971
    .end local v17    # "anchor":Z
    :cond_2
    :goto_2
    invoke-static {v14}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1972
    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v14

    move-object v3, v9

    move v4, v13

    move/from16 v5, p2

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->simpleMatch(Lcom/trendmicro/hippo/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v0

    .line 1973
    .restart local v0    # "match":I
    if-ltz v0, :cond_3

    move/from16 v1, v16

    goto :goto_3

    :cond_3
    move v1, v15

    .line 1974
    .end local v12    # "result":Z
    .local v1, "result":Z
    :goto_3
    if-eqz v1, :cond_4

    .line 1975
    move v13, v0

    .line 1976
    .end local v0    # "match":I
    :cond_4
    move v12, v1

    goto/16 :goto_e

    .line 1978
    .end local v1    # "result":Z
    .restart local v12    # "result":Z
    :cond_5
    const/16 v0, 0x39

    if-eq v14, v0, :cond_29

    const/16 v6, 0x34

    packed-switch v14, :pswitch_data_0

    const/16 v5, 0x2c

    packed-switch v14, :pswitch_data_1

    const/4 v5, -0x1

    packed-switch v14, :pswitch_data_2

    .line 2327
    const-string v0, "invalid bytecode"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1983
    :pswitch_0
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    int-to-char v0, v0

    .line 1984
    .local v0, "matchCh1":C
    add-int/lit8 v13, v13, 0x2

    .line 1985
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v1

    int-to-char v1, v1

    .line 1986
    .local v1, "matchCh2":C
    add-int/lit8 v13, v13, 0x2

    .line 1988
    iget v2, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-ne v2, v8, :cond_6

    .line 1989
    const/4 v2, 0x0

    .line 1990
    .end local v12    # "result":Z
    .local v2, "result":Z
    move v12, v2

    goto/16 :goto_e

    .line 1992
    .end local v2    # "result":Z
    .restart local v12    # "result":Z
    :cond_6
    iget v2, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    move-object/from16 v4, p1

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1993
    .local v2, "c":C
    const/16 v3, 0x37

    if-ne v14, v3, :cond_7

    .line 1994
    if-eq v2, v0, :cond_9

    iget-object v3, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v3, v3, Lcom/trendmicro/hippo/regexp/RECompiled;->classList:[Lcom/trendmicro/hippo/regexp/RECharSet;

    aget-object v3, v3, v1

    .line 1995
    invoke-static {v7, v3, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->classMatcher(Lcom/trendmicro/hippo/regexp/REGlobalData;Lcom/trendmicro/hippo/regexp/RECharSet;C)Z

    move-result v3

    if-nez v3, :cond_9

    .line 1996
    const/4 v3, 0x0

    .line 1997
    .end local v12    # "result":Z
    .local v3, "result":Z
    move v12, v3

    goto/16 :goto_e

    .line 2000
    .end local v3    # "result":Z
    .restart local v12    # "result":Z
    :cond_7
    const/16 v3, 0x36

    if-ne v14, v3, :cond_8

    .line 2001
    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v2

    .line 2002
    :cond_8
    if-eq v2, v0, :cond_9

    if-eq v2, v1, :cond_9

    .line 2003
    const/4 v3, 0x0

    .line 2004
    .end local v12    # "result":Z
    .restart local v3    # "result":Z
    move v12, v3

    goto/16 :goto_e

    .line 2012
    .end local v0    # "matchCh1":C
    .end local v1    # "matchCh2":C
    .end local v2    # "c":C
    .end local v3    # "result":Z
    .restart local v12    # "result":Z
    :cond_9
    move/from16 v17, v12

    goto/16 :goto_f

    .line 2263
    :pswitch_1
    move-object/from16 v4, p1

    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->popProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;)Lcom/trendmicro/hippo/regexp/REProgState;

    move-result-object v3

    .line 2264
    .local v3, "state":Lcom/trendmicro/hippo/regexp/REProgState;
    if-nez v12, :cond_d

    .line 2268
    iget v0, v3, Lcom/trendmicro/hippo/regexp/REProgState;->max:I

    if-eq v0, v5, :cond_b

    iget v0, v3, Lcom/trendmicro/hippo/regexp/REProgState;->max:I

    if-lez v0, :cond_a

    goto :goto_4

    .line 2284
    :cond_a
    iget v0, v3, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    .line 2285
    .end local v11    # "continuationPc":I
    .local v0, "continuationPc":I
    iget v1, v3, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    .line 2286
    .end local v10    # "continuationOp":I
    .local v1, "continuationOp":I
    move v11, v0

    move v10, v1

    goto/16 :goto_e

    .line 2269
    .end local v0    # "continuationPc":I
    .end local v1    # "continuationOp":I
    .restart local v10    # "continuationOp":I
    .restart local v11    # "continuationPc":I
    :cond_b
    :goto_4
    iget v1, v3, Lcom/trendmicro/hippo/regexp/REProgState;->min:I

    iget v2, v3, Lcom/trendmicro/hippo/regexp/REProgState;->max:I

    iget v6, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    const/16 v17, 0x0

    iget v0, v3, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    iget v15, v3, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    move-object v8, v3

    .end local v3    # "state":Lcom/trendmicro/hippo/regexp/REProgState;
    .local v8, "state":Lcom/trendmicro/hippo/regexp/REProgState;
    move v3, v6

    move-object/from16 v4, v17

    move v6, v5

    move/from16 v5, v19

    move/from16 v17, v12

    move v12, v6

    .end local v12    # "result":Z
    .local v17, "result":Z
    move v6, v15

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;IIILcom/trendmicro/hippo/regexp/REBackTrackData;II)V

    .line 2271
    const/16 v10, 0x34

    .line 2272
    move v11, v13

    .line 2273
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    .line 2274
    .local v0, "parenCount":I
    add-int/lit8 v13, v13, 0x2

    .line 2275
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v1

    .line 2276
    .local v1, "parenIndex":I
    add-int/lit8 v13, v13, 0x4

    .line 2277
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_5
    if-ge v2, v0, :cond_c

    .line 2278
    add-int v3, v1, v2

    const/4 v4, 0x0

    invoke-virtual {v7, v3, v12, v4}, Lcom/trendmicro/hippo/regexp/REGlobalData;->setParens(III)V

    .line 2277
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 2280
    .end local v2    # "k":I
    :cond_c
    add-int/lit8 v2, v13, 0x1

    .end local v13    # "pc":I
    .local v2, "pc":I
    aget-byte v14, v9, v13

    .line 2281
    move/from16 v8, p2

    move v13, v2

    move/from16 v12, v17

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2288
    .end local v0    # "parenCount":I
    .end local v1    # "parenIndex":I
    .end local v2    # "pc":I
    .end local v8    # "state":Lcom/trendmicro/hippo/regexp/REProgState;
    .end local v17    # "result":Z
    .restart local v3    # "state":Lcom/trendmicro/hippo/regexp/REProgState;
    .restart local v12    # "result":Z
    .restart local v13    # "pc":I
    :cond_d
    move-object v8, v3

    move/from16 v17, v12

    move v12, v5

    .end local v3    # "state":Lcom/trendmicro/hippo/regexp/REProgState;
    .end local v12    # "result":Z
    .restart local v8    # "state":Lcom/trendmicro/hippo/regexp/REProgState;
    .restart local v17    # "result":Z
    iget v0, v8, Lcom/trendmicro/hippo/regexp/REProgState;->min:I

    if-nez v0, :cond_e

    iget v0, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    iget v1, v8, Lcom/trendmicro/hippo/regexp/REProgState;->index:I

    if-ne v0, v1, :cond_e

    .line 2290
    const/4 v0, 0x0

    .line 2291
    .end local v17    # "result":Z
    .local v0, "result":Z
    iget v1, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    .line 2292
    .end local v11    # "continuationPc":I
    .local v1, "continuationPc":I
    iget v2, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    .line 2293
    .end local v10    # "continuationOp":I
    .local v2, "continuationOp":I
    move v12, v0

    move v11, v1

    move v10, v2

    goto/16 :goto_e

    .line 2295
    .end local v0    # "result":Z
    .end local v1    # "continuationPc":I
    .end local v2    # "continuationOp":I
    .restart local v10    # "continuationOp":I
    .restart local v11    # "continuationPc":I
    .restart local v17    # "result":Z
    :cond_e
    iget v0, v8, Lcom/trendmicro/hippo/regexp/REProgState;->min:I

    .local v0, "new_min":I
    iget v1, v8, Lcom/trendmicro/hippo/regexp/REProgState;->max:I

    .line 2296
    .local v1, "new_max":I
    if-eqz v0, :cond_f

    add-int/lit8 v0, v0, -0x1

    :cond_f
    move v15, v0

    .line 2297
    .end local v0    # "new_min":I
    .local v15, "new_min":I
    if-eq v1, v12, :cond_10

    add-int/lit8 v1, v1, -0x1

    :cond_10
    move/from16 v19, v1

    .line 2298
    .end local v1    # "new_max":I
    .local v19, "new_max":I
    iget v3, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    const/4 v4, 0x0

    iget v5, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    iget v2, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    move-object/from16 v0, p0

    move v1, v15

    move/from16 v20, v2

    move/from16 v2, v19

    move/from16 v6, v20

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;IIILcom/trendmicro/hippo/regexp/REBackTrackData;II)V

    .line 2300
    if-eqz v15, :cond_12

    .line 2301
    const/16 v10, 0x34

    .line 2302
    move v11, v13

    .line 2303
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    .line 2304
    .local v0, "parenCount":I
    add-int/lit8 v13, v13, 0x2

    .line 2305
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v1

    .line 2306
    .local v1, "parenIndex":I
    add-int/lit8 v13, v13, 0x4

    .line 2307
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_6
    if-ge v2, v0, :cond_11

    .line 2308
    add-int v3, v1, v2

    const/4 v4, 0x0

    invoke-virtual {v7, v3, v12, v4}, Lcom/trendmicro/hippo/regexp/REGlobalData;->setParens(III)V

    .line 2307
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 2310
    .end local v2    # "k":I
    :cond_11
    add-int/lit8 v2, v13, 0x1

    .end local v13    # "pc":I
    .local v2, "pc":I
    aget-byte v14, v9, v13

    .line 2311
    .end local v0    # "parenCount":I
    .end local v1    # "parenIndex":I
    move/from16 v8, p2

    move v13, v2

    move/from16 v12, v17

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2312
    .end local v2    # "pc":I
    .restart local v13    # "pc":I
    :cond_12
    iget v11, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    .line 2313
    iget v10, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    .line 2314
    const/16 v12, 0x34

    invoke-static {v7, v12, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushBackTrackState(Lcom/trendmicro/hippo/regexp/REGlobalData;BI)V

    .line 2315
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->popProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;)Lcom/trendmicro/hippo/regexp/REProgState;

    .line 2316
    add-int/lit8 v13, v13, 0x4

    .line 2317
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v0

    add-int/2addr v13, v0

    .line 2318
    add-int/lit8 v0, v13, 0x1

    .end local v13    # "pc":I
    .local v0, "pc":I
    aget-byte v14, v9, v13

    .line 2320
    move/from16 v8, p2

    move v13, v0

    move/from16 v12, v17

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 1978
    .end local v0    # "pc":I
    .end local v8    # "state":Lcom/trendmicro/hippo/regexp/REProgState;
    .end local v15    # "new_min":I
    .end local v17    # "result":Z
    .end local v19    # "new_max":I
    .restart local v12    # "result":Z
    .restart local v13    # "pc":I
    :pswitch_2
    move/from16 v17, v12

    move v12, v5

    .line 2193
    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    :goto_7
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->popProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;)Lcom/trendmicro/hippo/regexp/REProgState;

    move-result-object v8

    .line 2194
    .restart local v8    # "state":Lcom/trendmicro/hippo/regexp/REProgState;
    if-nez v17, :cond_14

    .line 2196
    iget v0, v8, Lcom/trendmicro/hippo/regexp/REProgState;->min:I

    if-nez v0, :cond_13

    .line 2197
    const/16 v17, 0x1

    .line 2198
    :cond_13
    iget v0, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    .line 2199
    .end local v11    # "continuationPc":I
    .local v0, "continuationPc":I
    iget v1, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    .line 2200
    .end local v10    # "continuationOp":I
    .local v1, "continuationOp":I
    add-int/lit8 v13, v13, 0x4

    .line 2201
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v2

    add-int/2addr v13, v2

    .line 2202
    move v11, v0

    move v10, v1

    move/from16 v12, v17

    goto/16 :goto_e

    .line 2204
    .end local v0    # "continuationPc":I
    .end local v1    # "continuationOp":I
    .restart local v10    # "continuationOp":I
    .restart local v11    # "continuationPc":I
    :cond_14
    iget v0, v8, Lcom/trendmicro/hippo/regexp/REProgState;->min:I

    if-nez v0, :cond_15

    iget v0, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    iget v1, v8, Lcom/trendmicro/hippo/regexp/REProgState;->index:I

    if-ne v0, v1, :cond_15

    .line 2206
    const/4 v0, 0x0

    .line 2207
    .end local v17    # "result":Z
    .local v0, "result":Z
    iget v1, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    .line 2208
    .end local v11    # "continuationPc":I
    .local v1, "continuationPc":I
    iget v2, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    .line 2209
    .end local v10    # "continuationOp":I
    .local v2, "continuationOp":I
    add-int/lit8 v13, v13, 0x4

    .line 2210
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int/2addr v13, v3

    .line 2211
    move v12, v0

    move v11, v1

    move v10, v2

    goto/16 :goto_e

    .line 2213
    .end local v0    # "result":Z
    .end local v1    # "continuationPc":I
    .end local v2    # "continuationOp":I
    .restart local v10    # "continuationOp":I
    .restart local v11    # "continuationPc":I
    .restart local v17    # "result":Z
    :cond_15
    iget v0, v8, Lcom/trendmicro/hippo/regexp/REProgState;->min:I

    .local v0, "new_min":I
    iget v1, v8, Lcom/trendmicro/hippo/regexp/REProgState;->max:I

    .line 2214
    .local v1, "new_max":I
    if-eqz v0, :cond_16

    add-int/lit8 v0, v0, -0x1

    :cond_16
    move v15, v0

    .line 2215
    .end local v0    # "new_min":I
    .restart local v15    # "new_min":I
    if-eq v1, v12, :cond_17

    add-int/lit8 v1, v1, -0x1

    :cond_17
    move/from16 v19, v1

    .line 2216
    .end local v1    # "new_max":I
    .restart local v19    # "new_max":I
    if-nez v19, :cond_18

    .line 2217
    const/4 v0, 0x1

    .line 2218
    .end local v17    # "result":Z
    .local v0, "result":Z
    iget v1, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    .line 2219
    .end local v11    # "continuationPc":I
    .local v1, "continuationPc":I
    iget v2, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    .line 2220
    .end local v10    # "continuationOp":I
    .restart local v2    # "continuationOp":I
    add-int/lit8 v13, v13, 0x4

    .line 2221
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v3

    add-int/2addr v13, v3

    .line 2222
    move v12, v0

    move v11, v1

    move v10, v2

    goto/16 :goto_e

    .line 2224
    .end local v0    # "result":Z
    .end local v1    # "continuationPc":I
    .end local v2    # "continuationOp":I
    .restart local v10    # "continuationOp":I
    .restart local v11    # "continuationPc":I
    .restart local v17    # "result":Z
    :cond_18
    add-int/lit8 v0, v13, 0x6

    .line 2225
    .local v0, "nextpc":I
    aget-byte v20, v9, v0

    .line 2226
    .local v20, "nextop":I
    iget v6, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 2227
    .local v6, "startcp":I
    invoke-static/range {v20 .. v20}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 2228
    add-int/lit8 v21, v0, 0x1

    .line 2229
    .end local v0    # "nextpc":I
    .local v21, "nextpc":I
    const/16 v22, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v20

    move-object v3, v9

    move/from16 v4, v21

    move/from16 v5, p2

    move/from16 v23, v6

    .end local v6    # "startcp":I
    .local v23, "startcp":I
    move/from16 v6, v22

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->simpleMatch(Lcom/trendmicro/hippo/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v0

    .line 2230
    .local v0, "match":I
    if-gez v0, :cond_1a

    .line 2231
    if-nez v15, :cond_19

    move/from16 v1, v16

    goto :goto_8

    :cond_19
    const/4 v1, 0x0

    .line 2232
    .end local v17    # "result":Z
    .local v1, "result":Z
    :goto_8
    iget v2, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    .line 2233
    .end local v11    # "continuationPc":I
    .local v2, "continuationPc":I
    iget v3, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    .line 2234
    .end local v10    # "continuationOp":I
    .local v3, "continuationOp":I
    add-int/lit8 v13, v13, 0x4

    .line 2235
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v4

    add-int/2addr v13, v4

    .line 2236
    move v12, v1

    move v11, v2

    move v10, v3

    goto/16 :goto_e

    .line 2238
    .end local v1    # "result":Z
    .end local v2    # "continuationPc":I
    .end local v3    # "continuationOp":I
    .restart local v10    # "continuationOp":I
    .restart local v11    # "continuationPc":I
    .restart local v17    # "result":Z
    :cond_1a
    const/4 v1, 0x1

    .line 2239
    .end local v17    # "result":Z
    .restart local v1    # "result":Z
    move v2, v0

    move/from16 v21, v1

    move/from16 v17, v2

    .end local v21    # "nextpc":I
    .local v2, "nextpc":I
    goto :goto_9

    .line 2227
    .end local v1    # "result":Z
    .end local v2    # "nextpc":I
    .end local v23    # "startcp":I
    .local v0, "nextpc":I
    .restart local v6    # "startcp":I
    .restart local v17    # "result":Z
    :cond_1b
    move/from16 v23, v6

    .end local v6    # "startcp":I
    .restart local v23    # "startcp":I
    move/from16 v21, v17

    move/from16 v17, v0

    .line 2241
    .end local v0    # "nextpc":I
    .local v17, "nextpc":I
    .local v21, "result":Z
    :goto_9
    const/16 v10, 0x33

    .line 2242
    move v11, v13

    .line 2243
    const/4 v4, 0x0

    iget v5, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    iget v6, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    move-object/from16 v0, p0

    move v1, v15

    move/from16 v2, v19

    move/from16 v3, v23

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;IIILcom/trendmicro/hippo/regexp/REBackTrackData;II)V

    .line 2245
    if-nez v15, :cond_1c

    .line 2246
    const/16 v1, 0x33

    iget v4, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    iget v5, v8, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    move-object/from16 v0, p0

    move v2, v13

    move/from16 v3, v23

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushBackTrackState(Lcom/trendmicro/hippo/regexp/REGlobalData;BIIII)V

    .line 2248
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    .line 2249
    .local v0, "parenCount":I
    add-int/lit8 v1, v13, 0x2

    invoke-static {v9, v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v1

    .line 2250
    .local v1, "parenIndex":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_a
    if-ge v2, v0, :cond_1c

    .line 2251
    add-int v3, v1, v2

    const/4 v4, 0x0

    invoke-virtual {v7, v3, v12, v4}, Lcom/trendmicro/hippo/regexp/REGlobalData;->setParens(III)V

    .line 2250
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 2254
    .end local v0    # "parenCount":I
    .end local v1    # "parenIndex":I
    .end local v2    # "k":I
    .end local v8    # "state":Lcom/trendmicro/hippo/regexp/REProgState;
    .end local v15    # "new_min":I
    .end local v19    # "new_max":I
    .end local v23    # "startcp":I
    :cond_1c
    aget-byte v0, v9, v17

    const/16 v1, 0x31

    if-eq v0, v1, :cond_1d

    .line 2256
    move/from16 v0, v17

    .line 2257
    .end local v13    # "pc":I
    .local v0, "pc":I
    add-int/lit8 v13, v0, 0x1

    .end local v0    # "pc":I
    .restart local v13    # "pc":I
    aget-byte v14, v9, v0

    .line 2259
    .end local v17    # "nextpc":I
    .end local v20    # "nextop":I
    move/from16 v8, p2

    move/from16 v12, v21

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2254
    .restart local v17    # "nextpc":I
    .restart local v20    # "nextop":I
    :cond_1d
    move/from16 v17, v21

    goto/16 :goto_7

    .line 2183
    .end local v17    # "nextpc":I
    .end local v20    # "nextop":I
    .end local v21    # "result":Z
    .restart local v12    # "result":Z
    :pswitch_3
    move/from16 v17, v12

    .end local v12    # "result":Z
    .local v17, "result":Z
    const/4 v12, 0x1

    .line 2185
    .end local v17    # "result":Z
    .restart local v12    # "result":Z
    move v13, v11

    .line 2186
    move v14, v10

    .line 2187
    move/from16 v8, p2

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 1978
    :pswitch_4
    move/from16 v17, v12

    move v12, v6

    move v8, v15

    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    :goto_b
    goto/16 :goto_11

    .line 2096
    .end local v17    # "result":Z
    .restart local v12    # "result":Z
    :pswitch_5
    move/from16 v17, v12

    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->popProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;)Lcom/trendmicro/hippo/regexp/REProgState;

    move-result-object v0

    .line 2097
    .local v0, "state":Lcom/trendmicro/hippo/regexp/REProgState;
    iget v1, v0, Lcom/trendmicro/hippo/regexp/REProgState;->index:I

    iput v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 2098
    iget-object v1, v0, Lcom/trendmicro/hippo/regexp/REProgState;->backTrack:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    iput-object v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    .line 2099
    iget v1, v0, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    .line 2100
    .end local v11    # "continuationPc":I
    .local v1, "continuationPc":I
    iget v2, v0, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    .line 2101
    .end local v10    # "continuationOp":I
    .local v2, "continuationOp":I
    if-ne v14, v5, :cond_1f

    .line 2102
    if-nez v17, :cond_1e

    move/from16 v3, v16

    goto :goto_c

    :cond_1e
    const/4 v3, 0x0

    :goto_c
    move v12, v3

    .end local v17    # "result":Z
    .restart local v12    # "result":Z
    goto :goto_d

    .line 2101
    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    :cond_1f
    move/from16 v12, v17

    .line 2105
    .end local v0    # "state":Lcom/trendmicro/hippo/regexp/REProgState;
    .end local v17    # "result":Z
    .restart local v12    # "result":Z
    :goto_d
    move v11, v1

    move v10, v2

    goto/16 :goto_e

    .line 2077
    .end local v1    # "continuationPc":I
    .end local v2    # "continuationOp":I
    .restart local v10    # "continuationOp":I
    .restart local v11    # "continuationPc":I
    :pswitch_6
    move/from16 v17, v12

    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    add-int v8, v13, v0

    .line 2078
    .local v8, "nextpc":I
    add-int/lit8 v13, v13, 0x2

    .line 2079
    add-int/lit8 v12, v13, 0x1

    .end local v13    # "pc":I
    .local v12, "pc":I
    aget-byte v14, v9, v13

    .line 2080
    invoke-static {v14}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 2081
    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v14

    move-object v3, v9

    move v4, v12

    move v13, v5

    move/from16 v5, p2

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->simpleMatch(Lcom/trendmicro/hippo/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v0

    .line 2082
    .local v0, "match":I
    if-ltz v0, :cond_21

    aget-byte v1, v9, v0

    if-ne v1, v13, :cond_21

    .line 2083
    const/4 v1, 0x0

    .line 2084
    .end local v17    # "result":Z
    .local v1, "result":Z
    move v13, v12

    move v12, v1

    goto :goto_e

    .line 2080
    .end local v0    # "match":I
    .end local v1    # "result":Z
    .restart local v17    # "result":Z
    :cond_20
    move v13, v5

    .line 2087
    :cond_21
    const/4 v1, 0x0

    const/4 v2, 0x0

    iget v3, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    iget-object v4, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    move-object/from16 v0, p0

    move v5, v10

    move v6, v11

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;IIILcom/trendmicro/hippo/regexp/REBackTrackData;II)V

    .line 2089
    invoke-static {v7, v13, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushBackTrackState(Lcom/trendmicro/hippo/regexp/REGlobalData;BI)V

    .line 2091
    .end local v8    # "nextpc":I
    move/from16 v8, p2

    move v13, v12

    move/from16 v12, v17

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2063
    .end local v17    # "result":Z
    .local v12, "result":Z
    .restart local v13    # "pc":I
    :pswitch_7
    move/from16 v17, v12

    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    add-int v8, v13, v0

    .line 2064
    .restart local v8    # "nextpc":I
    add-int/lit8 v13, v13, 0x2

    .line 2065
    add-int/lit8 v12, v13, 0x1

    .end local v13    # "pc":I
    .local v12, "pc":I
    aget-byte v14, v9, v13

    .line 2066
    invoke-static {v14}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v0

    if-eqz v0, :cond_24

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v14

    move-object v3, v9

    move v4, v12

    move/from16 v5, p2

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->simpleMatch(Lcom/trendmicro/hippo/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v0

    if-gez v0, :cond_24

    .line 2067
    const/4 v0, 0x0

    .line 2068
    .end local v17    # "result":Z
    .local v0, "result":Z
    move v13, v12

    move v12, v0

    .line 2335
    .end local v0    # "result":Z
    .end local v8    # "nextpc":I
    .local v12, "result":Z
    .restart local v13    # "pc":I
    :goto_e
    if-nez v12, :cond_23

    .line 2336
    iget-object v0, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    .line 2337
    .local v0, "backTrackData":Lcom/trendmicro/hippo/regexp/REBackTrackData;
    if-eqz v0, :cond_22

    .line 2338
    iget-object v1, v0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->previous:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    iput-object v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    .line 2339
    iget-object v1, v0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->parens:[J

    iput-object v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    .line 2340
    iget v1, v0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->cp:I

    iput v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 2341
    iget-object v1, v0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    iput-object v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    .line 2342
    iget v10, v0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->continuationOp:I

    .line 2343
    iget v11, v0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->continuationPc:I

    .line 2344
    iget v13, v0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->pc:I

    .line 2345
    iget v14, v0, Lcom/trendmicro/hippo/regexp/REBackTrackData;->op:I

    .line 2346
    move/from16 v8, p2

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2348
    :cond_22
    const/4 v1, 0x0

    return v1

    .line 2351
    .end local v0    # "backTrackData":Lcom/trendmicro/hippo/regexp/REBackTrackData;
    :cond_23
    add-int/lit8 v0, v13, 0x1

    .end local v13    # "pc":I
    .local v0, "pc":I
    aget-byte v14, v9, v13

    move/from16 v8, p2

    move v13, v0

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2070
    .end local v0    # "pc":I
    .restart local v8    # "nextpc":I
    .local v12, "pc":I
    .restart local v17    # "result":Z
    :cond_24
    const/4 v1, 0x0

    const/4 v2, 0x0

    iget v3, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    iget-object v4, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    move-object/from16 v0, p0

    move v5, v10

    move v6, v11

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;IIILcom/trendmicro/hippo/regexp/REBackTrackData;II)V

    .line 2072
    const/16 v0, 0x2b

    invoke-static {v7, v0, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushBackTrackState(Lcom/trendmicro/hippo/regexp/REGlobalData;BI)V

    .line 2074
    .end local v8    # "nextpc":I
    move/from16 v8, p2

    move v13, v12

    move/from16 v12, v17

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2035
    .end local v17    # "result":Z
    .local v12, "result":Z
    .restart local v13    # "pc":I
    :pswitch_8
    move/from16 v17, v12

    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v0

    .line 2036
    .local v0, "offset":I
    add-int/2addr v13, v0

    .line 2037
    add-int/lit8 v1, v13, 0x1

    .end local v13    # "pc":I
    .local v1, "pc":I
    aget-byte v14, v9, v13

    .line 2039
    .end local v0    # "offset":I
    move/from16 v8, p2

    move v13, v1

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 1978
    .end local v1    # "pc":I
    .end local v17    # "result":Z
    .restart local v12    # "result":Z
    .restart local v13    # "pc":I
    :pswitch_9
    move/from16 v17, v12

    .line 2012
    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    :goto_f
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v0

    add-int v8, v13, v0

    .line 2013
    .restart local v8    # "nextpc":I
    add-int/lit8 v13, v13, 0x2

    .line 2014
    add-int/lit8 v12, v13, 0x1

    .end local v13    # "pc":I
    .local v12, "pc":I
    aget-byte v13, v9, v13

    .line 2015
    .end local v14    # "op":I
    .local v13, "op":I
    iget v14, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 2016
    .local v14, "startcp":I
    invoke-static {v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reopIsSimple(I)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 2017
    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v2, v13

    move-object v3, v9

    move v4, v12

    move/from16 v5, p2

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->simpleMatch(Lcom/trendmicro/hippo/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I

    move-result v0

    .line 2018
    .local v0, "match":I
    if-gez v0, :cond_25

    .line 2019
    add-int/lit8 v1, v8, 0x1

    .end local v8    # "nextpc":I
    .local v1, "nextpc":I
    aget-byte v2, v9, v8

    .line 2020
    .end local v13    # "op":I
    .local v2, "op":I
    move v13, v1

    .line 2021
    .end local v12    # "pc":I
    .local v13, "pc":I
    move/from16 v8, p2

    move v14, v2

    move/from16 v12, v17

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2023
    .end local v1    # "nextpc":I
    .end local v2    # "op":I
    .restart local v8    # "nextpc":I
    .restart local v12    # "pc":I
    .local v13, "op":I
    :cond_25
    const/4 v1, 0x1

    .line 2024
    .end local v17    # "result":Z
    .local v1, "result":Z
    move v2, v0

    .line 2025
    .end local v12    # "pc":I
    .local v2, "pc":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "pc":I
    .local v3, "pc":I
    aget-byte v2, v9, v2

    move v12, v1

    move v6, v2

    move v13, v3

    .end local v13    # "op":I
    .local v2, "op":I
    goto :goto_10

    .line 2016
    .end local v0    # "match":I
    .end local v1    # "result":Z
    .end local v2    # "op":I
    .end local v3    # "pc":I
    .restart local v12    # "pc":I
    .restart local v13    # "op":I
    .restart local v17    # "result":Z
    :cond_26
    move v6, v13

    move v13, v12

    move/from16 v12, v17

    .line 2027
    .end local v17    # "result":Z
    .local v6, "op":I
    .local v12, "result":Z
    .local v13, "pc":I
    :goto_10
    add-int/lit8 v15, v8, 0x1

    .end local v8    # "nextpc":I
    .local v15, "nextpc":I
    aget-byte v8, v9, v8

    .line 2028
    .local v8, "nextop":B
    move-object/from16 v0, p0

    move v1, v8

    move v2, v15

    move v3, v14

    move v4, v10

    move v5, v11

    invoke-static/range {v0 .. v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushBackTrackState(Lcom/trendmicro/hippo/regexp/REGlobalData;BIIII)V

    .line 2031
    .end local v8    # "nextop":B
    .end local v14    # "startcp":I
    .end local v15    # "nextpc":I
    move/from16 v8, p2

    move v14, v6

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2052
    .end local v6    # "op":I
    .local v14, "op":I
    :pswitch_a
    move/from16 v17, v12

    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    .line 2053
    .local v0, "parenIndex":I
    add-int/lit8 v13, v13, 0x2

    .line 2054
    invoke-virtual {v7, v0}, Lcom/trendmicro/hippo/regexp/REGlobalData;->parensIndex(I)I

    move-result v1

    .line 2055
    .local v1, "cap_index":I
    iget v2, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    sub-int/2addr v2, v1

    invoke-virtual {v7, v0, v1, v2}, Lcom/trendmicro/hippo/regexp/REGlobalData;->setParens(III)V

    .line 2057
    add-int/lit8 v2, v13, 0x1

    .end local v13    # "pc":I
    .local v2, "pc":I
    aget-byte v14, v9, v13

    .line 2059
    .end local v0    # "parenIndex":I
    .end local v1    # "cap_index":I
    move/from16 v8, p2

    move v13, v2

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2044
    .end local v2    # "pc":I
    .end local v17    # "result":Z
    .restart local v12    # "result":Z
    .restart local v13    # "pc":I
    :pswitch_b
    move/from16 v17, v12

    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    .line 2045
    .restart local v0    # "parenIndex":I
    add-int/lit8 v13, v13, 0x2

    .line 2046
    iget v1, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    const/4 v8, 0x0

    invoke-virtual {v7, v0, v1, v8}, Lcom/trendmicro/hippo/regexp/REGlobalData;->setParens(III)V

    .line 2047
    add-int/lit8 v1, v13, 0x1

    .end local v13    # "pc":I
    .local v1, "pc":I
    aget-byte v14, v9, v13

    .line 2049
    .end local v0    # "parenIndex":I
    move v13, v1

    move v15, v8

    move/from16 v8, p2

    goto/16 :goto_2

    .line 1978
    .end local v1    # "pc":I
    .end local v17    # "result":Z
    .restart local v12    # "result":Z
    .restart local v13    # "pc":I
    :pswitch_c
    move/from16 v17, v12

    move v8, v15

    move v12, v6

    goto/16 :goto_b

    .line 2117
    .end local v12    # "result":Z
    .restart local v17    # "result":Z
    :goto_11
    const/4 v0, 0x0

    .line 2118
    .local v0, "greedy":Z
    packed-switch v14, :pswitch_data_3

    packed-switch v14, :pswitch_data_4

    .line 2151
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 2134
    :pswitch_d
    const/4 v0, 0x1

    .line 2137
    :pswitch_e
    const/4 v1, 0x0

    .line 2138
    .local v1, "min":I
    const/4 v2, 0x1

    .line 2139
    .local v2, "max":I
    move v15, v1

    move/from16 v18, v2

    move v6, v13

    move v13, v0

    goto :goto_12

    .line 2127
    .end local v1    # "min":I
    .end local v2    # "max":I
    :pswitch_f
    const/4 v0, 0x1

    .line 2130
    :pswitch_10
    const/4 v1, 0x1

    .line 2131
    .restart local v1    # "min":I
    const/4 v2, -0x1

    .line 2132
    .restart local v2    # "max":I
    move v15, v1

    move/from16 v18, v2

    move v6, v13

    move v13, v0

    goto :goto_12

    .line 2120
    .end local v1    # "min":I
    .end local v2    # "max":I
    :pswitch_11
    const/4 v0, 0x1

    .line 2123
    :pswitch_12
    const/4 v1, 0x0

    .line 2124
    .restart local v1    # "min":I
    const/4 v2, -0x1

    .line 2125
    .restart local v2    # "max":I
    move v15, v1

    move/from16 v18, v2

    move v6, v13

    move v13, v0

    goto :goto_12

    .line 2141
    .end local v1    # "min":I
    .end local v2    # "max":I
    :pswitch_13
    const/4 v0, 0x1

    .line 2144
    :pswitch_14
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v1

    .line 2145
    .restart local v1    # "min":I
    add-int/lit8 v13, v13, 0x2

    .line 2147
    invoke-static {v9, v13}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 2148
    .restart local v2    # "max":I
    add-int/lit8 v13, v13, 0x2

    .line 2149
    move v15, v1

    move/from16 v18, v2

    move v6, v13

    move v13, v0

    .line 2153
    .end local v0    # "greedy":Z
    .end local v1    # "min":I
    .end local v2    # "max":I
    .local v6, "pc":I
    .local v13, "greedy":Z
    .local v15, "min":I
    .local v18, "max":I
    :goto_12
    iget v3, v7, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move v1, v15

    move/from16 v2, v18

    move v5, v10

    move v8, v6

    .end local v6    # "pc":I
    .local v8, "pc":I
    move v6, v11

    invoke-static/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;IIILcom/trendmicro/hippo/regexp/REBackTrackData;II)V

    .line 2155
    if-eqz v13, :cond_27

    .line 2156
    const/16 v0, 0x33

    invoke-static {v7, v0, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushBackTrackState(Lcom/trendmicro/hippo/regexp/REGlobalData;BI)V

    .line 2157
    const/16 v0, 0x33

    .line 2158
    .end local v10    # "continuationOp":I
    .local v0, "continuationOp":I
    move v1, v8

    .line 2160
    .end local v11    # "continuationPc":I
    .local v1, "continuationPc":I
    add-int/lit8 v6, v8, 0x6

    .line 2161
    .end local v8    # "pc":I
    .restart local v6    # "pc":I
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "pc":I
    .local v2, "pc":I
    aget-byte v3, v9, v6

    move v10, v0

    move v11, v1

    move v13, v2

    move v14, v3

    .end local v14    # "op":I
    .local v3, "op":I
    goto :goto_13

    .line 2163
    .end local v0    # "continuationOp":I
    .end local v1    # "continuationPc":I
    .end local v2    # "pc":I
    .end local v3    # "op":I
    .restart local v8    # "pc":I
    .restart local v10    # "continuationOp":I
    .restart local v11    # "continuationPc":I
    .restart local v14    # "op":I
    :cond_27
    if-eqz v15, :cond_28

    .line 2164
    const/16 v0, 0x34

    .line 2165
    .end local v10    # "continuationOp":I
    .restart local v0    # "continuationOp":I
    move v1, v8

    .line 2167
    .end local v11    # "continuationPc":I
    .restart local v1    # "continuationPc":I
    add-int/lit8 v6, v8, 0x6

    .line 2168
    .end local v8    # "pc":I
    .restart local v6    # "pc":I
    add-int/lit8 v2, v6, 0x1

    .end local v6    # "pc":I
    .restart local v2    # "pc":I
    aget-byte v3, v9, v6

    move v10, v0

    move v11, v1

    move v13, v2

    move v14, v3

    .end local v14    # "op":I
    .restart local v3    # "op":I
    goto :goto_13

    .line 2170
    .end local v0    # "continuationOp":I
    .end local v1    # "continuationPc":I
    .end local v2    # "pc":I
    .end local v3    # "op":I
    .restart local v8    # "pc":I
    .restart local v10    # "continuationOp":I
    .restart local v11    # "continuationPc":I
    .restart local v14    # "op":I
    :cond_28
    invoke-static {v7, v12, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->pushBackTrackState(Lcom/trendmicro/hippo/regexp/REGlobalData;BI)V

    .line 2171
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->popProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;)Lcom/trendmicro/hippo/regexp/REProgState;

    .line 2172
    add-int/lit8 v6, v8, 0x4

    .line 2173
    .end local v8    # "pc":I
    .restart local v6    # "pc":I
    invoke-static {v9, v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getOffset([BI)I

    move-result v0

    add-int/2addr v6, v0

    .line 2174
    add-int/lit8 v0, v6, 0x1

    .end local v6    # "pc":I
    .local v0, "pc":I
    aget-byte v1, v9, v6

    move v13, v0

    move v14, v1

    .line 2178
    .end local v0    # "pc":I
    .end local v15    # "min":I
    .end local v18    # "max":I
    .local v13, "pc":I
    :goto_13
    move/from16 v8, p2

    move/from16 v12, v17

    const/4 v15, 0x0

    goto/16 :goto_2

    .line 2324
    .end local v17    # "result":Z
    .restart local v12    # "result":Z
    :cond_29
    return v16

    :pswitch_data_0
    .packed-switch 0x19
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x29
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x33
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x19
        :pswitch_13
        :pswitch_11
        :pswitch_f
        :pswitch_d
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x2d
        :pswitch_12
        :pswitch_10
        :pswitch_e
        :pswitch_14
    .end packed-switch
.end method

.method private static flatNIMatcher(Lcom/trendmicro/hippo/regexp/REGlobalData;IILjava/lang/String;I)Z
    .locals 7
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "matchChars"    # I
    .param p2, "length"    # I
    .param p3, "input"    # Ljava/lang/String;
    .param p4, "end"    # I

    .line 1418
    iget v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v0, p2

    const/4 v1, 0x0

    if-le v0, p4, :cond_0

    .line 1419
    return v1

    .line 1420
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v0, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    .line 1421
    .local v0, "source":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, p2, :cond_2

    .line 1422
    add-int v3, p1, v2

    aget-char v3, v0, v3

    .line 1423
    .local v3, "c1":C
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v4, v2

    invoke-virtual {p3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 1424
    .local v4, "c2":C
    if-eq v3, v4, :cond_1

    invoke-static {v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v5

    invoke-static {v4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v6

    if-eq v5, v6, :cond_1

    .line 1425
    return v1

    .line 1421
    .end local v3    # "c1":C
    .end local v4    # "c2":C
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1428
    .end local v2    # "i":I
    :cond_2
    iget v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v1, p2

    iput v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1429
    const/4 v1, 0x1

    return v1
.end method

.method private static flatNMatcher(Lcom/trendmicro/hippo/regexp/REGlobalData;IILjava/lang/String;I)Z
    .locals 4
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "matchChars"    # I
    .param p2, "length"    # I
    .param p3, "input"    # Ljava/lang/String;
    .param p4, "end"    # I

    .line 1403
    iget v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v0, p2

    const/4 v1, 0x0

    if-le v0, p4, :cond_0

    .line 1404
    return v1

    .line 1405
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_2

    .line 1406
    iget-object v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v2, v2, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    add-int v3, p1, v0

    aget-char v2, v2, v3

    iget v3, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v3, v0

    invoke-virtual {p3, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_1

    .line 1407
    return v1

    .line 1405
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1410
    .end local v0    # "i":I
    :cond_2
    iget v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1411
    const/4 v0, 0x1

    return v0
.end method

.method private static getDecimalValue(CLcom/trendmicro/hippo/regexp/CompilerState;ILjava/lang/String;)I
    .locals 6
    .param p0, "c"    # C
    .param p1, "state"    # Lcom/trendmicro/hippo/regexp/CompilerState;
    .param p2, "maxValue"    # I
    .param p3, "overflowMessageId"    # Ljava/lang/String;

    .line 782
    const/4 v0, 0x0

    .line 783
    .local v0, "overflow":Z
    iget v1, p1, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 784
    .local v1, "start":I
    iget-object v2, p1, Lcom/trendmicro/hippo/regexp/CompilerState;->cpbegin:[C

    .line 785
    .local v2, "src":[C
    add-int/lit8 v3, p0, -0x30

    .line 786
    .local v3, "value":I
    :goto_0
    iget v4, p1, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v5, p1, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-eq v4, v5, :cond_3

    .line 787
    iget v4, p1, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char p0, v2, v4

    .line 788
    invoke-static {p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isDigit(C)Z

    move-result v4

    if-nez v4, :cond_0

    .line 789
    goto :goto_2

    .line 791
    :cond_0
    if-nez v0, :cond_2

    .line 792
    mul-int/lit8 v4, v3, 0xa

    add-int/lit8 v5, p0, -0x30

    add-int/2addr v4, v5

    .line 793
    .local v4, "v":I
    if-ge v4, p2, :cond_1

    .line 794
    move v3, v4

    goto :goto_1

    .line 796
    :cond_1
    const/4 v0, 0x1

    .line 797
    move v3, p2

    .line 786
    .end local v4    # "v":I
    :cond_2
    :goto_1
    iget v4, p1, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p1, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    goto :goto_0

    .line 801
    :cond_3
    :goto_2
    if-eqz v0, :cond_4

    .line 802
    iget v4, p1, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    sub-int/2addr v4, v1

    .line 803
    invoke-static {v2, v1, v4}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v4

    .line 802
    invoke-static {p3, v4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 805
    :cond_4
    return v3
.end method

.method private static getImpl(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/regexp/RegExpImpl;
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 222
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->getRegExpProxy(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/RegExpProxy;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/regexp/RegExpImpl;

    return-object v0
.end method

.method private static getIndex([BI)I
    .locals 2
    .param p0, "array"    # [B
    .param p1, "pc"    # I

    .line 1219
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static getOffset([BI)I
    .locals 1
    .param p0, "array"    # [B
    .param p1, "pc"    # I

    .line 1204
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v0

    return v0
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 4
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 116
    new-instance v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    invoke-direct {v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;-><init>()V

    .line 117
    .local v0, "proto":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {p0, v1, v2, v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->compileRE(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/trendmicro/hippo/regexp/RECompiled;

    move-result-object v1

    iput-object v1, v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    .line 118
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->activatePrototypeMap(I)V

    .line 119
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 120
    invoke-static {p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 122
    new-instance v1, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;

    invoke-direct {v1}, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;-><init>()V

    .line 125
    .local v1, "ctor":Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;
    const-string v2, "constructor"

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v1, v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 127
    invoke-static {v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->setFunctionProtoAndParent(Lcom/trendmicro/hippo/BaseFunction;Lcom/trendmicro/hippo/Scriptable;)V

    .line 129
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->setImmunePrototypeProperty(Ljava/lang/Object;)V

    .line 131
    if-eqz p2, :cond_0

    .line 132
    invoke-virtual {v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->sealObject()V

    .line 133
    invoke-virtual {v1}, Lcom/trendmicro/hippo/regexp/NativeRegExpCtor;->sealObject()V

    .line 136
    :cond_0
    const-string v2, "RegExp"

    invoke-static {p1, v2, v1, v3}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 137
    return-void
.end method

.method private static isControlLetter(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 397
    const/16 v0, 0x61

    if-gt v0, p0, :cond_0

    const/16 v0, 0x7a

    if-le p0, v0, :cond_1

    :cond_0
    const/16 v0, 0x41

    if-gt v0, p0, :cond_2

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static isDigit(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 387
    const/16 v0, 0x30

    if-gt v0, p0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isLineTerm(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 402
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSLineTerminator(I)Z

    move-result v0

    return v0
.end method

.method private static isREWhiteSpace(I)Z
    .locals 1
    .param p0, "c"    # I

    .line 407
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->isJSWhitespaceOrLineTerminator(I)Z

    move-result v0

    return v0
.end method

.method private static isWord(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 392
    const/16 v0, 0x61

    if-gt v0, p0, :cond_0

    const/16 v0, 0x7a

    if-le p0, v0, :cond_3

    :cond_0
    const/16 v0, 0x41

    if-gt v0, p0, :cond_1

    const/16 v0, 0x5a

    if-le p0, v0, :cond_3

    :cond_1
    invoke-static {p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isDigit(C)Z

    move-result v0

    if-nez v0, :cond_3

    const/16 v0, 0x5f

    if-ne p0, v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static matchRegExp(Lcom/trendmicro/hippo/regexp/REGlobalData;Lcom/trendmicro/hippo/regexp/RECompiled;Ljava/lang/String;IIZ)Z
    .locals 9
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "re"    # Lcom/trendmicro/hippo/regexp/RECompiled;
    .param p2, "input"    # Ljava/lang/String;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "multiline"    # Z

    .line 2360
    iget v0, p1, Lcom/trendmicro/hippo/regexp/RECompiled;->parenCount:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2361
    iget v0, p1, Lcom/trendmicro/hippo/regexp/RECompiled;->parenCount:I

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    goto :goto_0

    .line 2363
    :cond_0
    iput-object v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    .line 2366
    :goto_0
    iput-object v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    .line 2367
    iput-object v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    .line 2369
    const/4 v0, 0x0

    const/4 v2, 0x1

    if-nez p5, :cond_2

    iget v3, p1, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/lit8 v3, v3, 0x4

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    move v3, v0

    goto :goto_2

    :cond_2
    :goto_1
    move v3, v2

    :goto_2
    iput-boolean v3, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->multiline:Z

    .line 2370
    iput-object p1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    .line 2372
    iget-object v3, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v3, v3, Lcom/trendmicro/hippo/regexp/RECompiled;->anchorCh:I

    .line 2377
    .local v3, "anchorCh":I
    move v4, p3

    .local v4, "i":I
    :goto_3
    if-gt v4, p4, :cond_9

    .line 2383
    if-ltz v3, :cond_5

    .line 2385
    :goto_4
    if-ne v4, p4, :cond_3

    .line 2386
    return v0

    .line 2388
    :cond_3
    invoke-virtual {p2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 2389
    .local v5, "matchCh":C
    if-eq v5, v3, :cond_5

    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v6, v6, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/lit8 v6, v6, 0x2

    if-eqz v6, :cond_4

    .line 2391
    invoke-static {v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v6

    int-to-char v7, v3

    invoke-static {v7}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v7

    if-ne v6, v7, :cond_4

    .line 2393
    goto :goto_5

    .line 2395
    :cond_4
    nop

    .end local v5    # "matchCh":C
    add-int/lit8 v4, v4, 0x1

    .line 2396
    goto :goto_4

    .line 2398
    :cond_5
    :goto_5
    iput v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 2399
    sub-int v5, v4, p3

    iput v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->skipped:I

    .line 2400
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_6
    iget v6, p1, Lcom/trendmicro/hippo/regexp/RECompiled;->parenCount:I

    if-ge v5, v6, :cond_6

    .line 2401
    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->parens:[J

    const-wide/16 v7, -0x1

    aput-wide v7, v6, v5

    .line 2400
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .line 2403
    .end local v5    # "j":I
    :cond_6
    invoke-static {p0, p2, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->executeREBytecode(Lcom/trendmicro/hippo/regexp/REGlobalData;Ljava/lang/String;I)Z

    move-result v5

    .line 2405
    .local v5, "result":Z
    iput-object v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    .line 2406
    iput-object v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    .line 2407
    if-eqz v5, :cond_7

    .line 2408
    return v2

    .line 2410
    :cond_7
    const/4 v6, -0x2

    if-ne v3, v6, :cond_8

    iget-boolean v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->multiline:Z

    if-nez v6, :cond_8

    .line 2411
    iput p4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->skipped:I

    .line 2412
    return v0

    .line 2414
    :cond_8
    iget v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->skipped:I

    add-int/2addr v6, p3

    .line 2377
    .end local v4    # "i":I
    .end local v5    # "result":Z
    .local v6, "i":I
    add-int/lit8 v4, v6, 0x1

    .end local v6    # "i":I
    .restart local v4    # "i":I
    goto :goto_3

    .line 2416
    .end local v4    # "i":I
    :cond_9
    return v0
.end method

.method private static parseAlternative(Lcom/trendmicro/hippo/regexp/CompilerState;)Z
    .locals 5
    .param p0, "state"    # Lcom/trendmicro/hippo/regexp/CompilerState;

    .line 526
    const/4 v0, 0x0

    .line 527
    .local v0, "headTerm":Lcom/trendmicro/hippo/regexp/RENode;
    const/4 v1, 0x0

    .line 528
    .local v1, "tailTerm":Lcom/trendmicro/hippo/regexp/RENode;
    iget-object v2, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpbegin:[C

    .line 530
    .local v2, "source":[C
    :cond_0
    iget v3, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v4, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-eq v3, v4, :cond_4

    iget v3, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v3, v2, v3

    const/16 v4, 0x7c

    if-eq v3, v4, :cond_4

    iget v3, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenNesting:I

    if-eqz v3, :cond_1

    iget v3, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v3, v2, v3

    const/16 v4, 0x29

    if-ne v3, v4, :cond_1

    goto :goto_1

    .line 540
    :cond_1
    invoke-static {p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->parseTerm(Lcom/trendmicro/hippo/regexp/CompilerState;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 541
    const/4 v3, 0x0

    return v3

    .line 542
    :cond_2
    if-nez v0, :cond_3

    .line 543
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 544
    move-object v1, v0

    goto :goto_0

    .line 547
    :cond_3
    iget-object v3, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput-object v3, v1, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    .line 548
    :goto_0
    iget-object v3, v1, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    if-eqz v3, :cond_0

    iget-object v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->next:Lcom/trendmicro/hippo/regexp/RENode;

    goto :goto_0

    .line 533
    :cond_4
    :goto_1
    const/4 v3, 0x1

    if-nez v0, :cond_5

    .line 534
    new-instance v4, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v4, v3}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v4, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    goto :goto_2

    .line 537
    :cond_5
    iput-object v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 538
    :goto_2
    return v3
.end method

.method private static parseDisjunction(Lcom/trendmicro/hippo/regexp/CompilerState;)Z
    .locals 9
    .param p0, "state"    # Lcom/trendmicro/hippo/regexp/CompilerState;

    .line 471
    invoke-static {p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->parseAlternative(Lcom/trendmicro/hippo/regexp/CompilerState;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 472
    return v1

    .line 473
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpbegin:[C

    .line 474
    .local v0, "source":[C
    iget v2, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 475
    .local v2, "index":I
    array-length v3, v0

    const/4 v4, 0x1

    if-eq v2, v3, :cond_6

    aget-char v3, v0, v2

    const/16 v5, 0x7c

    if-ne v3, v5, :cond_6

    .line 477
    iget v3, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 478
    new-instance v3, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v5, 0x1f

    invoke-direct {v3, v5}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    .line 479
    .local v3, "result":Lcom/trendmicro/hippo/regexp/RENode;
    iget-object v5, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput-object v5, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    .line 480
    invoke-static {p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->parseDisjunction(Lcom/trendmicro/hippo/regexp/CompilerState;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 481
    return v1

    .line 482
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    .line 483
    iput-object v3, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 488
    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    iget-byte v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    const/16 v5, 0xe

    if-ne v1, v5, :cond_3

    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    iget-byte v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    if-ne v1, v5, :cond_3

    .line 489
    iget v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_2

    .line 490
    const/16 v1, 0x35

    goto :goto_0

    :cond_2
    const/16 v1, 0x36

    :goto_0
    iput-byte v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    .line 491
    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    iget-char v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    iput-char v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    .line 492
    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    iget-char v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    iput v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    .line 495
    iget v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/lit8 v1, v1, 0xd

    iput v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    goto :goto_1

    .line 496
    :cond_3
    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    iget-byte v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    const/16 v6, 0x37

    const/16 v7, 0x100

    const/16 v8, 0x16

    if-ne v1, v8, :cond_4

    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    if-ge v1, v7, :cond_4

    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    iget-byte v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    if-ne v1, v5, :cond_4

    iget v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_4

    .line 498
    iput-byte v6, v3, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    .line 499
    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    iget-char v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    iput-char v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    .line 500
    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    iput v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    .line 503
    iget v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/lit8 v1, v1, 0xd

    iput v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    goto :goto_1

    .line 504
    :cond_4
    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    iget-byte v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    if-ne v1, v5, :cond_5

    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    iget-byte v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    if-ne v1, v8, :cond_5

    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    if-ge v1, v7, :cond_5

    iget v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_5

    .line 506
    iput-byte v6, v3, Lcom/trendmicro/hippo/regexp/RENode;->op:B

    .line 507
    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    iget-char v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    iput-char v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    .line 508
    iget-object v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->kid2:Lcom/trendmicro/hippo/regexp/RENode;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    iput v1, v3, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    .line 511
    iget v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/lit8 v1, v1, 0xd

    iput v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    goto :goto_1

    .line 514
    :cond_5
    iget v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/lit8 v1, v1, 0x9

    iput v1, p0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 517
    .end local v3    # "result":Lcom/trendmicro/hippo/regexp/RENode;
    :cond_6
    :goto_1
    return v4
.end method

.method private static parseTerm(Lcom/trendmicro/hippo/regexp/CompilerState;)Z
    .locals 16
    .param p0, "state"    # Lcom/trendmicro/hippo/regexp/CompilerState;

    .line 811
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpbegin:[C

    .line 812
    .local v1, "src":[C
    iget v2, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v2, v1, v2

    .line 813
    .local v2, "c":C
    const/4 v3, 0x2

    .line 814
    .local v3, "nDigits":I
    iget v4, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenCount:I

    .line 819
    .local v4, "parenBaseCount":I
    const/16 v5, 0x24

    const/4 v6, 0x3

    const/4 v7, 0x1

    if-eq v2, v5, :cond_2b

    const/16 v5, 0x2e

    const/16 v9, 0x2a

    const/16 v12, 0x3f

    const/4 v14, 0x0

    if-eq v2, v5, :cond_1e

    if-eq v2, v12, :cond_1d

    const/16 v5, 0x5e

    const/4 v15, 0x2

    if-eq v2, v5, :cond_1c

    const/16 v5, 0x5b

    const/16 v13, 0x5c

    const-string v8, ""

    if-eq v2, v5, :cond_17

    const/16 v5, 0xe

    const/4 v11, 0x4

    if-eq v2, v13, :cond_7

    packed-switch v2, :pswitch_data_0

    .line 1091
    new-instance v8, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v8, v5}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1092
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput-char v2, v5, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    .line 1093
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v7, v5, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    .line 1094
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    sub-int/2addr v8, v7

    iput v8, v5, Lcom/trendmicro/hippo/regexp/RENode;->flatIndex:I

    .line 1095
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v6

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    goto/16 :goto_9

    .line 1050
    :pswitch_0
    const-string v5, "msg.re.unmatched.right.paren"

    invoke-static {v5, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1051
    return v14

    .line 1013
    :pswitch_1
    const/4 v5, 0x0

    .line 1014
    .local v5, "result":Lcom/trendmicro/hippo/regexp/RENode;
    iget v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 1015
    .local v6, "termStart":I
    iget v13, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v13, v7

    iget v14, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    const/16 v10, 0x29

    if-ge v13, v14, :cond_2

    iget v13, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v13, v1, v13

    if-ne v13, v12, :cond_2

    iget v13, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v13, v7

    aget-char v13, v1, v13

    move v2, v13

    const/16 v14, 0x21

    const/16 v12, 0x3d

    if-eq v13, v12, :cond_0

    if-eq v2, v14, :cond_0

    const/16 v13, 0x3a

    if-ne v2, v13, :cond_2

    .line 1018
    :cond_0
    iget v13, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v13, v15

    iput v13, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 1019
    if-ne v2, v12, :cond_1

    .line 1020
    new-instance v12, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v12, v10}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    move-object v5, v12

    .line 1022
    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v12, v11

    iput v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    goto :goto_0

    .line 1023
    :cond_1
    if-ne v2, v14, :cond_3

    .line 1024
    new-instance v12, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v12, v9}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    move-object v5, v12

    .line 1026
    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v12, v11

    iput v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    goto :goto_0

    .line 1029
    :cond_2
    new-instance v11, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v12, 0x1d

    invoke-direct {v11, v12}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    move-object v5, v11

    .line 1031
    iget v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    const/4 v12, 0x6

    add-int/2addr v11, v12

    iput v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 1032
    iget v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenCount:I

    add-int/lit8 v12, v11, 0x1

    iput v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenCount:I

    iput v11, v5, Lcom/trendmicro/hippo/regexp/RENode;->parenIndex:I

    .line 1034
    :cond_3
    :goto_0
    iget v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenNesting:I

    add-int/2addr v11, v7

    iput v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenNesting:I

    .line 1035
    invoke-static/range {p0 .. p0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->parseDisjunction(Lcom/trendmicro/hippo/regexp/CompilerState;)Z

    move-result v11

    if-nez v11, :cond_4

    .line 1036
    const/4 v7, 0x0

    return v7

    .line 1037
    :cond_4
    iget v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-eq v11, v12, :cond_6

    iget v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v11, v1, v11

    if-eq v11, v10, :cond_5

    goto :goto_1

    .line 1041
    :cond_5
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v8, v7

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 1042
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenNesting:I

    sub-int/2addr v8, v7

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenNesting:I

    .line 1043
    if-eqz v5, :cond_1f

    .line 1044
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput-object v8, v5, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1045
    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    goto/16 :goto_9

    .line 1038
    :cond_6
    :goto_1
    const-string v7, "msg.unterm.paren"

    invoke-static {v7, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1039
    const/4 v7, 0x0

    return v7

    .line 830
    .end local v5    # "result":Lcom/trendmicro/hippo/regexp/RENode;
    .end local v6    # "termStart":I
    :cond_7
    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-ge v10, v12, :cond_16

    .line 831
    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/lit8 v12, v10, 0x1

    iput v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v2, v1, v10

    .line 832
    const/16 v10, 0x42

    if-eq v2, v10, :cond_15

    const/16 v10, 0x44

    if-eq v2, v10, :cond_14

    const/16 v10, 0x53

    if-eq v2, v10, :cond_13

    const/16 v10, 0x57

    if-eq v2, v10, :cond_12

    const/16 v10, 0x66

    if-eq v2, v10, :cond_11

    const/16 v10, 0x6e

    if-eq v2, v10, :cond_10

    const/16 v10, 0x20

    const-string v12, "msg.bad.backref"

    const/16 v13, 0x30

    packed-switch v2, :pswitch_data_1

    packed-switch v2, :pswitch_data_2

    packed-switch v2, :pswitch_data_3

    .line 1000
    new-instance v8, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v8, v5}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1001
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput-char v2, v5, Lcom/trendmicro/hippo/regexp/RENode;->chr:C

    .line 1002
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v7, v5, Lcom/trendmicro/hippo/regexp/RENode;->length:I

    .line 1003
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    sub-int/2addr v8, v7

    iput v8, v5, Lcom/trendmicro/hippo/regexp/RENode;->flatIndex:I

    .line 1004
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v6

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 1005
    goto/16 :goto_9

    .line 991
    :pswitch_2
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v6, 0x9

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 992
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 993
    goto/16 :goto_9

    .line 935
    :pswitch_3
    const/16 v2, 0xb

    .line 936
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 937
    goto/16 :goto_9

    .line 952
    :pswitch_4
    add-int/lit8 v3, v3, 0x2

    .line 955
    :pswitch_5
    const/4 v5, 0x0

    .line 957
    .local v5, "n":I
    const/4 v6, 0x0

    .line 958
    .local v6, "i":I
    :goto_2
    if-ge v6, v3, :cond_9

    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-ge v8, v10, :cond_9

    .line 959
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/lit8 v10, v8, 0x1

    iput v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v2, v1, v8

    .line 960
    invoke-static {v2, v5}, Lcom/trendmicro/hippo/Kit;->xDigitToInt(II)I

    move-result v5

    .line 961
    if-gez v5, :cond_8

    .line 964
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/lit8 v10, v6, 0x2

    sub-int/2addr v8, v10

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 965
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/lit8 v10, v8, 0x1

    iput v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v5, v1, v8

    .line 966
    goto :goto_3

    .line 958
    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 969
    :cond_9
    :goto_3
    int-to-char v2, v5

    .line 971
    .end local v5    # "n":I
    .end local v6    # "i":I
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 972
    goto/16 :goto_9

    .line 931
    :pswitch_6
    const/16 v2, 0x9

    .line 932
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 933
    goto/16 :goto_9

    .line 983
    :pswitch_7
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v6, 0xb

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 984
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 985
    goto/16 :goto_9

    .line 927
    :pswitch_8
    const/16 v2, 0xd

    .line 928
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 929
    goto/16 :goto_9

    .line 975
    :pswitch_9
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/4 v6, 0x7

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 976
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 977
    goto/16 :goto_9

    .line 940
    :pswitch_a
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-ge v5, v6, :cond_a

    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v5, v1, v5

    .line 941
    invoke-static {v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isControlLetter(C)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 942
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/lit8 v6, v5, 0x1

    iput v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v5, v1, v5

    and-int/lit8 v5, v5, 0x1f

    int-to-char v2, v5

    goto :goto_4

    .line 945
    :cond_a
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    sub-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 946
    const/16 v2, 0x5c

    .line 948
    :goto_4
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 949
    goto/16 :goto_9

    .line 835
    :pswitch_b
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v5, v11}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 836
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 837
    return v7

    .line 876
    :pswitch_c
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    sub-int/2addr v5, v7

    .line 877
    .local v5, "termStart":I
    const-string v11, "msg.overlarge.backref"

    const v14, 0xffff

    invoke-static {v2, v0, v14, v11}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getDecimalValue(CLcom/trendmicro/hippo/regexp/CompilerState;ILjava/lang/String;)I

    move-result v11

    .line 879
    .local v11, "num":I
    iget v14, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->backReferenceLimit:I

    if-le v11, v14, :cond_b

    .line 880
    iget-object v14, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cx:Lcom/trendmicro/hippo/Context;

    invoke-static {v14, v12, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportWarning(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 885
    :cond_b
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->backReferenceLimit:I

    if-le v11, v8, :cond_e

    .line 886
    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 887
    const/16 v6, 0x38

    if-lt v2, v6, :cond_c

    .line 890
    const/16 v2, 0x5c

    .line 891
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 892
    goto/16 :goto_9

    .line 894
    :cond_c
    iget v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v6, v7

    iput v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 895
    add-int/lit8 v6, v2, -0x30

    .line 896
    .end local v11    # "num":I
    .local v6, "num":I
    :goto_5
    if-ge v6, v10, :cond_d

    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-ge v8, v11, :cond_d

    .line 897
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v2, v1, v8

    .line 898
    if-lt v2, v13, :cond_d

    const/16 v8, 0x37

    if-gt v2, v8, :cond_d

    .line 899
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v8, v7

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 900
    mul-int/lit8 v8, v6, 0x8

    add-int/lit8 v11, v2, -0x30

    add-int v6, v8, v11

    goto :goto_5

    .line 905
    :cond_d
    int-to-char v2, v6

    .line 906
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 907
    goto/16 :goto_9

    .line 910
    .end local v6    # "num":I
    .restart local v11    # "num":I
    :cond_e
    new-instance v8, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v10, 0xd

    invoke-direct {v8, v10}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 911
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    add-int/lit8 v10, v11, -0x1

    iput v10, v8, Lcom/trendmicro/hippo/regexp/RENode;->parenIndex:I

    .line 912
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v8, v6

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 913
    iget v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->maxBackReference:I

    if-ge v6, v11, :cond_1f

    .line 914
    iput v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->maxBackReference:I

    goto/16 :goto_9

    .line 850
    .end local v5    # "termStart":I
    .end local v11    # "num":I
    :pswitch_d
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cx:Lcom/trendmicro/hippo/Context;

    invoke-static {v5, v12, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportWarning(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 852
    const/4 v5, 0x0

    .line 855
    .local v5, "num":I
    :goto_6
    if-ge v5, v10, :cond_f

    iget v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-ge v6, v8, :cond_f

    .line 856
    iget v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v2, v1, v6

    .line 857
    if-lt v2, v13, :cond_f

    const/16 v6, 0x37

    if-gt v2, v6, :cond_f

    .line 858
    iget v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v6, v7

    iput v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 859
    mul-int/lit8 v6, v5, 0x8

    add-int/lit8 v8, v2, -0x30

    add-int v5, v6, v8

    goto :goto_6

    .line 864
    :cond_f
    int-to-char v2, v5

    .line 865
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 866
    goto/16 :goto_9

    .line 923
    .end local v5    # "num":I
    :cond_10
    const/16 v2, 0xa

    .line 924
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 925
    goto/16 :goto_9

    .line 919
    :cond_11
    const/16 v2, 0xc

    .line 920
    invoke-static {v0, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->doFlat(Lcom/trendmicro/hippo/regexp/CompilerState;C)V

    .line 921
    goto/16 :goto_9

    .line 995
    :cond_12
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v6, 0xa

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 996
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 997
    goto/16 :goto_9

    .line 987
    :cond_13
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v6, 0xc

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 988
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 989
    goto/16 :goto_9

    .line 979
    :cond_14
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v6, 0x8

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 980
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 981
    goto/16 :goto_9

    .line 839
    :cond_15
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/4 v6, 0x5

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 840
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 841
    return v7

    .line 1010
    :cond_16
    const-string v5, "msg.trail.backslash"

    invoke-static {v5, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1011
    const/4 v5, 0x0

    return v5

    .line 1053
    :cond_17
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/16 v10, 0x16

    invoke-direct {v5, v10}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1054
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 1055
    .local v5, "termStart":I
    iget-object v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v5, v10, Lcom/trendmicro/hippo/regexp/RENode;->startIndex:I

    .line 1057
    :goto_7
    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-ne v10, v11, :cond_18

    .line 1058
    const-string v6, "msg.unterm.class"

    invoke-static {v6, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1059
    const/4 v6, 0x0

    return v6

    .line 1061
    :cond_18
    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v10, v1, v10

    if-ne v10, v13, :cond_19

    .line 1062
    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v10, v7

    iput v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    goto :goto_8

    .line 1064
    :cond_19
    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v10, v1, v10

    const/16 v11, 0x5d

    if-ne v10, v11, :cond_1b

    .line 1065
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    sub-int/2addr v10, v5

    iput v10, v8, Lcom/trendmicro/hippo/regexp/RENode;->kidlen:I

    .line 1066
    nop

    .line 1071
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->classCount:I

    add-int/lit8 v11, v10, 0x1

    iput v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->classCount:I

    iput v10, v8, Lcom/trendmicro/hippo/regexp/RENode;->index:I

    .line 1076
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/lit8 v11, v10, 0x1

    iput v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    invoke-static {v0, v8, v1, v5, v10}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->calculateBitmapSize(Lcom/trendmicro/hippo/regexp/CompilerState;Lcom/trendmicro/hippo/regexp/RENode;[CII)Z

    move-result v8

    if-nez v8, :cond_1a

    .line 1077
    const/4 v6, 0x0

    return v6

    .line 1078
    :cond_1a
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v8, v6

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 1079
    goto :goto_9

    .line 1069
    :cond_1b
    :goto_8
    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v10, v7

    iput v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    goto :goto_7

    .line 822
    .end local v5    # "termStart":I
    :cond_1c
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v5, v15}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 823
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 824
    return v7

    .line 1088
    :cond_1d
    :pswitch_e
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    sub-int/2addr v5, v7

    aget-char v5, v1, v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v5

    const-string v6, "msg.bad.quant"

    invoke-static {v6, v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1089
    const/4 v5, 0x0

    return v5

    .line 1082
    :cond_1e
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    const/4 v6, 0x6

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1083
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 1084
    nop

    .line 1099
    :cond_1f
    :goto_9
    iget-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1100
    .local v5, "term":Lcom/trendmicro/hippo/regexp/RENode;
    iget v6, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-ne v6, v8, :cond_20

    .line 1101
    return v7

    .line 1103
    :cond_20
    const/4 v6, 0x0

    .line 1104
    .local v6, "hasQ":Z
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v8, v1, v8

    const/4 v10, -0x1

    const/16 v11, 0x19

    if-eq v8, v9, :cond_27

    const/16 v9, 0x2b

    if-eq v8, v9, :cond_26

    const/16 v9, 0x3f

    if-eq v8, v9, :cond_25

    const/16 v9, 0x7b

    if-eq v8, v9, :cond_21

    goto/16 :goto_a

    .line 1131
    :cond_21
    const/4 v8, 0x0

    .line 1132
    .local v8, "min":I
    const/4 v9, -0x1

    .line 1133
    .local v9, "max":I
    iget v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 1141
    .local v10, "leftCurl":I
    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v12, v7

    iput v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    array-length v13, v1

    if-ge v12, v13, :cond_24

    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v12, v1, v12

    move v2, v12

    invoke-static {v12}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isDigit(C)Z

    move-result v12

    if-eqz v12, :cond_24

    .line 1142
    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v12, v7

    iput v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 1143
    const-string v12, "msg.overlarge.min"

    const v13, 0xffff

    invoke-static {v2, v0, v13, v12}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getDecimalValue(CLcom/trendmicro/hippo/regexp/CompilerState;ILjava/lang/String;)I

    move-result v8

    .line 1145
    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    array-length v13, v1

    if-ge v12, v13, :cond_24

    .line 1146
    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v2, v1, v12

    .line 1147
    const/16 v12, 0x2c

    if-ne v2, v12, :cond_22

    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v12, v7

    iput v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    array-length v13, v1

    if-ge v12, v13, :cond_22

    .line 1148
    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v2, v1, v12

    .line 1149
    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isDigit(C)Z

    move-result v12

    if-eqz v12, :cond_23

    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v12, v7

    iput v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    array-length v13, v1

    if-ge v12, v13, :cond_23

    .line 1150
    const-string v12, "msg.overlarge.max"

    const v13, 0xffff

    invoke-static {v2, v0, v13, v12}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getDecimalValue(CLcom/trendmicro/hippo/regexp/CompilerState;ILjava/lang/String;)I

    move-result v9

    .line 1152
    iget v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v2, v1, v12

    .line 1153
    if-le v8, v9, :cond_23

    .line 1154
    iget v7, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v7, v1, v7

    .line 1155
    invoke-static {v7}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    .line 1154
    const-string v11, "msg.max.lt.min"

    invoke-static {v11, v7}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->reportError(Ljava/lang/String;Ljava/lang/String;)V

    .line 1156
    const/4 v7, 0x0

    return v7

    .line 1160
    :cond_22
    move v9, v8

    .line 1163
    :cond_23
    const/16 v12, 0x7d

    if-ne v2, v12, :cond_24

    .line 1164
    new-instance v12, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v12, v11}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v12, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1165
    iget-object v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v8, v11, Lcom/trendmicro/hippo/regexp/RENode;->min:I

    .line 1166
    iget-object v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v9, v11, Lcom/trendmicro/hippo/regexp/RENode;->max:I

    .line 1169
    iget v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    const/16 v12, 0xc

    add-int/2addr v11, v12

    iput v11, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 1170
    const/4 v6, 0x1

    .line 1174
    :cond_24
    if-nez v6, :cond_28

    .line 1175
    iput v10, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    goto :goto_a

    .line 1122
    .end local v8    # "min":I
    .end local v9    # "max":I
    .end local v10    # "leftCurl":I
    :cond_25
    new-instance v8, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v8, v11}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1123
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    const/4 v9, 0x0

    iput v9, v8, Lcom/trendmicro/hippo/regexp/RENode;->min:I

    .line 1124
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v7, v8, Lcom/trendmicro/hippo/regexp/RENode;->max:I

    .line 1126
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    const/16 v9, 0x8

    add-int/2addr v8, v9

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 1127
    const/4 v6, 0x1

    .line 1128
    goto :goto_a

    .line 1106
    :cond_26
    new-instance v8, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v8, v11}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1107
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v7, v8, Lcom/trendmicro/hippo/regexp/RENode;->min:I

    .line 1108
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v10, v8, Lcom/trendmicro/hippo/regexp/RENode;->max:I

    .line 1110
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    const/16 v9, 0x8

    add-int/2addr v8, v9

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 1111
    const/4 v6, 0x1

    .line 1112
    goto :goto_a

    .line 1114
    :cond_27
    new-instance v8, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v8, v11}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1115
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    const/4 v9, 0x0

    iput v9, v8, Lcom/trendmicro/hippo/regexp/RENode;->min:I

    .line 1116
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v10, v8, Lcom/trendmicro/hippo/regexp/RENode;->max:I

    .line 1118
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    const/16 v9, 0x8

    add-int/2addr v8, v9

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 1119
    const/4 v6, 0x1

    .line 1120
    nop

    .line 1180
    :cond_28
    :goto_a
    if-nez v6, :cond_29

    .line 1181
    return v7

    .line 1183
    :cond_29
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v8, v7

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 1184
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput-object v5, v8, Lcom/trendmicro/hippo/regexp/RENode;->kid:Lcom/trendmicro/hippo/regexp/RENode;

    .line 1185
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput v4, v8, Lcom/trendmicro/hippo/regexp/RENode;->parenIndex:I

    .line 1186
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iget v9, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->parenCount:I

    sub-int/2addr v9, v4

    iput v9, v8, Lcom/trendmicro/hippo/regexp/RENode;->parenCount:I

    .line 1187
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    iget v9, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cpend:I

    if-ge v8, v9, :cond_2a

    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    aget-char v8, v1, v8

    const/16 v9, 0x3f

    if-ne v8, v9, :cond_2a

    .line 1188
    iget v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    add-int/2addr v8, v7

    iput v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->cp:I

    .line 1189
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    const/4 v9, 0x0

    iput-boolean v9, v8, Lcom/trendmicro/hippo/regexp/RENode;->greedy:Z

    goto :goto_b

    .line 1192
    :cond_2a
    iget-object v8, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    iput-boolean v7, v8, Lcom/trendmicro/hippo/regexp/RENode;->greedy:Z

    .line 1193
    :goto_b
    return v7

    .line 826
    .end local v5    # "term":Lcom/trendmicro/hippo/regexp/RENode;
    .end local v6    # "hasQ":Z
    :cond_2b
    new-instance v5, Lcom/trendmicro/hippo/regexp/RENode;

    invoke-direct {v5, v6}, Lcom/trendmicro/hippo/regexp/RENode;-><init>(B)V

    iput-object v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->result:Lcom/trendmicro/hippo/regexp/RENode;

    .line 827
    iget v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    add-int/2addr v5, v7

    iput v5, v0, Lcom/trendmicro/hippo/regexp/CompilerState;->progLength:I

    .line 828
    return v7

    nop

    :pswitch_data_0
    .packed-switch 0x28
        :pswitch_1
        :pswitch_0
        :pswitch_e
        :pswitch_e
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x30
        :pswitch_d
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x62
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x72
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_5
    .end packed-switch
.end method

.method private static popProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;)Lcom/trendmicro/hippo/regexp/REProgState;
    .locals 2
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;

    .line 1375
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    .line 1376
    .local v0, "state":Lcom/trendmicro/hippo/regexp/REProgState;
    iget-object v1, v0, Lcom/trendmicro/hippo/regexp/REProgState;->previous:Lcom/trendmicro/hippo/regexp/REProgState;

    iput-object v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    .line 1377
    return-object v0
.end method

.method private static processCharSet(Lcom/trendmicro/hippo/regexp/REGlobalData;Lcom/trendmicro/hippo/regexp/RECharSet;)V
    .locals 1
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "charSet"    # Lcom/trendmicro/hippo/regexp/RECharSet;

    .line 1532
    monitor-enter p1

    .line 1533
    :try_start_0
    iget-boolean v0, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->converted:Z

    if-nez v0, :cond_0

    .line 1534
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->processCharSetImpl(Lcom/trendmicro/hippo/regexp/REGlobalData;Lcom/trendmicro/hippo/regexp/RECharSet;)V

    .line 1535
    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->converted:Z

    .line 1537
    :cond_0
    monitor-exit p1

    .line 1538
    return-void

    .line 1537
    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static processCharSetImpl(Lcom/trendmicro/hippo/regexp/REGlobalData;Lcom/trendmicro/hippo/regexp/RECharSet;)V
    .locals 12
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "charSet"    # Lcom/trendmicro/hippo/regexp/RECharSet;

    .line 1544
    iget v0, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->startIndex:I

    .line 1545
    .local v0, "src":I
    iget v1, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->strlength:I

    add-int/2addr v1, v0

    .line 1547
    .local v1, "end":I
    const/4 v2, 0x0

    .line 1553
    .local v2, "rangeStart":C
    const/4 v3, 0x0

    .line 1555
    .local v3, "inRange":Z
    iget v4, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    add-int/lit8 v4, v4, 0x7

    div-int/lit8 v4, v4, 0x8

    .line 1556
    .local v4, "byteLength":I
    new-array v5, v4, [B

    iput-object v5, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->bits:[B

    .line 1558
    if-ne v0, v1, :cond_0

    .line 1559
    return-void

    .line 1561
    :cond_0
    iget-object v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v5, v5, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    aget-char v5, v5, v0

    const/16 v6, 0x5e

    if-ne v5, v6, :cond_1

    .line 1562
    nop

    .line 1563
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1565
    :cond_1
    nop

    .line 1568
    :goto_0
    if-eq v0, v1, :cond_19

    .line 1569
    const/4 v5, 0x2

    .line 1570
    .local v5, "nDigits":I
    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v6, v6, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    aget-char v6, v6, v0

    const/16 v7, 0x5c

    if-eq v6, v7, :cond_2

    .line 1689
    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v6, v6, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    add-int/lit8 v7, v0, 0x1

    .end local v0    # "src":I
    .local v7, "src":I
    aget-char v0, v6, v0

    .local v0, "thisCh":C
    goto/16 :goto_6

    .line 1572
    .end local v7    # "src":I
    .local v0, "src":I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 1573
    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v6, v6, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    add-int/lit8 v7, v0, 0x1

    .end local v0    # "src":I
    .restart local v7    # "src":I
    aget-char v0, v6, v0

    .line 1574
    .local v0, "c":C
    const/16 v6, 0x44

    if-eq v0, v6, :cond_17

    const/16 v6, 0x53

    if-eq v0, v6, :cond_15

    const/16 v6, 0x57

    if-eq v0, v6, :cond_13

    const/16 v6, 0x66

    if-eq v0, v6, :cond_b

    const/16 v6, 0x6e

    if-eq v0, v6, :cond_a

    const/16 v6, 0x30

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    .line 1682
    move v6, v0

    .line 1683
    .local v6, "thisCh":C
    goto/16 :goto_6

    .line 1672
    .end local v6    # "thisCh":C
    :pswitch_0
    iget v6, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    add-int/lit8 v6, v6, -0x1

    .local v6, "i":I
    :goto_1
    if-ltz v6, :cond_18

    .line 1673
    int-to-char v8, v6

    invoke-static {v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isWord(C)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 1674
    int-to-char v8, v6

    invoke-static {p1, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    .line 1672
    :cond_3
    add-int/lit8 v6, v6, -0x1

    goto :goto_1

    .line 1591
    .end local v6    # "i":I
    :pswitch_1
    const/16 v6, 0xb

    .line 1592
    .local v6, "thisCh":C
    move v0, v6

    goto/16 :goto_6

    .line 1602
    .end local v6    # "thisCh":C
    :pswitch_2
    add-int/lit8 v5, v5, 0x2

    .line 1605
    :pswitch_3
    const/4 v6, 0x0

    .line 1606
    .local v6, "n":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    if-ge v8, v5, :cond_5

    if-ge v7, v1, :cond_5

    .line 1607
    iget-object v9, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v9, v9, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    add-int/lit8 v10, v7, 0x1

    .end local v7    # "src":I
    .local v10, "src":I
    aget-char v0, v9, v7

    .line 1608
    invoke-static {v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->toASCIIHexDigit(I)I

    move-result v7

    .line 1609
    .local v7, "digit":I
    if-gez v7, :cond_4

    .line 1613
    add-int/lit8 v9, v8, 0x1

    sub-int v9, v10, v9

    .line 1614
    .end local v10    # "src":I
    .local v9, "src":I
    const/16 v6, 0x5c

    .line 1615
    move v7, v9

    goto :goto_3

    .line 1617
    .end local v9    # "src":I
    .restart local v10    # "src":I
    :cond_4
    shl-int/lit8 v9, v6, 0x4

    or-int v6, v9, v7

    .line 1606
    .end local v7    # "digit":I
    add-int/lit8 v8, v8, 0x1

    move v7, v10

    goto :goto_2

    .line 1619
    .end local v10    # "src":I
    .local v7, "src":I
    :cond_5
    :goto_3
    int-to-char v9, v6

    .line 1620
    .local v9, "thisCh":C
    move v0, v9

    goto/16 :goto_6

    .line 1588
    .end local v6    # "n":I
    .end local v8    # "i":I
    .end local v9    # "thisCh":C
    :pswitch_4
    const/16 v6, 0x9

    .line 1589
    .local v6, "thisCh":C
    move v0, v6

    goto/16 :goto_6

    .line 1662
    .end local v6    # "thisCh":C
    :pswitch_5
    iget v6, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    add-int/lit8 v6, v6, -0x1

    .local v6, "i":I
    :goto_4
    if-ltz v6, :cond_18

    .line 1663
    invoke-static {v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isREWhiteSpace(I)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 1664
    int-to-char v8, v6

    invoke-static {p1, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    .line 1662
    :cond_6
    add-int/lit8 v6, v6, -0x1

    goto :goto_4

    .line 1585
    .end local v6    # "i":I
    :pswitch_6
    const/16 v6, 0xd

    .line 1586
    .local v6, "thisCh":C
    move v0, v6

    goto/16 :goto_6

    .line 1654
    .end local v6    # "thisCh":C
    :pswitch_7
    const/16 v8, 0x39

    invoke-static {p1, v6, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterRangeToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;CC)V

    .line 1655
    goto/16 :goto_c

    .line 1594
    :pswitch_8
    if-ge v7, v1, :cond_7

    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v6, v6, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    aget-char v6, v6, v7

    invoke-static {v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isControlLetter(C)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1595
    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v6, v6, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    add-int/lit8 v8, v7, 0x1

    .end local v7    # "src":I
    .local v8, "src":I
    aget-char v6, v6, v7

    and-int/lit8 v6, v6, 0x1f

    int-to-char v6, v6

    move v0, v6

    move v7, v8

    .restart local v6    # "thisCh":C
    goto :goto_6

    .line 1597
    .end local v6    # "thisCh":C
    .end local v8    # "src":I
    .restart local v7    # "src":I
    :cond_7
    add-int/lit8 v7, v7, -0x1

    .line 1598
    const/16 v6, 0x5c

    .line 1600
    .restart local v6    # "thisCh":C
    move v0, v6

    goto :goto_6

    .line 1576
    .end local v6    # "thisCh":C
    :pswitch_9
    const/16 v6, 0x8

    .line 1577
    .restart local v6    # "thisCh":C
    move v0, v6

    goto :goto_6

    .line 1635
    .end local v6    # "thisCh":C
    :pswitch_a
    add-int/lit8 v8, v0, -0x30

    .line 1636
    .local v8, "n":I
    iget-object v9, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v9, v9, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    aget-char v0, v9, v7

    .line 1637
    if-gt v6, v0, :cond_9

    const/16 v9, 0x37

    if-gt v0, v9, :cond_9

    .line 1638
    add-int/lit8 v7, v7, 0x1

    .line 1639
    mul-int/lit8 v10, v8, 0x8

    add-int/lit8 v11, v0, -0x30

    add-int v8, v10, v11

    .line 1640
    iget-object v10, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v10, v10, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    aget-char v0, v10, v7

    .line 1641
    if-gt v6, v0, :cond_9

    if-gt v0, v9, :cond_9

    .line 1642
    add-int/lit8 v7, v7, 0x1

    .line 1643
    mul-int/lit8 v6, v8, 0x8

    add-int/lit8 v9, v0, -0x30

    add-int/2addr v6, v9

    .line 1644
    .local v6, "i":I
    const/16 v9, 0xff

    if-gt v6, v9, :cond_8

    .line 1645
    move v8, v6

    goto :goto_5

    .line 1647
    :cond_8
    add-int/lit8 v7, v7, -0x1

    .line 1650
    .end local v6    # "i":I
    :cond_9
    :goto_5
    int-to-char v6, v8

    .line 1651
    .local v6, "thisCh":C
    move v0, v6

    goto :goto_6

    .line 1582
    .end local v6    # "thisCh":C
    .end local v8    # "n":I
    :cond_a
    const/16 v6, 0xa

    .line 1583
    .restart local v6    # "thisCh":C
    move v0, v6

    goto :goto_6

    .line 1579
    .end local v6    # "thisCh":C
    :cond_b
    const/16 v6, 0xc

    .line 1580
    .restart local v6    # "thisCh":C
    move v0, v6

    .line 1693
    .end local v6    # "thisCh":C
    .local v0, "thisCh":C
    :goto_6
    if-eqz v3, :cond_11

    .line 1694
    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v6, v6, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/lit8 v6, v6, 0x2

    if-eqz v6, :cond_f

    .line 1695
    nop

    .line 1696
    move v6, v2

    .local v6, "c":C
    :goto_7
    if-gt v6, v0, :cond_10

    .line 1697
    invoke-static {p1, v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    .line 1698
    invoke-static {v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v8

    .line 1699
    .local v8, "uch":C
    invoke-static {v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->downcase(C)C

    move-result v9

    .line 1700
    .local v9, "dch":C
    if-eq v6, v8, :cond_c

    .line 1701
    invoke-static {p1, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    .line 1702
    :cond_c
    if-eq v6, v9, :cond_d

    .line 1703
    invoke-static {p1, v9}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    .line 1704
    :cond_d
    add-int/lit8 v10, v6, 0x1

    int-to-char v6, v10

    if-nez v6, :cond_e

    .line 1705
    goto :goto_8

    .line 1706
    .end local v8    # "uch":C
    .end local v9    # "dch":C
    :cond_e
    goto :goto_7

    .line 1708
    .end local v6    # "c":C
    :cond_f
    invoke-static {p1, v2, v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterRangeToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;CC)V

    .line 1710
    :cond_10
    :goto_8
    const/4 v3, 0x0

    move v0, v7

    goto/16 :goto_0

    .line 1713
    :cond_11
    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v6, v6, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/lit8 v6, v6, 0x2

    if-eqz v6, :cond_12

    .line 1714
    invoke-static {v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v6

    invoke-static {p1, v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    .line 1715
    invoke-static {v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->downcase(C)C

    move-result v6

    invoke-static {p1, v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    goto :goto_9

    .line 1717
    :cond_12
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    .line 1719
    :goto_9
    add-int/lit8 v6, v1, -0x1

    if-ge v7, v6, :cond_18

    .line 1720
    iget-object v6, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v6, v6, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    aget-char v6, v6, v7

    const/16 v8, 0x2d

    if-ne v6, v8, :cond_18

    .line 1721
    add-int/lit8 v6, v7, 0x1

    .line 1722
    .end local v7    # "src":I
    .local v6, "src":I
    const/4 v3, 0x1

    .line 1723
    move v2, v0

    move v0, v6

    goto/16 :goto_0

    .line 1677
    .end local v6    # "src":I
    .local v0, "c":C
    .restart local v7    # "src":I
    :cond_13
    iget v6, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    add-int/lit8 v6, v6, -0x1

    .local v6, "i":I
    :goto_a
    if-ltz v6, :cond_18

    .line 1678
    int-to-char v8, v6

    invoke-static {v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isWord(C)Z

    move-result v8

    if-nez v8, :cond_14

    .line 1679
    int-to-char v8, v6

    invoke-static {p1, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    .line 1677
    :cond_14
    add-int/lit8 v6, v6, -0x1

    goto :goto_a

    .line 1667
    .end local v6    # "i":I
    :cond_15
    iget v6, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    add-int/lit8 v6, v6, -0x1

    .restart local v6    # "i":I
    :goto_b
    if-ltz v6, :cond_18

    .line 1668
    invoke-static {v6}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isREWhiteSpace(I)Z

    move-result v8

    if-nez v8, :cond_16

    .line 1669
    int-to-char v8, v6

    invoke-static {p1, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;C)V

    .line 1667
    :cond_16
    add-int/lit8 v6, v6, -0x1

    goto :goto_b

    .line 1657
    .end local v6    # "i":I
    :cond_17
    const/4 v6, 0x0

    const/16 v8, 0x2f

    invoke-static {p1, v6, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterRangeToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;CC)V

    .line 1658
    const/16 v6, 0x3a

    iget v8, p1, Lcom/trendmicro/hippo/regexp/RECharSet;->length:I

    add-int/lit8 v8, v8, -0x1

    int-to-char v8, v8

    invoke-static {p1, v6, v8}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addCharacterRangeToCharSet(Lcom/trendmicro/hippo/regexp/RECharSet;CC)V

    .line 1660
    nop

    .line 1568
    .end local v0    # "c":C
    .end local v5    # "nDigits":I
    :cond_18
    :goto_c
    move v0, v7

    goto/16 :goto_0

    .line 1728
    .end local v7    # "src":I
    .local v0, "src":I
    :cond_19
    return-void

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
        :pswitch_a
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x62
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x72
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method private static pushBackTrackState(Lcom/trendmicro/hippo/regexp/REGlobalData;BI)V
    .locals 9
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "op"    # B
    .param p2, "pc"    # I

    .line 1383
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    .line 1384
    .local v0, "state":Lcom/trendmicro/hippo/regexp/REProgState;
    new-instance v8, Lcom/trendmicro/hippo/regexp/REBackTrackData;

    iget v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    iget v6, v0, Lcom/trendmicro/hippo/regexp/REProgState;->continuationOp:I

    iget v7, v0, Lcom/trendmicro/hippo/regexp/REProgState;->continuationPc:I

    move-object v1, v8

    move-object v2, p0

    move v3, p1

    move v4, p2

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/regexp/REBackTrackData;-><init>(Lcom/trendmicro/hippo/regexp/REGlobalData;IIIII)V

    iput-object v8, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    .line 1386
    return-void
.end method

.method private static pushBackTrackState(Lcom/trendmicro/hippo/regexp/REGlobalData;BIIII)V
    .locals 8
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "op"    # B
    .param p2, "pc"    # I
    .param p3, "cp"    # I
    .param p4, "continuationOp"    # I
    .param p5, "continuationPc"    # I

    .line 1392
    new-instance v7, Lcom/trendmicro/hippo/regexp/REBackTrackData;

    move-object v0, v7

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/trendmicro/hippo/regexp/REBackTrackData;-><init>(Lcom/trendmicro/hippo/regexp/REGlobalData;IIIII)V

    iput-object v7, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->backTrackStackTop:Lcom/trendmicro/hippo/regexp/REBackTrackData;

    .line 1394
    return-void
.end method

.method private static pushProgState(Lcom/trendmicro/hippo/regexp/REGlobalData;IIILcom/trendmicro/hippo/regexp/REBackTrackData;II)V
    .locals 9
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "min"    # I
    .param p2, "max"    # I
    .param p3, "cp"    # I
    .param p4, "backTrackLastToSave"    # Lcom/trendmicro/hippo/regexp/REBackTrackData;
    .param p5, "continuationOp"    # I
    .param p6, "continuationPc"    # I

    .line 1367
    new-instance v8, Lcom/trendmicro/hippo/regexp/REProgState;

    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    move-object v0, v8

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/trendmicro/hippo/regexp/REProgState;-><init>(Lcom/trendmicro/hippo/regexp/REProgState;IIILcom/trendmicro/hippo/regexp/REBackTrackData;II)V

    iput-object v8, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->stateStackTop:Lcom/trendmicro/hippo/regexp/REProgState;

    .line 1370
    return-void
.end method

.method private static realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/regexp/NativeRegExp;
    .locals 1
    .param p0, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 2730
    instance-of v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    if-eqz v0, :cond_0

    .line 2732
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    return-object v0

    .line 2731
    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static reopIsSimple(I)Z
    .locals 2
    .param p0, "op"    # I

    .line 1749
    const/4 v0, 0x1

    if-lt p0, v0, :cond_0

    const/16 v1, 0x17

    if-gt p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static reportError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "messageId"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;

    .line 2560
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2561
    .local v0, "msg":Ljava/lang/String;
    const-string v1, "SyntaxError"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private static reportWarning(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "messageId"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/String;

    .line 2552
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2553
    invoke-static {p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2554
    .local v0, "msg":Ljava/lang/String;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportWarning(Ljava/lang/String;)V

    .line 2556
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private static resolveForwardJump([BII)V
    .locals 1
    .param p0, "array"    # [B
    .param p1, "from"    # I
    .param p2, "pc"    # I

    .line 1198
    if-gt p1, p2, :cond_0

    .line 1199
    sub-int v0, p2, p1

    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->addIndex([BII)I

    .line 1200
    return-void

    .line 1198
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method private static simpleMatch(Lcom/trendmicro/hippo/regexp/REGlobalData;Ljava/lang/String;I[BIIZ)I
    .locals 7
    .param p0, "gData"    # Lcom/trendmicro/hippo/regexp/REGlobalData;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "op"    # I
    .param p3, "program"    # [B
    .param p4, "pc"    # I
    .param p5, "end"    # I
    .param p6, "updatecp"    # Z

    .line 1761
    const/4 v0, 0x0

    .line 1765
    .local v0, "result":Z
    iget v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1767
    .local v1, "startcp":I
    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch p2, :pswitch_data_0

    .line 1925
    :pswitch_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 1910
    :pswitch_1
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v2

    .line 1911
    .local v2, "index":I
    add-int/lit8 p4, p4, 0x2

    .line 1912
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v4, p5, :cond_f

    .line 1913
    iget-object v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->regexp:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v4, v4, Lcom/trendmicro/hippo/regexp/RECompiled;->classList:[Lcom/trendmicro/hippo/regexp/RECharSet;

    aget-object v4, v4, v2

    iget v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1914
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 1913
    invoke-static {p0, v4, v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->classMatcher(Lcom/trendmicro/hippo/regexp/REGlobalData;Lcom/trendmicro/hippo/regexp/RECharSet;C)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 1916
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v4, v3

    iput v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1917
    const/4 v0, 0x1

    .line 1918
    goto/16 :goto_5

    .line 1895
    .end local v2    # "index":I
    :pswitch_2
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v2

    int-to-char v2, v2

    .line 1896
    .local v2, "matchCh":C
    add-int/lit8 p4, p4, 0x2

    .line 1897
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v4, p5, :cond_f

    .line 1898
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 1899
    .local v4, "c":C
    if-eq v2, v4, :cond_0

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v5

    invoke-static {v4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v6

    if-ne v5, v6, :cond_1

    .line 1900
    :cond_0
    const/4 v0, 0x1

    .line 1901
    iget v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1903
    .end local v4    # "c":C
    :cond_1
    goto/16 :goto_5

    .line 1885
    .end local v2    # "matchCh":C
    :pswitch_3
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v2

    int-to-char v2, v2

    .line 1886
    .restart local v2    # "matchCh":C
    add-int/lit8 p4, p4, 0x2

    .line 1887
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v4, p5, :cond_f

    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v2, :cond_f

    .line 1888
    const/4 v0, 0x1

    .line 1889
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v4, v3

    iput v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    goto/16 :goto_5

    .line 1873
    .end local v2    # "matchCh":C
    :pswitch_4
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "pc":I
    .local v2, "pc":I
    aget-byte p4, p3, p4

    and-int/lit16 p4, p4, 0xff

    int-to-char p4, p4

    .line 1874
    .local p4, "matchCh":C
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v4, p5, :cond_4

    .line 1875
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 1876
    .restart local v4    # "c":C
    if-eq p4, v4, :cond_2

    invoke-static {p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v5

    invoke-static {v4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->upcase(C)C

    move-result v6

    if-ne v5, v6, :cond_3

    .line 1877
    :cond_2
    const/4 v0, 0x1

    .line 1878
    iget v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1880
    .end local v4    # "c":C
    :cond_3
    move p4, v2

    goto/16 :goto_5

    .line 1874
    :cond_4
    move p4, v2

    goto/16 :goto_5

    .line 1864
    .end local v2    # "pc":I
    .local p4, "pc":I
    :pswitch_5
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v2

    .line 1865
    .local v2, "offset":I
    add-int/lit8 p4, p4, 0x2

    .line 1866
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v3

    .line 1867
    .local v3, "length":I
    add-int/lit8 p4, p4, 0x2

    .line 1868
    invoke-static {p0, v2, v3, p1, p5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->flatNIMatcher(Lcom/trendmicro/hippo/regexp/REGlobalData;IILjava/lang/String;I)Z

    move-result v0

    .line 1870
    goto/16 :goto_5

    .line 1855
    .end local v2    # "offset":I
    .end local v3    # "length":I
    :pswitch_6
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "pc":I
    .local v2, "pc":I
    aget-byte p4, p3, p4

    and-int/lit16 p4, p4, 0xff

    int-to-char p4, p4

    .line 1856
    .local p4, "matchCh":C
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v4, p5, :cond_5

    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, p4, :cond_5

    .line 1857
    const/4 v0, 0x1

    .line 1858
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v4, v3

    iput v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    move p4, v2

    goto/16 :goto_5

    .line 1927
    .end local p4    # "matchCh":C
    :cond_5
    move p4, v2

    goto/16 :goto_5

    .line 1846
    .end local v2    # "pc":I
    .local p4, "pc":I
    :pswitch_7
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v2

    .line 1847
    .local v2, "offset":I
    add-int/lit8 p4, p4, 0x2

    .line 1848
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v3

    .line 1849
    .restart local v3    # "length":I
    add-int/lit8 p4, p4, 0x2

    .line 1850
    invoke-static {p0, v2, v3, p1, p5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->flatNMatcher(Lcom/trendmicro/hippo/regexp/REGlobalData;IILjava/lang/String;I)Z

    move-result v0

    .line 1852
    goto/16 :goto_5

    .line 1839
    .end local v2    # "offset":I
    .end local v3    # "length":I
    :pswitch_8
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->getIndex([BI)I

    move-result v2

    .line 1840
    .local v2, "parenIndex":I
    add-int/lit8 p4, p4, 0x2

    .line 1841
    invoke-static {p0, v2, p1, p5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->backrefMatcher(Lcom/trendmicro/hippo/regexp/REGlobalData;ILjava/lang/String;I)Z

    move-result v0

    .line 1843
    goto/16 :goto_5

    .line 1832
    .end local v2    # "parenIndex":I
    :pswitch_9
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v2, p5, :cond_f

    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isREWhiteSpace(I)Z

    move-result v2

    if-nez v2, :cond_f

    .line 1833
    const/4 v0, 0x1

    .line 1834
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    goto/16 :goto_5

    .line 1826
    :pswitch_a
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v2, p5, :cond_f

    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isREWhiteSpace(I)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 1827
    const/4 v0, 0x1

    .line 1828
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    goto/16 :goto_5

    .line 1820
    :pswitch_b
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v2, p5, :cond_f

    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isWord(C)Z

    move-result v2

    if-nez v2, :cond_f

    .line 1821
    const/4 v0, 0x1

    .line 1822
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    goto/16 :goto_5

    .line 1814
    :pswitch_c
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v2, p5, :cond_f

    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isWord(C)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 1815
    const/4 v0, 0x1

    .line 1816
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    goto/16 :goto_5

    .line 1808
    :pswitch_d
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v2, p5, :cond_f

    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isDigit(C)Z

    move-result v2

    if-nez v2, :cond_f

    .line 1809
    const/4 v0, 0x1

    .line 1810
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    goto/16 :goto_5

    .line 1802
    :pswitch_e
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v2, p5, :cond_f

    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isDigit(C)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 1803
    const/4 v0, 0x1

    .line 1804
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    goto/16 :goto_5

    .line 1796
    :pswitch_f
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v2, p5, :cond_f

    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isLineTerm(C)Z

    move-result v2

    if-nez v2, :cond_f

    .line 1797
    const/4 v0, 0x1

    .line 1798
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    goto/16 :goto_5

    .line 1792
    :pswitch_10
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eqz v4, :cond_7

    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    sub-int/2addr v4, v3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isWord(C)Z

    move-result v4

    if-nez v4, :cond_6

    goto :goto_0

    :cond_6
    move v4, v2

    goto :goto_1

    :cond_7
    :goto_0
    move v4, v3

    :goto_1
    iget v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-ge v5, p5, :cond_8

    iget v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1793
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isWord(C)Z

    move-result v5

    if-eqz v5, :cond_8

    move v2, v3

    goto :goto_2

    :cond_8
    nop

    :goto_2
    xor-int v0, v4, v2

    .line 1794
    goto :goto_5

    .line 1788
    :pswitch_11
    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eqz v4, :cond_a

    iget v4, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    sub-int/2addr v4, v3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isWord(C)Z

    move-result v4

    if-nez v4, :cond_9

    goto :goto_3

    :cond_9
    move v4, v2

    goto :goto_4

    :cond_a
    :goto_3
    move v4, v3

    :goto_4
    iget v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-ge v5, p5, :cond_b

    iget v5, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1789
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isWord(C)Z

    move-result v5

    if-nez v5, :cond_c

    :cond_b
    move v2, v3

    :cond_c
    xor-int v0, v4, v2

    .line 1790
    goto :goto_5

    .line 1780
    :pswitch_12
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eq v2, p5, :cond_d

    .line 1781
    iget-boolean v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->multiline:Z

    if-eqz v2, :cond_f

    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isLineTerm(C)Z

    move-result v2

    if-nez v2, :cond_d

    .line 1782
    goto :goto_5

    .line 1785
    :cond_d
    const/4 v0, 0x1

    .line 1786
    goto :goto_5

    .line 1772
    :pswitch_13
    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    if-eqz v2, :cond_e

    .line 1773
    iget-boolean v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->multiline:Z

    if-eqz v2, :cond_f

    iget v2, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    sub-int/2addr v2, v3

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->isLineTerm(C)Z

    move-result v2

    if-nez v2, :cond_e

    .line 1774
    goto :goto_5

    .line 1777
    :cond_e
    const/4 v0, 0x1

    .line 1778
    goto :goto_5

    .line 1769
    :pswitch_14
    const/4 v0, 0x1

    .line 1770
    nop

    .line 1927
    :cond_f
    :goto_5
    if-eqz v0, :cond_11

    .line 1928
    if-nez p6, :cond_10

    .line 1929
    iput v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1930
    :cond_10
    return p4

    .line 1932
    :cond_11
    iput v1, p0, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 1933
    const/4 v2, -0x1

    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_14
        :pswitch_13
        :pswitch_12
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
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private static toASCIIHexDigit(I)I
    .locals 2
    .param p0, "c"    # I

    .line 451
    const/4 v0, -0x1

    const/16 v1, 0x30

    if-ge p0, v1, :cond_0

    .line 452
    return v0

    .line 453
    :cond_0
    const/16 v1, 0x39

    if-gt p0, v1, :cond_1

    .line 454
    add-int/lit8 v0, p0, -0x30

    return v0

    .line 456
    :cond_1
    or-int/lit8 p0, p0, 0x20

    .line 457
    const/16 v1, 0x61

    if-gt v1, p0, :cond_2

    const/16 v1, 0x66

    if-gt p0, v1, :cond_2

    .line 458
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    return v0

    .line 460
    :cond_2
    return v0
.end method

.method private static upcase(C)C
    .locals 2
    .param p0, "ch"    # C

    .line 423
    const/16 v0, 0x80

    if-ge p0, v0, :cond_1

    .line 424
    const/16 v0, 0x61

    if-gt v0, p0, :cond_0

    const/16 v0, 0x7a

    if-gt p0, v0, :cond_0

    .line 425
    add-int/lit8 v0, p0, -0x20

    int-to-char v0, v0

    return v0

    .line 427
    :cond_0
    return p0

    .line 429
    :cond_1
    invoke-static {p0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    .line 430
    .local v1, "cu":C
    if-ge v1, v0, :cond_2

    move v0, p0

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 167
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p4, v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->execSub(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method compile(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 178
    array-length v0, p3

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez v0, :cond_2

    aget-object v0, p3, v2

    instance-of v0, v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    if-eqz v0, :cond_2

    .line 179
    array-length v0, p3

    if-le v0, v1, :cond_1

    aget-object v0, p3, v1

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 181
    :cond_0
    const-string v0, "msg.bad.regexp.compile"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 183
    :cond_1
    :goto_0
    aget-object v0, p3, v2

    check-cast v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;

    .line 184
    .local v0, "thatObj":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    iget-object v1, v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iput-object v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    .line 185
    iget-object v1, v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    iput-object v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 186
    return-object p0

    .line 188
    .end local v0    # "thatObj":Lcom/trendmicro/hippo/regexp/NativeRegExp;
    :cond_2
    array-length v0, p3

    if-eqz v0, :cond_4

    aget-object v0, p3, v2

    instance-of v0, v0, Lcom/trendmicro/hippo/Undefined;

    if-eqz v0, :cond_3

    goto :goto_1

    :cond_3
    aget-object v0, p3, v2

    invoke-static {v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->escapeRegExp(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_4
    :goto_1
    const-string v0, ""

    .line 189
    .local v0, "s":Ljava/lang/String;
    :goto_2
    array-length v3, p3

    if-le v3, v1, :cond_5

    aget-object v3, p3, v1

    sget-object v4, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v3, v4, :cond_5

    .line 190
    aget-object v1, p3, v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 191
    :cond_5
    const/4 v1, 0x0

    :goto_3
    nop

    .line 192
    .local v1, "global":Ljava/lang/String;
    invoke-static {p1, v0, v1, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->compileRE(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/trendmicro/hippo/regexp/RECompiled;

    move-result-object v2

    iput-object v2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    .line 193
    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    iput-object v2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 194
    return-object p0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 173
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->execSub(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 2702
    sget-object v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->REGEXP_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2703
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 2705
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 2706
    .local v0, "id":I
    packed-switch v0, :pswitch_data_0

    .line 2725
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2723
    :pswitch_0
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move-result-object v1

    const/4 v2, 0x2

    invoke-direct {v1, p2, p3, p5, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->execSub(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 2718
    :pswitch_1
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v1, p2, p3, p5, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->execSub(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 2719
    .local v1, "x":Ljava/lang/Object;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object v2

    .line 2715
    .end local v1    # "x":Ljava/lang/Object;
    :pswitch_2
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v1, p2, p3, p5, v2}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->execSub(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 2712
    :pswitch_3
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 2708
    :pswitch_4
    invoke-static {p4, p1}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->realThis(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/regexp/NativeRegExp;

    move-result-object v1

    invoke-virtual {v1, p2, p3, p5}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->compile(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method executeRegExp(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/regexp/RegExpImpl;Ljava/lang/String;[II)Ljava/lang/Object;
    .locals 18
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "res"    # Lcom/trendmicro/hippo/regexp/RegExpImpl;
    .param p4, "str"    # Ljava/lang/String;
    .param p5, "indexp"    # [I
    .param p6, "matchType"    # I

    .line 2425
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v8, p4

    move/from16 v9, p6

    new-instance v2, Lcom/trendmicro/hippo/regexp/REGlobalData;

    invoke-direct {v2}, Lcom/trendmicro/hippo/regexp/REGlobalData;-><init>()V

    move-object v10, v2

    .line 2427
    .local v10, "gData":Lcom/trendmicro/hippo/regexp/REGlobalData;
    const/4 v11, 0x0

    aget v2, p5, v11

    .line 2428
    .local v2, "start":I
    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v12

    .line 2429
    .local v12, "end":I
    if-le v2, v12, :cond_0

    .line 2430
    move v2, v12

    move v13, v2

    goto :goto_0

    .line 2429
    :cond_0
    move v13, v2

    .line 2434
    .end local v2    # "start":I
    .local v13, "start":I
    :goto_0
    iget-object v3, v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-boolean v7, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->multiline:Z

    move-object v2, v10

    move-object/from16 v4, p4

    move v5, v13

    move v6, v12

    invoke-static/range {v2 .. v7}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->matchRegExp(Lcom/trendmicro/hippo/regexp/REGlobalData;Lcom/trendmicro/hippo/regexp/RECompiled;Ljava/lang/String;IIZ)Z

    move-result v2

    .line 2436
    .local v2, "matches":Z
    const/4 v3, 0x0

    if-nez v2, :cond_2

    .line 2437
    const/4 v4, 0x2

    if-eq v9, v4, :cond_1

    return-object v3

    .line 2438
    :cond_1
    sget-object v3, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v3

    .line 2440
    :cond_2
    iget v4, v10, Lcom/trendmicro/hippo/regexp/REGlobalData;->cp:I

    .line 2441
    .local v4, "index":I
    aput v4, p5, v11

    move v5, v4

    .line 2442
    .local v5, "ep":I
    iget v6, v10, Lcom/trendmicro/hippo/regexp/REGlobalData;->skipped:I

    add-int/2addr v6, v13

    sub-int v6, v5, v6

    .line 2443
    .local v6, "matchlen":I
    sub-int/2addr v4, v6

    .line 2447
    if-nez v9, :cond_3

    .line 2452
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2453
    .local v7, "result":Ljava/lang/Object;
    const/4 v14, 0x0

    move/from16 v17, v2

    move-object v15, v7

    move-object v3, v14

    move-object/from16 v7, p1

    move-object/from16 v14, p2

    .local v14, "obj":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_1

    .line 2462
    .end local v7    # "result":Ljava/lang/Object;
    .end local v14    # "obj":Lcom/trendmicro/hippo/Scriptable;
    :cond_3
    move-object/from16 v7, p1

    move-object/from16 v14, p2

    invoke-virtual {v7, v14, v11}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v15

    .line 2463
    .local v15, "result":Ljava/lang/Object;
    move-object v3, v15

    check-cast v3, Lcom/trendmicro/hippo/Scriptable;

    .line 2465
    .local v3, "obj":Lcom/trendmicro/hippo/Scriptable;
    add-int v11, v4, v6

    invoke-virtual {v8, v4, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    .line 2466
    .local v11, "matchstr":Ljava/lang/String;
    move/from16 v17, v2

    const/4 v2, 0x0

    .end local v2    # "matches":Z
    .local v17, "matches":Z
    invoke-interface {v3, v2, v3, v11}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2469
    .end local v11    # "matchstr":Ljava/lang/String;
    :goto_1
    iget-object v2, v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v2, v2, Lcom/trendmicro/hippo/regexp/RECompiled;->parenCount:I

    if-nez v2, :cond_4

    .line 2470
    const/4 v2, 0x0

    iput-object v2, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->parens:[Lcom/trendmicro/hippo/regexp/SubString;

    .line 2471
    new-instance v2, Lcom/trendmicro/hippo/regexp/SubString;

    invoke-direct {v2}, Lcom/trendmicro/hippo/regexp/SubString;-><init>()V

    iput-object v2, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastParen:Lcom/trendmicro/hippo/regexp/SubString;

    goto :goto_5

    .line 2473
    :cond_4
    const/4 v2, 0x0

    .line 2475
    .local v2, "parsub":Lcom/trendmicro/hippo/regexp/SubString;
    iget-object v11, v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v11, v11, Lcom/trendmicro/hippo/regexp/RECompiled;->parenCount:I

    new-array v11, v11, [Lcom/trendmicro/hippo/regexp/SubString;

    iput-object v11, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->parens:[Lcom/trendmicro/hippo/regexp/SubString;

    .line 2476
    const/4 v11, 0x0

    .local v11, "num":I
    :goto_2
    iget-object v7, v0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v7, v7, Lcom/trendmicro/hippo/regexp/RECompiled;->parenCount:I

    if-ge v11, v7, :cond_8

    .line 2477
    invoke-virtual {v10, v11}, Lcom/trendmicro/hippo/regexp/REGlobalData;->parensIndex(I)I

    move-result v7

    .line 2478
    .local v7, "cap_index":I
    const/4 v0, -0x1

    if-eq v7, v0, :cond_6

    .line 2479
    invoke-virtual {v10, v11}, Lcom/trendmicro/hippo/regexp/REGlobalData;->parensLength(I)I

    move-result v0

    .line 2480
    .local v0, "cap_length":I
    new-instance v14, Lcom/trendmicro/hippo/regexp/SubString;

    invoke-direct {v14, v8, v7, v0}, Lcom/trendmicro/hippo/regexp/SubString;-><init>(Ljava/lang/String;II)V

    move-object v2, v14

    .line 2481
    iget-object v14, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->parens:[Lcom/trendmicro/hippo/regexp/SubString;

    aput-object v2, v14, v11

    .line 2482
    if-eqz v9, :cond_5

    .line 2483
    add-int/lit8 v14, v11, 0x1

    move/from16 v16, v0

    .end local v0    # "cap_length":I
    .local v16, "cap_length":I
    invoke-virtual {v2}, Lcom/trendmicro/hippo/regexp/SubString;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v14, v3, v0}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_3

    .line 2482
    .end local v16    # "cap_length":I
    .restart local v0    # "cap_length":I
    :cond_5
    move/from16 v16, v0

    .line 2484
    .end local v0    # "cap_length":I
    :goto_3
    goto :goto_4

    .line 2486
    :cond_6
    if-eqz v9, :cond_7

    .line 2487
    add-int/lit8 v0, v11, 0x1

    sget-object v14, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-interface {v3, v0, v3, v14}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2476
    .end local v7    # "cap_index":I
    :cond_7
    :goto_4
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    move-object/from16 v14, p2

    goto :goto_2

    .line 2490
    :cond_8
    iput-object v2, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastParen:Lcom/trendmicro/hippo/regexp/SubString;

    .line 2493
    .end local v2    # "parsub":Lcom/trendmicro/hippo/regexp/SubString;
    .end local v11    # "num":I
    :goto_5
    if-eqz v9, :cond_9

    .line 2498
    iget v0, v10, Lcom/trendmicro/hippo/regexp/REGlobalData;->skipped:I

    add-int/2addr v0, v13

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v2, "index"

    invoke-interface {v3, v2, v3, v0}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2499
    const-string v0, "input"

    invoke-interface {v3, v0, v3, v8}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 2502
    :cond_9
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    if-nez v0, :cond_a

    .line 2503
    new-instance v0, Lcom/trendmicro/hippo/regexp/SubString;

    invoke-direct {v0}, Lcom/trendmicro/hippo/regexp/SubString;-><init>()V

    iput-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    .line 2504
    new-instance v0, Lcom/trendmicro/hippo/regexp/SubString;

    invoke-direct {v0}, Lcom/trendmicro/hippo/regexp/SubString;-><init>()V

    iput-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    .line 2505
    new-instance v0, Lcom/trendmicro/hippo/regexp/SubString;

    invoke-direct {v0}, Lcom/trendmicro/hippo/regexp/SubString;-><init>()V

    iput-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->rightContext:Lcom/trendmicro/hippo/regexp/SubString;

    .line 2507
    :cond_a
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    iput-object v8, v0, Lcom/trendmicro/hippo/regexp/SubString;->str:Ljava/lang/String;

    .line 2508
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    iput v4, v0, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    .line 2509
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->lastMatch:Lcom/trendmicro/hippo/regexp/SubString;

    iput v6, v0, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    .line 2511
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    iput-object v8, v0, Lcom/trendmicro/hippo/regexp/SubString;->str:Ljava/lang/String;

    .line 2512
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    const/16 v2, 0x78

    if-ne v0, v2, :cond_b

    .line 2526
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    iput v13, v0, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    .line 2527
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    iget v2, v10, Lcom/trendmicro/hippo/regexp/REGlobalData;->skipped:I

    iput v2, v0, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    goto :goto_6

    .line 2534
    :cond_b
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    const/4 v2, 0x0

    iput v2, v0, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    .line 2535
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->leftContext:Lcom/trendmicro/hippo/regexp/SubString;

    iget v2, v10, Lcom/trendmicro/hippo/regexp/REGlobalData;->skipped:I

    add-int/2addr v2, v13

    iput v2, v0, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    .line 2538
    :goto_6
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->rightContext:Lcom/trendmicro/hippo/regexp/SubString;

    iput-object v8, v0, Lcom/trendmicro/hippo/regexp/SubString;->str:Ljava/lang/String;

    .line 2539
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->rightContext:Lcom/trendmicro/hippo/regexp/SubString;

    iput v5, v0, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    .line 2540
    iget-object v0, v1, Lcom/trendmicro/hippo/regexp/RegExpImpl;->rightContext:Lcom/trendmicro/hippo/regexp/SubString;

    sub-int v2, v12, v5

    iput v2, v0, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    .line 2542
    return-object v15
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 2586
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 2587
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 2588
    .local v2, "s_length":I
    const/4 v3, 0x0

    const/4 v4, 0x6

    if-ne v2, v4, :cond_1

    .line 2589
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 2590
    .local v3, "c":I
    const/16 v4, 0x67

    if-ne v3, v4, :cond_0

    const-string v1, "global"

    const/4 v0, 0x3

    goto :goto_0

    .line 2591
    :cond_0
    const/16 v4, 0x73

    if-ne v3, v4, :cond_4

    const-string v1, "source"

    const/4 v0, 0x2

    goto :goto_0

    .line 2593
    .end local v3    # "c":I
    :cond_1
    const/16 v4, 0x9

    if-ne v2, v4, :cond_3

    .line 2594
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 2595
    .restart local v3    # "c":I
    const/16 v4, 0x6c

    if-ne v3, v4, :cond_2

    const-string v1, "lastIndex"

    const/4 v0, 0x1

    goto :goto_0

    .line 2596
    :cond_2
    const/16 v4, 0x6d

    if-ne v3, v4, :cond_4

    const-string v1, "multiline"

    const/4 v0, 0x5

    goto :goto_0

    .line 2598
    .end local v3    # "c":I
    :cond_3
    const/16 v3, 0xa

    if-ne v2, v3, :cond_4

    const-string v1, "ignoreCase"

    const/4 v0, 0x4

    .line 2599
    :cond_4
    :goto_0
    if-eqz v1, :cond_5

    if-eq v1, p1, :cond_5

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const/4 v0, 0x0

    .line 2605
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_5
    if-nez v0, :cond_6

    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 2608
    :cond_6
    const/4 v1, 0x1

    if-eq v0, v1, :cond_9

    const/4 v1, 0x2

    if-eq v0, v1, :cond_8

    const/4 v1, 0x3

    if-eq v0, v1, :cond_8

    const/4 v1, 0x4

    if-eq v0, v1, :cond_8

    const/4 v1, 0x5

    if-ne v0, v1, :cond_7

    goto :goto_1

    .line 2619
    :cond_7
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 2616
    :cond_8
    :goto_1
    const/4 v1, 0x7

    .line 2617
    .local v1, "attr":I
    goto :goto_2

    .line 2610
    .end local v1    # "attr":I
    :cond_9
    iget v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndexAttr:I

    .line 2611
    .restart local v1    # "attr":I
    nop

    .line 2621
    :goto_2
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->instanceIdInfo(II)I

    move-result v2

    return v2
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 2741
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 2742
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    const/16 v4, 0x74

    if-eq v2, v3, :cond_4

    const/4 v3, 0x6

    if-eq v2, v3, :cond_3

    const/4 v3, 0x7

    if-eq v2, v3, :cond_2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 2749
    :cond_0
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 2750
    .local v2, "c":I
    const/16 v3, 0x6f

    if-ne v2, v3, :cond_1

    const-string v1, "toSource"

    const/4 v0, 0x3

    goto :goto_0

    .line 2751
    :cond_1
    if-ne v2, v4, :cond_6

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 2748
    .end local v2    # "c":I
    :cond_2
    const-string v1, "compile"

    const/4 v0, 0x1

    goto :goto_0

    .line 2747
    :cond_3
    const-string v1, "prefix"

    const/4 v0, 0x6

    goto :goto_0

    .line 2743
    :cond_4
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 2744
    .restart local v2    # "c":I
    const/16 v3, 0x65

    if-ne v2, v3, :cond_5

    const-string v1, "exec"

    const/4 v0, 0x4

    goto :goto_0

    .line 2745
    :cond_5
    if-ne v2, v4, :cond_6

    const-string v1, "test"

    const/4 v0, 0x5

    .line 2754
    .end local v2    # "c":I
    :cond_6
    :goto_0
    if-eqz v1, :cond_7

    if-eq v1, p1, :cond_7

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    const/4 v0, 0x0

    .line 2758
    .end local v1    # "X":Ljava/lang/String;
    :cond_7
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 149
    const-string v0, "RegExp"

    return-object v0
.end method

.method getFlags()I
    .locals 1

    .line 2547
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v0, v0, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    return v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .line 2627
    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 2634
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 2632
    :cond_0
    const-string v0, "multiline"

    return-object v0

    .line 2631
    :cond_1
    const-string v0, "ignoreCase"

    return-object v0

    .line 2630
    :cond_2
    const-string v0, "global"

    return-object v0

    .line 2629
    :cond_3
    const-string v0, "source"

    return-object v0

    .line 2628
    :cond_4
    const-string v0, "lastIndex"

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 4
    .param p1, "id"    # I

    .line 2640
    const/4 v0, 0x1

    if-eq p1, v0, :cond_7

    const/4 v1, 0x2

    if-eq p1, v1, :cond_6

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-eq p1, v2, :cond_4

    const/4 v2, 0x4

    if-eq p1, v2, :cond_2

    const/4 v1, 0x5

    if-eq p1, v1, :cond_0

    .line 2652
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 2650
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/2addr v1, v2

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    move v0, v3

    :goto_0
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 2648
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v2, v2, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/2addr v1, v2

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    move v0, v3

    :goto_1
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 2646
    :cond_4
    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_5

    goto :goto_2

    :cond_5
    move v0, v3

    :goto_2
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 2644
    :cond_6
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v1, v1, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0

    .line 2642
    :cond_7
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    return-object v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 2578
    const/4 v0, 0x5

    return v0
.end method

.method public getTypeOf()Ljava/lang/String;
    .locals 1

    .line 160
    const-string v0, "object"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 2686
    packed-switch p1, :pswitch_data_0

    .line 2693
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2692
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "prefix"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 2691
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "test"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 2690
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "exec"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 2689
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 2688
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 2687
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "compile"

    .line 2695
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/regexp/NativeRegExp;->REGEXP_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/regexp/NativeRegExp;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 2696
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected setInstanceIdAttributes(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .line 2673
    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    .line 2678
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdAttributes(II)V

    .line 2679
    return-void

    .line 2675
    :cond_0
    iput p2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndexAttr:I

    .line 2676
    return-void
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 2658
    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 2668
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 2669
    return-void

    .line 2666
    :cond_0
    return-void

    .line 2660
    :cond_1
    iput-object p2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->lastIndex:Ljava/lang/Object;

    .line 2661
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 201
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 202
    iget-object v2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v2, v2, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    array-length v2, v2

    if-eqz v2, :cond_0

    .line 203
    iget-object v2, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget-object v2, v2, Lcom/trendmicro/hippo/regexp/RECompiled;->source:[C

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 206
    :cond_0
    const-string v2, "(?:)"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 209
    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_1

    .line 210
    const/16 v1, 0x67

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_2

    .line 212
    const/16 v1, 0x69

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 213
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/regexp/NativeRegExp;->re:Lcom/trendmicro/hippo/regexp/RECompiled;

    iget v1, v1, Lcom/trendmicro/hippo/regexp/RECompiled;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_3

    .line 214
    const/16 v1, 0x6d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 215
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
