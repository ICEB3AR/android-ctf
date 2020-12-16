.class public Lcom/trendmicro/hippo/EmbeddedSlotMap;
.super Ljava/lang/Object;
.source "EmbeddedSlotMap.java"

# interfaces
.implements Lcom/trendmicro/hippo/SlotMap;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;
    }
.end annotation


# static fields
.field private static final INITIAL_SLOT_SIZE:I = 0x4


# instance fields
.field private count:I

.field private firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

.field private lastAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

.field private slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    return-void
.end method

.method private addKnownAbsentSlot([Lcom/trendmicro/hippo/ScriptableObject$Slot;Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
    .locals 2
    .param p1, "addSlots"    # [Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .param p2, "slot"    # Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 345
    array-length v0, p1

    iget v1, p2, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    invoke-static {v0, v1}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->getSlotIndex(II)I

    move-result v0

    .line 346
    .local v0, "insertPos":I
    aget-object v1, p1, v0

    .line 347
    .local v1, "old":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    aput-object p2, p1, v0

    .line 348
    iput-object v1, p2, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 349
    return-void
.end method

.method private copyTable([Lcom/trendmicro/hippo/ScriptableObject$Slot;[Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
    .locals 5
    .param p1, "oldSlots"    # [Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .param p2, "newSlots"    # [Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 328
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 329
    .local v2, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :goto_1
    if-eqz v2, :cond_0

    .line 330
    iget-object v3, v2, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 331
    .local v3, "nextSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    const/4 v4, 0x0

    iput-object v4, v2, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 332
    invoke-direct {p0, p2, v2}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->addKnownAbsentSlot([Lcom/trendmicro/hippo/ScriptableObject$Slot;Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    .line 333
    move-object v2, v3

    .line 334
    .end local v3    # "nextSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    goto :goto_1

    .line 328
    .end local v2    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 336
    :cond_1
    return-void
.end method

.method private createSlot(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;Lcom/trendmicro/hippo/ScriptableObject$Slot;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "indexOrHash"    # I
    .param p3, "accessType"    # Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;
    .param p4, "existingSlot"    # Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 158
    iget v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->count:I

    const/4 v1, 0x4

    if-nez v0, :cond_0

    .line 160
    new-array v0, v1, [Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iput-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    goto/16 :goto_6

    .line 161
    :cond_0
    if-eqz p4, :cond_b

    .line 164
    iget-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    array-length v0, v0

    invoke-static {v0, p2}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->getSlotIndex(II)I

    move-result v0

    .line 165
    .local v0, "insertPos":I
    iget-object v2, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    aget-object v2, v2, v0

    .line 166
    .local v2, "prev":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    move-object v3, v2

    .line 167
    .local v3, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :goto_0
    if-eqz v3, :cond_2

    .line 168
    iget v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    if-ne v4, p2, :cond_1

    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    if-eq v4, p1, :cond_2

    if-eqz p1, :cond_1

    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    .line 170
    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 171
    goto :goto_1

    .line 173
    :cond_1
    move-object v2, v3

    .line 174
    iget-object v3, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    goto :goto_0

    .line 177
    :cond_2
    :goto_1
    if-eqz v3, :cond_b

    .line 185
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-ne p3, v1, :cond_3

    instance-of v1, v3, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-nez v1, :cond_3

    .line 187
    new-instance v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    .line 188
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v4

    invoke-direct {v1, p1, p2, v4}, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;-><init>(Ljava/lang/Object;II)V

    .local v1, "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    goto :goto_2

    .line 189
    .end local v1    # "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_3
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->CONVERT_ACCESSOR_TO_DATA:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-ne p3, v1, :cond_9

    instance-of v1, v3, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-eqz v1, :cond_9

    .line 191
    new-instance v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v4

    invoke-direct {v1, p1, p2, v4}, Lcom/trendmicro/hippo/ScriptableObject$Slot;-><init>(Ljava/lang/Object;II)V

    .line 198
    .restart local v1    # "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :goto_2
    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    iput-object v4, v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->value:Ljava/lang/Object;

    .line 199
    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iput-object v4, v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 202
    iget-object v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-ne v3, v4, :cond_4

    .line 203
    iput-object v1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    goto :goto_4

    .line 205
    :cond_4
    iget-object v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 206
    .local v4, "ps":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :goto_3
    if-eqz v4, :cond_5

    iget-object v5, v4, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-eq v5, v3, :cond_5

    .line 207
    iget-object v4, v4, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    goto :goto_3

    .line 209
    :cond_5
    if-eqz v4, :cond_6

    .line 210
    iput-object v1, v4, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 213
    .end local v4    # "ps":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_6
    :goto_4
    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iput-object v4, v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 214
    iget-object v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->lastAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-ne v3, v4, :cond_7

    .line 215
    iput-object v1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->lastAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 219
    :cond_7
    if-ne v2, v3, :cond_8

    .line 220
    iget-object v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    aput-object v1, v4, v0

    goto :goto_5

    .line 222
    :cond_8
    iput-object v1, v2, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 224
    :goto_5
    return-object v1

    .line 192
    .end local v1    # "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_9
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_CONST:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-ne p3, v1, :cond_a

    .line 193
    const/4 v1, 0x0

    return-object v1

    .line 195
    :cond_a
    return-object v3

    .line 230
    .end local v0    # "insertPos":I
    .end local v2    # "prev":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .end local v3    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_b
    :goto_6
    iget v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->count:I

    add-int/lit8 v0, v0, 0x1

    mul-int/2addr v0, v1

    iget-object v1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    array-length v2, v1

    mul-int/lit8 v2, v2, 0x3

    if-le v0, v2, :cond_c

    .line 232
    array-length v0, v1

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 233
    .local v0, "newSlots":[Lcom/trendmicro/hippo/ScriptableObject$Slot;
    invoke-direct {p0, v1, v0}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->copyTable([Lcom/trendmicro/hippo/ScriptableObject$Slot;[Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    .line 234
    iput-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 237
    .end local v0    # "newSlots":[Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_c
    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_GETTER_SETTER:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    const/4 v1, 0x0

    if-ne p3, v0, :cond_d

    .line 238
    new-instance v0, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    invoke-direct {v0, p1, p2, v1}, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;-><init>(Ljava/lang/Object;II)V

    goto :goto_7

    .line 239
    :cond_d
    new-instance v0, Lcom/trendmicro/hippo/ScriptableObject$Slot;

    invoke-direct {v0, p1, p2, v1}, Lcom/trendmicro/hippo/ScriptableObject$Slot;-><init>(Ljava/lang/Object;II)V

    :goto_7
    nop

    .line 240
    .local v0, "newSlot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    sget-object v1, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->MODIFY_CONST:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-ne p3, v1, :cond_e

    .line 241
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->setAttributes(I)V

    .line 243
    :cond_e
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->insertNewSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    .line 244
    return-object v0
.end method

.method private static getSlotIndex(II)I
    .locals 1
    .param p0, "tableSize"    # I
    .param p1, "indexOrHash"    # I

    .line 356
    add-int/lit8 v0, p0, -0x1

    and-int/2addr v0, p1

    return v0
.end method

.method private insertNewSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
    .locals 1
    .param p1, "newSlot"    # Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 256
    iget v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->count:I

    .line 258
    iget-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->lastAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-eqz v0, :cond_0

    .line 259
    iput-object p1, v0, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 261
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-nez v0, :cond_1

    .line 262
    iput-object p1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 264
    :cond_1
    iput-object p1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->lastAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 266
    iget-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->addKnownAbsentSlot([Lcom/trendmicro/hippo/ScriptableObject$Slot;Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    .line 267
    return-void
.end method


# virtual methods
.method public addSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V
    .locals 1
    .param p1, "newSlot"    # Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 249
    iget-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-nez v0, :cond_0

    .line 250
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iput-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 252
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->insertNewSlot(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    .line 253
    return-void
.end method

.method public get(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .param p3, "accessType"    # Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    .line 110
    iget-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-nez v0, :cond_0

    sget-object v0, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->QUERY:Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;

    if-ne p3, v0, :cond_0

    .line 111
    const/4 v0, 0x0

    return-object v0

    .line 114
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    move v0, p2

    .line 115
    .local v0, "indexOrHash":I
    :goto_0
    const/4 v1, 0x0

    .line 117
    .local v1, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    iget-object v2, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-eqz v2, :cond_8

    .line 118
    array-length v2, v2

    invoke-static {v2, v0}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->getSlotIndex(II)I

    move-result v2

    .line 119
    .local v2, "slotIndex":I
    iget-object v3, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    aget-object v1, v3, v2

    .line 120
    :goto_1
    if-eqz v1, :cond_3

    .line 122
    iget-object v3, v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    .line 123
    .local v3, "skey":Ljava/lang/Object;
    iget v4, v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    if-ne v0, v4, :cond_2

    if-eq v3, p1, :cond_3

    if-eqz p1, :cond_2

    .line 125
    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 126
    goto :goto_2

    .line 121
    .end local v3    # "skey":Ljava/lang/Object;
    :cond_2
    iget-object v1, v1, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    goto :goto_1

    .line 129
    :cond_3
    :goto_2
    sget-object v3, Lcom/trendmicro/hippo/EmbeddedSlotMap$1;->$SwitchMap$com$trendmicro$hippo$ScriptableObject$SlotAccess:[I

    invoke-virtual {p3}, Lcom/trendmicro/hippo/ScriptableObject$SlotAccess;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x1

    if-eq v3, v4, :cond_7

    const/4 v4, 0x2

    if-eq v3, v4, :cond_6

    const/4 v4, 0x3

    if-eq v3, v4, :cond_6

    const/4 v4, 0x4

    if-eq v3, v4, :cond_5

    const/4 v4, 0x5

    if-eq v3, v4, :cond_4

    goto :goto_3

    .line 144
    :cond_4
    instance-of v3, v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-nez v3, :cond_8

    .line 145
    return-object v1

    .line 139
    :cond_5
    instance-of v3, v1, Lcom/trendmicro/hippo/ScriptableObject$GetterSlot;

    if-eqz v3, :cond_8

    .line 140
    return-object v1

    .line 134
    :cond_6
    if-eqz v1, :cond_8

    .line 135
    return-object v1

    .line 131
    :cond_7
    return-object v1

    .line 153
    .end local v2    # "slotIndex":I
    :cond_8
    :goto_3
    invoke-direct {p0, p1, v0, p3, v1}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->createSlot(Ljava/lang/Object;ILcom/trendmicro/hippo/ScriptableObject$SlotAccess;Lcom/trendmicro/hippo/ScriptableObject$Slot;)Lcom/trendmicro/hippo/ScriptableObject$Slot;

    move-result-object v2

    return-object v2
.end method

.method public isEmpty()Z
    .locals 1

    .line 67
    iget v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->count:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/trendmicro/hippo/ScriptableObject$Slot;",
            ">;"
        }
    .end annotation

    .line 72
    new-instance v0, Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;

    iget-object v1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/EmbeddedSlotMap$Iter;-><init>(Lcom/trendmicro/hippo/ScriptableObject$Slot;)V

    return-object v0
.end method

.method public query(Ljava/lang/Object;I)Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .locals 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .line 81
    iget-object v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 82
    return-object v1

    .line 85
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    move v0, p2

    .line 86
    .local v0, "indexOrHash":I
    :goto_0
    iget-object v2, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    array-length v2, v2

    invoke-static {v2, v0}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->getSlotIndex(II)I

    move-result v2

    .line 87
    .local v2, "slotIndex":I
    iget-object v3, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    aget-object v3, v3, v2

    .line 88
    .local v3, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :goto_1
    if-eqz v3, :cond_4

    .line 90
    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    .line 91
    .local v4, "skey":Ljava/lang/Object;
    iget v5, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    if-ne v0, v5, :cond_3

    if-eq v4, p1, :cond_2

    if-eqz p1, :cond_3

    .line 93
    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 94
    :cond_2
    return-object v3

    .line 89
    .end local v4    # "skey":Ljava/lang/Object;
    :cond_3
    iget-object v3, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    goto :goto_1

    .line 97
    .end local v3    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_4
    return-object v1
.end method

.method public remove(Ljava/lang/Object;I)V
    .locals 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .line 271
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, p2

    .line 273
    .local v0, "indexOrHash":I
    :goto_0
    iget v1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->count:I

    if-eqz v1, :cond_8

    .line 274
    iget-object v1, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    array-length v1, v1

    invoke-static {v1, v0}, Lcom/trendmicro/hippo/EmbeddedSlotMap;->getSlotIndex(II)I

    move-result v1

    .line 275
    .local v1, "slotIndex":I
    iget-object v2, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    aget-object v2, v2, v1

    .line 276
    .local v2, "prev":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    move-object v3, v2

    .line 277
    .local v3, "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :goto_1
    if-eqz v3, :cond_2

    .line 278
    iget v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->indexOrHash:I

    if-ne v4, v0, :cond_1

    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    if-eq v4, p1, :cond_2

    if-eqz p1, :cond_1

    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->name:Ljava/lang/Object;

    .line 280
    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 282
    goto :goto_2

    .line 284
    :cond_1
    move-object v2, v3

    .line 285
    iget-object v3, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    goto :goto_1

    .line 287
    :cond_2
    :goto_2
    if-eqz v3, :cond_8

    .line 289
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ScriptableObject$Slot;->getAttributes()I

    move-result v4

    and-int/lit8 v4, v4, 0x4

    if-eqz v4, :cond_4

    .line 290
    invoke-static {}, Lcom/trendmicro/hippo/Context;->getContext()Lcom/trendmicro/hippo/Context;

    move-result-object v4

    .line 291
    .local v4, "cx":Lcom/trendmicro/hippo/Context;
    invoke-virtual {v4}, Lcom/trendmicro/hippo/Context;->isStrictMode()Z

    move-result v5

    if-nez v5, :cond_3

    .line 294
    return-void

    .line 292
    :cond_3
    const-string v5, "msg.delete.property.with.configurable.false"

    invoke-static {v5, p1}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v5

    throw v5

    .line 296
    .end local v4    # "cx":Lcom/trendmicro/hippo/Context;
    :cond_4
    iget v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->count:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->count:I

    .line 298
    if-ne v2, v3, :cond_5

    .line 299
    iget-object v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->slots:[Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iget-object v5, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    aput-object v5, v4, v1

    goto :goto_3

    .line 301
    :cond_5
    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iput-object v4, v2, Lcom/trendmicro/hippo/ScriptableObject$Slot;->next:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 309
    :goto_3
    iget-object v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-ne v3, v4, :cond_6

    .line 310
    const/4 v2, 0x0

    .line 311
    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iput-object v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    goto :goto_5

    .line 313
    :cond_6
    iget-object v2, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->firstAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 314
    :goto_4
    iget-object v4, v2, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-eq v4, v3, :cond_7

    .line 315
    iget-object v2, v2, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    goto :goto_4

    .line 317
    :cond_7
    iget-object v4, v3, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    iput-object v4, v2, Lcom/trendmicro/hippo/ScriptableObject$Slot;->orderedNext:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 319
    :goto_5
    iget-object v4, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->lastAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    if-ne v3, v4, :cond_8

    .line 320
    iput-object v2, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->lastAdded:Lcom/trendmicro/hippo/ScriptableObject$Slot;

    .line 324
    .end local v1    # "slotIndex":I
    .end local v2    # "prev":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    .end local v3    # "slot":Lcom/trendmicro/hippo/ScriptableObject$Slot;
    :cond_8
    return-void
.end method

.method public size()I
    .locals 1

    .line 62
    iget v0, p0, Lcom/trendmicro/hippo/EmbeddedSlotMap;->count:I

    return v0
.end method
