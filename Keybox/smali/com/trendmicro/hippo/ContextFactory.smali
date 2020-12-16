.class public Lcom/trendmicro/hippo/ContextFactory;
.super Ljava/lang/Object;
.source "ContextFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/ContextFactory$Listener;,
        Lcom/trendmicro/hippo/ContextFactory$GlobalSetter;
    }
.end annotation


# static fields
.field private static global:Lcom/trendmicro/hippo/ContextFactory;

.field private static volatile hasCustomGlobal:Z


# instance fields
.field private applicationClassLoader:Ljava/lang/ClassLoader;

.field private disabledListening:Z

.field private volatile listeners:Ljava/lang/Object;

.field private final listenersLock:Ljava/lang/Object;

.field private volatile sealed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 112
    new-instance v0, Lcom/trendmicro/hippo/ContextFactory;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ContextFactory;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/ContextFactory;->global:Lcom/trendmicro/hippo/ContextFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ContextFactory;->listenersLock:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$000()Lcom/trendmicro/hippo/ContextFactory;
    .locals 1

    .line 109
    sget-object v0, Lcom/trendmicro/hippo/ContextFactory;->global:Lcom/trendmicro/hippo/ContextFactory;

    return-object v0
.end method

.method static synthetic access$002(Lcom/trendmicro/hippo/ContextFactory;)Lcom/trendmicro/hippo/ContextFactory;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/ContextFactory;

    .line 109
    sput-object p0, Lcom/trendmicro/hippo/ContextFactory;->global:Lcom/trendmicro/hippo/ContextFactory;

    return-object p0
.end method

.method public static getGlobal()Lcom/trendmicro/hippo/ContextFactory;
    .locals 1

    .line 146
    sget-object v0, Lcom/trendmicro/hippo/ContextFactory;->global:Lcom/trendmicro/hippo/ContextFactory;

    return-object v0
.end method

.method public static declared-synchronized getGlobalSetter()Lcom/trendmicro/hippo/ContextFactory$GlobalSetter;
    .locals 2

    const-class v0, Lcom/trendmicro/hippo/ContextFactory;

    monitor-enter v0

    .line 188
    :try_start_0
    sget-boolean v1, Lcom/trendmicro/hippo/ContextFactory;->hasCustomGlobal:Z

    if-nez v1, :cond_0

    .line 191
    const/4 v1, 0x1

    sput-boolean v1, Lcom/trendmicro/hippo/ContextFactory;->hasCustomGlobal:Z

    .line 202
    new-instance v1, Lcom/trendmicro/hippo/ContextFactory$1GlobalSetterImpl;

    invoke-direct {v1}, Lcom/trendmicro/hippo/ContextFactory$1GlobalSetterImpl;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 189
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 187
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static hasExplicitGlobal()Z
    .locals 1

    .line 160
    sget-boolean v0, Lcom/trendmicro/hippo/ContextFactory;->hasCustomGlobal:Z

    return v0
.end method

.method public static declared-synchronized initGlobal(Lcom/trendmicro/hippo/ContextFactory;)V
    .locals 2
    .param p0, "factory"    # Lcom/trendmicro/hippo/ContextFactory;

    const-class v0, Lcom/trendmicro/hippo/ContextFactory;

    monitor-enter v0

    .line 172
    if-eqz p0, :cond_1

    .line 175
    :try_start_0
    sget-boolean v1, Lcom/trendmicro/hippo/ContextFactory;->hasCustomGlobal:Z

    if-nez v1, :cond_0

    .line 178
    const/4 v1, 0x1

    sput-boolean v1, Lcom/trendmicro/hippo/ContextFactory;->hasCustomGlobal:Z

    .line 179
    sput-object p0, Lcom/trendmicro/hippo/ContextFactory;->global:Lcom/trendmicro/hippo/ContextFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    monitor-exit v0

    return-void

    .line 176
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 171
    .end local p0    # "factory":Lcom/trendmicro/hippo/ContextFactory;
    :catchall_0
    move-exception p0

    goto :goto_0

    .line 173
    .restart local p0    # "factory":Lcom/trendmicro/hippo/ContextFactory;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 171
    .end local p0    # "factory":Lcom/trendmicro/hippo/ContextFactory;
    :goto_0
    monitor-exit v0

    throw p0
