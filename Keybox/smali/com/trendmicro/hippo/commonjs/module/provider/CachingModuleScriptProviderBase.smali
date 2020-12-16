.class public abstract Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;
.super Ljava/lang/Object;
.source "CachingModuleScriptProviderBase.java"

# interfaces
.implements Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    }
.end annotation


# static fields
.field private static final loadConcurrencyLevel:I

.field private static final loadLockCount:I

.field private static final loadLockMask:I

.field private static final loadLockShift:I

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final loadLocks:[Ljava/lang/Object;

.field private final moduleSourceProvider:Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 32
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    sput v0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadConcurrencyLevel:I

    .line 37
    const/4 v0, 0x0

    .line 38
    .local v0, "sshift":I
    const/4 v1, 0x1

    .line 39
    .local v1, "ssize":I
    :goto_0
    sget v2, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadConcurrencyLevel:I

    if-ge v1, v2, :cond_0

    .line 40
    add-int/lit8 v0, v0, 0x1

    .line 41
    shl-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 43
    :cond_0
    rsub-int/lit8 v2, v0, 0x20

    sput v2, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLockShift:I

    .line 44
    add-int/lit8 v2, v1, -0x1

    sput v2, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLockMask:I

    .line 45
    sput v1, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLockCount:I

    .line 46
    .end local v0    # "sshift":I
    .end local v1    # "ssize":I
    return-void
.end method

.method protected constructor <init>(Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;)V
    .locals 3
    .param p1, "moduleSourceProvider"    # Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    sget v0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLockCount:I

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLocks:[Ljava/lang/Object;

    .line 48
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLocks:[Ljava/lang/Object;

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 49
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    aput-object v2, v1, v0

    .line 48
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 61
    .end local v0    # "i":I
    :cond_0
    iput-object p1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->moduleSourceProvider:Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;

    .line 62
    return-void
.end method

.method private static equal(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "o1"    # Ljava/lang/Object;
    .param p1, "o2"    # Ljava/lang/Object;

    .line 160
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method protected static getConcurrencyLevel()I
    .locals 1

    .line 168
    sget v0, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLockCount:I

    return v0
.end method

.method private static getValidator(Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;)Ljava/lang/Object;
    .locals 1
    .param p0, "cachedModule"    # Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;

    .line 156
    if-nez p0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->getValidator()Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0
.end method


# virtual methods
.method protected abstract getLoadedModule(Ljava/lang/String;)Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
.end method

.method public getModuleScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .locals 17
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "moduleId"    # Ljava/lang/String;
    .param p3, "moduleUri"    # Ljava/net/URI;
    .param p4, "baseUri"    # Ljava/net/URI;
    .param p5, "paths"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 68
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->getLoadedModule(Ljava/lang/String;)Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;

    move-result-object v4

    .line 69
    .local v4, "cachedModule1":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    invoke-static {v4}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->getValidator(Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;)Ljava/lang/Object;

    move-result-object v5

    .line 70
    .local v5, "validator1":Ljava/lang/Object;
    if-nez v3, :cond_0

    .line 71
    iget-object v0, v1, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->moduleSourceProvider:Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;

    move-object/from16 v6, p5

    invoke-interface {v0, v2, v6, v5}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;->loadSource(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v0

    move-object/from16 v7, p4

    goto :goto_0

    .line 72
    :cond_0
    move-object/from16 v6, p5

    iget-object v0, v1, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->moduleSourceProvider:Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;

    move-object/from16 v7, p4

    invoke-interface {v0, v3, v7, v5}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;->loadSource(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v0

    :goto_0
    move-object v8, v0

    .line 73
    .local v8, "moduleSource":Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    sget-object v0, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;->NOT_MODIFIED:Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    if-ne v8, v0, :cond_1

    .line 74
    invoke-virtual {v4}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->getModule()Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    move-result-object v0

    return-object v0

    .line 76
    :cond_1
    if-nez v8, :cond_2

    .line 77
    const/4 v0, 0x0

    return-object v0

    .line 79
    :cond_2
    invoke-virtual {v8}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;->getReader()Ljava/io/Reader;

    move-result-object v9

    .line 80
    .local v9, "reader":Ljava/io/Reader;
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    move v10, v0

    .line 81
    .local v10, "idHash":I
    iget-object v0, v1, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLocks:[Ljava/lang/Object;

    sget v11, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLockShift:I

    ushr-int v11, v10, v11

    sget v12, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->loadLockMask:I

    and-int/2addr v11, v12

    aget-object v11, v0, v11

    monitor-enter v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 82
    :try_start_1
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->getLoadedModule(Ljava/lang/String;)Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;

    move-result-object v0

    .line 83
    .local v0, "cachedModule2":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    if-eqz v0, :cond_4

    .line 84
    invoke-static {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->getValidator(Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;)Ljava/lang/Object;

    move-result-object v12

    invoke-static {v5, v12}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    .line 85
    invoke-virtual {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;->getModule()Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    move-result-object v12

    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    if-eqz v9, :cond_3

    invoke-virtual {v9}, Ljava/io/Reader;->close()V

    .line 85
    :cond_3
    return-object v12

    .line 88
    :cond_4
    :try_start_2
    invoke-virtual {v8}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;->getUri()Ljava/net/URI;

    move-result-object v12

    .line 89
    .local v12, "sourceUri":Ljava/net/URI;
    new-instance v13, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    .line 90
    invoke-virtual {v12}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v14

    .line 91
    invoke-virtual {v8}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;->getSecurityDomain()Ljava/lang/Object;

    move-result-object v15
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 90
    move-object/from16 v3, p1

    move-object/from16 v16, v0

    const/4 v0, 0x1

    .end local v0    # "cachedModule2":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    .local v16, "cachedModule2":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    :try_start_3
    invoke-virtual {v3, v9, v14, v0, v15}, Lcom/trendmicro/hippo/Context;->compileReader(Ljava/io/Reader;Ljava/lang/String;ILjava/lang/Object;)Lcom/trendmicro/hippo/Script;

    move-result-object v0

    .line 92
    invoke-virtual {v8}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;->getBase()Ljava/net/URI;

    move-result-object v14

    invoke-direct {v13, v0, v12, v14}, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;-><init>(Lcom/trendmicro/hippo/Script;Ljava/net/URI;Ljava/net/URI;)V

    move-object v0, v13

    .line 93
    .local v0, "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    nop

    .line 94
    invoke-virtual {v8}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;->getValidator()Ljava/lang/Object;

    move-result-object v13

    .line 93
    invoke-virtual {v1, v2, v0, v13}, Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase;->putLoadedModule(Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Ljava/lang/Object;)V

    .line 95
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 97
    if-eqz v9, :cond_5

    invoke-virtual {v9}, Ljava/io/Reader;->close()V

    .line 95
    :cond_5
    return-object v0

    .line 96
    .end local v0    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .end local v12    # "sourceUri":Ljava/net/URI;
    .end local v16    # "cachedModule2":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    :catchall_0
    move-exception v0

    move-object/from16 v3, p1

    :goto_1
    :try_start_4
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .end local v4    # "cachedModule1":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    .end local v5    # "validator1":Ljava/lang/Object;
    .end local v8    # "moduleSource":Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .end local v9    # "reader":Ljava/io/Reader;
    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "moduleId":Ljava/lang/String;
    .end local p3    # "moduleUri":Ljava/net/URI;
    .end local p4    # "baseUri":Ljava/net/URI;
    .end local p5    # "paths":Lcom/trendmicro/hippo/Scriptable;
    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 79
    .end local v10    # "idHash":I
    .restart local v4    # "cachedModule1":Lcom/trendmicro/hippo/commonjs/module/provider/CachingModuleScriptProviderBase$CachedModuleScript;
    .restart local v5    # "validator1":Ljava/lang/Object;
    .restart local v8    # "moduleSource":Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .restart local v9    # "reader":Ljava/io/Reader;
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "moduleId":Ljava/lang/String;
    .restart local p3    # "moduleUri":Ljava/net/URI;
    .restart local p4    # "baseUri":Ljava/net/URI;
    .restart local p5    # "paths":Lcom/trendmicro/hippo/Scriptable;
    :catchall_1
    move-exception v0

    goto :goto_2

    .line 96
    .restart local v10    # "idHash":I
    :catchall_2
    move-exception v0

    goto :goto_1

    .line 79
    .end local v10    # "idHash":I
    :catchall_3
    move-exception v0

    move-object/from16 v3, p1

    :goto_2
    move-object v10, v0

    if-eqz v9, :cond_6

    :try_start_6
    invoke-virtual {v9}, Ljava/io/Reader;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    goto :goto_3

    :catchall_4
    move-exception v0

    move-object v11, v0

    invoke-virtual {v10, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_3
    throw v10
.end method

.method protected abstract putLoadedModule(Ljava/lang/String;Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Ljava/lang/Object;)V
.end method
