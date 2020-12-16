.class Lcom/trendmicro/hippo/tools/shell/ConsoleWrite;
.super Ljava/lang/Object;
.source "ConsoleTextArea.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private str:Ljava/lang/String;

.field private textArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;Ljava/lang/String;)V
    .locals 0
    .param p1, "textArea"    # Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;
    .param p2, "str"    # Ljava/lang/String;

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWrite;->textArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    .line 31
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWrite;->str:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 35
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWrite;->textArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/shell/ConsoleWrite;->str:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->write(Ljava/lang/String;)V

    .line 36
    return-void
.end method
