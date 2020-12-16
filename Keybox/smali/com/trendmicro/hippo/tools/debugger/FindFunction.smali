.class Lcom/trendmicro/hippo/tools/debugger/FindFunction;
.super Ljavax/swing/JDialog;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/debugger/FindFunction$MouseHandler;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7c3b61d31fa8114L


# instance fields
.field private cancelButton:Ljavax/swing/JButton;

.field private debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

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

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "debugGui"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "labelText"    # Ljava/lang/String;

    .line 1884
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Ljavax/swing/JDialog;-><init>(Ljava/awt/Frame;Ljava/lang/String;Z)V

    .line 1885
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 1887
    new-instance v1, Ljavax/swing/JButton;

    const-string v2, "Cancel"

    invoke-direct {v1, v2}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->cancelButton:Ljavax/swing/JButton;

    .line 1888
    new-instance v1, Ljavax/swing/JButton;

    const-string v2, "Select"

    invoke-direct {v1, v2}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    .line 1889
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->cancelButton:Ljavax/swing/JButton;

    invoke-virtual {v1, p0}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1890
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v1, p0}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 1891
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->getRootPane()Ljavax/swing/JRootPane;

    move-result-object v1

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v1, v2}, Ljavax/swing/JRootPane;->setDefaultButton(Ljavax/swing/JButton;)V

    .line 1893
    new-instance v1, Ljavax/swing/JList;

    new-instance v2, Ljavax/swing/DefaultListModel;

    invoke-direct {v2}, Ljavax/swing/DefaultListModel;-><init>()V

    invoke-direct {v1, v2}, Ljavax/swing/JList;-><init>(Ljavax/swing/ListModel;)V

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    .line 1894
    invoke-virtual {v1}, Ljavax/swing/JList;->getModel()Ljavax/swing/ListModel;

    move-result-object v1

    check-cast v1, Ljavax/swing/DefaultListModel;

    .line 1895
    .local v1, "model":Ljavax/swing/DefaultListModel;, "Ljavax/swing/DefaultListModel<Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljavax/swing/DefaultListModel;->clear()V

    .line 1897
    iget-object v2, p1, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionNames()[Ljava/lang/String;

    move-result-object v2

    .line 1898
    .local v2, "a":[Ljava/lang/String;
    invoke-static {v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 1899
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_0

    .line 1900
    aget-object v4, v2, v3

    invoke-virtual {v1, v4}, Ljavax/swing/DefaultListModel;->addElement(Ljava/lang/Object;)V

    .line 1899
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1902
    .end local v3    # "i":I
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljavax/swing/JList;->setSelectedIndex(I)V

    .line 1904
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    array-length v5, v2

    if-lez v5, :cond_1

    move v5, v0

    goto :goto_1

    :cond_1
    move v5, v4

    :goto_1
    invoke-virtual {v3, v5}, Ljavax/swing/JButton;->setEnabled(Z)V

    .line 1905
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-virtual {v3, v0}, Ljavax/swing/JList;->setSelectionMode(I)V

    .line 1906
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    new-instance v5, Lcom/trendmicro/hippo/tools/debugger/FindFunction$MouseHandler;

    invoke-direct {v5, p0}, Lcom/trendmicro/hippo/tools/debugger/FindFunction$MouseHandler;-><init>(Lcom/trendmicro/hippo/tools/debugger/FindFunction;)V

    invoke-virtual {v3, v5}, Ljavax/swing/JList;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 1907
    new-instance v3, Ljavax/swing/JScrollPane;

    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-direct {v3, v5}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 1908
    .local v3, "listScroller":Ljavax/swing/JScrollPane;
    new-instance v5, Ljava/awt/Dimension;

    const/16 v6, 0x140

    const/16 v7, 0xf0

    invoke-direct {v5, v6, v7}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v3, v5}, Ljavax/swing/JScrollPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 1909
    new-instance v5, Ljava/awt/Dimension;

    const/16 v6, 0xfa

    const/16 v7, 0x50

    invoke-direct {v5, v6, v7}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v3, v5}, Ljavax/swing/JScrollPane;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 1910
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljavax/swing/JScrollPane;->setAlignmentX(F)V

    .line 1916
    new-instance v5, Ljavax/swing/JPanel;

    invoke-direct {v5}, Ljavax/swing/JPanel;-><init>()V

    .line 1917
    .local v5, "listPane":Ljavax/swing/JPanel;
    new-instance v6, Ljavax/swing/BoxLayout;

    invoke-direct {v6, v5, v0}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v5, v6}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 1918
    new-instance v0, Ljavax/swing/JLabel;

    invoke-direct {v0, p3}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 1919
    .local v0, "label":Ljavax/swing/JLabel;
    iget-object v6, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-virtual {v0, v6}, Ljavax/swing/JLabel;->setLabelFor(Ljava/awt/Component;)V

    .line 1920
    invoke-virtual {v5, v0}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1921
    new-instance v6, Ljava/awt/Dimension;

    const/4 v7, 0x5

    invoke-direct {v6, v4, v7}, Ljava/awt/Dimension;-><init>(II)V

    invoke-static {v6}, Ljavax/swing/Box;->createRigidArea(Ljava/awt/Dimension;)Ljava/awt/Component;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1922
    invoke-virtual {v5, v3}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1923
    const/16 v6, 0xa

    invoke-static {v6, v6, v6, v6}, Ljavax/swing/BorderFactory;->createEmptyBorder(IIII)Ljavax/swing/border/Border;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 1926
    new-instance v7, Ljavax/swing/JPanel;

    invoke-direct {v7}, Ljavax/swing/JPanel;-><init>()V

    .line 1927
    .local v7, "buttonPane":Ljavax/swing/JPanel;
    new-instance v8, Ljavax/swing/BoxLayout;

    invoke-direct {v8, v7, v4}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v7, v8}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 1928
    invoke-static {v4, v6, v6, v6}, Ljavax/swing/BorderFactory;->createEmptyBorder(IIII)Ljavax/swing/border/Border;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 1929
    invoke-static {}, Ljavax/swing/Box;->createHorizontalGlue()Ljava/awt/Component;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1930
    iget-object v8, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->cancelButton:Ljavax/swing/JButton;

    invoke-virtual {v7, v8}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1931
    new-instance v8, Ljava/awt/Dimension;

    invoke-direct {v8, v6, v4}, Ljava/awt/Dimension;-><init>(II)V

    invoke-static {v8}, Ljavax/swing/Box;->createRigidArea(Ljava/awt/Dimension;)Ljava/awt/Component;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1932
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    invoke-virtual {v7, v4}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 1935
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->getContentPane()Ljava/awt/Container;

    move-result-object v4

    .line 1936
    .local v4, "contentPane":Ljava/awt/Container;
    const-string v6, "Center"

    invoke-virtual {v4, v5, v6}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 1937
    const-string v6, "South"

    invoke-virtual {v4, v7, v6}, Ljava/awt/Container;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 1938
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->pack()V

    .line 1939
    new-instance v6, Lcom/trendmicro/hippo/tools/debugger/FindFunction$1;

    invoke-direct {v6, p0}, Lcom/trendmicro/hippo/tools/debugger/FindFunction$1;-><init>(Lcom/trendmicro/hippo/tools/debugger/FindFunction;)V

    invoke-virtual {p0, v6}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->addKeyListener(Ljava/awt/event/KeyListener;)V

    .line 1950
    return-void
