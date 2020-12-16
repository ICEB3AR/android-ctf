.class Lcom/trendmicro/hippo/NativeObject$EntrySet$1;
.super Ljava/lang/Object;
.source "NativeObject.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trendmicro/hippo/NativeObject$EntrySet;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field ids:[Ljava/lang/Object;

.field index:I

.field key:Ljava/lang/Object;

.field final synthetic this$1:Lcom/trendmicro/hippo/NativeObject$EntrySet;


# direct methods
.method constructor <init>(Lcom/trendmicro/hippo/NativeObject$EntrySet;)V
    .locals 1
    .param p1, "this$1"    # Lcom/trendmicro/hippo/NativeObject$EntrySet;

    .line 615
    iput-object p1, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->this$1:Lcom/trendmicro/hippo/NativeObject$EntrySet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 616
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->this$1:Lcom/trendmicro/hippo/NativeObject$EntrySet;

    iget-object v0, v0, Lcom/trendmicro/hippo/NativeObject$EntrySet;->this$0:Lcom/trendmicro/hippo/NativeObject;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeObject;->getIds()[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->ids:[Ljava/lang/Object;

    .line 617
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->key:Ljava/lang/Object;

    .line 618
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->index:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 622
    iget v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->index:I

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->ids:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 615
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 627
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->ids:[Ljava/lang/Object;

    iget v1, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->index:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->key:Ljava/lang/Object;

    .line 628
    .local v0, "ekey":Ljava/lang/Object;
    iget-object v1, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->this$1:Lcom/trendmicro/hippo/NativeObject$EntrySet;

    iget-object v1, v1, Lcom/trendmicro/hippo/NativeObject$EntrySet;->this$0:Lcom/trendmicro/hippo/NativeObject;

    iget-object v2, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->key:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/NativeObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 629
    .local v1, "value":Ljava/lang/Object;
    new-instance v2, Lcom/trendmicro/hippo/NativeObject$EntrySet$1$1;

    invoke-direct {v2, p0, v0, v1}, Lcom/trendmicro/hippo/NativeObject$EntrySet$1$1;-><init>(Lcom/trendmicro/hippo/NativeObject$EntrySet$1;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2
.end method

.method public remove()V
    .locals 2

    .line 670
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->key:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 673
    iget-object v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->this$1:Lcom/trendmicro/hippo/NativeObject$EntrySet;

    iget-object v0, v0, Lcom/trendmicro/hippo/NativeObject$EntrySet;->this$0:Lcom/trendmicro/hippo/NativeObject;

    iget-object v1, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeObject;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/NativeObject$EntrySet$1;->key:Ljava/lang/Object;

    .line 675
    return-void

    .line 671
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
