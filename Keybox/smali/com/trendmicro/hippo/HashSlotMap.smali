.class public Lcom/trendmicro/hippo/HashSlotMap;
.super Ljava/lang/Object;
.source "HashSlotMap.java"

# interfaces
.implements Lcom/trendmicro/hippo/SlotMap;


# instance fields
.field private final map:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Object;",
            "Lcom/trendmicro/hippo/ScriptableObject$Slot;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    return-void
.end method

.method private createSlot(Ljava/lang/Object;ILjava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .param p3, "name"    # Ljava/lang/Object;
    .param p4, "accessType"    # Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    .line 72
    iget-object v0, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 73
    .local v0, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-eqz v0, :cond_3

    .line 76
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-ne p4, v1, :cond_0

    instance-of v1, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-nez v1, :cond_0

    .line 78
    new-instance v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    iget v2, v0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v3

    invoke-direct {v1, p3, v2, v3}, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;-><init>(Ljava/lang/Object;II)V

    .local v1, "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    goto :goto_0

    .line 79
    .end local v1    # "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_0
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->CONVERT_ACCESSOR_TO_DATA:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-ne p4, v1, :cond_1

    instance-of v1, v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-eqz v1, :cond_1

    .line 81
    new-instance v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iget v2, v0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v3

    invoke-direct {v1, p3, v2, v3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;-><init>(Ljava/lang/Object;II)V

    .line 87
    .restart local v1    # "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :goto_0
    iget-object v2, v0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    iput-object v2, v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 88
    iget-object v2, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p3, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    return-object v1

    .line 82
    .end local v1    # "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_1
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_CONST:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-ne p4, v1, :cond_2

    .line 83
    const/4 v1, 0x0

    return-object v1

    .line 85
    :cond_2
    return-object v0

    .line 92
    :cond_3
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    const/4 v2, 0x0

    if-ne p4, v1, :cond_4

    .line 93
    new-instance v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    invoke-direct {v1, p1, p2, v2}, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;-><init>(Ljava/lang/Object;II)V

    goto :goto_1

    .line 94
    :cond_4
    new-instance v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    invoke-direct {v1, p1, p2, v2}, Lcom/trendmicro/hippo/ScriptableObject$Slot;-><init>(Ljava/lang/Object;II)V

    :goto_1
    nop

    .line 95
    .restart local v1    # "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    sget-object v2, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_CONST:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-ne p4, v2, :cond_5

    .line 96
    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setAttributes(I)V

    .line 98
    :cond_5
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/HashSlotMap;->addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    .line 99
    return-object v1
.end method


# virtual methods
.method public addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
    .locals 2
    .param p1, "newSlot"    # Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 104
    iget-object v0, p1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    if-nez v0, :cond_0

    iget v0, p1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    .line 105
    .local v0, "name":Ljava/lang/Object;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    return-void
.end method

.method public get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .param p3, "accessType"    # Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    .line 47
    if-nez p1, :cond_0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, p1

    .line 48
    .local v0, "name":Ljava/lang/Object;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 49
    .local v1, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    sget-object v2, Lcom/trendmicro/hippo/HashSlotMap$1;->$SwitchMap$com$trendmicro$hippo$ScriptableObject$SlotAccess:[I

    invoke-virtual {p3}, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x1

    if-eq v2, v3, :cond_5

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    const/4 v3, 0x4

    if-eq v2, v3, :cond_2

    const/4 v3, 0x5

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 62
    :cond_1
    instance-of v2, v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-nez v2, :cond_4

    .line 63
    return-object v1

    .line 58
    :cond_2
    instance-of v2, v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-eqz v2, :cond_4

    .line 59
    return-object v1

    .line 54
    :cond_3
    if-eqz v1, :cond_4

    .line 55
    return-object v1

    .line 67
    :cond_4
    :goto_1
    invoke-direct {p0, p1, p2, v0, p3}, Lcom/trendmicro/hippo/HashSlotMap;->createSlot(Ljava/lang/Object;ILjava/lang/Object;Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v2

    return-object v2

    .line 51
    :cond_5
    return-object v1
.end method

.method public isEmpty()Z
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->isEmpty()Z

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

    .line 127
    iget-object v0, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .line 41
    if-nez p1, :cond_0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, p1

    .line 42
    .local v0, "name":Ljava/lang/Object;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    return-object v1
.end method

.method public remove(Ljava/lang/Object;I)V
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .line 110
    if-nez p1, :cond_0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, p1

    .line 111
    .local v0, "name":Ljava/lang/Object;
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 112
    .local v1, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    if-eqz v1, :cond_3

    .line 114
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v2

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_2

    .line 115
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v2

    .line 116
    .local v2, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v3

    if-nez v3, :cond_1

    .line 119
    return-void

    .line 117
    :cond_1
    const-string v3, "msg.delete.property.with.configurable.false"

    invoke-static {v3, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v3

    throw v3

    .line 121
    .end local v2    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    :cond_3
    return-void
.end method

.method public size()I
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/trendmicro/hippo/HashSlotMap;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    return v0
.end method