.end method

.method static synthetic access$002(Lcom/trendmicro/hippo/tools/debugger/FindFunction;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/FindFunction;
    .param p1, "x1"    # Ljava/lang/String;

    .line 1848
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->value:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lcom/trendmicro/hippo/tools/debugger/FindFunction;)Ljavax/swing/JButton;
    .locals 1
    .param p0, "x0"    # Lcom/trendmicro/hippo/tools/debugger/FindFunction;

    .line 1848
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setButton:Ljavax/swing/JButton;

    return-object v0
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 6
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 1969
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 1970
    .local v0, "cmd":Ljava/lang/String;
    const-string v1, "Cancel"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1971
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setVisible(Z)V

    .line 1972
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->value:Ljava/lang/String;

    goto :goto_0

    .line 1973
    :cond_0
    const-string v1, "Select"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1974
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-virtual {v1}, Ljavax/swing/JList;->getSelectedIndex()I

    move-result v1

    if-gez v1, :cond_1

    .line 1975
    return-void

    .line 1978
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->list:Ljavax/swing/JList;

    invoke-virtual {v1}, Ljavax/swing/JList;->getSelectedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->value:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1981
    nop

    .line 1982
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setVisible(Z)V

    .line 1983
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v1, v1, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->value:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/Dim;->functionSourceByName(Ljava/lang/String;)Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;

    move-result-object v1

    .line 1984
    .local v1, "item":Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    if-eqz v1, :cond_2

    .line 1985
    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->sourceInfo()Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    move-result-object v2

    .line 1986
    .local v2, "si":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v3

    .line 1987
    .local v3, "url":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;->firstLine()I

    move-result v4

    .line 1988
    .local v4, "lineNumber":I
    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v5, v3, v4}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->showFileWindow(Ljava/lang/String;I)V

    goto :goto_0

    .line 1979
    .end local v1    # "item":Lcom/trendmicro/hippo/tools/debugger/Dim$FunctionSource;
    .end local v2    # "si":Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;
    .end local v3    # "url":Ljava/lang/String;
    .end local v4    # "lineNumber":I
    :catch_0
    move-exception v1

    .line 1980
    .local v1, "exc":Ljava/lang/ArrayIndexOutOfBoundsException;
    return-void

    .line 1991
    .end local v1    # "exc":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_2
    :goto_0
    return-void
.end method

.method public showDialog(Ljava/awt/Component;)Ljava/lang/String;
    .locals 1
    .param p1, "comp"    # Ljava/awt/Component;

    .line 1956
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->value:Ljava/lang/String;

    .line 1957
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setLocationRelativeTo(Ljava/awt/Component;)V

    .line 1958
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setVisible(Z)V

    .line 1959
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->value:Ljava/lang/String;

    return-object v0
.end method
