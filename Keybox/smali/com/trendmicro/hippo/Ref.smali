.class public abstract Lcom/trendmicro/hippo/Ref;
.super Ljava/lang/Object;
.source "Ref.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x382118061377e6c0L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Lcom/trendmicro/hippo/Context;)Z
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 40
    const/4 v0, 0x0

    return v0
.end method

.method public abstract get(Lcom/trendmicro/hippo/Context;)Ljava/lang/Object;
.end method

.method public has(Lcom/trendmicro/hippo/Context;)Z
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;

    .line 22
    const/4 v0, 0x1

    return v0
.end method

.method public set(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p2, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .line 35
    invoke-virtual {p0, p1, p3}, Lcom/trendmicro/hippo/Ref;->set(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public abstract set(Lcom/trendmicro/hippo/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
