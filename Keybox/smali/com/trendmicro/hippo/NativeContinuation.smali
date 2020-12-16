.class public final Lcom/trendmicro/hippo/NativeContinuation;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeContinuation.java"

# interfaces
.implements Lcom/trendmicro/hippo/Function;


# static fields
.field private static final FTAG:Ljava/lang/Object;

.field private static final Id_constructor:I = 0x1

.field private static final MAX_PROTOTYPE_ID:I = 0x1

.field private static final serialVersionUID:J = 0x18e62980934d85f7L


# instance fields
.field private implementation:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    const-string v0, "Continuation"

    sput-object v0, Lcom/trendmicro/hippo/NativeContinuation;->FTAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    return-void
.end method

.method public static equalImplementations(Lcom/trendmicro/hippo/NativeContinuation;Lcom/trendmicro/hippo/NativeContinuation;)Z
    .locals 2
    .param p0, "c1"    # Lcom/trendmicro/hippo/NativeContinuation;
    .param p1, "c2"    # Lcom/trendmicro/hippo/NativeContinuation;

    .line 71
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeContinuation;->implementation:Ljava/lang/Object;

    iget-object v1, p1, Lcom/trendmicro/hippo/NativeContinuation;->implementation:Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static init(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "sealed"    # Z

    .line 22
    new-instance v0, Lcom/trendmicro/hippo/NativeContinuation;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeContinuation;-><init>()V

    .line 23
    .local v0, "obj":Lcom/trendmicro/hippo/NativeContinuation;
    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1, p2}, Lcom/trendmicro/hippo/NativeContinuation;->exportAsJSClass(ILcom/trendmicro/hippo/Scriptable;Z)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 24
    return-void
.end method

.method public static isContinuationConstructor(Lcom/trendmicro/hippo/IdFunctionObject;)Z
    .locals 2
    .param p0, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;

    .line 57
    sget-object v0, Lcom/trendmicro/hippo/NativeContinuation;->FTAG:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 58
    return v1

    .line 60
    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 52
    invoke-static {p0, p1, p2, p4}, Lcom/trendmicro/hippo/Interpreter;->restartContinuation(Lcom/trendmicro/hippo/NativeContinuation;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 45
    const-string v0, "Direct call is not supported"

    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/trendmicro/hippo/NativeContinuation;->FTAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 91
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 93
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 94
    .local v0, "id":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 98
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 96
    :cond_1
    const-string v1, "Direct call is not supported"

    invoke-static {v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError(Ljava/lang/String;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 108
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 109
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xb

    if-ne v2, v3, :cond_0

    const-string v1, "constructor"

    const/4 v0, 0x1

    .line 110
    :cond_0
    if-eqz v1, :cond_1

    if-eq v1, p1, :cond_1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v0, 0x0

    .line 114
    .end local v1    # "X":Ljava/lang/String;
    :cond_1
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 39
    const-string v0, "Continuation"

    return-object v0
.end method

.method public getImplementation()Ljava/lang/Object;
    .locals 1

    .line 28
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeContinuation;->implementation:Ljava/lang/Object;

    return-object v0
.end method

.method public initImplementation(Ljava/lang/Object;)V
    .locals 0
    .param p1, "implementation"    # Ljava/lang/Object;

    .line 33
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeContinuation;->implementation:Ljava/lang/Object;

    .line 34
    return-void
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 79
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 80
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 83
    .local v1, "s":Ljava/lang/String;
    sget-object v2, Lcom/trendmicro/hippo/NativeContinuation;->FTAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeContinuation;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 84
    return-void

    .line 81
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
