.class public interface abstract Lcom/trendmicro/hippo/ContextFactory$Listener;
.super Ljava/lang/Object;
.source "ContextFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ContextFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract contextCreated(Lcom/trendmicro/hippo/Context;)V
.end method

.method public abstract contextReleased(Lcom/trendmicro/hippo/Context;)V
.end method
