.class Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;
.super Ljava/lang/Object;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ComponentListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/tools/debugger/ContextWindow;-><init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field t2Docked:Z

.field final synthetic this$0:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

.field final synthetic val$debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

.field final synthetic val$finalP1:Ljavax/swing/JPanel;

.field final synthetic val$finalP2:Ljavax/swing/JPanel;

.field final synthetic val$finalSplit:Ljavax/swing/JSplitPane;

.field final synthetic val$finalT1:Ljavax/swing/JToolBar;

.field final synthetic val$finalT2:Ljavax/swing/JToolBar;

.field final synthetic val$finalThis:Ljavax/swing/JPanel;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/tools/debugger/ContextWindow;Ljavax/swing/JPanel;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Lcom/trendmicro/hippo/tools/debugger/SwingGui;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Ljavax/swing/JSplitPane;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/tools/debugger/ContextWindow;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3108
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->this$0:Lcom/trendmicro/hippo/tools/debugger/ContextWindow;

    iput-object p2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalThis:Ljavax/swing/JPanel;

    iput-object p3, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalT1:Ljavax/swing/JToolBar;

    iput-object p4, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalP1:Ljavax/swing/JPanel;

    iput-object p5, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iput-object p6, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalT2:Ljavax/swing/JToolBar;

    iput-object p7, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalP2:Ljavax/swing/JPanel;

    iput-object p8, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalSplit:Ljavax/swing/JSplitPane;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3109
    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->t2Docked:Z

    return-void
.end method


