.class Lcom/trendmicro/hippo/tools/debugger/RunProxy;
.super Ljava/lang/Object;
.source "SwingGui.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field static final ENTER_INTERRUPT:I = 0x4

.field static final LOAD_FILE:I = 0x2

.field static final OPEN_FILE:I = 0x1

.field static final UPDATE_SOURCE_TEXT:I = 0x3


# instance fields
.field alertMessage:Ljava/lang/String;

.field private debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

.field fileName:Ljava/lang/String;

.field lastFrame:Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

.field sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

.field text:Ljava/lang/String;

.field threadTitle:Ljava/lang/String;

.field private type:I


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/tools/debugger/SwingGui;I)V
    .locals 0
    .param p1, "debugGui"    # Lcom/trendmicro/hippo/tools/debugger/SwingGui;
    .param p2, "type"    # I

    .line 3662
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3663
    iput-object p1, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 3664
    iput p2, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->type:I

    .line 3665
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 3672
    iget v0, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->type:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 3704
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->lastFrame:Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->threadTitle:Ljava/lang/String;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->alertMessage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->enterInterruptImpl(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V

    .line 3705
    goto/16 :goto_0

    .line 3708
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    iget v1, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->type:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3695
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v0

    .line 3696
    .local v0, "fileName":Ljava/lang/String;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->updateFileWindow(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 3697
    const-string v1, "<stdin>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 3698
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v2, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->sourceInfo:Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->createFileWindow(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;I)V

    .line 3701
    .end local v0    # "fileName":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 3685
    :cond_3
    :try_start_0
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->text:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lcom/trendmicro/hippo/tools/debugger/Dim;->evalScript(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3690
    goto :goto_0

    .line 3686
    :catch_0
    move-exception v0

    .line 3687
    .local v0, "ex":Ljava/lang/RuntimeException;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 3688
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Run error for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3687
    invoke-static {v1, v3, v4, v2}, Lcom/trendmicro/hippo/tools/debugger/MessageDialogWrapper;->showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V

    .line 3691
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    goto :goto_0

    .line 3675
    :cond_4
    :try_start_1
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    iget-object v0, v0, Lcom/trendmicro/hippo/tools/debugger/SwingGui;->dim:Lcom/trendmicro/hippo/tools/debugger/Dim;

    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    iget-object v3, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->text:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lcom/trendmicro/hippo/tools/debugger/Dim;->compileScript(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 3680
    goto :goto_0

    .line 3676
    :catch_1
    move-exception v0

    .line 3677
    .restart local v0    # "ex":Ljava/lang/RuntimeException;
    iget-object v1, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->debugGui:Lcom/trendmicro/hippo/tools/debugger/SwingGui;

    .line 3678
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error Compiling "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/trendmicro/hippo/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3677
    invoke-static {v1, v3, v4, v2}, Lcom/trendmicro/hippo/tools/debugger/MessageDialogWrapper;->showMessageDialog(Ljava/awt/Component;Ljava/lang/String;Ljava/lang/String;I)V

    .line 3681
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    nop

    .line 3711
    :goto_0
    return-void
.end method
