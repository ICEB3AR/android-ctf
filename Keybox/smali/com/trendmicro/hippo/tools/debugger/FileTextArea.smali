.class Lcom/trendmicro/hippo/tools/debugger/FileTextArea;
.super Ljavax/swing/JTextArea;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;
.implements Ljavax/swing/event/PopupMenuListener;
.implements Ljava/awt/event/KeyListener;
.implements Ljava/awt/event/MouseListener;


# static fields
.field private static final serialVersionUID:J = -0x58ee87e90e5408L


# instance fields
.field private popup:Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;

.field private w:Lcom/trendmicro/hippo/tools/debugger/FileWindow;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/FileWindow;)V
    .locals 4
    .param p1, "w"    # Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    .line 1516
    invoke-direct {p0}, Ljavax/swing/JTextArea;-><init>()V

    .line 1517
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->w:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    .line 1518
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;-><init>(Lcom/trendmicro/hippo/tools/debugger/FileTextArea;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->popup:Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;

    .line 1519
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->addPopupMenuListener(Ljavax/swing/event/PopupMenuListener;)V

    .line 1520
    invoke-virtual {p0, p0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 1521
    invoke-virtual {p0, p0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->addKeyListener(Ljava/awt/event/KeyListener;)V

    .line 1522
    new-instance v0, Ljava/awt/Font;

    const-string v1, "Monospaced"

    const/4 v2, 0x0

    const/16 v3, 0xc

    invoke-direct {v0, v1, v2, v3}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->setFont(Ljava/awt/Font;)V

    .line 1523
    return-void
.end method

.method private checkPopup(Ljava/awt/event/MouseEvent;)V
    .locals 3
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 1567
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->isPopupTrigger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1568
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->popup:Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v1

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->show(Ljavax/swing/JComponent;II)V

    .line 1570
    :cond_0
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 5
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 1644
    new-instance v0, Ljava/awt/Point;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->popup:Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;

    iget v1, v1, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->x:I

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->popup:Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;

    iget v2, v2, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->y:I

    invoke-direct {v0, v1, v2}, Ljava/awt/Point;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->viewToModel(Ljava/awt/Point;)I

    move-result v0

    .line 1645
    .local v0, "pos":I
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->popup:Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/FilePopupMenu;->setVisible(Z)V

    .line 1646
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v1

    .line 1647
    .local v1, "cmd":Ljava/lang/String;
    const/4 v2, -0x1

    .line 1649
    .local v2, "line":I
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getLineOfOffset(I)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    .line 1651
    goto :goto_0

    .line 1650
    :catch_0
    move-exception v3

    .line 1652
    :goto_0
    const-string v3, "Set Breakpoint"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1653
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->w:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->setBreakPoint(I)V

    goto :goto_1

    .line 1654
    :cond_0
    const-string v3, "Clear Breakpoint"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1655
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->w:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->clearBreakPoint(I)V

    goto :goto_1

    .line 1656
    :cond_1
    const-string v3, "Run"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1657
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->w:Lcom/trendmicro/hippo/tools/debugger/FileWindow;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/FileWindow;->load()V

    .line 1659
    :cond_2
    :goto_1
    return-void
.end method

.method public keyPressed(Ljava/awt/event/KeyEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .line 1668
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x7f

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1673
    :cond_0
    :pswitch_0
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 1676
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public keyReleased(Ljava/awt/event/KeyEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .line 1691
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 1692
    return-void
.end method

.method public keyTyped(Ljava/awt/event/KeyEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/KeyEvent;

    .line 1683
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 1684
    return-void
.end method

.method public mouseClicked(Ljava/awt/event/MouseEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 1587
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->checkPopup(Ljava/awt/event/MouseEvent;)V

    .line 1588
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->requestFocus()V

    .line 1589
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getCaret()Ljavax/swing/text/Caret;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljavax/swing/text/Caret;->setVisible(Z)V

    .line 1590
    return-void
.end method

.method public mouseEntered(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 1597
    return-void
.end method

.method public mouseExited(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 1604
    return-void
.end method

.method public mousePressed(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 1579
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->checkPopup(Ljava/awt/event/MouseEvent;)V

    .line 1580
    return-void
.end method

.method public mouseReleased(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 1611
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->checkPopup(Ljava/awt/event/MouseEvent;)V

    .line 1612
    return-void
.end method

.method public popupMenuCanceled(Ljavax/swing/event/PopupMenuEvent;)V
    .locals 0
    .param p1, "e"    # Ljavax/swing/event/PopupMenuEvent;

    .line 1635
    return-void
.end method

.method public popupMenuWillBecomeInvisible(Ljavax/swing/event/PopupMenuEvent;)V
    .locals 0
    .param p1, "e"    # Ljavax/swing/event/PopupMenuEvent;

    .line 1628
    return-void
.end method

.method public popupMenuWillBecomeVisible(Ljavax/swing/event/PopupMenuEvent;)V
    .locals 0
    .param p1, "e"    # Ljavax/swing/event/PopupMenuEvent;

    .line 1621
    return-void
.end method

.method public select(I)V
    .locals 7
    .param p1, "pos"    # I

    .line 1529
    if-ltz p1, :cond_3

    .line 1531
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getLineOfOffset(I)I

    move-result v0

    .line 1532
    .local v0, "line":I
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->modelToView(I)Ljava/awt/Rectangle;

    move-result-object v1

    .line 1533
    .local v1, "rect":Ljava/awt/Rectangle;
    if-nez v1, :cond_0

    .line 1534
    invoke-virtual {p0, p1, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(II)V
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 1537
    :cond_0
    add-int/lit8 v2, v0, 0x1

    .line 1538
    :try_start_1
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getLineStartOffset(I)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->modelToView(I)Ljava/awt/Rectangle;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1539
    .local v2, "nrect":Ljava/awt/Rectangle;
    if-eqz v2, :cond_1

    .line 1540
    move-object v1, v2

    .line 1543
    .end local v2    # "nrect":Ljava/awt/Rectangle;
    :cond_1
    goto :goto_0

    .line 1542
    :catch_0
    move-exception v2

    .line 1544
    :goto_0
    :try_start_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->getParent()Ljava/awt/Container;

    move-result-object v2

    check-cast v2, Ljavax/swing/JViewport;

    .line 1545
    .local v2, "vp":Ljavax/swing/JViewport;
    invoke-virtual {v2}, Ljavax/swing/JViewport;->getViewRect()Ljava/awt/Rectangle;

    move-result-object v3

    .line 1546
    .local v3, "viewRect":Ljava/awt/Rectangle;
    iget v4, v3, Ljava/awt/Rectangle;->y:I

    iget v5, v3, Ljava/awt/Rectangle;->height:I

    add-int/2addr v4, v5

    iget v5, v1, Ljava/awt/Rectangle;->y:I

    if-le v4, v5, :cond_2

    .line 1548
    invoke-virtual {p0, p1, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(II)V

    goto :goto_1

    .line 1551
    :cond_2
    iget v4, v1, Ljava/awt/Rectangle;->y:I

    iget v5, v3, Ljava/awt/Rectangle;->height:I

    iget v6, v1, Ljava/awt/Rectangle;->height:I

    sub-int/2addr v5, v6

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v4, v5

    iput v4, v1, Ljava/awt/Rectangle;->y:I

    .line 1552
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->scrollRectToVisible(Ljava/awt/Rectangle;)V

    .line 1553
    invoke-virtual {p0, p1, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(II)V
    :try_end_2
    .catch Ljavax/swing/text/BadLocationException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1559
    .end local v0    # "line":I
    .end local v1    # "rect":Ljava/awt/Rectangle;
    .end local v2    # "vp":Ljavax/swing/JViewport;
    .end local v3    # "viewRect":Ljava/awt/Rectangle;
    :goto_1
    goto :goto_2

    .line 1556
    :catch_1
    move-exception v0

    .line 1557
    .local v0, "exc":Ljavax/swing/text/BadLocationException;
    invoke-virtual {p0, p1, p1}, Lcom/trendmicro/hippo/tools/debugger/FileTextArea;->select(II)V

    .line 1561
    .end local v0    # "exc":Ljavax/swing/text/BadLocationException;
    :cond_3
    :goto_2
    return-void
.end method
