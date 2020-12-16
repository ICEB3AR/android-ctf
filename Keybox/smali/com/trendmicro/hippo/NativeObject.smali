.class public Lcom/trendmicro/hippo/NativeObject;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeObject.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/NativeObject$KeySet;,
        Lcom/trendmicro/hippo/NativeObject$ValueCollection;,
        Lcom/trendmicro/hippo/NativeObject$EntrySet;
    }
.end annotation


# static fields
.field private static final ConstructorId_assign:I = -0xf

.field private static final ConstructorId_create:I = -0x9

.field private static final ConstructorId_defineProperties:I = -0x8

.field private static final ConstructorId_defineProperty:I = -0x5

.field private static final ConstructorId_freeze:I = -0xd

.field private static final ConstructorId_getOwnPropertyDescriptor:I = -0x4

.field private static final ConstructorId_getOwnPropertyNames:I = -0x3

.field private static final ConstructorId_getOwnPropertySymbols:I = -0xe

.field private static final ConstructorId_getPrototypeOf:I = -0x1

.field private static final ConstructorId_is:I = -0x10

.field private static final ConstructorId_isExtensible:I = -0x6

.field private static final ConstructorId_isFrozen:I = -0xb

.field private static final ConstructorId_isSealed:I = -0xa

.field private static final ConstructorId_keys:I = -0x2

.field private static final ConstructorId_preventExtensions:I = -0x7

.field private static final ConstructorId_seal:I = -0xc

.field private static final Id___defineGetter__:I = 0x9

.field private static final Id___defineSetter__:I = 0xa

.field private static final Id___lookupGetter__:I = 0xb

.field private static final Id___lookupSetter__:I = 0xc

.field private static final Id_constructor:I = 0x1

.field private static final Id_hasOwnProperty:I = 0x5

.field private static final Id_isPrototypeOf:I = 0x7

.field private static final Id_propertyIsEnumerable:I = 0x6

.field private static final Id_toLocaleString:I = 0x3

.field private static final Id_toSource:I = 0x8

.field private static final Id_toString:I = 0x2

.field private static final Id_valueOf:I = 0x4

.field private static final MAX_PROTOTYPE_ID:I = 0xc

.field private static final OBJECT_TAG:Ljava/lang/Object;

.field private static final serialVersionUID:J = -0x580f0dd5006845f4L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const-string v0, "Object"

    sput-object v0, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    return-void
.end method

