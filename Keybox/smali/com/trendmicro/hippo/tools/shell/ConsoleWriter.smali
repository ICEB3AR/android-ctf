.class Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;
.super Ljava/io/OutputStream;
.source "ConsoleTextArea.java"


# instance fields
.field private buffer:Ljava/lang/StringBuffer;

.field private textArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;)V
    .locals 1
    .param p1, "textArea"    # Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    .line 44
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->textArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    .line 46
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    .line 47
    return-void
.end method

.method private flushBuffer()V
    .locals 3

    .line 79
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "str":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 81
    new-instance v1, Lcom/trendmicro/hippo/tools/shell/ConsoleWrite;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->textArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-direct {v1, v2, v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleWrite;-><init>(Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;Ljava/lang/String;)V

    invoke-static {v1}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 82
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 75
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->flush()V

    .line 76
    return-void
.end method

.method public declared-synchronized flush()V
    .locals 1

    monitor-enter p0

    .line 68
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 69
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->flushBuffer()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;
    :cond_0
    monitor-exit p0

    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write(I)V
    .locals 2
    .param p1, "ch"    # I

    monitor-enter p0

    .line 51
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    int-to-char v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 52
    const/16 v0, 0xa

    if-ne p1, v0, :cond_0

    .line 53
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->flushBuffer()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;
    :cond_0
    monitor-exit p0

    return-void

    .line 50
    .end local p1    # "ch":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized write([CII)V
    .locals 3
    .param p1, "data"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    monitor-enter p0

    .line 58
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_1

    .line 59
    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->buffer:Ljava/lang/StringBuffer;

    aget-char v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 60
    aget-char v1, p1, v0

    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    .line 61
    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;->flushBuffer()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .end local p0    # "this":Lcom/trendmicro/hippo/tools/shell/ConsoleWriter;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    .end local v0    # "i":I
    .end local p1    # "data":[C
    .end local p2    # "off":I
    .end local p3    # "len":I
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 64
    .restart local p1    # "data":[C
    .restart local p2    # "off":I
    .restart local p3    # "len":I
    :cond_1
    monitor-exit p0

    return-void
.end method
