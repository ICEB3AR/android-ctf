.class Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1$1;
.super Ljava/awt/event/WindowAdapter;
.source "SwingGui.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->check(Ljava/awt/Component;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;

.field final synthetic val$l:[Ljava/awt/event/WindowListener;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;[Ljava/awt/event/WindowListener;)V
    .locals 0
    .param p1, "this$1"    # Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;

    .line 3146
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1$1;->this$1:Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;

    iput-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1$1;->val$l:[Ljava/awt/event/WindowListener;

    invoke-direct {p0}, Ljava/awt/event/WindowAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public windowClosing(Ljava/awt/event/WindowEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/WindowEvent;

    .line 3149
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1$1;->this$1:Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow;->context:Ljavax/swing/JComboBox;

    invoke-virtual {v0}, Ljavax/swing/JComboBox;->hidePopup()V

    .line 3150
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1$1;->val$l:[Ljava/awt/event/WindowListener;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0, p1}, Ljava/awt/event/WindowListener;->windowClosing(Ljava/awt/event/WindowEvent;)V

    .line 3151
    return-void
.end method
