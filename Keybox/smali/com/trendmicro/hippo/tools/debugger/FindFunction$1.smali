.class Lcom/trendmicro/hippo/tools/debugger/FindFunction$1;
.super Ljava/awt/event/KeyAdapter;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/FindFunction;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/FindFunction;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/FindFunction;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/FindFunction;

    .line 1939
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/FindFunction;

    invoke-direct {p0}, Ljava/awt/event/KeyAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public keyPressed(Ljava/awt/event/KeyEvent;)V
    .locals 3
    .param p1, "ke"    # Ljava/awt/event/KeyEvent;

    .line 1942
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->getKeyCode()I

    move-result v0

    .line 1943
    .local v0, "code":I
    const/16 v1, 0x1b

    if-ne v0, v1, :cond_0

    .line 1944
    invoke-virtual {p1}, Ljava/awt/event/KeyEvent;->consume()V

    .line 1945
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/FindFunction;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->access$002(Lcom/trendmicro/hippo/tools/debugger/FindFunction;Ljava/lang/String;)Ljava/lang/String;

    .line 1946
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/FindFunction$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/FindFunction;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/FindFunction;->setVisible(Z)V

    .line 1948
    :cond_0
    return-void
.end method