.method private static getCompatibleObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "arg"    # Ljava/lang/Object;

    .line 540
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    const/16 v1, 0xc8

    if-lt v0, v1, :cond_0

    .line 541
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 542
    .local v0, "s":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 544
    .end local v0    # "s":Lcom/trendmicro/hippo/Scriptable;
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 31
    new-instance v0, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 32
    .local v0, "obj":Lcom/trendmicro/hippo/NativeObject;
    const/16 v1, 0xc

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeObject;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 33
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 608
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 551
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 552
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0, p0}, Lcom/trendmicro/hippo/NativeObject;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0

    .line 553
    :cond_0
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_1

    .line 554
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p0, v0, p0}, Lcom/trendmicro/hippo/NativeObject;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0

    .line 556
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "value"    # Ljava/lang/Object;

    .line 561
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeObject;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 562
    .local v1, "obj":Ljava/lang/Object;
    if-eq p1, v1, :cond_1

    if-eqz p1, :cond_0

    .line 563
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 566
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_0
    goto :goto_0

    .line 564
    .restart local v1    # "obj":Ljava/lang/Object;
    :cond_1
    :goto_1
    const/4 v0, 0x1

    return v0

    .line 567
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 593
    new-instance v0, Lcom/trendmicro/hippo/NativeObject$EntrySet;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/NativeObject$EntrySet;-><init>(Lcom/trendmicro/hippo/NativeObject;)V

    return-object v0
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 117
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    sget-object v0, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 118
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 120
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v7

    .line 121
    .local v7, "id":I
    const-string v0, "writable"

    const-string v8, "configurable"

    const/16 v9, 0xc8

    const/4 v10, 0x2

    const/4 v11, 0x0

    const/4 v12, 0x1

    packed-switch v7, :pswitch_data_0

    .line 534
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 269
    :pswitch_1
    array-length v0, v6

    if-lt v0, v12, :cond_8

    instance-of v0, v5, Lcom/trendmicro/hippo/ScriptableObject;

    if-nez v0, :cond_1

    goto :goto_3

    .line 273
    :cond_1
    move-object v0, v5

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 274
    .local v0, "so":Lcom/trendmicro/hippo/ScriptableObject;
    aget-object v8, v6, v11

    invoke-static {v3, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 275
    .local v8, "name":Ljava/lang/String;
    if-eqz v8, :cond_2

    move v9, v11

    goto :goto_0

    .line 276
    :cond_2
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v9

    :goto_0
    nop

    .line 277
    .local v9, "index":I
    const/16 v10, 0xc

    if-ne v7, v10, :cond_3

    move v11, v12

    :cond_3
    move v10, v11

    .line 280
    .local v10, "isSetter":Z
    :goto_1
    invoke-virtual {v0, v8, v9, v10}, Lcom/trendmicro/hippo/ScriptableObject;->getGetterOrSetter(Ljava/lang/String;IZ)Ljava/lang/Object;

    move-result-object v11

    .line 281
    .local v11, "gs":Ljava/lang/Object;
    if-eqz v11, :cond_4

    .line 282
    goto :goto_2

    .line 285
    :cond_4
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v12

    .line 286
    .local v12, "v":Lcom/trendmicro/hippo/Scriptable;
    if-nez v12, :cond_5

    .line 287
    goto :goto_2

    .line 288
    :cond_5
    instance-of v13, v12, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v13, :cond_6

    .line 289
    move-object v0, v12

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 292
    .end local v12    # "v":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_1

    .line 293
    :cond_6
    :goto_2
    if-eqz v11, :cond_7

    .line 294
    return-object v11

    .line 296
    .end local v0    # "so":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "index":I
    .end local v10    # "isSetter":Z
    .end local v11    # "gs":Ljava/lang/Object;
    :cond_7
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 271
    :cond_8
    :goto_3
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 243
    :pswitch_2
    array-length v0, v6

    if-lt v0, v10, :cond_f

    aget-object v0, v6, v12

    instance-of v0, v0, Lcom/trendmicro/hippo/Callable;

    if-nez v0, :cond_9

    goto :goto_7

    .line 248
    :cond_9
    instance-of v0, v5, Lcom/trendmicro/hippo/ScriptableObject;

    if-nez v0, :cond_b

    .line 249
    nop

    .line 251
    if-nez v5, :cond_a

    const-string v0, "null"

    goto :goto_4

    :cond_a
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_4
    aget-object v8, v6, v11

    .line 252
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 249
    const-string v9, "msg.extend.scriptable"

    invoke-static {v9, v0, v8}, Lcom/trendmicro/hippo/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0

    .line 254
    :cond_b
    move-object v0, v5

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 255
    .restart local v0    # "so":Lcom/trendmicro/hippo/ScriptableObject;
    aget-object v8, v6, v11

    invoke-static {v3, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 256
    .restart local v8    # "name":Ljava/lang/String;
    if-eqz v8, :cond_c

    move v9, v11

    goto :goto_5

    .line 257
    :cond_c
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v9

    :goto_5
    nop

    .line 258
    .restart local v9    # "index":I
    aget-object v10, v6, v12

    check-cast v10, Lcom/trendmicro/hippo/Callable;

    .line 259
    .local v10, "getterOrSetter":Lcom/trendmicro/hippo/Callable;
    const/16 v13, 0xa

    if-ne v7, v13, :cond_d

    goto :goto_6

    :cond_d
    move v12, v11

    .line 260
    .local v12, "isSetter":Z
    :goto_6
    invoke-virtual {v0, v8, v9, v10, v12}, Lcom/trendmicro/hippo/ScriptableObject;->setGetterOrSetter(Ljava/lang/String;ILcom/trendmicro/hippo/Callable;Z)V

    .line 261
    instance-of v13, v0, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v13, :cond_e

    .line 262
    move-object v13, v0

    check-cast v13, Lcom/trendmicro/hippo/NativeArray;

    invoke-virtual {v13, v11}, Lcom/trendmicro/hippo/NativeArray;->setDenseOnly(Z)V

    .line 264
    .end local v0    # "so":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "index":I
    .end local v10    # "getterOrSetter":Lcom/trendmicro/hippo/Callable;
    .end local v12    # "isSetter":Z
    :cond_e
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0

    .line 244
    :cond_f
    :goto_7
    array-length v0, v6

    if-lt v0, v10, :cond_10

    aget-object v0, v6, v12

    goto :goto_8

    .line 245
    :cond_10
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_8
    nop

    .line 246
    .local v0, "badArg":Ljava/lang/Object;
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v8

    throw v8

    .line 238
    .end local v0    # "badArg":Ljava/lang/Object;
    :pswitch_3
    invoke-static/range {p2 .. p5}, Lcom/trendmicro/hippo/ScriptRuntime;->defaultObjectToSource(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 223
    :pswitch_4
    const/4 v0, 0x0

    .line 224
    .local v0, "result":Z
    array-length v8, v6

    if-eqz v8, :cond_13

    aget-object v8, v6, v11

    instance-of v8, v8, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v8, :cond_13

    .line 225
    aget-object v8, v6, v11

    check-cast v8, Lcom/trendmicro/hippo/Scriptable;

    .line 227
    .local v8, "v":Lcom/trendmicro/hippo/Scriptable;
    :cond_11
    invoke-interface {v8}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v8

    .line 228
    if-ne v8, v5, :cond_12

    .line 229
    const/4 v0, 0x1

    .line 230
    goto :goto_9

    .line 232
    :cond_12
    if-nez v8, :cond_11

    .line 234
    .end local v8    # "v":Lcom/trendmicro/hippo/Scriptable;
    :cond_13
    :goto_9
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v8

    return-object v8

    .line 180
    .end local v0    # "result":Z
    :pswitch_5
    array-length v0, v6

    if-ge v0, v12, :cond_14

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_a

    :cond_14
    aget-object v0, v6, v11

    :goto_a
    move-object v8, v0

    .line 182
    .local v8, "arg":Ljava/lang/Object;
    nop

    instance-of v0, v8, Lcom/trendmicro/hippo/Symbol;

    if-eqz v0, :cond_16

    .line 183
    move-object v0, v5

    check-cast v0, Lcom/trendmicro/hippo/SymbolScriptable;

    move-object v9, v8

    check-cast v9, Lcom/trendmicro/hippo/Symbol;

    invoke-interface {v0, v9, v5}, Lcom/trendmicro/hippo/SymbolScriptable;->has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    .line 184
    .restart local v0    # "result":Z
    if-eqz v0, :cond_1c

    instance-of v9, v5, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v9, :cond_1c

    .line 185
    move-object v9, v5

    check-cast v9, Lcom/trendmicro/hippo/ScriptableObject;

    .line 186
    .local v9, "so":Lcom/trendmicro/hippo/ScriptableObject;
    move-object v10, v8

    check-cast v10, Lcom/trendmicro/hippo/Symbol;

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/ScriptableObject;->getAttributes(Lcom/trendmicro/hippo/Symbol;)I

    move-result v10

    .line 187
    .local v10, "attrs":I
    and-int/lit8 v13, v10, 0x2

    if-nez v13, :cond_15

    move v11, v12

    :cond_15
    move v0, v11

    .line 188
    .end local v9    # "so":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v10    # "attrs":I
    goto :goto_c

    .line 190
    .end local v0    # "result":Z
    :cond_16
    invoke-static {v3, v8}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 194
    .local v9, "s":Ljava/lang/String;
    if-nez v9, :cond_19

    .line 195
    :try_start_0
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v0

    .line 196
    .local v0, "index":I
    invoke-interface {v5, v0, v5}, Lcom/trendmicro/hippo/Scriptable;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v10

    .line 197
    .local v10, "result":Z
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    move-object v9, v13

    .line 198
    if-eqz v10, :cond_18

    instance-of v13, v5, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v13, :cond_18

    .line 199
    move-object v13, v5

    check-cast v13, Lcom/trendmicro/hippo/ScriptableObject;

    .line 200
    .local v13, "so":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v13, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getAttributes(I)I

    move-result v14

    .line 201
    .local v14, "attrs":I
    and-int/lit8 v15, v14, 0x2

    if-nez v15, :cond_17

    move v11, v12

    :cond_17
    move v10, v11

    .line 203
    .end local v0    # "index":I
    .end local v13    # "so":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v14    # "attrs":I
    :cond_18
    move v0, v10

    goto :goto_b

    .line 204
    .end local v10    # "result":Z
    :cond_19
    invoke-interface {v5, v9, v5}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    .line 205
    .local v0, "result":Z
    if-eqz v0, :cond_1b

    instance-of v10, v5, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v10, :cond_1b

    .line 206
    move-object v10, v5

    check-cast v10, Lcom/trendmicro/hippo/ScriptableObject;

    .line 207
    .local v10, "so":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v10, v9}, Lcom/trendmicro/hippo/ScriptableObject;->getAttributes(Ljava/lang/String;)I

    move-result v13
    :try_end_0
    .catch Lcom/trendmicro/hippo/EvaluatorException; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    .local v13, "attrs":I
    and-int/lit8 v14, v13, 0x2

    if-nez v14, :cond_1a

    move v11, v12

    :cond_1a
    move v0, v11

    .line 217
    .end local v10    # "so":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v13    # "attrs":I
    :cond_1b
    :goto_b
    goto :goto_c

    .line 211
    .end local v0    # "result":Z
    :catch_0
    move-exception v0

    .line 212
    .local v0, "ee":Lcom/trendmicro/hippo/EvaluatorException;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/EvaluatorException;->getMessage()Ljava/lang/String;

    move-result-object v10

    const-string v11, "msg.prop.not.found"

    invoke-static {v11, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1d

    .line 213
    const/4 v10, 0x0

    move v0, v10

    .line 219
    .end local v9    # "s":Ljava/lang/String;
    .local v0, "result":Z
    :cond_1c
    :goto_c
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v9

    return-object v9

    .line 215
    .local v0, "ee":Lcom/trendmicro/hippo/EvaluatorException;
    .restart local v9    # "s":Ljava/lang/String;
    :cond_1d
    throw v0

    .line 163
    .end local v0    # "ee":Lcom/trendmicro/hippo/EvaluatorException;
    .end local v8    # "arg":Ljava/lang/Object;
    .end local v9    # "s":Ljava/lang/String;
    :pswitch_6
    array-length v0, v6

    if-ge v0, v12, :cond_1e

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_d

    :cond_1e
    aget-object v0, v6, v11

    .line 164
    .local v0, "arg":Ljava/lang/Object;
    :goto_d
    instance-of v8, v0, Lcom/trendmicro/hippo/Symbol;

    if-eqz v8, :cond_1f

    .line 165
    invoke-static/range {p4 .. p4}, Lcom/trendmicro/hippo/NativeObject;->ensureSymbolScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/SymbolScriptable;

    move-result-object v8

    move-object v9, v0

    check-cast v9, Lcom/trendmicro/hippo/Symbol;

    invoke-interface {v8, v9, v5}, Lcom/trendmicro/hippo/SymbolScriptable;->has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v8

    .local v8, "result":Z
    goto :goto_e

    .line 167
    .end local v8    # "result":Z
    :cond_1f
    invoke-static {v3, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toStringIdOrIndex(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 168
    .local v8, "s":Ljava/lang/String;
    if-nez v8, :cond_20

    .line 169
    invoke-static/range {p2 .. p2}, Lcom/trendmicro/hippo/ScriptRuntime;->lastIndexResult(Lcom/trendmicro/hippo/Context;)I

    move-result v9

    .line 170
    .local v9, "index":I
    invoke-interface {v5, v9, v5}, Lcom/trendmicro/hippo/Scriptable;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v9

    .line 171
    .local v9, "result":Z
    move v8, v9

    goto :goto_e

    .line 172
    .end local v9    # "result":Z
    :cond_20
    invoke-interface {v5, v8, v5}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v9

    move v8, v9

    .line 175
    .local v8, "result":Z
    :goto_e
    invoke-static {v8}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v9

    return-object v9

    .line 159
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "result":Z
    :pswitch_7
    return-object v5

    .line 136
    :pswitch_8
    const-string v0, "toString"

    invoke-static {v5, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 137
    .local v0, "toString":Ljava/lang/Object;
    instance-of v8, v0, Lcom/trendmicro/hippo/Callable;

    if-eqz v8, :cond_21

    .line 140
    move-object v8, v0

    check-cast v8, Lcom/trendmicro/hippo/Callable;

    .line 141
    .local v8, "fun":Lcom/trendmicro/hippo/Callable;
    sget-object v9, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v8, v3, v4, v5, v9}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    return-object v9

    .line 138
    .end local v8    # "fun":Lcom/trendmicro/hippo/Callable;
    :cond_21
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v8

    throw v8

    .line 145
    .end local v0    # "toString":Ljava/lang/Object;
    :pswitch_9
    const/4 v0, 0x4

    invoke-virtual {v3, v0}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 146
    invoke-static/range {p2 .. p5}, Lcom/trendmicro/hippo/ScriptRuntime;->defaultObjectToSource(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    .line 149
    .local v8, "L":I
    if-eqz v8, :cond_22

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x28

    if-ne v9, v10, :cond_22

    add-int/lit8 v9, v8, -0x1

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x29

    if-ne v9, v10, :cond_22

    .line 151
    add-int/lit8 v9, v8, -0x1

    invoke-virtual {v0, v12, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 153
    :cond_22
    return-object v0

    .line 155
    .end local v0    # "s":Ljava/lang/String;
    .end local v8    # "L":I
    :cond_23
    invoke-static/range {p4 .. p4}, Lcom/trendmicro/hippo/ScriptRuntime;->defaultObjectToString(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 123
    :pswitch_a
    if-eqz v5, :cond_24

    .line 125
    invoke-virtual {v2, v3, v4, v6}, Lcom/trendmicro/hippo/IdFunctionObject;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 127
    :cond_24
    array-length v0, v6

    if-eqz v0, :cond_26

    aget-object v0, v6, v11

    if-eqz v0, :cond_26

    aget-object v0, v6, v11

    sget-object v8, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v8, :cond_25

    goto :goto_f

    .line 132
    :cond_25
    aget-object v0, v6, v11

    invoke-static {v3, v4, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 130
    :cond_26
    :goto_f
    new-instance v0, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    return-object v0

    .line 300
    :pswitch_b
    array-length v0, v6

    if-ge v0, v12, :cond_27

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_10

    :cond_27
    aget-object v0, v6, v11

    .line 301
    .local v0, "arg":Ljava/lang/Object;
    :goto_10
    invoke-static {v3, v4, v0}, Lcom/trendmicro/hippo/NativeObject;->getCompatibleObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v8

    .line 302
    .local v8, "obj":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v8}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v9

    return-object v9

    .line 306
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "obj":Lcom/trendmicro/hippo/Scriptable;
    :pswitch_c
    array-length v0, v6

    if-ge v0, v12, :cond_28

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_11

    :cond_28
    aget-object v0, v6, v11

    .line 307
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_11
    invoke-static {v3, v4, v0}, Lcom/trendmicro/hippo/NativeObject;->getCompatibleObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v8

    .line 308
    .restart local v8    # "obj":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v8}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v9

    .line 309
    .local v9, "ids":[Ljava/lang/Object;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_12
    array-length v11, v9

    if-ge v10, v11, :cond_29

    .line 310
    aget-object v11, v9, v10

    invoke-static {v11}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    .line 309
    add-int/lit8 v10, v10, 0x1

    goto :goto_12

    .line 312
    .end local v10    # "i":I
    :cond_29
    invoke-virtual {v3, v4, v9}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v10

    return-object v10

    .line 316
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "obj":Lcom/trendmicro/hippo/Scriptable;
    .end local v9    # "ids":[Ljava/lang/Object;
    :pswitch_d
    array-length v0, v6

    if-ge v0, v12, :cond_2a

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_13

    :cond_2a
    aget-object v0, v6, v11

    .line 317
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_13
    invoke-static {v3, v4, v0}, Lcom/trendmicro/hippo/NativeObject;->getCompatibleObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v8

    .line 318
    .local v8, "s":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v8}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v9

    .line 319
    .local v9, "obj":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v9, v12, v11}, Lcom/trendmicro/hippo/ScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v10

    .line 320
    .local v10, "ids":[Ljava/lang/Object;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_14
    array-length v12, v10

    if-ge v11, v12, :cond_2b

    .line 321
    aget-object v12, v10, v11

    invoke-static {v12}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    .line 320
    add-int/lit8 v11, v11, 0x1

    goto :goto_14

    .line 323
    .end local v11    # "i":I
    :cond_2b
    invoke-virtual {v3, v4, v10}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v11

    return-object v11

    .line 341
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "s":Lcom/trendmicro/hippo/Scriptable;
    .end local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v10    # "ids":[Ljava/lang/Object;
    :pswitch_e
    array-length v0, v6

    if-ge v0, v12, :cond_2c

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_15

    :cond_2c
    aget-object v0, v6, v11

    .line 345
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_15
    invoke-static {v3, v4, v0}, Lcom/trendmicro/hippo/NativeObject;->getCompatibleObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v8

    .line 346
    .restart local v8    # "s":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v8}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v9

    .line 347
    .restart local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    array-length v11, v6

    if-ge v11, v10, :cond_2d

    sget-object v10, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_16

    :cond_2d
    aget-object v10, v6, v12

    .line 348
    .local v10, "nameArg":Ljava/lang/Object;
    :goto_16
    invoke-virtual {v9, v3, v10}, Lcom/trendmicro/hippo/ScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v11

    .line 349
    .local v11, "desc":Lcom/trendmicro/hippo/Scriptable;
    if-nez v11, :cond_2e

    sget-object v12, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_17

    :cond_2e
    move-object v12, v11

    :goto_17
    return-object v12

    .line 353
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "s":Lcom/trendmicro/hippo/Scriptable;
    .end local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v10    # "nameArg":Ljava/lang/Object;
    .end local v11    # "desc":Lcom/trendmicro/hippo/Scriptable;
    :pswitch_f
    array-length v0, v6

    if-ge v0, v12, :cond_2f

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_18

    :cond_2f
    aget-object v0, v6, v11

    .line 354
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_18
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v8

    .line 355
    .local v8, "obj":Lcom/trendmicro/hippo/ScriptableObject;
    array-length v9, v6

    if-ge v9, v10, :cond_30

    sget-object v9, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_19

    :cond_30
    aget-object v9, v6, v12

    .line 356
    .local v9, "name":Ljava/lang/Object;
    :goto_19
    array-length v11, v6

    const/4 v12, 0x3

    if-ge v11, v12, :cond_31

    sget-object v10, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1a

    :cond_31
    aget-object v10, v6, v10

    .line 357
    .local v10, "descArg":Ljava/lang/Object;
    :goto_1a
    invoke-static {v10}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v11

    .line 358
    .local v11, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v8, v3, v9, v11}, Lcom/trendmicro/hippo/ScriptableObject;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 359
    return-object v8

    .line 363
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v9    # "name":Ljava/lang/Object;
    .end local v10    # "descArg":Ljava/lang/Object;
    .end local v11    # "desc":Lcom/trendmicro/hippo/ScriptableObject;
    :pswitch_10
    array-length v0, v6

    if-ge v0, v12, :cond_32

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1b

    :cond_32
    aget-object v0, v6, v11

    .line 364
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_1b
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v8

    if-lt v8, v9, :cond_33

    instance-of v8, v0, Lcom/trendmicro/hippo/ScriptableObject;

    if-nez v8, :cond_33

    .line 366
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v8

    .line 369
    :cond_33
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v8

    .line 370
    .restart local v8    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v8}, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible()Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    return-object v9

    .line 374
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    :pswitch_11
    array-length v0, v6

    if-ge v0, v12, :cond_34

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1c

    :cond_34
    aget-object v0, v6, v11

    .line 375
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_1c
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v8

    if-lt v8, v9, :cond_35

    instance-of v8, v0, Lcom/trendmicro/hippo/ScriptableObject;

    if-nez v8, :cond_35

    .line 377
    return-object v0

    .line 380
    :cond_35
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v8

    .line 381
    .restart local v8    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v8}, Lcom/trendmicro/hippo/ScriptableObject;->preventExtensions()V

    .line 382
    return-object v8

    .line 386
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    :pswitch_12
    array-length v0, v6

    if-ge v0, v12, :cond_36

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1d

    :cond_36
    aget-object v0, v6, v11

    .line 387
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_1d
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v8

    .line 388
    .restart local v8    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    array-length v9, v6

    if-ge v9, v10, :cond_37

    sget-object v9, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1e

    :cond_37
    aget-object v9, v6, v12

    .line 389
    .local v9, "propsObj":Ljava/lang/Object;
    :goto_1e
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/NativeObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/trendmicro/hippo/Context;->toObject(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v10

    .line 390
    .local v10, "props":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v10}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v11

    invoke-virtual {v8, v3, v11}, Lcom/trendmicro/hippo/ScriptableObject;->defineOwnProperties(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 391
    return-object v8

    .line 395
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v9    # "propsObj":Ljava/lang/Object;
    .end local v10    # "props":Lcom/trendmicro/hippo/Scriptable;
    :pswitch_13
    array-length v0, v6

    if-ge v0, v12, :cond_38

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1f

    :cond_38
    aget-object v0, v6, v11

    .line 396
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_1f
    if-nez v0, :cond_39

    const/4 v8, 0x0

    goto :goto_20

    :cond_39
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v8

    .line 398
    .local v8, "obj":Lcom/trendmicro/hippo/Scriptable;
    :goto_20
    new-instance v9, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v9}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 399
    .local v9, "newObject":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/NativeObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/trendmicro/hippo/ScriptableObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 400
    invoke-virtual {v9, v8}, Lcom/trendmicro/hippo/ScriptableObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 402
    array-length v10, v6

    if-le v10, v12, :cond_3a

    aget-object v10, v6, v12

    sget-object v11, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v10, v11, :cond_3a

    .line 403
    aget-object v10, v6, v12

    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/NativeObject;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/trendmicro/hippo/Context;->toObject(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v10

    .line 404
    .restart local v10    # "props":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v10}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v11

    invoke-virtual {v9, v3, v11}, Lcom/trendmicro/hippo/ScriptableObject;->defineOwnProperties(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ScriptableObject;)V

    .line 407
    .end local v10    # "props":Lcom/trendmicro/hippo/Scriptable;
    :cond_3a
    return-object v9

    .line 411
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v8    # "obj":Lcom/trendmicro/hippo/Scriptable;
    .end local v9    # "newObject":Lcom/trendmicro/hippo/ScriptableObject;
    :pswitch_14
    array-length v0, v6

    if-ge v0, v12, :cond_3b

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_21

    :cond_3b
    aget-object v0, v6, v11

    .line 412
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_21
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v10

    if-lt v10, v9, :cond_3c

    instance-of v9, v0, Lcom/trendmicro/hippo/ScriptableObject;

    if-nez v9, :cond_3c

    .line 414
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v8

    .line 417
    :cond_3c
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v9

    .line 419
    .local v9, "obj":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v9}, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible()Z

    move-result v10

    if-eqz v10, :cond_3d

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v8

    .line 421
    :cond_3d
    invoke-virtual {v9}, Lcom/trendmicro/hippo/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v10

    array-length v12, v10

    :goto_22
    if-ge v11, v12, :cond_3f

    aget-object v13, v10, v11

    .line 422
    .local v13, "name":Ljava/lang/Object;
    invoke-virtual {v9, v3, v13}, Lcom/trendmicro/hippo/ScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v14

    invoke-virtual {v14, v8}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 423
    .local v14, "configurable":Ljava/lang/Object;
    sget-object v15, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v15, v14}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3e

    .line 424
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v8

    .line 421
    .end local v13    # "name":Ljava/lang/Object;
    .end local v14    # "configurable":Ljava/lang/Object;
    :cond_3e
    add-int/lit8 v11, v11, 0x1

    goto :goto_22

    .line 427
    :cond_3f
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v8

    .line 431
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    :pswitch_15
    array-length v10, v6

    if-ge v10, v12, :cond_40

    sget-object v10, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_23

    :cond_40
    aget-object v10, v6, v11

    .line 432
    .local v10, "arg":Ljava/lang/Object;
    :goto_23
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v12

    if-lt v12, v9, :cond_41

    instance-of v9, v10, Lcom/trendmicro/hippo/ScriptableObject;

    if-nez v9, :cond_41

    .line 434
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 437
    :cond_41
    invoke-static {v10}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v9

    .line 439
    .restart local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v9}, Lcom/trendmicro/hippo/ScriptableObject;->isExtensible()Z

    move-result v12

    if-eqz v12, :cond_42

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 441
    :cond_42
    invoke-virtual {v9}, Lcom/trendmicro/hippo/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v12

    array-length v13, v12

    :goto_24
    if-ge v11, v13, :cond_45

    aget-object v14, v12, v11

    .line 442
    .local v14, "name":Ljava/lang/Object;
    invoke-virtual {v9, v3, v14}, Lcom/trendmicro/hippo/ScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v15

    .line 443
    .local v15, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v16, v9

    .end local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    .local v16, "obj":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v15, v8}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_43

    .line 444
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 445
    :cond_43
    invoke-virtual {v1, v15}, Lcom/trendmicro/hippo/NativeObject;->isDataDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v2

    if-eqz v2, :cond_44

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v15, v0}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_44

    .line 446
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0

    .line 441
    .end local v14    # "name":Ljava/lang/Object;
    .end local v15    # "desc":Lcom/trendmicro/hippo/ScriptableObject;
    :cond_44
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v2, p1

    move-object/from16 v9, v16

    goto :goto_24

    .line 449
    .end local v16    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    .restart local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    :cond_45
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    .line 453
    .end local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v10    # "arg":Ljava/lang/Object;
    :pswitch_16
    array-length v0, v6

    if-ge v0, v12, :cond_46

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_25

    :cond_46
    aget-object v0, v6, v11

    .line 454
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_25
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v2

    if-lt v2, v9, :cond_47

    instance-of v2, v0, Lcom/trendmicro/hippo/ScriptableObject;

    if-nez v2, :cond_47

    .line 456
    return-object v0

    .line 459
    :cond_47
    invoke-static {v0}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v2

    .line 461
    .local v2, "obj":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v9

    array-length v10, v9

    move v12, v11

    :goto_26
    if-ge v12, v10, :cond_49

    aget-object v13, v9, v12

    .line 462
    .restart local v13    # "name":Ljava/lang/Object;
    invoke-virtual {v2, v3, v13}, Lcom/trendmicro/hippo/ScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v14

    .line 463
    .local v14, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    sget-object v15, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v14, v8}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v15, v11}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_48

    .line 464
    sget-object v11, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v14, v8, v14, v11}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 465
    const/4 v11, 0x0

    invoke-virtual {v2, v3, v13, v14, v11}, Lcom/trendmicro/hippo/ScriptableObject;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 461
    .end local v13    # "name":Ljava/lang/Object;
    .end local v14    # "desc":Lcom/trendmicro/hippo/ScriptableObject;
    :cond_48
    add-int/lit8 v12, v12, 0x1

    const/4 v11, 0x0

    goto :goto_26

    .line 468
    :cond_49
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ScriptableObject;->preventExtensions()V

    .line 470
    return-object v2

    .line 474
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v2    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    :pswitch_17
    array-length v2, v6

    if-ge v2, v12, :cond_4a

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_27

    :cond_4a
    const/4 v2, 0x0

    aget-object v10, v6, v2

    move-object v2, v10

    .line 475
    .local v2, "arg":Ljava/lang/Object;
    :goto_27
    invoke-virtual/range {p2 .. p2}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v10

    if-lt v10, v9, :cond_4b

    instance-of v9, v2, Lcom/trendmicro/hippo/ScriptableObject;

    if-nez v9, :cond_4b

    .line 477
    return-object v2

    .line 480
    :cond_4b
    invoke-static {v2}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v9

    .line 482
    .restart local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v9}, Lcom/trendmicro/hippo/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v10

    array-length v11, v10

    const/4 v12, 0x0

    :goto_28
    if-ge v12, v11, :cond_4e

    aget-object v13, v10, v12

    .line 483
    .restart local v13    # "name":Ljava/lang/Object;
    invoke-virtual {v9, v3, v13}, Lcom/trendmicro/hippo/ScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v14

    .line 484
    .restart local v14    # "desc":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v1, v14}, Lcom/trendmicro/hippo/NativeObject;->isDataDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v15

    if-eqz v15, :cond_4c

    sget-object v15, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v14, v0}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v15, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4c

    .line 485
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v14, v0, v14, v1}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 486
    :cond_4c
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v14, v8}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v1, v15}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4d

    .line 487
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v14, v8, v14, v1}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 488
    :cond_4d
    const/4 v1, 0x0

    invoke-virtual {v9, v3, v13, v14, v1}, Lcom/trendmicro/hippo/ScriptableObject;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 482
    .end local v13    # "name":Ljava/lang/Object;
    .end local v14    # "desc":Lcom/trendmicro/hippo/ScriptableObject;
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v1, p0

    goto :goto_28

    .line 490
    :cond_4e
    invoke-virtual {v9}, Lcom/trendmicro/hippo/ScriptableObject;->preventExtensions()V

    .line 492
    return-object v9

    .line 327
    .end local v2    # "arg":Ljava/lang/Object;
    .end local v9    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    :pswitch_18
    array-length v0, v6

    if-ge v0, v12, :cond_4f

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_29

    :cond_4f
    const/4 v0, 0x0

    aget-object v0, v6, v0

    .line 328
    .restart local v0    # "arg":Ljava/lang/Object;
    :goto_29
    invoke-static {v3, v4, v0}, Lcom/trendmicro/hippo/NativeObject;->getCompatibleObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 329
    .local v1, "s":Lcom/trendmicro/hippo/Scriptable;
    invoke-static {v1}, Lcom/trendmicro/hippo/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v2

    .line 330
    .local v2, "obj":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v2, v12, v12}, Lcom/trendmicro/hippo/ScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v8

    .line 331
    .local v8, "ids":[Ljava/lang/Object;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 332
    .local v9, "syms":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_2a
    array-length v11, v8

    if-ge v10, v11, :cond_51

    .line 333
    aget-object v11, v8, v10

    instance-of v11, v11, Lcom/trendmicro/hippo/Symbol;

    if-eqz v11, :cond_50

    .line 334
    aget-object v11, v8, v10

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 332
    :cond_50
    add-int/lit8 v10, v10, 0x1

    goto :goto_2a

    .line 337
    .end local v10    # "i":I
    :cond_51
    invoke-virtual {v9}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v3, v4, v10}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v10

    return-object v10

    .line 497
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v1    # "s":Lcom/trendmicro/hippo/Scriptable;
    .end local v2    # "obj":Lcom/trendmicro/hippo/ScriptableObject;
    .end local v8    # "ids":[Ljava/lang/Object;
    .end local v9    # "syms":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :pswitch_19
    array-length v0, v6

    if-lt v0, v12, :cond_58

    .line 500
    const/4 v0, 0x0

    aget-object v1, v6, v0

    invoke-static {v3, v5, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 501
    .local v0, "t":Lcom/trendmicro/hippo/Scriptable;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_2b
    array-length v2, v6

    if-ge v1, v2, :cond_57

    .line 502
    aget-object v2, v6, v1

    if-eqz v2, :cond_56

    sget-object v2, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    aget-object v8, v6, v1

    invoke-virtual {v2, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_52

    .line 503
    goto :goto_2f

    .line 505
    :cond_52
    aget-object v2, v6, v1

    invoke-static {v3, v5, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 506
    .local v2, "s":Lcom/trendmicro/hippo/Scriptable;
    invoke-interface {v2}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v8

    .line 507
    .restart local v8    # "ids":[Ljava/lang/Object;
    array-length v9, v8

    const/4 v11, 0x0

    :goto_2c
    if-ge v11, v9, :cond_56

    aget-object v10, v8, v11

    .line 508
    .local v10, "key":Ljava/lang/Object;
    instance-of v12, v10, Ljava/lang/String;

    if-eqz v12, :cond_53

    .line 509
    move-object v12, v10

    check-cast v12, Ljava/lang/String;

    invoke-interface {v2, v12, v0}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v12

    .line 510
    .local v12, "val":Ljava/lang/Object;
    sget-object v13, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v12, v13, :cond_54

    sget-object v13, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v12, v13, :cond_54

    .line 511
    move-object v13, v10

    check-cast v13, Ljava/lang/String;

    invoke-interface {v0, v13, v0, v12}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_2d

    .line 513
    .end local v12    # "val":Ljava/lang/Object;
    :cond_53
    instance-of v12, v10, Ljava/lang/Number;

    if-eqz v12, :cond_54

    .line 514
    invoke-static {v10}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v12

    .line 515
    .local v12, "ii":I
    invoke-interface {v2, v12, v0}, Lcom/trendmicro/hippo/Scriptable;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v13

    .line 516
    .local v13, "val":Ljava/lang/Object;
    sget-object v14, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v13, v14, :cond_55

    sget-object v14, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v13, v14, :cond_55

    .line 517
    invoke-interface {v0, v12, v0, v13}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_2e

    .line 513
    .end local v12    # "ii":I
    .end local v13    # "val":Ljava/lang/Object;
    :cond_54
    :goto_2d
    nop

    .line 507
    .end local v10    # "key":Ljava/lang/Object;
    :cond_55
    :goto_2e
    add-int/lit8 v11, v11, 0x1

    goto :goto_2c

    .line 501
    .end local v2    # "s":Lcom/trendmicro/hippo/Scriptable;
    .end local v8    # "ids":[Ljava/lang/Object;
    :cond_56
    :goto_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 522
    .end local v1    # "i":I
    :cond_57
    return-object v0

    .line 498
    .end local v0    # "t":Lcom/trendmicro/hippo/Scriptable;
    :cond_58
    const-string v0, "msg.incompat.call"

    const-string v1, "assign"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0

    .line 527
    :pswitch_1a
    array-length v0, v6

    if-ge v0, v12, :cond_59

    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_30

    :cond_59
    const/4 v0, 0x0

    aget-object v0, v6, v0

    .line 528
    .local v0, "a1":Ljava/lang/Object;
    :goto_30
    array-length v1, v6

    if-ge v1, v10, :cond_5a

    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_31

    :cond_5a
    aget-object v1, v6, v12

    .line 529
    .local v1, "a2":Ljava/lang/Object;
    :goto_31
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->same(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v2

    return-object v2

    :pswitch_data_0
    .packed-switch -0x10
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
        :pswitch_0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 12
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 50
    sget-object v2, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "getPrototypeOf"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 52
    sget-object v8, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v9, -0x2

    const-string v10, "keys"

    const/4 v11, 0x1

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 54
    sget-object v2, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x3

    const-string v4, "getOwnPropertyNames"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 56
    sget-object v8, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v9, -0xe

    const-string v10, "getOwnPropertySymbols"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 58
    sget-object v2, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x4

    const-string v4, "getOwnPropertyDescriptor"

    const/4 v5, 0x2

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 60
    sget-object v8, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v9, -0x5

    const-string v10, "defineProperty"

    const/4 v11, 0x3

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 62
    sget-object v2, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x6

    const-string v4, "isExtensible"

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 64
    sget-object v8, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v9, -0x7

    const-string v10, "preventExtensions"

    const/4 v11, 0x1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 66
    sget-object v2, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x8

    const-string v4, "defineProperties"

    const/4 v5, 0x2

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 68
    sget-object v8, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v9, -0x9

    const-string v10, "create"

    const/4 v11, 0x2

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 70
    sget-object v2, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v3, -0xa

    const-string v4, "isSealed"

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 72
    sget-object v8, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v9, -0xb

    const-string v10, "isFrozen"

    const/4 v11, 0x1

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 74
    sget-object v2, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v3, -0xc

    const-string v4, "seal"

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 76
    sget-object v8, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v9, -0xd

    const-string v10, "freeze"

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 78
    sget-object v2, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v3, -0xf

    const-string v4, "assign"

    const/4 v5, 0x2

    invoke-virtual/range {v0 .. v5}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 80
    sget-object v8, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v9, -0x10

    const-string v10, "is"

    const/4 v11, 0x2

    invoke-virtual/range {v6 .. v11}, Lcom/trendmicro/hippo/NativeObject;->addIdFunctionProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 82
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 83
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 7
    .param p1, "s"    # Ljava/lang/String;

    .line 775
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 776
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x7

    if-eq v2, v3, :cond_b

    const/16 v3, 0x74

    const/16 v4, 0x8

    if-eq v2, v4, :cond_9

    const/16 v5, 0xb

    if-eq v2, v5, :cond_8

    const/16 v5, 0x10

    if-eq v2, v5, :cond_4

    const/16 v4, 0x14

    if-eq v2, v4, :cond_3

    const/16 v4, 0xd

    if-eq v2, v4, :cond_2

    const/16 v4, 0xe

    if-eq v2, v4, :cond_0

    goto/16 :goto_0

    .line 784
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 785
    .local v2, "c":I
    const/16 v4, 0x68

    if-ne v2, v4, :cond_1

    const-string v1, "hasOwnProperty"

    const/4 v0, 0x5

    goto :goto_0

    .line 786
    :cond_1
    if-ne v2, v3, :cond_c

    const-string v1, "toLocaleString"

    const/4 v0, 0x3

    goto :goto_0

    .line 783
    .end local v2    # "c":I
    :cond_2
    const-string v1, "isPrototypeOf"

    const/4 v0, 0x7

    goto :goto_0

    .line 800
    :cond_3
    const-string v1, "propertyIsEnumerable"

    const/4 v0, 0x6

    goto :goto_0

    .line 788
    :cond_4
    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 789
    .restart local v2    # "c":I
    const/16 v3, 0x64

    const/16 v5, 0x53

    const/16 v6, 0x47

    if-ne v2, v3, :cond_6

    .line 790
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 791
    if-ne v2, v6, :cond_5

    const-string v1, "__defineGetter__"

    const/16 v0, 0x9

    goto :goto_0

    .line 792
    :cond_5
    if-ne v2, v5, :cond_c

    const-string v1, "__defineSetter__"

    const/16 v0, 0xa

    goto :goto_0

    .line 794
    :cond_6
    const/16 v3, 0x6c

    if-ne v2, v3, :cond_c

    .line 795
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 796
    if-ne v2, v6, :cond_7

    const-string v1, "__lookupGetter__"

    const/16 v0, 0xb

    goto :goto_0

    .line 797
    :cond_7
    if-ne v2, v5, :cond_c

    const-string v1, "__lookupSetter__"

    const/16 v0, 0xc

    goto :goto_0

    .line 782
    .end local v2    # "c":I
    :cond_8
    const-string v1, "constructor"

    const/4 v0, 0x1

    goto :goto_0

    .line 778
    :cond_9
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 779
    .restart local v2    # "c":I
    const/16 v4, 0x6f

    if-ne v2, v4, :cond_a

    const-string v1, "toSource"

    const/16 v0, 0x8

    goto :goto_0

    .line 780
    :cond_a
    if-ne v2, v3, :cond_c

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 777
    .end local v2    # "c":I
    :cond_b
    const-string v1, "valueOf"

    const/4 v0, 0x4

    .line 802
    :cond_c
    :goto_0
    if-eqz v1, :cond_d

    if-eq v1, p1, :cond_d

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    const/4 v0, 0x0

    .line 806
    .end local v1    # "X":Ljava/lang/String;
    :cond_d
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 38
    const-string v0, "Object"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 90
    packed-switch p1, :pswitch_data_0

    .line 108
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "__lookupSetter__"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 105
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "__lookupGetter__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 103
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "__defineSetter__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 101
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "__defineGetter__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 99
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 98
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "isPrototypeOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 97
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "propertyIsEnumerable"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 95
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "hasOwnProperty"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 94
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_8
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "valueOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 93
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_9
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 92
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 91
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_b
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 110
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeObject;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 111
    return-void

    :pswitch_data_0
    .packed-switch 0x1
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

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 583
    new-instance v0, Lcom/trendmicro/hippo/NativeObject$KeySet;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/NativeObject$KeySet;-><init>(Lcom/trendmicro/hippo/NativeObject;)V

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .line 598
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .param p1, "m"    # Ljava/util/Map;

    .line 603
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 572
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/NativeObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 573
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 574
    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/NativeObject;->delete(Ljava/lang/String;)V

    goto :goto_0

    .line 575
    :cond_0
    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_1

    .line 576
    move-object v1, p1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/NativeObject;->delete(I)V

    .line 578
    :cond_1
    :goto_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 44
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->defaultObjectToString(Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 588
    new-instance v0, Lcom/trendmicro/hippo/NativeObject$ValueCollection;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/NativeObject$ValueCollection;-><init>(Lcom/trendmicro/hippo/NativeObject;)V

    return-object v0
.end method
