.class public Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;
.super Ljavax/swing/tree/DefaultTreeSelectionModel;
.source "JTreeTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ListToTreeSelectionModelWrapper"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x715b10ced10c319bL


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

.field protected updatingListSelectionModel:Z


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;)V
    .locals 2
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    .line 308
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    .line 309
    invoke-direct {p0}, Ljavax/swing/tree/DefaultTreeSelectionModel;-><init>()V

    .line 310
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->getListSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object v0

    .line 311
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->createListSelectionListener()Ljavax/swing/event/ListSelectionListener;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/swing/ListSelectionModel;->addListSelectionListener(Ljavax/swing/event/ListSelectionListener;)V

    .line 312
    return-void
.end method


# virtual methods
.method protected createListSelectionListener()Ljavax/swing/event/ListSelectionListener;
    .locals 1

    .line 350
    new-instance v0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;)V

    return-object v0
.end method

.method public getListSelectionModel()Ljavax/swing/ListSelectionModel;
    .locals 1

    .line 320
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->listSelectionModel:Ljavax/swing/DefaultListSelectionModel;

    return-object v0
.end method

.method public resetRowSelection()V
    .locals 2

    .line 330
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    if-nez v0, :cond_0

    .line 331
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 333
    const/4 v0, 0x0

    :try_start_0
    invoke-super {p0}, Ljavax/swing/tree/DefaultTreeSelectionModel;->resetRowSelection()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 336
    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 337
    goto :goto_0

    .line 336
    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 337
    throw v1

    .line 344
    :cond_0
    :goto_0
    return-void
.end method

.method protected updateSelectedPathsFromSelectedRows()V
    .locals 5

    .line 359
    iget-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    if-nez v0, :cond_2

    .line 360
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 364
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->listSelectionModel:Ljavax/swing/DefaultListSelectionModel;

    invoke-virtual {v1}, Ljavax/swing/DefaultListSelectionModel;->getMinSelectionIndex()I

    move-result v1

    .line 365
    .local v1, "min":I
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->listSelectionModel:Ljavax/swing/DefaultListSelectionModel;

    invoke-virtual {v2}, Ljavax/swing/DefaultListSelectionModel;->getMaxSelectionIndex()I

    move-result v2

    .line 367
    .local v2, "max":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->clearSelection()V

    .line 368
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    if-eq v2, v3, :cond_1

    .line 369
    move v3, v1

    .local v3, "counter":I
    :goto_0
    if-gt v3, v2, :cond_1

    .line 370
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->listSelectionModel:Ljavax/swing/DefaultListSelectionModel;

    invoke-virtual {v4, v3}, Ljavax/swing/DefaultListSelectionModel;->isSelectedIndex(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 371
    iget-object v4, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;

    iget-object v4, v4, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable;->tree:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    .line 372
    invoke-virtual {v4, v3}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getPathForRow(I)Ljavax/swing/tree/TreePath;

    move-result-object v4

    .line 374
    .local v4, "selPath":Ljavax/swing/tree/TreePath;
    if-eqz v4, :cond_0

    .line 375
    invoke-virtual {p0, v4}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->addSelectionPath(Ljavax/swing/tree/TreePath;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 369
    .end local v4    # "selPath":Ljavax/swing/tree/TreePath;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 382
    .end local v1    # "min":I
    .end local v2    # "max":I
    .end local v3    # "counter":I
    :cond_1
    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 383
    goto :goto_1

    .line 382
    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 383
    throw v1

    .line 385
    :cond_2
    :goto_1
    return-void
.end method
