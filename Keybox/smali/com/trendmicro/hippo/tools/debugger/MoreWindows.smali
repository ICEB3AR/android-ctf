.class Lcom/trendmicro/hippo/tools/debugger/MoreWindows;
.super Ljavax/swing/JDialog;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/debugger/MoreWindows$MouseHandler;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x47d8a25e0afd370aL


# instance fields
.field private cancelButton:Ljavax/swing/JButton;

.field private list:Ljavax/swing/JList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/swing/JList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private setButton:Ljavax/swing/JButton;

.field private swingGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

.field private value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "frame"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "labelText"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/tools/debugger/SwingGui;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/trendmicro/hippo/tools/debugger/FileWindow;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1735
    .local p2, "fileWindows":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/trendmicro/hippo/tools/debugger/FileWindow;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p3, v0}, Ljavax/swing/JDialog;-><init>(Ljava/awt/Frame;Ljava/lang/String;Z)V

    .line 1736
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->swingGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 1738
    new-instance v1, Ljavax/swing/JButton;

    const-string v2, "Cancel"

    invoke-direct {v1, v2}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->cancelButton:Ljavax/swing/JButton;

    .line 1739
    new-instance v1, Ljavax/swing/JButton;

    const-string v2, "Select"

    invoke-direct {v1, v2}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    .line 1740
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->cancelButton:Ljavax/swing/JButton;

    invoke-virtual {v1, p0}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1741
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v1, p0}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1742
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->getRootPane()Ljavax/swing/JRootPane;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v1, v2}, Ljavax/swing/JRootPane;->setDefaultButton(Ljavax/swing/JButton;)V

    .line 1745
    new-instance v1, Ljavax/swing/JList;

    new-instance v2, Ljavax/swing/DefaultListModel;

    invoke-direct {v2}, Ljavax/swing/DefaultListModel;-><init>()V

    invoke-direct {v1, v2}, Ljavax/swing/JList;-><init>(Ljavax/swing/ListModel;)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    .line 1746
    invoke-virtual {v1}, Ljavax/swing/JList;->getModel()Ljavax/swing/ListModel;

    move-result-object v1

    check-cast v1, Ljavax/swing/DefaultListModel;

    .line 1747
    .local v1, "model":Ljavax/swing/DefaultListModel;, "Ljavax/swing/DefaultListModel<Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljavax/swing/DefaultListModel;->clear()V

    .line 1749
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1750
    .local v3, "data":Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljavax/swing/DefaultListModel;->addElement(Ljava/lang/Object;)V

    .line 1751
    .end local v3    # "data":Ljava/lang/String;
    goto :goto_0

    .line 1752
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljavax/swing/JList;->setSelectedIndex(I)V

    .line 1754
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v2, v0}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 1755
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    invoke-virtual {v2, v0}, Ljavax/swing/JList;->setSelectionMode(I)V

    .line 1756
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    new-instance v4, Lcom/trendmicro/hippo/tools/debugger/MoreWindows$MouseHandler;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows$MouseHandler;-><init>(Lcom/trendmicro/hippo/tools/debugger/MoreWindows;Lcom/trendmicro/hippo/tools/debugger/MoreWindows$1;)V

    invoke-virtual {v2, v4}, Ljavax/swing/JList;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 1757
    new-instance v2, Ljavax/swing/JScrollPane;

    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    invoke-direct {v2, v4}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 1758
    .local v2, "listScroller":Ljavax/swing/JScrollPane;
    new-instance v4, Ljava/awt/Dimension;

    const/16 v5, 0x140

    const/16 v6, 0xf0

    invoke-direct {v4, v5, v6}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v2, v4}, Ljavax/swing/JScrollPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 1761
    new-instance v4, Ljava/awt/Dimension;

    const/16 v5, 0xfa

    const/16 v6, 0x50

    invoke-direct {v4, v5, v6}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v2, v4}, Ljavax/swing/JScrollPane;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 1762
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljavax/swing/JScrollPane;->setAlignmentX(F)V

    .line 1768
    new-instance v4, Ljavax/swing/JPanel;

    invoke-direct {v4}, Ljavax/swing/JPanel;-><init>()V

    .line 1769
    .local v4, "listPane":Ljavax/swing/JPanel;
    new-instance v5, Ljavax/swing/BoxLayout;

    invoke-direct {v5, v4, v0}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v4, v5}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 1770
    new-instance v0, Ljavax/swing/JLabel;

    invoke-direct {v0, p4}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 1771
    .local v0, "label":Ljavax/swing/JLabel;
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    invoke-virtual {v0, v5}, Ljavax/swing/JLabel;->setLabelFor(Ljava/awt/Component;)V

    .line 1772
    invoke-virtual {v4, v0}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1773
    new-instance v5, Ljava/awt/Dimension;

    const/4 v6, 0x5

    invoke-direct {v5, v3, v6}, Ljava/awt/Dimension;-><init>(II)V

    invoke-static {v5}, Ljavax/swing/Box;->createRigidArea(Ljava/awt/Dimension;)Ljava/awt/Component;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1774
    invoke-virtual {v4, v2}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1775
    const/16 v5, 0xa

    invoke-static {v5, v5, v5, v5}, Ljavax/swing/BorderFactory;->createEmptyBorder(IIII)Ljavax/swing/border/Border;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 1778
    new-instance v6, Ljavax/swing/JPanel;

    invoke-direct {v6}, Ljavax/swing/JPanel;-><init>()V

    .line 1779
    .local v6, "buttonPane":Ljavax/swing/JPanel;
    new-instance v7, Ljavax/swing/BoxLayout;

    invoke-direct {v7, v6, v3}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v6, v7}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 1780
    invoke-static {v3, v5, v5, v5}, Ljavax/swing/BorderFactory;->createEmptyBorder(IIII)Ljavax/swing/border/Border;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 1781
    invoke-static {}, Ljavax/swing/Box;->createHorizontalGlue()Ljava/awt/Component;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1782
    iget-object v7, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->cancelButton:Ljavax/swing/JButton;

    invoke-virtual {v6, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1783
    new-instance v7, Ljava/awt/Dimension;

    invoke-direct {v7, v5, v3}, Ljava/awt/Dimension;-><init>(II)V

    invoke-static {v7}, Ljavax/swing/Box;->createRigidArea(Ljava/awt/Dimension;)Ljava/awt/Component;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1784
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v6, v3}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1787
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->getContentPane()Ljava/awt/Container;

    move-result-object v3

    .line 1788
    .local v3, "contentPane":Ljava/awt/Container;
    const-string v5, "Center"

    invoke-virtual {v3, v4, v5}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 1789
    const-string v5, "South"

    invoke-virtual {v3, v6, v5}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 1790
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->pack()V

    .line 1791
    new-instance v5, Lcom/trendmicro/hippo/tools/debugger/MoreWindows$1;

    invoke-direct {v5, p0}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows$1;-><init>(Lcom/trendmicro/hippo/tools/debugger/MoreWindows;)V

    invoke-virtual {p0, v5}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->addKeyListener(Ljava/awt/event/KeyListener;)V

    .line 1802
    return-void
