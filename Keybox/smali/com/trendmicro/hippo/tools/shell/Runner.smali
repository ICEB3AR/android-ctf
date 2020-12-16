.class Lcom/trendmicro/hippo/tools/shell/Runner;
.super Ljava/lang/Object;
.source "Global.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/trendmicro/hippo/ContextAction;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;",
        "Lcom/trendmicro/hippo/ContextAction<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private args:[Ljava/lang/Object;

.field private f:Lcom/trendmicro/hippo/Function;

.field factory:Lcom/trendmicro/hippo/ContextFactory;

.field private s:Lcom/trendmicro/hippo/Script;

.field private scope:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Function;[Ljava/lang/Object;)V
    .locals 0
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "func"    # Lcom/trendmicro/hippo/Function;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 1250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1251
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 1252
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->f:Lcom/trendmicro/hippo/Function;

    .line 1253
    iput-object p3, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->args:[Ljava/lang/Object;

    .line 1254
    return-void
.end method

.method constructor <init>(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Script;)V
    .locals 0
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "script"    # Lcom/trendmicro/hippo/Script;

    .line 1256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1257
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->scope:Lcom/trendmicro/hippo/Scriptable;

    .line 1258
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->s:Lcom/trendmicro/hippo/Script;

    .line 1259
    return-void
.end method


# virtual methods
.method public run(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
    .locals 3
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 1268
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->f:Lcom/trendmicro/hippo/Function;

    if-eqz v0, :cond_0

    .line 1269
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->scope:Lcom/trendmicro/hippo/Scriptable;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->args:[Ljava/lang/Object;

    invoke-interface {v0, p1, v1, v1, v2}, Lcom/trendmicro/hippo/Function;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 1271
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->s:Lcom/trendmicro/hippo/Script;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->scope:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v0, p1, v1}, Lcom/trendmicro/hippo/Script;->exec(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 1

    .line 1263
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/Runner;->factory:Lcom/trendmicro/hippo/ContextFactory;

    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/ContextFactory;->call(Lcom/trendmicro/hippo/ContextAction;)Ljava/lang/Object;

    .line 1264
    return-void
.end method
