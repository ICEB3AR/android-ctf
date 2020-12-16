.class public Lcom/trendmicro/hippo/tools/debugger/treetable/AbstractCellEditor;
.super Ljava/lang/Object;
.source "AbstractCellEditor.java"

# interfaces
.implements Ljavax/swing/CellEditor;


# instance fields
.field protected listenerList:Ljavax/swing/event/EventListenerList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljavax/swing/event/EventListenerList;

    invoke-direct {v0}, Ljavax/swing/event/EventListenerList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    return-void
.end method


# virtual methods
.method public addCellEditorListener(Ljavax/swing/event/CellEditorListener;)V
    .locals 2
    .param p1, "l"    # Ljavax/swing/event/CellEditorListener;

    .line 52
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    const-class v1, Ljavax/swing/event/CellEditorListener;

    invoke-virtual {v0, v1, p1}, Ljavax/swing/event/EventListenerList;->add(Ljava/lang/Class;Ljava/util/EventListener;)V

    .line 53
    return-void
.end method

.method public cancelCellEditing()V
    .locals 0

    .line 49
    return-void
.end method

.method protected fireEditingCanceled()V
    .locals 4

    .line 83
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    invoke-virtual {v0}, Ljavax/swing/event/EventListenerList;->getListenerList()[Ljava/lang/Object;

    move-result-object v0

    .line 86
    .local v0, "listeners":[Ljava/lang/Object;
    array-length v1, v0

    add-int/lit8 v1, v1, -0x2

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 87
    aget-object v2, v0, v1

    const-class v3, Ljavax/swing/event/CellEditorListener;

    if-ne v2, v3, :cond_0

    .line 88
    add-int/lit8 v2, v1, 0x1

    aget-object v2, v0, v2

    check-cast v2, Ljavax/swing/event/CellEditorListener;

    new-instance v3, Ljavax/swing/event/ChangeEvent;

    invoke-direct {v3, p0}, Ljavax/swing/event/ChangeEvent;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Ljavax/swing/event/CellEditorListener;->editingCanceled(Ljavax/swing/event/ChangeEvent;)V

    .line 86
    :cond_0
    add-int/lit8 v1, v1, -0x2

    goto :goto_0

    .line 91
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method protected fireEditingStopped()V
    .locals 4

    .line 66
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    invoke-virtual {v0}, Ljavax/swing/event/EventListenerList;->getListenerList()[Ljava/lang/Object;

    move-result-object v0

    .line 69
    .local v0, "listeners":[Ljava/lang/Object;
    array-length v1, v0

    add-int/lit8 v1, v1, -0x2

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 70
    aget-object v2, v0, v1

    const-class v3, Ljavax/swing/event/CellEditorListener;

    if-ne v2, v3, :cond_0

    .line 71
    add-int/lit8 v2, v1, 0x1

    aget-object v2, v0, v2

    check-cast v2, Ljavax/swing/event/CellEditorListener;

    new-instance v3, Ljavax/swing/event/ChangeEvent;

    invoke-direct {v3, p0}, Ljavax/swing/event/ChangeEvent;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Ljavax/swing/event/CellEditorListener;->editingStopped(Ljavax/swing/event/ChangeEvent;)V

    .line 69
    :cond_0
    add-int/lit8 v1, v1, -0x2

    goto :goto_0

    .line 74
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method public getCellEditorValue()Ljava/lang/Object;
    .locals 1

    .line 45
    const/4 v0, 0x0

    return-object v0
.end method

.method public isCellEditable(Ljava/util/EventObject;)Z
    .locals 1
    .param p1, "e"    # Ljava/util/EventObject;

    .line 46
    const/4 v0, 0x1

    return v0
.end method

.method public removeCellEditorListener(Ljavax/swing/event/CellEditorListener;)V
    .locals 2
    .param p1, "l"    # Ljavax/swing/event/CellEditorListener;

    .line 56
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/AbstractCellEditor;->listenerList:Ljavax/swing/event/EventListenerList;

    const-class v1, Ljavax/swing/event/CellEditorListener;

    invoke-virtual {v0, v1, p1}, Ljavax/swing/event/EventListenerList;->remove(Ljava/lang/Class;Ljava/util/EventListener;)V

    .line 57
    return-void
.end method

.method public shouldSelectCell(Ljava/util/EventObject;)Z
    .locals 1
    .param p1, "anEvent"    # Ljava/util/EventObject;

    .line 47
    const/4 v0, 0x0

    return v0
.end method

.method public stopCellEditing()Z
    .locals 1

    .line 48
    const/4 v0, 0x1

    return v0
.end method
