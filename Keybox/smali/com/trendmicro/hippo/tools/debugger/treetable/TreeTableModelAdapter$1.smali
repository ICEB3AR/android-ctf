.class Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter$1;
.super Ljava/lang/Object;
.source "TreeTableModelAdapter.java"

# interfaces
.implements Ljavax/swing/event/TreeExpansionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;-><init>(Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModel;Ljavax/swing/JTree;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;

    .line 65
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public treeCollapsed(Ljavax/swing/event/TreeExpansionEvent;)V
    .locals 1
    .param p1, "event"    # Ljavax/swing/event/TreeExpansionEvent;

    .line 72
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;->fireTableDataChanged()V

    .line 73
    return-void
.end method

.method public treeExpanded(Ljavax/swing/event/TreeExpansionEvent;)V
    .locals 1
    .param p1, "event"    # Ljavax/swing/event/TreeExpansionEvent;

    .line 69
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;->fireTableDataChanged()V

    .line 70
    return-void
.end method
