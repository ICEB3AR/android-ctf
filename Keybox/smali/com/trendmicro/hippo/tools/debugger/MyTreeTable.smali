.class Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;
.super Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;
.source "SwingGui.java"


# static fields
.field private static final serialVersionUID:J = 0x2ffaacb2ddbaffb9L


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/VariableModel;)V
    .locals 0
    .param p1, "model"    # Lcom/trendmicro/hippo/tools/debugger/VariableModel;

    .line 2863
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;)V

    .line 2864
    return-void
.end method


# virtual methods
.method public isCellEditable(Ljava/util/EventObject;)Z
    .locals 19
    .param p1, "e"    # Ljava/util/EventObject;

    .line 2906
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    instance-of v2, v1, Ljava/awt/event/MouseEvent;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_4

    .line 2907
    move-object v2, v1

    check-cast v2, Ljava/awt/event/MouseEvent;

    .line 2914
    .local v2, "me":Ljava/awt/event/MouseEvent;
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v5

    if-eqz v5, :cond_0

    .line 2915
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v5

    and-int/lit16 v5, v5, 0x410

    if-eqz v5, :cond_2

    .line 2916
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v5

    and-int/lit16 v5, v5, 0x1acf

    if-nez v5, :cond_2

    .line 2928
    :cond_0
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getPoint()Ljava/awt/Point;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->rowAtPoint(Ljava/awt/Point;)I

    move-result v5

    .line 2929
    .local v5, "row":I
    invoke-virtual/range {p0 .. p0}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->getColumnCount()I

    move-result v6

    sub-int/2addr v6, v4

    .local v6, "counter":I
    :goto_0
    if-ltz v6, :cond_2

    .line 2931
    const-class v7, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    invoke-virtual {v0, v6}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->getColumnClass(I)Ljava/lang/Class;

    move-result-object v8

    if-ne v7, v8, :cond_1

    .line 2932
    new-instance v7, Ljava/awt/event/MouseEvent;

    iget-object v10, v0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    .line 2933
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getID()I

    move-result v11

    .line 2934
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getWhen()J

    move-result-wide v12

    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v14

    .line 2935
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v8

    invoke-virtual {v0, v5, v6, v4}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->getCellRect(IIZ)Ljava/awt/Rectangle;

    move-result-object v9

    iget v9, v9, Ljava/awt/Rectangle;->x:I

    sub-int v15, v8, v9

    .line 2936
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v16

    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getClickCount()I

    move-result v17

    .line 2937
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->isPopupTrigger()Z

    move-result v18

    move-object v9, v7

    invoke-direct/range {v9 .. v18}, Ljava/awt/event/MouseEvent;-><init>(Ljava/awt/Component;IJIIIIZ)V

    .line 2938
    .local v7, "newME":Ljava/awt/event/MouseEvent;
    iget-object v8, v0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v8, v7}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->dispatchEvent(Ljava/awt/AWTEvent;)V

    .line 2939
    goto :goto_1

    .line 2930
    .end local v7    # "newME":Ljava/awt/event/MouseEvent;
    :cond_1
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 2943
    .end local v5    # "row":I
    .end local v6    # "counter":I
    :cond_2
    :goto_1
    invoke-virtual {v2}, Ljava/awt/event/MouseEvent;->getClickCount()I

    move-result v5

    const/4 v6, 0x3

    if-lt v5, v6, :cond_3

    .line 2944
    return v4

    .line 2946
    :cond_3
    return v3

    .line 2948
    .end local v2    # "me":Ljava/awt/event/MouseEvent;
    :cond_4
    if-nez v1, :cond_5

    .line 2949
    return v4

    .line 2951
    :cond_5
    return v3
.end method

.method public resetTree(Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;)Ljavax/swing/JTree;
    .locals 4
    .param p1, "treeTableModel"    # Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    .line 2870
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-direct {v0, p0, p1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;Ljavax/swing/tree/TreeModel;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    .line 2873
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-direct {v0, p1, v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;Ljavax/swing/JTree;)V

    invoke-super {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->setModel(Ljavax/swing/table/TableModel;)V

    .line 2876
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;)V

    .line 2878
    .local v0, "selectionWrapper":Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setSelectionModel(Ljavax/swing/tree/TreeSelectionModel;)V

    .line 2879
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->getListSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setSelectionModel(Ljavax/swing/ListSelectionModel;)V

    .line 2882
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getRowHeight()I

    move-result v1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    .line 2884
    const/16 v1, 0x12

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setRowHeight(I)V

    .line 2888
    :cond_0
    const-class v1, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {p0, v1, v3}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setDefaultRenderer(Ljava/lang/Class;Ljavax/swing/table/TableCellRenderer;)V

    .line 2889
    const-class v1, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    new-instance v3, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;

    invoke-direct {v3, p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;)V

    invoke-virtual {p0, v1, v3}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setDefaultEditor(Ljava/lang/Class;Ljavax/swing/table/TableCellEditor;)V

    .line 2890
    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setShowGrid(Z)V

    .line 2891
    new-instance v1, Ljava/awt/Dimension;

    invoke-direct {v1, v2, v2}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->setIntercellSpacing(Ljava/awt/Dimension;)V

    .line 2892
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setRootVisible(Z)V

    .line 2893
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setShowsRootHandles(Z)V

    .line 2894
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getCellRenderer()Ljavax/swing/tree/TreeCellRenderer;

    move-result-object v1

    check-cast v1, Ljavax/swing/tree/DefaultTreeCellRenderer;

    .line 2895
    .local v1, "r":Ljavax/swing/tree/DefaultTreeCellRenderer;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljavax/swing/tree/DefaultTreeCellRenderer;->setOpenIcon(Ljavax/swing/Icon;)V

    .line 2896
    invoke-virtual {v1, v2}, Ljavax/swing/tree/DefaultTreeCellRenderer;->setClosedIcon(Ljavax/swing/Icon;)V

    .line 2897
    invoke-virtual {v1, v2}, Ljavax/swing/tree/DefaultTreeCellRenderer;->setLeafIcon(Ljavax/swing/Icon;)V

    .line 2898
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MyTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    return-object v2
.end method
