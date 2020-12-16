.class public Lcom/trendmicro/keybox/HippoLoader;
.super Ljava/lang/Object;
.source "HippoLoader.java"


# instance fields
.field androidContextObject:Landroid/content/Context;

.field ciphertextKey:Ljava/lang/String;

.field imageView:Landroid/view/View;

.field password:Ljava/lang/String;

.field path_ciphertext:Ljava/lang/String;

.field path_preload:Ljava/lang/String;

.field preloadOnly:Z

.field singleton:Lcom/trendmicro/keybox/Singleton;

.field textView:Landroid/view/View;

.field titleView:Landroid/view/View;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/keybox/HippoLoader;->preloadOnly:Z

    .line 68
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 69
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/trendmicro/keybox/HippoLoader;->preloadOnly:Z

    .line 70
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "_preload/code.js"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    .line 71
    return-void
.end method

.method constructor <init>(I)V
    .locals 3
    .param p1, "hintlevel"    # I

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/keybox/HippoLoader;->preloadOnly:Z

    .line 61
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 62
    invoke-virtual {v1, p1}, Lcom/trendmicro/keybox/Singleton;->hintkey(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->ciphertextKey:Ljava/lang/String;

    .line 63
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "_preload/code.js"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    .line 64
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v0

    const-string v0, "key_%d/ciphertext.js"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/HippoLoader;->path_ciphertext:Ljava/lang/String;

    .line 65
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "level"    # Ljava/lang/String;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/keybox/HippoLoader;->preloadOnly:Z

    .line 42
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 44
    const-string v1, "main"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 45
    iget-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v1, v1, Lcom/trendmicro/keybox/Singleton;->hintkeymain:Ljava/lang/String;

    iput-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->ciphertextKey:Ljava/lang/String;

    .line 46
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "_preload/code.js"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    .line 47
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "_main/ciphertext.js"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/HippoLoader;->path_ciphertext:Ljava/lang/String;

    goto :goto_0

    .line 49
    :cond_0
    const-string v1, "flag"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 50
    const-string v1, "PineappleHead"

    iput-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->ciphertextKey:Ljava/lang/String;

    .line 51
    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "flag/code.js"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    .line 52
    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "flag/ciphertext.js"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/HippoLoader;->path_ciphertext:Ljava/lang/String;

    .line 57
    :cond_1
    :goto_0
    return-void
.end method

.method private Log(Ljava/lang/String;)V
    .locals 0
    .param p1, "str"    # Ljava/lang/String;

    .line 38
    return-void
.end method


# virtual methods
.method public decrypt_flag()Z
    .locals 22

    .line 328
    move-object/from16 v1, p0

    const-string v0, "code"

    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v2

    iput-object v2, v1, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 343
    iget-object v2, v1, Lcom/trendmicro/keybox/HippoLoader;->androidContextObject:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    .line 345
    .local v2, "assetManager":Landroid/content/res/AssetManager;
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v3

    .line 346
    .local v3, "contextFactory":Lcom/trendmicro/hippo/ContextFactory;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ContextFactory;->enterContext()Lcom/trendmicro/hippo/Context;

    move-result-object v10

    .line 347
    .local v10, "context":Lcom/trendmicro/hippo/Context;
    const/4 v4, -0x1

    invoke-virtual {v10, v4}, Lcom/trendmicro/hippo/Context;->setOptimizationLevel(I)V

    .line 348
    new-instance v4, Lcom/trendmicro/hippo/ImporterTopLevel;

    invoke-direct {v4, v10}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>(Lcom/trendmicro/hippo/Context;)V

    move-object v11, v4

    .line 356
    .local v11, "scope":Lcom/trendmicro/hippo/Scriptable;
    const/4 v12, 0x0

    const/4 v13, 0x1

    :try_start_0
    iget-object v4, v1, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    move-object v14, v4

    .line 357
    .local v14, "inputStream":Ljava/io/InputStream;
    invoke-virtual {v14}, Ljava/io/InputStream;->available()I

    move-result v4

    new-array v4, v4, [B

    move-object v15, v4

    .line 358
    .local v15, "resource_stub":[B
    invoke-virtual {v14, v15}, Ljava/io/InputStream;->read([B)I

    .line 359
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V

    .line 360
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v15}, Ljava/lang/String;-><init>([B)V

    move-object v9, v4

    .line 363
    .local v9, "code_stub":Ljava/lang/String;
    const-string v4, "androidContext"

    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->androidContextObject:Landroid/content/Context;

    invoke-static {v5, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v11, v4, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 364
    const-string v4, "imageView"

    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->imageView:Landroid/view/View;

    invoke-static {v5, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v11, v4, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 365
    const-string v4, "textView"

    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->textView:Landroid/view/View;

    invoke-static {v5, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v11, v4, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 366
    const-string v4, "titleView"

    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->titleView:Landroid/view/View;

    invoke-static {v5, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v11, v4, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 370
    invoke-static {v9, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v11, v0, v4}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 371
    const-string v4, "path_ciphertext"

    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->path_ciphertext:Ljava/lang/String;

    invoke-static {v5, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v11, v4, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 372
    const-string v4, "key"

    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->ciphertextKey:Ljava/lang/String;

    invoke-static {v5, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v11, v4, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 373
    const-string v4, "singleton"

    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    invoke-static {v5, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v11, v4, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 379
    iget-object v7, v1, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    const/4 v8, 0x1

    const/16 v16, 0x0

    move-object v4, v10

    move-object v5, v11

    move-object v6, v9

    move-object/from16 v17, v9

    .end local v9    # "code_stub":Ljava/lang/String;
    .local v17, "code_stub":Ljava/lang/String;
    move-object/from16 v9, v16

    invoke-virtual/range {v4 .. v9}, Lcom/trendmicro/hippo/Context;->evaluateString(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    .line 382
    const/4 v4, 0x0

    .line 383
    .local v4, "plaintext_code":Ljava/lang/Object;
    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->path_ciphertext:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    move-object v14, v5

    .line 384
    invoke-virtual {v14}, Ljava/io/InputStream;->available()I

    move-result v5

    new-array v5, v5, [B

    move-object v9, v5

    .line 385
    .local v9, "ciphertext_bytes":[B
    invoke-virtual {v14, v9}, Ljava/io/InputStream;->read([B)I

    move-result v5

    move/from16 v16, v5

    .line 387
    .local v16, "ciphertext_length":I
    const-string v5, "flag_ciphertext"

    invoke-static {v9, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v11, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 388
    const-string v5, "key0"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v6, v6, Lcom/trendmicro/keybox/Singleton;->flagkey0:Ljava/lang/String;

    invoke-static {v6, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v11, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 389
    const-string v5, "key1"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v6, v6, Lcom/trendmicro/keybox/Singleton;->flagkey1:Ljava/lang/String;

    invoke-static {v6, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v11, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 390
    const-string v5, "key2"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v6, v6, Lcom/trendmicro/keybox/Singleton;->flagkey2:Ljava/lang/String;

    invoke-static {v6, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v11, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 391
    const-string v5, "key3"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v6, v6, Lcom/trendmicro/keybox/Singleton;->flagkey3:Ljava/lang/String;

    invoke-static {v6, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v11, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 392
    const-string v5, "key4"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    iget-object v6, v6, Lcom/trendmicro/keybox/Singleton;->flagkey4:Ljava/lang/String;

    invoke-static {v6, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v11, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 396
    new-array v5, v13, [Ljava/lang/Object;

    .line 399
    .local v5, "params":[Ljava/lang/Object;
    const-string v6, "process"

    invoke-interface {v11, v6, v11}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    move-object v8, v6

    .line 402
    .local v8, "process_obj":Ljava/lang/Object;
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, v1, Lcom/trendmicro/keybox/HippoLoader;->ciphertextKey:Ljava/lang/String;

    aput-object v7, v6, v12

    aput-object v9, v6, v13

    const/4 v7, 0x2

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v18

    aput-object v18, v6, v7

    move-object v7, v6

    .line 405
    .end local v5    # "params":[Ljava/lang/Object;
    .local v7, "params":[Ljava/lang/Object;
    instance-of v5, v8, Lcom/trendmicro/hippo/Function;

    if-eqz v5, :cond_0

    .line 406
    move-object v5, v8

    check-cast v5, Lcom/trendmicro/hippo/Function;

    .line 407
    .local v5, "process":Lcom/trendmicro/hippo/Function;
    invoke-interface {v5, v10, v11, v11, v7}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v4, v6

    goto :goto_0

    .line 405
    .end local v5    # "process":Lcom/trendmicro/hippo/Function;
    :cond_0
    move-object v6, v4

    .line 410
    .end local v4    # "plaintext_code":Ljava/lang/Object;
    .local v6, "plaintext_code":Ljava/lang/Object;
    :goto_0
    move-object/from16 v18, v6

    check-cast v18, Ljava/lang/String;

    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->path_ciphertext:Ljava/lang/String;

    const/16 v19, 0x1

    const/16 v20, 0x0

    move-object v4, v10

    move-object/from16 v21, v5

    move-object v5, v11

    move-object v12, v6

    .end local v6    # "plaintext_code":Ljava/lang/Object;
    .local v12, "plaintext_code":Ljava/lang/Object;
    move-object/from16 v6, v18

    move-object v13, v7

    .end local v7    # "params":[Ljava/lang/Object;
    .local v13, "params":[Ljava/lang/Object;
    move-object/from16 v7, v21

    move-object/from16 v21, v8

    .end local v8    # "process_obj":Ljava/lang/Object;
    .local v21, "process_obj":Ljava/lang/Object;
    move/from16 v8, v19

    move-object/from16 v19, v9

    .end local v9    # "ciphertext_bytes":[B
    .local v19, "ciphertext_bytes":[B
    move-object/from16 v9, v20

    invoke-virtual/range {v4 .. v9}, Lcom/trendmicro/hippo/Context;->evaluateString(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    .line 413
    invoke-static {v12, v11}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v11, v0, v4}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 416
    const-string v0, "decrypt_flag"

    invoke-interface {v11, v0, v11}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 421
    .local v0, "obj":Ljava/lang/Object;
    instance-of v4, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v4, :cond_1

    .line 422
    move-object v4, v0

    check-cast v4, Lcom/trendmicro/hippo/Function;

    .line 425
    .local v4, "entrypoint":Lcom/trendmicro/hippo/Function;
    invoke-interface {v4, v10, v11, v11, v13}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 428
    .local v5, "result":Ljava/lang/Object;
    invoke-static {v5}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 430
    .local v6, "response":Ljava/lang/String;
    nop

    .line 448
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 430
    const/4 v7, 0x1

    return v7

    .line 432
    .end local v4    # "entrypoint":Lcom/trendmicro/hippo/Function;
    .end local v5    # "result":Ljava/lang/Object;
    .end local v6    # "response":Ljava/lang/String;
    :cond_1
    nop

    .line 448
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 432
    const/4 v4, 0x0

    return v4

    .line 448
    .end local v0    # "obj":Ljava/lang/Object;
    .end local v12    # "plaintext_code":Ljava/lang/Object;
    .end local v13    # "params":[Ljava/lang/Object;
    .end local v14    # "inputStream":Ljava/io/InputStream;
    .end local v15    # "resource_stub":[B
    .end local v16    # "ciphertext_length":I
    .end local v17    # "code_stub":Ljava/lang/String;
    .end local v19    # "ciphertext_bytes":[B
    .end local v21    # "process_obj":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 434
    :catch_0
    move-exception v0

    .line 436
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Lcom/trendmicro/hippo/JavaScriptException;

    if-ne v4, v5, :cond_2

    .line 437
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Javascript exception - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/trendmicro/keybox/HippoLoader;->Log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 448
    .end local v0    # "ex":Ljava/lang/Exception;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 449
    nop

    .line 451
    const/4 v4, 0x0

    return v4

    .line 440
    .restart local v0    # "ex":Ljava/lang/Exception;
    :cond_2
    :try_start_2
    const-string v4, "TMCTF"

    const-string v5, "Exception calling %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "decrypt_flag()"

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 445
    nop

    .line 448
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 445
    const/4 v4, 0x0

    return v4

    .line 448
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_1
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 449
    throw v0
.end method

.method public decrypt_key(I)Ljava/lang/String;
    .locals 18
    .param p1, "keynum"    # I

    .line 238
    move-object/from16 v1, p0

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "Calling decrypt_key(%d)"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "TMCTF"

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v0

    const-string v5, "key_%d/key_%d.enc"

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 253
    .local v3, "key_ciphertext_path":Ljava/lang/String;
    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->androidContextObject:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    .line 255
    .local v5, "assetManager":Landroid/content/res/AssetManager;
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v6

    .line 256
    .local v6, "contextFactory":Lcom/trendmicro/hippo/ContextFactory;
    invoke-virtual {v6}, Lcom/trendmicro/hippo/ContextFactory;->enterContext()Lcom/trendmicro/hippo/Context;

    move-result-object v13

    .line 257
    .local v13, "context":Lcom/trendmicro/hippo/Context;
    const/4 v7, -0x1

    invoke-virtual {v13, v7}, Lcom/trendmicro/hippo/Context;->setOptimizationLevel(I)V

    .line 258
    new-instance v7, Lcom/trendmicro/hippo/ImporterTopLevel;

    invoke-direct {v7, v13}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>(Lcom/trendmicro/hippo/Context;)V

    move-object v14, v7

    .line 266
    .local v14, "scope":Lcom/trendmicro/hippo/Scriptable;
    :try_start_0
    iget-object v7, v1, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    invoke-virtual {v5, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    move-object v15, v7

    .line 267
    .local v15, "inputStream":Ljava/io/InputStream;
    invoke-virtual {v15}, Ljava/io/InputStream;->available()I

    move-result v7

    new-array v7, v7, [B

    move-object v12, v7

    .line 268
    .local v12, "resource_stub":[B
    invoke-virtual {v15, v12}, Ljava/io/InputStream;->read([B)I

    .line 269
    invoke-virtual {v15}, Ljava/io/InputStream;->close()V

    .line 270
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v12}, Ljava/lang/String;-><init>([B)V

    .line 273
    .local v9, "code_stub":Ljava/lang/String;
    const-string v7, "androidContext"

    iget-object v8, v1, Lcom/trendmicro/keybox/HippoLoader;->androidContextObject:Landroid/content/Context;

    invoke-static {v8, v14}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v14, v7, v8}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 286
    iget-object v10, v1, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    const/4 v11, 0x1

    const/16 v16, 0x0

    move-object v7, v13

    move-object v8, v14

    move-object/from16 v17, v12

    .end local v12    # "resource_stub":[B
    .local v17, "resource_stub":[B
    move-object/from16 v12, v16

    invoke-virtual/range {v7 .. v12}, Lcom/trendmicro/hippo/Context;->evaluateString(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    .line 289
    const/4 v7, 0x0

    .line 290
    .local v7, "plaintext_code":Ljava/lang/Object;
    invoke-virtual {v5, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v8

    .line 291
    .end local v15    # "inputStream":Ljava/io/InputStream;
    .local v8, "inputStream":Ljava/io/InputStream;
    invoke-virtual {v8}, Ljava/io/InputStream;->available()I

    move-result v10

    new-array v10, v10, [B

    .line 292
    .local v10, "ciphertext_bytes":[B
    invoke-virtual {v8, v10}, Ljava/io/InputStream;->read([B)I

    move-result v11

    .line 294
    .local v11, "ciphertext_length":I
    const-string v12, "ciphertext_bytes"

    invoke-static {v10, v14}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v15

    invoke-static {v14, v12, v15}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 297
    const-string v12, "process"

    invoke-interface {v14, v12, v14}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v12

    .line 300
    .local v12, "process_obj":Ljava/lang/Object;
    new-array v2, v2, [Ljava/lang/Object;

    iget-object v15, v1, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move/from16 v4, p1

    :try_start_1
    invoke-virtual {v15, v4}, Lcom/trendmicro/keybox/Singleton;->keykey(I)Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    aput-object v15, v2, v16

    aput-object v10, v2, v0

    move-object v0, v2

    .line 303
    .local v0, "params":[Ljava/lang/Object;
    instance-of v2, v12, Lcom/trendmicro/hippo/Function;

    if-eqz v2, :cond_0

    .line 304
    move-object v2, v12

    check-cast v2, Lcom/trendmicro/hippo/Function;

    .line 305
    .local v2, "process":Lcom/trendmicro/hippo/Function;
    invoke-interface {v2, v13, v14, v14, v0}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    move-object v7, v15

    .line 308
    .end local v2    # "process":Lcom/trendmicro/hippo/Function;
    :cond_0
    move-object v2, v7

    check-cast v2, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 319
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 308
    return-object v2

    .line 310
    .end local v0    # "params":[Ljava/lang/Object;
    .end local v7    # "plaintext_code":Ljava/lang/Object;
    .end local v8    # "inputStream":Ljava/io/InputStream;
    .end local v9    # "code_stub":Ljava/lang/String;
    .end local v10    # "ciphertext_bytes":[B
    .end local v11    # "ciphertext_length":I
    .end local v12    # "process_obj":Ljava/lang/Object;
    .end local v17    # "resource_stub":[B
    :catch_0
    move-exception v0

    goto :goto_0

    .line 319
    :catchall_0
    move-exception v0

    move/from16 v4, p1

    goto :goto_1

    .line 310
    :catch_1
    move-exception v0

    move/from16 v4, p1

    .line 311
    .local v0, "ex":Ljava/lang/Exception;
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-class v7, Lcom/trendmicro/hippo/JavaScriptException;

    const/4 v8, 0x0

    if-ne v2, v7, :cond_1

    .line 312
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Javascript exception - "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/trendmicro/keybox/HippoLoader;->Log(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 319
    .end local v0    # "ex":Ljava/lang/Exception;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 320
    nop

    .line 322
    return-object v8

    .line 314
    .restart local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    :try_start_3
    const-string v2, "Exception in decrypt_key()"

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v2, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/trendmicro/keybox/HippoLoader;->Log(Ljava/lang/String;)V

    .line 315
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 316
    nop

    .line 319
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 316
    return-object v8

    .line 319
    .end local v0    # "ex":Ljava/lang/Exception;
    :catchall_1
    move-exception v0

    :goto_1
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 320
    throw v0
.end method

.method public entrypoint()Z
    .locals 2

    .line 104
    const-string v0, "entrypoint"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/keybox/HippoLoader;->execute(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public execute(Ljava/lang/String;Z)Z
    .locals 23
    .param p1, "method_name"    # Ljava/lang/String;
    .param p2, "prefer_preload"    # Z

    .line 121
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "code"

    iget-object v3, v1, Lcom/trendmicro/keybox/HippoLoader;->androidContextObject:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    .line 123
    .local v3, "assetManager":Landroid/content/res/AssetManager;
    invoke-static {}, Lcom/trendmicro/hippo/ContextFactory;->getGlobal()Lcom/trendmicro/hippo/ContextFactory;

    move-result-object v4

    .line 124
    .local v4, "contextFactory":Lcom/trendmicro/hippo/ContextFactory;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ContextFactory;->enterContext()Lcom/trendmicro/hippo/Context;

    move-result-object v11

    .line 125
    .local v11, "context":Lcom/trendmicro/hippo/Context;
    const/4 v5, -0x1

    invoke-virtual {v11, v5}, Lcom/trendmicro/hippo/Context;->setOptimizationLevel(I)V

    .line 126
    new-instance v5, Lcom/trendmicro/hippo/ImporterTopLevel;

    invoke-direct {v5, v11}, Lcom/trendmicro/hippo/ImporterTopLevel;-><init>(Lcom/trendmicro/hippo/Context;)V

    move-object v12, v5

    .line 134
    .local v12, "scope":Lcom/trendmicro/hippo/Scriptable;
    const/4 v13, 0x0

    const/4 v14, 0x1

    :try_start_0
    iget-object v5, v1, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    move-object v15, v5

    .line 135
    .local v15, "inputStream":Ljava/io/InputStream;
    invoke-virtual {v15}, Ljava/io/InputStream;->available()I

    move-result v5

    new-array v5, v5, [B

    move-object v10, v5

    .line 136
    .local v10, "resource_stub":[B
    invoke-virtual {v15, v10}, Ljava/io/InputStream;->read([B)I

    .line 137
    invoke-virtual {v15}, Ljava/io/InputStream;->close()V

    .line 138
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v10}, Ljava/lang/String;-><init>([B)V

    move-object v9, v5

    .line 141
    .local v9, "code_stub":Ljava/lang/String;
    const-string v5, "androidContext"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->androidContextObject:Landroid/content/Context;

    invoke-static {v6, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v12, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 142
    const-string v5, "imageView"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->imageView:Landroid/view/View;

    invoke-static {v6, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v12, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 143
    const-string v5, "textView"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->textView:Landroid/view/View;

    invoke-static {v6, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v12, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 144
    const-string v5, "titleView"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->titleView:Landroid/view/View;

    invoke-static {v6, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v12, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 148
    invoke-static {v9, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v12, v0, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 149
    const-string v5, "path_ciphertext"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->path_ciphertext:Ljava/lang/String;

    invoke-static {v6, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v12, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 150
    const-string v5, "key"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->ciphertextKey:Ljava/lang/String;

    invoke-static {v6, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v12, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 151
    const-string v5, "singleton"

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    invoke-static {v6, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v12, v5, v6}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 157
    iget-object v8, v1, Lcom/trendmicro/keybox/HippoLoader;->path_preload:Ljava/lang/String;

    const/16 v16, 0x1

    const/16 v17, 0x0

    move-object v5, v11

    move-object v6, v12

    move-object v7, v9

    move-object/from16 v18, v9

    .end local v9    # "code_stub":Ljava/lang/String;
    .local v18, "code_stub":Ljava/lang/String;
    move/from16 v9, v16

    move-object/from16 v16, v10

    .end local v10    # "resource_stub":[B
    .local v16, "resource_stub":[B
    move-object/from16 v10, v17

    invoke-virtual/range {v5 .. v10}, Lcom/trendmicro/hippo/Context;->evaluateString(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    .line 160
    const/4 v5, 0x0

    .line 161
    .local v5, "plaintext_code":Ljava/lang/Object;
    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->path_ciphertext:Ljava/lang/String;

    invoke-virtual {v3, v6}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    move-object v15, v6

    .line 162
    invoke-virtual {v15}, Ljava/io/InputStream;->available()I

    move-result v6

    new-array v6, v6, [B

    move-object v10, v6

    .line 163
    .local v10, "ciphertext_bytes":[B
    invoke-virtual {v15, v10}, Ljava/io/InputStream;->read([B)I

    move-result v6

    move/from16 v17, v6

    .line 165
    .local v17, "ciphertext_length":I
    const-string v6, "ciphertext_bytes"

    invoke-static {v10, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v12, v6, v7}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 169
    new-array v6, v14, [Ljava/lang/Object;

    .line 170
    .local v6, "params":[Ljava/lang/Object;
    invoke-interface {v12, v2, v12}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    move-object v9, v7

    .line 171
    .local v9, "method_obj":Ljava/lang/Object;
    iget-boolean v7, v1, Lcom/trendmicro/keybox/HippoLoader;->preloadOnly:Z

    if-nez v7, :cond_3

    if-eqz p2, :cond_0

    instance-of v7, v9, Lcom/trendmicro/hippo/Function;

    if-eqz v7, :cond_0

    move-object/from16 v22, v9

    move-object/from16 v20, v10

    goto/16 :goto_1

    .line 178
    :cond_0
    const-string v7, "process"

    invoke-interface {v12, v7, v12}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    .line 181
    .local v8, "process_obj":Ljava/lang/Object;
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v14, v1, Lcom/trendmicro/keybox/HippoLoader;->ciphertextKey:Ljava/lang/String;

    aput-object v14, v7, v13

    const/4 v14, 0x1

    aput-object v10, v7, v14

    move-object v14, v7

    .line 184
    .end local v6    # "params":[Ljava/lang/Object;
    .local v14, "params":[Ljava/lang/Object;
    instance-of v6, v8, Lcom/trendmicro/hippo/Function;

    if-eqz v6, :cond_1

    .line 185
    move-object v6, v8

    check-cast v6, Lcom/trendmicro/hippo/Function;

    .line 186
    .local v6, "process":Lcom/trendmicro/hippo/Function;
    invoke-interface {v6, v11, v12, v12, v14}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v5, v7

    goto :goto_0

    .line 184
    .end local v6    # "process":Lcom/trendmicro/hippo/Function;
    :cond_1
    move-object v7, v5

    .line 189
    .end local v5    # "plaintext_code":Ljava/lang/Object;
    .local v7, "plaintext_code":Ljava/lang/Object;
    :goto_0
    move-object/from16 v19, v7

    check-cast v19, Ljava/lang/String;

    iget-object v6, v1, Lcom/trendmicro/keybox/HippoLoader;->path_ciphertext:Ljava/lang/String;

    const/16 v20, 0x1

    const/16 v21, 0x0

    move-object v5, v11

    move-object/from16 v22, v6

    move-object v6, v12

    move-object v13, v7

    .end local v7    # "plaintext_code":Ljava/lang/Object;
    .local v13, "plaintext_code":Ljava/lang/Object;
    move-object/from16 v7, v19

    move-object/from16 v19, v8

    .end local v8    # "process_obj":Ljava/lang/Object;
    .local v19, "process_obj":Ljava/lang/Object;
    move-object/from16 v8, v22

    move-object/from16 v22, v9

    .end local v9    # "method_obj":Ljava/lang/Object;
    .local v22, "method_obj":Ljava/lang/Object;
    move/from16 v9, v20

    move-object/from16 v20, v10

    .end local v10    # "ciphertext_bytes":[B
    .local v20, "ciphertext_bytes":[B
    move-object/from16 v10, v21

    invoke-virtual/range {v5 .. v10}, Lcom/trendmicro/hippo/Context;->evaluateString(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/Object;

    .line 192
    invoke-static {v13, v12}, Lcom/trendmicro/hippo/Context;->javaToJS(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v12, v0, v5}, Lcom/trendmicro/hippo/ScriptableObject;->putProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 195
    invoke-interface {v12, v2, v12}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 200
    .local v0, "obj":Ljava/lang/Object;
    instance-of v5, v0, Lcom/trendmicro/hippo/Function;

    if-eqz v5, :cond_2

    .line 201
    move-object v5, v0

    check-cast v5, Lcom/trendmicro/hippo/Function;

    .line 204
    .local v5, "entrypoint":Lcom/trendmicro/hippo/Function;
    invoke-interface {v5, v11, v12, v12, v14}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 207
    .local v6, "result":Ljava/lang/Object;
    invoke-static {v6}, Lcom/trendmicro/hippo/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 208
    .local v7, "response":Ljava/lang/String;
    nop

    .line 226
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 208
    const/4 v8, 0x1

    return v8

    .line 210
    .end local v5    # "entrypoint":Lcom/trendmicro/hippo/Function;
    .end local v6    # "result":Ljava/lang/Object;
    .end local v7    # "response":Ljava/lang/String;
    :cond_2
    nop

    .line 226
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 210
    const/4 v5, 0x0

    return v5

    .line 171
    .end local v0    # "obj":Ljava/lang/Object;
    .end local v13    # "plaintext_code":Ljava/lang/Object;
    .end local v14    # "params":[Ljava/lang/Object;
    .end local v19    # "process_obj":Ljava/lang/Object;
    .end local v20    # "ciphertext_bytes":[B
    .end local v22    # "method_obj":Ljava/lang/Object;
    .local v5, "plaintext_code":Ljava/lang/Object;
    .local v6, "params":[Ljava/lang/Object;
    .restart local v9    # "method_obj":Ljava/lang/Object;
    .restart local v10    # "ciphertext_bytes":[B
    :cond_3
    move-object/from16 v22, v9

    move-object/from16 v20, v10

    .line 172
    .end local v9    # "method_obj":Ljava/lang/Object;
    .end local v10    # "ciphertext_bytes":[B
    .restart local v20    # "ciphertext_bytes":[B
    .restart local v22    # "method_obj":Ljava/lang/Object;
    :goto_1
    :try_start_1
    move-object/from16 v0, v22

    check-cast v0, Lcom/trendmicro/hippo/Function;

    .line 173
    .local v0, "method":Lcom/trendmicro/hippo/Function;
    invoke-interface {v0, v11, v12, v12, v6}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 174
    nop

    .line 226
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 174
    const/4 v7, 0x1

    return v7

    .line 226
    .end local v0    # "method":Lcom/trendmicro/hippo/Function;
    .end local v5    # "plaintext_code":Ljava/lang/Object;
    .end local v6    # "params":[Ljava/lang/Object;
    .end local v15    # "inputStream":Ljava/io/InputStream;
    .end local v16    # "resource_stub":[B
    .end local v17    # "ciphertext_length":I
    .end local v18    # "code_stub":Ljava/lang/String;
    .end local v20    # "ciphertext_bytes":[B
    .end local v22    # "method_obj":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 212
    :catch_0
    move-exception v0

    .line 214
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lcom/trendmicro/hippo/JavaScriptException;

    if-ne v5, v6, :cond_4

    .line 215
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Javascript exception - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Lcom/trendmicro/keybox/HippoLoader;->Log(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 226
    .end local v0    # "ex":Ljava/lang/Exception;
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 227
    nop

    .line 229
    const/4 v5, 0x0

    return v5

    .line 218
    .restart local v0    # "ex":Ljava/lang/Exception;
    :cond_4
    :try_start_3
    const-string v5, "TMCTF"

    const-string v6, "Exception calling %s()"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 223
    nop

    .line 226
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 223
    const/4 v5, 0x0

    return v5

    .line 226
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_2
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 227
    throw v0
.end method

.method public setAndroidContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "androidContextObject"    # Landroid/content/Context;

    .line 78
    iput-object p1, p0, Lcom/trendmicro/keybox/HippoLoader;->androidContextObject:Landroid/content/Context;

    .line 79
    return-void
.end method

.method public setCiphertextKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;

    .line 74
    iput-object p1, p0, Lcom/trendmicro/keybox/HippoLoader;->ciphertextKey:Ljava/lang/String;

    .line 75
    return-void
.end method

.method public setImageView(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 82
    iput-object p1, p0, Lcom/trendmicro/keybox/HippoLoader;->imageView:Landroid/view/View;

    .line 83
    return-void
.end method

.method public setTextView(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 86
    iput-object p1, p0, Lcom/trendmicro/keybox/HippoLoader;->textView:Landroid/view/View;

    .line 87
    return-void
.end method

.method public setTitleView(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 90
    iput-object p1, p0, Lcom/trendmicro/keybox/HippoLoader;->titleView:Landroid/view/View;

    .line 91
    return-void
.end method

.method public verify_unlocked()Z
    .locals 2

    .line 94
    invoke-static {}, Lcom/trendmicro/keybox/Singleton;->getInstance()Lcom/trendmicro/keybox/Singleton;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/keybox/HippoLoader;->singleton:Lcom/trendmicro/keybox/Singleton;

    .line 96
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "verify_unlocked"

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/keybox/HippoLoader;->execute(Ljava/lang/String;Z)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .local v0, "unlocked":Z
    return v0

    .line 98
    .end local v0    # "unlocked":Z
    :catch_0
    move-exception v1

    .line 99
    .local v1, "ex":Ljava/lang/Exception;
    return v0
.end method
