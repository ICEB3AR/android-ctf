.class Lcom/trendmicro/hippo/tools/shell/PipeThread;
.super Ljava/lang/Thread;
.source "Global.java"


# instance fields
.field private from:Ljava/io/InputStream;

.field private fromProcess:Z

.field private to:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(ZLjava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "fromProcess"    # Z
    .param p2, "from"    # Ljava/io/InputStream;
    .param p3, "to"    # Ljava/io/OutputStream;

    .line 1283
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1284
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/shell/PipeThread;->setDaemon(Z)V

    .line 1285
    iput-boolean p1, p0, Lcom/trendmicro/hippo/tools/shell/PipeThread;->fromProcess:Z

    .line 1286
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/shell/PipeThread;->from:Ljava/io/InputStream;

    .line 1287
    iput-object p3, p0, Lcom/trendmicro/hippo/tools/shell/PipeThread;->to:Ljava/io/OutputStream;

    .line 1288
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1293
    :try_start_0
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/shell/PipeThread;->fromProcess:Z

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/PipeThread;->from:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/PipeThread;->to:Ljava/io/OutputStream;

    invoke-static {v0, v1, v2}, Lcom/trendmicro/hippo/tools/shell/Global;->pipe(ZLjava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1296
    nop

    .line 1297
    return-void

    .line 1294
    :catch_0
    move-exception v0

    .line 1295
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {v0}, Lcom/trendmicro/hippo/Context;->throwAsScriptRuntimeEx(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method
