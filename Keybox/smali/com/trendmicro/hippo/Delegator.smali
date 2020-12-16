.class public Lcom/trendmicro/hippo/Delegator;
.super Ljava/lang/Object;
.source "Delegator.java"

# interfaces
.implements Lcom/trendmicro/hippo/Function;
.implements Lcom/trendmicro/hippo/SymbolScriptable;


# instance fields
.field protected obj:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/Delegator;->obj:Lcom/trendmicro/hippo/Scriptable;

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/Delegator;->obj:Lcom/trendmicro/hippo/Scriptable;

    .line 50
    iput-object p1, p0, Lcom/trendmicro/hippo/Delegator;->obj:Lcom/trendmicro/hippo/Scriptable;

    .line 51
    return-void
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 271
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Function;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 292
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 293
    .local v0, "myDelegee":Lcom/trendmicro/hippo/Scriptable;
    if-nez v0, :cond_1

    .line 295
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->newInstance()Lcom/trendmicro/hippo/Delegator;

    move-result-object v1

    .line 297
    .local v1, "n":Lcom/trendmicro/hippo/Delegator;
    array-length v2, p3

    if-nez v2, :cond_0

    .line 298
    new-instance v2, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v2}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .local v2, "delegee":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_0

    .line 300
    .end local v2    # "delegee":Lcom/trendmicro/hippo/Scriptable;
    :cond_0
    const/4 v2, 0x0

    aget-object v2, p3, v2

    invoke-static {p1, p2, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    .line 302
    .restart local v2    # "delegee":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/Delegator;->setDelegee(Lcom/trendmicro/hippo/Scriptable;)V

    .line 303
    return-object v1

    .line 305
    .end local v1    # "n":Lcom/trendmicro/hippo/Delegator;
    .end local v2    # "delegee":Lcom/trendmicro/hippo/Scriptable;
    :cond_1
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Function;

    invoke-interface {v1, p1, p2, p3}, Lcom/trendmicro/hippo/Function;->construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1
.end method

.method public delete(I)V
    .locals 1
    .param p1, "index"    # I

    .line 193
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->delete(I)V

    .line 194
    return-void
.end method

.method public delete(Lcom/trendmicro/hippo/Symbol;)V
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;

    .line 182
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 183
    .local v0, "delegee":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, v0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v1, :cond_0

    .line 184
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/SymbolScriptable;

    invoke-interface {v1, p1}, Lcom/trendmicro/hippo/SymbolScriptable;->delete(Lcom/trendmicro/hippo/Symbol;)V

    .line 186
    :cond_0
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 177
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->delete(Ljava/lang/String;)V

    .line 178
    return-void
.end method

.method public get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 117
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/Scriptable;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 105
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 106
    .local v0, "delegee":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, v0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v1, :cond_0

    .line 107
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/SymbolScriptable;

    invoke-interface {v1, p1, p2}, Lcom/trendmicro/hippo/SymbolScriptable;->get(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 109
    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v1
.end method

.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 100
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 92
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v0

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

    .line 250
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_1

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    if-eq p1, v0, :cond_1

    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 253
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1

    :cond_1
    :goto_0
    move-object v0, p0

    .line 250
    :goto_1
    return-object v0
.end method

.method public getDelegee()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/trendmicro/hippo/Delegator;->obj:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 1

    .line 233
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getParentScope()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 217
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public getPrototype()Lcom/trendmicro/hippo/Scriptable;
    .locals 1

    .line 201
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0}, Lcom/trendmicro/hippo/Scriptable;->getPrototype()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method public has(ILcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 142
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/Scriptable;->has(ILcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method public has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 2
    .param p1, "key"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 130
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 131
    .local v0, "delegee":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, v0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v1, :cond_0

    .line 132
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/SymbolScriptable;

    invoke-interface {v1, p1, p2}, Lcom/trendmicro/hippo/SymbolScriptable;->has(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v1

    return v1

    .line 134
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 125
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method public hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "instance"    # Lcom/trendmicro/hippo/Scriptable;

    .line 261
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->hasInstance(Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0
.end method

.method protected newInstance()Lcom/trendmicro/hippo/Delegator;
    .locals 2

    .line 62
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Delegator;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 169
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 170
    return-void
.end method

.method public put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 2
    .param p1, "symbol"    # Lcom/trendmicro/hippo/Symbol;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 158
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 159
    .local v0, "delegee":Lcom/trendmicro/hippo/Scriptable;
    instance-of v1, v0, Lcom/trendmicro/hippo/SymbolScriptable;

    if-eqz v1, :cond_0

    .line 160
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/SymbolScriptable;

    invoke-interface {v1, p1, p2, p3}, Lcom/trendmicro/hippo/SymbolScriptable;->put(Lcom/trendmicro/hippo/Symbol;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 162
    :cond_0
    return-void
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 150
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 151
    return-void
.end method

.method public setDelegee(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 84
    iput-object p1, p0, Lcom/trendmicro/hippo/Delegator;->obj:Lcom/trendmicro/hippo/Scriptable;

    .line 85
    return-void
.end method

.method public setParentScope(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "parent"    # Lcom/trendmicro/hippo/Scriptable;

    .line 225
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 226
    return-void
.end method

.method public setPrototype(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "prototype"    # Lcom/trendmicro/hippo/Scriptable;

    .line 209
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Delegator;->getDelegee()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/Scriptable;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 210
    return-void
.end method
