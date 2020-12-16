.class public Lcom/trendmicro/hippo/ObjToIntMap;
.super Ljava/lang/Object;
.source "ObjToIntMap.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/ObjToIntMap$Iterator;
    }
.end annotation


# static fields
.field private static final A:I = -0x61c88647

.field private static final DELETED:Ljava/lang/Object;

.field private static final check:Z = false

.field private static final serialVersionUID:J = -0x1567117278d454baL


# instance fields
.field private keyCount:I

.field private transient keys:[Ljava/lang/Object;

.field private transient occupiedCount:I

.field private power:I

.field private transient values:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 432
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/ObjToIntMap;->DELETED:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 93
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/ObjToIntMap;-><init>(I)V

    .line 94
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1, "keyCountHint"    # I

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 99
    :cond_0
    mul-int/lit8 v0, p1, 0x4

    div-int/lit8 v0, v0, 0x3

    .line 101
    .local v0, "minimalCapacity":I
    const/4 v1, 0x2

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x1

    shl-int/2addr v2, v1

    if-ge v2, v0, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 102
    :cond_1
    iput v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    .line 104
    return-void
.end method

.method static synthetic access$000()Ljava/lang/Object;
    .locals 1

    .line 24
    sget-object v0, Lcom/trendmicro/hippo/ObjToIntMap;->DELETED:Ljava/lang/Object;

    return-object v0
.end method

.method private ensureIndex(Ljava/lang/Object;)I
    .locals 12
    .param p1, "key"    # Ljava/lang/Object;

    .line 328
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 329
    .local v0, "hash":I
    const/4 v1, -0x1

    .line 330
    .local v1, "index":I
    const/4 v2, -0x1

    .line 331
    .local v2, "firstDeleted":I
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    const/4 v4, 0x1

    if-eqz v3, :cond_7

    .line 332
    const v5, -0x61c88647

    mul-int/2addr v5, v0

    .line 333
    .local v5, "fraction":I
    iget v6, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    rsub-int/lit8 v7, v6, 0x20

    ushr-int v1, v5, v7

    .line 334
    aget-object v3, v3, v1

    .line 335
    .local v3, "test":Ljava/lang/Object;
    if-eqz v3, :cond_7

    .line 336
    shl-int v6, v4, v6

    .line 337
    .local v6, "N":I
    if-eq v3, p1, :cond_6

    iget-object v7, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    add-int v8, v6, v1

    aget v7, v7, v8

    if-ne v7, v0, :cond_0

    .line 338
    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_2

    .line 342
    :cond_0
    sget-object v7, Lcom/trendmicro/hippo/ObjToIntMap;->DELETED:Ljava/lang/Object;

    if-ne v3, v7, :cond_1

    .line 343
    move v2, v1

    .line 347
    :cond_1
    add-int/lit8 v7, v6, -0x1

    .line 348
    .local v7, "mask":I
    iget v8, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    invoke-static {v5, v7, v8}, Lcom/trendmicro/hippo/ObjToIntMap;->tableLookupStep(III)I

    move-result v8

    .line 349
    .local v8, "step":I
    const/4 v9, 0x0

    .line 355
    .local v9, "n":I
    :cond_2
    :goto_0
    add-int v10, v1, v8

    and-int v1, v10, v7

    .line 356
    iget-object v10, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aget-object v3, v10, v1

    .line 357
    if-nez v3, :cond_3

    .line 358
    goto :goto_3

    .line 360
    :cond_3
    if-eq v3, p1, :cond_5

    iget-object v10, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    add-int v11, v6, v1

    aget v10, v10, v11

    if-ne v10, v0, :cond_4

    .line 361
    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    goto :goto_1

    .line 365
    :cond_4
    sget-object v10, Lcom/trendmicro/hippo/ObjToIntMap;->DELETED:Ljava/lang/Object;

    if-ne v3, v10, :cond_2

    if-gez v2, :cond_2

    .line 366
    move v2, v1

    goto :goto_0

    .line 363
    :cond_5
    :goto_1
    return v1

    .line 340
    .end local v7    # "mask":I
    .end local v8    # "step":I
    .end local v9    # "n":I
    :cond_6
    :goto_2
    return v1

    .line 374
    .end local v3    # "test":Ljava/lang/Object;
    .end local v5    # "fraction":I
    .end local v6    # "N":I
    :cond_7
    :goto_3
    if-ltz v2, :cond_8

    .line 375
    move v1, v2

    goto :goto_4

    .line 379
    :cond_8
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    if-eqz v3, :cond_a

    iget v3, p0, Lcom/trendmicro/hippo/ObjToIntMap;->occupiedCount:I

    mul-int/lit8 v5, v3, 0x4

    iget v6, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    shl-int v6, v4, v6

    mul-int/lit8 v6, v6, 0x3

    if-lt v5, v6, :cond_9

    goto :goto_5

    .line 384
    :cond_9
    add-int/2addr v3, v4

    iput v3, p0, Lcom/trendmicro/hippo/ObjToIntMap;->occupiedCount:I

    .line 386
    :goto_4
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aput-object p1, v3, v1

    .line 387
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    iget v5, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    shl-int v5, v4, v5

    add-int/2addr v5, v1

    aput v0, v3, v5

    .line 388
    iget v3, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    .line 389
    return v1

    .line 381
    :cond_a
    :goto_5
    invoke-direct {p0}, Lcom/trendmicro/hippo/ObjToIntMap;->rehashTable()V

    .line 382
    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ObjToIntMap;->insertNewKey(Ljava/lang/Object;I)I

    move-result v3

    return v3
.end method

.method private findIndex(Ljava/lang/Object;)I
    .locals 10
    .param p1, "key"    # Ljava/lang/Object;

    .line 228
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    if-eqz v0, :cond_5

    .line 229
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 230
    .local v0, "hash":I
    const v1, -0x61c88647

    mul-int/2addr v1, v0

    .line 231
    .local v1, "fraction":I
    iget v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    rsub-int/lit8 v3, v2, 0x20

    ushr-int v3, v1, v3

    .line 232
    .local v3, "index":I
    iget-object v4, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aget-object v4, v4, v3

    .line 233
    .local v4, "test":Ljava/lang/Object;
    if-eqz v4, :cond_5

    .line 234
    const/4 v5, 0x1

    shl-int v2, v5, v2

    .line 235
    .local v2, "N":I
    if-eq v4, p1, :cond_4

    iget-object v5, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    add-int v6, v2, v3

    aget v5, v5, v6

    if-ne v5, v0, :cond_0

    .line 236
    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 241
    :cond_0
    add-int/lit8 v5, v2, -0x1

    .line 242
    .local v5, "mask":I
    iget v6, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    invoke-static {v1, v5, v6}, Lcom/trendmicro/hippo/ObjToIntMap;->tableLookupStep(III)I

    move-result v6

    .line 243
    .local v6, "step":I
    const/4 v7, 0x0

    .line 249
    .local v7, "n":I
    :cond_1
    add-int v8, v3, v6

    and-int v3, v8, v5

    .line 250
    iget-object v8, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aget-object v4, v8, v3

    .line 251
    if-nez v4, :cond_2

    .line 252
    goto :goto_1

    .line 254
    :cond_2
    if-eq v4, p1, :cond_3

    iget-object v8, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    add-int v9, v2, v3

    aget v8, v8, v9

    if-ne v8, v0, :cond_1

    .line 255
    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 257
    :cond_3
    return v3

    .line 238
    .end local v5    # "mask":I
    .end local v6    # "step":I
    .end local v7    # "n":I
    :cond_4
    :goto_0
    return v3

    .line 262
    .end local v0    # "hash":I
    .end local v1    # "fraction":I
    .end local v2    # "N":I
    .end local v3    # "index":I
    .end local v4    # "test":Ljava/lang/Object;
    :cond_5
    :goto_1
    const/4 v0, -0x1

    return v0
.end method

.method private insertNewKey(Ljava/lang/Object;I)I
    .locals 8
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "hash"    # I

    .line 270
    const v0, -0x61c88647

    mul-int/2addr v0, p2

    .line 271
    .local v0, "fraction":I
    iget v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    rsub-int/lit8 v2, v1, 0x20

    ushr-int v2, v0, v2

    .line 272
    .local v2, "index":I
    const/4 v3, 0x1

    shl-int v4, v3, v1

    .line 273
    .local v4, "N":I
    iget-object v5, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aget-object v5, v5, v2

    if-eqz v5, :cond_1

    .line 274
    add-int/lit8 v5, v4, -0x1

    .line 275
    .local v5, "mask":I
    invoke-static {v0, v5, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->tableLookupStep(III)I

    move-result v1

    .line 276
    .local v1, "step":I
    move v6, v2

    .line 279
    .local v6, "firstIndex":I
    :cond_0
    add-int v7, v2, v1

    and-int v2, v7, v5

    .line 281
    iget-object v7, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aget-object v7, v7, v2

    if-nez v7, :cond_0

    .line 283
    .end local v1    # "step":I
    .end local v5    # "mask":I
    .end local v6    # "firstIndex":I
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aput-object p1, v1, v2

    .line 284
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    add-int v5, v4, v2

    aput p2, v1, v5

    .line 285
    iget v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->occupiedCount:I

    add-int/2addr v1, v3

    iput v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->occupiedCount:I

    .line 286
    iget v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    add-int/2addr v1, v3

    iput v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    .line 288
    return v2
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 8
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 411
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 413
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    .line 414
    .local v0, "writtenKeyCount":I
    if-eqz v0, :cond_0

    .line 415
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    .line 416
    iget v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    const/4 v2, 0x1

    shl-int v1, v2, v1

    .line 417
    .local v1, "N":I
    new-array v2, v1, [Ljava/lang/Object;

    iput-object v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    .line 418
    mul-int/lit8 v2, v1, 0x2

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    .line 419
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eq v2, v0, :cond_0

    .line 420
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    .line 421
    .local v3, "key":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v4

    .line 422
    .local v4, "hash":I
    invoke-direct {p0, v3, v4}, Lcom/trendmicro/hippo/ObjToIntMap;->insertNewKey(Ljava/lang/Object;I)I

    move-result v5

    .line 423
    .local v5, "index":I
    iget-object v6, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v7

    aput v7, v6, v5

    .line 419
    .end local v3    # "key":Ljava/lang/Object;
    .end local v4    # "hash":I
    .end local v5    # "index":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 426
    .end local v1    # "N":I
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method private rehashTable()V
    .locals 11

    .line 292
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 295
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    shl-int v0, v1, v0

    .line 296
    .local v0, "N":I
    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    .line 297
    mul-int/lit8 v1, v0, 0x2

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    .line 298
    .end local v0    # "N":I
    goto :goto_1

    .line 301
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    mul-int/lit8 v0, v0, 0x2

    iget v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->occupiedCount:I

    if-lt v0, v2, :cond_1

    .line 303
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    .line 305
    :cond_1
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->power:I

    shl-int v0, v1, v0

    .line 306
    .restart local v0    # "N":I
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    .line 307
    .local v1, "oldKeys":[Ljava/lang/Object;
    iget-object v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    .line 308
    .local v2, "oldValues":[I
    array-length v3, v1

    .line 309
    .local v3, "oldN":I
    new-array v4, v0, [Ljava/lang/Object;

    iput-object v4, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    .line 310
    mul-int/lit8 v4, v0, 0x2

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    .line 312
    iget v4, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    .line 313
    .local v4, "remaining":I
    const/4 v5, 0x0

    iput v5, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    iput v5, p0, Lcom/trendmicro/hippo/ObjToIntMap;->occupiedCount:I

    .line 314
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-eqz v4, :cond_3

    .line 315
    aget-object v6, v1, v5

    .line 316
    .local v6, "key":Ljava/lang/Object;
    if-eqz v6, :cond_2

    sget-object v7, Lcom/trendmicro/hippo/ObjToIntMap;->DELETED:Ljava/lang/Object;

    if-eq v6, v7, :cond_2

    .line 317
    add-int v7, v3, v5

    aget v7, v2, v7

    .line 318
    .local v7, "keyHash":I
    invoke-direct {p0, v6, v7}, Lcom/trendmicro/hippo/ObjToIntMap;->insertNewKey(Ljava/lang/Object;I)I

    move-result v8

    .line 319
    .local v8, "index":I
    iget-object v9, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    aget v10, v2, v5

    aput v10, v9, v8

    .line 320
    add-int/lit8 v4, v4, -0x1

    .line 314
    .end local v6    # "key":Ljava/lang/Object;
    .end local v7    # "keyHash":I
    .end local v8    # "index":I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 324
    .end local v0    # "N":I
    .end local v1    # "oldKeys":[Ljava/lang/Object;
    .end local v2    # "oldValues":[I
    .end local v3    # "oldN":I
    .end local v4    # "remaining":I
    .end local v5    # "i":I
    :cond_3
    :goto_1
    return-void
.end method

.method private static tableLookupStep(III)I
    .locals 2
    .param p0, "fraction"    # I
    .param p1, "mask"    # I
    .param p2, "power"    # I

    .line 220
    mul-int/lit8 v0, p2, 0x2

    rsub-int/lit8 v0, v0, 0x20

    .line 221
    .local v0, "shift":I
    if-ltz v0, :cond_0

    .line 222
    ushr-int v1, p0, v0

    and-int/2addr v1, p1

    or-int/lit8 v1, v1, 0x1

    return v1

    .line 224
    :cond_0
    neg-int v1, v0

    ushr-int v1, p1, v1

    and-int/2addr v1, p0

    or-int/lit8 v1, v1, 0x1

    return v1
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 4
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 395
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 397
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    .line 398
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eqz v0, :cond_1

    .line 399
    iget-object v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aget-object v2, v2, v1

    .line 400
    .local v2, "key":Ljava/lang/Object;
    if-eqz v2, :cond_0

    sget-object v3, Lcom/trendmicro/hippo/ObjToIntMap;->DELETED:Ljava/lang/Object;

    if-eq v2, v3, :cond_0

    .line 401
    add-int/lit8 v0, v0, -0x1

    .line 402
    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 403
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    aget v3, v3, v1

    invoke-virtual {p1, v3}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 398
    .end local v2    # "key":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 406
    .end local v1    # "i":I
    :cond_1
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 3

    .line 180
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    array-length v0, v0

    .line 181
    .local v0, "i":I
    :goto_0
    if-eqz v0, :cond_0

    .line 182
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    const/4 v2, 0x0

    aput-object v2, v1, v0

    goto :goto_0

    .line 184
    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    .line 185
    iput v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->occupiedCount:I

    .line 186
    return-void
.end method

.method public get(Ljava/lang/Object;I)I
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "defaultValue"    # I

    .line 124
    if-nez p1, :cond_0

    sget-object p1, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    .line 125
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ObjToIntMap;->findIndex(Ljava/lang/Object;)I

    move-result v0

    .line 126
    .local v0, "index":I
    if-ltz v0, :cond_1

    .line 127
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    aget v1, v1, v0

    return v1

    .line 129
    :cond_1
    return p2
.end method

.method public getExisting(Ljava/lang/Object;)I
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .line 138
    if-nez p1, :cond_0

    sget-object p1, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    .line 139
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ObjToIntMap;->findIndex(Ljava/lang/Object;)I

    move-result v0

    .line 140
    .local v0, "index":I
    if-ltz v0, :cond_1

    .line 141
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    aget v1, v1, v0

    return v1

    .line 144
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 145
    const/4 v1, 0x0

    return v1
.end method

.method public getKeys([Ljava/lang/Object;I)V
    .locals 4
    .param p1, "array"    # [Ljava/lang/Object;
    .param p2, "offset"    # I

    .line 207
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    .line 208
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eqz v0, :cond_2

    .line 209
    iget-object v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aget-object v2, v2, v1

    .line 210
    .local v2, "key":Ljava/lang/Object;
    if-eqz v2, :cond_1

    sget-object v3, Lcom/trendmicro/hippo/ObjToIntMap;->DELETED:Ljava/lang/Object;

    if-eq v2, v3, :cond_1

    .line 211
    sget-object v3, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    if-ne v2, v3, :cond_0

    const/4 v2, 0x0

    .line 212
    :cond_0
    aput-object v2, p1, p2

    .line 213
    add-int/lit8 p2, p2, 0x1

    .line 214
    add-int/lit8 v0, v0, -0x1

    .line 208
    .end local v2    # "key":Ljava/lang/Object;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 217
    .end local v1    # "i":I
    :cond_2
    return-void
.end method

.method public getKeys()[Ljava/lang/Object;
    .locals 2

    .line 201
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    new-array v0, v0, [Ljava/lang/Object;

    .line 202
    .local v0, "array":[Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/ObjToIntMap;->getKeys([Ljava/lang/Object;I)V

    .line 203
    return-object v0
.end method

.method public has(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 115
    if-nez p1, :cond_0

    sget-object p1, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    .line 116
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ObjToIntMap;->findIndex(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method final initIterator(Lcom/trendmicro/hippo/ObjToIntMap$Iterator;)V
    .locals 3
    .param p1, "i"    # Lcom/trendmicro/hippo/ObjToIntMap$Iterator;

    .line 196
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    iget v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    invoke-virtual {p1, v0, v1, v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->init([Ljava/lang/Object;[II)V

    .line 197
    return-void
.end method

.method public intern(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "keyArg"    # Ljava/lang/Object;

    .line 160
    const/4 v0, 0x0

    .line 161
    .local v0, "nullKey":Z
    if-nez p1, :cond_0

    .line 162
    const/4 v0, 0x1

    .line 163
    sget-object p1, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    .line 165
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ObjToIntMap;->ensureIndex(Ljava/lang/Object;)I

    move-result v1

    .line 166
    .local v1, "index":I
    iget-object v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    const/4 v3, 0x0

    aput v3, v2, v1

    .line 167
    if-eqz v0, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    aget-object v2, v2, v1

    :goto_0
    return-object v2
.end method

.method public isEmpty()Z
    .locals 1

    .line 107
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public newIterator()Lcom/trendmicro/hippo/ObjToIntMap$Iterator;
    .locals 1

    .line 189
    new-instance v0, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;-><init>(Lcom/trendmicro/hippo/ObjToIntMap;)V

    return-object v0
.end method

.method public put(Ljava/lang/Object;I)V
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # I

    .line 149
    if-nez p1, :cond_0

    sget-object p1, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    .line 150
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ObjToIntMap;->ensureIndex(Ljava/lang/Object;)I

    move-result v0

    .line 151
    .local v0, "index":I
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->values:[I

    aput p2, v1, v0

    .line 152
    return-void
.end method

.method public remove(Ljava/lang/Object;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .line 171
    if-nez p1, :cond_0

    sget-object p1, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    .line 172
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ObjToIntMap;->findIndex(Ljava/lang/Object;)I

    move-result v0

    .line 173
    .local v0, "index":I
    if-ltz v0, :cond_1

    .line 174
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keys:[Ljava/lang/Object;

    sget-object v2, Lcom/trendmicro/hippo/ObjToIntMap;->DELETED:Ljava/lang/Object;

    aput-object v2, v1, v0

    .line 175
    iget v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    .line 177
    :cond_1
    return-void
.end method

.method public size()I
    .locals 1

    .line 111
    iget v0, p0, Lcom/trendmicro/hippo/ObjToIntMap;->keyCount:I

    return v0
.end method
