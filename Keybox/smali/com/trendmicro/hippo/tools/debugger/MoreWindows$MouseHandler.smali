.class Lcom/trendmicro/hippo/tools/debugger/MoreWindows$MouseHandler;
.super Ljava/awt/event/MouseAdapter;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/tools/debugger/MoreWindows;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MouseHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/MoreWindows;


# direct methods
.method private constructor <init>(Lcom/trendmicro/hippo/tools/debugger/MoreWindows;)V
    .locals 0

    .line 1835
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows$MouseHandler;->this$0:Lcom/trendmicro/hippo/tools/debugger/MoreWindows;

    invoke-direct {p0}, Ljava/awt/event/MouseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/tools/debugger/MoreWindows;Lcom/trendmicro/hippo/tools/debugger/MoreWindows$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/tools/debugger/MoreWindows;
    .param p2, "x1"    # Lcom/trendmicro/hippo/tools/debugger/MoreWindows$1;

    .line 1835
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows$MouseHandler;-><init>(Lcom/trendmicro/hippo/tools/debugger/MoreWindows;)V

    return-void
.end method


# virtual methods
.method public mouseClicked(Ljava/awt/event/MouseEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .line 1838
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getClickCount()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 1839
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/MoreWindows$MouseHandler;->this$0:Lcom/trendmicro/hippo/tools/debugger/MoreWindows;

    invoke-static {v0}, Lcom/trendmicro/hippo/tools/debugger/MoreWindows;->access$200(Lcom/trendmicro/hippo/tools/debugger/MoreWindows;)Ljavax/swing/JButton;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/swing/JButton;->doClick()V

    .line 1841
    :cond_0
    return-void
.end method
