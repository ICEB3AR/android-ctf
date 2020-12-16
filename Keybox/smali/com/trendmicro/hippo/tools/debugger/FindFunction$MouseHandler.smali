.class Lcom/trendmicro/hippo/tools/debugger/FindFunction$MouseHandler;
.super Ljava/awt/event/MouseAdapter;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/FindFunction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MouseHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/FindFunction;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/FindFunction;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/FindFunction;

    .line 1996
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction$MouseHandler;->this$0:Lcom/trendmicro/hippo/tools/debugger/FindFunction;

    invoke-direct {p0}, Ljava/awt/event/MouseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public mouseClicked(Ljava/awt/event/MouseEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 1999
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getClickCount()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 2000
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction$MouseHandler;->this$0:Lcom/trendmicro/hippo/tools/debugger/FindFunction;

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->access$100(Lcom/trendmicro/hippo/tools/debugger/FindFunction;)Ljavax/swing/JButton;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/swing/JButton;->doClick()V

    .line 2002
    :cond_0
    return-void
.end method
