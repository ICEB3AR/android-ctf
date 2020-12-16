.class public Lcom/trendmicro/hippo/commonjs/module/Require;
.super Lcom/trendmicro/hippo/BaseFunction;
.source "Require.java"


# static fields
.field private static final loadingModuleInterfaces:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final exportedModuleInterfaces:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/Scriptable;",
            ">;"
        }
    .end annotation
.end field

.field private final loadLock:Ljava/lang/Object;

.field private mainExports:Lcom/trendmicro/hippo/Scriptable;

.field private mainModuleId:Ljava/lang/String;

.field private final moduleScriptProvider:Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

.field private final nativeScope:Lcom/trendmicro/hippo/Scriptable;

.field private final paths:Lcom/trendmicro/hippo/Scriptable;

.field private final postExec:Lcom/trendmicro/hippo/Script;

.field private final preExec:Lcom/trendmicro/hippo/Script;

.field private final sandboxed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/commonjs/module/Require;->loadingModuleInterfaces:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;Lcom/trendmicro/hippo/Script;Lcom/trendmicro/hippo/Script;Z)V
    .locals 2
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "nativeScope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "moduleScriptProvider"    # Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;
    .param p4, "preExec"    # Lcom/trendmicro/hippo/Script;
    .param p5, "postExec"    # Lcom/trendmicro/hippo/Script;
    .param p6, "sandboxed"    # Z

    .line 83
    invoke-direct {p0}, Lcom/trendmicro/hippo/BaseFunction;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->mainModuleId:Ljava/lang/String;

    .line 55
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->exportedModuleInterfaces:Ljava/util/Map;

    .line 57
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->loadLock:Ljava/lang/Object;

    .line 84
    iput-object p3, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->moduleScriptProvider:Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    .line 85
    iput-object p2, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->nativeScope:Lcom/trendmicro/hippo/Scriptable;

    .line 86
    iput-boolean p6, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->sandboxed:Z

    .line 87
    iput-object p4, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->preExec:Lcom/trendmicro/hippo/Script;

    .line 88
    iput-object p5, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->postExec:Lcom/trendmicro/hippo/Script;

    .line 89
    invoke-static {p2}, Lcom/trendmicro/hippo/ScriptableObject;->getFunctionPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/commonjs/module/Require;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 90
    if-nez p6, :cond_0

    .line 91
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/trendmicro/hippo/Context;->newArray(Lcom/trendmicro/hippo/Scriptable;I)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->paths:Lcom/trendmicro/hippo/Scriptable;

    .line 92
    const-string v1, "paths"

    invoke-static {p0, v1, v0}, Lcom/trendmicro/hippo/commonjs/module/Require;->defineReadOnlyProperty(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 95
    :cond_0
    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->paths:Lcom/trendmicro/hippo/Scriptable;

    .line 97
    :goto_0
    return-void
.end method

.method private static defineReadOnlyProperty(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p0, "obj"    # Lcom/trendmicro/hippo/ScriptableObject;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .line 357
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 358
    const/4 v0, 0x5

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/ScriptableObject;->setAttributes(Ljava/lang/String;I)V

    .line 360
    return-void
.end method

.method private executeModuleScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Z)Lcom/trendmicro/hippo/Scriptable;
    .locals 6
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "exports"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "moduleScript"    # Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .param p5, "isMain"    # Z

    .line 320
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->nativeScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject;

    .line 322
    .local v0, "moduleObject":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {p4}, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;->getUri()Ljava/net/URI;

    move-result-object v1

    .line 323
    .local v1, "uri":Ljava/net/URI;
    invoke-virtual {p4}, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;->getBase()Ljava/net/URI;

    move-result-object v2

    .line 324
    .local v2, "base":Ljava/net/URI;
    const-string v3, "id"

    invoke-static {v0, v3, p2}, Lcom/trendmicro/hippo/commonjs/module/Require;->defineReadOnlyProperty(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 325
    iget-boolean v3, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->sandboxed:Z

    if-nez v3, :cond_0

    .line 326
    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "uri"

    invoke-static {v0, v4, v3}, Lcom/trendmicro/hippo/commonjs/module/Require;->defineReadOnlyProperty(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 328
    :cond_0
    new-instance v3, Lcom/trendmicro/hippo/commonjs/module/ModuleScope;

    iget-object v4, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->nativeScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-direct {v3, v4, v1, v2}, Lcom/trendmicro/hippo/commonjs/module/ModuleScope;-><init>(Lcom/trendmicro/hippo/Scriptable;Ljava/net/URI;Ljava/net/URI;)V

    .line 333
    .local v3, "executionScope":Lcom/trendmicro/hippo/Scriptable;
    const-string v4, "exports"

    invoke-interface {v3, v4, v3, p3}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 334
    const-string v5, "module"

    invoke-interface {v3, v5, v3, v0}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 335
    invoke-virtual {v0, v4, v0, p3}, Lcom/trendmicro/hippo/ScriptableObject;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 336
    invoke-virtual {p0, v3}, Lcom/trendmicro/hippo/commonjs/module/Require;->install(Lcom/trendmicro/hippo/Scriptable;)V

    .line 337
    if-eqz p5, :cond_1

    .line 338
    const-string v5, "main"

    invoke-static {p0, v5, v0}, Lcom/trendmicro/hippo/commonjs/module/Require;->defineReadOnlyProperty(Lcom/trendmicro/hippo/ScriptableObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 340
    :cond_1
    iget-object v5, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->preExec:Lcom/trendmicro/hippo/Script;

    invoke-static {v5, p1, v3}, Lcom/trendmicro/hippo/commonjs/module/Require;->executeOptionalScript(Lcom/trendmicro/hippo/Script;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    .line 341
    invoke-virtual {p4}, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;->getScript()Lcom/trendmicro/hippo/Script;

    move-result-object v5

    invoke-interface {v5, p1, v3}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    .line 342
    iget-object v5, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->postExec:Lcom/trendmicro/hippo/Script;

    invoke-static {v5, p1, v3}, Lcom/trendmicro/hippo/commonjs/module/Require;->executeOptionalScript(Lcom/trendmicro/hippo/Script;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    .line 343
    iget-object v5, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->nativeScope:Lcom/trendmicro/hippo/Scriptable;

    .line 344
    invoke-static {v0, v4}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 343
    invoke-static {p1, v5, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->toObject(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    return-object v4
.end method

.method private static executeOptionalScript(Lcom/trendmicro/hippo/Script;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p0, "script"    # Lcom/trendmicro/hippo/Script;
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "executionScope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 350
    if-eqz p0, :cond_0

    .line 351
    invoke-interface {p0, p1, p2}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    .line 353
    :cond_0
    return-void
.end method

.method private getExportedModuleInterface(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Z)Lcom/trendmicro/hippo/Scriptable;
    .locals 15
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "uri"    # Ljava/net/URI;
    .param p4, "base"    # Ljava/net/URI;
    .param p5, "isMain"    # Z

    .line 231
    move-object v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    iget-object v0, v7, Lcom/trendmicro/hippo/commonjs/module/Require;->exportedModuleInterfaces:Ljava/util/Map;

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 232
    .local v0, "exports":Lcom/trendmicro/hippo/Scriptable;
    if-eqz v0, :cond_1

    .line 233
    if-nez p5, :cond_0

    .line 237
    return-object v0

    .line 234
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Attempt to set main module after it was loaded"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 241
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/commonjs/module/Require;->loadingModuleInterfaces:Ljava/lang/ThreadLocal;

    .line 242
    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 243
    .local v1, "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    if-eqz v1, :cond_3

    .line 244
    invoke-interface {v1, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    .line 245
    if-eqz v0, :cond_2

    .line 246
    return-object v0

    .line 245
    :cond_2
    move-object v2, v0

    goto :goto_0

    .line 243
    :cond_3
    move-object v2, v0

    .line 257
    .end local v0    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .local v2, "exports":Lcom/trendmicro/hippo/Scriptable;
    :goto_0
    iget-object v10, v7, Lcom/trendmicro/hippo/commonjs/module/Require;->loadLock:Ljava/lang/Object;

    monitor-enter v10

    .line 260
    :try_start_0
    iget-object v0, v7, Lcom/trendmicro/hippo/commonjs/module/Require;->exportedModuleInterfaces:Ljava/util/Map;

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Scriptable;

    move-object v2, v0

    .line 261
    if-eqz v2, :cond_4

    .line 262
    monitor-exit v10

    return-object v2

    .line 265
    :cond_4
    invoke-direct/range {p0 .. p4}, Lcom/trendmicro/hippo/commonjs/module/Require;->getModule(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;)Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    move-result-object v5

    .line 266
    .local v5, "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    iget-boolean v0, v7, Lcom/trendmicro/hippo/commonjs/module/Require;->sandboxed:Z

    if-eqz v0, :cond_6

    invoke-virtual {v5}, Lcom/trendmicro/hippo/commonjs/module/ModuleScript;->isSandboxed()Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_1

    .line 267
    :cond_5
    iget-object v0, v7, Lcom/trendmicro/hippo/commonjs/module/Require;->nativeScope:Lcom/trendmicro/hippo/Scriptable;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Module \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\" is not contained in sandbox."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v0, v3}, Lcom/trendmicro/hippo/ScriptRuntime;->throwError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;

    move-result-object v0

    .end local v1    # "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    .end local v2    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "id":Ljava/lang/String;
    .end local p3    # "uri":Ljava/net/URI;
    .end local p4    # "base":Ljava/net/URI;
    .end local p5    # "isMain":Z
    throw v0

    .line 270
    .restart local v1    # "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    .restart local v2    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "id":Ljava/lang/String;
    .restart local p3    # "uri":Ljava/net/URI;
    .restart local p4    # "base":Ljava/net/URI;
    .restart local p5    # "isMain":Z
    :cond_6
    :goto_1
    iget-object v0, v7, Lcom/trendmicro/hippo/commonjs/module/Require;->nativeScope:Lcom/trendmicro/hippo/Scriptable;

    invoke-virtual {v8, v0}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    move-object v11, v0

    .line 272
    .end local v2    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .local v11, "exports":Lcom/trendmicro/hippo/Scriptable;
    if-nez v1, :cond_7

    const/4 v0, 0x1

    goto :goto_2

    :cond_7
    const/4 v0, 0x0

    :goto_2
    move v12, v0

    .line 273
    .local v12, "outermostLocked":Z
    if-eqz v12, :cond_8

    .line 274
    :try_start_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v1, v0

    .line 275
    sget-object v0, Lcom/trendmicro/hippo/commonjs/module/Require;->loadingModuleInterfaces:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v13, v1

    goto :goto_3

    .line 313
    .end local v5    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .end local v12    # "outermostLocked":Z
    :catchall_0
    move-exception v0

    move-object v2, v11

    goto :goto_6

    .line 273
    .restart local v5    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .restart local v12    # "outermostLocked":Z
    :cond_8
    move-object v13, v1

    .line 285
    .end local v1    # "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    .local v13, "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    :goto_3
    :try_start_2
    invoke-interface {v13, v9, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 289
    const/4 v14, 0x0

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object v4, v11

    move/from16 v6, p5

    :try_start_3
    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/commonjs/module/Require;->executeModuleScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/commonjs/module/ModuleScript;Z)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 291
    .local v0, "newExports":Lcom/trendmicro/hippo/Scriptable;
    if-eq v11, v0, :cond_9

    .line 292
    invoke-interface {v13, v9, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 293
    move-object v1, v0

    move-object v2, v1

    .end local v11    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .local v1, "exports":Lcom/trendmicro/hippo/Scriptable;
    goto :goto_4

    .line 291
    .end local v1    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .restart local v11    # "exports":Lcom/trendmicro/hippo/Scriptable;
    :cond_9
    move-object v2, v11

    .line 302
    .end local v0    # "newExports":Lcom/trendmicro/hippo/Scriptable;
    .end local v11    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .restart local v2    # "exports":Lcom/trendmicro/hippo/Scriptable;
    :goto_4
    if-eqz v12, :cond_a

    .line 309
    :try_start_4
    iget-object v0, v7, Lcom/trendmicro/hippo/commonjs/module/Require;->exportedModuleInterfaces:Ljava/util/Map;

    invoke-interface {v0, v13}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 310
    sget-object v0, Lcom/trendmicro/hippo/commonjs/module/Require;->loadingModuleInterfaces:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, v14}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 313
    .end local v5    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .end local v12    # "outermostLocked":Z
    :cond_a
    monitor-exit v10
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 314
    return-object v2

    .line 313
    :catchall_1
    move-exception v0

    move-object v1, v13

    goto :goto_6

    .line 302
    .end local v2    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .restart local v5    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .restart local v11    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .restart local v12    # "outermostLocked":Z
    :catchall_2
    move-exception v0

    goto :goto_5

    .line 296
    :catch_0
    move-exception v0

    .line 298
    .local v0, "e":Ljava/lang/RuntimeException;
    :try_start_5
    invoke-interface {v13, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    nop

    .end local v5    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .end local v11    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .end local v12    # "outermostLocked":Z
    .end local v13    # "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "id":Ljava/lang/String;
    .end local p3    # "uri":Ljava/net/URI;
    .end local p4    # "base":Ljava/net/URI;
    .end local p5    # "isMain":Z
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 302
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .restart local v5    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .restart local v11    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .restart local v12    # "outermostLocked":Z
    .restart local v13    # "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "id":Ljava/lang/String;
    .restart local p3    # "uri":Ljava/net/URI;
    .restart local p4    # "base":Ljava/net/URI;
    .restart local p5    # "isMain":Z
    :goto_5
    if-eqz v12, :cond_b

    .line 309
    :try_start_6
    iget-object v1, v7, Lcom/trendmicro/hippo/commonjs/module/Require;->exportedModuleInterfaces:Ljava/util/Map;

    invoke-interface {v1, v13}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 310
    sget-object v1, Lcom/trendmicro/hippo/commonjs/module/Require;->loadingModuleInterfaces:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v14}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 312
    :cond_b
    nop

    .end local v11    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .end local v13    # "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "id":Ljava/lang/String;
    .end local p3    # "uri":Ljava/net/URI;
    .end local p4    # "base":Ljava/net/URI;
    .end local p5    # "isMain":Z
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 313
    .end local v5    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .end local v12    # "outermostLocked":Z
    .restart local v11    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .restart local v13    # "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "id":Ljava/lang/String;
    .restart local p3    # "uri":Ljava/net/URI;
    .restart local p4    # "base":Ljava/net/URI;
    .restart local p5    # "isMain":Z
    :catchall_3
    move-exception v0

    move-object v2, v11

    move-object v1, v13

    goto :goto_6

    .end local v11    # "exports":Lcom/trendmicro/hippo/Scriptable;
    .end local v13    # "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    .local v1, "threadLoadingModules":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;>;"
    .restart local v2    # "exports":Lcom/trendmicro/hippo/Scriptable;
    :catchall_4
    move-exception v0

    :goto_6
    :try_start_7
    monitor-exit v10
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    throw v0
.end method

.method private getModule(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;)Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .locals 6
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "uri"    # Ljava/net/URI;
    .param p4, "base"    # Ljava/net/URI;

    .line 364
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->moduleScriptProvider:Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    iget-object v5, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->paths:Lcom/trendmicro/hippo/Scriptable;

    .line 365
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-interface/range {v0 .. v5}, Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;->getModuleScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    move-result-object v0

    .line 366
    .local v0, "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    if-eqz v0, :cond_0

    .line 370
    return-object v0

    .line 367
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->nativeScope:Lcom/trendmicro/hippo/Scriptable;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Module \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\" not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->throwError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;

    move-result-object v1

    .end local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .end local p2    # "id":Ljava/lang/String;
    .end local p3    # "uri":Ljava/net/URI;
    .end local p4    # "base":Ljava/net/URI;
    throw v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 375
    .end local v0    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    .restart local p1    # "cx":Lcom/trendmicro/hippo/Context;
    .restart local p2    # "id":Ljava/lang/String;
    .restart local p3    # "uri":Ljava/net/URI;
    .restart local p4    # "base":Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 376
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 372
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 373
    .local v0, "e":Ljava/lang/RuntimeException;
    throw v0
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 180
    move-object v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    if-eqz v9, :cond_6

    array-length v0, v9

    const/4 v1, 0x1

    if-lt v0, v1, :cond_6

    .line 185
    const/4 v0, 0x0

    aget-object v1, v9, v0

    const-class v2, Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/Context;->jsToJava(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 186
    .local v1, "id":Ljava/lang/String;
    const/4 v2, 0x0

    .line 187
    .local v2, "uri":Ljava/net/URI;
    const/4 v3, 0x0

    .line 188
    .local v3, "base":Ljava/net/URI;
    const-string v4, "./"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "../"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    move-object v10, p0

    move-object v11, v1

    move-object v12, v2

    move-object v13, v3

    goto/16 :goto_1

    .line 189
    :cond_1
    :goto_0
    instance-of v4, v8, Lcom/trendmicro/hippo/commonjs/module/ModuleScope;

    if-eqz v4, :cond_5

    .line 195
    move-object v4, v8

    check-cast v4, Lcom/trendmicro/hippo/commonjs/module/ModuleScope;

    .line 196
    .local v4, "moduleScope":Lcom/trendmicro/hippo/commonjs/module/ModuleScope;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/commonjs/module/ModuleScope;->getBase()Ljava/net/URI;

    move-result-object v3

    .line 197
    invoke-virtual {v4}, Lcom/trendmicro/hippo/commonjs/module/ModuleScope;->getUri()Ljava/net/URI;

    move-result-object v5

    .line 198
    .local v5, "current":Ljava/net/URI;
    invoke-virtual {v5, v1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    .line 200
    if-nez v3, :cond_2

    .line 203
    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v10, p0

    move-object v11, v1

    move-object v12, v2

    move-object v13, v3

    goto :goto_1

    .line 206
    :cond_2
    invoke-virtual {v3, v5}, Ljava/net/URI;->relativize(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v10

    invoke-virtual {v10}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    .line 207
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v10, 0x2e

    if-ne v0, v10, :cond_4

    .line 210
    move-object v10, p0

    iget-boolean v0, v10, Lcom/trendmicro/hippo/commonjs/module/Require;->sandboxed:Z

    if-nez v0, :cond_3

    .line 214
    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v11, v1

    move-object v12, v2

    move-object v13, v3

    goto :goto_1

    .line 211
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Module \""

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "\" is not contained in sandbox."

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v7, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->throwError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;

    move-result-object v0

    throw v0

    .line 207
    :cond_4
    move-object v10, p0

    move-object v11, v1

    move-object v12, v2

    move-object v13, v3

    .line 218
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "uri":Ljava/net/URI;
    .end local v3    # "base":Ljava/net/URI;
    .end local v4    # "moduleScope":Lcom/trendmicro/hippo/commonjs/module/ModuleScope;
    .end local v5    # "current":Ljava/net/URI;
    .local v11, "id":Ljava/lang/String;
    .local v12, "uri":Ljava/net/URI;
    .local v13, "base":Ljava/net/URI;
    :goto_1
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, v11

    move-object v3, v12

    move-object v4, v13

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/commonjs/module/Require;->getExportedModuleInterface(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Z)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    return-object v0

    .line 190
    .end local v11    # "id":Ljava/lang/String;
    .end local v12    # "uri":Ljava/net/URI;
    .end local v13    # "base":Ljava/net/URI;
    .restart local v1    # "id":Ljava/lang/String;
    .restart local v2    # "uri":Ljava/net/URI;
    .restart local v3    # "base":Ljava/net/URI;
    :cond_5
    move-object v10, p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t resolve relative module ID \""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\" when require() is used outside of a module"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v7, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->throwError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;

    move-result-object v0

    throw v0

    .line 180
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "uri":Ljava/net/URI;
    .end local v3    # "base":Ljava/net/URI;
    :cond_6
    move-object v10, p0

    .line 181
    const-string v0, "require() needs one argument"

    invoke-static {p1, v7, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->throwError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;

    move-result-object v0

    throw v0
.end method

.method public construct(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 223
    const-string v0, "require() can not be invoked as a constructor"

    invoke-static {p1, p2, v0}, Lcom/trendmicro/hippo/ScriptRuntime;->throwError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;

    move-result-object v0

    throw v0
.end method

.method public getArity()I
    .locals 1

    .line 387
    const/4 v0, 0x1

    return v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .locals 1

    .line 382
    const-string v0, "require"

    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 392
    const/4 v0, 0x1

    return v0
.end method

.method public install(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 1
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;

    .line 173
    const-string v0, "require"

    invoke-static {p1, v0, p0}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 174
    return-void
.end method

.method public requireMain(Lcom/trendmicro/hippo/Context;Ljava/lang/String;)Lcom/trendmicro/hippo/Scriptable;
    .locals 9
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "mainModuleId"    # Ljava/lang/String;

    .line 117
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->mainModuleId:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 118
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->mainExports:Lcom/trendmicro/hippo/Scriptable;

    return-object v0

    .line 119
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Main module already set to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->mainModuleId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 128
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->moduleScriptProvider:Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->paths:Lcom/trendmicro/hippo/Scriptable;

    move-object v3, p1

    move-object v4, p2

    invoke-interface/range {v2 .. v7}, Lcom/trendmicro/hippo/commonjs/module/ModuleScriptProvider;->getModuleScript(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/commonjs/module/ModuleScript;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 134
    .local v0, "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    nop

    .line 136
    if-eqz v0, :cond_2

    .line 137
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/commonjs/module/Require;->getExportedModuleInterface(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Z)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->mainExports:Lcom/trendmicro/hippo/Scriptable;

    goto :goto_1

    .line 139
    :cond_2
    iget-boolean v1, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->sandboxed:Z

    if-nez v1, :cond_6

    .line 141
    const/4 v1, 0x0

    .line 145
    .local v1, "mainUri":Ljava/net/URI;
    :try_start_1
    new-instance v2, Ljava/net/URI;

    invoke-direct {v2, p2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    move-object v1, v2

    .line 148
    goto :goto_0

    .line 146
    :catch_0
    move-exception v2

    .line 151
    :goto_0
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/net/URI;->isAbsolute()Z

    move-result v2

    if-nez v2, :cond_4

    .line 152
    :cond_3
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 153
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 157
    invoke-virtual {v2}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v1

    .line 159
    .end local v2    # "file":Ljava/io/File;
    :cond_4
    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v3, p0

    move-object v4, p1

    move-object v6, v1

    invoke-direct/range {v3 .. v8}, Lcom/trendmicro/hippo/commonjs/module/Require;->getExportedModuleInterface(Lcom/trendmicro/hippo/Context;Ljava/lang/String;Ljava/net/URI;Ljava/net/URI;Z)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v2

    iput-object v2, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->mainExports:Lcom/trendmicro/hippo/Scriptable;

    goto :goto_1

    .line 154
    .restart local v2    # "file":Ljava/io/File;
    :cond_5
    iget-object v3, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->nativeScope:Lcom/trendmicro/hippo/Scriptable;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Module \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\" not found."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v3, v4}, Lcom/trendmicro/hippo/ScriptRuntime;->throwError(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Lcom/trendmicro/hippo/JavaScriptException;

    move-result-object v3

    throw v3

    .line 163
    .end local v1    # "mainUri":Ljava/net/URI;
    .end local v2    # "file":Ljava/io/File;
    :cond_6
    :goto_1
    iput-object p2, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->mainModuleId:Ljava/lang/String;

    .line 164
    iget-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/Require;->mainExports:Lcom/trendmicro/hippo/Scriptable;

    return-object v1

    .line 132
    .end local v0    # "moduleScript":Lcom/trendmicro/hippo/commonjs/module/ModuleScript;
    :catch_1
    move-exception v0

    .line 133
    .local v0, "x":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 130
    .end local v0    # "x":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 131
    .local v0, "x":Ljava/lang/RuntimeException;
    throw v0
.end method
