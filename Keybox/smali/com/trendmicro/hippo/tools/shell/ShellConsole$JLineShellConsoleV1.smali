.class Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;
.super Lcom/trendmicro/hippo/tools/shell/ShellConsole;
.source "ShellConsole.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/shell/ShellConsole;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JLineShellConsoleV1"
.end annotation


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final reader:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/nio/charset/Charset;)V
    .locals 1
    .param p1, "reader"    # Ljava/lang/Object;
    .param p2, "cs"    # Ljava/nio/charset/Charset;

    .line 98
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;-><init>()V

    .line 99
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    .line 100
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$ConsoleInputStream;

    invoke-direct {v0, p0, p2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole$ConsoleInputStream;-><init>(Lcom/trendmicro/hippo/tools/shell/ShellConsole;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->in:Ljava/io/InputStream;

    .line 101
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "flushConsole"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    return-void
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->in:Ljava/io/InputStream;

    return-object v0
.end method

.method public print(Ljava/lang/String;)V
    .locals 4
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$200()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v3, "printString"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    return-void
.end method

.method public println()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "printNewline"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    return-void
.end method

.method public println(Ljava/lang/String;)V
    .locals 5
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$200()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "printString"

    invoke-static {v0, v4, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    const-string v3, "printNewline"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    return-void
.end method

.method public readLine()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "readLine"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public readLine(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "prompt"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV1;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$200()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v3, "readLine"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
