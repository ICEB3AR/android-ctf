.class public Lcom/trendmicro/hippo/Node$NodeIterator;
.super Ljava/lang/Object;
.source "Node.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Node;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NodeIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/trendmicro/hippo/Node;",
        ">;"
    }
.end annotation


# instance fields
.field private cursor:Lcom/trendmicro/hippo/Node;

.field private prev:Lcom/trendmicro/hippo/Node;

.field private prev2:Lcom/trendmicro/hippo/Node;

.field private removed:Z

.field final synthetic this$0:Lcom/trendmicro/hippo/Node;


# direct methods
.method public constructor <init>(Lcom/trendmicro/hippo/Node;)V
    .locals 1
    .param p1, "this$0"    # Lcom/trendmicro/hippo/Node;

    .line 354
    iput-object p1, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->this$0:Lcom/trendmicro/hippo/Node;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 350
    invoke-static {}, Lcom/trendmicro/hippo/Node;->access$000()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev:Lcom/trendmicro/hippo/Node;

    .line 352
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->removed:Z

    .line 355
    iget-object v0, p1, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    iput-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->cursor:Lcom/trendmicro/hippo/Node;

    .line 356
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 360
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->cursor:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lcom/trendmicro/hippo/Node;
    .locals 2

    .line 365
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->cursor:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_0

    .line 368
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->removed:Z

    .line 369
    iget-object v1, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev:Lcom/trendmicro/hippo/Node;

    iput-object v1, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev2:Lcom/trendmicro/hippo/Node;

    .line 370
    iput-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev:Lcom/trendmicro/hippo/Node;

    .line 371
    iget-object v0, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    iput-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->cursor:Lcom/trendmicro/hippo/Node;

    .line 372
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev:Lcom/trendmicro/hippo/Node;

    return-object v0

    .line 366
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 348
    invoke-virtual {p0}, Lcom/trendmicro/hippo/Node$NodeIterator;->next()Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 377
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev:Lcom/trendmicro/hippo/Node;

    invoke-static {}, Lcom/trendmicro/hippo/Node;->access$000()Lcom/trendmicro/hippo/Node;

    move-result-object v1

    if-eq v0, v1, :cond_3

    .line 380
    iget-boolean v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->removed:Z

    if-nez v0, :cond_2

    .line 384
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev:Lcom/trendmicro/hippo/Node;

    iget-object v1, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->this$0:Lcom/trendmicro/hippo/Node;

    iget-object v1, v1, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    if-ne v0, v1, :cond_0

    .line 385
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->this$0:Lcom/trendmicro/hippo/Node;

    iget-object v1, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev:Lcom/trendmicro/hippo/Node;

    iget-object v1, v1, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    iput-object v1, v0, Lcom/trendmicro/hippo/Node;->first:Lcom/trendmicro/hippo/Node;

    goto :goto_0

    .line 386
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev:Lcom/trendmicro/hippo/Node;

    iget-object v1, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->this$0:Lcom/trendmicro/hippo/Node;

    iget-object v1, v1, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    if-ne v0, v1, :cond_1

    .line 387
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev2:Lcom/trendmicro/hippo/Node;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 388
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->this$0:Lcom/trendmicro/hippo/Node;

    iget-object v1, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev2:Lcom/trendmicro/hippo/Node;

    iput-object v1, v0, Lcom/trendmicro/hippo/Node;->last:Lcom/trendmicro/hippo/Node;

    goto :goto_0

    .line 390
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->prev2:Lcom/trendmicro/hippo/Node;

    iget-object v1, p0, Lcom/trendmicro/hippo/Node$NodeIterator;->cursor:Lcom/trendmicro/hippo/Node;

    iput-object v1, v0, Lcom/trendmicro/hippo/Node;->next:Lcom/trendmicro/hippo/Node;

    .line 392
    :goto_0
    return-void

    .line 381
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "remove() already called for current element"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 378
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "next() has not been called"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
