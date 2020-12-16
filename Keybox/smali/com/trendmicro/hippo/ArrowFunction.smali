.class public Lcom/trendmicro/hippo/ArrowFunction;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "ArrowFunction.java"


# static fields
.field private static final serialVersionUID:J = -0x6663e25d046ef419L


# instance fields
.field private final boundThis:Lcom/trendmicro/hippo/Scriptable;

.field private final targetFunction:Lcom/trendmicro/hippo/Callable;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "targetFunction"    # Lcom/trendmicro/hippo/Callable;
    .param p4, "boundThis"    # Lcom/trendmicro/hippo/Scriptable;

    .line 21
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 22
    iput-object p3, p0, Lcom/trendmicro/hippo/ArrowFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    .line 23
    iput-object p4, p0, Lcom/trendmicro/hippo/ArrowFunction;->boundThis:Lcom/trendmicro/hippo/Scriptable;

    .line 25
    invoke-static {p0, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->setFunctionProtoAndParent(Lcom/trendmicro/hippo/BaseFunction;Lcom/trendmicro/hippo/Scriptable;)V

    .line 27
    invoke-static {}, Lcom/trendmicro/hippo/ScriptRuntime;->typeErrorThrower()Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v0

    .line 28
    .local v0, "thrower":Lcom/trendmicro/hippo/Function;
    new-instance v1, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v1}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 29
    .local v1, "throwing":Lcom/trendmicro/hippo/NativeObject;
    const-string v2, "get"

    invoke-virtual {v1, v2, v1, v0}, Lcom/trendmicro/hippo/NativeObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 30
    const-string v2, "set"

    invoke-virtual {v1, v2, v1, v0}, Lcom/trendmicro/hippo/NativeObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 31
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "enumerable"

    invoke-virtual {v1, v4, v1, v3}, Lcom/trendmicro/hippo/NativeObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 32
    const-string v4, "configurable"

    invoke-virtual {v1, v4, v1, v3}, Lcom/trendmicro/hippo/NativeObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 33
    invoke-virtual {v1}, Lcom/trendmicro/hippo/NativeObject;->preventExtensions()V

    .line 35
    const-string v3, "caller"

    invoke-virtual {p0, p1, v3, v1, v2}, Lcom/trendmicro/hippo/ArrowFunction;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 36
    const-string v3, "arguments"

    invoke-virtual {p0, p1, v3, v1, v2}, Lcom/trendmicro/hippo/ArrowFunction;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 37
    return-void
.end method

.method static equalObjectGraphs(Lcom/trendmicro/hippo/ArrowFunction;Lcom/trendmicro/hippo/ArrowFunction;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z
    .locals 2
    .param p0, "f1"    # Lcom/trendmicro/hippo/ArrowFunction;
    .param p1, "f2"    # Lcom/trendmicro/hippo/ArrowFunction;
    .param p2, "eq"    # Lcom/trendmicro/hippo/EqualObjectGraphs;

    .line 82
    iget-object v0, p0, Lcom/trendmicro/hippo/ArrowFunction;->boundThis:Lcom/trendmicro/hippo/Scriptable;

    iget-object v1, p1, Lcom/trendmicro/hippo/ArrowFunction;->boundThis:Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ArrowFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    iget-object v1, p1, Lcom/trendmicro/hippo/ArrowFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 42
    iget-object v0, p0, Lcom/trendmicro/hippo/ArrowFunction;->boundThis:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 43
    .local v0, "callThis":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ArrowFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    invoke-interface {v1, p1, p2, v0, p4}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 48
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/trendmicro/hippo/ArrowFunction;->decompile(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, "msg.not.ctor"

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method decompile(II)Ljava/lang/String;
    .locals 2
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .line 75
    iget-object v0, p0, Lcom/trendmicro/hippo/ArrowFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    instance-of v1, v0, Lcom/trendmicro/hippo/BaseFunction;

    if-eqz v1, :cond_0

    .line 76
    check-cast v0, Lcom/trendmicro/hippo/BaseFunction;

    invoke-virtual {v0, p1, p2}, Lcom/trendmicro/hippo/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 78
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getArity()I
    .locals 1

    .line 69
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ArrowFunction;->getLength()I

    move-result v0

    return v0
.end method

.method public getLength()I
    .locals 2

    .line 61
    iget-object v0, p0, Lcom/trendmicro/hippo/ArrowFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    instance-of v1, v0, Lcom/trendmicro/hippo/BaseFunction;

    if-eqz v1, :cond_0

    .line 62
    check-cast v0, Lcom/trendmicro/hippo/BaseFunction;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/BaseFunction;->getLength()I

    move-result v0

    return v0

    .line 64
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "instance"    # Lcom/trendmicro/hippo/Scriptable;

    .line 53
    iget-object v0, p0, Lcom/trendmicro/hippo/ArrowFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    instance-of v1, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v1, :cond_0

    .line 54
    check-cast v0, Lcom/trendmicro/hippo/Function;

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Function;->hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0

    .line 56
    :cond_0
    const-string v0, "msg.not.ctor"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method
