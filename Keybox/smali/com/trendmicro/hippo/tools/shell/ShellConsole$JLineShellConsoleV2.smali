.class Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;
.super Lcom/trendmicro/hippo/tools/shell/ShellConsole;
.source "ShellConsole.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/shell/ShellConsole;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JLineShellConsoleV2"
.end annotation


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final reader:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/nio/charset/Charset;)V
    .locals 1
    .param p1, "reader"    # Ljava/lang/Object;
    .param p2, "cs"    # Ljava/nio/charset/Charset;

    .line 147
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;-><init>()V

    .line 148
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;->reader:Ljava/lang/Object;

    .line 149
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$ConsoleInputStream;

    invoke-direct {v0, p0, p2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole$ConsoleInputStream;-><init>(Lcom/trendmicro/hippo/tools/shell/ShellConsole;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;->in:Ljava/io/InputStream;

    .line 150
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

    .line 169
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "flush"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    return-void
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;->in:Ljava/io/InputStream;

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

    .line 174
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$300()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v3, "print"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    return-void
.end method

.method public println()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$000()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "println"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    return-void
.end method

.method public println(Ljava/lang/String;)V
    .locals 4
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 184
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;->reader:Ljava/lang/Object;

    invoke-static {}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$300()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v3, "println"

    invoke-static {v0, v3, v1, v2}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;->access$100(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    return-void
.end method

.method public readLine()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;->reader:Ljava/lang/Object;

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

    .line 164
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$JLineShellConsoleV2;->reader:Ljava/lang/Object;

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
