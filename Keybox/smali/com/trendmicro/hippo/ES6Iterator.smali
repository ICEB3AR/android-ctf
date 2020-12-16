.class public abstract Lcom/trendmicro/hippo/ES6Iterator;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "ES6Iterator.java"


# static fields
.field public static final DONE_PROPERTY:Ljava/lang/String; = "done"

.field private static final Id_next:I = 0x1

.field private static final MAX_PROTOTYPE_ID:I = 0x3

.field public static final NEXT_METHOD:Ljava/lang/String; = "next"

.field private static final SymbolId_iterator:I = 0x2

.field private static final SymbolId_toStringTag:I = 0x3

.field public static final VALUE_PROPERTY:Ljava/lang/String; = "value"


# instance fields
.field protected exhausted:Z

.field private tag:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ES6Iterator;->exhausted:Z

    .line 33
    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V
    .locals 2
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "tag"    # Ljava/lang/String;

    .line 35
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ES6Iterator;->exhausted:Z

    .line 39
    iput-object p2, p0, Lcom/trendmicro/hippo/ES6Iterator;->tag:Ljava/lang/String;

    .line 40
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 41
    .local v0, "top":Lcom/trendmicro/hippo/Scriptable;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ES6Iterator;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 42
    nop

    .line 43
    invoke-static {v0, p2}, Lcom/trendmicro/hippo/ScriptableObject;->getTopScopeValue(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/IdScriptableObject;

    .line 44
    .local v1, "prototype":Lcom/trendmicro/hippo/IdScriptableObject;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ES6Iterator;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 45
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/ScriptableObject;ZLcom/trendmicro/hippo/IdScriptableObject;Ljava/lang/String;)V
    .locals 1
    .param p0, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p1, "sealed"    # Z
    .param p2, "prototype"    # Lcom/trendmicro/hippo/IdScriptableObject;
    .param p3, "tag"    # Ljava/lang/String;

    .line 12
    if-eqz p0, :cond_0

    .line 13
    invoke-virtual {p2, p0}, Lcom/trendmicro/hippo/IdScriptableObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 14
    invoke-static {p0}, Lcom/trendmicro/hippo/ES6Iterator;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/trendmicro/hippo/IdScriptableObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 16
    :cond_0
    const/4 v0, 0x3

    invoke-virtual {p2, v0}, Lcom/trendmicro/hippo/IdScriptableObject;->activatePrototypeMap(I)V

    .line 17
    if-eqz p1, :cond_1

    .line 18
    invoke-virtual {p2}, Lcom/trendmicro/hippo/IdScriptableObject;->sealObject()V

    .line 25
    :cond_1
    if-eqz p0, :cond_2

    .line 26
    invoke-virtual {p0, p3, p2}, Lcom/trendmicro/hippo/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    :cond_2
    return-void
.end method

.method private makeIteratorResult(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ZLjava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "done"    # Z
    .param p4, "value"    # Ljava/lang/Object;

    .line 127
    invoke-virtual {p1, p2}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 128
    .local v0, "iteratorResult":Lcom/trendmicro/hippo/Scriptable;
    const-string v1, "value"

    invoke-static {v0, v1, p4}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 129
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "done"

    invoke-static {v0, v2, v1}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 130
    return-object v0
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 68
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ES6Iterator;->getTag()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 71
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 73
    .local v0, "id":I
    instance-of v1, p4, Lcom/trendmicro/hippo/ES6Iterator;

    if-eqz v1, :cond_3

    .line 76
    move-object v1, p4

    check-cast v1, Lcom/trendmicro/hippo/ES6Iterator;

    .line 78
    .local v1, "iterator":Lcom/trendmicro/hippo/ES6Iterator;
    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    .line 82
    return-object v1

    .line 84
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    :cond_2
    invoke-virtual {v1, p2, p3}, Lcom/trendmicro/hippo/ES6Iterator;->next(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 74
    .end local v1    # "iterator":Lcom/trendmicro/hippo/ES6Iterator;
    :cond_3
    invoke-static {p1}, Lcom/trendmicro/hippo/ES6Iterator;->incompatibleCallError(Lcom/trendmicro/hippo/IdFunctionObject;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method protected findPrototypeId(Lcom/trendmicro/hippo/Symbol;)I
    .locals 1
    .param p1, "k"    # Lcom/trendmicro/hippo/Symbol;

    .line 90
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    const/4 v0, 0x2

    return v0

    .line 92
    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/SymbolKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 93
    const/4 v0, 0x3

    return v0

    .line 95
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 100
    const-string v0, "next"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 101
    const/4 v0, 0x1

    return v0

    .line 103
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected getTag()Ljava/lang/String;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/trendmicro/hippo/ES6Iterator;->tag:Ljava/lang/String;

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 8
    .param p1, "id"    # I

    .line 50
    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    .line 58
    sget-object v1, Lcom/trendmicro/hippo/SymbolKey;->TO_STRING_TAG:Lcom/trendmicro/hippo/SymbolKey;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ES6Iterator;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2, v0}, Lcom/trendmicro/hippo/ES6Iterator;->initPrototypeValue(ILcom/trendmicro/hippo/Symbol;Ljava/lang/Object;I)V

    .line 59
    return-void

    .line 60
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ES6Iterator;->getTag()Ljava/lang/String;

    move-result-object v3

    sget-object v5, Lcom/trendmicro/hippo/SymbolKey;->ITERATOR:Lcom/trendmicro/hippo/SymbolKey;

    const/4 v7, 0x3

    const-string v6, "[Symbol.iterator]"

    move-object v2, p0

    move v4, p1

    invoke-virtual/range {v2 .. v7}, Lcom/trendmicro/hippo/ES6Iterator;->initPrototypeMethod(Ljava/lang/Object;ILcom/trendmicro/hippo/Symbol;Ljava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 56
    return-void

    .line 52
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ES6Iterator;->getTag()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "next"

    invoke-virtual {p0, v0, p1, v2, v1}, Lcom/trendmicro/hippo/ES6Iterator;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 53
    return-void
.end method

.method protected abstract isDone(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Z
.end method

.method protected next(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 111
    sget-object v0, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    .line 112
    .local v0, "value":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/ES6Iterator;->isDone(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/trendmicro/hippo/ES6Iterator;->exhausted:Z

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v2

    .line 113
    .local v1, "done":Z
    :goto_1
    if-nez v1, :cond_2

    .line 114
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/ES6Iterator;->nextValue(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_2

    .line 116
    :cond_2
    iput-boolean v2, p0, Lcom/trendmicro/hippo/ES6Iterator;->exhausted:Z

    .line 118
    :goto_2
    invoke-direct {p0, p1, p2, v1, v0}, Lcom/trendmicro/hippo/ES6Iterator;->makeIteratorResult(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;ZLjava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    return-object v2
.end method

.method protected abstract nextValue(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
.end method
