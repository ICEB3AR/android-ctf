.class public Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;
.super Lcom/trendmicro/hippo/tools/debugger/treetable/AbstractCellEditor;
.source "JTreeTable.java"

# interfaces
.implements Ljavax/swing/table/TableCellEditor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TreeTableCellEditor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    .line 245
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    invoke-direct {p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/AbstractCellEditor;-><init>()V

    return-void
.end method


# virtual methods
.method public getTableCellEditorComponent(Ljavax/swing/JTable;Ljava/lang/Object;ZII)Ljava/awt/Component;
    .locals 1
    .param p1, "table"    # Ljavax/swing/JTable;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "isSelected"    # Z
    .param p4, "r"    # I
    .param p5, "c"    # I

    .line 251
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    return-object v0
.end method

.method public isCellEditable(Ljava/util/EventObject;)Z
    .locals 17
    .param p1, "e"    # Ljava/util/EventObject;

    .line 274
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    instance-of v2, v1, Ljava/awt/event/MouseEvent;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 275
    iget-object v2, v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->getColumnCount()I

    move-result v2

    const/4 v4, 0x1

    sub-int/2addr v2, v4

    .local v2, "counter":I
    :goto_0
    if-ltz v2, :cond_1

    .line 277
    iget-object v5, v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    invoke-virtual {v5, v2}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->getColumnClass(I)Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;

    if-ne v5, v6, :cond_0

    .line 278
    move-object v5, v1

    check-cast v5, Ljava/awt/event/MouseEvent;

    .line 279
    .local v5, "me":Ljava/awt/event/MouseEvent;
    new-instance v16, Ljava/awt/event/MouseEvent;

    iget-object v6, v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    iget-object v7, v6, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v5}, Ljava/awt/event/MouseEvent;->getID()I

    move-result v8

    .line 280
    invoke-virtual {v5}, Ljava/awt/event/MouseEvent;->getWhen()J

    move-result-wide v9

    invoke-virtual {v5}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v11

    .line 281
    invoke-virtual {v5}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v6

    iget-object v12, v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    invoke-virtual {v12, v3, v2, v4}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->getCellRect(IIZ)Ljava/awt/Rectangle;

    move-result-object v4

    iget v4, v4, Ljava/awt/Rectangle;->x:I

    sub-int v12, v6, v4

    .line 282
    invoke-virtual {v5}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v13

    invoke-virtual {v5}, Ljava/awt/event/MouseEvent;->getClickCount()I

    move-result v14

    .line 283
    invoke-virtual {v5}, Ljava/awt/event/MouseEvent;->isPopupTrigger()Z

    move-result v15

    move-object/from16 v6, v16

    invoke-direct/range {v6 .. v15}, Ljava/awt/event/MouseEvent;-><init>(Ljava/awt/Component;IJIIIIZ)V

    move-object/from16 v4, v16

    .line 284
    .local v4, "newME":Ljava/awt/event/MouseEvent;
    iget-object v6, v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    iget-object v6, v6, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v6, v4}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->dispatchEvent(Ljava/awt/AWTEvent;)V

    .line 285
    goto :goto_1

    .line 276
    .end local v4    # "newME":Ljava/awt/event/MouseEvent;
    .end local v5    # "me":Ljava/awt/event/MouseEvent;
    :cond_0
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 289
    .end local v2    # "counter":I
    :cond_1
    :goto_1
    return v3
.end method
