.class Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;
.super Ljava/lang/Object;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ContainerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/ContextWindow;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

.field final synthetic val$finalP2:Ljavax/swing/JPanel;

.field final synthetic val$finalSplit:Ljavax/swing/JSplitPane;

.field final synthetic val$finalT1:Ljavax/swing/JToolBar;

.field final synthetic val$finalT2:Ljavax/swing/JToolBar;

.field final synthetic val$finalThis:Ljavax/swing/JPanel;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/ContextWindow;Ljavax/swing/JPanel;Ljavax/swing/JToolBar;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Ljavax/swing/JSplitPane;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/ContextWindow;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3219
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->this$0:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    iput-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalThis:Ljavax/swing/JPanel;

    iput-object p3, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalT1:Ljavax/swing/JToolBar;

    iput-object p4, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalT2:Ljavax/swing/JToolBar;

    iput-object p5, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalP2:Ljavax/swing/JPanel;

    iput-object p6, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalSplit:Ljavax/swing/JSplitPane;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public componentAdded(Ljava/awt/event/ContainerEvent;)V
    .locals 5
    .param p1, "e"    # Ljava/awt/event/ContainerEvent;

    .line 3222
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalThis:Ljavax/swing/JPanel;

    invoke-virtual {v0}, Ljavax/swing/JPanel;->getParent()Ljava/awt/Container;

    move-result-object v0

    .line 3223
    .local v0, "thisParent":Ljava/awt/Component;
    move-object v1, v0

    check-cast v1, Ljavax/swing/JSplitPane;

    .line 3224
    .local v1, "split":Ljavax/swing/JSplitPane;
    invoke-virtual {p1}, Ljava/awt/event/ContainerEvent;->getChild()Ljava/awt/Component;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalT1:Ljavax/swing/JToolBar;

    if-ne v2, v3, :cond_1

    .line 3225
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalT2:Ljavax/swing/JToolBar;

    invoke-virtual {v2}, Ljavax/swing/JToolBar;->getParent()Ljava/awt/Container;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalP2:Ljavax/swing/JPanel;

    if-ne v2, v3, :cond_0

    .line 3227
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalSplit:Ljavax/swing/JSplitPane;

    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    invoke-virtual {v2, v3, v4}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    goto :goto_0

    .line 3230
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalSplit:Ljavax/swing/JSplitPane;

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v2, v3, v4}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 3232
    :goto_0
    const-wide v2, 0x3fe51eb851eb851fL    # 0.66

    invoke-virtual {v1, v2, v3}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 3234
    :cond_1
    return-void
.end method

.method public componentRemoved(Ljava/awt/event/ContainerEvent;)V
    .locals 5
    .param p1, "e"    # Ljava/awt/event/ContainerEvent;

    .line 3238
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalThis:Ljavax/swing/JPanel;

    invoke-virtual {v0}, Ljavax/swing/JPanel;->getParent()Ljava/awt/Container;

    move-result-object v0

    .line 3239
    .local v0, "thisParent":Ljava/awt/Component;
    move-object v1, v0

    check-cast v1, Ljavax/swing/JSplitPane;

    .line 3240
    .local v1, "split":Ljavax/swing/JSplitPane;
    invoke-virtual {p1}, Ljava/awt/event/ContainerEvent;->getChild()Ljava/awt/Component;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalT1:Ljavax/swing/JToolBar;

    if-ne v2, v3, :cond_1

    .line 3241
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalT2:Ljavax/swing/JToolBar;

    invoke-virtual {v2}, Ljavax/swing/JToolBar;->getParent()Ljava/awt/Container;

    move-result-object v2

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalP2:Ljavax/swing/JPanel;

    if-ne v2, v3, :cond_0

    .line 3243
    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$2;->val$finalSplit:Ljavax/swing/JSplitPane;

    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 3244
    const-wide v2, 0x3fe51eb851eb851fL    # 0.66

    invoke-virtual {v1, v2, v3}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    goto :goto_0

    .line 3247
    :cond_0
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v1, v2, v3}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 3250
    :cond_1
    :goto_0
    return-void
.end method
