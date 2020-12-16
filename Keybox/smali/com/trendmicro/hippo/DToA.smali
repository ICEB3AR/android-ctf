.class Lcom/trendmicro/hippo/DToA;
.super Ljava/lang/Object;
.source "DToA.java"


# static fields
.field private static final Bias:I = 0x3ff

.field private static final Bletch:I = 0x10

.field private static final Bndry_mask:I = 0xfffff

.field static final DTOSTR_EXPONENTIAL:I = 0x3

.field static final DTOSTR_FIXED:I = 0x2

.field static final DTOSTR_PRECISION:I = 0x4

.field static final DTOSTR_STANDARD:I = 0x0

.field static final DTOSTR_STANDARD_EXPONENTIAL:I = 0x1

.field private static final Exp_11:I = 0x3ff00000

.field private static final Exp_mask:I = 0x7ff00000

.field private static final Exp_mask_shifted:I = 0x7ff

.field private static final Exp_msk1:I = 0x100000

.field private static final Exp_msk1L:J = 0x10000000000000L

.field private static final Exp_shift:I = 0x14

.field private static final Exp_shift1:I = 0x14

.field private static final Exp_shiftL:I = 0x34

.field private static final Frac_mask:I = 0xfffff

.field private static final Frac_mask1:I = 0xfffff

.field private static final Frac_maskL:J = 0xfffffffffffffL

.field private static final Int_max:I = 0xe

.field private static final Log2P:I = 0x1

.field private static final P:I = 0x35

.field private static final Quick_max:I = 0xe

.field private static final Sign_bit:I = -0x80000000

.field private static final Ten_pmax:I = 0x16

