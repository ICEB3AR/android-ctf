.class Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter$3;
.super Ljava/lang/Object;
.source "TreeTableModelAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;->delayedFireTableDataChanged()V
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

    .line 143
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter$3;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter$3;->this$0:Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/treetable/TreeTableModelAdapter;->fireTableDataChanged()V

    .line 146
    return-void
.end method