.end method

.method private isDom3Present()Z
    .locals 6

    .line 307
    const-string v0, "org.w3c.dom.Node"

    invoke-static {v0}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 308
    .local v0, "nodeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 312
    :cond_0
    :try_start_0
    const-string v2, "getUserData"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v1

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 313
    return v3

    .line 314
    :catch_0
    move-exception v2

    .line 315
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    return v1
.end method


# virtual methods
.method public final addListener(Lcom/trendmicro/hippo/ContextFactory$Listener;)V
    .locals 2
    .param p1, "listener"    # Lcom/trendmicro/hippo/ContextFactory$Listener;

    .line 446
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ContextFactory;->checkNotSealed()V

    .line 447
    iget-object v0, p0, Lcom/trendmicro/hippo/ContextFactory;->listenersLock:Ljava/lang/Object;

    monitor-enter v0

    .line 448
    :try_start_0
    iget-boolean v1, p0, Lcom/trendmicro/hippo/ContextFactory;->disabledListening:Z

    if-nez v1, :cond_0

    .line 451
    iget-object v1, p0, Lcom/trendmicro/hippo/ContextFactory;->listeners:Ljava/lang/Object;

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/Kit;->addListener(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/ContextFactory;->listeners:Ljava/lang/Object;

    .line 452
    monitor-exit v0

    .line 453
    return-void

    .line 449
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    .end local p1    # "listener":Lcom/trendmicro/hippo/ContextFactory$Listener;
    throw v1

    .line 452
    .restart local p1    # "listener":Lcom/trendmicro/hippo/ContextFactory$Listener;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/trendmicro/hippo/ContextAction<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 519
    .local p1, "action":Lcom/trendmicro/hippo/ContextAction;, "Lcom/trendmicro/hippo/ContextAction<TT;>;"
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/Context;->call(Lcom/trendmicro/hippo/ContextFactory;Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final checkNotSealed()V
    .locals 1

    .line 501
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ContextFactory;->sealed:Z

    if-nez v0, :cond_0

    .line 502
    return-void

    .line 501
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method protected createClassLoader(Ljava/lang/ClassLoader;)Lcom/trendmicro/hippo/GeneratedClassLoader;
    .locals 1
    .param p1, "parent"    # Ljava/lang/ClassLoader;

    .line 358
    new-instance v0, Lcom/trendmicro/hippo/ContextFactory$1;

    invoke-direct {v0, p0, p1}, Lcom/trendmicro/hippo/ContextFactory$1;-><init>(Lcom/trendmicro/hippo/ContextFactory;Ljava/lang/ClassLoader;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/GeneratedClassLoader;

    return-object v0
.end method

.method final disableContextListening()V
    .locals 2

    .line 472
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ContextFactory;->checkNotSealed()V

    .line 473
    iget-object v0, p0, Lcom/trendmicro/hippo/ContextFactory;->listenersLock:Ljava/lang/Object;

    monitor-enter v0

    .line 474
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/trendmicro/hippo/ContextFactory;->disabledListening:Z

    .line 475
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/ContextFactory;->listeners:Ljava/lang/Object;

    .line 476
    monitor-exit v0

    .line 477
    return-void

    .line 476
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected doTopCall(Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "callable"    # Lcom/trendmicro/hippo/Callable;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 409
    invoke-interface {p1, p2, p3, p4, p5}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 410
    .local v0, "result":Ljava/lang/Object;
    instance-of v1, v0, Lcom/trendmicro/hippo/ConsString;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public final enter()Lcom/trendmicro/hippo/Context;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 573
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ContextFactory;->enterContext(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Context;

    move-result-object v0

    return-object v0
.end method

.method public enterContext()Lcom/trendmicro/hippo/Context;
    .locals 1

    .line 563
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ContextFactory;->enterContext(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Context;

    move-result-object v0

    return-object v0
.end method

.method public final enterContext(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Context;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 602
    invoke-static {p1, p0}, Lcom/trendmicro/hippo/Context;->enter(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/ContextFactory;)Lcom/trendmicro/hippo/Context;

    move-result-object v0

    return-object v0
.end method

.method public final exit()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 582
    invoke-static {}, Lcom/trendmicro/hippo/Context;->exit()V

    .line 583
    return-void
.end method

.method public final getApplicationClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .line 374
    iget-object v0, p0, Lcom/trendmicro/hippo/ContextFactory;->applicationClassLoader:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method protected getE4xImplementationFactory()Lcom/trendmicro/hippo/xml/XMLLib$Factory;
    .locals 1

    .line 339
    invoke-direct {p0}, Lcom/trendmicro/hippo/ContextFactory;->isDom3Present()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 340
    const-string v0, "com.trendmicro.hippo.xmlimpl.XMLLibImpl"

    invoke-static {v0}, Lcom/trendmicro/hippo/xml/XMLLib$Factory;->create(Ljava/lang/String;)Lcom/trendmicro/hippo/xml/XMLLib$Factory;

    move-result-object v0

    return-object v0

    .line 344
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected hasFeature(Lcom/trendmicro/hippo/Context;I)Z
    .locals 5
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "featureIndex"    # I

    .line 227
    const/16 v0, 0x78

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch p2, :pswitch_data_0

    .line 303
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 300
    :pswitch_0
    return v2

    .line 297
    :pswitch_1
    return v2

    .line 294
    :pswitch_2
    return v2

    .line 291
    :pswitch_3
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    const/16 v3, 0xc8

    if-lt v0, v3, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 288
    :pswitch_4
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    const/16 v3, 0xaa

    if-gt v0, v3, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    return v1

    .line 285
    :pswitch_5
    return v1

    .line 282
    :pswitch_6
    return v2

    .line 279
    :pswitch_7
    return v2

    .line 276
    :pswitch_8
    return v2

    .line 273
    :pswitch_9
    return v2

    .line 270
    :pswitch_a
    return v2

    .line 267
    :pswitch_b
    return v2

    .line 264
    :pswitch_c
    return v2

    .line 259
    :pswitch_d
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v0

    .line 260
    .local v0, "version":I
    if-eqz v0, :cond_3

    const/16 v3, 0xa0

    if-lt v0, v3, :cond_2

    goto :goto_2

    :cond_2
    move v1, v2

    :cond_3
    :goto_2
    return v1

    .line 256
    .end local v0    # "version":I
    :pswitch_e
    return v1

    .line 252
    :pswitch_f
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v3

    .line 253
    .local v3, "version":I
    if-ne v3, v0, :cond_4

    goto :goto_3

    :cond_4
    move v1, v2

    :goto_3
    return v1

    .line 249
    .end local v3    # "version":I
    :pswitch_10
    return v1

    .line 246
    :pswitch_11
    return v2

    .line 240
    :pswitch_12
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Context;->getLanguageVersion()I

    move-result v3

    .line 241
    .restart local v3    # "version":I
    const/16 v4, 0x64

    if-eq v3, v4, :cond_6

    const/16 v4, 0x6e

    if-eq v3, v4, :cond_6

    if-ne v3, v0, :cond_5

    goto :goto_4

    :cond_5
    move v1, v2

    :cond_6
    :goto_4
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final initApplicationClassLoader(Ljava/lang/ClassLoader;)V
    .locals 2
    .param p1, "loader"    # Ljava/lang/ClassLoader;

    .line 384
    if-eqz p1, :cond_2

    .line 386
    invoke-static {p1}, Lcom/trendmicro/hippo/Kit;->testIfCanLoadHippoClasses(Ljava/lang/ClassLoader;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 390
    iget-object v0, p0, Lcom/trendmicro/hippo/ContextFactory;->applicationClassLoader:Ljava/lang/ClassLoader;

    if-nez v0, :cond_0

    .line 393
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ContextFactory;->checkNotSealed()V

    .line 395
    iput-object p1, p0, Lcom/trendmicro/hippo/ContextFactory;->applicationClassLoader:Ljava/lang/ClassLoader;

    .line 396
    return-void

    .line 391
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "applicationClassLoader can only be set once"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 387
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Loader can not resolve classes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 385
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "loader is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final isSealed()Z
    .locals 1

    .line 485
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ContextFactory;->sealed:Z

    return v0
.end method

.method protected makeContext()Lcom/trendmicro/hippo/Context;
    .locals 1

    .line 216
    new-instance v0, Lcom/trendmicro/hippo/Context;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/Context;-><init>(Lcom/trendmicro/hippo/ContextFactory;)V

    return-object v0
.end method

.method protected observeInstructionCount(Lcom/trendmicro/hippo/Context;I)V
    .locals 0
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "instructionCount"    # I

    .line 420
    return-void
.end method

.method protected onContextCreated(Lcom/trendmicro/hippo/Context;)V
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 424
    iget-object v0, p0, Lcom/trendmicro/hippo/ContextFactory;->listeners:Ljava/lang/Object;

    .line 425
    .local v0, "listeners":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 426
    .local v1, "i":I
    :goto_0
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Kit;->getListener(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ContextFactory$Listener;

    .line 427
    .local v2, "l":Lcom/trendmicro/hippo/ContextFactory$Listener;
    if-nez v2, :cond_0

    .line 428
    nop

    .line 431
    .end local v1    # "i":I
    .end local v2    # "l":Lcom/trendmicro/hippo/ContextFactory$Listener;
    return-void

    .line 429
    .restart local v1    # "i":I
    .restart local v2    # "l":Lcom/trendmicro/hippo/ContextFactory$Listener;
    :cond_0
    invoke-interface {v2, p1}, Lcom/trendmicro/hippo/ContextFactory$Listener;->contextCreated(Lcom/trendmicro/hippo/Context;)V

    .line 425
    .end local v2    # "l":Lcom/trendmicro/hippo/ContextFactory$Listener;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected onContextReleased(Lcom/trendmicro/hippo/Context;)V
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 435
    iget-object v0, p0, Lcom/trendmicro/hippo/ContextFactory;->listeners:Ljava/lang/Object;

    .line 436
    .local v0, "listeners":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 437
    .local v1, "i":I
    :goto_0
    invoke-static {v0, v1}, Lcom/trendmicro/hippo/Kit;->getListener(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ContextFactory$Listener;

    .line 438
    .local v2, "l":Lcom/trendmicro/hippo/ContextFactory$Listener;
    if-nez v2, :cond_0

    .line 439
    nop

    .line 442
    .end local v1    # "i":I
    .end local v2    # "l":Lcom/trendmicro/hippo/ContextFactory$Listener;
    return-void

    .line 440
    .restart local v1    # "i":I
    .restart local v2    # "l":Lcom/trendmicro/hippo/ContextFactory$Listener;
    :cond_0
    invoke-interface {v2, p1}, Lcom/trendmicro/hippo/ContextFactory$Listener;->contextReleased(Lcom/trendmicro/hippo/Context;)V

    .line 436
    .end local v2    # "l":Lcom/trendmicro/hippo/ContextFactory$Listener;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public final removeListener(Lcom/trendmicro/hippo/ContextFactory$Listener;)V
    .locals 2
    .param p1, "listener"    # Lcom/trendmicro/hippo/ContextFactory$Listener;

    .line 457
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ContextFactory;->checkNotSealed()V

    .line 458
    iget-object v0, p0, Lcom/trendmicro/hippo/ContextFactory;->listenersLock:Ljava/lang/Object;

    monitor-enter v0

    .line 459
    :try_start_0
    iget-boolean v1, p0, Lcom/trendmicro/hippo/ContextFactory;->disabledListening:Z

    if-nez v1, :cond_0

    .line 462
    iget-object v1, p0, Lcom/trendmicro/hippo/ContextFactory;->listeners:Ljava/lang/Object;

    invoke-static {v1, p1}, Lcom/trendmicro/hippo/Kit;->removeListener(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/ContextFactory;->listeners:Ljava/lang/Object;

    .line 463
    monitor-exit v0

    .line 464
    return-void

    .line 460
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    .end local p1    # "listener":Lcom/trendmicro/hippo/ContextFactory$Listener;
    throw v1

    .line 463
    .restart local p1    # "listener":Lcom/trendmicro/hippo/ContextFactory$Listener;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final seal()V
    .locals 1

    .line 495
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ContextFactory;->checkNotSealed()V

    .line 496
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ContextFactory;->sealed:Z

    .line 497
    return-void
.end method
