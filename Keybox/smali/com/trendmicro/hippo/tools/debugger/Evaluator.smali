.class Lcom/trendmicro/hippo/tools/debugger/Evaluator;
.super Ljavax/swing/JTable;
.source "SwingGui.java"


# static fields
.field private static final serialVersionUID:J = 0x70e09bfbd75092d0L


# instance fields
.field tableModel:Lcom/trendmicro/hippo/tools/debugger/MyTableModel;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
    .locals 1
    .param p1, "debugGui"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 2552
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;

    invoke-direct {v0, p1}, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V

    invoke-direct {p0, v0}, Ljavax/swing/JTable;-><init>(Ljavax/swing/table/TableModel;)V

    .line 2553
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/Evaluator;->getModel()Ljavax/swing/table/TableModel;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/Evaluator;->tableModel:Lcom/trendmicro/hippo/tools/debugger/MyTableModel;

    .line 2554
    return-void
.end method
