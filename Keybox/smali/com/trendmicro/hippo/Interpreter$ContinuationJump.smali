.class final Lcom/trendmicro/hippo/Interpreter$ContinuationJump;
.super Ljava/lang/Object;
.source "Interpreter.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Interpreter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ContinuationJump"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x6ab05607ef7f8517L


# instance fields
.field branchFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

.field capturedFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

.field result:Ljava/lang/Object;

.field resultDbl:D


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/NativeContinuation;Lcom/trendmicro/hippo/Interpreter$CallFrame;)V
    .locals 5
    .param p1, "c"    # Lcom/trendmicro/hippo/NativeContinuation;
    .param p2, "current"    # Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 306
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 307
    invoke-virtual {p1}, Lcom/trendmicro/hippo/NativeContinuation;->getImplementation()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;

    iput-object v0, p0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->capturedFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 308
    if-eqz v0, :cond_4

    if-nez p2, :cond_0

    goto :goto_1

    .line 316
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->capturedFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 317
    .local v0, "chain1":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    move-object v1, p2

    .line 321
    .local v1, "chain2":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    iget v2, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    iget v3, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    sub-int/2addr v2, v3

    .line 322
    .local v2, "diff":I
    if-eqz v2, :cond_2

    .line 323
    if-gez v2, :cond_1

    .line 326
    move-object v0, p2

    .line 327
    iget-object v1, p0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->capturedFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 328
    neg-int v2, v2

    .line 331
    :cond_1
    iget-object v0, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 332
    add-int/lit8 v2, v2, -0x1

    if-nez v2, :cond_1

    .line 333
    iget v3, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    iget v4, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frameIndex:I

    if-eq v3, v4, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 338
    :cond_2
    :goto_0
    if-eq v0, v1, :cond_3

    if-eqz v0, :cond_3

    .line 339
    iget-object v0, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 340
    iget-object v1, v1, Lcom/trendmicro/hippo/Interpreter$CallFrame;->parentFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    goto :goto_0

    .line 343
    :cond_3
    iput-object v0, p0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->branchFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 344
    if-eqz v0, :cond_5

    iget-boolean v3, v0, Lcom/trendmicro/hippo/Interpreter$CallFrame;->frozen:Z

    if-nez v3, :cond_5

    .line 345
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_2

    .line 312
    .end local v0    # "chain1":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v1    # "chain2":Lcom/trendmicro/hippo/Interpreter$CallFrame;
    .end local v2    # "diff":I
    :cond_4
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/Interpreter$ContinuationJump;->branchFrame:Lcom/trendmicro/hippo/Interpreter$CallFrame;

    .line 347
    :cond_5
    :goto_2
    return-void
.end method
