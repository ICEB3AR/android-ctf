.class final Lcom/trendmicro/hippo/NativeNumber;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeNumber.java"


# static fields
.field private static final ConstructorId_isFinite:I = -0x1

.field private static final ConstructorId_isInteger:I = -0x3

.field private static final ConstructorId_isNaN:I = -0x2

.field private static final ConstructorId_isSafeInteger:I = -0x4

.field private static final ConstructorId_parseFloat:I = -0x5

.field private static final ConstructorId_parseInt:I = -0x6

.field private static final Id_constructor:I = 0x1

.field private static final Id_toExponential:I = 0x7

.field private static final Id_toFixed:I = 0x6

.field private static final Id_toLocaleString:I = 0x3

.field private static final Id_toPrecision:I = 0x8

.field private static final Id_toSource:I = 0x4

.field private static final Id_toString:I = 0x2

.field private static final Id_valueOf:I = 0x5

.field private static final MAX_PRECISION:I = 0x64

.field private static final MAX_PROTOTYPE_ID:I = 0x8

.field public static final MAX_SAFE_INTEGER:D = 9.007199254740991E15

.field private static final MIN_SAFE_INTEGER:D = -9.007199254740991E15

.field private static final NUMBER_TAG:Ljava/lang/Object;

.field private static final serialVersionUID:J = 0x30a28b6f31d79da5L


# instance fields
.field private doubleValue:D


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    const-string v0, "Number"

    sput-object v0, Lcom/trendmicro/hippo/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(D)V
    .locals 0
    .param p1, "number"    # D

    .line 37
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 38
    iput-wide p1, p0, Lcom/trendmicro/hippo/NativeNumber;->doubleValue:D

    .line 39
    return-void
.end method

.method private doubleVal(Ljava/lang/Number;)Ljava/lang/Double;
    .locals 3
    .param p1, "val"    # Ljava/lang/Number;

    .line 317
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_0

    .line 318
    move-object v0, p1

    check-cast v0, Ljava/lang/Double;

    return-object v0

    .line 320
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 321
    .local v0, "d":D
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    return-object v2
.end method

