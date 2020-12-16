.class public Lcom/trendmicro/hippo/BoundFunction;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "BoundFunction.java"


# static fields
.field private static final serialVersionUID:J = 0x1d6522b0e0a95d49L


# instance fields
.field private final boundArgs:[Ljava/lang/Object;

.field private final boundThis:Lcom/trendmicro/hippo/Scriptable;

.field private final length:I

.field private final targetFunction:Lcom/trendmicro/hippo/Callable;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "targetFunction"    # Lcom/trendmicro/hippo/Callable;
    .param p4, "boundThis"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "boundArgs"    # [Ljava/lang/Object;

    .line 25
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 26
    iput-object p3, p0, Lcom/trendmicro/hippo/BoundFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    .line 27
    iput-object p4, p0, Lcom/trendmicro/hippo/BoundFunction;->boundThis:Lcom/trendmicro/hippo/Scriptable;

    .line 28
    iput-object p5, p0, Lcom/trendmicro/hippo/BoundFunction;->boundArgs:[Ljava/lang/Object;

    .line 29
    instance-of v0, p3, Lcom/trendmicro/hippo/BaseFunction;

    const/4 v1, 0x0

    .line 41
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 29
    if-eqz v0, :cond_0

    .line 30
    move-object v0, p3

    check-cast v0, Lcom/trendmicro/hippo/BaseFunction;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/BaseFunction;->getLength()I

    move-result v0

    array-length v3, p5

    sub-int/2addr v0, v3

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/BoundFunction;->length:I

    goto :goto_0

    .line 32
    :cond_0
    iput v1, p0, Lcom/trendmicro/hippo/BoundFunction;->length:I

    .line 35
    :goto_0
    invoke-static {p0, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->setFunctionProtoAndParent(Lcom/trendmicro/hippo/BaseFunction;Lcom/trendmicro/hippo/Scriptable;)V

    .line 37
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeErrorThrower(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/BaseFunction;

    move-result-object v0

    .line 38
    .local v0, "thrower":Lcom/trendmicro/hippo/Function;
    new-instance v3, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v3}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 39
    .local v3, "throwing":Lcom/trendmicro/hippo/NativeObject;
    const-string v4, "get"

    invoke-virtual {v3, v4, v3, v0}, Lcom/trendmicro/hippo/NativeObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 40
    const-string v4, "set"

    invoke-virtual {v3, v4, v3, v0}, Lcom/trendmicro/hippo/NativeObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 41
    const-string v4, "enumerable"

    invoke-virtual {v3, v4, v3, v2}, Lcom/trendmicro/hippo/NativeObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 42
    const-string v4, "configurable"

    invoke-virtual {v3, v4, v3, v2}, Lcom/trendmicro/hippo/NativeObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 43
    invoke-virtual {v3}, Lcom/trendmicro/hippo/NativeObject;->preventExtensions()V

    .line 45
    const-string v2, "caller"

    invoke-virtual {p0, p1, v2, v3, v1}, Lcom/trendmicro/hippo/BoundFunction;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 46
    const-string v2, "arguments"

    invoke-virtual {p0, p1, v2, v3, v1}, Lcom/trendmicro/hippo/BoundFunction;->defineOwnProperty(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject;Z)V

    .line 47
    return-void
.end method

.method private concat([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 4
    .param p1, "first"    # [Ljava/lang/Object;
    .param p2, "second"    # [Ljava/lang/Object;

    .line 78
    array-length v0, p1

    array-length v1, p2

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/Object;

    .line 79
    .local v0, "args":[Ljava/lang/Object;
    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    array-length v1, p1

    array-length v3, p2

    invoke-static {p2, v2, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 81
    return-object v0
.end method

.method static equalObjectGraphs(Lcom/trendmicro/hippo/BoundFunction;Lcom/trendmicro/hippo/BoundFunction;Lcom/trendmicro/hippo/EqualObjectGraphs;)Z
    .locals 2
    .param p0, "f1"    # Lcom/trendmicro/hippo/BoundFunction;
    .param p1, "f2"    # Lcom/trendmicro/hippo/BoundFunction;
    .param p2, "eq"    # Lcom/trendmicro/hippo/EqualObjectGraphs;

    .line 85
    iget-object v0, p0, Lcom/trendmicro/hippo/BoundFunction;->boundThis:Lcom/trendmicro/hippo/Scriptable;

    iget-object v1, p1, Lcom/trendmicro/hippo/BoundFunction;->boundThis:Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/BoundFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    iget-object v1, p1, Lcom/trendmicro/hippo/BoundFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    invoke-virtual {p2, v0, v1}, Lcom/trendmicro/hippo/EqualObjectGraphs;->equalGraphs(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/BoundFunction;->boundArgs:[Ljava/lang/Object;

    iget-object v1, p1, Lcom/trendmicro/hippo/BoundFunction;->boundArgs:[Ljava/lang/Object;

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
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "extraArgs"    # [Ljava/lang/Object;

    .line 52
    iget-object v0, p0, Lcom/trendmicro/hippo/BoundFunction;->boundThis:Lcom/trendmicro/hippo/Scriptable;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopCallScope(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 53
    .local v0, "callThis":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/BoundFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    iget-object v2, p0, Lcom/trendmicro/hippo/BoundFunction;->boundArgs:[Ljava/lang/Object;

    invoke-direct {p0, v2, p4}, Lcom/trendmicro/hippo/BoundFunction;->concat([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, p1, p2, v0, v2}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "extraArgs"    # [Ljava/lang/Object;

    .line 58
    iget-object v0, p0, Lcom/trendmicro/hippo/BoundFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    instance-of v1, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v1, :cond_0

    .line 59
    check-cast v0, Lcom/trendmicro/hippo/Function;

    iget-object v1, p0, Lcom/trendmicro/hippo/BoundFunction;->boundArgs:[Ljava/lang/Object;

    invoke-direct {p0, v1, p3}, Lcom/trendmicro/hippo/BoundFunction;->concat([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, p1, p2, v1}, Lcom/trendmicro/hippo/Function;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 61
    :cond_0
    const-string v0, "msg.not.ctor"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method public getLength()I
    .locals 1

    .line 74
    iget v0, p0, Lcom/trendmicro/hippo/BoundFunction;->length:I

    return v0
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "instance"    # Lcom/trendmicro/hippo/Scriptable;

    .line 66
    iget-object v0, p0, Lcom/trendmicro/hippo/BoundFunction;->targetFunction:Lcom/trendmicro/hippo/Callable;

    instance-of v1, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v1, :cond_0

    .line 67
    check-cast v0, Lcom/trendmicro/hippo/Function;

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Function;->hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0

    .line 69
    :cond_0
    const-string v0, "msg.not.ctor"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method
