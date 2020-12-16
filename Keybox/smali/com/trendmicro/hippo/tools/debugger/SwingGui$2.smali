.class Lcom/trendmicro/hippo/tools/debugger/SwingGui$2;
.super Ljava/awt/event/WindowAdapter;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/SwingGui;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/SwingGui;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 387
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui$2;->this$0:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-direct {p0}, Ljava/awt/event/WindowAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public windowClosing(Ljava/awt/event/WindowEvent;)V
    .locals 1
    .param p1, "e"    # Ljava/awt/event/WindowEvent;

    .line 390
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/SwingGui$2;->this$0:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->access$000(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V

    .line 391
    return-void
.end method
