.class public Lcom/trendmicro/hippo/tools/shell/ShellLine;
.super Ljava/lang/Object;
.source "ShellLine.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getStream(Lcom/trendmicro/hippo/Scriptable;)Ljava/io/InputStream;
    .locals 2
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 23
    nop

    .line 24
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    .line 23
    invoke-static {p0, v0}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->getConsole(Lcom/trendmicro/hippo/Scriptable;Ljava/nio/charset/Charset;)Lcom/trendmicro/hippo/tools/shell/ShellConsole;

    move-result-object v0

    .line 25
    .local v0, "console":Lcom/trendmicro/hippo/tools/shell/ShellConsole;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->getIn()Ljava/io/InputStream;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method
