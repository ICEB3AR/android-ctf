.class Lcom/trendmicro/hippo/SlotMapContainer;
.super Ljava/lang/Object;
.source "SlotMapContainer.java"

# interfaces
.implements Lcom/trendmicro/hippo/SlotMap;


# static fields
.field private static final LARGE_HASH_SIZE:I = 0x7d0


# instance fields
.field protected map:Lcom/trendmicro/hippo/SlotMap;


# direct methods
.method constructor <init>(I)V
    .locals 1
    .param p1, "initialSize"    # I

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/16 v0, 0x7d0

    if-le p1, v0, :cond_0

    .line 33
    new-instance v0, Lcom/trendmicro/hippo/HashSlotMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/HashSlotMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    goto :goto_0

    .line 35
    :cond_0
    new-instance v0, Lcom/trendmicro/hippo/EmbeddedSlotMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/EmbeddedSlotMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    .line 37
    :goto_0
    return-void
.end method


# virtual methods
.method public addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
    .locals 1
    .param p1, "newSlot"    # Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 71
    invoke-virtual {p0}, Lcom/trendmicro/hippo/SlotMapContainer;->checkMapSize()V

    .line 72
    iget-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/SlotMap;->addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    .line 73
    return-void
.end method

.method protected checkMapSize()V
    .locals 3

    .line 102
    iget-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    instance-of v1, v0, Lcom/trendmicro/hippo/EmbeddedSlotMap;

    if-eqz v1, :cond_1

    invoke-interface {v0}, Lcom/trendmicro/hippo/SlotMap;->size()I

    move-result v0

    const/16 v1, 0x7d0

    if-lt v0, v1, :cond_1

    .line 103
    new-instance v0, Lcom/trendmicro/hippo/HashSlotMap;

    invoke-direct {v0}, Lcom/trendmicro/hippo/HashSlotMap;-><init>()V

    .line 104
    .local v0, "newMap":Lcom/trendmicro/hippo/SlotMap;
    iget-object v1, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v1}, Lcom/trendmicro/hippo/SlotMap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 105
    .local v2, "s":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    invoke-interface {v0, v2}, Lcom/trendmicro/hippo/SlotMap;->addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    .line 106
    .end local v2    # "s":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    goto :goto_0

    .line 107
    :cond_0
    iput-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    .line 109
    .end local v0    # "newMap":Lcom/trendmicro/hippo/SlotMap;
    :cond_1
    return-void
.end method

.method public dirtySize()I
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0}, Lcom/trendmicro/hippo/SlotMap;->size()I

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .param p3, "accessType"    # Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    .line 57
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-eq p3, v0, :cond_0

    .line 58
    invoke-virtual {p0}, Lcom/trendmicro/hippo/SlotMapContainer;->checkMapSize()V

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0, p1, p2, p3}, Lcom/trendmicro/hippo/SlotMap;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0}, Lcom/trendmicro/hippo/SlotMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/trendmicro/hippo/ScriptableObject$Slot;",
            ">;"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0}, Lcom/trendmicro/hippo/SlotMap;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .line 65
    iget-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/SlotMap;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v0

    return-object v0
.end method

.method public readLock()J
    .locals 2

    .line 88
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public remove(Ljava/lang/Object;I)V
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .line 77
    iget-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0, p1, p2}, Lcom/trendmicro/hippo/SlotMap;->remove(Ljava/lang/Object;I)V

    .line 78
    return-void
.end method

.method public size()I
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/trendmicro/hippo/SlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0}, Lcom/trendmicro/hippo/SlotMap;->size()I

    move-result v0

    return v0
.end method

.method public unlockRead(J)V
    .locals 0
    .param p1, "stamp"    # J

    .line 94
    return-void
.end method
