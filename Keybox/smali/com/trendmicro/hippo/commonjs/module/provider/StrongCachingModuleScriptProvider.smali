.class public Lcom/trendmicro/hippo/commonjs/module/provider/StrongCachingModuleScriptProvider;
.super Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;
.source "StrongCachingModuleScriptProvider.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final modules:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;)V
    .locals 4
    .param p1, "moduleSourceProvider"    # Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;

    .line 34
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;-><init>(Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;)V

    .line 24
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    invoke-static {}, Lcom/trendmicro/hippo/commonjs/module/provider/StrongCachingModuleScriptProvider;->getConcurrencyLevel()I

    move-result v1

    const/16 v2, 0x10

    const/high16 v3, 0x3f400000    # 0.75f

    invoke-direct {v0, v2, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/StrongCachingModuleScriptProvider;->modules:Ljava/util/Map;

    .line 35
    return-void
.end method


# virtual methods
.method protected getLoadedModule(Ljava/lang/String;)Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    .locals 1
    .param p1, "moduleId"    # Ljava/lang/String;

    .line 39
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/StrongCachingModuleScriptProvider;->modules:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;

    return-object v0
.end method

.method protected putLoadedModule(Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Ljava/lang/Object;)V
    .locals 2
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "moduleScript"    # Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .param p3, "validator"    # Ljava/lang/Object;

    .line 45
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/StrongCachingModuleScriptProvider;->modules:Ljava/util/Map;

    new-instance v1, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;

    invoke-direct {v1, p2, p3}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;-><init>(Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Ljava/lang/Object;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    return-void
.end method
