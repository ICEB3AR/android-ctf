.class public Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
.super Ljava/lang/Object;
.source "CachingModuleScriptProviderBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CachedModuleScript"
.end annotation


# instance fields
.field private final moduleScript:Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

.field private final validator:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Ljava/lang/Object;)V
    .locals 0
    .param p1, "moduleScript"    # Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .param p2, "validator"    # Ljava/lang/Object;

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    iput-object p1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->moduleScript:Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    .line 135
    iput-object p2, p0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->validator:Ljava/lang/Object;

    .line 136
    return-void
.end method


# virtual methods
.method getModule()Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->moduleScript:Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    return-object v0
.end method

.method getValidator()Ljava/lang/Object;
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->validator:Ljava/lang/Object;

    return-object v0
.end method
