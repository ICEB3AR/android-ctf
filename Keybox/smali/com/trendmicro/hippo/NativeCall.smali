.class public final Lcom/trendmicro/hippo/NativeCall;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeCall.java"


# static fields
.field private static final CALL_TAG:Ljava/lang/Object;

.field private static final Id_constructor:I = 0x1

.field private static final MAX_PROTOTYPE_ID:I = 0x1

.field private static final serialVersionUID:J = -0x67aff2d47ec02d36L


# instance fields
.field private arguments:Lcom/trendmicro/hippo/Arguments;

.field function:Lcom/trendmicro/hippo/NativeFunction;

.field isStrict:Z

.field originalArgs:[Ljava/lang/Object;

.field transient parentActivationCall:Lcom/trendmicro/hippo/NativeCall;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 21
    const-string v0, "Call"

    sput-object v0, Lcom/trendmicro/hippo/NativeCall;->CALL_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/NativeFunction;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;ZZ)V
    .locals 7
    .param p1, "function"    # Lcom/trendmicro/hippo/NativeFunction;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "isArrow"    # Z
    .param p5, "isStrict"    # Z

    .line 32
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeCall;->function:Lcom/trendmicro/hippo/NativeFunction;

    .line 35
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/NativeCall;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 38
    if-nez p3, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    goto :goto_0

    :cond_0
    move-object v0, p3

    :goto_0
    iput-object v0, p0, Lcom/trendmicro/hippo/NativeCall;->originalArgs:[Ljava/lang/Object;

    .line 39
    iput-boolean p5, p0, Lcom/trendmicro/hippo/NativeCall;->isStrict:Z

    .line 42
    invoke-virtual {p1}, Lcom/trendmicro/hippo/NativeFunction;->getParamAndVarCount()I

    move-result v0

    .line 43
    .local v0, "paramAndVarCount":I
    invoke-virtual {p1}, Lcom/trendmicro/hippo/NativeFunction;->getParamCount()I

    move-result v1

    .line 44
    .local v1, "paramCount":I
    const/4 v2, 0x4

    if-eqz v0, :cond_2

    .line 45
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_2

    .line 46
    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v4

    .line 47
    .local v4, "name":Ljava/lang/String;
    array-length v5, p3

    if-ge v3, v5, :cond_1

    aget-object v5, p3, v3

    goto :goto_2

    .line 48
    :cond_1
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    :goto_2
    nop

    .line 49
    .local v5, "val":Ljava/lang/Object;
    invoke-virtual {p0, v4, v5, v2}, Lcom/trendmicro/hippo/NativeCall;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 45
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "val":Ljava/lang/Object;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 55
    .end local v3    # "i":I
    :cond_2
    const-string v3, "arguments"

    invoke-super {p0, v3, p0}, Lcom/trendmicro/hippo/IdScriptableObject;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v4

    if-nez v4, :cond_3

    if-nez p4, :cond_3

    .line 56
    new-instance v4, Lcom/trendmicro/hippo/Arguments;

    invoke-direct {v4, p0}, Lcom/trendmicro/hippo/Arguments;-><init>(Lcom/trendmicro/hippo/NativeCall;)V

    iput-object v4, p0, Lcom/trendmicro/hippo/NativeCall;->arguments:Lcom/trendmicro/hippo/Arguments;

    .line 57
    invoke-virtual {p0, v3, v4, v2}, Lcom/trendmicro/hippo/NativeCall;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 60
    :cond_3
    if-eqz v0, :cond_6

    .line 61
    move v3, v1

    .restart local v3    # "i":I
    :goto_3
    if-ge v3, v0, :cond_6

    .line 62
    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/NativeFunction;->getParamOrVarName(I)Ljava/lang/String;

    move-result-object v4

    .line 63
    .restart local v4    # "name":Ljava/lang/String;
    invoke-super {p0, v4, p0}, Lcom/trendmicro/hippo/IdScriptableObject;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 64
    invoke-virtual {p1, v3}, Lcom/trendmicro/hippo/NativeFunction;->getParamOrVarConst(I)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 65
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    const/16 v6, 0xd

    invoke-virtual {p0, v4, v5, v6}, Lcom/trendmicro/hippo/NativeCall;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    goto :goto_4

    .line 67
    :cond_4
    sget-object v5, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {p0, v4, v5, v2}, Lcom/trendmicro/hippo/NativeCall;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 61
    .end local v4    # "name":Ljava/lang/String;
    :cond_5
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 71
    .end local v3    # "i":I
    :cond_6
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 25
    new-instance v0, Lcom/trendmicro/hippo/NativeCall;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeCall;-><init>()V

    .line 26
    .local v0, "obj":Lcom/trendmicro/hippo/NativeCall;
    const/4 v1, 0x1

    invoke-virtual {v0, v1, p0, p1}, Lcom/trendmicro/hippo/NativeCall;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 27
    return-void
.end method


# virtual methods
.method public defineAttributesForArguments()V
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeCall;->arguments:Lcom/trendmicro/hippo/Arguments;

    if-eqz v0, :cond_0

    .line 120
    invoke-virtual {v0}, Lcom/trendmicro/hippo/Arguments;->defineAttributesForStrictMode()V

    .line 122
    :cond_0
    return-void
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/trendmicro/hippo/NativeCall;->CALL_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 103
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 105
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 106
    .local v0, "id":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 107
    const-string v1, "Call"

    if-nez p4, :cond_1

    .line 110
    invoke-static {p2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->checkDeprecated(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)V

    .line 111
    new-instance v1, Lcom/trendmicro/hippo/NativeCall;

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeCall;-><init>()V

    .line 112
    .local v1, "result":Lcom/trendmicro/hippo/NativeCall;
    invoke-static {p3}, Lcom/trendmicro/hippo/NativeCall;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/NativeCall;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 113
    return-object v1

    .line 108
    .end local v1    # "result":Lcom/trendmicro/hippo/NativeCall;
    :cond_1
    const-string v2, "msg.only.from.new"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 115
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 82
    const-string v0, "constructor"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 76
    const-string v0, "Call"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 90
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 91
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 95
    .local v1, "s":Ljava/lang/String;
    sget-object v2, Lcom/trendmicro/hippo/NativeCall;->CALL_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeCall;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 96
    return-void

    .line 93
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
