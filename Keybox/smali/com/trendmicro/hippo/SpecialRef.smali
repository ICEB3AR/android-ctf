.class Lcom/trendmicro/hippo/SpecialRef;
.super Lcom/trendmicro/hippo/Ref;
.source "SpecialRef.java"


# static fields
.field private static final SPECIAL_NONE:I = 0x0

.field private static final SPECIAL_PARENT:I = 0x2

.field private static final SPECIAL_PROTO:I = 0x1

.field private static final serialVersionUID:J = -0x686214493d5c9e97L


# instance fields
.field private name:Ljava/lang/String;

.field private target:Lcom/trendmicro/hippo/Scriptable;

.field private type:I


# direct methods
.method private constructor <init>(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/String;)V
    .locals 0
    .param p1, "target"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "type"    # I
    .param p3, "name"    # Ljava/lang/String;

    .line 22
    invoke-direct {p0}, Lcom/trendmicro/hippo/Ref;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    .line 24
    iput p2, p0, Lcom/trendmicro/hippo/SpecialRef;->type:I

    .line 25
    iput-object p3, p0, Lcom/trendmicro/hippo/SpecialRef;->name:Ljava/lang/String;

    .line 26
    return-void
.end method

.method static createSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/String;)Lcom/trendmicro/hippo/Ref;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "name"    # Ljava/lang/String;

    .line 31
    invoke-static {p0, p2, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 32
    .local v0, "target":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_3

    .line 37
    const-string v1, "__proto__"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 38
    const/4 v1, 0x1

    .local v1, "type":I
    goto :goto_0

    .line 39
    .end local v1    # "type":I
    :cond_0
    const-string v1, "__parent__"

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 40
    const/4 v1, 0x2

    .line 45
    .restart local v1    # "type":I
    :goto_0
    const/4 v2, 0x5

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/Context;->hasFeature(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 47
    const/4 v1, 0x0

    .line 50
    :cond_1
    new-instance v2, Lcom/trendmicro/hippo/SpecialRef;

    invoke-direct {v2, v0, v1, p3}, Lcom/trendmicro/hippo/SpecialRef;-><init>(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/String;)V

    return-object v2

    .line 42
    .end local v1    # "type":I
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 33
    :cond_3
    invoke-static {p2, p3}, Lcom/trendmicro/hippo/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public delete(Lcom/trendmicro/hippo/Context;)Z
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 124
    iget v0, p0, Lcom/trendmicro/hippo/SpecialRef;->type:I

    if-nez v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    iget-object v1, p0, Lcom/trendmicro/hippo/SpecialRef;->name:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->deleteObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z

    move-result v0

    return v0

    .line 127
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public get(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 56
    iget v0, p0, Lcom/trendmicro/hippo/SpecialRef;->type:I

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 62
    iget-object v0, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 64
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 60
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 58
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    iget-object v1, p0, Lcom/trendmicro/hippo/SpecialRef;->name:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->getObjectProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public has(Lcom/trendmicro/hippo/Context;)Z
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 115
    iget v0, p0, Lcom/trendmicro/hippo/SpecialRef;->type:I

    if-nez v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    iget-object v1, p0, Lcom/trendmicro/hippo/SpecialRef;->name:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->hasObjectElem(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Z

    move-result v0

    return v0

    .line 118
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public set(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 77
    iget v0, p0, Lcom/trendmicro/hippo/SpecialRef;->type:I

    if-eqz v0, :cond_7

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 108
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 83
    :cond_1
    :goto_0
    invoke-static {p1, p3, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObjectOrNull(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 84
    .local v0, "obj":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_5

    .line 87
    move-object v2, v0

    .line 89
    .local v2, "search":Lcom/trendmicro/hippo/Scriptable;
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    if-eq v2, v3, :cond_4

    .line 93
    iget v3, p0, Lcom/trendmicro/hippo/SpecialRef;->type:I

    if-ne v3, v1, :cond_3

    .line 94
    invoke-interface {v2}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    goto :goto_1

    .line 96
    :cond_3
    invoke-interface {v2}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 98
    :goto_1
    if-nez v2, :cond_2

    goto :goto_2

    .line 90
    :cond_4
    iget-object v1, p0, Lcom/trendmicro/hippo/SpecialRef;->name:Ljava/lang/String;

    const-string v3, "msg.cyclic.value"

    invoke-static {v3, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v1

    throw v1

    .line 100
    .end local v2    # "search":Lcom/trendmicro/hippo/Scriptable;
    :cond_5
    :goto_2
    iget v2, p0, Lcom/trendmicro/hippo/SpecialRef;->type:I

    if-ne v2, v1, :cond_6

    .line 101
    iget-object v1, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v1, v0}, Lcom/trendmicro/hippo/Scriptable;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    goto :goto_3

    .line 103
    :cond_6
    iget-object v1, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v1, v0}, Lcom/trendmicro/hippo/Scriptable;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 105
    :goto_3
    return-object v0

    .line 79
    .end local v0    # "obj":Lcom/trendmicro/hippo/Scriptable;
    :cond_7
    iget-object v0, p0, Lcom/trendmicro/hippo/SpecialRef;->target:Lcom/trendmicro/hippo/Scriptable;

    iget-object v1, p0, Lcom/trendmicro/hippo/SpecialRef;->name:Ljava/lang/String;

    invoke-static {v0, v1, p3, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->setObjectProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public set(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 71
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
