.class public Lcom/trendmicro/hippo/IteratorLikeIterable;
.super Ljava/lang/Object;
.source "IteratorLikeIterable.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/io/Closeable;"
    }
.end annotation


# instance fields
.field private closed:Z

.field private final cx:Lcom/trendmicro/hippo/Context;

.field private final iterator:Lcom/trendmicro/hippo/Scriptable;

.field private final next:Lcom/trendmicro/hippo/Callable;

.field private final returnFunc:Lcom/trendmicro/hippo/Callable;

.field private final scope:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "target"    # Ljava/lang/Object;

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->cx:Lcom/trendmicro/hippo/Context;

    .line 31
    iput-object p2, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 32
    const-string v0, "next"

    invoke-static {p3, v0, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->next:Lcom/trendmicro/hippo/Callable;

    .line 33
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->iterator:Lcom/trendmicro/hippo/Scriptable;

    .line 34
    invoke-static {p3}, Lcom/trendmicro/hippo/ScriptableObject;->ensureScriptable(Ljava/lang/Object;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v0

    .line 35
    .local v0, "st":Lcom/trendmicro/hippo/Scriptable;
    const-string v1, "return"

    invoke-interface {v0, v1, v0}, Lcom/trendmicro/hippo/Scriptable;->has(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 36
    invoke-static {p3, v1, p1, p2}, Lcom/trendmicro/hippo/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Callable;

    move-result-object v1

    iput-object v1, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->returnFunc:Lcom/trendmicro/hippo/Callable;

    .line 37
    invoke-static {p1}, Lcom/trendmicro/hippo/ScriptRuntime;->lastStoredScriptable(Lcom/trendmicro/hippo/Context;)Lcom/trendmicro/hippo/Scriptable;

    goto :goto_0

    .line 39
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->returnFunc:Lcom/trendmicro/hippo/Callable;

    .line 41
    :goto_0
    return-void
.end method

.method static synthetic access$000(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Context;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/IteratorLikeIterable;

    .line 19
    iget-object v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->cx:Lcom/trendmicro/hippo/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/IteratorLikeIterable;

    .line 19
    iget-object v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->scope:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method static synthetic access$200(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Scriptable;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/IteratorLikeIterable;

    .line 19
    iget-object v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->iterator:Lcom/trendmicro/hippo/Scriptable;

    return-object v0
.end method

.method static synthetic access$300(Lcom/trendmicro/hippo/IteratorLikeIterable;)Lcom/trendmicro/hippo/Callable;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/IteratorLikeIterable;

    .line 19
    iget-object v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->next:Lcom/trendmicro/hippo/Callable;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 5

    .line 45
    iget-boolean v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->closed:Z

    if-nez v0, :cond_0

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->closed:Z

    .line 47
    iget-object v0, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->returnFunc:Lcom/trendmicro/hippo/Callable;

    if-eqz v0, :cond_0

    .line 48
    iget-object v1, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->cx:Lcom/trendmicro/hippo/Context;

    iget-object v2, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v3, p0, Lcom/trendmicro/hippo/IteratorLikeIterable;->iterator:Lcom/trendmicro/hippo/Scriptable;

    sget-object v4, Lcom/trendmicro/hippo/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    :cond_0
    return-void
.end method

.method public iterator()Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;
    .locals 1

    .line 55
    new-instance v0, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;-><init>(Lcom/trendmicro/hippo/IteratorLikeIterable;)V

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 19
    invoke-virtual {p0}, Lcom/trendmicro/hippo/IteratorLikeIterable;->iterator()Lcom/trendmicro/hippo/IteratorLikeIterable$Itr;

    move-result-object v0

    return-object v0
.end method
