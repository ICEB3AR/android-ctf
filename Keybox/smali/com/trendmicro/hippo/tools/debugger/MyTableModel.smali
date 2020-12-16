.class Lcom/trendmicro/hippo/tools/debugger/MyTableModel;
.super Ljavax/swing/table/AbstractTableModel;
.source "SwingGui.java"


# static fields
.field private static final serialVersionUID:J = 0x293d4fa6dbf12da8L


# instance fields
.field private debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

.field private expressions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private values:Ljava/util/List;
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
    .locals 2
    .param p1, "debugGui"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 2425
    invoke-direct {p0}, Ljavax/swing/table/AbstractTableModel;-><init>()V

    .line 2426
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 2427
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->expressions:Ljava/util/List;

    .line 2428
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->values:Ljava/util/List;

    .line 2429
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->expressions:Ljava/util/List;

    const-string v1, ""

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2430
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->values:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2431
    return-void
.end method


# virtual methods
.method public getColumnCount()I
    .locals 1

    .line 2438
    const/4 v0, 0x2

    return v0
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 1
    .param p1, "column"    # I

    .line 2454
    if-eqz p1, :cond_1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    .line 2460
    const/4 v0, 0x0

    return-object v0

    .line 2458
    :cond_0
    const-string v0, "Value"

    return-object v0

    .line 2456
    :cond_1
    const-string v0, "Expression"

    return-object v0
.end method

.method public getRowCount()I
    .locals 1

    .line 2446
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->expressions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getValueAt(II)Ljava/lang/Object;
    .locals 1
    .param p1, "row"    # I
    .param p2, "column"    # I

    .line 2476
    if-eqz p2, :cond_1

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    .line 2482
    const-string v0, ""

    return-object v0

    .line 2480
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->values:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 2478
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->expressions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isCellEditable(II)Z
    .locals 1
    .param p1, "row"    # I
    .param p2, "column"    # I

    .line 2468
    const/4 v0, 0x1

    return v0
.end method

.method public setValueAt(Ljava/lang/Object;II)V
    .locals 4
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "row"    # I
    .param p3, "column"    # I

    .line 2490
    if-eqz p3, :cond_1

    const/4 v0, 0x1

    if-eq p3, v0, :cond_0

    goto :goto_0

    .line 2509
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->fireTableDataChanged()V

    goto :goto_0

    .line 2492
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2493
    .local v0, "expr":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->expressions:Ljava/util/List;

    invoke-interface {v1, p2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2494
    const-string v1, ""

    .line 2495
    .local v1, "result":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_2

    .line 2496
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v2, v2, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v2, v0}, Lcom/trendmicro/hippo/tools/debugger/Dim;->eval(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2497
    if-nez v1, :cond_2

    const-string v1, ""

    .line 2499
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->values:Ljava/util/List;

    invoke-interface {v2, p2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2500
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->updateModel()V

    .line 2501
    add-int/lit8 v2, p2, 0x1

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->expressions:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 2502
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->expressions:Ljava/util/List;

    const-string v3, ""

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2503
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->values:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2504
    add-int/lit8 v2, p2, 0x1

    add-int/lit8 v3, p2, 0x1

    invoke-virtual {p0, v2, v3}, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->fireTableRowsInserted(II)V

    .line 2511
    .end local v0    # "expr":Ljava/lang/String;
    .end local v1    # "result":Ljava/lang/String;
    :cond_3
    :goto_0
    return-void
.end method

.method updateModel()V
    .locals 5

    .line 2517
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->expressions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 2518
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->expressions:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 2519
    .local v1, "expr":Ljava/lang/String;
    const-string v2, ""

    .line 2520
    .local v2, "result":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 2521
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v3, v3, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    invoke-virtual {v3, v1}, Lcom/trendmicro/hippo/tools/debugger/Dim;->eval(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2522
    if-nez v2, :cond_1

    const-string v2, ""

    goto :goto_1

    .line 2524
    :cond_0
    const-string v2, ""

    .line 2526
    :cond_1
    :goto_1
    const/16 v3, 0xa

    const/16 v4, 0x20

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 2527
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->values:Ljava/util/List;

    invoke-interface {v3, v0, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2517
    .end local v1    # "expr":Ljava/lang/String;
    .end local v2    # "result":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2529
    .end local v0    # "i":I
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/MyTableModel;->fireTableDataChanged()V

    .line 2530
    return-void
.end method
