.class Lcom/trendmicro/hippo/tools/debugger/EvalWindow;
.super Ljavax/swing/JInternalFrame;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field private static final serialVersionUID:J = -0x27b2d7ab9161a0b0L


# instance fields
.field private evalTextArea:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "debugGui"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 1333
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Ljavax/swing/JInternalFrame;-><init>(Ljava/lang/String;ZZZZ)V

    .line 1334
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    invoke-direct {v0, p2}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->evalTextArea:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    .line 1335
    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->setRows(I)V

    .line 1336
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->evalTextArea:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->setColumns(I)V

    .line 1337
    new-instance v0, Ljavax/swing/JScrollPane;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->evalTextArea:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    invoke-direct {v0, v1}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 1338
    .local v0, "scroller":Ljavax/swing/JScrollPane;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->setContentPane(Ljava/awt/Container;)V

    .line 1340
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->pack()V

    .line 1341
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->setVisible(Z)V

    .line 1342
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 1360
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 1361
    .local v0, "cmd":Ljava/lang/String;
    const-string v1, "Cut"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1362
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->evalTextArea:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->cut()V

    goto :goto_0

    .line 1363
    :cond_0
    const-string v1, "Copy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1364
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->evalTextArea:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->copy()V

    goto :goto_0

    .line 1365
    :cond_1
    const-string v1, "Paste"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1366
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->evalTextArea:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->paste()V

    .line 1368
    :cond_2
    :goto_0
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "b"    # Z

    .line 1349
    invoke-super {p0, p1}, Ljavax/swing/JInternalFrame;->setEnabled(Z)V

    .line 1350
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/EvalWindow;->evalTextArea:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->setEnabled(Z)V

    .line 1351
    return-void
.end method
