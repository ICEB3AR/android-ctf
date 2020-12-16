.class public Lcom/trendmicro/hippo/tools/shell/Environment;
.super Lcom/trendmicro/hippo/ScriptableObject;
.source "Environment.java"


# static fields
.field static final serialVersionUID:J = -0x5fa4044c42772a9L


# instance fields
.field private thePrototypeInstance:Lcom/trendmicro/hippo/tools/shell/Environment;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    invoke-direct {p0}, Lcom/trendmicro/hippo/ScriptableObject;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Environment;->thePrototypeInstance:Lcom/trendmicro/hippo/tools/shell/Environment;

    .line 49
    if-nez v0, :cond_0

    .line 50
    iput-object p0, p0, Lcom/trendmicro/hippo/tools/shell/Environment;->thePrototypeInstance:Lcom/trendmicro/hippo/tools/shell/Environment;

    .line 51
    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ScriptableObject;)V
    .locals 3
    .param p1, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 53
    invoke-direct {p0}, Lcom/trendmicro/hippo/ScriptableObject;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Environment;->thePrototypeInstance:Lcom/trendmicro/hippo/tools/shell/Environment;

    .line 54
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/shell/Environment;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 55
    const-string v0, "Environment"

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->getTopLevelProp(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 56
    .local v0, "ctor":Ljava/lang/Object;
    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_0

    .line 57
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    .line 58
    .local v1, "s":Lcom/trendmicro/hippo/Scriptable;
    const-string v2, "prototype"

    invoke-interface {v1, v2, v1}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/shell/Environment;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 60
    .end local v1    # "s":Lcom/trendmicro/hippo/Scriptable;
    :cond_0
    return-void
.end method

.method private collectIds()[Ljava/lang/Object;
    .locals 2

    .line 91
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    .line 92
    .local v0, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static defineClass(Lcom/trendmicro/hippo/ScriptableObject;)V
    .locals 3
    .param p0, "scope"    # Lcom/trendmicro/hippo/ScriptableObject;

    .line 37
    :try_start_0
    const-class v0, Lcom/trendmicro/hippo/tools/shell/Environment;

    invoke-static {p0, v0}, Lcom/trendmicro/hippo/ScriptableObject;->defineClass(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Class;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    nop

    .line 41
    return-void

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/Error;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 72
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Environment;->thePrototypeInstance:Lcom/trendmicro/hippo/tools/shell/Environment;

    if-ne p0, v0, :cond_0

    .line 73
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 75
    :cond_0
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 77
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/Environment;->getParentScope()Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    return-object v1

    .line 79
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    return-object v1
.end method

.method public getAllIds()[Ljava/lang/Object;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Environment;->thePrototypeInstance:Lcom/trendmicro/hippo/tools/shell/Environment;

    if-ne p0, v0, :cond_0

    .line 105
    invoke-super {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 106
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/shell/Environment;->collectIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 45
    const-string v0, "Environment"

    return-object v0
.end method

.method public getIds()[Ljava/lang/Object;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Environment;->thePrototypeInstance:Lcom/trendmicro/hippo/tools/shell/Environment;

    if-ne p0, v0, :cond_0

    .line 98
    invoke-super {p0}, Lcom/trendmicro/hippo/ScriptableObject;->getIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 99
    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/shell/Environment;->collectIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;

    .line 64
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Environment;->thePrototypeInstance:Lcom/trendmicro/hippo/tools/shell/Environment;

    if-ne p0, v0, :cond_0

    .line 65
    invoke-super {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v0

    return v0

    .line 67
    :cond_0
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 84
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Environment;->thePrototypeInstance:Lcom/trendmicro/hippo/tools/shell/Environment;

    if-ne p0, v0, :cond_0

    .line 85
    invoke-super {p0, p1, p2, p3}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_0

    .line 87
    :cond_0
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    :goto_0
    return-void
.end method