.field private static final bigtens:[D

.field private static final dtoaModes:[I

.field private static final n_bigtens:I = 0x5

.field private static final tens:[D


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 72
    const/16 v0, 0x17

    new-array v0, v0, [D

    fill-array-data v0, :array_0

    sput-object v0, Lcom/trendmicro/hippo/DToA;->tens:[D

    .line 78
    const/4 v0, 0x5

    new-array v1, v0, [D

    fill-array-data v1, :array_1

    sput-object v1, Lcom/trendmicro/hippo/DToA;->bigtens:[D

    .line 1122
    new-array v0, v0, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/trendmicro/hippo/DToA;->dtoaModes:[I

    return-void

    nop

    :array_0
    .array-data 8
        0x3ff0000000000000L    # 1.0
        0x4024000000000000L    # 10.0
        0x4059000000000000L    # 100.0
        0x408f400000000000L    # 1000.0
        0x40c3880000000000L    # 10000.0
        0x40f86a0000000000L    # 100000.0
        0x412e848000000000L    # 1000000.0
        0x416312d000000000L    # 1.0E7
        0x4197d78400000000L    # 1.0E8
        0x41cdcd6500000000L    # 1.0E9
        0x4202a05f20000000L    # 1.0E10
        0x42374876e8000000L    # 1.0E11
        0x426d1a94a2000000L    # 1.0E12
        0x42a2309ce5400000L    # 1.0E13
        0x42d6bcc41e900000L    # 1.0E14
        0x430c6bf526340000L    # 1.0E15
        0x4341c37937e08000L    # 1.0E16
        0x4376345785d8a000L    # 1.0E17
        0x43abc16d674ec800L    # 1.0E18
        0x43e158e460913d00L    # 1.0E19
        0x4415af1d78b58c40L    # 1.0E20
        0x444b1ae4d6e2ef50L    # 1.0E21
        0x4480f0cf064dd592L    # 1.0E22
    .end array-data

    :array_1
    .array-data 8
        0x4341c37937e08000L    # 1.0E16
        0x4693b8b5b5056e17L    # 1.0E32
        0x4d384f03e93ff9f5L    # 1.0E64
        0x5a827748f9301d32L    # 1.0E128
        0x75154fdd7f73bf3cL    # 1.0E256
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x3
        0x2
        0x2
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static BASEDIGIT(I)C
    .locals 1
    .param p0, "digit"    # I

    .line 34
    const/16 v0, 0xa

    if-lt p0, v0, :cond_0

    add-int/lit8 v0, p0, 0x57

    goto :goto_0

    :cond_0
    add-int/lit8 v0, p0, 0x30

    :goto_0
    int-to-char v0, v0

    return v0
.end method

.method static JS_dtoa(DIZI[ZLjava/lang/StringBuilder;)I
    .locals 59
    .param p0, "d"    # D
    .param p2, "mode"    # I
    .param p3, "biasUp"    # Z
    .param p4, "ndigits"    # I
    .param p5, "sign"    # [Z
    .param p6, "buf"    # Ljava/lang/StringBuilder;

    .line 485
    move/from16 v0, p2

    move-object/from16 v1, p6

    const/4 v2, 0x1

    new-array v3, v2, [I

    .line 486
    .local v3, "be":[I
    new-array v4, v2, [I

    .line 490
    .local v4, "bbits":[I
    invoke-static/range {p0 .. p1}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v5

    const/high16 v6, -0x80000000

    and-int/2addr v5, v6

    const/4 v6, 0x0

    if-eqz v5, :cond_0

    .line 492
    aput-boolean v2, p5, v6

    .line 494
    invoke-static/range {p0 .. p1}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v5

    const v7, 0x7fffffff

    and-int/2addr v5, v7

    move-wide/from16 v7, p0

    invoke-static {v7, v8, v5}, Lcom/trendmicro/hippo/DToA;->setWord0(DI)D

    move-result-wide v7

    .end local p0    # "d":D
    .local v7, "d":D
    goto :goto_0

    .line 497
    .end local v7    # "d":D
    .restart local p0    # "d":D
    :cond_0
    move-wide/from16 v7, p0

    aput-boolean v6, p5, v6

    .line 499
    .end local p0    # "d":D
    .restart local v7    # "d":D
    :goto_0
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v5

    const/high16 v9, 0x7ff00000

    and-int/2addr v5, v9

    const v10, 0xfffff

    if-ne v5, v9, :cond_2

    .line 501
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/DToA;->word1(D)I

    move-result v2

    if-nez v2, :cond_1

    invoke-static {v7, v8}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v2

    and-int/2addr v2, v10

    if-nez v2, :cond_1

    const-string v2, "Infinity"

    goto :goto_1

    :cond_1
    const-string v2, "NaN"

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    const/16 v2, 0x270f

    return v2

    .line 504
    :cond_2
    const-wide/16 v11, 0x0

    cmpl-double v5, v7, v11

    const/16 v9, 0x30

    if-nez v5, :cond_3

    .line 506
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 507
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 508
    return v2

    .line 511
    :cond_3
    invoke-static {v7, v8, v3, v4}, Lcom/trendmicro/hippo/DToA;->d2b(D[I[I)Ljava/math/BigInteger;

    move-result-object v5

    .line 512
    .local v5, "b":Ljava/math/BigInteger;
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v13

    ushr-int/lit8 v13, v13, 0x14

    and-int/lit16 v13, v13, 0x7ff

    move v14, v13

    .local v14, "i":I
    const/16 v15, 0x20

    if-eqz v13, :cond_4

    .line 513
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v13

    and-int/2addr v13, v10

    const/high16 v16, 0x3ff00000    # 1.875f

    or-int v13, v13, v16

    invoke-static {v7, v8, v13}, Lcom/trendmicro/hippo/DToA;->setWord0(DI)D

    move-result-wide v16

    .line 535
    .local v16, "d2":D
    add-int/lit16 v14, v14, -0x3ff

    .line 536
    const/4 v13, 0x0

    move-wide/from16 v18, v7

    move-wide/from16 v6, v16

    move-object/from16 v16, v3

    .local v13, "denorm":Z
    goto :goto_3

    .line 540
    .end local v13    # "denorm":Z
    .end local v16    # "d2":D
    :cond_4
    aget v13, v4, v6

    aget v16, v3, v6

    add-int v13, v13, v16

    add-int/lit16 v13, v13, 0x432

    .line 541
    .end local v14    # "i":I
    .local v13, "i":I
    if-le v13, v15, :cond_5

    .line 542
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v14

    int-to-long v9, v14

    rsub-int/lit8 v14, v13, 0x40

    shl-long/2addr v9, v14

    invoke-static {v7, v8}, Lcom/trendmicro/hippo/DToA;->word1(D)I

    move-result v14

    add-int/lit8 v16, v13, -0x20

    ushr-int v14, v14, v16

    move-object/from16 v16, v3

    .end local v3    # "be":[I
    .local v16, "be":[I
    int-to-long v2, v14

    or-long/2addr v2, v9

    goto :goto_2

    .line 543
    .end local v16    # "be":[I
    .restart local v3    # "be":[I
    :cond_5
    move-object/from16 v16, v3

    .end local v3    # "be":[I
    .restart local v16    # "be":[I
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/DToA;->word1(D)I

    move-result v2

    int-to-long v2, v2

    rsub-int/lit8 v9, v13, 0x20

    shl-long/2addr v2, v9

    :goto_2
    nop

    .line 546
    .local v2, "x":J
    long-to-double v9, v2

    move-wide/from16 v18, v7

    .end local v7    # "d":D
    .local v18, "d":D
    long-to-double v6, v2

    invoke-static {v6, v7}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v6

    const/high16 v7, 0x1f00000

    sub-int/2addr v6, v7

    invoke-static {v9, v10, v6}, Lcom/trendmicro/hippo/DToA;->setWord0(DI)D

    move-result-wide v6

    .line 547
    .local v6, "d2":D
    add-int/lit16 v14, v13, -0x433

    .line 548
    .end local v13    # "i":I
    .restart local v14    # "i":I
    const/4 v13, 0x1

    .line 551
    .end local v2    # "x":J
    .local v13, "denorm":Z
    :goto_3
    const-wide/high16 v2, 0x3ff8000000000000L    # 1.5

    sub-double v2, v6, v2

    const-wide v9, 0x3fd287a7636f4361L    # 0.289529654602168

    mul-double/2addr v2, v9

    const-wide v9, 0x3fc68a288b60c8b3L    # 0.1760912590558

    add-double/2addr v2, v9

    int-to-double v9, v14

    const-wide v20, 0x3fd34413509f79fbL    # 0.301029995663981

    mul-double v9, v9, v20

    add-double/2addr v2, v9

    .line 552
    .local v2, "ds":D
    double-to-int v9, v2

    .line 553
    .local v9, "k":I
    cmpg-double v10, v2, v11

    if-gez v10, :cond_6

    int-to-double v11, v9

    cmpl-double v10, v2, v11

    if-eqz v10, :cond_6

    .line 554
    add-int/lit8 v9, v9, -0x1

    .line 555
    :cond_6
    const/4 v10, 0x1

    .line 556
    .local v10, "k_check":Z
    if-ltz v9, :cond_8

    const/16 v11, 0x16

    if-gt v9, v11, :cond_8

    .line 557
    sget-object v11, Lcom/trendmicro/hippo/DToA;->tens:[D

    aget-wide v22, v11, v9

    cmpg-double v11, v18, v22

    if-gez v11, :cond_7

    .line 558
    add-int/lit8 v9, v9, -0x1

    .line 559
    :cond_7
    const/4 v10, 0x0

    .line 563
    :cond_8
    const/4 v8, 0x0

    aget v11, v4, v8

    sub-int/2addr v11, v14

    const/4 v12, 0x1

    sub-int/2addr v11, v12

    .line 565
    .local v11, "j":I
    if-ltz v11, :cond_9

    .line 566
    const/4 v12, 0x0

    .line 567
    .local v12, "b2":I
    move/from16 v22, v11

    .local v22, "s2":I
    goto :goto_4

    .line 570
    .end local v12    # "b2":I
    .end local v22    # "s2":I
    :cond_9
    neg-int v12, v11

    .line 571
    .restart local v12    # "b2":I
    const/16 v22, 0x0

    .line 573
    .restart local v22    # "s2":I
    :goto_4
    if-ltz v9, :cond_a

    .line 574
    const/16 v23, 0x0

    .line 575
    .local v23, "b5":I
    move/from16 v24, v9

    .line 576
    .local v24, "s5":I
    add-int v22, v22, v9

    move/from16 v25, v24

    move/from16 v24, v23

    goto :goto_5

    .line 579
    .end local v23    # "b5":I
    .end local v24    # "s5":I
    :cond_a
    sub-int/2addr v12, v9

    .line 580
    neg-int v8, v9

    .line 581
    .local v8, "b5":I
    const/16 v24, 0x0

    move/from16 v25, v24

    move/from16 v24, v8

    .line 585
    .end local v8    # "b5":I
    .local v24, "b5":I
    .local v25, "s5":I
    :goto_5
    if-ltz v0, :cond_b

    const/16 v8, 0x9

    if-le v0, v8, :cond_c

    .line 586
    :cond_b
    const/4 v0, 0x0

    .line 587
    .end local p2    # "mode":I
    .local v0, "mode":I
    :cond_c
    const/4 v8, 0x1

    .line 588
    .local v8, "try_quick":Z
    const/4 v15, 0x5

    if-le v0, v15, :cond_d

    .line 589
    add-int/lit8 v0, v0, -0x4

    .line 590
    const/4 v8, 0x0

    move/from16 v27, v8

    goto :goto_6

    .line 588
    :cond_d
    move/from16 v27, v8

    .line 592
    .end local v8    # "try_quick":Z
    .local v27, "try_quick":Z
    :goto_6
    const/16 v28, 0x1

    .line 593
    .local v28, "leftright":Z
    const/4 v8, 0x0

    move/from16 v23, v8

    .local v23, "ilim1":I
    move/from16 v29, v8

    .line 594
    .local v29, "ilim":I
    const/4 v8, 0x2

    if-eqz v0, :cond_14

    const/4 v15, 0x1

    if-eq v0, v15, :cond_14

    if-eq v0, v8, :cond_11

    const/4 v15, 0x3

    if-eq v0, v15, :cond_e

    const/4 v15, 0x4

    if-eq v0, v15, :cond_12

    const/4 v15, 0x5

    if-eq v0, v15, :cond_f

    move/from16 v15, p4

    move/from16 v8, v29

    goto :goto_8

    .line 610
    :cond_e
    const/16 v28, 0x0

    .line 613
    :cond_f
    add-int v15, p4, v9

    const/16 v17, 0x1

    add-int/lit8 v14, v15, 0x1

    .line 614
    move/from16 v29, v14

    .line 615
    add-int/lit8 v23, v14, -0x1

    .line 616
    if-gtz v14, :cond_10

    .line 617
    const/4 v14, 0x1

    move/from16 v15, p4

    move/from16 v8, v29

    goto :goto_8

    .line 616
    :cond_10
    move/from16 v15, p4

    move/from16 v8, v29

    goto :goto_8

    .line 602
    :cond_11
    const/16 v28, 0x0

    .line 605
    :cond_12
    if-gtz p4, :cond_13

    .line 606
    const/4 v15, 0x1

    .end local p4    # "ndigits":I
    .local v15, "ndigits":I
    goto :goto_7

    .line 605
    .end local v15    # "ndigits":I
    .restart local p4    # "ndigits":I
    :cond_13
    move/from16 v15, p4

    .line 607
    .end local p4    # "ndigits":I
    .restart local v15    # "ndigits":I
    :goto_7
    move v14, v15

    move/from16 v23, v15

    move/from16 v29, v15

    .line 608
    move/from16 v8, v29

    goto :goto_8

    .line 597
    .end local v15    # "ndigits":I
    .restart local p4    # "ndigits":I
    :cond_14
    const/4 v15, -0x1

    move/from16 v23, v15

    move/from16 v29, v15

    .line 598
    const/16 v14, 0x12

    .line 599
    const/4 v15, 0x0

    .line 600
    .end local p4    # "ndigits":I
    .restart local v15    # "ndigits":I
    move/from16 v8, v29

    .line 623
    .end local v29    # "ilim":I
    .local v8, "ilim":I
    :goto_8
    const/16 v30, 0x0

    .line 624
    .local v30, "fast_failed":Z
    const-wide/high16 v32, 0x4014000000000000L    # 5.0

    const-wide/16 v34, 0x30

    const/16 v36, 0x0

    const-wide/high16 v37, 0x4024000000000000L    # 10.0

    move-wide/from16 v39, v2

    .end local v2    # "ds":D
    .local v39, "ds":D
    if-ltz v8, :cond_2e

    const/16 v3, 0xe

    if-gt v8, v3, :cond_2e

    if-eqz v27, :cond_2e

    .line 628
    const/4 v3, 0x0

    .line 629
    .end local v14    # "i":I
    .local v3, "i":I
    move-wide/from16 v6, v18

    .line 630
    move v14, v9

    .line 631
    .local v14, "k0":I
    move/from16 v41, v8

    .line 632
    .local v41, "ilim0":I
    const/16 v42, 0x2

    .line 634
    .local v42, "ieps":I
    if-lez v9, :cond_18

    .line 635
    sget-object v43, Lcom/trendmicro/hippo/DToA;->tens:[D

    and-int/lit8 v44, v9, 0xf

    aget-wide v39, v43, v44

    .line 636
    shr-int/lit8 v11, v9, 0x4

    .line 637
    and-int/lit8 v43, v11, 0x10

    if-eqz v43, :cond_15

    .line 639
    and-int/lit8 v11, v11, 0xf

    .line 640
    sget-object v43, Lcom/trendmicro/hippo/DToA;->bigtens:[D

    const/16 v31, 0x4

    aget-wide v44, v43, v31

    div-double v18, v18, v44

    .line 641
    add-int/lit8 v42, v42, 0x1

    .line 643
    :cond_15
    :goto_9
    if-eqz v11, :cond_17

    .line 644
    and-int/lit8 v43, v11, 0x1

    if-eqz v43, :cond_16

    .line 645
    add-int/lit8 v42, v42, 0x1

    .line 646
    sget-object v43, Lcom/trendmicro/hippo/DToA;->bigtens:[D

    aget-wide v44, v43, v3

    mul-double v39, v39, v44

    .line 643
    :cond_16
    shr-int/lit8 v11, v11, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 648
    :cond_17
    div-double v18, v18, v39

    move/from16 v57, v11

    move v11, v3

    move-wide/from16 v2, v39

    move/from16 v39, v57

    goto :goto_b

    .line 650
    :cond_18
    neg-int v2, v9

    move/from16 v44, v2

    .local v44, "j1":I
    if-eqz v2, :cond_1b

    .line 651
    sget-object v2, Lcom/trendmicro/hippo/DToA;->tens:[D

    and-int/lit8 v45, v44, 0xf

    aget-wide v45, v2, v45

    mul-double v18, v18, v45

    .line 652
    shr-int/lit8 v2, v44, 0x4

    .end local v11    # "j":I
    .local v2, "j":I
    :goto_a
    if-eqz v2, :cond_1a

    .line 653
    and-int/lit8 v11, v2, 0x1

    if-eqz v11, :cond_19

    .line 654
    add-int/lit8 v42, v42, 0x1

    .line 655
    sget-object v11, Lcom/trendmicro/hippo/DToA;->bigtens:[D

    aget-wide v45, v11, v3

    mul-double v18, v18, v45

    .line 652
    :cond_19
    shr-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_1a
    move v11, v3

    move-wide/from16 v57, v39

    move/from16 v39, v2

    move-wide/from16 v2, v57

    goto :goto_b

    .line 650
    .end local v2    # "j":I
    .restart local v11    # "j":I
    :cond_1b
    move/from16 v57, v11

    move v11, v3

    move-wide/from16 v2, v39

    move/from16 v39, v57

    .line 659
    .end local v3    # "i":I
    .end local v44    # "j1":I
    .local v2, "ds":D
    .local v11, "i":I
    .local v39, "j":I
    :goto_b
    if-eqz v10, :cond_1d

    const-wide/high16 v44, 0x3ff0000000000000L    # 1.0

    cmpg-double v40, v18, v44

    if-gez v40, :cond_1d

    if-lez v8, :cond_1d

    .line 660
    if-gtz v23, :cond_1c

    .line 661
    const/16 v30, 0x1

    move-wide/from16 v44, v2

    move/from16 v2, v42

    goto :goto_c

    .line 663
    :cond_1c
    move/from16 v8, v23

    .line 664
    add-int/lit8 v9, v9, -0x1

    .line 665
    mul-double v18, v18, v37

    .line 666
    add-int/lit8 v42, v42, 0x1

    move-wide/from16 v44, v2

    move/from16 v2, v42

    goto :goto_c

    .line 672
    :cond_1d
    move-wide/from16 v44, v2

    move/from16 v2, v42

    .end local v42    # "ieps":I
    .local v2, "ieps":I
    .local v44, "ds":D
    :goto_c
    move v3, v10

    move/from16 v40, v11

    .end local v10    # "k_check":Z
    .end local v11    # "i":I
    .local v3, "k_check":Z
    .local v40, "i":I
    int-to-double v10, v2

    mul-double v10, v10, v18

    const-wide/high16 v46, 0x401c000000000000L    # 7.0

    add-double v10, v10, v46

    .line 673
    .local v10, "eps":D
    invoke-static {v10, v11}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v42

    const/high16 v46, 0x3400000

    move/from16 v47, v2

    .end local v2    # "ieps":I
    .local v47, "ieps":I
    sub-int v2, v42, v46

    invoke-static {v10, v11, v2}, Lcom/trendmicro/hippo/DToA;->setWord0(DI)D

    move-result-wide v10

    .line 674
    if-nez v8, :cond_20

    .line 675
    move-object/from16 v2, v36

    .local v2, "mhi":Ljava/math/BigInteger;
    move-object/from16 v42, v36

    .line 676
    .local v42, "S":Ljava/math/BigInteger;
    sub-double v18, v18, v32

    .line 677
    cmpl-double v46, v18, v10

    if-lez v46, :cond_1e

    .line 678
    move-object/from16 v46, v2

    const/16 v2, 0x31

    .end local v2    # "mhi":Ljava/math/BigInteger;
    .local v46, "mhi":Ljava/math/BigInteger;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 679
    const/4 v2, 0x1

    add-int/2addr v9, v2

    .line 680
    add-int/lit8 v2, v9, 0x1

    return v2

    .line 682
    .end local v46    # "mhi":Ljava/math/BigInteger;
    .restart local v2    # "mhi":Ljava/math/BigInteger;
    :cond_1e
    move-object/from16 v46, v2

    .end local v2    # "mhi":Ljava/math/BigInteger;
    .restart local v46    # "mhi":Ljava/math/BigInteger;
    move/from16 v48, v3

    .end local v3    # "k_check":Z
    .local v48, "k_check":Z
    neg-double v2, v10

    cmpg-double v2, v18, v2

    if-gez v2, :cond_1f

    .line 683
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 684
    const/16 v2, 0x30

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 685
    const/4 v2, 0x1

    return v2

    .line 687
    :cond_1f
    const/16 v30, 0x1

    goto :goto_d

    .line 674
    .end local v42    # "S":Ljava/math/BigInteger;
    .end local v46    # "mhi":Ljava/math/BigInteger;
    .end local v48    # "k_check":Z
    .restart local v3    # "k_check":Z
    :cond_20
    move/from16 v48, v3

    .line 689
    .end local v3    # "k_check":Z
    .restart local v48    # "k_check":Z
    :goto_d
    if-nez v30, :cond_2c

    .line 690
    const/4 v3, 0x1

    .line 691
    .end local v30    # "fast_failed":Z
    .local v3, "fast_failed":Z
    const-wide/high16 v49, 0x3fe0000000000000L    # 0.5

    if-eqz v28, :cond_26

    .line 695
    sget-object v30, Lcom/trendmicro/hippo/DToA;->tens:[D

    add-int/lit8 v42, v8, -0x1

    aget-wide v51, v30, v42

    div-double v49, v49, v51

    sub-double v49, v49, v10

    .line 696
    .end local v10    # "eps":D
    .local v49, "eps":D
    const/4 v10, 0x0

    move/from16 v42, v3

    move-wide/from16 v2, v18

    move/from16 v18, v10

    move-wide/from16 v10, v49

    .line 697
    .end local v3    # "fast_failed":Z
    .end local v40    # "i":I
    .end local v49    # "eps":D
    .local v2, "d":D
    .restart local v10    # "eps":D
    .local v18, "i":I
    .local v42, "fast_failed":Z
    :goto_e
    move-object/from16 v46, v4

    move-object/from16 v51, v5

    .end local v4    # "bbits":[I
    .end local v5    # "b":Ljava/math/BigInteger;
    .local v46, "bbits":[I
    .local v51, "b":Ljava/math/BigInteger;
    double-to-long v4, v2

    .line 698
    .local v4, "L":J
    move/from16 v53, v12

    move/from16 v52, v13

    .end local v12    # "b2":I
    .end local v13    # "denorm":Z
    .local v52, "denorm":Z
    .local v53, "b2":I
    long-to-double v12, v4

    sub-double/2addr v2, v12

    .line 699
    add-long v12, v4, v34

    long-to-int v12, v12

    int-to-char v12, v12

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 700
    cmpg-double v12, v2, v10

    if-gez v12, :cond_21

    .line 701
    add-int/lit8 v12, v9, 0x1

    return v12

    .line 703
    :cond_21
    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v12, v2

    cmpg-double v12, v12, v10

    if-gez v12, :cond_24

    .line 707
    :goto_f
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v12

    const/4 v13, 0x1

    sub-int/2addr v12, v13

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v12

    .line 708
    .local v12, "lastCh":C
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v17

    move-wide/from16 v49, v4

    .end local v4    # "L":J
    .local v49, "L":J
    add-int/lit8 v4, v17, -0x1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 709
    const/16 v4, 0x39

    if-eq v12, v4, :cond_22

    goto :goto_10

    .line 710
    :cond_22
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-nez v4, :cond_23

    .line 711
    add-int/lit8 v9, v9, 0x1

    .line 712
    const/16 v12, 0x30

    .line 713
    nop

    .line 716
    :goto_10
    add-int/lit8 v4, v12, 0x1

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 717
    add-int/lit8 v4, v9, 0x1

    return v4

    .line 710
    :cond_23
    move-wide/from16 v4, v49

    goto :goto_f

    .line 719
    .end local v12    # "lastCh":C
    .end local v49    # "L":J
    .restart local v4    # "L":J
    :cond_24
    move-wide/from16 v49, v4

    .end local v4    # "L":J
    .restart local v49    # "L":J
    add-int/lit8 v4, v18, 0x1

    .end local v18    # "i":I
    .local v4, "i":I
    if-lt v4, v8, :cond_25

    .line 720
    move/from16 v55, v8

    move/from16 v54, v14

    move v5, v15

    move/from16 v30, v42

    move v14, v4

    move-wide/from16 v57, v2

    move-wide v3, v10

    move-wide/from16 v10, v57

    goto/16 :goto_14

    .line 721
    :cond_25
    mul-double v10, v10, v37

    .line 722
    mul-double v2, v2, v37

    move/from16 v18, v4

    move-object/from16 v4, v46

    move-object/from16 v5, v51

    move/from16 v13, v52

    move/from16 v12, v53

    goto :goto_e

    .line 727
    .end local v2    # "d":D
    .end local v42    # "fast_failed":Z
    .end local v46    # "bbits":[I
    .end local v49    # "L":J
    .end local v51    # "b":Ljava/math/BigInteger;
    .end local v52    # "denorm":Z
    .end local v53    # "b2":I
    .restart local v3    # "fast_failed":Z
    .local v4, "bbits":[I
    .restart local v5    # "b":Ljava/math/BigInteger;
    .local v12, "b2":I
    .restart local v13    # "denorm":Z
    .local v18, "d":D
    .restart local v40    # "i":I
    :cond_26
    move/from16 v42, v3

    move-object/from16 v46, v4

    move-object/from16 v51, v5

    move/from16 v53, v12

    move/from16 v52, v13

    .end local v3    # "fast_failed":Z
    .end local v4    # "bbits":[I
    .end local v5    # "b":Ljava/math/BigInteger;
    .end local v12    # "b2":I
    .end local v13    # "denorm":Z
    .restart local v42    # "fast_failed":Z
    .restart local v46    # "bbits":[I
    .restart local v51    # "b":Ljava/math/BigInteger;
    .restart local v52    # "denorm":Z
    .restart local v53    # "b2":I
    sget-object v2, Lcom/trendmicro/hippo/DToA;->tens:[D

    add-int/lit8 v3, v8, -0x1

    aget-wide v3, v2, v3

    mul-double/2addr v3, v10

    .line 728
    .end local v10    # "eps":D
    .local v3, "eps":D
    const/4 v2, 0x1

    move-wide/from16 v10, v18

    .line 729
    .end local v18    # "d":D
    .end local v40    # "i":I
    .local v2, "i":I
    .local v10, "d":D
    :goto_11
    double-to-long v12, v10

    .line 730
    .local v12, "L":J
    move/from16 v54, v14

    move v5, v15

    .end local v14    # "k0":I
    .end local v15    # "ndigits":I
    .local v5, "ndigits":I
    .local v54, "k0":I
    long-to-double v14, v12

    sub-double/2addr v10, v14

    .line 731
    add-long v14, v12, v34

    long-to-int v14, v14

    int-to-char v14, v14

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 732
    if-ne v2, v8, :cond_2b

    .line 733
    add-double v14, v3, v49

    cmpl-double v14, v10, v14

    if-lez v14, :cond_29

    .line 737
    :goto_12
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v14

    const/4 v15, 0x1

    sub-int/2addr v14, v15

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v14

    .line 738
    .local v14, "lastCh":C
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v17

    move/from16 v55, v8

    .end local v8    # "ilim":I
    .local v55, "ilim":I
    add-int/lit8 v8, v17, -0x1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 739
    const/16 v8, 0x39

    if-eq v14, v8, :cond_27

    goto :goto_13

    .line 740
    :cond_27
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    if-nez v8, :cond_28

    .line 741
    add-int/lit8 v9, v9, 0x1

    .line 742
    const/16 v14, 0x30

    .line 743
    nop

    .line 746
    :goto_13
    add-int/lit8 v8, v14, 0x1

    int-to-char v8, v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 747
    add-int/lit8 v8, v9, 0x1

    return v8

    .line 740
    :cond_28
    move/from16 v8, v55

    goto :goto_12

    .line 750
    .end local v14    # "lastCh":C
    .end local v55    # "ilim":I
    .restart local v8    # "ilim":I
    :cond_29
    move/from16 v55, v8

    .end local v8    # "ilim":I
    .restart local v55    # "ilim":I
    sub-double v49, v49, v3

    cmpg-double v8, v10, v49

    if-gez v8, :cond_2a

    .line 751
    invoke-static/range {p6 .. p6}, Lcom/trendmicro/hippo/DToA;->stripTrailingZeroes(Ljava/lang/StringBuilder;)V

    .line 754
    add-int/lit8 v8, v9, 0x1

    return v8

    .line 750
    :cond_2a
    move v14, v2

    move/from16 v30, v42

    goto :goto_14

    .line 728
    .end local v55    # "ilim":I
    .restart local v8    # "ilim":I
    :cond_2b
    move/from16 v55, v8

    .end local v8    # "ilim":I
    .restart local v55    # "ilim":I
    add-int/lit8 v2, v2, 0x1

    mul-double v10, v10, v37

    move v15, v5

    move/from16 v14, v54

    goto :goto_11

    .line 689
    .end local v2    # "i":I
    .end local v3    # "eps":D
    .end local v42    # "fast_failed":Z
    .end local v46    # "bbits":[I
    .end local v51    # "b":Ljava/math/BigInteger;
    .end local v52    # "denorm":Z
    .end local v53    # "b2":I
    .end local v54    # "k0":I
    .end local v55    # "ilim":I
    .restart local v4    # "bbits":[I
    .local v5, "b":Ljava/math/BigInteger;
    .restart local v8    # "ilim":I
    .local v10, "eps":D
    .local v12, "b2":I
    .restart local v13    # "denorm":Z
    .local v14, "k0":I
    .restart local v15    # "ndigits":I
    .restart local v18    # "d":D
    .restart local v30    # "fast_failed":Z
    .restart local v40    # "i":I
    :cond_2c
    move-object/from16 v46, v4

    move-object/from16 v51, v5

    move/from16 v55, v8

    move/from16 v53, v12

    move/from16 v52, v13

    move/from16 v54, v14

    move v5, v15

    .end local v4    # "bbits":[I
    .end local v8    # "ilim":I
    .end local v12    # "b2":I
    .end local v13    # "denorm":Z
    .end local v14    # "k0":I
    .end local v15    # "ndigits":I
    .local v5, "ndigits":I
    .restart local v46    # "bbits":[I
    .restart local v51    # "b":Ljava/math/BigInteger;
    .restart local v52    # "denorm":Z
    .restart local v53    # "b2":I
    .restart local v54    # "k0":I
    .restart local v55    # "ilim":I
    move-wide v3, v10

    move-wide/from16 v10, v18

    move/from16 v14, v40

    .line 761
    .end local v18    # "d":D
    .end local v40    # "i":I
    .restart local v3    # "eps":D
    .local v10, "d":D
    .local v14, "i":I
    :goto_14
    if-eqz v30, :cond_2d

    .line 762
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 763
    move-wide v10, v6

    .line 764
    move/from16 v9, v54

    .line 765
    move/from16 v8, v41

    .end local v55    # "ilim":I
    .restart local v8    # "ilim":I
    goto :goto_15

    .line 761
    .end local v8    # "ilim":I
    .restart local v55    # "ilim":I
    :cond_2d
    move/from16 v8, v55

    goto :goto_15

    .line 624
    .end local v3    # "eps":D
    .end local v41    # "ilim0":I
    .end local v44    # "ds":D
    .end local v46    # "bbits":[I
    .end local v47    # "ieps":I
    .end local v48    # "k_check":Z
    .end local v51    # "b":Ljava/math/BigInteger;
    .end local v52    # "denorm":Z
    .end local v53    # "b2":I
    .end local v54    # "k0":I
    .end local v55    # "ilim":I
    .restart local v4    # "bbits":[I
    .local v5, "b":Ljava/math/BigInteger;
    .restart local v8    # "ilim":I
    .local v10, "k_check":Z
    .local v11, "j":I
    .restart local v12    # "b2":I
    .restart local v13    # "denorm":Z
    .restart local v15    # "ndigits":I
    .restart local v18    # "d":D
    .local v39, "ds":D
    :cond_2e
    move-object/from16 v46, v4

    move-object/from16 v51, v5

    move/from16 v48, v10

    move/from16 v53, v12

    move/from16 v52, v13

    move v5, v15

    .line 771
    .end local v4    # "bbits":[I
    .end local v10    # "k_check":Z
    .end local v12    # "b2":I
    .end local v13    # "denorm":Z
    .end local v15    # "ndigits":I
    .local v5, "ndigits":I
    .restart local v46    # "bbits":[I
    .restart local v48    # "k_check":Z
    .restart local v51    # "b":Ljava/math/BigInteger;
    .restart local v52    # "denorm":Z
    .restart local v53    # "b2":I
    move-wide/from16 v44, v39

    move/from16 v39, v11

    move-wide/from16 v10, v18

    .end local v11    # "j":I
    .end local v18    # "d":D
    .local v10, "d":D
    .local v39, "j":I
    .restart local v44    # "ds":D
    :goto_15
    const/4 v2, 0x0

    aget v3, v16, v2

    const-wide/16 v12, 0x1

    if-ltz v3, :cond_37

    const/16 v3, 0xe

    if-gt v9, v3, :cond_37

    .line 773
    sget-object v3, Lcom/trendmicro/hippo/DToA;->tens:[D

    aget-wide v18, v3, v9

    .line 774
    .end local v44    # "ds":D
    .local v18, "ds":D
    if-gez v5, :cond_31

    if-gtz v8, :cond_31

    .line 775
    move-object/from16 v3, v36

    .local v3, "mhi":Ljava/math/BigInteger;
    move-object/from16 v4, v36

    .line 776
    .local v4, "S":Ljava/math/BigInteger;
    if-ltz v8, :cond_30

    mul-double v12, v18, v32

    cmpg-double v12, v10, v12

    if-ltz v12, :cond_30

    if-nez p3, :cond_2f

    mul-double v32, v32, v18

    cmpl-double v12, v10, v32

    if-nez v12, :cond_2f

    goto :goto_16

    .line 781
    :cond_2f
    const/16 v2, 0x31

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 782
    const/4 v2, 0x1

    add-int/2addr v9, v2

    .line 783
    add-int/lit8 v2, v9, 0x1

    return v2

    .line 777
    :cond_30
    :goto_16
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 778
    const/16 v2, 0x30

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 779
    const/4 v2, 0x1

    return v2

    .line 785
    .end local v3    # "mhi":Ljava/math/BigInteger;
    .end local v4    # "S":Ljava/math/BigInteger;
    :cond_31
    const/4 v2, 0x1

    .line 786
    .end local v14    # "i":I
    .restart local v2    # "i":I
    :goto_17
    div-double v3, v10, v18

    double-to-long v3, v3

    .line 787
    .local v3, "L":J
    long-to-double v14, v3

    mul-double v14, v14, v18

    sub-double/2addr v10, v14

    .line 788
    add-long v14, v3, v34

    long-to-int v14, v14

    int-to-char v14, v14

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 789
    if-ne v2, v8, :cond_34

    .line 790
    add-double v14, v10, v10

    .line 791
    .end local v10    # "d":D
    .local v14, "d":D
    cmpl-double v10, v14, v18

    if-gtz v10, :cond_32

    cmpl-double v10, v14, v18

    if-nez v10, :cond_35

    and-long v10, v3, v12

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-nez v10, :cond_32

    if-eqz p3, :cond_35

    .line 802
    :cond_32
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    const/4 v11, 0x1

    sub-int/2addr v10, v11

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v10

    .line 803
    .local v10, "lastCh":C
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v12

    sub-int/2addr v12, v11

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 804
    const/16 v11, 0x39

    if-eq v10, v11, :cond_33

    goto :goto_18

    .line 805
    :cond_33
    invoke-virtual/range {p6 .. p6}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    if-nez v11, :cond_32

    .line 806
    add-int/lit8 v9, v9, 0x1

    .line 807
    const/16 v10, 0x30

    .line 808
    nop

    .line 811
    :goto_18
    add-int/lit8 v11, v10, 0x1

    int-to-char v11, v11

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 812
    .end local v10    # "lastCh":C
    goto :goto_19

    .line 815
    .end local v14    # "d":D
    .local v10, "d":D
    :cond_34
    mul-double v10, v10, v37

    .line 816
    const-wide/16 v20, 0x0

    cmpl-double v14, v10, v20

    if-nez v14, :cond_36

    .line 817
    move-wide v14, v10

    .line 819
    .end local v10    # "d":D
    .restart local v14    # "d":D
    :cond_35
    :goto_19
    add-int/lit8 v10, v9, 0x1

    return v10

    .line 785
    .end local v14    # "d":D
    .restart local v10    # "d":D
    :cond_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 822
    .end local v2    # "i":I
    .end local v3    # "L":J
    .end local v18    # "ds":D
    .local v14, "i":I
    .restart local v44    # "ds":D
    :cond_37
    move/from16 v3, v53

    .line 823
    .local v3, "m2":I
    move/from16 v4, v24

    .line 824
    .local v4, "m5":I
    move-object/from16 v15, v36

    .local v15, "mlo":Ljava/math/BigInteger;
    move-object/from16 v18, v36

    .line 825
    .local v18, "mhi":Ljava/math/BigInteger;
    if-eqz v28, :cond_3c

    .line 826
    const/4 v2, 0x2

    if-ge v0, v2, :cond_39

    .line 827
    if-eqz v52, :cond_38

    const/4 v2, 0x0

    aget v12, v16, v2

    add-int/lit16 v12, v12, 0x433

    goto :goto_1a

    :cond_38
    const/4 v2, 0x0

    aget v12, v46, v2

    rsub-int/lit8 v12, v12, 0x36

    :goto_1a
    move v14, v12

    .end local v14    # "i":I
    .local v12, "i":I
    goto :goto_1c

    .line 832
    .end local v12    # "i":I
    .restart local v14    # "i":I
    :cond_39
    add-int/lit8 v12, v8, -0x1

    .line 833
    .end local v39    # "j":I
    .local v12, "j":I
    if-lt v4, v12, :cond_3a

    .line 834
    sub-int/2addr v4, v12

    goto :goto_1b

    .line 836
    :cond_3a
    sub-int v13, v12, v4

    move v12, v13

    add-int v25, v25, v13

    .line 837
    add-int v24, v24, v12

    .line 838
    const/4 v4, 0x0

    .line 840
    :goto_1b
    move v13, v8

    .end local v14    # "i":I
    .local v13, "i":I
    if-gez v8, :cond_3b

    .line 841
    sub-int/2addr v3, v13

    .line 842
    const/4 v13, 0x0

    move/from16 v39, v12

    move v14, v13

    goto :goto_1c

    .line 840
    :cond_3b
    move/from16 v39, v12

    move v14, v13

    .line 846
    .end local v12    # "j":I
    .end local v13    # "i":I
    .restart local v14    # "i":I
    .restart local v39    # "j":I
    :goto_1c
    add-int v12, v53, v14

    .line 847
    .end local v53    # "b2":I
    .local v12, "b2":I
    add-int v22, v22, v14

    .line 848
    const-wide/16 v19, 0x1

    invoke-static/range {v19 .. v20}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v18

    move-object/from16 v13, v18

    move/from16 v2, v22

    move/from16 v18, v5

    move-wide/from16 v21, v6

    move/from16 v5, v24

    move/from16 v6, v25

    goto :goto_1d

    .line 825
    .end local v12    # "b2":I
    .restart local v53    # "b2":I
    :cond_3c
    move-object/from16 v13, v18

    move/from16 v2, v22

    move/from16 v12, v53

    move/from16 v18, v5

    move-wide/from16 v21, v6

    move/from16 v5, v24

    move/from16 v6, v25

    .line 854
    .end local v22    # "s2":I
    .end local v24    # "b5":I
    .end local v25    # "s5":I
    .end local v53    # "b2":I
    .local v2, "s2":I
    .local v5, "b5":I
    .local v6, "s5":I
    .restart local v12    # "b2":I
    .local v13, "mhi":Ljava/math/BigInteger;
    .local v18, "ndigits":I
    .local v21, "d2":D
    :goto_1d
    if-lez v3, :cond_3e

    if-lez v2, :cond_3e

    .line 855
    if-ge v3, v2, :cond_3d

    move v7, v3

    goto :goto_1e

    :cond_3d
    move v7, v2

    :goto_1e
    move v14, v7

    .line 856
    sub-int/2addr v12, v14

    .line 857
    sub-int/2addr v3, v14

    .line 858
    sub-int/2addr v2, v14

    .line 862
    :cond_3e
    if-lez v5, :cond_42

    .line 863
    if-eqz v28, :cond_41

    .line 864
    if-lez v4, :cond_3f

    .line 865
    invoke-static {v13, v4}, Lcom/trendmicro/hippo/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v13

    .line 866
    move-object/from16 v7, v51

    .end local v51    # "b":Ljava/math/BigInteger;
    .local v7, "b":Ljava/math/BigInteger;
    invoke-virtual {v13, v7}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v24

    .line 867
    .local v24, "b1":Ljava/math/BigInteger;
    move-object/from16 v7, v24

    goto :goto_1f

    .line 864
    .end local v7    # "b":Ljava/math/BigInteger;
    .end local v24    # "b1":Ljava/math/BigInteger;
    .restart local v51    # "b":Ljava/math/BigInteger;
    :cond_3f
    move-object/from16 v7, v51

    .line 869
    .end local v51    # "b":Ljava/math/BigInteger;
    .restart local v7    # "b":Ljava/math/BigInteger;
    :goto_1f
    sub-int v24, v5, v4

    move/from16 v25, v24

    .end local v39    # "j":I
    .local v25, "j":I
    if-eqz v24, :cond_40

    .line 870
    move/from16 v24, v4

    move/from16 v4, v25

    .end local v25    # "j":I
    .local v4, "j":I
    .local v24, "m5":I
    invoke-static {v7, v4}, Lcom/trendmicro/hippo/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v7

    move/from16 v39, v4

    goto :goto_20

    .line 869
    .end local v24    # "m5":I
    .local v4, "m5":I
    .restart local v25    # "j":I
    :cond_40
    move/from16 v24, v4

    move/from16 v4, v25

    .end local v25    # "j":I
    .local v4, "j":I
    .restart local v24    # "m5":I
    move/from16 v39, v4

    goto :goto_20

    .line 873
    .end local v7    # "b":Ljava/math/BigInteger;
    .end local v24    # "m5":I
    .local v4, "m5":I
    .restart local v39    # "j":I
    .restart local v51    # "b":Ljava/math/BigInteger;
    :cond_41
    move/from16 v24, v4

    move-object/from16 v7, v51

    .end local v4    # "m5":I
    .end local v51    # "b":Ljava/math/BigInteger;
    .restart local v7    # "b":Ljava/math/BigInteger;
    .restart local v24    # "m5":I
    invoke-static {v7, v5}, Lcom/trendmicro/hippo/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v4

    move-object v7, v4

    .end local v7    # "b":Ljava/math/BigInteger;
    .local v4, "b":Ljava/math/BigInteger;
    goto :goto_20

    .line 862
    .end local v24    # "m5":I
    .local v4, "m5":I
    .restart local v51    # "b":Ljava/math/BigInteger;
    :cond_42
    move/from16 v24, v4

    move-object/from16 v7, v51

    .line 878
    .end local v4    # "m5":I
    .end local v51    # "b":Ljava/math/BigInteger;
    .restart local v7    # "b":Ljava/math/BigInteger;
    .restart local v24    # "m5":I
    :goto_20
    const-wide/16 v19, 0x1

    invoke-static/range {v19 .. v20}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    .line 879
    .local v4, "S":Ljava/math/BigInteger;
    if-lez v6, :cond_43

    .line 880
    invoke-static {v4, v6}, Lcom/trendmicro/hippo/DToA;->pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;

    move-result-object v4

    .line 885
    :cond_43
    const/16 v19, 0x0

    .line 886
    .local v19, "spec_case":Z
    move/from16 v20, v5

    const/4 v5, 0x2

    .end local v5    # "b5":I
    .local v20, "b5":I
    if-ge v0, v5, :cond_44

    .line 887
    invoke-static {v10, v11}, Lcom/trendmicro/hippo/DToA;->word1(D)I

    move-result v5

    if-nez v5, :cond_44

    invoke-static {v10, v11}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v5

    const v25, 0xfffff

    and-int v5, v5, v25

    if-nez v5, :cond_44

    .line 888
    invoke-static {v10, v11}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v5

    const/high16 v25, 0x7fe00000

    and-int v5, v5, v25

    if-eqz v5, :cond_44

    .line 892
    add-int/lit8 v12, v12, 0x1

    .line 893
    add-int/lit8 v2, v2, 0x1

    .line 894
    const/16 v19, 0x1

    .line 905
    :cond_44
    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v5

    .line 906
    .local v5, "S_bytes":[B
    const/16 v25, 0x0

    .line 907
    .local v25, "S_hiWord":I
    const/16 v32, 0x0

    move/from16 p0, v8

    move/from16 v8, v32

    .local v8, "idx":I
    .local p0, "ilim":I
    :goto_21
    move/from16 v32, v14

    const/4 v14, 0x4

    .end local v14    # "i":I
    .local v32, "i":I
    if-ge v8, v14, :cond_46

    .line 908
    shl-int/lit8 v14, v25, 0x8

    .line 909
    .end local v25    # "S_hiWord":I
    .local v14, "S_hiWord":I
    move-object/from16 v33, v15

    .end local v15    # "mlo":Ljava/math/BigInteger;
    .local v33, "mlo":Ljava/math/BigInteger;
    array-length v15, v5

    if-ge v8, v15, :cond_45

    .line 910
    aget-byte v15, v5, v8

    and-int/lit16 v15, v15, 0xff

    or-int/2addr v14, v15

    move/from16 v25, v14

    goto :goto_22

    .line 909
    :cond_45
    move/from16 v25, v14

    .line 907
    .end local v14    # "S_hiWord":I
    .restart local v25    # "S_hiWord":I
    :goto_22
    add-int/lit8 v8, v8, 0x1

    move/from16 v14, v32

    move-object/from16 v15, v33

    goto :goto_21

    .end local v33    # "mlo":Ljava/math/BigInteger;
    .restart local v15    # "mlo":Ljava/math/BigInteger;
    :cond_46
    move-object/from16 v33, v15

    .line 912
    .end local v8    # "idx":I
    .end local v15    # "mlo":Ljava/math/BigInteger;
    .restart local v33    # "mlo":Ljava/math/BigInteger;
    if-eqz v6, :cond_47

    invoke-static/range {v25 .. v25}, Lcom/trendmicro/hippo/DToA;->hi0bits(I)I

    move-result v8

    const/16 v14, 0x20

    rsub-int/lit8 v8, v8, 0x20

    goto :goto_23

    :cond_47
    const/4 v8, 0x1

    :goto_23
    add-int/2addr v8, v2

    and-int/lit8 v8, v8, 0x1f

    move v14, v8

    .end local v32    # "i":I
    .local v14, "i":I
    if-eqz v8, :cond_48

    .line 913
    rsub-int/lit8 v14, v14, 0x20

    .line 915
    :cond_48
    const/4 v8, 0x4

    if-le v14, v8, :cond_49

    .line 916
    add-int/lit8 v14, v14, -0x4

    .line 917
    add-int/2addr v12, v14

    .line 918
    add-int/2addr v3, v14

    .line 919
    add-int/2addr v2, v14

    goto :goto_24

    .line 921
    :cond_49
    const/4 v8, 0x4

    if-ge v14, v8, :cond_4a

    .line 922
    add-int/lit8 v14, v14, 0x1c

    .line 923
    add-int/2addr v12, v14

    .line 924
    add-int/2addr v3, v14

    .line 925
    add-int/2addr v2, v14

    .line 928
    :cond_4a
    :goto_24
    if-lez v12, :cond_4b

    .line 929
    invoke-virtual {v7, v12}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v7

    .line 930
    :cond_4b
    if-lez v2, :cond_4c

    .line 931
    invoke-virtual {v4, v2}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v4

    .line 934
    :cond_4c
    const-wide/16 v31, 0xa

    if-eqz v48, :cond_4e

    .line 935
    invoke-virtual {v7, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v8

    if-gez v8, :cond_4e

    .line 936
    add-int/lit8 v9, v9, -0x1

    .line 937
    invoke-static/range {v31 .. v32}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 938
    if-eqz v28, :cond_4d

    .line 939
    invoke-static/range {v31 .. v32}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v13, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v13

    .line 940
    :cond_4d
    move/from16 v8, v23

    move-object v15, v13

    move v13, v9

    move v9, v8

    .end local p0    # "ilim":I
    .local v8, "ilim":I
    goto :goto_25

    .line 945
    .end local v8    # "ilim":I
    .restart local p0    # "ilim":I
    :cond_4e
    move-object v15, v13

    move v13, v9

    move/from16 v9, p0

    .end local p0    # "ilim":I
    .local v9, "ilim":I
    .local v13, "k":I
    .local v15, "mhi":Ljava/math/BigInteger;
    :goto_25
    if-gtz v9, :cond_51

    const/4 v8, 0x2

    if-le v0, v8, :cond_51

    .line 948
    if-ltz v9, :cond_50

    const-wide/16 v31, 0x5

    .line 949
    invoke-static/range {v31 .. v32}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v8

    move-object v4, v8

    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v8

    move v14, v8

    if-ltz v8, :cond_50

    if-nez v14, :cond_4f

    if-nez p3, :cond_4f

    goto :goto_26

    .line 962
    :cond_4f
    const/16 v8, 0x31

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 963
    const/4 v8, 0x1

    add-int/2addr v13, v8

    .line 964
    add-int/lit8 v8, v13, 0x1

    return v8

    .line 956
    :cond_50
    :goto_26
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 957
    const/16 v8, 0x30

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 958
    const/4 v8, 0x1

    return v8

    .line 966
    :cond_51
    if-eqz v28, :cond_67

    .line 967
    if-lez v3, :cond_52

    .line 968
    invoke-virtual {v15, v3}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v15

    .line 974
    :cond_52
    move-object/from16 v26, v15

    .line 975
    .end local v33    # "mlo":Ljava/math/BigInteger;
    .local v26, "mlo":Ljava/math/BigInteger;
    if-eqz v19, :cond_53

    .line 976
    move-object/from16 v15, v26

    .line 977
    const/4 v8, 0x1

    invoke-virtual {v15, v8}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v15

    goto :goto_27

    .line 975
    :cond_53
    const/4 v8, 0x1

    .line 982
    :goto_27
    const/4 v14, 0x1

    move-object/from16 v56, v15

    move-object/from16 v15, v26

    .line 983
    .end local v26    # "mlo":Ljava/math/BigInteger;
    .local v15, "mlo":Ljava/math/BigInteger;
    .local v56, "mhi":Ljava/math/BigInteger;
    :goto_28
    invoke-virtual {v7, v4}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v26

    .line 984
    .local v26, "divResult":[Ljava/math/BigInteger;
    aget-object v7, v26, v8

    .line 985
    const/4 v8, 0x0

    aget-object v29, v26, v8

    invoke-virtual/range {v29 .. v29}, Ljava/math/BigInteger;->intValue()I

    move-result v29

    const/16 v33, 0x30

    add-int/lit8 v8, v29, 0x30

    int-to-char v8, v8

    .line 989
    .local v8, "dig":C
    invoke-virtual {v7, v15}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v39

    .line 991
    move/from16 p0, v2

    move/from16 v29, v3

    move-object/from16 v2, v56

    .end local v3    # "m2":I
    .end local v56    # "mhi":Ljava/math/BigInteger;
    .local v2, "mhi":Ljava/math/BigInteger;
    .local v29, "m2":I
    .local p0, "s2":I
    invoke-virtual {v4, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 992
    .local v3, "delta":Ljava/math/BigInteger;
    invoke-virtual {v3}, Ljava/math/BigInteger;->signum()I

    move-result v33

    if-gtz v33, :cond_54

    const/16 v33, 0x1

    goto :goto_29

    :cond_54
    invoke-virtual {v7, v3}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v33

    .line 994
    .local v33, "j1":I
    :goto_29
    if-nez v33, :cond_58

    if-nez v0, :cond_58

    invoke-static {v10, v11}, Lcom/trendmicro/hippo/DToA;->word1(D)I

    move-result v34

    const/16 v17, 0x1

    and-int/lit8 v34, v34, 0x1

    if-nez v34, :cond_58

    .line 995
    move-object/from16 v34, v3

    const/16 v3, 0x39

    .end local v3    # "delta":Ljava/math/BigInteger;
    .local v34, "delta":Ljava/math/BigInteger;
    if-ne v8, v3, :cond_56

    .line 996
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 997
    invoke-static/range {p6 .. p6}, Lcom/trendmicro/hippo/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v3

    if-eqz v3, :cond_55

    .line 998
    add-int/lit8 v13, v13, 0x1

    .line 999
    const/16 v3, 0x31

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1001
    :cond_55
    add-int/lit8 v3, v13, 0x1

    return v3

    .line 1004
    :cond_56
    if-lez v39, :cond_57

    .line 1005
    add-int/lit8 v3, v8, 0x1

    int-to-char v8, v3

    .line 1006
    :cond_57
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1007
    add-int/lit8 v3, v13, 0x1

    return v3

    .line 994
    .end local v34    # "delta":Ljava/math/BigInteger;
    .restart local v3    # "delta":Ljava/math/BigInteger;
    :cond_58
    move-object/from16 v34, v3

    .line 1009
    .end local v3    # "delta":Ljava/math/BigInteger;
    .restart local v34    # "delta":Ljava/math/BigInteger;
    if-ltz v39, :cond_5f

    if-nez v39, :cond_59

    if-nez v0, :cond_59

    .line 1012
    invoke-static {v10, v11}, Lcom/trendmicro/hippo/DToA;->word1(D)I

    move-result v3

    const/16 v17, 0x1

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_59

    goto :goto_2b

    .line 1033
    :cond_59
    if-lez v33, :cond_5c

    .line 1034
    const/16 v3, 0x39

    if-ne v8, v3, :cond_5b

    .line 1038
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1039
    invoke-static/range {p6 .. p6}, Lcom/trendmicro/hippo/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v3

    if-eqz v3, :cond_5a

    .line 1040
    add-int/lit8 v13, v13, 0x1

    .line 1041
    const/16 v3, 0x31

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1043
    :cond_5a
    add-int/lit8 v3, v13, 0x1

    return v3

    .line 1045
    :cond_5b
    add-int/lit8 v3, v8, 0x1

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1046
    add-int/lit8 v3, v13, 0x1

    return v3

    .line 1048
    :cond_5c
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1049
    if-ne v14, v9, :cond_5d

    .line 1050
    move/from16 v35, v0

    goto/16 :goto_2f

    .line 1051
    :cond_5d
    invoke-static/range {v31 .. v32}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 1052
    if-ne v15, v2, :cond_5e

    .line 1053
    invoke-static/range {v31 .. v32}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    move-object v2, v3

    move-object/from16 v56, v2

    move-object v15, v3

    .end local v15    # "mlo":Ljava/math/BigInteger;
    .local v3, "mlo":Ljava/math/BigInteger;
    goto :goto_2a

    .line 1055
    .end local v3    # "mlo":Ljava/math/BigInteger;
    .restart local v15    # "mlo":Ljava/math/BigInteger;
    :cond_5e
    invoke-static/range {v31 .. v32}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 1056
    .end local v15    # "mlo":Ljava/math/BigInteger;
    .restart local v3    # "mlo":Ljava/math/BigInteger;
    invoke-static/range {v31 .. v32}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    move-object/from16 v56, v2

    move-object v15, v3

    .line 982
    .end local v2    # "mhi":Ljava/math/BigInteger;
    .end local v3    # "mlo":Ljava/math/BigInteger;
    .end local v26    # "divResult":[Ljava/math/BigInteger;
    .restart local v15    # "mlo":Ljava/math/BigInteger;
    .restart local v56    # "mhi":Ljava/math/BigInteger;
    :goto_2a
    add-int/lit8 v14, v14, 0x1

    move/from16 v2, p0

    move/from16 v3, v29

    const/4 v8, 0x1

    goto/16 :goto_28

    .line 1014
    .end local v56    # "mhi":Ljava/math/BigInteger;
    .restart local v2    # "mhi":Ljava/math/BigInteger;
    .restart local v26    # "divResult":[Ljava/math/BigInteger;
    :cond_5f
    :goto_2b
    if-lez v33, :cond_65

    .line 1017
    const/4 v3, 0x1

    invoke-virtual {v7, v3}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v7

    .line 1018
    invoke-virtual {v7, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v33

    .line 1019
    if-gtz v33, :cond_61

    if-nez v33, :cond_60

    move/from16 v35, v0

    .end local v0    # "mode":I
    .local v35, "mode":I
    and-int/lit8 v0, v8, 0x1

    if-eq v0, v3, :cond_62

    if-eqz p3, :cond_66

    goto :goto_2c

    .end local v35    # "mode":I
    .restart local v0    # "mode":I
    :cond_60
    move/from16 v35, v0

    .end local v0    # "mode":I
    .restart local v35    # "mode":I
    goto :goto_2d

    .end local v35    # "mode":I
    .restart local v0    # "mode":I
    :cond_61
    move/from16 v35, v0

    .end local v0    # "mode":I
    .restart local v35    # "mode":I
    :cond_62
    :goto_2c
    add-int/lit8 v0, v8, 0x1

    int-to-char v0, v0

    const/16 v3, 0x39

    .end local v8    # "dig":C
    .local v0, "dig":C
    if-ne v8, v3, :cond_64

    .line 1021
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1022
    invoke-static/range {p6 .. p6}, Lcom/trendmicro/hippo/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v3

    if-eqz v3, :cond_63

    .line 1023
    add-int/lit8 v13, v13, 0x1

    .line 1024
    const/16 v3, 0x31

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1026
    :cond_63
    add-int/lit8 v3, v13, 0x1

    return v3

    .line 1019
    :cond_64
    move v8, v0

    goto :goto_2d

    .line 1014
    .end local v35    # "mode":I
    .local v0, "mode":I
    .restart local v8    # "dig":C
    :cond_65
    move/from16 v35, v0

    .line 1030
    .end local v0    # "mode":I
    .restart local v35    # "mode":I
    :cond_66
    :goto_2d
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1031
    add-int/lit8 v0, v13, 0x1

    return v0

    .line 1061
    .end local v8    # "dig":C
    .end local v26    # "divResult":[Ljava/math/BigInteger;
    .end local v29    # "m2":I
    .end local v34    # "delta":Ljava/math/BigInteger;
    .end local v35    # "mode":I
    .end local p0    # "s2":I
    .restart local v0    # "mode":I
    .local v2, "s2":I
    .local v3, "m2":I
    .local v15, "mhi":Ljava/math/BigInteger;
    .local v33, "mlo":Ljava/math/BigInteger;
    :cond_67
    move/from16 v35, v0

    move/from16 p0, v2

    move/from16 v29, v3

    .end local v0    # "mode":I
    .end local v2    # "s2":I
    .end local v3    # "m2":I
    .restart local v29    # "m2":I
    .restart local v35    # "mode":I
    .restart local p0    # "s2":I
    const/4 v0, 0x1

    move v14, v0

    .line 1063
    :goto_2e
    invoke-virtual {v7, v4}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v0

    .line 1064
    .local v0, "divResult":[Ljava/math/BigInteger;
    const/4 v2, 0x1

    aget-object v7, v0, v2

    .line 1065
    const/4 v2, 0x0

    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    move-result v3

    const/16 v8, 0x30

    add-int/2addr v3, v8

    int-to-char v3, v3

    .line 1066
    .local v3, "dig":C
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1067
    if-lt v14, v9, :cond_6d

    .line 1068
    move v8, v3

    move-object v2, v15

    move-object/from16 v15, v33

    .line 1074
    .end local v0    # "divResult":[Ljava/math/BigInteger;
    .end local v3    # "dig":C
    .end local v33    # "mlo":Ljava/math/BigInteger;
    .local v2, "mhi":Ljava/math/BigInteger;
    .restart local v8    # "dig":C
    .local v15, "mlo":Ljava/math/BigInteger;
    :goto_2f
    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v3

    .line 1075
    .end local v7    # "b":Ljava/math/BigInteger;
    .local v3, "b":Ljava/math/BigInteger;
    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v7

    .line 1076
    .end local v39    # "j":I
    .local v7, "j":I
    if-gtz v7, :cond_6a

    if-nez v7, :cond_68

    move-object/from16 p1, v2

    .end local v2    # "mhi":Ljava/math/BigInteger;
    .local p1, "mhi":Ljava/math/BigInteger;
    and-int/lit8 v2, v8, 0x1

    if-eq v2, v0, :cond_6b

    if-eqz p3, :cond_69

    goto :goto_30

    .end local p1    # "mhi":Ljava/math/BigInteger;
    .restart local v2    # "mhi":Ljava/math/BigInteger;
    :cond_68
    move-object/from16 p1, v2

    .line 1092
    .end local v2    # "mhi":Ljava/math/BigInteger;
    .restart local p1    # "mhi":Ljava/math/BigInteger;
    :cond_69
    invoke-static/range {p6 .. p6}, Lcom/trendmicro/hippo/DToA;->stripTrailingZeroes(Ljava/lang/StringBuilder;)V

    goto :goto_31

    .line 1076
    .end local p1    # "mhi":Ljava/math/BigInteger;
    .restart local v2    # "mhi":Ljava/math/BigInteger;
    :cond_6a
    move-object/from16 p1, v2

    .line 1085
    .end local v2    # "mhi":Ljava/math/BigInteger;
    .restart local p1    # "mhi":Ljava/math/BigInteger;
    :cond_6b
    :goto_30
    invoke-static/range {p6 .. p6}, Lcom/trendmicro/hippo/DToA;->roundOff(Ljava/lang/StringBuilder;)Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 1086
    const/16 v17, 0x1

    add-int/lit8 v13, v13, 0x1

    .line 1087
    const/16 v0, 0x31

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1088
    add-int/lit8 v0, v13, 0x1

    return v0

    .line 1106
    :cond_6c
    :goto_31
    add-int/lit8 v0, v13, 0x1

    return v0

    .line 1069
    .end local v8    # "dig":C
    .end local p1    # "mhi":Ljava/math/BigInteger;
    .restart local v0    # "divResult":[Ljava/math/BigInteger;
    .local v3, "dig":C
    .local v7, "b":Ljava/math/BigInteger;
    .local v15, "mhi":Ljava/math/BigInteger;
    .restart local v33    # "mlo":Ljava/math/BigInteger;
    .restart local v39    # "j":I
    :cond_6d
    const/16 v17, 0x1

    const/16 v26, 0x31

    invoke-static/range {v31 .. v32}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    .line 1061
    .end local v0    # "divResult":[Ljava/math/BigInteger;
    add-int/lit8 v14, v14, 0x1

    goto :goto_2e
.end method

.method static JS_dtobasestr(ID)Ljava/lang/String;
    .locals 35
    .param p0, "base"    # I
    .param p1, "d"    # D

    .line 208
    move/from16 v0, p0

    move-wide/from16 v1, p1

    const/4 v3, 0x2

    if-gt v3, v0, :cond_18

    const/16 v3, 0x24

    if-gt v0, v3, :cond_18

    .line 212
    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 213
    const-string v3, "NaN"

    return-object v3

    .line 214
    :cond_0
    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v3

    const-wide/16 v4, 0x0

    if-eqz v3, :cond_2

    .line 215
    cmpl-double v3, v1, v4

    if-lez v3, :cond_1

    const-string v3, "Infinity"

    goto :goto_0

    :cond_1
    const-string v3, "-Infinity"

    :goto_0
    return-object v3

    .line 216
    :cond_2
    cmpl-double v3, v1, v4

    if-nez v3, :cond_3

    .line 218
    const-string v3, "0"

    return-object v3

    .line 222
    :cond_3
    cmpl-double v3, v1, v4

    if-ltz v3, :cond_4

    .line 223
    const/4 v3, 0x0

    move v5, v3

    move-wide v3, v1

    .local v3, "negative":Z
    goto :goto_1

    .line 225
    .end local v3    # "negative":Z
    :cond_4
    const/4 v3, 0x1

    .line 226
    .restart local v3    # "negative":Z
    neg-double v1, v1

    move v5, v3

    move-wide v3, v1

    .line 232
    .end local p1    # "d":D
    .local v3, "d":D
    .local v5, "negative":Z
    :goto_1
    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    .line 233
    .local v6, "dfloor":D
    double-to-long v8, v6

    .line 234
    .local v8, "lfloor":J
    long-to-double v1, v8

    cmpl-double v1, v1, v6

    const/4 v10, 0x1

    if-nez v1, :cond_6

    .line 236
    if-eqz v5, :cond_5

    neg-long v1, v8

    goto :goto_2

    :cond_5
    move-wide v1, v8

    :goto_2
    invoke-static {v1, v2, v0}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    move-result-object v1

    move-object v15, v1

    .local v1, "intDigits":Ljava/lang/String;
    goto :goto_5

    .line 239
    .end local v1    # "intDigits":Ljava/lang/String;
    :cond_6
    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v1

    .line 240
    .local v1, "floorBits":J
    const/16 v11, 0x34

    shr-long v11, v1, v11

    long-to-int v11, v11

    and-int/lit16 v11, v11, 0x7ff

    .line 242
    .local v11, "exp":I
    const-wide v12, 0xfffffffffffffL

    if-nez v11, :cond_7

    .line 243
    and-long/2addr v12, v1

    shl-long/2addr v12, v10

    .local v12, "mantissa":J
    goto :goto_3

    .line 245
    .end local v12    # "mantissa":J
    :cond_7
    and-long/2addr v12, v1

    const-wide/high16 v14, 0x10000000000000L

    or-long/2addr v12, v14

    .line 247
    .restart local v12    # "mantissa":J
    :goto_3
    if-eqz v5, :cond_8

    .line 248
    neg-long v12, v12

    .line 250
    :cond_8
    add-int/lit16 v11, v11, -0x433

    .line 251
    invoke-static {v12, v13}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v14

    .line 252
    .local v14, "x":Ljava/math/BigInteger;
    if-lez v11, :cond_9

    .line 253
    invoke-virtual {v14, v11}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v14

    goto :goto_4

    .line 254
    :cond_9
    if-gez v11, :cond_a

    .line 255
    neg-int v15, v11

    invoke-virtual {v14, v15}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v14

    .line 257
    :cond_a
    :goto_4
    invoke-virtual {v14, v0}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v15

    .line 260
    .end local v1    # "floorBits":J
    .end local v11    # "exp":I
    .end local v12    # "mantissa":J
    .end local v14    # "x":Ljava/math/BigInteger;
    .local v15, "intDigits":Ljava/lang/String;
    :goto_5
    cmpl-double v1, v3, v6

    if-nez v1, :cond_b

    .line 262
    return-object v15

    .line 271
    :cond_b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object v11, v1

    .line 272
    .local v11, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2e

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 273
    sub-double v12, v3, v6

    .line 275
    .local v12, "df":D
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v1

    .line 276
    .local v1, "dBits":J
    const/16 v14, 0x20

    move-object/from16 v17, v11

    .end local v11    # "buffer":Ljava/lang/StringBuilder;
    .local v17, "buffer":Ljava/lang/StringBuilder;
    shr-long v10, v1, v14

    long-to-int v10, v10

    .line 277
    .local v10, "word0":I
    long-to-int v11, v1

    .line 279
    .local v11, "word1":I
    move-wide/from16 p1, v1

    const/4 v14, 0x1

    .end local v1    # "dBits":J
    .local p1, "dBits":J
    new-array v1, v14, [I

    .line 280
    .local v1, "e":[I
    new-array v2, v14, [I

    .line 282
    .local v2, "bbits":[I
    invoke-static {v12, v13, v1, v2}, Lcom/trendmicro/hippo/DToA;->d2b(D[I[I)Ljava/math/BigInteger;

    move-result-object v14

    .line 286
    .local v14, "b":Ljava/math/BigInteger;
    move-object/from16 v18, v2

    .end local v2    # "bbits":[I
    .local v18, "bbits":[I
    ushr-int/lit8 v2, v10, 0x14

    and-int/lit16 v2, v2, 0x7ff

    neg-int v2, v2

    .line 287
    .local v2, "s2":I
    if-nez v2, :cond_c

    .line 288
    const/4 v2, -0x1

    .line 289
    :cond_c
    add-int/lit16 v2, v2, 0x434

    .line 292
    const-wide/16 v19, 0x1

    invoke-static/range {v19 .. v20}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v21

    .line 293
    .local v21, "mlo":Ljava/math/BigInteger;
    move-object/from16 v22, v21

    .line 294
    .local v22, "mhi":Ljava/math/BigInteger;
    if-nez v11, :cond_d

    const v23, 0xfffff

    and-int v23, v10, v23

    if-nez v23, :cond_d

    const/high16 v23, 0x7fe00000

    and-int v23, v10, v23

    if-eqz v23, :cond_d

    .line 298
    add-int/lit8 v2, v2, 0x1

    .line 299
    const-wide/16 v23, 0x2

    invoke-static/range {v23 .. v24}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v22

    .line 302
    :cond_d
    const/16 v23, 0x0

    aget v24, v1, v23

    move-object/from16 v25, v1

    .end local v1    # "e":[I
    .local v25, "e":[I
    add-int v1, v24, v2

    invoke-virtual {v14, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v1

    .line 303
    .end local v14    # "b":Ljava/math/BigInteger;
    .local v1, "b":Ljava/math/BigInteger;
    invoke-static/range {v19 .. v20}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v14

    .line 304
    .local v14, "s":Ljava/math/BigInteger;
    invoke-virtual {v14, v2}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v14

    .line 310
    move-object/from16 v20, v1

    move/from16 v19, v2

    .end local v1    # "b":Ljava/math/BigInteger;
    .end local v2    # "s2":I
    .local v19, "s2":I
    .local v20, "b":Ljava/math/BigInteger;
    int-to-long v1, v0

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 312
    .local v1, "bigBase":Ljava/math/BigInteger;
    const/4 v2, 0x0

    move-object/from16 v32, v20

    move/from16 v20, v2

    move-object/from16 v2, v32

    move-wide/from16 v33, v3

    move-object/from16 v3, v21

    move-object/from16 v4, v22

    move-wide/from16 v21, v33

    .line 314
    .end local v22    # "mhi":Ljava/math/BigInteger;
    .local v2, "b":Ljava/math/BigInteger;
    .local v3, "mlo":Ljava/math/BigInteger;
    .local v4, "mhi":Ljava/math/BigInteger;
    .local v20, "done":Z
    .local v21, "d":D
    :goto_6
    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 315
    invoke-virtual {v2, v14}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v24

    .line 316
    .local v24, "divResult":[Ljava/math/BigInteger;
    const/16 v16, 0x1

    aget-object v2, v24, v16

    .line 317
    aget-object v26, v24, v23

    move/from16 v27, v5

    .end local v5    # "negative":Z
    .local v27, "negative":Z
    invoke-virtual/range {v26 .. v26}, Ljava/math/BigInteger;->intValue()I

    move-result v5

    int-to-char v5, v5

    .line 318
    .local v5, "digit":I
    if-ne v3, v4, :cond_e

    .line 319
    invoke-virtual {v3, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v26

    move-object/from16 v4, v26

    move-object/from16 v3, v26

    goto :goto_7

    .line 321
    :cond_e
    invoke-virtual {v3, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 322
    invoke-virtual {v4, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    .line 326
    :goto_7
    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v26

    .line 328
    .local v26, "j":I
    move-object/from16 v28, v1

    .end local v1    # "bigBase":Ljava/math/BigInteger;
    .local v28, "bigBase":Ljava/math/BigInteger;
    invoke-virtual {v14, v4}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 329
    .local v1, "delta":Ljava/math/BigInteger;
    invoke-virtual {v1}, Ljava/math/BigInteger;->signum()I

    move-result v29

    if-gtz v29, :cond_f

    const/16 v29, 0x1

    goto :goto_8

    :cond_f
    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v29

    .line 331
    .local v29, "j1":I
    :goto_8
    if-nez v29, :cond_11

    and-int/lit8 v30, v11, 0x1

    if-nez v30, :cond_11

    .line 332
    if-lez v26, :cond_10

    .line 333
    add-int/lit8 v5, v5, 0x1

    .line 334
    :cond_10
    const/16 v20, 0x1

    move-object/from16 v30, v1

    const/4 v1, 0x1

    goto :goto_b

    .line 336
    :cond_11
    if-ltz v26, :cond_14

    if-nez v26, :cond_12

    and-int/lit8 v30, v11, 0x1

    if-nez v30, :cond_12

    goto :goto_9

    .line 347
    :cond_12
    if-lez v29, :cond_13

    .line 348
    add-int/lit8 v5, v5, 0x1

    .line 349
    const/16 v20, 0x1

    move-object/from16 v30, v1

    const/4 v1, 0x1

    goto :goto_b

    .line 347
    :cond_13
    move-object/from16 v30, v1

    const/4 v1, 0x1

    goto :goto_b

    .line 337
    :cond_14
    :goto_9
    if-lez v29, :cond_16

    .line 340
    move-object/from16 v30, v1

    const/4 v1, 0x1

    .end local v1    # "delta":Ljava/math/BigInteger;
    .local v30, "delta":Ljava/math/BigInteger;
    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v2

    .line 341
    invoke-virtual {v2, v14}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v16

    .line 342
    .end local v29    # "j1":I
    .local v16, "j1":I
    if-lez v16, :cond_15

    .line 344
    add-int/lit8 v5, v5, 0x1

    move/from16 v29, v16

    goto :goto_a

    .line 342
    :cond_15
    move/from16 v29, v16

    goto :goto_a

    .line 337
    .end local v16    # "j1":I
    .end local v30    # "delta":Ljava/math/BigInteger;
    .restart local v1    # "delta":Ljava/math/BigInteger;
    .restart local v29    # "j1":I
    :cond_16
    move-object/from16 v30, v1

    const/4 v1, 0x1

    .line 346
    .end local v1    # "delta":Ljava/math/BigInteger;
    .restart local v30    # "delta":Ljava/math/BigInteger;
    :goto_a
    const/16 v16, 0x1

    move/from16 v20, v16

    .line 352
    :goto_b
    invoke-static {v5}, Lcom/trendmicro/hippo/DToA;->BASEDIGIT(I)C

    move-result v1

    move-object/from16 v31, v2

    move-object/from16 v2, v17

    .end local v17    # "buffer":Ljava/lang/StringBuilder;
    .local v2, "buffer":Ljava/lang/StringBuilder;
    .local v31, "b":Ljava/math/BigInteger;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 353
    .end local v24    # "divResult":[Ljava/math/BigInteger;
    .end local v26    # "j":I
    .end local v29    # "j1":I
    .end local v30    # "delta":Ljava/math/BigInteger;
    if-eqz v20, :cond_17

    .line 355
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 353
    :cond_17
    move-object/from16 v17, v2

    move/from16 v5, v27

    move-object/from16 v1, v28

    move-object/from16 v2, v31

    goto/16 :goto_6

    .line 209
    .end local v2    # "buffer":Ljava/lang/StringBuilder;
    .end local v3    # "mlo":Ljava/math/BigInteger;
    .end local v4    # "mhi":Ljava/math/BigInteger;
    .end local v5    # "digit":I
    .end local v6    # "dfloor":D
    .end local v8    # "lfloor":J
    .end local v10    # "word0":I
    .end local v11    # "word1":I
    .end local v12    # "df":D
    .end local v14    # "s":Ljava/math/BigInteger;
    .end local v15    # "intDigits":Ljava/lang/String;
    .end local v18    # "bbits":[I
    .end local v19    # "s2":I
    .end local v20    # "done":Z
    .end local v21    # "d":D
    .end local v25    # "e":[I
    .end local v27    # "negative":Z
    .end local v28    # "bigBase":Ljava/math/BigInteger;
    .end local v31    # "b":Ljava/math/BigInteger;
    .local p1, "d":D
    :cond_18
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad base: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static JS_dtostr(Ljava/lang/StringBuilder;IID)V
    .locals 11
    .param p0, "buffer"    # Ljava/lang/StringBuilder;
    .param p1, "mode"    # I
    .param p2, "precision"    # I
    .param p3, "d"    # D

    .line 1133
    const/4 v0, 0x1

    new-array v8, v0, [Z

    .line 1139
    .local v8, "sign":[Z
    const/4 v9, 0x2

    if-ne p1, v9, :cond_1

    const-wide v1, 0x444b1ae4d6e2ef50L    # 1.0E21

    cmpl-double v1, p3, v1

    if-gez v1, :cond_0

    const-wide v1, -0x3bb4e51b291d10b0L    # -1.0E21

    cmpg-double v1, p3, v1

    if-gtz v1, :cond_1

    .line 1140
    :cond_0
    const/4 p1, 0x0

    .line 1142
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/DToA;->dtoaModes:[I

    aget v3, v1, p1

    const/4 v10, 0x0

    if-lt p1, v9, :cond_2

    move v4, v0

    goto :goto_0

    :cond_2
    move v4, v10

    :goto_0
    move-wide v1, p3

    move v5, p2

    move-object v6, v8

    move-object v7, p0

    invoke-static/range {v1 .. v7}, Lcom/trendmicro/hippo/DToA;->JS_dtoa(DIZI[ZLjava/lang/StringBuilder;)I

    move-result v1

    .line 1143
    .local v1, "decPt":I
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 1146
    .local v2, "nDigits":I
    const/16 v3, 0x270f

    if-eq v1, v3, :cond_14

    .line 1147
    const/4 v3, 0x0

    .line 1148
    .local v3, "exponentialNotation":Z
    const/4 v4, 0x0

    .line 1151
    .local v4, "minNDigits":I
    const/4 v5, -0x5

    if-eqz p1, :cond_9

    if-eq p1, v0, :cond_8

    if-eq p1, v9, :cond_6

    const/4 v6, 0x3

    if-eq p1, v6, :cond_5

    const/4 v6, 0x4

    if-eq p1, v6, :cond_3

    goto :goto_3

    .line 1176
    :cond_3
    move v4, p2

    .line 1177
    if-lt v1, v5, :cond_4

    if-le v1, p2, :cond_c

    .line 1178
    :cond_4
    const/4 v3, 0x1

    goto :goto_3

    .line 1168
    :cond_5
    move v4, p2

    goto :goto_1

    .line 1160
    :cond_6
    if-ltz p2, :cond_7

    .line 1161
    add-int v4, v1, p2

    goto :goto_3

    .line 1163
    :cond_7
    move v4, v1

    .line 1164
    goto :goto_3

    .line 1171
    :cond_8
    :goto_1
    const/4 v3, 0x1

    .line 1172
    goto :goto_3

    .line 1153
    :cond_9
    if-lt v1, v5, :cond_b

    const/16 v5, 0x15

    if-le v1, v5, :cond_a

    goto :goto_2

    .line 1156
    :cond_a
    move v4, v1

    .line 1157
    goto :goto_3

    .line 1154
    :cond_b
    :goto_2
    const/4 v3, 0x1

    .line 1183
    :cond_c
    :goto_3
    const/16 v5, 0x30

    if-ge v2, v4, :cond_e

    .line 1184
    move v6, v4

    .line 1185
    .local v6, "p":I
    move v7, v4

    .line 1187
    .end local v2    # "nDigits":I
    .local v7, "nDigits":I
    :cond_d
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1188
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-ne v2, v6, :cond_d

    move v2, v7

    .line 1191
    .end local v6    # "p":I
    .end local v7    # "nDigits":I
    .restart local v2    # "nDigits":I
    :cond_e
    const/16 v6, 0x2e

    if-eqz v3, :cond_11

    .line 1193
    if-eq v2, v0, :cond_f

    .line 1194
    invoke-virtual {p0, v0, v6}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1196
    :cond_f
    const/16 v0, 0x65

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1197
    add-int/lit8 v0, v1, -0x1

    if-ltz v0, :cond_10

    .line 1198
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1199
    :cond_10
    add-int/lit8 v0, v1, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 1201
    :cond_11
    if-eq v1, v2, :cond_14

    .line 1204
    if-lez v1, :cond_12

    .line 1206
    invoke-virtual {p0, v1, v6}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 1209
    :cond_12
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    rsub-int/lit8 v9, v1, 0x1

    if-ge v7, v9, :cond_13

    .line 1210
    invoke-virtual {p0, v10, v5}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1209
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 1211
    .end local v7    # "i":I
    :cond_13
    invoke-virtual {p0, v0, v6}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1217
    .end local v3    # "exponentialNotation":Z
    .end local v4    # "minNDigits":I
    :cond_14
    :goto_5
    aget-boolean v0, v8, v10

    if-eqz v0, :cond_17

    .line 1218
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v0

    const/high16 v3, -0x80000000

    if-ne v0, v3, :cond_15

    invoke-static {p3, p4}, Lcom/trendmicro/hippo/DToA;->word1(D)I

    move-result v0

    if-eqz v0, :cond_17

    .line 1219
    :cond_15
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v0

    const/high16 v3, 0x7ff00000

    and-int/2addr v0, v3

    if-ne v0, v3, :cond_16

    .line 1220
    invoke-static {p3, p4}, Lcom/trendmicro/hippo/DToA;->word1(D)I

    move-result v0

    if-nez v0, :cond_17

    invoke-static {p3, p4}, Lcom/trendmicro/hippo/DToA;->word0(D)I

    move-result v0

    const v3, 0xfffff

    and-int/2addr v0, v3

    if-nez v0, :cond_17

    .line 1221
    :cond_16
    const/16 v0, 0x2d

    invoke-virtual {p0, v10, v0}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 1223
    :cond_17
    return-void
.end method

.method private static d2b(D[I[I)Ljava/math/BigInteger;
    .locals 14
    .param p0, "d"    # D
    .param p2, "e"    # [I
    .param p3, "bits"    # [I

    .line 163
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 164
    .local v0, "dBits":J
    const/16 v2, 0x20

    ushr-long v3, v0, v2

    long-to-int v3, v3

    .line 165
    .local v3, "d0":I
    long-to-int v4, v0

    .line 167
    .local v4, "d1":I
    const v5, 0xfffff

    and-int/2addr v5, v3

    .line 168
    .local v5, "z":I
    const v6, 0x7fffffff

    and-int/2addr v3, v6

    .line 170
    ushr-int/lit8 v6, v3, 0x14

    move v7, v6

    .local v7, "de":I
    if-eqz v6, :cond_0

    .line 171
    const/high16 v6, 0x100000

    or-int/2addr v5, v6

    .line 173
    :cond_0
    move v6, v4

    .local v6, "y":I
    const/4 v8, 0x1

    const/4 v9, 0x4

    const/4 v10, 0x0

    if-eqz v4, :cond_3

    .line 174
    const/16 v2, 0x8

    new-array v2, v2, [B

    .line 175
    .local v2, "dbl_bits":[B
    invoke-static {v6}, Lcom/trendmicro/hippo/DToA;->lo0bits(I)I

    move-result v11

    .line 176
    .local v11, "k":I
    ushr-int/2addr v6, v11

    .line 177
    if-eqz v11, :cond_1

    .line 178
    rsub-int/lit8 v12, v11, 0x20

    shl-int v12, v5, v12

    or-int/2addr v12, v6

    invoke-static {v2, v9, v12}, Lcom/trendmicro/hippo/DToA;->stuffBits([BII)V

    .line 179
    shr-int/2addr v5, v11

    goto :goto_0

    .line 182
    :cond_1
    invoke-static {v2, v9, v6}, Lcom/trendmicro/hippo/DToA;->stuffBits([BII)V

    .line 183
    :goto_0
    invoke-static {v2, v10, v5}, Lcom/trendmicro/hippo/DToA;->stuffBits([BII)V

    .line 184
    if-eqz v5, :cond_2

    const/4 v9, 0x2

    goto :goto_1

    :cond_2
    move v9, v8

    .local v9, "i":I
    :goto_1
    goto :goto_2

    .line 188
    .end local v2    # "dbl_bits":[B
    .end local v9    # "i":I
    .end local v11    # "k":I
    :cond_3
    new-array v9, v9, [B

    .line 189
    .local v9, "dbl_bits":[B
    invoke-static {v5}, Lcom/trendmicro/hippo/DToA;->lo0bits(I)I

    move-result v11

    .line 190
    .restart local v11    # "k":I
    ushr-int/2addr v5, v11

    .line 191
    invoke-static {v9, v10, v5}, Lcom/trendmicro/hippo/DToA;->stuffBits([BII)V

    .line 192
    add-int/2addr v11, v2

    .line 193
    const/4 v2, 0x1

    move-object v13, v9

    move v9, v2

    move-object v2, v13

    .line 195
    .restart local v2    # "dbl_bits":[B
    .local v9, "i":I
    :goto_2
    if-eqz v7, :cond_4

    .line 196
    add-int/lit16 v8, v7, -0x3ff

    add-int/lit8 v8, v8, -0x34

    add-int/2addr v8, v11

    aput v8, p2, v10

    .line 197
    rsub-int/lit8 v8, v11, 0x35

    aput v8, p3, v10

    goto :goto_3

    .line 200
    :cond_4
    add-int/lit16 v12, v7, -0x3ff

    add-int/lit8 v12, v12, -0x34

    add-int/2addr v12, v8

    add-int/2addr v12, v11

    aput v12, p2, v10

    .line 201
    mul-int/lit8 v8, v9, 0x20

    invoke-static {v5}, Lcom/trendmicro/hippo/DToA;->hi0bits(I)I

    move-result v12

    sub-int/2addr v8, v12

    aput v8, p3, v10

    .line 203
    :goto_3
    new-instance v8, Ljava/math/BigInteger;

    invoke-direct {v8, v2}, Ljava/math/BigInteger;-><init>([B)V

    return-object v8
.end method

.method private static hi0bits(I)I
    .locals 2
    .param p0, "x"    # I

    .line 122
    const/4 v0, 0x0

    .line 124
    .local v0, "k":I
    const/high16 v1, -0x10000

    and-int/2addr v1, p0

    if-nez v1, :cond_0

    .line 125
    const/16 v0, 0x10

    .line 126
    shl-int/lit8 p0, p0, 0x10

    .line 128
    :cond_0
    const/high16 v1, -0x1000000

    and-int/2addr v1, p0

    if-nez v1, :cond_1

    .line 129
    add-int/lit8 v0, v0, 0x8

    .line 130
    shl-int/lit8 p0, p0, 0x8

    .line 132
    :cond_1
    const/high16 v1, -0x10000000

    and-int/2addr v1, p0

    if-nez v1, :cond_2

    .line 133
    add-int/lit8 v0, v0, 0x4

    .line 134
    shl-int/lit8 p0, p0, 0x4

    .line 136
    :cond_2
    const/high16 v1, -0x40000000    # -2.0f

    and-int/2addr v1, p0

    if-nez v1, :cond_3

    .line 137
    add-int/lit8 v0, v0, 0x2

    .line 138
    shl-int/lit8 p0, p0, 0x2

    .line 140
    :cond_3
    const/high16 v1, -0x80000000

    and-int/2addr v1, p0

    if-nez v1, :cond_4

    .line 141
    add-int/lit8 v0, v0, 0x1

    .line 142
    const/high16 v1, 0x40000000    # 2.0f

    and-int/2addr v1, p0

    if-nez v1, :cond_4

    .line 143
    const/16 v1, 0x20

    return v1

    .line 145
    :cond_4
    return v0
.end method

.method private static lo0bits(I)I
    .locals 3
    .param p0, "y"    # I

    .line 83
    move v0, p0

    .line 85
    .local v0, "x":I
    and-int/lit8 v1, v0, 0x7

    if-eqz v1, :cond_2

    .line 86
    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_0

    .line 87
    const/4 v1, 0x0

    return v1

    .line 88
    :cond_0
    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_1

    .line 89
    const/4 v1, 0x1

    return v1

    .line 91
    :cond_1
    const/4 v1, 0x2

    return v1

    .line 93
    :cond_2
    const/4 v1, 0x0

    .line 94
    .local v1, "k":I
    const v2, 0xffff

    and-int/2addr v2, v0

    if-nez v2, :cond_3

    .line 95
    const/16 v1, 0x10

    .line 96
    ushr-int/lit8 v0, v0, 0x10

    .line 98
    :cond_3
    and-int/lit16 v2, v0, 0xff

    if-nez v2, :cond_4

    .line 99
    add-int/lit8 v1, v1, 0x8

    .line 100
    ushr-int/lit8 v0, v0, 0x8

    .line 102
    :cond_4
    and-int/lit8 v2, v0, 0xf

    if-nez v2, :cond_5

    .line 103
    add-int/lit8 v1, v1, 0x4

    .line 104
    ushr-int/lit8 v0, v0, 0x4

    .line 106
    :cond_5
    and-int/lit8 v2, v0, 0x3

    if-nez v2, :cond_6

    .line 107
    add-int/lit8 v1, v1, 0x2

    .line 108
    ushr-int/lit8 v0, v0, 0x2

    .line 110
    :cond_6
    and-int/lit8 v2, v0, 0x1

    if-nez v2, :cond_7

    .line 111
    add-int/lit8 v1, v1, 0x1

    .line 112
    ushr-int/lit8 v0, v0, 0x1

    .line 113
    and-int/lit8 v2, v0, 0x1

    if-nez v2, :cond_7

    .line 114
    const/16 v2, 0x20

    return v2

    .line 116
    :cond_7
    return v1
.end method

.method static pow5mult(Ljava/math/BigInteger;I)Ljava/math/BigInteger;
    .locals 2
    .param p0, "b"    # Ljava/math/BigInteger;
    .param p1, "k"    # I

    .line 415
    const-wide/16 v0, 0x5

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method static roundOff(Ljava/lang/StringBuilder;)Z
    .locals 4
    .param p0, "buf"    # Ljava/lang/StringBuilder;

    .line 420
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 421
    .local v0, "i":I
    :goto_0
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 422
    add-int/lit8 v0, v0, -0x1

    .line 423
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    .line 424
    .local v2, "c":C
    const/16 v3, 0x39

    if-eq v2, v3, :cond_0

    .line 425
    add-int/lit8 v3, v2, 0x1

    int-to-char v3, v3

    invoke-virtual {p0, v0, v3}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 426
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 427
    return v1

    .line 429
    .end local v2    # "c":C
    :cond_0
    goto :goto_0

    .line 430
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 431
    const/4 v1, 0x1

    return v1
.end method

.method static setWord0(DI)D
    .locals 6
    .param p0, "d"    # D
    .param p2, "i"    # I

    .line 400
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 401
    .local v0, "dBits":J
    int-to-long v2, p2

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    const-wide v4, 0xffffffffL

    and-long/2addr v4, v0

    or-long v0, v2, v4

    .line 402
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    return-wide v2
.end method

.method private static stripTrailingZeroes(Ljava/lang/StringBuilder;)V
    .locals 3
    .param p0, "buf"    # Ljava/lang/StringBuilder;

    .line 1114
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1115
    .local v0, "bl":I
    :goto_0
    add-int/lit8 v1, v0, -0x1

    .end local v0    # "bl":I
    .local v1, "bl":I
    if-lez v0, :cond_0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    const/16 v2, 0x30

    if-ne v0, v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 1118
    :cond_0
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 1119
    return-void
.end method

.method private static stuffBits([BII)V
    .locals 2
    .param p0, "bits"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # I

    .line 150
    shr-int/lit8 v0, p2, 0x18

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 151
    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x10

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 152
    add-int/lit8 v0, p1, 0x2

    shr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 153
    add-int/lit8 v0, p1, 0x3

    int-to-byte v1, p2

    aput-byte v1, p0, v0

    .line 154
    return-void
.end method

.method static word0(D)I
    .locals 4
    .param p0, "d"    # D

    .line 394
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 395
    .local v0, "dBits":J
    const/16 v2, 0x20

    shr-long v2, v0, v2

    long-to-int v2, v2

    return v2
.end method

.method static word1(D)I
    .locals 3
    .param p0, "d"    # D

    .line 407
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 408
    .local v0, "dBits":J
    long-to-int v2, v0

    return v2
.end method
