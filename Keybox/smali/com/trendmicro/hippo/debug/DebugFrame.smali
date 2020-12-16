.class public interface abstract Lcom/trendmicro/hippo/debug/DebugFrame;
.super Ljava/lang/Object;
.source "DebugFrame.java"


# virtual methods
.method public abstract onDebuggerStatement(Lcom/trendmicro/hippo/Context;)V
.end method

.method public abstract onEnter(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)V
.end method

.method public abstract onExceptionThrown(Lcom/trendmicro/hippo/Context;Ljava/lang/Throwable;)V
.end method

.method public abstract onExit(Lcom/trendmicro/hippo/Context;ZLjava/lang/Object;)V
.end method

.method public abstract onLineChange(Lcom/trendmicro/hippo/Context;I)V
.end method
