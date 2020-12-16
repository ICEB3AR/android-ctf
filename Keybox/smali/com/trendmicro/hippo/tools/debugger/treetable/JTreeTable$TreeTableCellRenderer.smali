.class public Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;
.super Ljavax/swing/JTree;
.source "JTreeTable.java"

# interfaces
.implements Ljavax/swing/table/TableCellRenderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TreeTableCellRenderer"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2b0c1cf49a0da0dL


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

.field protected visibleRow:I


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;Ljavax/swing/tree/TreeModel;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;
    .param p2, "model"    # Ljavax/swing/tree/TreeModel;

    .line 163
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    .line 164
    invoke-direct {p0, p2}, Ljavax/swing/JTree;-><init>(Ljavax/swing/tree/TreeModel;)V

    .line 165
    return-void
.end method


# virtual methods
.method public getTableCellRendererComponent(Ljavax/swing/JTable;Ljava/lang/Object;ZZII)Ljava/awt/Component;
    .locals 1
    .param p1, "table"    # Ljavax/swing/JTable;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "isSelected"    # Z
    .param p4, "hasFocus"    # Z
    .param p5, "row"    # I
    .param p6, "column"    # I

    .line 230
    if-eqz p3, :cond_0

    .line 231
    invoke-virtual {p1}, Ljavax/swing/JTable;->getSelectionBackground()Ljava/awt/Color;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setBackground(Ljava/awt/Color;)V

    goto :goto_0

    .line 233
    :cond_0
    invoke-virtual {p1}, Ljavax/swing/JTable;->getBackground()Ljava/awt/Color;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setBackground(Ljava/awt/Color;)V

    .line 235
    :goto_0
    iput p5, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->visibleRow:I

    .line 236
    return-object p0
.end method

.method public paint(Ljava/awt/Graphics;)V
    .locals 2
    .param p1, "g"    # Ljava/awt/Graphics;

    .line 218
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->visibleRow:I

    neg-int v0, v0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getRowHeight()I

    move-result v1

    mul-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/awt/Graphics;->translate(II)V

    .line 219
    invoke-super {p0, p1}, Ljavax/swing/JTree;->paint(Ljava/awt/Graphics;)V

    .line 220
    return-void
.end method

.method public setBounds(IIII)V
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .line 209
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->getHeight()I

    move-result v0

    const/4 v1, 0x0

    invoke-super {p0, p1, v1, p3, v0}, Ljavax/swing/JTree;->setBounds(IIII)V

    .line 210
    return-void
.end method

.method public setRowHeight(I)V
    .locals 2
    .param p1, "rowHeight"    # I

    .line 196
    if-lez p1, :cond_0

    .line 197
    invoke-super {p0, p1}, Ljavax/swing/JTree;->setRowHeight(I)V

    .line 198
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->getRowHeight()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 199
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getRowHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->setRowHeight(I)V

    .line 202
    :cond_0
    return-void
.end method

.method public updateUI()V
    .locals 3

    .line 173
    invoke-super {p0}, Ljavax/swing/JTree;->updateUI()V

    .line 176
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getCellRenderer()Ljavax/swing/tree/TreeCellRenderer;

    move-result-object v0

    .line 177
    .local v0, "tcr":Ljavax/swing/tree/TreeCellRenderer;
    instance-of v1, v0, Ljavax/swing/tree/DefaultTreeCellRenderer;

    if-eqz v1, :cond_0

    .line 178
    move-object v1, v0

    check-cast v1, Ljavax/swing/tree/DefaultTreeCellRenderer;

    .line 183
    .local v1, "dtcr":Ljavax/swing/tree/DefaultTreeCellRenderer;
    nop

    .line 184
    const-string v2, "Table.selectionForeground"

    invoke-static {v2}, Ljavax/swing/UIManager;->getColor(Ljava/lang/Object;)Ljava/awt/Color;

    move-result-object v2

    .line 183
    invoke-virtual {v1, v2}, Ljavax/swing/tree/DefaultTreeCellRenderer;->setTextSelectionColor(Ljava/awt/Color;)V

    .line 185
    nop

    .line 186
    const-string v2, "Table.selectionBackground"

    invoke-static {v2}, Ljavax/swing/UIManager;->getColor(Ljava/lang/Object;)Ljava/awt/Color;

    move-result-object v2

    .line 185
    invoke-virtual {v1, v2}, Ljavax/swing/tree/DefaultTreeCellRenderer;->setBackgroundSelectionColor(Ljava/awt/Color;)V

    .line 188
    .end local v1    # "dtcr":Ljavax/swing/tree/DefaultTreeCellRenderer;
    :cond_0
    return-void
.end method
