.class Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole$1;
.super Ljavax/swing/event/InternalFrameAdapter;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;-><init>(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    .line 1392
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    invoke-direct {p0}, Ljavax/swing/event/InternalFrameAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public internalFrameActivated(Ljavax/swing/event/InternalFrameEvent;)V
    .locals 2
    .param p1, "e"    # Ljavax/swing/event/InternalFrameEvent;

    .line 1396
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1397
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getCaret()Ljavax/swing/text/Caret;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljavax/swing/text/Caret;->setVisible(Z)V

    .line 1398
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getCaret()Ljavax/swing/text/Caret;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljavax/swing/text/Caret;->setVisible(Z)V

    .line 1400
    :cond_0
    return-void
.end method
