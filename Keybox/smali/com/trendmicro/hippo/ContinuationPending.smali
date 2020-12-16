.class public Lcom/trendmicro/hippo/ContinuationPending;
.super Ljava/lang/RuntimeException;
.source "ContinuationPending.java"


# static fields
.field private static final serialVersionUID:J = 0x44c7471fc8185f08L


# instance fields
.field private applicationState:Ljava/lang/Object;

.field private continuationState:Lcom/trendmicro/hippo/NativeContinuation;


# direct methods
.method protected constructor <init>(Lcom/trendmicro/hippo/NativeContinuation;)V
    .locals 0
    .param p1, "continuationState"    # Lcom/trendmicro/hippo/NativeContinuation;

    .line 32
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/trendmicro/hippo/ContinuationPending;->continuationState:Lcom/trendmicro/hippo/NativeContinuation;

    .line 34
    return-void
.end method


# virtual methods
.method public getApplicationState()Ljava/lang/Object;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/trendmicro/hippo/ContinuationPending;->applicationState:Ljava/lang/Object;

    return-object v0
.end method

.method public getContinuation()Ljava/lang/Object;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/trendmicro/hippo/ContinuationPending;->continuationState:Lcom/trendmicro/hippo/NativeContinuation;

    return-object v0
.end method

.method getContinuationState()Lcom/trendmicro/hippo/NativeContinuation;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/trendmicro/hippo/ContinuationPending;->continuationState:Lcom/trendmicro/hippo/NativeContinuation;

    return-object v0
.end method

.method public setApplicationState(Ljava/lang/Object;)V
    .locals 0
    .param p1, "applicationState"    # Ljava/lang/Object;

    .line 67
    iput-object p1, p0, Lcom/trendmicro/hippo/ContinuationPending;->applicationState:Ljava/lang/Object;

    .line 68
    return-void
.end method

.method public setContinuation(Lcom/trendmicro/hippo/NativeContinuation;)V
    .locals 0
    .param p1, "continuation"    # Lcom/trendmicro/hippo/NativeContinuation;

    .line 51
    iput-object p1, p0, Lcom/trendmicro/hippo/ContinuationPending;->continuationState:Lcom/trendmicro/hippo/NativeContinuation;

    .line 52
    return-void
.end method
