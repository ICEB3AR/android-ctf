.class public Lcom/trendmicro/hippo/Synchronizer;
.super Lcom/trendmicro/hippo/Delegator;
.source "Synchronizer.java"


# instance fields
.field private syncObject:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;)V
    .locals 0
    .param p1, "obj"    # Lcom/trendmicro/hippo/Scriptable;

    .line 39
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Delegator;-><init>(Lcom/trendmicro/hippo/Scriptable;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 0
    .param p1, "obj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "syncObject"    # Ljava/lang/Object;

    .line 50
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/Delegator;-><init>(Lcom/trendmicro/hippo/Scriptable;)V

    .line 51
    iput-object p2, p0, Lcom/trendmicro/hippo/Synchronizer;->syncObject:Ljava/lang/Object;

    .line 52
    return-void
.end method


# virtual methods
.method public call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 61
    iget-object v0, p0, Lcom/trendmicro/hippo/Synchronizer;->syncObject:Ljava/lang/Object;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move-object v0, p3

    .line 62
    .local v0, "sync":Ljava/lang/Object;
    :goto_0
    instance-of v1, v0, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v1}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    goto :goto_1

    :cond_1
    move-object v1, v0

    :goto_1
    monitor-enter v1

    .line 63
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/Synchronizer;->obj:Lcom/trendmicro/hippo/Scriptable;

    check-cast v2, Lcom/trendmicro/hippo/Function;

    invoke-interface {v2, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    monitor-exit v1

    return-object v2

    .line 64
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
