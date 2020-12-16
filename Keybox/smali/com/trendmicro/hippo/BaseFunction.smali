.class public Lcom/trendmicro/hippo/BaseFunction;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "BaseFunction.java"

# interfaces
.implements Lcom/trendmicro/hippo/Function;


# static fields
.field private static final FUNCTION_TAG:Ljava/lang/Object;

.field private static final Id_apply:I = 0x4

.field private static final Id_arguments:I = 0x5

.field private static final Id_arity:I = 0x2

.field private static final Id_bind:I = 0x6

.field private static final Id_call:I = 0x5

.field private static final Id_constructor:I = 0x1

.field private static final Id_length:I = 0x1

.field private static final Id_name:I = 0x3

.field private static final Id_prototype:I = 0x4

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x5

.field private static final MAX_PROTOTYPE_ID:I = 0x6

.field private static final serialVersionUID:J = 0x49b5dd1bb05c2ae3L


# instance fields
.field private argumentsAttributes:I

.field private argumentsObj:Ljava/lang/Object;

.field private prototypeProperty:Ljava/lang/Object;

.field private prototypePropertyAttributes:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    const-string v0, "Function"

    sput-object v0, Lcom/trendmicro/hippo/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 603
    sget-object v0, Lcom/trendmicro/hippo/BaseFunction;->NOT_FOUND:Ljava/lang/Object;

    iput-object v0, p0, Lcom/trendmicro/hippo/BaseFunction;->argumentsObj:Ljava/lang/Object;

    .line 608
    const/4 v0, 0x6

    iput v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypePropertyAttributes:I

    .line 609
    iput v0, p0, Lcom/trendmicro/hippo/BaseFunction;->argumentsAttributes:I

    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V

    .line 603
    sget-object v0, Lcom/trendmicro/hippo/BaseFunction;->NOT_FOUND:Ljava/lang/Object;

    iput-object v0, p0, Lcom/trendmicro/hippo/BaseFunction;->argumentsObj:Ljava/lang/Object;

    .line 608
    const/4 v0, 0x6

    iput v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypePropertyAttributes:I

    .line 609
    iput v0, p0, Lcom/trendmicro/hippo/BaseFunction;->argumentsAttributes:I

    .line 36
    return-void
.end method

