.class public interface abstract Lcom/trendmicro/hippo/tools/debugger/GuiCallback;
.super Ljava/lang/Object;
.source "GuiCallback.java"


# virtual methods
.method public abstract dispatchNextGuiEvent()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract enterInterrupt(Lcom/trendmicro/hippo/tools/debugger/Dim$StackFrame;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract isGuiEventThread()Z
.end method

.method public abstract updateSourceText(Lcom/trendmicro/hippo/tools/debugger/Dim$SourceInfo;)V
.end method
