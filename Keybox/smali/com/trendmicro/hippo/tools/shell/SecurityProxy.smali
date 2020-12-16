.class public abstract Lcom/trendmicro/hippo/tools/shell/SecurityProxy;
.super Lcom/trendmicro/hippo/SecurityController;
.source "SecurityProxy.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/trendmicro/hippo/SecurityController;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract callProcessFileSecure(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)V
.end method
