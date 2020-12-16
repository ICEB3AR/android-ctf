.class Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;
.super Ljavax/swing/JInternalFrame;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field private static final serialVersionUID:J = -0x4ca74da29ad7f3bcL


# instance fields
.field consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .line 1385
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Ljavax/swing/JInternalFrame;-><init>(Ljava/lang/String;ZZZZ)V

    .line 1386
    new-instance v0, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;-><init>([Ljava/lang/String;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    .line 1387
    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->setRows(I)V

    .line 1388
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->setColumns(I)V

    .line 1389
    new-instance v0, Ljavax/swing/JScrollPane;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-direct {v0, v1}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 1390
    .local v0, "scroller":Ljavax/swing/JScrollPane;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->setContentPane(Ljava/awt/Container;)V

    .line 1391
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->pack()V

    .line 1392
    new-instance v1, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole$1;

    invoke-direct {v1, p0}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole$1;-><init>(Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;)V

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->addInternalFrameListener(Ljavax/swing/event/InternalFrameListener;)V

    .line 1402
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 1437
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 1438
    .local v0, "cmd":Ljava/lang/String;
    const-string v1, "Cut"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1439
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->cut()V

    goto :goto_0

    .line 1440
    :cond_0
    const-string v1, "Copy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1441
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->copy()V

    goto :goto_0

    .line 1442
    :cond_1
    const-string v1, "Paste"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1443
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->paste()V

    .line 1445
    :cond_2
    :goto_0
    return-void
.end method

.method public getErr()Ljava/io/PrintStream;
    .locals 1

    .line 1427
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getErr()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method

.method public getIn()Ljava/io/InputStream;
    .locals 1

    .line 1413
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getIn()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getOut()Ljava/io/PrintStream;
    .locals 1

    .line 1420
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/JSInternalConsole;->consoleTextArea:Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/shell/ConsoleTextArea;->getOut()Ljava/io/PrintStream;

    move-result-object v0

    return-object v0
.end method
