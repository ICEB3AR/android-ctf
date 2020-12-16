.class public Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;
.super Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;
.source "SoftCachingModuleScriptProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private transient scriptRefQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "Lcom/trendmicro/hippo/Script;",
            ">;"
        }
    .end annotation
.end field

.field private transient scripts:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;)V
    .locals 4
    .param p1, "moduleSourceProvider"    # Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;

    .line 50
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;-><init>(Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;)V

    .line 36
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scriptRefQueue:Ljava/lang/ref/ReferenceQueue;

    .line 39
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 41
    invoke-static {}, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->getConcurrencyLevel()I

    move-result v1

    const/16 v2, 0x10

    const/high16 v3, 0x3f400000    # 0.75f

    invoke-direct {v0, v2, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scripts:Ljava/util/concurrent/ConcurrentMap;

    .line 51
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 7
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 117
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scriptRefQueue:Ljava/lang/ref/ReferenceQueue;

    .line 118
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scripts:Ljava/util/concurrent/ConcurrentMap;

    .line 119
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 120
    .local v0, "serScripts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;>;"
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 121
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;

    .line 122
    .local v3, "cachedModuleScript":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->getModule()Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    move-result-object v5

    .line 123
    invoke-virtual {v3}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->getValidator()Ljava/lang/Object;

    move-result-object v6

    .line 122
    invoke-virtual {p0, v4, v5, v6}, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->putLoadedModule(Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Ljava/lang/Object;)V

    .line 124
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;>;"
    .end local v3    # "cachedModuleScript":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    goto :goto_0

    .line 125
    :cond_0
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 5
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 130
    .local v0, "serScripts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;>;"
    iget-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scripts:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 131
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;>;"
    nop

    .line 132
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->getCachedModuleScript()Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;

    move-result-object v3

    .line 133
    .local v3, "cachedModuleScript":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    if-eqz v3, :cond_0

    .line 134
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;>;"
    .end local v3    # "cachedModuleScript":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    :cond_0
    goto :goto_0

    .line 137
    :cond_1
    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 138
    return-void
.end method


# virtual methods
.method protected getLoadedModule(Ljava/lang/String;)Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    .locals 2
    .param p1, "moduleId"    # Ljava/lang/String;

    .line 72
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scripts:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;

    .line 73
    .local v0, "scriptRef":Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->getCachedModuleScript()Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getModuleScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "moduleId"    # Ljava/lang/String;
    .param p3, "uri"    # Ljava/net/URI;
    .param p4, "base"    # Ljava/net/URI;
    .param p5, "paths"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 61
    :goto_0
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scriptRefQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;

    .line 62
    .local v0, "ref":Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;
    if-nez v0, :cond_0

    .line 63
    nop

    .line 67
    .end local v0    # "ref":Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->getModuleScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    move-result-object v0

    return-object v0

    .line 65
    .restart local v0    # "ref":Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scripts:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->getModuleId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .end local v0    # "ref":Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;
    goto :goto_0
.end method

.method protected putLoadedModule(Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Ljava/lang/Object;)V
    .locals 9
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "moduleScript"    # Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .param p3, "validator"    # Ljava/lang/Object;

    .line 80
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scripts:Ljava/util/concurrent/ConcurrentMap;

    new-instance v8, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;

    invoke-virtual {p2}, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;->getScript()Lcom/trendmicro/hippo/Script;

    move-result-object v2

    .line 81
    invoke-virtual {p2}, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;->getUri()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {p2}, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;->getBase()Ljava/net/URI;

    move-result-object v5

    iget-object v7, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;->scriptRefQueue:Ljava/lang/ref/ReferenceQueue;

    move-object v1, v8

    move-object v3, p1

    move-object v6, p3

    invoke-direct/range {v1 .. v7}, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;-><init>(Lcom/trendmicro/hippo/Script;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 80
    invoke-interface {v0, p1, v8}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    return-void
.end method
