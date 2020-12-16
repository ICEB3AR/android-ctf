.class Lcom/trendmicro/hippo/tools/debugger/ContextWindow;
.super Ljavax/swing/JPanel;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field private static final serialVersionUID:J = 0x2000b40c9d971f53L


# instance fields
.field private cmdLine:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

.field context:Ljavax/swing/JComboBox;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljavax/swing/JComboBox<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

.field private enabled:Z

.field private evaluator:Lcom/trendmicro/hippo/tools/debugger/Evaluator;

.field private localsTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

.field split:Ljavax/swing/JSplitPane;

.field private tableModel:Lcom/trendmicro/hippo/tools/debugger/MyTableModel;

.field private tabs:Ljavax/swing/JTabbedPane;

.field private tabs2:Ljavax/swing/JTabbedPane;

.field private thisTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

.field toolTips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
    .locals 28
    .param p1, "debugGui"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 3028
    move-object/from16 v15, p0

    move-object/from16 v14, p1

    invoke-direct/range {p0 .. p0}, Ljavax/swing/JPanel;-><init>()V

    .line 3029
    iput-object v14, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 3030
    const/4 v13, 0x0

    iput-boolean v13, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->enabled:Z

    .line 3031
    new-instance v0, Ljavax/swing/JPanel;

    invoke-direct {v0}, Ljavax/swing/JPanel;-><init>()V

    move-object v12, v0

    .line 3032
    .local v12, "left":Ljavax/swing/JPanel;
    new-instance v0, Ljavax/swing/JToolBar;

    invoke-direct {v0}, Ljavax/swing/JToolBar;-><init>()V

    move-object v11, v0

    .line 3033
    .local v11, "t1":Ljavax/swing/JToolBar;
    const-string v0, "Variables"

    invoke-virtual {v11, v0}, Ljavax/swing/JToolBar;->setName(Ljava/lang/String;)V

    .line 3034
    new-instance v0, Ljava/awt/GridLayout;

    invoke-direct {v0}, Ljava/awt/GridLayout;-><init>()V

    invoke-virtual {v11, v0}, Ljavax/swing/JToolBar;->setLayout(Ljava/awt/LayoutManager;)V

    .line 3035
    invoke-virtual {v11, v12}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 3036
    new-instance v0, Ljavax/swing/JPanel;

    invoke-direct {v0}, Ljavax/swing/JPanel;-><init>()V

    move-object v10, v0

    .line 3037
    .local v10, "p1":Ljavax/swing/JPanel;
    new-instance v0, Ljava/awt/GridLayout;

    invoke-direct {v0}, Ljava/awt/GridLayout;-><init>()V

    invoke-virtual {v10, v0}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 3038
    new-instance v0, Ljavax/swing/JPanel;

    invoke-direct {v0}, Ljavax/swing/JPanel;-><init>()V

    move-object v9, v0

    .line 3039
    .local v9, "p2":Ljavax/swing/JPanel;
    new-instance v0, Ljava/awt/GridLayout;

    invoke-direct {v0}, Ljava/awt/GridLayout;-><init>()V

    invoke-virtual {v9, v0}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 3040
    invoke-virtual {v10, v11}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 3041
    new-instance v0, Ljavax/swing/JLabel;

    const-string v1, "Context:"

    invoke-direct {v0, v1}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    move-object v8, v0

    .line 3042
    .local v8, "label":Ljavax/swing/JLabel;
    new-instance v0, Ljavax/swing/JComboBox;

    invoke-direct {v0}, Ljavax/swing/JComboBox;-><init>()V

    iput-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    .line 3043
    invoke-virtual {v0, v13}, Ljavax/swing/JComboBox;->setLightWeightPopupEnabled(Z)V

    .line 3044
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->toolTips:Ljava/util/List;

    .line 3045
    iget-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v0}, Ljavax/swing/JComboBox;->getBorder()Ljavax/swing/border/Border;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljavax/swing/JLabel;->setBorder(Ljavax/swing/border/Border;)V

    .line 3046
    iget-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v0, v15}, Ljavax/swing/JComboBox;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 3047
    iget-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    const-string v1, "ContextSwitch"

    invoke-virtual {v0, v1}, Ljavax/swing/JComboBox;->setActionCommand(Ljava/lang/String;)V

    .line 3048
    new-instance v0, Ljava/awt/GridBagLayout;

    invoke-direct {v0}, Ljava/awt/GridBagLayout;-><init>()V

    move-object v5, v0

    .line 3049
    .local v5, "layout":Ljava/awt/GridBagLayout;
    invoke-virtual {v12, v5}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 3050
    new-instance v0, Ljava/awt/GridBagConstraints;

    invoke-direct {v0}, Ljava/awt/GridBagConstraints;-><init>()V

    move-object v1, v0

    .line 3051
    .local v1, "lc":Ljava/awt/GridBagConstraints;
    iget-object v0, v1, Ljava/awt/GridBagConstraints;->insets:Ljava/awt/Insets;

    const/4 v2, 0x5

    iput v2, v0, Ljava/awt/Insets;->left:I

    .line 3052
    const/16 v0, 0x11

    iput v0, v1, Ljava/awt/GridBagConstraints;->anchor:I

    .line 3053
    iput v2, v1, Ljava/awt/GridBagConstraints;->ipadx:I

    .line 3054
    invoke-virtual {v5, v8, v1}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 3055
    invoke-virtual {v12, v8}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 3056
    new-instance v3, Ljava/awt/GridBagConstraints;

    invoke-direct {v3}, Ljava/awt/GridBagConstraints;-><init>()V

    move-object v7, v3

    .line 3057
    .local v7, "c":Ljava/awt/GridBagConstraints;
    iput v13, v7, Ljava/awt/GridBagConstraints;->gridwidth:I

    .line 3058
    const/4 v3, 0x2

    iput v3, v7, Ljava/awt/GridBagConstraints;->fill:I

    .line 3059
    iput v0, v7, Ljava/awt/GridBagConstraints;->anchor:I

    .line 3060
    iget-object v4, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v5, v4, v7}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 3061
    iget-object v4, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v12, v4}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 3062
    new-instance v4, Ljavax/swing/JTabbedPane;

    const/4 v6, 0x3

    invoke-direct {v4, v6}, Ljavax/swing/JTabbedPane;-><init>(I)V

    iput-object v4, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    .line 3063
    new-instance v6, Ljava/awt/Dimension;

    const/16 v0, 0x1f4

    const/16 v13, 0x12c

    invoke-direct {v6, v0, v13}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v4, v6}, Ljavax/swing/JTabbedPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 3064
    new-instance v4, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    new-instance v6, Lcom/trendmicro/hippo/tools/debugger/VariableModel;

    invoke-direct {v6}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;-><init>()V

    invoke-direct {v4, v6}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;-><init>(Lcom/trendmicro/hippo/tools/debugger/VariableModel;)V

    iput-object v4, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->thisTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    .line 3065
    new-instance v4, Ljavax/swing/JScrollPane;

    iget-object v6, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->thisTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    invoke-direct {v4, v6}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 3066
    .local v4, "jsp":Ljavax/swing/JScrollPane;
    invoke-virtual {v4}, Ljavax/swing/JScrollPane;->getViewport()Ljavax/swing/JViewport;

    move-result-object v6

    new-instance v0, Ljava/awt/Dimension;

    invoke-direct {v0, v2, v3}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v6, v0}, Ljavax/swing/JViewport;->setViewSize(Ljava/awt/Dimension;)V

    .line 3067
    iget-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    const-string v2, "this"

    invoke-virtual {v0, v2, v4}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 3068
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    new-instance v2, Lcom/trendmicro/hippo/tools/debugger/VariableModel;

    invoke-direct {v2}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;-><init>()V

    invoke-direct {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;-><init>(Lcom/trendmicro/hippo/tools/debugger/VariableModel;)V

    iput-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->localsTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    .line 3069
    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setAutoResizeMode(I)V

    .line 3070
    iget-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->localsTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 3071
    new-instance v0, Ljavax/swing/JScrollPane;

    iget-object v3, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->localsTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    invoke-direct {v0, v3}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    .line 3072
    .end local v4    # "jsp":Ljavax/swing/JScrollPane;
    .local v0, "jsp":Ljavax/swing/JScrollPane;
    iget-object v3, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    const-string v4, "Locals"

    invoke-virtual {v3, v4, v0}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 3073
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    iput-wide v3, v7, Ljava/awt/GridBagConstraints;->weighty:D

    iput-wide v3, v7, Ljava/awt/GridBagConstraints;->weightx:D

    .line 3074
    const/4 v4, 0x0

    iput v4, v7, Ljava/awt/GridBagConstraints;->gridheight:I

    .line 3075
    const/4 v3, 0x1

    iput v3, v7, Ljava/awt/GridBagConstraints;->fill:I

    .line 3076
    const/16 v6, 0x11

    iput v6, v7, Ljava/awt/GridBagConstraints;->anchor:I

    .line 3077
    iget-object v6, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    invoke-virtual {v5, v6, v7}, Ljava/awt/GridBagLayout;->setConstraints(Ljava/awt/Component;Ljava/awt/GridBagConstraints;)V

    .line 3078
    iget-object v6, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tabs:Ljavax/swing/JTabbedPane;

    invoke-virtual {v12, v6}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 3079
    new-instance v6, Lcom/trendmicro/hippo/tools/debugger/Evaluator;

    invoke-direct {v6, v14}, Lcom/trendmicro/hippo/tools/debugger/Evaluator;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V

    iput-object v6, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->evaluator:Lcom/trendmicro/hippo/tools/debugger/Evaluator;

    .line 3080
    new-instance v6, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    invoke-direct {v6, v14}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V

    iput-object v6, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->cmdLine:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    .line 3082
    iget-object v6, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->evaluator:Lcom/trendmicro/hippo/tools/debugger/Evaluator;

    iget-object v6, v6, Lcom/trendmicro/hippo/tools/debugger/Evaluator;->tableModel:Lcom/trendmicro/hippo/tools/debugger/MyTableModel;

    iput-object v6, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tableModel:Lcom/trendmicro/hippo/tools/debugger/MyTableModel;

    .line 3083
    new-instance v6, Ljavax/swing/JScrollPane;

    iget-object v4, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->evaluator:Lcom/trendmicro/hippo/tools/debugger/Evaluator;

    invoke-direct {v6, v4}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    move-object v0, v6

    .line 3084
    new-instance v4, Ljavax/swing/JToolBar;

    invoke-direct {v4}, Ljavax/swing/JToolBar;-><init>()V

    .line 3085
    .local v4, "t2":Ljavax/swing/JToolBar;
    const-string v6, "Evaluate"

    invoke-virtual {v4, v6}, Ljavax/swing/JToolBar;->setName(Ljava/lang/String;)V

    .line 3086
    new-instance v3, Ljavax/swing/JTabbedPane;

    const/4 v2, 0x3

    invoke-direct {v3, v2}, Ljavax/swing/JTabbedPane;-><init>(I)V

    iput-object v3, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tabs2:Ljavax/swing/JTabbedPane;

    .line 3087
    const-string v2, "Watch"

    invoke-virtual {v3, v2, v0}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 3088
    iget-object v2, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tabs2:Ljavax/swing/JTabbedPane;

    new-instance v3, Ljavax/swing/JScrollPane;

    iget-object v13, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->cmdLine:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    invoke-direct {v3, v13}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual {v2, v6, v3}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 3089
    iget-object v2, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tabs2:Ljavax/swing/JTabbedPane;

    new-instance v3, Ljava/awt/Dimension;

    const/16 v6, 0x12c

    const/16 v13, 0x1f4

    invoke-direct {v3, v13, v6}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v2, v3}, Ljavax/swing/JTabbedPane;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 3090
    new-instance v2, Ljava/awt/GridLayout;

    invoke-direct {v2}, Ljava/awt/GridLayout;-><init>()V

    invoke-virtual {v4, v2}, Ljavax/swing/JToolBar;->setLayout(Ljava/awt/LayoutManager;)V

    .line 3091
    iget-object v2, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tabs2:Ljavax/swing/JTabbedPane;

    invoke-virtual {v4, v2}, Ljavax/swing/JToolBar;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 3092
    invoke-virtual {v9, v4}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 3093
    iget-object v2, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->evaluator:Lcom/trendmicro/hippo/tools/debugger/Evaluator;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/tools/debugger/Evaluator;->setAutoResizeMode(I)V

    .line 3094
    new-instance v2, Ljavax/swing/JSplitPane;

    const/4 v3, 0x1

    invoke-direct {v2, v3, v10, v9}, Ljavax/swing/JSplitPane;-><init>(ILjava/awt/Component;Ljava/awt/Component;)V

    iput-object v2, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    .line 3096
    invoke-virtual {v2, v3}, Ljavax/swing/JSplitPane;->setOneTouchExpandable(Z)V

    .line 3097
    iget-object v2, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    move-object/from16 v16, v0

    move-object v13, v1

    .end local v0    # "jsp":Ljavax/swing/JScrollPane;
    .end local v1    # "lc":Ljava/awt/GridBagConstraints;
    .local v13, "lc":Ljava/awt/GridBagConstraints;
    .local v16, "jsp":Ljavax/swing/JScrollPane;
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    invoke-static {v2, v0, v1}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->setResizeWeight(Ljavax/swing/JSplitPane;D)V

    .line 3098
    new-instance v0, Ljava/awt/BorderLayout;

    invoke-direct {v0}, Ljava/awt/BorderLayout;-><init>()V

    invoke-virtual {v15, v0}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->setLayout(Ljava/awt/LayoutManager;)V

    .line 3099
    iget-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    const-string v1, "Center"

    invoke-virtual {v15, v0, v1}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 3101
    move-object v3, v11

    .line 3102
    .local v3, "finalT1":Ljavax/swing/JToolBar;
    move-object v6, v4

    .line 3103
    .local v6, "finalT2":Ljavax/swing/JToolBar;
    move-object v1, v4

    const/16 v17, 0x0

    .end local v4    # "t2":Ljavax/swing/JToolBar;
    .local v1, "t2":Ljavax/swing/JToolBar;
    move-object v4, v10

    .line 3104
    .local v4, "finalP1":Ljavax/swing/JPanel;
    move-object/from16 v18, v7

    .end local v7    # "c":Ljava/awt/GridBagConstraints;
    .local v18, "c":Ljava/awt/GridBagConstraints;
    move-object v7, v9

    .line 3105
    .local v7, "finalP2":Ljavax/swing/JPanel;
    iget-object v0, v15, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->split:Ljavax/swing/JSplitPane;

    .line 3106
    .local v0, "finalSplit":Ljavax/swing/JSplitPane;
    move-object/from16 v2, p0

    .line 3108
    .local v2, "finalThis":Ljavax/swing/JPanel;
    new-instance v19, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;

    move-object/from16 v20, v0

    .end local v0    # "finalSplit":Ljavax/swing/JSplitPane;
    .local v20, "finalSplit":Ljavax/swing/JSplitPane;
    move-object/from16 v0, v19

    move-object/from16 v21, v13

    move-object v13, v1

    .end local v1    # "t2":Ljavax/swing/JToolBar;
    .local v13, "t2":Ljavax/swing/JToolBar;
    .local v21, "lc":Ljava/awt/GridBagConstraints;
    move-object/from16 v1, p0

    move-object/from16 v22, v5

    .end local v5    # "layout":Ljava/awt/GridBagLayout;
    .local v22, "layout":Ljava/awt/GridBagLayout;
    move-object/from16 v5, p1

    move-object/from16 v23, v8

    .end local v8    # "label":Ljavax/swing/JLabel;
    .local v23, "label":Ljavax/swing/JLabel;
    move-object/from16 v8, v20

    invoke-direct/range {v0 .. v8}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;-><init>(Lcom/trendmicro/hippo/tools/debugger/ContextWindow;Ljavax/swing/JPanel;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Lcom/trendmicro/hippo/tools/debugger/SwingGui;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Ljavax/swing/JSplitPane;)V

    .line 3219
    .local v0, "clistener":Ljava/awt/event/ComponentListener;
    new-instance v1, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;

    move-object v8, v1

    move-object v5, v9

    .end local v9    # "p2":Ljavax/swing/JPanel;
    .local v5, "p2":Ljavax/swing/JPanel;
    move-object/from16 v9, p0

    move-object/from16 v19, v4

    .end local v10    # "p1":Ljavax/swing/JPanel;
    .local v4, "p1":Ljavax/swing/JPanel;
    .local v19, "finalP1":Ljavax/swing/JPanel;
    move-object v10, v2

    move-object/from16 v24, v2

    move-object v2, v11

    .end local v11    # "t1":Ljavax/swing/JToolBar;
    .local v2, "t1":Ljavax/swing/JToolBar;
    .local v24, "finalThis":Ljavax/swing/JPanel;
    move-object/from16 v25, v12

    .end local v12    # "left":Ljavax/swing/JPanel;
    .local v25, "left":Ljavax/swing/JPanel;
    move-object v12, v6

    move-object/from16 v26, v3

    move-object v3, v13

    move/from16 v27, v17

    move-object/from16 v17, v5

    move/from16 v5, v27

    .end local v5    # "p2":Ljavax/swing/JPanel;
    .end local v13    # "t2":Ljavax/swing/JToolBar;
    .local v3, "t2":Ljavax/swing/JToolBar;
    .local v17, "p2":Ljavax/swing/JPanel;
    .local v26, "finalT1":Ljavax/swing/JToolBar;
    move-object v13, v7

    move-object/from16 v14, v20

    invoke-direct/range {v8 .. v14}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;-><init>(Lcom/trendmicro/hippo/tools/debugger/ContextWindow;Ljavax/swing/JPanel;Ljavax/swing/JToolBar;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Ljavax/swing/JSplitPane;)V

    invoke-virtual {v4, v1}, Ljavax/swing/JPanel;->addContainerListener(Ljava/awt/event/ContainerListener;)V

    .line 3252
    invoke-virtual {v2, v0}, Ljavax/swing/JToolBar;->addComponentListener(Ljava/awt/event/ComponentListener;)V

    .line 3253
    invoke-virtual {v3, v0}, Ljavax/swing/JToolBar;->addComponentListener(Ljava/awt/event/ComponentListener;)V

    .line 3254
    invoke-virtual {v15, v5}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->setEnabled(Z)V

    .line 3255
    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 9
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .line 3290
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->enabled:Z

    if-nez v0, :cond_0

    return-void

    .line 3291
    :cond_0
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ContextSwitch"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 3292
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->currentContextData()Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;

    move-result-object v0

    .line 3293
    .local v0, "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    if-nez v0, :cond_1

    return-void

    .line 3294
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v1}, Ljavax/swing/JComboBox;->getSelectedIndex()I

    move-result v1

    .line 3295
    .local v1, "frameIndex":I
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->toolTips:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljavax/swing/JComboBox;->setToolTipText(Ljava/lang/String;)V

    .line 3296
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->frameCount()I

    move-result v2

    .line 3297
    .local v2, "frameCount":I
    if-lt v1, v2, :cond_2

    .line 3298
    return-void

    .line 3300
    :cond_2
    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;->getFrame(I)Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    move-result-object v3

    .line 3301
    .local v3, "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->scope()Ljava/lang/Object;

    move-result-object v4

    .line 3302
    .local v4, "scope":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;->thisObj()Ljava/lang/Object;

    move-result-object v5

    .line 3303
    .local v5, "thisObj":Ljava/lang/Object;
    iget-object v6, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->thisTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    new-instance v7, Lcom/trendmicro/hippo/tools/debugger/VariableModel;

    iget-object v8, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v8, v8, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-direct {v7, v8, v5}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;Ljava/lang/Object;)V

    invoke-virtual {v6, v7}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->resetTree(Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;)Ljavax/swing/JTree;

    .line 3305
    if-eq v4, v5, :cond_3

    .line 3306
    new-instance v6, Lcom/trendmicro/hippo/tools/debugger/VariableModel;

    iget-object v7, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v7, v7, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-direct {v6, v7, v4}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;-><init>(Lcom/trendmicro/hippo/tools/debugger/Dim;Ljava/lang/Object;)V

    .local v6, "scopeModel":Lcom/trendmicro/hippo/tools/debugger/VariableModel;
    goto :goto_0

    .line 3308
    .end local v6    # "scopeModel":Lcom/trendmicro/hippo/tools/debugger/VariableModel;
    :cond_3
    new-instance v6, Lcom/trendmicro/hippo/tools/debugger/VariableModel;

    invoke-direct {v6}, Lcom/trendmicro/hippo/tools/debugger/VariableModel;-><init>()V

    .line 3310
    .restart local v6    # "scopeModel":Lcom/trendmicro/hippo/tools/debugger/VariableModel;
    :goto_0
    iget-object v7, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->localsTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    invoke-virtual {v7, v6}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->resetTree(Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;)Ljavax/swing/JTree;

    .line 3311
    iget-object v7, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v7, v7, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v7, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->contextSwitch(I)V

    .line 3312
    iget-object v7, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-virtual {v7, v3}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->showStopLine(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;)V

    .line 3313
    iget-object v7, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->tableModel:Lcom/trendmicro/hippo/tools/debugger/MyTableModel;

    invoke-virtual {v7}, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->updateModel()V

    .line 3315
    .end local v0    # "contextData":Lcom/trendmicro/hippo/tools/debugger/Dim$ContextData;
    .end local v1    # "frameIndex":I
    .end local v2    # "frameCount":I
    .end local v3    # "frame":Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;
    .end local v4    # "scope":Ljava/lang/Object;
    .end local v5    # "thisObj":Ljava/lang/Object;
    .end local v6    # "scopeModel":Lcom/trendmicro/hippo/tools/debugger/VariableModel;
    :cond_4
    return-void
.end method

.method public disableUpdate()V
    .locals 1

    .line 3273
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->enabled:Z

    .line 3274
    return-void
.end method

.method public enableUpdate()V
    .locals 1

    .line 3280
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->enabled:Z

    .line 3281
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 3262
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v0, p1}, Ljavax/swing/JComboBox;->setEnabled(Z)V

    .line 3263
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->thisTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setEnabled(Z)V

    .line 3264
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->localsTable:Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setEnabled(Z)V

    .line 3265
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->evaluator:Lcom/trendmicro/hippo/tools/debugger/Evaluator;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/Evaluator;->setEnabled(Z)V

    .line 3266
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->cmdLine:Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/EvalTextArea;->setEnabled(Z)V

    .line 3267
    return-void
.end method
