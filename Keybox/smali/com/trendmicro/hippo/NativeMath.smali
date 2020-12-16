.class final Lcom/trendmicro/hippo/NativeMath;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeMath.java"


# static fields
.field private static final Id_E:I = 0x25

.field private static final Id_LN10:I = 0x27

.field private static final Id_LN2:I = 0x28

.field private static final Id_LOG10E:I = 0x2a

.field private static final Id_LOG2E:I = 0x29

.field private static final Id_PI:I = 0x26

.field private static final Id_SQRT1_2:I = 0x2b

.field private static final Id_SQRT2:I = 0x2c

.field private static final Id_abs:I = 0x2

.field private static final Id_acos:I = 0x3

.field private static final Id_acosh:I = 0x1e

.field private static final Id_asin:I = 0x4

.field private static final Id_asinh:I = 0x1f

.field private static final Id_atan:I = 0x5

.field private static final Id_atan2:I = 0x6

.field private static final Id_atanh:I = 0x20

.field private static final Id_cbrt:I = 0x14

.field private static final Id_ceil:I = 0x7

.field private static final Id_clz32:I = 0x24

.field private static final Id_cos:I = 0x8

.field private static final Id_cosh:I = 0x15

.field private static final Id_exp:I = 0x9

.field private static final Id_expm1:I = 0x16

.field private static final Id_floor:I = 0xa

.field private static final Id_fround:I = 0x23

.field private static final Id_hypot:I = 0x17

.field private static final Id_imul:I = 0x1c

.field private static final Id_log:I = 0xb

.field private static final Id_log10:I = 0x19

.field private static final Id_log1p:I = 0x18

.field private static final Id_log2:I = 0x22

.field private static final Id_max:I = 0xc

.field private static final Id_min:I = 0xd

.field private static final Id_pow:I = 0xe

.field private static final Id_random:I = 0xf

.field private static final Id_round:I = 0x10

.field private static final Id_sign:I = 0x21

.field private static final Id_sin:I = 0x11

.field private static final Id_sinh:I = 0x1a

.field private static final Id_sqrt:I = 0x12

.field private static final Id_tan:I = 0x13

.field private static final Id_tanh:I = 0x1b

.field private static final Id_toSource:I = 0x1

.field private static final Id_trunc:I = 0x1d

.field private static final LAST_METHOD_ID:I = 0x24

.field private static final LOG2E:D = 1.4426950408889634

.field private static final MATH_TAG:Ljava/lang/Object;

.field private static final MAX_ID:I = 0x2c