.method private execConstructorCall(I[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "id"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .line 193
    const/4 v0, 0x0

    .line 224
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 193
    packed-switch p1, :pswitch_data_0

    .line 238
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :pswitch_0
    array-length v2, p2

    if-eqz v2, :cond_2

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aget-object v3, p2, v0

    if-ne v2, v3, :cond_0

    goto :goto_0

    .line 198
    :cond_0
    aget-object v2, p2, v0

    instance-of v2, v2, Ljava/lang/Number;

    if-eqz v2, :cond_1

    .line 200
    aget-object v0, p2, v0

    invoke-static {v0}, Lcom/trendmicro/hippo/NativeNumber;->isFinite(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 202
    :cond_1
    return-object v1

    .line 196
    :cond_2
    :goto_0
    return-object v1

    .line 205
    :pswitch_1
    array-length v2, p2

    if-eqz v2, :cond_5

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aget-object v3, p2, v0

    if-ne v2, v3, :cond_3

    goto :goto_1

    .line 208
    :cond_3
    aget-object v2, p2, v0

    instance-of v2, v2, Ljava/lang/Number;

    if-eqz v2, :cond_4

    .line 209
    aget-object v0, p2, v0

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/NativeNumber;->isNaN(Ljava/lang/Number;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 211
    :cond_4
    return-object v1

    .line 206
    :cond_5
    :goto_1
    return-object v1

    .line 214
    :pswitch_2
    array-length v2, p2

    if-eqz v2, :cond_8

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aget-object v3, p2, v0

    if-ne v2, v3, :cond_6

    goto :goto_2

    .line 217
    :cond_6
    aget-object v2, p2, v0

    instance-of v2, v2, Ljava/lang/Number;

    if-eqz v2, :cond_7

    .line 218
    aget-object v0, p2, v0

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/NativeNumber;->isInteger(Ljava/lang/Number;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 220
    :cond_7
    return-object v1

    .line 215
    :cond_8
    :goto_2
    return-object v1

    .line 223
    :pswitch_3
    array-length v2, p2

    if-eqz v2, :cond_b

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aget-object v3, p2, v0

    if-ne v2, v3, :cond_9

    goto :goto_3

    .line 226
    :cond_9
    aget-object v2, p2, v0

    instance-of v2, v2, Ljava/lang/Number;

    if-eqz v2, :cond_a

    .line 227
    aget-object v0, p2, v0

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/NativeNumber;->isSafeInteger(Ljava/lang/Number;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    .line 229
    :cond_a
    return-object v1

    .line 224
    :cond_b
    :goto_3
    return-object v1

    .line 232
    :pswitch_4
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeGlobal;->js_parseFloat([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 235
    :pswitch_5
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeGlobal;->js_parseInt([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch -0x6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 3
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 32
    new-instance v0, Lcom/trendmicro/hippo/NativeNumber;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/NativeNumber;-><init>(D)V

    .line 33
    .local v0, "obj":Lcom/trendmicro/hippo/NativeNumber;
    const/16 v1, 0x8

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeNumber;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 34
    return-void
.end method

.method private isDoubleInteger(Ljava/lang/Double;)Z
    .locals 4
    .param p1, "d"    # Ljava/lang/Double;

    .line 298
    invoke-virtual {p1}, Ljava/lang/Double;->isInfinite()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    if-nez v0, :cond_0

    .line 299
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    cmpl-double v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 298
    :goto_0
    return v0
.end method

.method private isDoubleNan(Ljava/lang/Double;)Z
    .locals 1
    .param p1, "d"    # Ljava/lang/Double;

    .line 287
    invoke-virtual {p1}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    return v0
.end method

.method private isDoubleSafeInteger(Ljava/lang/Double;)Z
    .locals 4
    .param p1, "d"    # Ljava/lang/Double;

    .line 310
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/NativeNumber;->isDoubleInteger(Ljava/lang/Double;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 311
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide v2, 0x433fffffffffffffL    # 9.007199254740991E15

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_0

    .line 312
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide v2, -0x3cc0000000000001L    # -9.007199254740991E15

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 310
    :goto_0
    return v0
.end method

.method static isFinite(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p0, "val"    # Ljava/lang/Object;

    .line 274
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 275
    .local v0, "d":D
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 276
    .local v2, "nd":Ljava/lang/Double;
    invoke-virtual {v2}, Ljava/lang/Double;->isInfinite()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Ljava/lang/Double;->isNaN()Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    return-object v3
.end method

.method private isInteger(Ljava/lang/Number;)Z
    .locals 2
    .param p1, "val"    # Ljava/lang/Number;

    .line 292
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/NativeNumber;->doubleVal(Ljava/lang/Number;)Ljava/lang/Double;

    move-result-object v0

    .line 293
    .local v0, "nd":Ljava/lang/Double;
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/NativeNumber;->isDoubleInteger(Ljava/lang/Double;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private isNaN(Ljava/lang/Number;)Ljava/lang/Object;
    .locals 2
    .param p1, "val"    # Ljava/lang/Number;

    .line 281
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/NativeNumber;->doubleVal(Ljava/lang/Number;)Ljava/lang/Double;

    move-result-object v0

    .line 282
    .local v0, "nd":Ljava/lang/Double;
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/NativeNumber;->isDoubleNan(Ljava/lang/Double;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method private isSafeInteger(Ljava/lang/Number;)Z
    .locals 2
    .param p1, "val"    # Ljava/lang/Number;

    .line 304
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/NativeNumber;->doubleVal(Ljava/lang/Number;)Ljava/lang/Double;

    move-result-object v0

    .line 305
    .local v0, "nd":Ljava/lang/Double;
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/NativeNumber;->isDoubleSafeInteger(Ljava/lang/Double;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private static num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;
    .locals 5
    .param p0, "val"    # D
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "zeroArgMode"    # I
    .param p4, "oneArgMode"    # I
    .param p5, "precisionMin"    # I
    .param p6, "precisionOffset"    # I

    .line 253
    array-length v0, p2

    if-nez v0, :cond_0

    .line 254
    const/4 v0, 0x0

    .line 255
    .local v0, "precision":I
    move p4, p3

    goto :goto_0

    .line 259
    .end local v0    # "precision":I
    :cond_0
    const/4 v0, 0x0

    aget-object v1, p2, v0

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v1

    .line 260
    .local v1, "p":D
    int-to-double v3, p5

    cmpg-double v3, v1, v3

    if-ltz v3, :cond_1

    const-wide/high16 v3, 0x4059000000000000L    # 100.0

    cmpl-double v3, v1, v3

    if-gtz v3, :cond_1

    .line 265
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(D)I

    move-result v0

    .line 267
    .end local v1    # "p":D
    .restart local v0    # "precision":I
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 268
    .local v1, "sb":Ljava/lang/StringBuilder;
    add-int v2, v0, p6

    invoke-static {v1, p4, v2, p0, p1}, Lcom/trendmicro/hippo/DToA;->JS_dtostr(Ljava/lang/StringBuilder;IID)V

    .line 269
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 261
    .end local v0    # "precision":I
    .local v1, "p":D
    :cond_1
    aget-object v0, p2, v0

    .line 262
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 261
    const-string v3, "msg.bad.precision"

    invoke-static {v3, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 263
    .local v0, "msg":Ljava/lang/String;
    const-string v3, "RangeError"

    invoke-static {v3, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 15
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 107
    move-object/from16 v0, p4

    move-object/from16 v8, p5

    sget-object v1, Lcom/trendmicro/hippo/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    move-object/from16 v9, p1

    invoke-virtual {v9, v1}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 108
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 110
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v10

    .line 111
    .local v10, "id":I
    const-wide/16 v1, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v10, v3, :cond_3

    .line 112
    array-length v5, v8

    if-lt v5, v3, :cond_1

    .line 113
    aget-object v1, v8, v4

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v1

    goto :goto_0

    :cond_1
    nop

    .line 114
    .local v1, "val":D
    :goto_0
    if-nez v0, :cond_2

    .line 116
    new-instance v3, Lcom/trendmicro/hippo/NativeNumber;

    invoke-direct {v3, v1, v2}, Lcom/trendmicro/hippo/NativeNumber;-><init>(D)V

    return-object v3

    .line 119
    :cond_2
    invoke-static {v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    return-object v3

    .line 121
    .end local v1    # "val":D
    :cond_3
    if-ge v10, v3, :cond_4

    .line 122
    move-object v11, p0

    invoke-direct {p0, v10, v8}, Lcom/trendmicro/hippo/NativeNumber;->execConstructorCall(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 127
    :cond_4
    move-object v11, p0

    instance-of v3, v0, Lcom/trendmicro/hippo/NativeNumber;

    if-eqz v3, :cond_f

    .line 129
    move-object v3, v0

    check-cast v3, Lcom/trendmicro/hippo/NativeNumber;

    iget-wide v12, v3, Lcom/trendmicro/hippo/NativeNumber;->doubleValue:D

    .line 131
    .local v12, "value":D
    const-string v3, "Infinity"

    const-string v5, "-Infinity"

    const-string v6, "NaN"

    const/16 v7, 0xa

    packed-switch v10, :pswitch_data_0

    .line 187
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 170
    :pswitch_0
    array-length v14, v8

    if-eqz v14, :cond_9

    aget-object v4, v8, v4

    sget-object v14, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v4, v14, :cond_5

    goto :goto_1

    .line 174
    :cond_5
    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 175
    return-object v6

    .line 177
    :cond_6
    invoke-static {v12, v13}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 178
    cmpl-double v1, v12, v1

    if-ltz v1, :cond_7

    .line 179
    return-object v3

    .line 181
    :cond_7
    return-object v5

    .line 183
    :cond_8
    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-wide v1, v12

    move-object/from16 v3, p5

    invoke-static/range {v1 .. v7}, Lcom/trendmicro/hippo/NativeNumber;->num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 171
    :cond_9
    :goto_1
    invoke-static {v12, v13, v7}, Lcom/trendmicro/hippo/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 154
    :pswitch_1
    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 155
    return-object v6

    .line 157
    :cond_a
    invoke-static {v12, v13}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 158
    cmpl-double v1, v12, v1

    if-ltz v1, :cond_b

    .line 159
    return-object v3

    .line 161
    :cond_b
    return-object v5

    .line 164
    :cond_c
    const/4 v4, 0x1

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-wide v1, v12

    move-object/from16 v3, p5

    invoke-static/range {v1 .. v7}, Lcom/trendmicro/hippo/NativeNumber;->num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 149
    :pswitch_2
    const/4 v4, 0x2

    const/4 v5, 0x2

    const/16 v6, -0x14

    const/4 v7, 0x0

    move-wide v1, v12

    move-object/from16 v3, p5

    invoke-static/range {v1 .. v7}, Lcom/trendmicro/hippo/NativeNumber;->num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 146
    :pswitch_3
    invoke-static {v12, v13}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    return-object v1

    .line 143
    :pswitch_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(new Number("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v12, v13}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "))"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 137
    :pswitch_5
    array-length v1, v8

    if-eqz v1, :cond_e

    aget-object v1, v8, v4

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v1, v2, :cond_d

    goto :goto_2

    .line 138
    :cond_d
    aget-object v1, v8, v4

    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v7

    goto :goto_3

    :cond_e
    :goto_2
    nop

    :goto_3
    move v1, v7

    .line 139
    .local v1, "base":I
    invoke-static {v12, v13, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 128
    .end local v1    # "base":I
    .end local v12    # "value":D
    :cond_f
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/NativeNumber;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 7
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 50
    const/4 v6, 0x7

    .line 54
    .local v6, "attr":I
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    const-string v1, "NaN"

    const/4 v2, 0x7

    invoke-virtual {p1, v1, v0, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 55
    nop

    .line 56
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 55
    const-string v1, "POSITIVE_INFINITY"

    invoke-virtual {p1, v1, v0, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 58
    nop

    .line 59
    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 58
    const-string v1, "NEGATIVE_INFINITY"

    invoke-virtual {p1, v1, v0, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 61
    nop

    .line 62
    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 61
    const-string v1, "MAX_VALUE"

    invoke-virtual {p1, v1, v0, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 64
    nop

    .line 65
    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 64
    const-string v1, "MIN_VALUE"

    invoke-virtual {p1, v1, v0, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 67
    nop

    .line 68
    const-wide v0, 0x433fffffffffffffL    # 9.007199254740991E15

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 67
    const-string v1, "MAX_SAFE_INTEGER"

    invoke-virtual {p1, v1, v0, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 70
    nop

    .line 71
    const-wide v0, -0x3cc0000000000001L    # -9.007199254740991E15

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 70
    const-string v1, "MIN_SAFE_INTEGER"

    invoke-virtual {p1, v1, v0, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 74
    sget-object v2, Lcom/trendmicro/hippo/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "isFinite"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeNumber;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 75
    sget-object v2, Lcom/trendmicro/hippo/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x2

    const-string v4, "isNaN"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeNumber;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 76
    sget-object v2, Lcom/trendmicro/hippo/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x3

    const-string v4, "isInteger"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeNumber;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 77
    sget-object v2, Lcom/trendmicro/hippo/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x4

    const-string v4, "isSafeInteger"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeNumber;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 78
    sget-object v2, Lcom/trendmicro/hippo/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x5

    const-string v4, "parseFloat"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeNumber;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 79
    sget-object v2, Lcom/trendmicro/hippo/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x6

    const-string v4, "parseInt"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeNumber;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 81
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 82
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .line 331
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 332
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x7

    const/4 v4, 0x0

    const/16 v5, 0x74

    if-eq v2, v3, :cond_6

    const/16 v3, 0x8

    if-eq v2, v3, :cond_4

    const/16 v3, 0xb

    if-eq v2, v3, :cond_2

    const/16 v3, 0xd

    if-eq v2, v3, :cond_1

    const/16 v3, 0xe

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 346
    :cond_0
    const-string v1, "toLocaleString"

    const/4 v0, 0x3

    goto :goto_0

    .line 345
    :cond_1
    const-string v1, "toExponential"

    const/4 v0, 0x7

    goto :goto_0

    .line 341
    :cond_2
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 342
    .local v2, "c":I
    const/16 v3, 0x63

    if-ne v2, v3, :cond_3

    const-string v1, "constructor"

    const/4 v0, 0x1

    goto :goto_0

    .line 343
    :cond_3
    if-ne v2, v5, :cond_8

    const-string v1, "toPrecision"

    const/16 v0, 0x8

    goto :goto_0

    .line 337
    .end local v2    # "c":I
    :cond_4
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 338
    .restart local v2    # "c":I
    const/16 v3, 0x6f

    if-ne v2, v3, :cond_5

    const-string v1, "toSource"

    const/4 v0, 0x4

    goto :goto_0

    .line 339
    :cond_5
    if-ne v2, v5, :cond_8

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 333
    .end local v2    # "c":I
    :cond_6
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 334
    .restart local v2    # "c":I
    if-ne v2, v5, :cond_7

    const-string v1, "toFixed"

    const/4 v0, 0x6

    goto :goto_0

    .line 335
    :cond_7
    const/16 v3, 0x76

    if-ne v2, v3, :cond_8

    const-string v1, "valueOf"

    const/4 v0, 0x5

    .line 348
    .end local v2    # "c":I
    :cond_8
    :goto_0
    if-eqz v1, :cond_9

    if-eq v1, p1, :cond_9

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    const/4 v0, 0x0

    .line 352
    .end local v1    # "X":Ljava/lang/String;
    :cond_9
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 44
    const-string v0, "Number"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 89
    packed-switch p1, :pswitch_data_0

    .line 98
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "toPrecision"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 96
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toExponential"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 95
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toFixed"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 94
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "valueOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 93
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 92
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toLocaleString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 91
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 90
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 100
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeNumber;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 101
    return-void

    :pswitch_data_0
    .packed-switch 0x1
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

.method public toString()Ljava/lang/String;
    .locals 3

    .line 244
    iget-wide v0, p0, Lcom/trendmicro/hippo/NativeNumber;->doubleValue:D

    const/16 v2, 0xa

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
