.class Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
.super Ljava/lang/Object;
.source "Block.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/optimizer/Block;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FatBlock"
.end annotation


# instance fields
.field private predecessors:Lcom/trendmicro/hippo/ObjToIntMap;

.field realBlock:Lcom/trendmicro/hippo/optimizer/Block;

.field private successors:Lcom/trendmicro/hippo/ObjToIntMap;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->successors:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 49
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->predecessors:Lcom/trendmicro/hippo/ObjToIntMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/optimizer/Block$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/optimizer/Block$1;

    .line 22
    invoke-direct {p0}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;-><init>()V

    return-void
.end method

.method private static reduceToArray(Lcom/trendmicro/hippo/ObjToIntMap;)[Lcom/trendmicro/hippo/optimizer/Block;
    .locals 6
    .param p0, "map"    # Lcom/trendmicro/hippo/ObjToIntMap;

    .line 27
    const/4 v0, 0x0

    .line 28
    .local v0, "result":[Lcom/trendmicro/hippo/optimizer/Block;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ObjToIntMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 29
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ObjToIntMap;->size()I

    move-result v1

    new-array v0, v1, [Lcom/trendmicro/hippo/optimizer/Block;

    .line 30
    const/4 v1, 0x0

    .line 31
    .local v1, "i":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ObjToIntMap;->newIterator()Lcom/trendmicro/hippo/ObjToIntMap$Iterator;

    move-result-object v2

    .line 32
    .local v2, "iter":Lcom/trendmicro/hippo/ObjToIntMap$Iterator;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->start()V

    :goto_0
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->done()Z

    move-result v3

    if-nez v3, :cond_0

    .line 33
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    .line 34
    .local v3, "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "i":I
    .local v4, "i":I
    iget-object v5, v3, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->realBlock:Lcom/trendmicro/hippo/optimizer/Block;

    aput-object v5, v0, v1

    .line 32
    .end local v3    # "fb":Lcom/trendmicro/hippo/optimizer/Block$FatBlock;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->next()V

    move v1, v4

    goto :goto_0

    .line 37
    .end local v2    # "iter":Lcom/trendmicro/hippo/ObjToIntMap$Iterator;
    .end local v4    # "i":I
    :cond_0
    return-object v0
.end method


# virtual methods
.method addPredecessor(Lcom/trendmicro/hippo/optimizer/Block$FatBlock;)V
    .locals 2
    .param p1, "b"    # Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    .line 41
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->predecessors:Lcom/trendmicro/hippo/ObjToIntMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    return-void
.end method

.method addSuccessor(Lcom/trendmicro/hippo/optimizer/Block$FatBlock;)V
    .locals 2
    .param p1, "b"    # Lcom/trendmicro/hippo/optimizer/Block$FatBlock;

    .line 40
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->successors:Lcom/trendmicro/hippo/ObjToIntMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->put(Ljava/lang/Object;I)V

    return-void
.end method

.method getPredecessors()[Lcom/trendmicro/hippo/optimizer/Block;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->predecessors:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-static {v0}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->reduceToArray(Lcom/trendmicro/hippo/ObjToIntMap;)[Lcom/trendmicro/hippo/optimizer/Block;

    move-result-object v0

    return-object v0
.end method

.method getSuccessors()[Lcom/trendmicro/hippo/optimizer/Block;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->successors:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-static {v0}, Lcom/trendmicro/hippo/optimizer/Block$FatBlock;->reduceToArray(Lcom/trendmicro/hippo/ObjToIntMap;)[Lcom/trendmicro/hippo/optimizer/Block;

    move-result-object v0

    return-object v0
.end method
