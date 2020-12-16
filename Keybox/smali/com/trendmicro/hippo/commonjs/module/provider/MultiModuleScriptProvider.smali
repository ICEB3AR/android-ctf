.class public Lcom/trendmicro/hippo/commonjs/module/provider/MultiModuleScriptProvider;
.super Ljava/lang/Object;
.source "MultiModuleScriptProvider.java"

# interfaces
.implements Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;


# instance fields
.field private final providers:[Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;",
            ">;)V"
        }
    .end annotation

    .line 30
    .local p1, "providers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 32
    .local v0, "l":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    .line 33
    .local v2, "provider":Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .end local v2    # "provider":Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;
    goto :goto_0

    .line 35
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    iput-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/MultiModuleScriptProvider;->providers:[Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    .line 36
    return-void
.end method


# virtual methods
.method public getModuleScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .locals 10
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

    .line 41
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/MultiModuleScriptProvider;->providers:[Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v9, v0, v2

    .line 42
    .local v9, "provider":Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;
    move-object v3, v9

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move-object v8, p5

    invoke-interface/range {v3 .. v8}, Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;->getModuleScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    move-result-object v3

    .line 44
    .local v3, "script":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    if-eqz v3, :cond_0

    .line 45
    return-object v3

    .line 41
    .end local v3    # "script":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .end local v9    # "provider":Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 48
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method
