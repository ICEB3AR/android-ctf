.class public Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;
.super Ljava/lang/Object;
.source "NativeTypedArrayIterator.java"

# interfaces
.implements Ljava/util/ListIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/ListIterator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private lastPosition:I

.field private position:I

.field private final view:Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;I)V
    .locals 1
    .param p2, "start"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<",
            "TT;>;I)V"
        }
    .end annotation

    .line 22
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    .local p1, "view":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->lastPosition:I

    .line 23
    iput-object p1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->view:Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    .line 24
    iput p2, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    .line 25
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 92
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public hasNext()Z
    .locals 2

    .line 30
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->view:Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    iget v1, v1, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->length:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasPrevious()Z
    .locals 1

    .line 36
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 54
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->view:Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    iget v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 56
    .local v0, "ret":Ljava/lang/Object;, "TT;"
    iget v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    iput v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->lastPosition:I

    .line 57
    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    .line 58
    return-object v0

    .line 60
    .end local v0    # "ret":Ljava/lang/Object;, "TT;"
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public nextIndex()I
    .locals 1

    .line 42
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    return v0
.end method

.method public previous()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 66
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->hasPrevious()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    .line 68
    iput v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->lastPosition:I

    .line 69
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->view:Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 71
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public previousIndex()I
    .locals 1

    .line 48
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->position:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public remove()V
    .locals 1

    .line 86
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 77
    .local p0, "this":Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;, "Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->lastPosition:I

    if-ltz v0, :cond_0

    .line 80
    iget-object v1, p0, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayIterator;->view:Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;

    invoke-virtual {v1, v0, p1}, Lcom/trendmicro/hippo/typedarrays/NativeTypedArrayView;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 81
    return-void

    .line 78
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
