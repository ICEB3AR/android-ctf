.class public Lcom/trendmicro/hippo/NativeWith;
.super Ljava/lang/Object;
.source "NativeWith.java"

# interfaces
.implements Lcom/trendmicro/hippo/Scriptable;
.implements Lcom/trendmicro/hippo/SymbolScriptable;
.implements Lcom/trendmicro/hippo/IdFunctionCall;
.implements Ljava/io/Serializable;


# static fields
.field private static final FTAG:Ljava/lang/Object;

.field private static final Id_constructor:I = 0x1

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected parent:Lcom/trendmicro/hippo/Scriptable;

.field protected prototype:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 227
    const-string v0, "With"

    sput-object v0, Lcom/trendmicro/hippo/NativeWith;->FTAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method protected constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "parent"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeWith;->parent:Lcom/trendmicro/hippo/Scriptable;

    .line 43
    iput-object p2, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 44
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 9
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 24
    new-instance v0, Lcom/trendmicro/hippo/NativeWith;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeWith;-><init>()V

    .line 26
    .local v0, "obj":Lcom/trendmicro/hippo/NativeWith;
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/NativeWith;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 27
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeWith;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 29
    new-instance v8, Lcom/trendmicro/hippo/IdFunctionObject;

    sget-object v3, Lcom/trendmicro/hippo/NativeWith;->FTAG:Ljava/lang/Object;

    const/4 v4, 0x1

    const-string v5, "With"

    const/4 v6, 0x0

    move-object v1, v8

    move-object v2, v0

    move-object v7, p0

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/IdFunctionObject;-><init>(Lcom/trendmicro/hippo/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILcom/trendmicro/hippo/Scriptable;)V

    .line 31
    .local v1, "ctor":Lcom/trendmicro/hippo/IdFunctionObject;
    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->markAsConstructor(Lcom/trendmicro/hippo/Scriptable;)V

    .line 32
    if-eqz p1, :cond_0

    .line 33
    invoke-virtual {v1}, Lcom/trendmicro/hippo/IdFunctionObject;->sealObject()V

    .line 35
    :cond_0
    invoke-virtual {v1}, Lcom/trendmicro/hippo/IdFunctionObject;->exportAsScopeProperty()V

    .line 36
    return-void
.end method

.method static isWithFunction(Ljava/lang/Object;)Z
    .locals 4
    .param p0, "functionObj"    # Ljava/lang/Object;

    .line 208
    instance-of v0, p0, Lcom/trendmicro/hippo/IdFunctionObject;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 209
    move-object v0, p0

    check-cast v0, Lcom/trendmicro/hippo/IdFunctionObject;

    .line 210
    .local v0, "f":Lcom/trendmicro/hippo/IdFunctionObject;
    sget-object v2, Lcom/trendmicro/hippo/NativeWith;->FTAG:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v2

    if-ne v2, v3, :cond_0

    move v1, v3

    :cond_0
    return v1

    .line 212
    .end local v0    # "f":Lcom/trendmicro/hippo/IdFunctionObject;
    :cond_1
    return v1
.end method

.method static newWithSpecial(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 217
    const-string v0, "With"

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->checkDeprecated(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)V

    .line 218
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getTopLevelScope(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object p1

    .line 219
    new-instance v0, Lcom/trendmicro/hippo/NativeWith;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeWith;-><init>()V

    .line 220
    .local v0, "thisObj":Lcom/trendmicro/hippo/NativeWith;
    array-length v1, p2

    if-nez v1, :cond_0

    .line 221
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptableObject;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    goto :goto_0

    .line 222
    :cond_0
    const/4 v1, 0x0

    aget-object v1, p2, v1

    invoke-static {p0, p1, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 220
    :goto_0
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeWith;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 223
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/NativeWith;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 224
    return-object v0
.end method


# virtual methods
.method public delete(I)V
    .locals 1
    .param p1, "index"    # I

    .line 147
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->delete(I)V

    .line 148
    return-void
.end method

.method public delete(Lcom/trendmicro/hippo/Symbol;)V
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 138
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    instance-of v1, v0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v1, :cond_0

    .line 139
    check-cast v0, Lcom/trendmicro/hippo/SymbolScriptable;

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/SymbolScriptable;->delete(Lcom/trendmicro/hippo/Symbol;)V

    .line 141
    :cond_0
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .line 132
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->delete(Ljava/lang/String;)V

    .line 133
    return-void
.end method

.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 198
    sget-object v0, Lcom/trendmicro/hippo/NativeWith;->FTAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 200
    const-string v0, "msg.cant.call.indirect"

    const-string v1, "With"

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EvaluatorException;

    move-result-object v0

    throw v0

    .line 203
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->unknown()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 96
    if-ne p2, p0, :cond_0

    .line 97
    iget-object p2, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 99
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/Scriptable;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 84
    if-ne p2, p0, :cond_0

    .line 85
    iget-object p2, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    instance-of v1, v0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v1, :cond_1

    .line 88
    check-cast v0, Lcom/trendmicro/hippo/SymbolScriptable;

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/SymbolScriptable;->get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 90
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 75
    if-ne p2, p0, :cond_0

    .line 76
    iget-object p2, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 48
    const-string v0, "With"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 177
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getParentScope()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->parent:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public getPrototype()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 69
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1, v0}, Lcom/trendmicro/hippo/Scriptable;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method public has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 60
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    instance-of v1, v0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v1, :cond_0

    .line 61
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/SymbolScriptable;

    invoke-interface {v1, p1, v0}, Lcom/trendmicro/hippo/SymbolScriptable;->has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0

    .line 63
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 54
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1, v0}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "value"    # Lcom/trendmicro/hippo/Scriptable;

    .line 182
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 124
    if-ne p2, p0, :cond_0

    .line 125
    iget-object p2, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 126
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1, p2, p3}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 127
    return-void
.end method

.method public put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 2
    .param p1, "symbol"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 113
    if-ne p2, p0, :cond_0

    .line 114
    iget-object p2, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 116
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    instance-of v1, v0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v1, :cond_1

    .line 117
    check-cast v0, Lcom/trendmicro/hippo/SymbolScriptable;

    invoke-interface {v0, p1, p2, p3}, Lcom/trendmicro/hippo/SymbolScriptable;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 119
    :cond_1
    return-void
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 105
    if-ne p2, p0, :cond_0

    .line 106
    iget-object p2, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1, p2, p3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 108
    return-void
.end method

.method public setParentScope(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "parent"    # Lcom/trendmicro/hippo/Scriptable;

    .line 167
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeWith;->parent:Lcom/trendmicro/hippo/Scriptable;

    .line 168
    return-void
.end method

.method public setPrototype(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 157
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeWith;->prototype:Lcom/trendmicro/hippo/Scriptable;

    .line 158
    return-void
.end method

.method protected updateDotQuery(Z)Ljava/lang/Object;
    .locals 1
    .param p1, "value"    # Z

    .line 191
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