.end method

.method static synthetic access$102(Lcom/trendmicro/hippo/tools/debugger/MoreWindows;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/MoreWindows;
    .param p1, "x1"    # Ljava/lang/String;

    .line 1698
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/trendmicro/hippo/tools/debugger/MoreWindows;)Ljavax/swing/JButton;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/MoreWindows;

    .line 1698
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setButton:Ljavax/swing/JButton;

    return-object v0
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 4
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 1821
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 1822
    .local v0, "cmd":Ljava/lang/String;
    const-string v1, "Cancel"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1823
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setVisible(Z)V

    .line 1824
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    goto :goto_0

    .line 1825
    :cond_0
    const-string v1, "Select"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1826
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->list:Ljavax/swing/JList;

    invoke-virtual {v1}, Ljavax/swing/JList;->getSelectedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    .line 1827
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setVisible(Z)V

    .line 1828
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->swingGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->showFileWindow(Ljava/lang/String;I)V

    .line 1830
    :cond_1
    :goto_0
    return-void
.end method

.method public showDialog(Ljava/awt/Component;)Ljava/lang/String;
    .locals 1
    .param p1, "comp"    # Ljava/awt/Component;

    .line 1808
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    .line 1809
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setLocationRelativeTo(Ljava/awt/Component;)V

    .line 1810
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->setVisible(Z)V

    .line 1811
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->value:Ljava/lang/String;

    return-object v0
.end method
