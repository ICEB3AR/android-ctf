.class Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;
.super Ljava/lang/ref/SoftReference;
.source "SoftCachingModuleScriptProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScriptReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/SoftReference<",
        "Lcom/trendmicro/hippo/Script;",
        ">;"
    }
.end annotation


# instance fields
.field private final base:Ljava/net/URI;

.field private final moduleId:Ljava/lang/String;

.field private final uri:Ljava/net/URI;

.field private final validator:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Script;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V
    .locals 0
    .param p1, "script"    # Lcom/trendmicro/hippo/Script;
    .param p2, "moduleId"    # Ljava/lang/String;
    .param p3, "uri"    # Ljava/net/URI;
    .param p4, "base"    # Ljava/net/URI;
    .param p5, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/Script;",
            "Ljava/lang/String;",
            "Ljava/net/URI;",
            "Ljava/net/URI;",
            "Ljava/lang/Object;",
            "Ljava/lang/ref/ReferenceQueue<",
            "Lcom/trendmicro/hippo/Script;",
            ">;)V"
        }
    .end annotation

    .line 93
    .local p6, "refQueue":Ljava/lang/ref/ReferenceQueue;, "Ljava/lang/ref/ReferenceQueue<Lcom/trendmicro/hippo/Script;>;"
    invoke-direct {p0, p1, p6}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 94
    iput-object p2, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->moduleId:Ljava/lang/String;

    .line 95
    iput-object p3, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->uri:Ljava/net/URI;

    .line 96
    iput-object p4, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->base:Ljava/net/URI;

    .line 97
    iput-object p5, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->validator:Ljava/lang/Object;

    .line 98
    return-void
.end method


# virtual methods
.method getCachedModuleScript()Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    .locals 5

    .line 101
    invoke-virtual {p0}, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Script;

    .line 102
    .local v0, "script":Lcom/trendmicro/hippo/Script;
    if-nez v0, :cond_0

    .line 103
    const/4 v1, 0x0

    return-object v1

    .line 105
    :cond_0
    new-instance v1, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;

    new-instance v2, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    iget-object v3, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->uri:Ljava/net/URI;

    iget-object v4, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->base:Ljava/net/URI;

    invoke-direct {v2, v0, v3, v4}, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;-><init>(Lcom/trendmicro/hippo/Script;Ljava/net/URI;Ljava/net/URI;)V

    iget-object v3, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->validator:Ljava/lang/Object;

    invoke-direct {v1, v2, v3}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;-><init>(Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Ljava/lang/Object;)V

    return-object v1
.end method

.method getModuleId()Ljava/lang/String;
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/SoftCachingModuleScriptProvider$ScriptReference;->moduleId:Ljava/lang/String;

    return-object v0
.end method
