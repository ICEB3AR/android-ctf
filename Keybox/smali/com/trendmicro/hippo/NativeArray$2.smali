.class Lcom/trendmicro/hippo/NativeArray$2;
.super Ljava/lang/Object;
.source "NativeArray.java"

# interfaces
.implements Ljava/util/ListIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/NativeArray;->listIterator(I)Ljava/util/ListIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field cursor:I

.field final synthetic this$0:Lcom/trendmicro/hippo/NativeArray;

.field final synthetic val$len:I

.field final synthetic val$start:I


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/NativeArray;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/trendmicro/hippo/NativeArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2164
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeArray$2;->this$0:Lcom/trendmicro/hippo/NativeArray;

    iput p2, p0, Lcom/trendmicro/hippo/NativeArray$2;->val$start:I

    iput p3, p0, Lcom/trendmicro/hippo/NativeArray$2;->val$len:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2166
    iget p2, p0, Lcom/trendmicro/hippo/NativeArray$2;->val$start:I

    iput p2, p0, Lcom/trendmicro/hippo/NativeArray$2;->cursor:I

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 2211
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public hasNext()Z
    .locals 2

    .line 2170
    iget v0, p0, Lcom/trendmicro/hippo/NativeArray$2;->cursor:I

    iget v1, p0, Lcom/trendmicro/hippo/NativeArray$2;->val$len:I

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

    .line 2183
    iget v0, p0, Lcom/trendmicro/hippo/NativeArray$2;->cursor:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 3

    .line 2175
    iget v0, p0, Lcom/trendmicro/hippo/NativeArray$2;->cursor:I

    iget v1, p0, Lcom/trendmicro/hippo/NativeArray$2;->val$len:I

    if-eq v0, v1, :cond_0

    .line 2178
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeArray$2;->this$0:Lcom/trendmicro/hippo/NativeArray;

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/NativeArray$2;->cursor:I

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 2176
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public nextIndex()I
    .locals 1

    .line 2196
    iget v0, p0, Lcom/trendmicro/hippo/NativeArray$2;->cursor:I

    return v0
.end method

.method public previous()Ljava/lang/Object;
    .locals 2

    .line 2188
    iget v0, p0, Lcom/trendmicro/hippo/NativeArray$2;->cursor:I

    if-eqz v0, :cond_0

    .line 2191
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeArray$2;->this$0:Lcom/trendmicro/hippo/NativeArray;

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/NativeArray$2;->cursor:I

    invoke-virtual {v1, v0}, Lcom/trendmicro/hippo/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 2189
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public previousIndex()I
    .locals 1

    .line 2201
    iget v0, p0, Lcom/trendmicro/hippo/NativeArray$2;->cursor:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public remove()V
    .locals 1

    .line 2206
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 2216
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
