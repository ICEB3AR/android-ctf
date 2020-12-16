.class Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;
.super Lcom/trendmicro/hippo/SlotMapContainer;
.source "ThreadSafeSlotMapContainer.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final lock:Ljava/util/concurrent/locks/StampedLock;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 19
    return-void
.end method

.method constructor <init>(I)V
    .locals 1
    .param p1, "initialSize"    # I

    .line 27
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/SlotMapContainer;-><init>(I)V

    .line 22
    new-instance v0, Ljava/util/concurrent/locks/StampedLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/StampedLock;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    .line 28
    return-void
.end method


# virtual methods
.method public addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
    .locals 4
    .param p1, "newSlot"    # Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 105
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/StampedLock;->writeLock()J

    move-result-wide v0

    .line 107
    .local v0, "stamp":J
    :try_start_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->checkMapSize()V

    .line 108
    iget-object v2, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v2, p1}, Lcom/trendmicro/hippo/SlotMap;->addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    iget-object v2, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockWrite(J)V

    .line 111
    nop

    .line 112
    return-void

    .line 110
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockWrite(J)V

    .line 111
    throw v2
.end method

.method protected checkMapSize()V
    .locals 0

    .line 160
    nop

    .line 161
    invoke-super {p0}, Lcom/trendmicro/hippo/SlotMapContainer;->checkMapSize()V

    .line 162
    return-void
.end method

.method public dirtySize()I
    .locals 1

    .line 50
    nop

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0}, Lcom/trendmicro/hippo/SlotMap;->size()I

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .param p3, "accessType"    # Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    .line 74
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/StampedLock;->writeLock()J

    move-result-wide v0

    .line 76
    .local v0, "stamp":J
    :try_start_0
    sget-object v2, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-eq p3, v2, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->checkMapSize()V

    .line 79
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v2, p1, p2, p3}, Lcom/trendmicro/hippo/SlotMap;->get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockWrite(J)V

    .line 79
    return-object v2

    .line 81
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockWrite(J)V

    .line 82
    throw v2
.end method

.method public isEmpty()Z
    .locals 5

    .line 57
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/StampedLock;->tryOptimisticRead()J

    move-result-wide v0

    .line 58
    .local v0, "stamp":J
    iget-object v2, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v2}, Lcom/trendmicro/hippo/SlotMap;->isEmpty()Z

    move-result v2

    .line 59
    .local v2, "e":Z
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->validate(J)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 60
    return v2

    .line 63
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/StampedLock;->readLock()J

    move-result-wide v0

    .line 65
    :try_start_0
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v3}, Lcom/trendmicro/hippo/SlotMap;->isEmpty()Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    iget-object v4, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockRead(J)V

    .line 65
    return v3

    .line 67
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockRead(J)V

    .line 68
    throw v3
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

    .line 149
    nop

    .line 150
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v0}, Lcom/trendmicro/hippo/SlotMap;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .line 88
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/StampedLock;->tryOptimisticRead()J

    move-result-wide v0

    .line 89
    .local v0, "stamp":J
    iget-object v2, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v2, p1, p2}, Lcom/trendmicro/hippo/SlotMap;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v2

    .line 90
    .local v2, "s":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->validate(J)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 91
    return-object v2

    .line 94
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/StampedLock;->readLock()J

    move-result-wide v0

    .line 96
    :try_start_0
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v3, p1, p2}, Lcom/trendmicro/hippo/SlotMap;->query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    iget-object v4, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockRead(J)V

    .line 96
    return-object v3

    .line 98
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockRead(J)V

    .line 99
    throw v3
.end method

.method public readLock()J
    .locals 2

    .line 132
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/StampedLock;->readLock()J

    move-result-wide v0

    return-wide v0
.end method

.method public remove(Ljava/lang/Object;I)V
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .line 117
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/StampedLock;->writeLock()J

    move-result-wide v0

    .line 119
    .local v0, "stamp":J
    :try_start_0
    iget-object v2, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v2, p1, p2}, Lcom/trendmicro/hippo/SlotMap;->remove(Ljava/lang/Object;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    iget-object v2, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockWrite(J)V

    .line 122
    nop

    .line 123
    return-void

    .line 121
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockWrite(J)V

    .line 122
    throw v2
.end method

.method public size()I
    .locals 5

    .line 33
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/StampedLock;->tryOptimisticRead()J

    move-result-wide v0

    .line 34
    .local v0, "stamp":J
    iget-object v2, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v2}, Lcom/trendmicro/hippo/SlotMap;->size()I

    move-result v2

    .line 35
    .local v2, "s":I
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->validate(J)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 36
    return v2

    .line 39
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/StampedLock;->readLock()J

    move-result-wide v0

    .line 41
    :try_start_0
    iget-object v3, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->map:Lcom/trendmicro/hippo/SlotMap;

    invoke-interface {v3}, Lcom/trendmicro/hippo/SlotMap;->size()I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    iget-object v4, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockRead(J)V

    .line 41
    return v3

    .line 43
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/locks/StampedLock;->unlockRead(J)V

    .line 44
    throw v3
.end method

.method public unlockRead(J)V
    .locals 1
    .param p1, "stamp"    # J

    .line 143
    iget-object v0, p0, Lcom/trendmicro/hippo/ThreadSafeSlotMapContainer;->lock:Ljava/util/concurrent/locks/StampedLock;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/locks/StampedLock;->unlockRead(J)V

    .line 144
    return-void
.end method