.method private getArguments()Ljava/lang/Object;
    .locals 4

    .line 487
    const-string v0, "arguments"

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/BaseFunction;->defaultHas(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/BaseFunction;->defaultGet(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/BaseFunction;->argumentsObj:Ljava/lang/Object;

    .line 488
    .local v1, "value":Ljava/lang/Object;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/BaseFunction;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_1

    .line 494
    return-object v1

    .line 496
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    .line 497
    .local v2, "cx":Lcom/trendmicro/hippo/Context;
    invoke-static {v2, p0}, Lcom/trendmicro/hippo/ScriptRuntime;->findFunctionActivation(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Function;)Lcom/trendmicro/hippo/NativeCall;

    move-result-object v3

    .line 498
    .local v3, "activation":Lcom/trendmicro/hippo/NativeCall;
    if-nez v3, :cond_2

    .line 499
    const/4 v0, 0x0

    goto :goto_1

    .line 500
    :cond_2
    invoke-virtual {v3, v0, v3}, Lcom/trendmicro/hippo/NativeCall;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 498
    :goto_1
    return-object v0
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 23
    new-instance v0, Lcom/trendmicro/hippo/BaseFunction;

    invoke-direct {v0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 25
    .local v0, "obj":Lcom/trendmicro/hippo/BaseFunction;
    const/4 v1, 0x7

    iput v1, v0, Lcom/trendmicro/hippo/BaseFunction;->prototypePropertyAttributes:I

    .line 26
    const/4 v1, 0x6

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/BaseFunction;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 27
    return-void
.end method

.method static isApply(Lcom/trendmicro/hippo/IdFunctionObject;)Z
    .locals 2
    .param p0, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 238
    sget-object v0, Lcom/trendmicro/hippo/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static isApplyOrCall(Lcom/trendmicro/hippo/IdFunctionObject;)Z
    .locals 2
    .param p0, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 242
    sget-object v0, Lcom/trendmicro/hippo/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 243
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 246
    :cond_0
    const/4 v0, 0x1

    return v0

    .line 249
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method private static jsConstructor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 18
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 506
    move-object/from16 v0, p2

    array-length v1, v0

    .line 507
    .local v1, "arglen":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 509
    .local v2, "sourceBuf":Ljava/lang/StringBuilder;
    const-string v3, "function "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 516
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v3

    const/16 v4, 0x78

    if-eq v3, v4, :cond_0

    .line 517
    const-string v3, "anonymous"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    :cond_0
    const/16 v3, 0x28

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 522
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    add-int/lit8 v4, v1, -0x1

    if-ge v3, v4, :cond_2

    .line 523
    if-lez v3, :cond_1

    .line 524
    const/16 v4, 0x2c

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 526
    :cond_1
    aget-object v4, v0, v3

    invoke-static {v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 522
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 528
    .end local v3    # "i":I
    :cond_2
    const-string v3, ") {"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 529
    if-eqz v1, :cond_3

    .line 531
    add-int/lit8 v3, v1, -0x1

    aget-object v3, v0, v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 532
    .local v3, "funBody":Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    .end local v3    # "funBody":Ljava/lang/String;
    :cond_3
    const-string v3, "\n}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 535
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 537
    .local v3, "source":Ljava/lang/String;
    const/4 v4, 0x1

    new-array v12, v4, [I

    .line 538
    .local v12, "linep":[I
    invoke-static {v12}, Lcom/trendmicro/hippo/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v5

    .line 539
    .local v5, "filename":Ljava/lang/String;
    const/4 v6, 0x0

    if-nez v5, :cond_4

    .line 540
    const-string v5, "<eval\'ed string>"

    .line 541
    aput v4, v12, v6

    move-object v13, v5

    goto :goto_1

    .line 539
    :cond_4
    move-object v13, v5

    .line 544
    .end local v5    # "filename":Ljava/lang/String;
    .local v13, "filename":Ljava/lang/String;
    :goto_1
    aget v4, v12, v6

    .line 545
    invoke-static {v6, v13, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->makeUrlForGeneratedScript(ZLjava/lang/String;I)Ljava/lang/String;

    move-result-object v14

    .line 547
    .local v14, "sourceURI":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v15

    .line 550
    .local v15, "global":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/Context;->getErrorReporter()Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v4

    invoke-static {v4}, Lcom/trendmicro/hippo/DefaultErrorReporter;->forEval(Lcom/trendmicro/hippo/ErrorReporter;)Lcom/trendmicro/hippo/ErrorReporter;

    move-result-object v16

    .line 552
    .local v16, "reporter":Lcom/trendmicro/hippo/ErrorReporter;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->createInterpreter()Lcom/trendmicro/hippo/Evaluator;

    move-result-object v17

    .line 553
    .local v17, "evaluator":Lcom/trendmicro/hippo/Evaluator;
    if-eqz v17, :cond_5

    .line 560
    const/4 v10, 0x1

    const/4 v11, 0x0

    move-object/from16 v4, p0

    move-object v5, v15

    move-object v6, v3

    move-object/from16 v7, v17

    move-object/from16 v8, v16

    move-object v9, v14

    invoke-virtual/range {v4 .. v11}, Lcom/trendmicro/hippo/Context;->compileFunction(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Evaluator;Lcom/trendmicro/hippo/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Function;

    move-result-object v4

    return-object v4

    .line 554
    :cond_5
    new-instance v4, Lcom/trendmicro/hippo/JavaScriptException;

    aget v5, v12, v6

    const-string v6, "Interpreter not present"

    invoke-direct {v4, v6, v13, v5}, Lcom/trendmicro/hippo/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v4
.end method

.method private realFunction(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/BaseFunction;
    .locals 3
    .param p1, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 313
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    invoke-interface {p1, v0}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 314
    .local v0, "x":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Delegator;

    if-eqz v1, :cond_0

    .line 315
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Delegator;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 317
    :cond_0
    instance-of v1, v0, Lcom/trendmicro/hippo/BaseFunction;

    if-eqz v1, :cond_1

    .line 318
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/BaseFunction;

    return-object v1

    .line 320
    :cond_1
    nop

    .line 321
    invoke-virtual {p2}, Lcom/trendmicro/hippo/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v1

    .line 320
    const-string v2, "msg.incompat.call"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private declared-synchronized setupDefaultPrototype()Ljava/lang/Object;
    .locals 4

    monitor-enter p0

    .line 464
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 465
    iget-object v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypeProperty:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 467
    .end local p0    # "this":Lcom/trendmicro/hippo/BaseFunction;
    :cond_0
    :try_start_1
    new-instance v0, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 468
    .local v0, "obj":Lcom/trendmicro/hippo/NativeObject;
    const/4 v1, 0x2

    .line 469
    .local v1, "attr":I
    const-string v2, "constructor"

    const/4 v3, 0x2

    invoke-virtual {v0, v2, p0, v3}, Lcom/trendmicro/hippo/NativeObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 473
    iput-object v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    .line 474
    invoke-static {p0}, Lcom/trendmicro/hippo/BaseFunction;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 475
    .local v2, "proto":Lcom/trendmicro/hippo/Scriptable;
    if-eq v2, v0, :cond_1

    .line 477
    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/NativeObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 479
    :cond_1
    monitor-exit p0

    return-object v0

    .line 463
    .end local v0    # "obj":Lcom/trendmicro/hippo/NativeObject;
    .end local v1    # "attr":I
    .end local v2    # "proto":Lcom/trendmicro/hippo/Scriptable;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 353
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 359
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/BaseFunction;->createObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 360
    .local v0, "result":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_1

    .line 361
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/trendmicro/hippo/BaseFunction;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 362
    .local v1, "val":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_0

    .line 363
    move-object v0, v1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 365
    .end local v1    # "val":Ljava/lang/Object;
    :cond_0
    goto :goto_0

    .line 366
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v1, p3}, Lcom/trendmicro/hippo/BaseFunction;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 367
    .restart local v1    # "val":Ljava/lang/Object;
    instance-of v2, v1, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v2, :cond_4

    .line 374
    move-object v0, v1

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 375
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    if-nez v2, :cond_2

    .line 376
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getClassPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 377
    .local v2, "proto":Lcom/trendmicro/hippo/Scriptable;
    if-eq v0, v2, :cond_2

    .line 378
    invoke-interface {v0, v2}, Lcom/trendmicro/hippo/Scriptable;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 381
    .end local v2    # "proto":Lcom/trendmicro/hippo/Scriptable;
    :cond_2
    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    if-nez v2, :cond_3

    .line 382
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 383
    .local v2, "parent":Lcom/trendmicro/hippo/Scriptable;
    if-eq v0, v2, :cond_3

    .line 384
    invoke-interface {v0, v2}, Lcom/trendmicro/hippo/Scriptable;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 388
    .end local v1    # "val":Ljava/lang/Object;
    .end local v2    # "parent":Lcom/trendmicro/hippo/Scriptable;
    :cond_3
    :goto_0
    return-object v0

    .line 370
    .restart local v1    # "val":Ljava/lang/Object;
    :cond_4
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad implementaion of call as constructor, name="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public createObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 403
    new-instance v0, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 404
    .local v0, "newInstance":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getClassPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 405
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/trendmicro/hippo/Scriptable;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 406
    return-object v0
.end method

.method decompile(II)Ljava/lang/String;
    .locals 3
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .line 419
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 420
    .local v0, "sb":Ljava/lang/StringBuilder;
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 421
    .local v1, "justbody":Z
    :goto_0
    if-nez v1, :cond_1

    .line 422
    const-string v2, "function "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    const-string v2, "() {\n\t"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    :cond_1
    const-string v2, "[native code, arity="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getArity()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 428
    const-string v2, "]\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 429
    if-nez v1, :cond_2

    .line 430
    const-string v2, "}\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 18
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 256
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    sget-object v2, Lcom/trendmicro/hippo/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 257
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 259
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v12

    .line 260
    .local v12, "id":I
    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v12, :pswitch_data_0

    .line 308
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 291
    :pswitch_0
    instance-of v4, v10, Lcom/trendmicro/hippo/Callable;

    if-eqz v4, :cond_2

    .line 294
    move-object v13, v10

    check-cast v13, Lcom/trendmicro/hippo/Callable;

    .line 295
    .local v13, "targetFunction":Lcom/trendmicro/hippo/Callable;
    array-length v14, v11

    .line 298
    .local v14, "argc":I
    if-lez v14, :cond_1

    .line 299
    aget-object v4, v11, v3

    invoke-static {v8, v4, v9}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 300
    .local v4, "boundThis":Lcom/trendmicro/hippo/Scriptable;
    add-int/lit8 v5, v14, -0x1

    new-array v5, v5, [Ljava/lang/Object;

    .line 301
    .local v5, "boundArgs":[Ljava/lang/Object;
    add-int/lit8 v6, v14, -0x1

    invoke-static {v11, v2, v5, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v15, v4

    move-object/from16 v16, v5

    goto :goto_0

    .line 303
    .end local v4    # "boundThis":Lcom/trendmicro/hippo/Scriptable;
    .end local v5    # "boundArgs":[Ljava/lang/Object;
    :cond_1
    const/4 v4, 0x0

    .line 304
    .restart local v4    # "boundThis":Lcom/trendmicro/hippo/Scriptable;
    sget-object v5, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object v15, v4

    move-object/from16 v16, v5

    .line 306
    .end local v4    # "boundThis":Lcom/trendmicro/hippo/Scriptable;
    .local v15, "boundThis":Lcom/trendmicro/hippo/Scriptable;
    .local v16, "boundArgs":[Ljava/lang/Object;
    :goto_0
    new-instance v17, Lcom/trendmicro/hippo/BoundFunction;

    move-object/from16 v2, v17

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object v5, v13

    move-object v6, v15

    move-object/from16 v7, v16

    invoke-direct/range {v2 .. v7}, Lcom/trendmicro/hippo/BoundFunction;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V

    return-object v17

    .line 292
    .end local v13    # "targetFunction":Lcom/trendmicro/hippo/Callable;
    .end local v14    # "argc":I
    .end local v15    # "boundThis":Lcom/trendmicro/hippo/Scriptable;
    .end local v16    # "boundArgs":[Ljava/lang/Object;
    :cond_2
    invoke-static/range {p4 .. p4}, Lcom/trendmicro/hippo/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 287
    :pswitch_1
    const/4 v4, 0x4

    if-ne v12, v4, :cond_3

    goto :goto_1

    :cond_3
    move v2, v3

    :goto_1
    invoke-static {v2, v8, v9, v10, v11}, Lcom/trendmicro/hippo/ScriptRuntime;->applyOrCall(ZLcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 271
    :pswitch_2
    invoke-direct {v0, v10, v1}, Lcom/trendmicro/hippo/BaseFunction;->realFunction(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v2

    .line 272
    .local v2, "realf":Lcom/trendmicro/hippo/BaseFunction;
    const/4 v4, 0x0

    .line 273
    .local v4, "indent":I
    const/4 v5, 0x2

    .line 274
    .local v5, "flags":I
    array-length v6, v11

    if-eqz v6, :cond_5

    .line 275
    aget-object v3, v11, v3

    invoke-static {v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v4

    .line 276
    if-ltz v4, :cond_4

    .line 277
    const/4 v5, 0x0

    goto :goto_2

    .line 279
    :cond_4
    const/4 v4, 0x0

    .line 282
    :cond_5
    :goto_2
    invoke-virtual {v2, v4, v5}, Lcom/trendmicro/hippo/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 265
    .end local v2    # "realf":Lcom/trendmicro/hippo/BaseFunction;
    .end local v4    # "indent":I
    .end local v5    # "flags":I
    :pswitch_3
    invoke-direct {v0, v10, v1}, Lcom/trendmicro/hippo/BaseFunction;->realFunction(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v2

    .line 266
    .restart local v2    # "realf":Lcom/trendmicro/hippo/BaseFunction;
    invoke-static {v11, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32([Ljava/lang/Object;I)I

    move-result v4

    .line 267
    .restart local v4    # "indent":I
    invoke-virtual {v2, v4, v3}, Lcom/trendmicro/hippo/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 262
    .end local v2    # "realf":Lcom/trendmicro/hippo/BaseFunction;
    .end local v4    # "indent":I
    :pswitch_4
    invoke-static {v8, v9, v11}, Lcom/trendmicro/hippo/BaseFunction;->jsConstructor(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V
    .locals 0
    .param p1, "ctor"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 216
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/IdFunctionObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 217
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->fillConstructorProperties(Lcom/trendmicro/hippo/IdFunctionObject;)V

    .line 218
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 7
    .param p1, "s"    # Ljava/lang/String;

    .line 101
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 102
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x5

    const/4 v5, 0x4

    if-eq v2, v5, :cond_4

    if-eq v2, v4, :cond_3

    const/4 v6, 0x6

    if-eq v2, v6, :cond_2

    const/16 v6, 0x9

    if-eq v2, v6, :cond_0

    goto :goto_0

    .line 106
    :cond_0
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 107
    .local v2, "c":I
    const/16 v6, 0x61

    if-ne v2, v6, :cond_1

    const-string v1, "arguments"

    const/4 v0, 0x5

    goto :goto_0

    .line 108
    :cond_1
    const/16 v6, 0x70

    if-ne v2, v6, :cond_5

    const-string v1, "prototype"

    const/4 v0, 0x4

    goto :goto_0

    .line 105
    .end local v2    # "c":I
    :cond_2
    const-string v1, "length"

    const/4 v0, 0x1

    goto :goto_0

    .line 104
    :cond_3
    const-string v1, "arity"

    const/4 v0, 0x2

    goto :goto_0

    .line 103
    :cond_4
    const-string v1, "name"

    const/4 v0, 0x3

    .line 111
    :cond_5
    :goto_0
    if-eqz v1, :cond_6

    if-eq v1, p1, :cond_6

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    const/4 v0, 0x0

    .line 117
    .end local v1    # "X":Ljava/lang/String;
    :cond_6
    if-nez v0, :cond_7

    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 120
    :cond_7
    const/4 v1, 0x1

    if-eq v0, v1, :cond_b

    const/4 v1, 0x2

    if-eq v0, v1, :cond_b

    const/4 v1, 0x3

    if-eq v0, v1, :cond_b

    if-eq v0, v5, :cond_9

    if-ne v0, v4, :cond_8

    .line 134
    iget v1, p0, Lcom/trendmicro/hippo/BaseFunction;->argumentsAttributes:I

    .line 135
    .local v1, "attr":I
    goto :goto_1

    .line 136
    .end local v1    # "attr":I
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 128
    :cond_9
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->hasPrototypeProperty()Z

    move-result v1

    if-nez v1, :cond_a

    .line 129
    return v3

    .line 131
    :cond_a
    iget v1, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypePropertyAttributes:I

    .line 132
    .restart local v1    # "attr":I
    goto :goto_1

    .line 124
    .end local v1    # "attr":I
    :cond_b
    const/4 v1, 0x7

    .line 125
    .restart local v1    # "attr":I
    nop

    .line 138
    :goto_1
    invoke-static {v1, v0}, Lcom/trendmicro/hippo/BaseFunction;->instanceIdInfo(II)I

    move-result v2

    return v2
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 570
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 571
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    if-eq v2, v3, :cond_4

    const/4 v3, 0x5

    if-eq v2, v3, :cond_3

    const/16 v3, 0x8

    if-eq v2, v3, :cond_1

    const/16 v3, 0xb

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 581
    :cond_0
    const-string v1, "constructor"

    const/4 v0, 0x1

    goto :goto_0

    .line 577
    :cond_1
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 578
    .local v2, "c":I
    const/16 v3, 0x6f

    if-ne v2, v3, :cond_2

    const-string v1, "toSource"

    const/4 v0, 0x3

    goto :goto_0

    .line 579
    :cond_2
    const/16 v3, 0x74

    if-ne v2, v3, :cond_6

    const-string v1, "toString"

    const/4 v0, 0x2

    goto :goto_0

    .line 576
    .end local v2    # "c":I
    :cond_3
    const-string v1, "apply"

    const/4 v0, 0x4

    goto :goto_0

    .line 572
    :cond_4
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 573
    .restart local v2    # "c":I
    const/16 v3, 0x62

    if-ne v2, v3, :cond_5

    const-string v1, "bind"

    const/4 v0, 0x6

    goto :goto_0

    .line 574
    :cond_5
    const/16 v3, 0x63

    if-ne v2, v3, :cond_6

    const-string v1, "call"

    const/4 v0, 0x5

    .line 583
    .end local v2    # "c":I
    :cond_6
    :goto_0
    if-eqz v1, :cond_7

    if-eq v1, p1, :cond_7

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    const/4 v0, 0x0

    .line 587
    .end local v1    # "X":Ljava/lang/String;
    :cond_7
    return v0
.end method

.method public getArity()I
    .locals 1

    .line 435
    const/4 v0, 0x0

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 40
    const-string v0, "Function"

    return-object v0
.end method

.method protected getClassPrototype()Lcom/trendmicro/hippo/Scriptable;
    .locals 2

    .line 339
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v0

    .line 340
    .local v0, "protoVal":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_0

    .line 341
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    return-object v1

    .line 343
    :cond_0
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .line 440
    const-string v0, ""

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .line 144
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

    .line 151
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 149
    :cond_0
    const-string v0, "arguments"

    return-object v0

    .line 148
    :cond_1
    const-string v0, "prototype"

    return-object v0

    .line 147
    :cond_2
    const-string v0, "name"

    return-object v0

    .line 146
    :cond_3
    const-string v0, "arity"

    return-object v0

    .line 145
    :cond_4
    const-string v0, "length"

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I

    .line 157
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

    .line 164
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 162
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;->getArguments()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 161
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 160
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 159
    :cond_3
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getArity()I

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 158
    :cond_4
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getLength()I

    move-result v0

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 437
    const/4 v0, 0x0

    return v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 93
    const/4 v0, 0x5

    return v0
.end method

.method protected getPrototypeProperty()Ljava/lang/Object;
    .locals 2

    .line 448
    iget-object v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    .line 449
    .local v0, "result":Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 452
    instance-of v1, p0, Lcom/trendmicro/hippo/NativeFunction;

    if-eqz v1, :cond_0

    .line 453
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;->setupDefaultPrototype()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 455
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    goto :goto_0

    .line 457
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_2

    .line 458
    const/4 v0, 0x0

    .line 460
    :cond_2
    :goto_0
    return-object v0
.end method

.method public getTypeOf()Ljava/lang/String;
    .locals 1

    .line 51
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->avoidObjectDetection()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "undefined"

    goto :goto_0

    :cond_0
    const-string v0, "function"

    :goto_0
    return-object v0
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 3
    .param p1, "instance"    # Lcom/trendmicro/hippo/Scriptable;

    .line 71
    const-string v0, "prototype"

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 72
    .local v0, "protoProp":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_0

    .line 73
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    invoke-static {p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->jsDelegatesTo(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v1

    return v1

    .line 75
    :cond_0
    nop

    .line 76
    invoke-virtual {p0}, Lcom/trendmicro/hippo/BaseFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v1

    .line 75
    const-string v2, "msg.instanceof.bad.prototype"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method protected hasPrototypeProperty()Z
    .locals 1

    .line 444
    iget-object v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    if-nez v0, :cond_1

    instance-of v0, p0, Lcom/trendmicro/hippo/NativeFunction;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 225
    packed-switch p1, :pswitch_data_0

    .line 232
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    :pswitch_0
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "bind"

    .local v1, "s":Ljava/lang/String;
    goto :goto_0

    .line 230
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "call"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 229
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "apply"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 228
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 227
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_0

    .line 226
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "constructor"

    .line 234
    .restart local v1    # "s":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/BaseFunction;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 235
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

.method public setImmunePrototypeProperty(Ljava/lang/Object;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 330
    iget v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypePropertyAttributes:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_1

    .line 333
    if-eqz p1, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    :goto_0
    iput-object v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    .line 334
    const/4 v0, 0x7

    iput v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypePropertyAttributes:I

    .line 335
    return-void

    .line 331
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method protected setInstanceIdAttributes(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .line 199
    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 207
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdAttributes(II)V

    .line 208
    return-void

    .line 204
    :cond_0
    iput p2, p0, Lcom/trendmicro/hippo/BaseFunction;->argumentsAttributes:I

    .line 205
    return-void

    .line 201
    :cond_1
    iput p2, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypePropertyAttributes:I

    .line 202
    return-void
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 170
    const/4 v0, 0x1

    if-eq p1, v0, :cond_7

    const/4 v1, 0x2

    if-eq p1, v1, :cond_7

    const/4 v1, 0x3

    if-eq p1, v1, :cond_7

    const/4 v1, 0x4

    if-eq p1, v1, :cond_4

    const/4 v1, 0x5

    if-eq p1, v1, :cond_0

    .line 193
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 194
    return-void

    .line 178
    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/BaseFunction;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v1, :cond_1

    .line 180
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 182
    :cond_1
    const-string v1, "arguments"

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/BaseFunction;->defaultHas(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 183
    invoke-virtual {p0, v1, p2}, Lcom/trendmicro/hippo/BaseFunction;->defaultPut(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 184
    :cond_2
    iget v1, p0, Lcom/trendmicro/hippo/BaseFunction;->argumentsAttributes:I

    and-int/2addr v0, v1

    if-nez v0, :cond_3

    .line 185
    iput-object p2, p0, Lcom/trendmicro/hippo/BaseFunction;->argumentsObj:Ljava/lang/Object;

    .line 187
    :cond_3
    :goto_0
    return-void

    .line 172
    :cond_4
    iget v1, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypePropertyAttributes:I

    and-int/2addr v0, v1

    if-nez v0, :cond_6

    .line 173
    if-eqz p2, :cond_5

    .line 174
    move-object v0, p2

    goto :goto_1

    :cond_5
    sget-object v0, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    :goto_1
    iput-object v0, p0, Lcom/trendmicro/hippo/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    .line 176
    :cond_6
    return-void

    .line 191
    :cond_7
    return-void
.end method
