.class Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;
.super Lcom/trendmicro/hippo/tools/shell/ShellConsole;
.source "ShellConsole.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/shell/ShellConsole;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SimpleShellConsole"
.end annotation


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final out:Ljava/io/PrintWriter;

.field private final reader:Ljava/io/BufferedReader;


# direct methods
.method constructor <init>(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/nio/charset/Charset;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "ps"    # Ljava/io/PrintStream;
    .param p3, "cs"    # Ljava/nio/charset/Charset;

    .line 271
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/shell/ShellConsole;-><init>()V

    .line 272
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->in:Ljava/io/InputStream;

    .line 273
    new-instance v0, Ljava/io/PrintWriter;

    invoke-direct {v0, p2}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->out:Ljava/io/PrintWriter;

    .line 274
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, p1, p3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->reader:Ljava/io/BufferedReader;

    .line 275
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 298
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 299
    return-void
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .line 279
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->in:Ljava/io/InputStream;

    return-object v0
.end method

.method public print(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 303
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 304
    return-void
.end method

.method public println()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 308
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->println()V

    .line 309
    return-void
.end method

.method public println(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 313
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 314
    return-void
.end method

.method public readLine()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 284
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readLine(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "prompt"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 289
    if-eqz p1, :cond_0

    .line 290
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 291
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->out:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ShellConsole$SimpleShellConsole;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