.field private static final serialVersionUID:J = -0x7aa9e4af6da33631L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-string v0, "Math"

    sput-object v0, Lcom/trendmicro/hippo/NativeMath;->MATH_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 35
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 3
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 24
    new-instance v0, Lcom/trendmicro/hippo/NativeMath;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeMath;-><init>()V

    .line 25
    .local v0, "obj":Lcom/trendmicro/hippo/NativeMath;
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeMath;->activatePrototypeMap(I)V

    .line 26
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeMath;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeMath;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 27
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/NativeMath;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 28
    if-eqz p1, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeMath;->sealObject()V

    .line 29
    :cond_0
    const/4 v1, 0x2

    const-string v2, "Math"

    invoke-static {p0, v2, v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 31
    return-void
.end method

.method private static js_hypot([Ljava/lang/Object;)D
    .locals 11
    .param p0, "args"    # [Ljava/lang/Object;

    .line 424
    if-nez p0, :cond_0

    .line 425
    const-wide/16 v0, 0x0

    return-wide v0

    .line 427
    :cond_0
    const-wide/16 v0, 0x0

    .line 429
    .local v0, "y":D
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_4

    aget-object v4, p0, v3

    .line 430
    .local v4, "o":Ljava/lang/Object;
    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v5

    .line 431
    .local v5, "d":D
    sget-wide v7, Lcom/trendmicro/hippo/ScriptRuntime;->NaN:D

    cmpl-double v7, v5, v7

    if-nez v7, :cond_1

    .line 432
    return-wide v5

    .line 434
    :cond_1
    const-wide/high16 v7, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v9, v5, v7

    if-eqz v9, :cond_3

    const-wide/high16 v9, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v9, v5, v9

    if-nez v9, :cond_2

    goto :goto_1

    .line 437
    :cond_2
    mul-double v7, v5, v5

    add-double/2addr v0, v7

    .line 429
    .end local v4    # "o":Ljava/lang/Object;
    .end local v5    # "d":D
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 435
    .restart local v4    # "o":Ljava/lang/Object;
    .restart local v5    # "d":D
    :cond_3
    :goto_1
    return-wide v7

    .line 439
    .end local v4    # "o":Ljava/lang/Object;
    .end local v5    # "d":D
    :cond_4
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    return-wide v2
.end method

.method private static js_imul([Ljava/lang/Object;)I
    .locals 3
    .param p0, "args"    # [Ljava/lang/Object;

    .line 450
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 451
    return v0

    .line 454
    :cond_0
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32([Ljava/lang/Object;I)I

    move-result v0

    .line 455
    .local v0, "x":I
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32([Ljava/lang/Object;I)I

    move-result v1

    .line 456
    .local v1, "y":I
    mul-int v2, v0, v1

    return v2
.end method

.method private static js_pow(DD)D
    .locals 21
    .param p0, "x"    # D
    .param p2, "y"    # D

    .line 369
    move-wide/from16 v0, p2

    cmpl-double v2, v0, v0

    if-eqz v2, :cond_0

    .line 371
    move-wide/from16 v2, p2

    .local v2, "result":D
    goto/16 :goto_6

    .line 372
    .end local v2    # "result":D
    :cond_0
    const-wide/16 v2, 0x0

    cmpl-double v4, v0, v2

    if-nez v4, :cond_1

    .line 374
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .restart local v2    # "result":D
    goto/16 :goto_6

    .line 375
    .end local v2    # "result":D
    :cond_1
    cmpl-double v4, p0, v2

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x1

    const-wide/high16 v11, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v15, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    if-nez v4, :cond_7

    .line 377
    div-double v13, v13, p0

    cmpl-double v4, v13, v2

    if-lez v4, :cond_3

    .line 378
    cmpl-double v4, v0, v2

    if-lez v4, :cond_2

    goto :goto_0

    :cond_2
    move-wide v2, v15

    .restart local v2    # "result":D
    :goto_0
    goto/16 :goto_6

    .line 381
    .end local v2    # "result":D
    :cond_3
    double-to-long v13, v0

    .line 382
    .local v13, "y_long":J
    long-to-double v5, v13

    cmpl-double v4, v5, v0

    if-nez v4, :cond_5

    and-long v4, v13, v9

    cmp-long v4, v4, v7

    if-eqz v4, :cond_5

    .line 383
    cmpl-double v2, v0, v2

    if-lez v2, :cond_4

    const-wide/high16 v5, -0x8000000000000000L

    goto :goto_1

    :cond_4
    move-wide v5, v11

    :goto_1
    move-wide v2, v5

    .restart local v2    # "result":D
    goto :goto_2

    .line 385
    .end local v2    # "result":D
    :cond_5
    cmpl-double v4, v0, v2

    if-lez v4, :cond_6

    goto :goto_2

    :cond_6
    move-wide v2, v15

    .line 387
    .end local v13    # "y_long":J
    .restart local v2    # "result":D
    :goto_2
    goto/16 :goto_6

    .line 389
    .end local v2    # "result":D
    :cond_7
    invoke-static/range {p0 .. p3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    .line 390
    .local v4, "result":D
    cmpl-double v6, v4, v4

    if-eqz v6, :cond_13

    .line 393
    cmpl-double v6, v0, v15

    const-wide/high16 v19, -0x4010000000000000L    # -1.0

    if-nez v6, :cond_a

    .line 394
    cmpg-double v2, p0, v19

    if-ltz v2, :cond_9

    cmpg-double v2, v13, p0

    if-gez v2, :cond_8

    goto :goto_3

    .line 396
    :cond_8
    cmpg-double v2, v19, p0

    if-gez v2, :cond_13

    cmpg-double v2, p0, v13

    if-gez v2, :cond_13

    .line 397
    const-wide/16 v2, 0x0

    .end local v4    # "result":D
    .restart local v2    # "result":D
    goto :goto_6

    .line 395
    .end local v2    # "result":D
    .restart local v4    # "result":D
    :cond_9
    :goto_3
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .end local v4    # "result":D
    .restart local v2    # "result":D
    goto :goto_6

    .line 399
    .end local v2    # "result":D
    .restart local v4    # "result":D
    :cond_a
    cmpl-double v6, v0, v11

    if-nez v6, :cond_d

    .line 400
    cmpg-double v2, p0, v19

    if-ltz v2, :cond_c

    cmpg-double v2, v13, p0

    if-gez v2, :cond_b

    goto :goto_4

    .line 402
    :cond_b
    cmpg-double v2, v19, p0

    if-gez v2, :cond_13

    cmpg-double v2, p0, v13

    if-gez v2, :cond_13

    .line 403
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .end local v4    # "result":D
    .restart local v2    # "result":D
    goto :goto_6

    .line 401
    .end local v2    # "result":D
    .restart local v4    # "result":D
    :cond_c
    :goto_4
    const-wide/16 v2, 0x0

    .end local v4    # "result":D
    .restart local v2    # "result":D
    goto :goto_6

    .line 405
    .end local v2    # "result":D
    .restart local v4    # "result":D
    :cond_d
    cmpl-double v6, p0, v15

    if-nez v6, :cond_f

    .line 406
    cmpl-double v6, v0, v2

    if-lez v6, :cond_e

    move-wide v2, v15

    .end local v4    # "result":D
    .restart local v2    # "result":D
    :cond_e
    goto :goto_6

    .line 407
    .end local v2    # "result":D
    .restart local v4    # "result":D
    :cond_f
    cmpl-double v6, p0, v11

    if-nez v6, :cond_13

    .line 408
    double-to-long v13, v0

    .line 409
    .restart local v13    # "y_long":J
    long-to-double v11, v13

    cmpl-double v6, v11, v0

    if-nez v6, :cond_11

    and-long/2addr v9, v13

    cmp-long v6, v9, v7

    if-eqz v6, :cond_11

    .line 411
    cmpl-double v2, v0, v2

    if-lez v2, :cond_10

    const-wide/high16 v17, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    goto :goto_5

    :cond_10
    const-wide/high16 v17, -0x8000000000000000L

    :goto_5
    move-wide/from16 v2, v17

    .end local v4    # "result":D
    .restart local v2    # "result":D
    goto :goto_6

    .line 413
    .end local v2    # "result":D
    .restart local v4    # "result":D
    :cond_11
    cmpl-double v6, v0, v2

    if-lez v6, :cond_12

    move-wide v2, v15

    .end local v4    # "result":D
    .restart local v2    # "result":D
    :cond_12
    goto :goto_6

    .line 418
    .end local v2    # "result":D
    .end local v13    # "y_long":J
    .restart local v4    # "result":D
    :cond_13
    move-wide v2, v4

    .end local v4    # "result":D
    .restart local v2    # "result":D
    :goto_6
    return-wide v2
.end method

.method private static js_trunc(D)D
    .locals 2
    .param p0, "d"    # D

    .line 444
    const-wide/16 v0, 0x0

    cmpg-double v0, p0, v0

    if-gez v0, :cond_0

    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    goto :goto_0

    :cond_0
    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    :goto_0
    return-wide v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 22
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 109
    move-object/from16 v0, p5

    sget-object v1, Lcom/trendmicro/hippo/NativeMath;->MATH_TAG:Ljava/lang/Object;

    move-object/from16 v2, p1

    invoke-virtual {v2, v1}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 110
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 113
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v1

    .line 114
    .local v1, "methodId":I
    const-wide/16 v3, 0x0

    const-wide v5, 0x3ff71547652b82feL    # 1.4426950408889634

    const-wide/high16 v7, -0x4010000000000000L    # -1.0

    const-wide/high16 v9, -0x8000000000000000L

    const-wide/high16 v12, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    const-wide/high16 v14, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    const-wide/high16 v16, 0x7ff8000000000000L    # Double.NaN

    const-wide/high16 v18, 0x3ff0000000000000L    # 1.0

    const-wide/16 v20, 0x0

    const/4 v11, 0x0

    packed-switch v1, :pswitch_data_0

    .line 361
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 192
    :pswitch_0
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v7

    .line 193
    .local v7, "x":D
    cmpl-double v9, v7, v20

    const/16 v10, 0x20

    if-eqz v9, :cond_3

    cmpl-double v9, v7, v7

    if-nez v9, :cond_3

    cmpl-double v9, v7, v14

    if-eqz v9, :cond_3

    cmpl-double v9, v7, v12

    if-nez v9, :cond_1

    goto :goto_0

    .line 199
    :cond_1
    invoke-static {v7, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(D)J

    move-result-wide v12

    .line 200
    .local v12, "n":J
    cmp-long v3, v12, v3

    if-nez v3, :cond_2

    .line 201
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    return-object v3

    .line 203
    :cond_2
    const-wide/high16 v3, 0x403f000000000000L    # 31.0

    ushr-long v9, v12, v11

    long-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Math;->log(D)D

    move-result-wide v9

    mul-double/2addr v9, v5

    invoke-static {v9, v10}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    sub-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    return-object v3

    .line 197
    .end local v12    # "n":J
    :cond_3
    :goto_0
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    return-object v3

    .line 239
    .end local v7    # "x":D
    :pswitch_1
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 240
    .local v3, "x":D
    double-to-float v5, v3

    float-to-double v3, v5

    .line 241
    goto/16 :goto_10

    .line 263
    .end local v3    # "x":D
    :pswitch_2
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 265
    .restart local v3    # "x":D
    cmpg-double v7, v3, v20

    if-gez v7, :cond_4

    goto :goto_1

    :cond_4
    invoke-static {v3, v4}, Ljava/lang/Math;->log(D)D

    move-result-wide v7

    mul-double v16, v7, v5

    :goto_1
    move-wide/from16 v3, v16

    .line 266
    goto/16 :goto_10

    .line 317
    .end local v3    # "x":D
    :pswitch_3
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 318
    .restart local v3    # "x":D
    cmpl-double v5, v3, v3

    if-nez v5, :cond_7

    .line 319
    cmpl-double v5, v3, v20

    if-nez v5, :cond_6

    .line 320
    div-double v18, v18, v3

    cmpl-double v5, v18, v20

    if-lez v5, :cond_5

    .line 321
    invoke-static/range {v20 .. v21}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 323
    :cond_5
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 325
    :cond_6
    invoke-static {v3, v4}, Ljava/lang/Math;->signum(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 327
    :cond_7
    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 164
    .end local v3    # "x":D
    :pswitch_4
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 165
    .restart local v3    # "x":D
    cmpl-double v5, v3, v3

    if-nez v5, :cond_a

    cmpg-double v5, v7, v3

    if-gtz v5, :cond_a

    cmpg-double v5, v3, v18

    if-gtz v5, :cond_a

    .line 166
    cmpl-double v5, v3, v20

    if-nez v5, :cond_9

    .line 167
    div-double v18, v18, v3

    cmpl-double v5, v18, v20

    if-lez v5, :cond_8

    .line 168
    invoke-static/range {v20 .. v21}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 170
    :cond_8
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 172
    :cond_9
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    add-double v7, v3, v18

    sub-double v9, v3, v18

    div-double/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->log(D)D

    move-result-wide v7

    mul-double/2addr v7, v5

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 174
    :cond_a
    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 142
    .end local v3    # "x":D
    :pswitch_5
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 143
    .restart local v3    # "x":D
    cmpl-double v5, v3, v14

    if-eqz v5, :cond_f

    cmpl-double v5, v3, v12

    if-nez v5, :cond_b

    goto :goto_2

    .line 147
    :cond_b
    cmpl-double v5, v3, v3

    if-nez v5, :cond_e

    .line 148
    cmpl-double v5, v3, v20

    if-nez v5, :cond_d

    .line 149
    div-double v18, v18, v3

    cmpl-double v5, v18, v20

    if-lez v5, :cond_c

    .line 150
    invoke-static/range {v20 .. v21}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 152
    :cond_c
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 154
    :cond_d
    mul-double v5, v3, v3

    add-double v5, v5, v18

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    add-double/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->log(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 156
    :cond_e
    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 145
    :cond_f
    :goto_2
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 135
    .end local v3    # "x":D
    :pswitch_6
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 136
    .restart local v3    # "x":D
    cmpl-double v5, v3, v3

    if-nez v5, :cond_10

    .line 137
    mul-double v5, v3, v3

    sub-double v5, v5, v18

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    add-double/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Math;->log(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 139
    :cond_10
    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    return-object v5

    .line 357
    .end local v3    # "x":D
    :pswitch_7
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 358
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Lcom/trendmicro/hippo/NativeMath;->js_trunc(D)D

    move-result-wide v3

    .line 359
    goto/16 :goto_10

    .line 244
    .end local v3    # "x":D
    :pswitch_8
    invoke-static/range {p5 .. p5}, Lcom/trendmicro/hippo/NativeMath;->js_imul([Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    return-object v3

    .line 352
    :pswitch_9
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 353
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->tanh(D)D

    move-result-wide v3

    .line 354
    goto/16 :goto_10

    .line 337
    .end local v3    # "x":D
    :pswitch_a
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 338
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v3

    .line 339
    goto/16 :goto_10

    .line 258
    .end local v3    # "x":D
    :pswitch_b
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 259
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->log10(D)D

    move-result-wide v3

    .line 260
    goto/16 :goto_10

    .line 253
    .end local v3    # "x":D
    :pswitch_c
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 254
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->log1p(D)D

    move-result-wide v3

    .line 255
    goto/16 :goto_10

    .line 218
    .end local v3    # "x":D
    :pswitch_d
    invoke-static/range {p5 .. p5}, Lcom/trendmicro/hippo/NativeMath;->js_hypot([Ljava/lang/Object;)D

    move-result-wide v3

    .line 219
    .restart local v3    # "x":D
    goto/16 :goto_10

    .line 229
    .end local v3    # "x":D
    :pswitch_e
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 230
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->expm1(D)D

    move-result-wide v3

    .line 231
    goto/16 :goto_10

    .line 213
    .end local v3    # "x":D
    :pswitch_f
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 214
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->cosh(D)D

    move-result-wide v3

    .line 215
    goto/16 :goto_10

    .line 182
    .end local v3    # "x":D
    :pswitch_10
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 183
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v3

    .line 184
    goto/16 :goto_10

    .line 347
    .end local v3    # "x":D
    :pswitch_11
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 348
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->tan(D)D

    move-result-wide v3

    .line 349
    goto/16 :goto_10

    .line 342
    .end local v3    # "x":D
    :pswitch_12
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 343
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    .line 344
    goto/16 :goto_10

    .line 330
    .end local v3    # "x":D
    :pswitch_13
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 331
    .restart local v3    # "x":D
    cmpl-double v5, v3, v14

    if-eqz v5, :cond_12

    cmpl-double v5, v3, v12

    if-nez v5, :cond_11

    goto :goto_3

    .line 333
    :cond_11
    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v16

    goto :goto_4

    :cond_12
    :goto_3
    nop

    :goto_4
    move-wide/from16 v3, v16

    .line 334
    goto/16 :goto_10

    .line 297
    .end local v3    # "x":D
    :pswitch_14
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v5

    .line 298
    .local v5, "x":D
    cmpl-double v7, v5, v5

    if-nez v7, :cond_16

    cmpl-double v7, v5, v14

    if-eqz v7, :cond_16

    cmpl-double v7, v5, v12

    if-eqz v7, :cond_16

    .line 302
    invoke-static {v5, v6}, Ljava/lang/Math;->round(D)J

    move-result-wide v7

    .line 303
    .local v7, "l":J
    cmp-long v3, v7, v3

    if-eqz v3, :cond_13

    .line 304
    long-to-double v3, v7

    .end local v5    # "x":D
    .restart local v3    # "x":D
    goto :goto_5

    .line 307
    .end local v3    # "x":D
    .restart local v5    # "x":D
    :cond_13
    cmpg-double v3, v5, v20

    if-gez v3, :cond_14

    .line 308
    sget-wide v3, Lcom/trendmicro/hippo/ScriptRuntime;->negativeZero:D

    .end local v5    # "x":D
    .restart local v3    # "x":D
    goto :goto_5

    .line 309
    .end local v3    # "x":D
    .restart local v5    # "x":D
    :cond_14
    cmpl-double v3, v5, v20

    if-eqz v3, :cond_15

    .line 310
    const-wide/16 v3, 0x0

    .end local v5    # "x":D
    .restart local v3    # "x":D
    goto :goto_5

    .line 309
    .end local v3    # "x":D
    .restart local v5    # "x":D
    :cond_15
    move-wide v3, v5

    .line 313
    .end local v5    # "x":D
    .end local v7    # "l":J
    .restart local v3    # "x":D
    :goto_5
    goto/16 :goto_10

    .line 363
    .end local v3    # "x":D
    .restart local v5    # "x":D
    :cond_16
    move-wide v3, v5

    goto/16 :goto_10

    .line 293
    .end local v5    # "x":D
    :pswitch_15
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v3

    .line 294
    .restart local v3    # "x":D
    goto/16 :goto_10

    .line 288
    .end local v3    # "x":D
    :pswitch_16
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 289
    .restart local v3    # "x":D
    const/4 v5, 0x1

    invoke-static {v0, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Lcom/trendmicro/hippo/NativeMath;->js_pow(DD)D

    move-result-wide v3

    .line 290
    goto/16 :goto_10

    .line 270
    .end local v3    # "x":D
    :pswitch_17
    const/16 v3, 0xc

    if-ne v1, v3, :cond_17

    .line 271
    goto :goto_6

    :cond_17
    move-wide v12, v14

    :goto_6
    move-wide v4, v12

    .line 272
    .local v4, "x":D
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_7
    array-length v7, v0

    if-eq v6, v7, :cond_1a

    .line 273
    aget-object v7, v0, v6

    invoke-static {v7}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v7

    .line 274
    .local v7, "d":D
    cmpl-double v9, v7, v7

    if-eqz v9, :cond_18

    .line 275
    move-wide v3, v7

    .line 276
    .end local v4    # "x":D
    .restart local v3    # "x":D
    goto :goto_9

    .line 278
    .end local v3    # "x":D
    .restart local v4    # "x":D
    :cond_18
    if-ne v1, v3, :cond_19

    .line 280
    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    goto :goto_8

    .line 282
    :cond_19
    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    .line 272
    .end local v7    # "d":D
    :goto_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    :cond_1a
    move-wide v3, v4

    .line 285
    .end local v4    # "x":D
    .end local v6    # "i":I
    .restart local v3    # "x":D
    :goto_9
    goto/16 :goto_10

    .line 247
    .end local v3    # "x":D
    :pswitch_18
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 249
    .restart local v3    # "x":D
    cmpg-double v5, v3, v20

    if-gez v5, :cond_1b

    goto :goto_a

    :cond_1b
    invoke-static {v3, v4}, Ljava/lang/Math;->log(D)D

    move-result-wide v16

    :goto_a
    move-wide/from16 v3, v16

    .line 250
    goto/16 :goto_10

    .line 234
    .end local v3    # "x":D
    :pswitch_19
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 235
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide v3

    .line 236
    goto/16 :goto_10

    .line 222
    .end local v3    # "x":D
    :pswitch_1a
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 223
    .restart local v3    # "x":D
    cmpl-double v5, v3, v14

    if-nez v5, :cond_1c

    move-wide/from16 v20, v3

    goto :goto_b

    .line 224
    :cond_1c
    cmpl-double v5, v3, v12

    if-nez v5, :cond_1d

    goto :goto_b

    .line 225
    :cond_1d
    invoke-static {v3, v4}, Ljava/lang/Math;->exp(D)D

    move-result-wide v20

    :goto_b
    move-wide/from16 v3, v20

    .line 226
    goto/16 :goto_10

    .line 206
    .end local v3    # "x":D
    :pswitch_1b
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 207
    .restart local v3    # "x":D
    cmpl-double v5, v3, v14

    if-eqz v5, :cond_1f

    cmpl-double v5, v3, v12

    if-nez v5, :cond_1e

    goto :goto_c

    .line 209
    :cond_1e
    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v16

    goto :goto_d

    :cond_1f
    :goto_c
    nop

    :goto_d
    move-wide/from16 v3, v16

    .line 210
    goto :goto_10

    .line 187
    .end local v3    # "x":D
    :pswitch_1c
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 188
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    .line 189
    goto :goto_10

    .line 177
    .end local v3    # "x":D
    :pswitch_1d
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 178
    .restart local v3    # "x":D
    const/4 v5, 0x1

    invoke-static {v0, v5}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v3

    .line 179
    goto :goto_10

    .line 159
    .end local v3    # "x":D
    :pswitch_1e
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 160
    .restart local v3    # "x":D
    invoke-static {v3, v4}, Ljava/lang/Math;->atan(D)D

    move-result-wide v3

    .line 161
    goto :goto_10

    .line 126
    .end local v3    # "x":D
    :pswitch_1f
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 127
    .restart local v3    # "x":D
    cmpl-double v5, v3, v3

    if-nez v5, :cond_21

    cmpg-double v5, v7, v3

    if-gtz v5, :cond_21

    cmpg-double v5, v3, v18

    if-gtz v5, :cond_21

    .line 128
    const/4 v5, 0x3

    if-ne v1, v5, :cond_20

    invoke-static {v3, v4}, Ljava/lang/Math;->acos(D)D

    move-result-wide v5

    goto :goto_e

    :cond_20
    invoke-static {v3, v4}, Ljava/lang/Math;->asin(D)D

    move-result-wide v5

    :goto_e
    move-wide v3, v5

    goto :goto_10

    .line 130
    :cond_21
    const-wide/high16 v3, 0x7ff8000000000000L    # Double.NaN

    .line 132
    goto :goto_10

    .line 119
    .end local v3    # "x":D
    :pswitch_20
    invoke-static {v0, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v3

    .line 121
    .restart local v3    # "x":D
    cmpl-double v5, v3, v20

    if-nez v5, :cond_22

    goto :goto_f

    :cond_22
    cmpg-double v5, v3, v20

    if-gez v5, :cond_23

    neg-double v5, v3

    move-wide/from16 v20, v5

    goto :goto_f

    :cond_23
    move-wide/from16 v20, v3

    :goto_f
    move-wide/from16 v3, v20

    .line 122
    nop

    .line 363
    :goto_10
    invoke-static {v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    return-object v5

    .line 116
    .end local v3    # "x":D
    :pswitch_21
    const-string v3, "Math"

    return-object v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_17
        :pswitch_16
        :pswitch_15
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
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 16
    .param p1, "s"    # Ljava/lang/String;

    .line 466
    move-object/from16 v0, p1

    const/4 v1, 0x0

    .local v1, "id":I
    const/4 v2, 0x0

    .line 467
    .local v2, "X":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x66

    const/16 v5, 0x72

    const/16 v11, 0x6c

    const/16 v12, 0x70

    const/16 v13, 0x65

    const/16 v14, 0x4c

    const/16 v15, 0x68

    const/16 v8, 0x74

    const/16 v7, 0x63

    const/16 v6, 0x61

    const/4 v9, 0x0

    const/4 v10, 0x2

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_0

    .line 532
    :pswitch_0
    const-string v2, "toSource"

    const/4 v1, 0x1

    goto/16 :goto_0

    .line 531
    :pswitch_1
    const-string v2, "SQRT1_2"

    const/16 v1, 0x2b

    goto/16 :goto_0

    .line 526
    :pswitch_2
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 527
    .local v3, "c":I
    if-ne v3, v14, :cond_0

    const-string v2, "LOG10E"

    const/16 v1, 0x2a

    goto/16 :goto_0

    .line 528
    :cond_0
    if-ne v3, v4, :cond_1

    const-string v2, "fround"

    const/16 v1, 0x23

    goto/16 :goto_0

    .line 529
    :cond_1
    if-ne v3, v5, :cond_24

    const-string v2, "random"

    const/16 v1, 0xf

    goto/16 :goto_0

    .line 503
    .end local v3    # "c":I
    :pswitch_3
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v14, :cond_f

    const/16 v9, 0x53

    if-eq v3, v9, :cond_e

    if-eq v3, v6, :cond_a

    if-eq v3, v7, :cond_9

    if-eq v3, v15, :cond_8

    if-eq v3, v11, :cond_6

    if-eq v3, v5, :cond_5

    if-eq v3, v8, :cond_4

    if-eq v3, v13, :cond_3

    if-eq v3, v4, :cond_2

    .line 525
    goto/16 :goto_0

    .line 517
    :cond_2
    const-string v2, "floor"

    const/16 v1, 0xa

    goto/16 :goto_0

    .line 516
    :cond_3
    const-string v2, "expm1"

    const/16 v1, 0x16

    goto/16 :goto_0

    .line 524
    :cond_4
    const-string v2, "trunc"

    const/16 v1, 0x1d

    goto/16 :goto_0

    .line 523
    :cond_5
    const-string v2, "round"

    const/16 v1, 0x10

    goto/16 :goto_0

    .line 519
    :cond_6
    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 520
    .restart local v3    # "c":I
    const/16 v4, 0x30

    if-ne v3, v4, :cond_7

    const-string v2, "log10"

    const/16 v1, 0x19

    goto/16 :goto_0

    .line 521
    :cond_7
    if-ne v3, v12, :cond_24

    const-string v2, "log1p"

    const/16 v1, 0x18

    goto/16 :goto_0

    .line 518
    .end local v3    # "c":I
    :cond_8
    const-string v2, "hypot"

    const/16 v1, 0x17

    goto/16 :goto_0

    .line 515
    :cond_9
    const-string v2, "clz32"

    const/16 v1, 0x24

    goto/16 :goto_0

    .line 506
    :cond_a
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 507
    .restart local v3    # "c":I
    if-ne v3, v7, :cond_b

    const-string v2, "acosh"

    const/16 v1, 0x1e

    goto/16 :goto_0

    .line 508
    :cond_b
    const/16 v4, 0x73

    if-ne v3, v4, :cond_c

    const-string v2, "asinh"

    const/16 v1, 0x1f

    goto/16 :goto_0

    .line 509
    :cond_c
    if-ne v3, v8, :cond_24

    .line 510
    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 511
    const/16 v4, 0x32

    if-ne v3, v4, :cond_d

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_24

    const/4 v4, 0x3

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x6e

    if-ne v4, v5, :cond_24

    const/4 v1, 0x6

    goto/16 :goto_1

    .line 512
    :cond_d
    if-ne v3, v15, :cond_24

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_24

    const/4 v4, 0x3

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x6e

    if-ne v4, v5, :cond_24

    const/16 v1, 0x20

    goto/16 :goto_1

    .line 505
    .end local v3    # "c":I
    :cond_e
    const-string v2, "SQRT2"

    const/16 v1, 0x2c

    goto/16 :goto_0

    .line 504
    :cond_f
    const-string v2, "LOG2E"

    const/16 v1, 0x29

    goto/16 :goto_0

    .line 484
    :pswitch_4
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x4e

    if-eq v3, v4, :cond_19

    if-eq v3, v13, :cond_18

    const/16 v4, 0x69

    if-eq v3, v4, :cond_16

    const/16 v4, 0x6d

    if-eq v3, v4, :cond_15

    const/16 v4, 0x6f

    if-eq v3, v4, :cond_13

    const/16 v4, 0x71

    if-eq v3, v4, :cond_12

    const/16 v4, 0x73

    if-eq v3, v4, :cond_11

    if-eq v3, v8, :cond_10

    packed-switch v3, :pswitch_data_1

    .line 502
    goto/16 :goto_0

    .line 488
    :pswitch_5
    const-string v2, "acos"

    const/4 v1, 0x3

    goto/16 :goto_0

    .line 487
    :pswitch_6
    const-string v2, "cbrt"

    const/16 v1, 0x14

    goto/16 :goto_0

    .line 486
    :pswitch_7
    const-string v2, "tanh"

    const/16 v1, 0x1b

    goto/16 :goto_0

    .line 501
    :cond_10
    const-string v2, "atan"

    const/4 v1, 0x5

    goto/16 :goto_0

    .line 500
    :cond_11
    const-string v2, "asin"

    const/4 v1, 0x4

    goto/16 :goto_0

    .line 499
    :cond_12
    const-string v2, "sqrt"

    const/16 v1, 0x12

    goto/16 :goto_0

    .line 495
    :cond_13
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 496
    .restart local v3    # "c":I
    if-ne v3, v7, :cond_14

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x73

    if-ne v4, v5, :cond_24

    const/4 v4, 0x3

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v15, :cond_24

    const/16 v1, 0x15

    goto/16 :goto_1

    .line 497
    :cond_14
    if-ne v3, v11, :cond_24

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x67

    if-ne v4, v5, :cond_24

    const/4 v4, 0x3

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x32

    if-ne v4, v5, :cond_24

    const/16 v1, 0x22

    goto/16 :goto_1

    .line 494
    .end local v3    # "c":I
    :cond_15
    const-string v2, "imul"

    const/16 v1, 0x1c

    goto/16 :goto_0

    .line 490
    :cond_16
    const/4 v3, 0x3

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 491
    .restart local v3    # "c":I
    if-ne v3, v15, :cond_17

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x73

    if-ne v4, v5, :cond_24

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x6e

    if-ne v4, v5, :cond_24

    const/16 v1, 0x1a

    goto/16 :goto_1

    .line 492
    :cond_17
    const/16 v5, 0x6e

    if-ne v3, v5, :cond_24

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x73

    if-ne v4, v5, :cond_24

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x67

    if-ne v4, v5, :cond_24

    const/16 v1, 0x21

    goto/16 :goto_1

    .line 489
    .end local v3    # "c":I
    :cond_18
    const-string v2, "ceil"

    const/4 v1, 0x7

    goto/16 :goto_0

    .line 485
    :cond_19
    const-string v2, "LN10"

    const/16 v1, 0x27

    goto/16 :goto_0

    .line 470
    :pswitch_8
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v3, v14, :cond_23

    if-eq v3, v6, :cond_22

    if-eq v3, v7, :cond_21

    if-eq v3, v13, :cond_20

    if-eq v3, v12, :cond_1f

    if-eq v3, v11, :cond_1e

    const/16 v4, 0x6d

    if-eq v3, v4, :cond_1c

    const/16 v4, 0x73

    if-eq v3, v4, :cond_1b

    if-eq v3, v8, :cond_1a

    .line 483
    goto/16 :goto_0

    .line 482
    :cond_1a
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x6e

    if-ne v3, v4, :cond_24

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_24

    const/16 v1, 0x13

    goto/16 :goto_1

    .line 481
    :cond_1b
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x6e

    if-ne v3, v4, :cond_24

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x69

    if-ne v3, v4, :cond_24

    const/16 v1, 0x11

    goto/16 :goto_1

    .line 476
    :cond_1c
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 477
    .restart local v3    # "c":I
    const/16 v4, 0x6e

    if-ne v3, v4, :cond_1d

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x69

    if-ne v4, v5, :cond_24

    const/16 v1, 0xd

    goto/16 :goto_1

    .line 478
    :cond_1d
    const/4 v4, 0x1

    const/16 v5, 0x78

    if-ne v3, v5, :cond_24

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_24

    const/16 v1, 0xc

    goto/16 :goto_1

    .line 475
    .end local v3    # "c":I
    :cond_1e
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x67

    if-ne v3, v4, :cond_24

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x6f

    if-ne v3, v4, :cond_24

    const/16 v1, 0xb

    goto/16 :goto_1

    .line 480
    :cond_1f
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x77

    if-ne v3, v4, :cond_24

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x6f

    if-ne v3, v4, :cond_24

    const/16 v1, 0xe

    goto/16 :goto_1

    .line 474
    :cond_20
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v12, :cond_24

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x78

    if-ne v3, v4, :cond_24

    const/16 v1, 0x9

    goto :goto_1

    .line 473
    :cond_21
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x73

    if-ne v3, v4, :cond_24

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x6f

    if-ne v3, v4, :cond_24

    const/16 v1, 0x8

    goto :goto_1

    .line 472
    :cond_22
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x73

    if-ne v3, v4, :cond_24

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x62

    if-ne v3, v4, :cond_24

    const/4 v1, 0x2

    goto :goto_1

    .line 471
    :cond_23
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x32

    if-ne v3, v4, :cond_24

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x4e

    if-ne v3, v4, :cond_24

    const/16 v1, 0x28

    goto :goto_1

    .line 469
    :pswitch_9
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x50

    if-ne v3, v4, :cond_24

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x49

    if-ne v3, v4, :cond_24

    const/16 v1, 0x26

    goto :goto_1

    .line 468
    :pswitch_a
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x45

    if-ne v3, v4, :cond_24

    const/16 v1, 0x25

    goto :goto_1

    .line 534
    :cond_24
    :goto_0
    if-eqz v2, :cond_25

    if-eq v2, v0, :cond_25

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_25

    const/4 v1, 0x0

    .line 538
    .end local v2    # "X":Ljava/lang/String;
    :cond_25
    :goto_1
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x61
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 38
    const-string v0, "Math"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 5
    .param p1, "id"    # I

    .line 43
    const/16 v0, 0x24

    if-gt p1, v0, :cond_0

    .line 46
    packed-switch p1, :pswitch_data_0

    .line 83
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "clz32"

    .local v1, "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 64
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "fround"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 70
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log2"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 76
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sign"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 54
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "atanh"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 52
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "asinh"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 50
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "acosh"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 82
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "trunc"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 66
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "imul"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 81
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "tanh"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 78
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sinh"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 69
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log10"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 68
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log1p"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 65
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_d
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "hypot"

    .restart local v1    # "name":Ljava/lang/String;
    goto/16 :goto_0

    .line 62
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "expm1"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 60
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_f
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "cosh"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 56
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_10
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "cbrt"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 80
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_11
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "tan"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 79
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_12
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sqrt"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 77
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_13
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sin"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 75
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_14
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "round"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 74
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_15
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "random"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 73
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "pow"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 72
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_17
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "min"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 71
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_18
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "max"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 67
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_19
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 63
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "floor"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 61
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "exp"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 59
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1c
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "cos"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 57
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "ceil"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 55
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "atan2"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 53
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1f
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "atan"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 51
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_20
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "asin"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 49
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_21
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "acos"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 48
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "abs"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 47
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_23
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .line 85
    .restart local v1    # "name":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeMath;->MATH_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeMath;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 86
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    goto :goto_2

    .line 89
    :cond_0
    packed-switch p1, :pswitch_data_1

    .line 98
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :pswitch_24
    const-wide v0, 0x3ff6a09e667f3bcdL    # 1.4142135623730951

    .local v0, "x":D
    const-string v2, "SQRT2"

    .local v2, "name":Ljava/lang/String;
    goto :goto_1

    .line 96
    .end local v0    # "x":D
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_25
    const-wide v0, 0x3fe6a09e667f3bcdL    # 0.7071067811865476

    .restart local v0    # "x":D
    const-string v2, "SQRT1_2"

    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_1

    .line 95
    .end local v0    # "x":D
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_26
    const-wide v0, 0x3fdbcb7b1526e50eL    # 0.4342944819032518

    .restart local v0    # "x":D
    const-string v2, "LOG10E"

    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_1

    .line 94
    .end local v0    # "x":D
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_27
    const-wide v0, 0x3ff71547652b82feL    # 1.4426950408889634

    .restart local v0    # "x":D
    const-string v2, "LOG2E"

    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_1

    .line 93
    .end local v0    # "x":D
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_28
    const-wide v0, 0x3fe62e42fefa39efL    # 0.6931471805599453

    .restart local v0    # "x":D
    const-string v2, "LN2"

    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_1

    .line 92
    .end local v0    # "x":D
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_29
    const-wide v0, 0x40026bb1bbb55516L    # 2.302585092994046

    .restart local v0    # "x":D
    const-string v2, "LN10"

    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_1

    .line 91
    .end local v0    # "x":D
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_2a
    const-wide v0, 0x400921fb54442d18L    # Math.PI

    .restart local v0    # "x":D
    const-string v2, "PI"

    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_1

    .line 90
    .end local v0    # "x":D
    .end local v2    # "name":Ljava/lang/String;
    :pswitch_2b
    const-wide v0, 0x4005bf0a8b145769L    # Math.E

    .restart local v0    # "x":D
    const-string v2, "E"

    .line 100
    .restart local v2    # "name":Ljava/lang/String;
    :goto_1
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    const/4 v4, 0x7

    invoke-virtual {p0, p1, v2, v3, v4}, Lcom/trendmicro/hippo/NativeMath;->initPrototypeValue(ILjava/lang/String;Ljava/lang/Object;I)V

    .line 103
    .end local v0    # "x":D
    .end local v2    # "name":Ljava/lang/String;
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
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
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x25
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
    .end packed-switch
.end method