# virtual methods
.method check(Ljava/awt/Component;)V
    .locals 11
    .param p1, "comp"    # Ljava/awt/Component;

    .line 3111
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalThis:Ljavax/swing/JPanel;

    invoke-virtual {v0}, Ljavax/swing/JPanel;->getParent()Ljava/awt/Container;

    move-result-object v0

    .line 3112
    .local v0, "thisParent":Ljava/awt/Component;
    if-nez v0, :cond_0

    .line 3113
    return-void

    .line 3115
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalT1:Ljavax/swing/JToolBar;

    invoke-virtual {v1}, Ljavax/swing/JToolBar;->getParent()Ljava/awt/Container;

    move-result-object v1

    .line 3116
    .local v1, "parent":Ljava/awt/Component;
    const/4 v2, 0x1

    .line 3117
    .local v2, "leftDocked":Z
    const/4 v3, 0x1

    .line 3118
    .local v3, "rightDocked":Z
    const/4 v4, 0x0

    .line 3119
    .local v4, "adjustVerticalSplit":Z
    const/4 v5, 0x1

    if-eqz v1, :cond_4

    .line 3120
    iget-object v6, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalP1:Ljavax/swing/JPanel;

    if-eq v1, v6, :cond_3

    .line 3121
    :goto_0
    instance-of v6, v1, Ljavax/swing/JFrame;

    if-nez v6, :cond_1

    .line 3122
    invoke-virtual {v1}, Ljava/awt/Component;->getParent()Ljava/awt/Container;

    move-result-object v1

    goto :goto_0

    .line 3124
    :cond_1
    move-object v6, v1

    check-cast v6, Ljavax/swing/JFrame;

    .line 3125
    .local v6, "frame":Ljavax/swing/JFrame;
    iget-object v7, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    const-string v8, "Variables"

    invoke-virtual {v7, v8, v6}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->addTopLevel(Ljava/lang/String;Ljavax/swing/JFrame;)V

    .line 3140
    invoke-virtual {v6}, Ljavax/swing/JFrame;->isResizable()Z

    move-result v7

    if-nez v7, :cond_2

    .line 3141
    invoke-virtual {v6, v5}, Ljavax/swing/JFrame;->setResizable(Z)V

    .line 3142
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljavax/swing/JFrame;->setDefaultCloseOperation(I)V

    .line 3143
    const-class v8, Ljava/awt/event/WindowListener;

    .line 3144
    invoke-virtual {v6, v8}, Ljavax/swing/JFrame;->getListeners(Ljava/lang/Class;)[Ljava/util/EventListener;

    move-result-object v8

    check-cast v8, [Ljava/awt/event/WindowListener;

    .line 3145
    .local v8, "l":[Ljava/awt/event/WindowListener;
    aget-object v7, v8, v7

    invoke-virtual {v6, v7}, Ljavax/swing/JFrame;->removeWindowListener(Ljava/awt/event/WindowListener;)V

    .line 3146
    new-instance v7, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1$1;

    invoke-direct {v7, p0, v8}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1$1;-><init>(Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;[Ljava/awt/event/WindowListener;)V

    invoke-virtual {v6, v7}, Ljavax/swing/JFrame;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 3155
    .end local v8    # "l":[Ljava/awt/event/WindowListener;
    :cond_2
    const/4 v2, 0x0

    .line 3156
    .end local v6    # "frame":Ljavax/swing/JFrame;
    goto :goto_1

    .line 3157
    :cond_3
    const/4 v2, 0x1

    .line 3160
    :cond_4
    :goto_1
    iget-object v6, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalT2:Ljavax/swing/JToolBar;

    invoke-virtual {v6}, Ljavax/swing/JToolBar;->getParent()Ljava/awt/Container;

    move-result-object v1

    .line 3161
    if-eqz v1, :cond_7

    .line 3162
    iget-object v6, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalP2:Ljavax/swing/JPanel;

    if-eq v1, v6, :cond_6

    .line 3163
    :goto_2
    instance-of v6, v1, Ljavax/swing/JFrame;

    if-nez v6, :cond_5

    .line 3164
    invoke-virtual {v1}, Ljava/awt/Component;->getParent()Ljava/awt/Container;

    move-result-object v1

    goto :goto_2

    .line 3166
    :cond_5
    move-object v6, v1

    check-cast v6, Ljavax/swing/JFrame;

    .line 3167
    .restart local v6    # "frame":Ljavax/swing/JFrame;
    iget-object v7, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    const-string v8, "Evaluate"

    invoke-virtual {v7, v8, v6}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->addTopLevel(Ljava/lang/String;Ljavax/swing/JFrame;)V

    .line 3168
    invoke-virtual {v6, v5}, Ljavax/swing/JFrame;->setResizable(Z)V

    .line 3169
    const/4 v3, 0x0

    .line 3170
    .end local v6    # "frame":Ljavax/swing/JFrame;
    goto :goto_3

    .line 3171
    :cond_6
    const/4 v3, 0x1

    .line 3174
    :cond_7
    :goto_3
    if-eqz v2, :cond_8

    iget-boolean v5, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->t2Docked:Z

    if-eqz v5, :cond_8

    if-eqz v3, :cond_8

    if-eqz v5, :cond_8

    .line 3176
    return-void

    .line 3178
    :cond_8
    iput-boolean v3, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->t2Docked:Z

    .line 3179
    move-object v5, v0

    check-cast v5, Ljavax/swing/JSplitPane;

    .line 3180
    .local v5, "split":Ljavax/swing/JSplitPane;
    const-wide v6, 0x3fe51eb851eb851fL    # 0.66

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    if-eqz v2, :cond_a

    .line 3181
    if-eqz v3, :cond_9

    .line 3182
    iget-object v8, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalSplit:Ljavax/swing/JSplitPane;

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    invoke-virtual {v8, v9, v10}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    goto :goto_4

    .line 3184
    :cond_9
    iget-object v10, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalSplit:Ljavax/swing/JSplitPane;

    invoke-virtual {v10, v8, v9}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 3186
    :goto_4
    if-eqz v4, :cond_c

    .line 3187
    invoke-virtual {v5, v6, v7}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    goto :goto_5

    .line 3190
    :cond_a
    if-eqz v3, :cond_b

    .line 3191
    iget-object v8, p0, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->val$finalSplit:Ljavax/swing/JSplitPane;

    const-wide/16 v9, 0x0

    invoke-virtual {v8, v9, v10}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 3192
    invoke-virtual {v5, v6, v7}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    goto :goto_5

    .line 3195
    :cond_b
    invoke-virtual {v5, v8, v9}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 3197
    :cond_c
    :goto_5
    return-void
.end method

.method public componentHidden(Ljava/awt/event/ComponentEvent;)V
    .locals 1
    .param p1, "e"    # Ljava/awt/event/ComponentEvent;

    .line 3201
    invoke-virtual {p1}, Ljava/awt/event/ComponentEvent;->getComponent()Ljava/awt/Component;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->check(Ljava/awt/Component;)V

    .line 3202
    return-void
.end method

.method public componentMoved(Ljava/awt/event/ComponentEvent;)V
    .locals 1
    .param p1, "e"    # Ljava/awt/event/ComponentEvent;

    .line 3206
    invoke-virtual {p1}, Ljava/awt/event/ComponentEvent;->getComponent()Ljava/awt/Component;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->check(Ljava/awt/Component;)V

    .line 3207
    return-void
.end method

.method public componentResized(Ljava/awt/event/ComponentEvent;)V
    .locals 1
    .param p1, "e"    # Ljava/awt/event/ComponentEvent;

    .line 3211
    invoke-virtual {p1}, Ljava/awt/event/ComponentEvent;->getComponent()Ljava/awt/Component;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->check(Ljava/awt/Component;)V

    .line 3212
    return-void
.end method

.method public componentShown(Ljava/awt/event/ComponentEvent;)V
    .locals 1
    .param p1, "e"    # Ljava/awt/event/ComponentEvent;

    .line 3216
    invoke-virtual {p1}, Ljava/awt/event/ComponentEvent;->getComponent()Ljava/awt/Component;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/tools/debugger/ContextWindow$1;->check(Ljava/awt/Component;)V

    .line 3217
    return-void
.end method
