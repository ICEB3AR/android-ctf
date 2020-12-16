.class Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler;
.super Ljava/lang/Object;
.source "JTreeTable.java"

# interfaces
.implements Ljavax/swing/event/ListSelectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ListSelectionHandler"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;)V
    .locals 0
    .param p1, "this$1"    # Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;

    .line 391
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler;->this$1:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public valueChanged(Ljavax/swing/event/ListSelectionEvent;)V
    .locals 1
    .param p1, "e"    # Ljavax/swing/event/ListSelectionEvent;

    .line 393
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler;->this$1:Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updateSelectedPathsFromSelectedRows()V

    .line 394
    return-void
.end method
