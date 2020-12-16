.class public Lcom/trendmicro/hippo/v8dtoa/FastDtoa;
.super Ljava/lang/Object;
.source "FastDtoa.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final kFastDtoaMaximalLength:I = 0x11

.field static final kTen4:I = 0x2710

.field static final kTen5:I = 0x186a0

.field static final kTen6:I = 0xf4240

.field static final kTen7:I = 0x989680

.field static final kTen8:I = 0x5f5e100

.field static final kTen9:I = 0x3b9aca00

.field static final maximal_target_exponent:I = -0x20

.field static final minimal_target_exponent:I = -0x3c


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 33
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static biggestPowerTen(II)J
    .locals 8
    .param p0, "number"    # I
    .param p1, "number_bits"    # I

    .line 183
    packed-switch p1, :pswitch_data_0

    .line 272
    const/4 v0, 0x0

    .line 273
    .local v0, "power":I
    const/4 v1, 0x0

    .local v1, "exponent":I
    goto :goto_0

    .line 187
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :pswitch_0
    const v0, 0x3b9aca00

    if-gt v0, p0, :cond_0

    .line 188
    const v0, 0x3b9aca00

    .line 189
    .restart local v0    # "power":I
    const/16 v1, 0x9

    .line 190
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 195
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_0
    :pswitch_1
    const v0, 0x5f5e100

    if-gt v0, p0, :cond_1

    .line 196
    const v0, 0x5f5e100

    .line 197
    .restart local v0    # "power":I
    const/16 v1, 0x8

    .line 198
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 203
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_1
    :pswitch_2
    const v0, 0x989680

    if-gt v0, p0, :cond_2

    .line 204
    const v0, 0x989680

    .line 205
    .restart local v0    # "power":I
    const/4 v1, 0x7

    .line 206
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 212
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_2
    :pswitch_3
    const v0, 0xf4240

    if-gt v0, p0, :cond_3

    .line 213
    const v0, 0xf4240

    .line 214
    .restart local v0    # "power":I
    const/4 v1, 0x6

    .line 215
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 220
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_3
    :pswitch_4
    const v0, 0x186a0

    if-gt v0, p0, :cond_4

    .line 221
    const v0, 0x186a0

    .line 222
    .restart local v0    # "power":I
    const/4 v1, 0x5

    .line 223
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 228
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_4
    :pswitch_5
    const/16 v0, 0x2710

    if-gt v0, p0, :cond_5

    .line 229
    const/16 v0, 0x2710

    .line 230
    .restart local v0    # "power":I
    const/4 v1, 0x4

    .line 231
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 237
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_5
    :pswitch_6
    const/16 v0, 0x3e8

    if-gt v0, p0, :cond_6

    .line 238
    const/16 v0, 0x3e8

    .line 239
    .restart local v0    # "power":I
    const/4 v1, 0x3

    .line 240
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 245
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_6
    :pswitch_7
    const/16 v0, 0x64

    if-gt v0, p0, :cond_7

    .line 246
    const/16 v0, 0x64

    .line 247
    .restart local v0    # "power":I
    const/4 v1, 0x2

    .line 248
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 253
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_7
    :pswitch_8
    const/16 v0, 0xa

    if-gt v0, p0, :cond_8

    .line 254
    const/16 v0, 0xa

    .line 255
    .restart local v0    # "power":I
    const/4 v1, 0x1

    .line 256
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 261
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_8
    :pswitch_9
    const/4 v0, 0x1

    if-gt v0, p0, :cond_9

    .line 262
    const/4 v0, 0x1

    .line 263
    .restart local v0    # "power":I
    const/4 v1, 0x0

    .line 264
    .restart local v1    # "exponent":I
    goto :goto_0

    .line 267
    .end local v0    # "power":I
    .end local v1    # "exponent":I
    :cond_9
    :pswitch_a
    const/4 v0, 0x0

    .line 268
    .restart local v0    # "power":I
    const/4 v1, -0x1

    .line 269
    .restart local v1    # "exponent":I
    nop

    .line 276
    :goto_0
    int-to-long v2, v0

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    const-wide v4, 0xffffffffL

    int-to-long v6, v1

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method static digitGen(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;I)Z
    .locals 32
    .param p0, "low"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .param p1, "w"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .param p2, "high"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .param p3, "buffer"    # Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;
    .param p4, "mk"    # I

    .line 331
    move-object/from16 v0, p1

    move-object/from16 v12, p3

    .line 332
    nop

    .line 333
    nop

    .line 345
    const-wide/16 v13, 0x1

    .line 346
    .local v13, "unit":J
    new-instance v1, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    sub-long/2addr v2, v13

    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>(JI)V

    move-object v15, v1

    .line 347
    .local v15, "too_low":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    new-instance v1, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    add-long/2addr v2, v13

    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>(JI)V

    move-object v10, v1

    .line 350
    .local v10, "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-static {v10, v15}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->minus(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    move-result-object v11

    .line 358
    .local v11, "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    new-instance v1, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v2

    neg-int v2, v2

    const-wide/16 v3, 0x1

    shl-long v5, v3, v2

    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v2

    invoke-direct {v1, v5, v6, v2}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>(JI)V

    move-object v8, v1

    .line 360
    .local v8, "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-virtual {v10}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v1

    invoke-virtual {v8}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v5

    neg-int v5, v5

    ushr-long/2addr v1, v5

    const-wide v5, 0xffffffffL

    and-long/2addr v1, v5

    long-to-int v1, v1

    .line 362
    .local v1, "integrals":I
    invoke-virtual {v10}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v16

    invoke-virtual {v8}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v18

    sub-long v18, v18, v3

    and-long v16, v16, v18

    .line 363
    .local v16, "fractionals":J
    invoke-virtual {v8}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v2

    neg-int v2, v2

    rsub-int/lit8 v2, v2, 0x40

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/v8dtoa/FastDtoa;->biggestPowerTen(II)J

    move-result-wide v18

    .line 364
    .local v18, "result":J
    const/16 v2, 0x20

    ushr-long v20, v18, v2

    and-long v3, v20, v5

    long-to-int v2, v3

    .line 365
    .local v2, "divider":I
    and-long v3, v18, v5

    long-to-int v9, v3

    .line 366
    .local v9, "divider_exponent":I
    add-int/lit8 v3, v9, 0x1

    move/from16 v20, v1

    move v7, v2

    .line 371
    .end local v1    # "integrals":I
    .end local v2    # "divider":I
    .local v3, "kappa":I
    .local v7, "divider":I
    .local v20, "integrals":I
    :goto_0
    if-lez v3, :cond_1

    .line 372
    div-int v21, v20, v7

    .line 373
    .local v21, "digit":I
    add-int/lit8 v1, v21, 0x30

    int-to-char v1, v1

    invoke-virtual {v12, v1}, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->append(C)V

    .line 374
    rem-int v4, v20, v7

    .line 375
    .end local v20    # "integrals":I
    .local v4, "integrals":I
    add-int/lit8 v20, v3, -0x1

    .line 378
    .end local v3    # "kappa":I
    .local v20, "kappa":I
    int-to-long v1, v4

    .line 379
    invoke-virtual {v8}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v3

    neg-int v3, v3

    shl-long/2addr v1, v3

    add-long v24, v1, v16

    .line 382
    .local v24, "rest":J
    invoke-virtual {v11}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v1

    cmp-long v1, v24, v1

    if-gez v1, :cond_0

    .line 385
    iget v1, v12, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->end:I

    sub-int v1, v1, p4

    add-int v1, v1, v20

    iput v1, v12, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->point:I

    .line 386
    invoke-static {v10, v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->minus(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    .line 387
    invoke-virtual {v11}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v5

    move/from16 v27, v9

    move-object/from16 v26, v10

    .end local v9    # "divider_exponent":I
    .end local v10    # "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v26, "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v27, "divider_exponent":I
    int-to-long v9, v7

    .line 388
    invoke-virtual {v8}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v1

    neg-int v1, v1

    shl-long/2addr v9, v1

    .line 386
    move-object/from16 v1, p3

    move/from16 v28, v4

    .end local v4    # "integrals":I
    .local v28, "integrals":I
    move-wide v4, v5

    move/from16 v29, v7

    .end local v7    # "divider":I
    .local v29, "divider":I
    move-wide/from16 v6, v24

    move-object/from16 v30, v8

    .end local v8    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v30, "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    move-wide v8, v9

    move-object/from16 v31, v15

    move-object/from16 v15, v26

    move-object/from16 v26, v11

    .end local v11    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v15, "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v26, "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v31, "too_low":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    move-wide v10, v13

    invoke-static/range {v1 .. v11}, Lcom/trendmicro/hippo/v8dtoa/FastDtoa;->roundWeed(Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;JJJJJ)Z

    move-result v1

    return v1

    .line 390
    .end local v26    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v27    # "divider_exponent":I
    .end local v28    # "integrals":I
    .end local v29    # "divider":I
    .end local v30    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v31    # "too_low":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v4    # "integrals":I
    .restart local v7    # "divider":I
    .restart local v8    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v9    # "divider_exponent":I
    .restart local v10    # "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v11    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v15, "too_low":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    :cond_0
    move/from16 v28, v4

    move/from16 v29, v7

    move-object/from16 v30, v8

    move/from16 v27, v9

    move-object/from16 v26, v11

    move-object/from16 v31, v15

    move-object v15, v10

    .end local v4    # "integrals":I
    .end local v7    # "divider":I
    .end local v8    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v9    # "divider_exponent":I
    .end local v10    # "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v11    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v15, "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v26    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v27    # "divider_exponent":I
    .restart local v28    # "integrals":I
    .restart local v29    # "divider":I
    .restart local v30    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v31    # "too_low":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    div-int/lit8 v7, v29, 0xa

    .line 391
    .end local v21    # "digit":I
    .end local v24    # "rest":J
    .end local v29    # "divider":I
    .restart local v7    # "divider":I
    move/from16 v3, v20

    move/from16 v20, v28

    move-object/from16 v15, v31

    goto :goto_0

    .line 371
    .end local v26    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v27    # "divider_exponent":I
    .end local v28    # "integrals":I
    .end local v30    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v31    # "too_low":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v3    # "kappa":I
    .restart local v8    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v9    # "divider_exponent":I
    .restart local v10    # "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v11    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v15, "too_low":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v20, "integrals":I
    :cond_1
    move/from16 v29, v7

    move-object/from16 v30, v8

    move/from16 v27, v9

    move-object/from16 v26, v11

    move-object/from16 v31, v15

    move-object v15, v10

    .line 408
    .end local v7    # "divider":I
    .end local v8    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v9    # "divider_exponent":I
    .end local v10    # "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v11    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v15, "too_high":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v26    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v27    # "divider_exponent":I
    .restart local v29    # "divider":I
    .restart local v30    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v31    # "too_low":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    :goto_1
    const-wide/16 v1, 0x5

    mul-long v16, v16, v1

    .line 409
    mul-long/2addr v13, v1

    .line 410
    invoke-virtual/range {v26 .. v26}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v7

    mul-long/2addr v7, v1

    move-object/from16 v10, v26

    .end local v26    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v10, "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-virtual {v10, v7, v8}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setF(J)V

    .line 411
    invoke-virtual {v10}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-virtual {v10, v1}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setE(I)V

    .line 412
    invoke-virtual/range {v30 .. v30}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v7

    ushr-long/2addr v7, v2

    move-object/from16 v11, v30

    .end local v30    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v11, "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-virtual {v11, v7, v8}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setF(J)V

    .line 413
    invoke-virtual {v11}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v1

    add-int/2addr v1, v2

    invoke-virtual {v11, v1}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setE(I)V

    .line 415
    invoke-virtual {v11}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v1

    neg-int v1, v1

    ushr-long v1, v16, v1

    and-long/2addr v1, v5

    long-to-int v8, v1

    .line 416
    .local v8, "digit":I
    add-int/lit8 v1, v8, 0x30

    int-to-char v1, v1

    invoke-virtual {v12, v1}, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->append(C)V

    .line 417
    invoke-virtual {v11}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v1

    const-wide/16 v21, 0x1

    sub-long v1, v1, v21

    and-long v16, v16, v1

    .line 418
    add-int/lit8 v23, v3, -0x1

    .line 419
    .end local v3    # "kappa":I
    .local v23, "kappa":I
    invoke-virtual {v10}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v1

    cmp-long v1, v16, v1

    if-gez v1, :cond_2

    .line 420
    iget v1, v12, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->end:I

    sub-int v1, v1, p4

    add-int v1, v1, v23

    iput v1, v12, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->point:I

    .line 421
    invoke-static {v15, v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->minus(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v1

    mul-long v2, v1, v13

    .line 422
    invoke-virtual {v10}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v4

    invoke-virtual {v11}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v21

    .line 421
    move-object/from16 v1, p3

    move-wide/from16 v6, v16

    move/from16 v24, v8

    .end local v8    # "digit":I
    .local v24, "digit":I
    move-wide/from16 v8, v21

    move-object/from16 v25, v10

    move-object/from16 v26, v11

    .end local v10    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v11    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v25, "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .local v26, "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    move-wide v10, v13

    invoke-static/range {v1 .. v11}, Lcom/trendmicro/hippo/v8dtoa/FastDtoa;->roundWeed(Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;JJJJJ)Z

    move-result v1

    return v1

    .line 419
    .end local v24    # "digit":I
    .end local v25    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v26    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v8    # "digit":I
    .restart local v10    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v11    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    :cond_2
    move/from16 v24, v8

    move-object/from16 v25, v10

    move-object/from16 v26, v11

    .line 424
    .end local v8    # "digit":I
    .end local v10    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .end local v11    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v25    # "unsafe_interval":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .restart local v26    # "one":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    move/from16 v3, v23

    move-object/from16 v30, v26

    move-object/from16 v26, v25

    goto/16 :goto_1
.end method

.method public static dtoa(DLcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;)Z
    .locals 1
    .param p0, "v"    # D
    .param p2, "buffer"    # Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;

    .line 488
    nop

    .line 489
    nop

    .line 490
    nop

    .line 492
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/v8dtoa/FastDtoa;->grisu3(DLcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;)Z

    move-result v0

    return v0
.end method

.method static grisu3(DLcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;)Z
    .locals 11
    .param p0, "v"    # D
    .param p2, "buffer"    # Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;

    .line 440
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 441
    .local v0, "bits":J
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;->asNormalizedDiyFp(J)Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    move-result-object v2

    .line 446
    .local v2, "w":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    new-instance v3, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    invoke-direct {v3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>()V

    .local v3, "boundary_minus":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    new-instance v4, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    invoke-direct {v4}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>()V

    .line 447
    .local v4, "boundary_plus":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-static {v0, v1, v3, v4}, Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;->normalizedBoundaries(JLcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)V

    .line 448
    nop

    .line 449
    new-instance v5, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    invoke-direct {v5}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>()V

    .line 450
    .local v5, "ten_mk":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v6

    add-int/lit8 v6, v6, 0x40

    const/16 v7, -0x3c

    const/16 v8, -0x20

    invoke-static {v6, v7, v8, v5}, Lcom/trendmicro/hippo/v8dtoa/CachedPowers;->getCachedPower(IIILcom/trendmicro/hippo/v8dtoa/DiyFp;)I

    move-result v6

    .line 452
    .local v6, "mk":I
    nop

    .line 465
    invoke-static {v2, v5}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->times(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    move-result-object v7

    .line 466
    .local v7, "scaled_w":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    nop

    .line 473
    invoke-static {v3, v5}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->times(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    move-result-object v8

    .line 474
    .local v8, "scaled_boundary_minus":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-static {v4, v5}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->times(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    move-result-object v9

    .line 482
    .local v9, "scaled_boundary_plus":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-static {v8, v7, v9, p2, v6}, Lcom/trendmicro/hippo/v8dtoa/FastDtoa;->digitGen(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;I)Z

    move-result v10

    return v10
.end method

.method public static numberToString(D)Ljava/lang/String;
    .locals 2
    .param p0, "v"    # D

    .line 496
    new-instance v0, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;

    invoke-direct {v0}, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;-><init>()V

    .line 497
    .local v0, "buffer":Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;
    invoke-static {p0, p1, v0}, Lcom/trendmicro/hippo/v8dtoa/FastDtoa;->numberToString(DLcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->format()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public static numberToString(DLcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;)Z
    .locals 2
    .param p0, "v"    # D
    .param p2, "buffer"    # Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;

    .line 501
    invoke-virtual {p2}, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->reset()V

    .line 502
    const-wide/16 v0, 0x0

    cmpg-double v0, p0, v0

    if-gez v0, :cond_0

    .line 503
    const/16 v0, 0x2d

    invoke-virtual {p2, v0}, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->append(C)V

    .line 504
    neg-double p0, p0

    .line 506
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/v8dtoa/FastDtoa;->dtoa(DLcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;)Z

    move-result v0

    return v0
.end method

.method static roundWeed(Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;JJJJJ)Z
    .locals 12
    .param p0, "buffer"    # Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;
    .param p1, "distance_too_high_w"    # J
    .param p3, "unsafe_interval"    # J
    .param p5, "rest"    # J
    .param p7, "ten_kappa"    # J
    .param p9, "unit"    # J

    .line 69
    sub-long v0, p1, p9

    .line 70
    .local v0, "small_distance":J
    add-long v2, p1, p9

    move-wide/from16 v4, p5

    .line 140
    .end local p5    # "rest":J
    .local v2, "big_distance":J
    .local v4, "rest":J
    :goto_0
    cmp-long v6, v4, v0

    if-gez v6, :cond_1

    sub-long v6, p3, v4

    cmp-long v6, v6, p7

    if-ltz v6, :cond_1

    add-long v6, v4, p7

    cmp-long v6, v6, v0

    if-ltz v6, :cond_0

    sub-long v6, v0, v4

    add-long v8, v4, p7

    sub-long/2addr v8, v0

    cmp-long v6, v6, v8

    if-ltz v6, :cond_1

    .line 144
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/v8dtoa/FastDtoaBuilder;->decreaseLast()V

    .line 145
    add-long v4, v4, p7

    goto :goto_0

    .line 151
    :cond_1
    cmp-long v6, v4, v2

    const/4 v7, 0x0

    if-gez v6, :cond_3

    sub-long v8, p3, v4

    cmp-long v6, v8, p7

    if-ltz v6, :cond_3

    add-long v8, v4, p7

    cmp-long v6, v8, v2

    if-ltz v6, :cond_2

    sub-long v8, v2, v4

    add-long v10, v4, p7

    sub-long/2addr v10, v2

    cmp-long v6, v8, v10

    if-lez v6, :cond_3

    .line 155
    :cond_2
    return v7

    .line 163
    :cond_3
    const-wide/16 v8, 0x2

    mul-long v8, v8, p9

    cmp-long v6, v8, v4

    if-gtz v6, :cond_4

    const-wide/16 v8, 0x4

    mul-long v8, v8, p9

    sub-long v8, p3, v8

    cmp-long v6, v4, v8

    if-gtz v6, :cond_4

    const/4 v7, 0x1

    :cond_4
    return v7
.end method

.method private static uint64_lte(JJ)Z
    .locals 6
    .param p0, "a"    # J
    .param p2, "b"    # J

    .line 281
    cmp-long v0, p0, p2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    cmp-long v0, p0, p2

    if-gez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-wide/16 v3, 0x0

    cmp-long v5, p0, v3

    if-gez v5, :cond_1

    move v5, v2

    goto :goto_1

    :cond_1
    move v5, v1

    :goto_1
    xor-int/2addr v0, v5

    cmp-long v3, p2, v3

    if-gez v3, :cond_2

    move v3, v2

    goto :goto_2

    :cond_2
    move v3, v1

    :goto_2
    xor-int/2addr v0, v3

    if-eqz v0, :cond_4

    :cond_3
    move v1, v2

    :cond_4
    return v1
.end method
