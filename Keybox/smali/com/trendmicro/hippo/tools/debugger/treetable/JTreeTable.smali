.class public Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;
.super Ljavax/swing/JTable;
.source "JTreeTable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;,
        Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;,
        Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x1d32d04d52dcaadbL


# instance fields
.field protected tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;)V
    .locals 3
    .param p1, "treeTableModel"    # Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    .line 76
    invoke-direct {p0}, Ljavax/swing/JTable;-><init>()V

    .line 79
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-direct {v0, p0, p1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;Ljavax/swing/tree/TreeModel;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    .line 82
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-direct {v0, p1, v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;Ljavax/swing/JTree;)V

    invoke-super {p0, v0}, Ljavax/swing/JTable;->setModel(Ljavax/swing/table/TableModel;)V

    .line 85
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;)V

    .line 87
    .local v0, "selectionWrapper":Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setSelectionModel(Ljavax/swing/tree/TreeSelectionModel;)V

    .line 88
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->getListSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->setSelectionModel(Ljavax/swing/ListSelectionModel;)V

    .line 91
    const-class v1, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->setDefaultRenderer(Ljava/lang/Class;Ljavax/swing/table/TableCellRenderer;)V

    .line 92
    const-class v1, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    new-instance v2, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;

    invoke-direct {v2, p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;)V

    invoke-virtual {p0, v1, v2}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->setDefaultEditor(Ljava/lang/Class;Ljavax/swing/table/TableCellEditor;)V

    .line 95
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->setShowGrid(Z)V

    .line 98
    new-instance v2, Ljava/awt/Dimension;

    invoke-direct {v2, v1, v1}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->setIntercellSpacing(Ljava/awt/Dimension;)V

    .line 102
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getRowHeight()I

    move-result v1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    .line 104
    const/16 v1, 0x12

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->setRowHeight(I)V

    .line 106
    :cond_0
    return-void
.end method


# virtual methods
.method public getEditingRow()I
    .locals 2

    .line 133
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->editingColumn:I

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->getColumnClass(I)Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    if-ne v0, v1, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    .line 134
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->editingRow:I

    .line 133
    :goto_0
    return v0
.end method

.method public getTree()Ljavax/swing/JTree;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    return-object v0
.end method

.method public setRowHeight(I)V
    .locals 2
    .param p1, "rowHeight"    # I

    .line 142
    invoke-super {p0, p1}, Ljavax/swing/JTable;->setRowHeight(I)V

    .line 143
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getRowHeight()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 144
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->getRowHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setRowHeight(I)V

    .line 146
    :cond_0
    return-void
.end method

.method public updateUI()V
    .locals 3

    .line 115
    invoke-super {p0}, Ljavax/swing/JTable;->updateUI()V

    .line 116
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    if-eqz v0, :cond_0

    .line 117
    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->updateUI()V

    .line 121
    :cond_0
    const-string v0, "Tree.background"

    const-string v1, "Tree.foreground"

    const-string v2, "Tree.font"

    invoke-static {p0, v0, v1, v2}, Ljavax/swing/LookAndFeel;->installColorsAndFont(Ljavax/swing/JComponent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    return-void
.end method
