.class final Lcom/trendmicro/hippo/Arguments;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "Arguments.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/Arguments$ThrowTypeError;
    }
.end annotation


# static fields
.field private static final FTAG:Ljava/lang/String; = "Arguments"

.field private static final Id_callee:I = 0x1

.field private static final Id_caller:I = 0x3

.field private static final Id_length:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x3

.field private static iteratorMethod:Lcom/trendmicro/hippo/BaseFunction; = null

.field private static final serialVersionUID:J = 0x3b55a7e02ae0c5a1L


# instance fields
.field private activation:Lcom/trendmicro/hippo/NativeCall;

.field private args:[Ljava/lang/Object;

.field private calleeAttr:I

.field private calleeObj:Ljava/lang/Object;

.field private callerAttr:I

.field private callerObj:Ljava/lang/Object;

.field private lengthAttr:I

.field private lengthObj:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 406
    new-instance v0, Lcom/trendmicro/hippo/Arguments$1;

    invoke-direct {v0}, Lcom/trendmicro/hippo/Arguments$1;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/Arguments;->iteratorMethod:Lcom/trendmicro/hippo/BaseFunction;

    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/NativeCall;)V
    .locals 6
    .param p1, "activation"    # Lcom/trendmicro/hippo/NativeCall;

    .line 26
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 440
    const/4 v0, 0x2

    iput v0, p0, Lcom/trendmicro/hippo/Arguments;->callerAttr:I

    .line 441
    iput v0, p0, Lcom/trendmicro/hippo/Arguments;->calleeAttr:I

    .line 442
    iput v0, p0, Lcom/trendmicro/hippo/Arguments;->lengthAttr:I

    .line 27
    iput-object p1, p0, Lcom/trendmicro/hippo/Arguments;->activation:Lcom/trendmicro/hippo/NativeCall;

    .line 29
    invoke-virtual {p1}, Lcom/trendmicro/hippo/NativeCall;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 30
    .local v1, "parent":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/Arguments;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 31
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptableObject;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Arguments;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 33
    iget-object v2, p1, Lcom/trendmicro/hippo/NativeCall;->originalArgs:[Ljava/lang/Object;

    iput-object v2, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    .line 34
    array-length v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/trendmicro/hippo/Arguments;->lengthObj:Ljava/lang/Object;

    .line 36
    iget-object v2, p1, Lcom/trendmicro/hippo/NativeCall;->function:Lcom/trendmicro/hippo/NativeFunction;

    .line 37
    .local v2, "f":Lcom/trendmicro/hippo/NativeFunction;
    iput-object v2, p0, Lcom/trendmicro/hippo/Arguments;->calleeObj:Ljava/lang/Object;

    .line 39
    invoke-virtual {v2}, Lcom/trendmicro/hippo/NativeFunction;->getLanguageVersion()I

    move-result v3

    .line 40
    .local v3, "version":I
    const/16 v4, 0x82

    if-gt v3, v4, :cond_0

    if-eqz v3, :cond_0

    .line 43
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/trendmicro/hippo/Arguments;->callerObj:Ljava/lang/Object;

    goto :goto_0

    .line 45
    :cond_0
    sget-object v4, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    iput-object v4, p0, Lcom/trendmicro/hippo/Arguments;->callerObj:Ljava/lang/Object;

    .line 48
    :goto_0
    sget-object v4, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    sget-object v5, Lcom/trendmicro/hippo/Arguments;->iteratorMethod:Lcom/trendmicro/hippo/BaseFunction;

    invoke-virtual {p0, v4, v5, v0}, Lcom/trendmicro/hippo/Arguments;->defineProperty(Lcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V

    .line 49
    return-void
.end method

.method private arg(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I

    .line 58
    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    array-length v1, v0

    if-gt v1, p1, :cond_0

    goto :goto_0

    .line 59
    :cond_0
    aget-object v0, v0, p1

    return-object v0

    .line 58
    :cond_1
    :goto_0
    sget-object v0, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method private getFromActivation(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I

    .line 70
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->activation:Lcom/trendmicro/hippo/NativeCall;

    iget-object v0, v0, Lcom/trendmicro/hippo/NativeCall;->function:Lcom/trendmicro/hippo/NativeFunction;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "argName":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/Arguments;->activation:Lcom/trendmicro/hippo/NativeCall;

    invoke-virtual {v1, v0, v1}, Lcom/trendmicro/hippo/NativeCall;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private putIntoActivation(ILjava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 65
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->activation:Lcom/trendmicro/hippo/NativeCall;

    iget-object v0, v0, Lcom/trendmicro/hippo/NativeCall;->function:Lcom/trendmicro/hippo/NativeFunction;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v0

    .line 66
    .local v0, "argName":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/Arguments;->activation:Lcom/trendmicro/hippo/NativeCall;

    invoke-virtual {v1, v0, v1, p2}, Lcom/trendmicro/hippo/NativeCall;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 67
    return-void
.end method

.method private removeArg(I)V
    .locals 2
    .param p1, "index"    # I

    .line 87
    monitor-enter p0

    .line 88
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    aget-object v0, v0, p1

    sget-object v1, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_1

    .line 89
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/trendmicro/hippo/Arguments;->activation:Lcom/trendmicro/hippo/NativeCall;

    iget-object v1, v1, Lcom/trendmicro/hippo/NativeCall;->originalArgs:[Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 90
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    sget-object v1, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    aput-object v1, v0, p1

    .line 94
    :cond_1
    monitor-exit p0

    .line 95
    return-void

    .line 94
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private replaceArg(ILjava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 75
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Arguments;->sharedWithActivation(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/Arguments;->putIntoActivation(ILjava/lang/Object;)V

    .line 78
    :cond_0
    monitor-enter p0

    .line 79
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/trendmicro/hippo/Arguments;->activation:Lcom/trendmicro/hippo/NativeCall;

    iget-object v1, v1, Lcom/trendmicro/hippo/NativeCall;->originalArgs:[Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    .line 80
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    aput-object p2, v0, p1

    .line 83
    monitor-exit p0

    .line 84
    return-void

    .line 83
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private sharedWithActivation(I)Z
    .locals 7
    .param p1, "index"    # I

    .line 123
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 124
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 125
    return v2

    .line 127
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/Arguments;->activation:Lcom/trendmicro/hippo/NativeCall;

    iget-object v1, v1, Lcom/trendmicro/hippo/NativeCall;->function:Lcom/trendmicro/hippo/NativeFunction;

    .line 128
    .local v1, "f":Lcom/trendmicro/hippo/NativeFunction;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/NativeFunction;->getParamCount()I

    move-result v3

    .line 129
    .local v3, "definedCount":I
    if-ge p1, v3, :cond_3

    .line 132
    add-int/lit8 v4, v3, -0x1

    if-ge p1, v4, :cond_2

    .line 133
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v4

    .line 134
    .local v4, "argName":Ljava/lang/String;
    add-int/lit8 v5, p1, 0x1

    .local v5, "i":I
    :goto_0
    if-ge v5, v3, :cond_2

    .line 135
    invoke-virtual {v1, v5}, Lcom/trendmicro/hippo/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 136
    return v2

    .line 134
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 140
    .end local v4    # "argName":Ljava/lang/String;
    .end local v5    # "i":I
    :cond_2
    const/4 v2, 0x1

    return v2

    .line 142
    :cond_3
    return v2
.end method


# virtual methods
.method defineAttributesForStrictMode()V
    .locals 6

    .line 392
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v0

    .line 393
    .local v0, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v1

    if-nez v1, :cond_0

    .line 394
    return-void

    .line 396
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;

    const-string v2, "caller"

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {p0, v2, v3, v1, v4}, Lcom/trendmicro/hippo/Arguments;->setGetterOrSetter(Ljava/lang/String;ILcom/trendmicro/hippo/Callable;Z)V

    .line 397
    new-instance v1, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;

    invoke-direct {v1, v2}, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v2, v3, v1, v3}, Lcom/trendmicro/hippo/Arguments;->setGetterOrSetter(Ljava/lang/String;ILcom/trendmicro/hippo/Callable;Z)V

    .line 398
    new-instance v1, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;

    const-string v5, "callee"

    invoke-direct {v1, v5}, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5, v3, v1, v4}, Lcom/trendmicro/hippo/Arguments;->setGetterOrSetter(Ljava/lang/String;ILcom/trendmicro/hippo/Callable;Z)V

    .line 399
    new-instance v1, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;

    invoke-direct {v1, v5}, Lcom/trendmicro/hippo/Arguments$ThrowTypeError;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5, v3, v1, v3}, Lcom/trendmicro/hippo/Arguments;->setGetterOrSetter(Ljava/lang/String;ILcom/trendmicro/hippo/Callable;Z)V

    .line 400
    const/4 v1, 0x6

    invoke-virtual {p0, v2, v1}, Lcom/trendmicro/hippo/Arguments;->setAttributes(Ljava/lang/String;I)V

    .line 401
    invoke-virtual {p0, v5, v1}, Lcom/trendmicro/hippo/Arguments;->setAttributes(Ljava/lang/String;I)V

    .line 402
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/Arguments;->callerObj:Ljava/lang/Object;

    .line 403
    iput-object v1, p0, Lcom/trendmicro/hippo/Arguments;->calleeObj:Ljava/lang/Object;

    .line 404
    return-void
.end method

.method protected defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V
    .locals 6
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "desc"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p4, "checkValid"    # Z

    .line 361
    invoke-super {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/IdScriptableObject;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 363
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 364
    .local v0, "d":D
    double-to-int v2, v0

    .line 365
    .local v2, "index":I
    int-to-double v3, v2

    cmpl-double v3, v0, v3

    if-eqz v3, :cond_0

    return-void

    .line 367
    :cond_0
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v3

    .line 368
    .local v3, "value":Ljava/lang/Object;
    sget-object v4, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-ne v3, v4, :cond_1

    return-void

    .line 370
    :cond_1
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/Arguments;->isAccessorDescriptor(Lcom/trendmicro/hippo/ScriptableObject;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 371
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Arguments;->removeArg(I)V

    .line 372
    return-void

    .line 375
    :cond_2
    const-string v4, "value"

    invoke-static {p3, v4}, Lcom/trendmicro/hippo/Arguments;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 376
    .local v4, "newValue":Ljava/lang/Object;
    sget-object v5, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-ne v4, v5, :cond_3

    return-void

    .line 378
    :cond_3
    invoke-direct {p0, v2, v4}, Lcom/trendmicro/hippo/Arguments;->replaceArg(ILjava/lang/Object;)V

    .line 380
    const-string v5, "writable"

    invoke-static {p3, v5}, Lcom/trendmicro/hippo/Arguments;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/trendmicro/hippo/Arguments;->isFalse(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 381
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Arguments;->removeArg(I)V

    .line 383
    :cond_4
    return-void
.end method

.method public delete(I)V
    .locals 1
    .param p1, "index"    # I

    .line 164
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 165
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Arguments;->removeArg(I)V

    .line 167
    :cond_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->delete(I)V

    .line 168
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 190
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 191
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 192
    .local v2, "s_length":I
    const/4 v3, 0x6

    if-ne v2, v3, :cond_2

    .line 193
    const/4 v3, 0x5

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 194
    .local v3, "c":I
    const/16 v4, 0x65

    if-ne v3, v4, :cond_0

    const-string v1, "callee"

    const/4 v0, 0x1

    goto :goto_0

    .line 195
    :cond_0
    const/16 v4, 0x68

    if-ne v3, v4, :cond_1

    const-string v1, "length"

    const/4 v0, 0x2

    goto :goto_0

    .line 196
    :cond_1
    const/16 v4, 0x72

    if-ne v3, v4, :cond_2

    const-string v1, "caller"

    const/4 v0, 0x3

    .line 198
    .end local v3    # "c":I
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 202
    .end local v1    # "X":Ljava/lang/String;
    .end local v2    # "s_length":I
    :cond_3
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v1

    .line 203
    .local v1, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v2

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-eqz v2, :cond_5

    .line 204
    if-eq v0, v4, :cond_4

    if-ne v0, v3, :cond_5

    .line 205
    :cond_4
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v2

    return v2

    .line 210
    :cond_5
    if-nez v0, :cond_6

    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v2

    return v2

    .line 213
    :cond_6
    if-eq v0, v4, :cond_9

    const/4 v2, 0x2

    if-eq v0, v2, :cond_8

    if-ne v0, v3, :cond_7

    .line 218
    iget v2, p0, Lcom/trendmicro/hippo/Arguments;->callerAttr:I

    .line 219
    .local v2, "attr":I
    goto :goto_1

    .line 223
    .end local v2    # "attr":I
    :cond_7
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 221
    :cond_8
    iget v2, p0, Lcom/trendmicro/hippo/Arguments;->lengthAttr:I

    .line 222
    .restart local v2    # "attr":I
    goto :goto_1

    .line 215
    .end local v2    # "attr":I
    :cond_9
    iget v2, p0, Lcom/trendmicro/hippo/Arguments;->calleeAttr:I

    .line 216
    .restart local v2    # "attr":I
    nop

    .line 225
    :goto_1
    invoke-static {v2, v0}, Lcom/trendmicro/hippo/Arguments;->instanceIdInfo(II)I

    move-result v3

    return v3
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 111
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v0

    .line 112
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 113
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 115
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Arguments;->sharedWithActivation(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 116
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Arguments;->getFromActivation(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 118
    :cond_1
    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 54
    const-string v0, "Arguments"

    return-object v0
.end method

.method getIds(ZZ)[Ljava/lang/Object;
    .locals 8
    .param p1, "getNonEnumerable"    # Z
    .param p2, "getSymbols"    # Z

    .line 289
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getIds(ZZ)[Ljava/lang/Object;

    move-result-object v0

    .line 290
    .local v0, "ids":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    array-length v2, v1

    if-eqz v2, :cond_6

    .line 291
    array-length v2, v1

    new-array v2, v2, [Z

    .line 292
    .local v2, "present":[Z
    array-length v1, v1

    .line 293
    .local v1, "extraCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v0

    const/4 v5, 0x1

    if-eq v3, v4, :cond_1

    .line 294
    aget-object v4, v0, v3

    .line 295
    .local v4, "id":Ljava/lang/Object;
    instance-of v6, v4, Ljava/lang/Integer;

    if-eqz v6, :cond_0

    .line 296
    move-object v6, v4

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 297
    .local v6, "index":I
    if-ltz v6, :cond_0

    iget-object v7, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    array-length v7, v7

    if-ge v6, v7, :cond_0

    .line 298
    aget-boolean v7, v2, v6

    if-nez v7, :cond_0

    .line 299
    aput-boolean v5, v2, v6

    .line 300
    add-int/lit8 v1, v1, -0x1

    .line 293
    .end local v4    # "id":Ljava/lang/Object;
    .end local v6    # "index":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 305
    .end local v3    # "i":I
    :cond_1
    if-nez p1, :cond_3

    .line 306
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_1
    array-length v4, v2

    if-ge v3, v4, :cond_3

    .line 307
    aget-boolean v4, v2, v3

    if-nez v4, :cond_2

    invoke-super {p0, v3, p0}, Lcom/trendmicro/hippo/IdScriptableObject;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 308
    aput-boolean v5, v2, v3

    .line 309
    add-int/lit8 v1, v1, -0x1

    .line 306
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 313
    .end local v3    # "i":I
    :cond_3
    if-eqz v1, :cond_6

    .line 314
    array-length v3, v0

    add-int/2addr v3, v1

    new-array v3, v3, [Ljava/lang/Object;

    .line 315
    .local v3, "tmp":[Ljava/lang/Object;
    const/4 v4, 0x0

    array-length v5, v0

    invoke-static {v0, v4, v3, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 316
    move-object v0, v3

    .line 317
    const/4 v4, 0x0

    .line 318
    .local v4, "offset":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    iget-object v6, p0, Lcom/trendmicro/hippo/Arguments;->args:[Ljava/lang/Object;

    array-length v6, v6

    if-eq v5, v6, :cond_5

    .line 319
    aget-boolean v6, v2, v5

    if-nez v6, :cond_4

    .line 320
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v0, v4

    .line 321
    add-int/lit8 v4, v4, 0x1

    .line 318
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 324
    .end local v5    # "i":I
    :cond_5
    if-eq v4, v1, :cond_6

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 327
    .end local v1    # "extraCount":I
    .end local v2    # "present":[Z
    .end local v3    # "tmp":[Ljava/lang/Object;
    .end local v4    # "offset":I
    :cond_6
    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I

    .line 233
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 238
    const/4 v0, 0x0

    return-object v0

    .line 236
    :cond_0
    const-string v0, "caller"

    return-object v0

    .line 235
    :cond_1
    const-string v0, "length"

    return-object v0

    .line 234
    :cond_2
    const-string v0, "callee"

    return-object v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .locals 3
    .param p1, "id"    # I

    .line 244
    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 259
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 248
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->callerObj:Ljava/lang/Object;

    .line 249
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    .line 250
    :cond_1
    if-nez v0, :cond_2

    .line 251
    iget-object v1, p0, Lcom/trendmicro/hippo/Arguments;->activation:Lcom/trendmicro/hippo/NativeCall;

    iget-object v1, v1, Lcom/trendmicro/hippo/NativeCall;->parentActivationCall:Lcom/trendmicro/hippo/NativeCall;

    .line 252
    .local v1, "caller":Lcom/trendmicro/hippo/NativeCall;
    if-eqz v1, :cond_2

    .line 253
    const-string v2, "arguments"

    invoke-virtual {v1, v2, v1}, Lcom/trendmicro/hippo/NativeCall;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 256
    .end local v1    # "caller":Lcom/trendmicro/hippo/NativeCall;
    :cond_2
    :goto_0
    return-object v0

    .line 246
    .end local v0    # "value":Ljava/lang/Object;
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->lengthObj:Ljava/lang/Object;

    return-object v0

    .line 245
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/hippo/Arguments;->calleeObj:Ljava/lang/Object;

    return-object v0
.end method

.method protected getMaxInstanceId()I
    .locals 1

    .line 182
    const/4 v0, 0x3

    return v0
.end method

.method protected getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;
    .locals 6
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .line 332
    instance-of v0, p2, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    .line 333
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v0

    return-object v0

    .line 335
    :cond_0
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 336
    .local v0, "d":D
    double-to-int v2, v0

    .line 337
    .local v2, "index":I
    int-to-double v3, v2

    cmpl-double v3, v0, v3

    if-eqz v3, :cond_1

    .line 338
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v3

    return-object v3

    .line 340
    :cond_1
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v3

    .line 341
    .local v3, "value":Ljava/lang/Object;
    sget-object v4, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-ne v3, v4, :cond_2

    .line 342
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v4

    return-object v4

    .line 344
    :cond_2
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Arguments;->sharedWithActivation(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 345
    invoke-direct {p0, v2}, Lcom/trendmicro/hippo/Arguments;->getFromActivation(I)Ljava/lang/Object;

    move-result-object v3

    .line 347
    :cond_3
    invoke-super {p0, v2, p0}, Lcom/trendmicro/hippo/IdScriptableObject;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 348
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->getOwnPropertyDescriptor(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v4

    .line 349
    .local v4, "desc":Lcom/trendmicro/hippo/ScriptableObject;
    const-string v5, "value"

    invoke-virtual {v4, v5, v4, v3}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 350
    return-object v4

    .line 352
    .end local v4    # "desc":Lcom/trendmicro/hippo/ScriptableObject;
    :cond_4
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Arguments;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    .line 353
    .local v4, "scope":Lcom/trendmicro/hippo/Scriptable;
    if-nez v4, :cond_5

    move-object v4, p0

    .line 354
    :cond_5
    const/4 v5, 0x0

    invoke-static {v4, v3, v5}, Lcom/trendmicro/hippo/Arguments;->buildDataDescriptor(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject;

    move-result-object v5

    return-object v5
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 102
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    .line 103
    const/4 v0, 0x1

    return v0

    .line 105
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 148
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Arguments;->arg(I)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/trendmicro/hippo/Arguments;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 149
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 151
    :cond_0
    invoke-direct {p0, p1, p3}, Lcom/trendmicro/hippo/Arguments;->replaceArg(ILjava/lang/Object;)V

    .line 153
    :goto_0
    return-void
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 158
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/IdScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 159
    return-void
.end method

.method protected setInstanceIdAttributes(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .line 278
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 283
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdAttributes(II)V

    .line 284
    return-void

    .line 281
    :cond_0
    iput p2, p0, Lcom/trendmicro/hippo/Arguments;->callerAttr:I

    return-void

    .line 280
    :cond_1
    iput p2, p0, Lcom/trendmicro/hippo/Arguments;->lengthAttr:I

    return-void

    .line 279
    :cond_2
    iput p2, p0, Lcom/trendmicro/hippo/Arguments;->calleeAttr:I

    return-void
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 265
    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    .line 272
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 273
    return-void

    .line 269
    :cond_0
    if-eqz p2, :cond_1

    move-object v0, p2

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    :goto_0
    iput-object v0, p0, Lcom/trendmicro/hippo/Arguments;->callerObj:Ljava/lang/Object;

    .line 270
    return-void

    .line 267
    :cond_2
    iput-object p2, p0, Lcom/trendmicro/hippo/Arguments;->lengthObj:Ljava/lang/Object;

    return-void

    .line 266
    :cond_3
    iput-object p2, p0, Lcom/trendmicro/hippo/Arguments;->calleeObj:Ljava/lang/Object;

    return-void
.end method
