.class public Lcom/trendmicro/hippo/UintMap;
.super Ljava/lang/Object;
.source "UintMap.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final A:I = -0x61c88647

.field private static final DELETED:I = -0x2

.field private static final EMPTY:I = -0x1

.field private static final check:Z = false

.field private static final serialVersionUID:J = 0x3ae1178bbc3ee17cL


# instance fields
.field private transient ivaluesShift:I

.field private keyCount:I

.field private transient keys:[I

.field private transient occupiedCount:I

.field private power:I

.field private transient values:[Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/UintMap;-><init>(I)V

    .line 33
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1, "initialCapacity"    # I

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 38
    :cond_0
    mul-int/lit8 v0, p1, 0x4

    div-int/lit8 v0, v0, 0x3

    .line 40
    .local v0, "minimalCapacity":I
    const/4 v1, 0x2

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x1

    shl-int/2addr v2, v1

    if-ge v2, v0, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 41
    :cond_1
    iput v1, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    .line 43
    return-void
.end method

.method private ensureIndex(IZ)I
    .locals 12
    .param p1, "key"    # I
    .param p2, "intType"    # Z

    .line 288
    const/4 v0, -0x1

    .line 289
    .local v0, "index":I
    const/4 v1, -0x1

    .line 290
    .local v1, "firstDeleted":I
    iget-object v2, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    .line 291
    .local v2, "keys":[I
    const/4 v3, 0x1

    if-eqz v2, :cond_5

    .line 292
    const v4, -0x61c88647

    mul-int/2addr v4, p1

    .line 293
    .local v4, "fraction":I
    iget v5, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    rsub-int/lit8 v5, v5, 0x20

    ushr-int v0, v4, v5

    .line 294
    aget v5, v2, v0

    .line 295
    .local v5, "entry":I
    if-ne v5, p1, :cond_0

    return v0

    .line 296
    :cond_0
    const/4 v6, -0x1

    if-eq v5, v6, :cond_5

    .line 297
    const/4 v7, -0x2

    if-ne v5, v7, :cond_1

    move v1, v0

    .line 299
    :cond_1
    iget v8, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    shl-int v9, v3, v8

    sub-int/2addr v9, v3

    .line 300
    .local v9, "mask":I
    invoke-static {v4, v9, v8}, Lcom/trendmicro/hippo/UintMap;->tableLookupStep(III)I

    move-result v8

    .line 301
    .local v8, "step":I
    const/4 v10, 0x0

    .line 307
    .local v10, "n":I
    :cond_2
    add-int v11, v0, v8

    and-int v0, v11, v9

    .line 308
    aget v5, v2, v0

    .line 309
    if-ne v5, p1, :cond_3

    return v0

    .line 310
    :cond_3
    if-ne v5, v7, :cond_4

    if-gez v1, :cond_4

    .line 311
    move v1, v0

    .line 313
    :cond_4
    if-ne v5, v6, :cond_2

    .line 319
    .end local v4    # "fraction":I
    .end local v5    # "entry":I
    .end local v8    # "step":I
    .end local v9    # "mask":I
    .end local v10    # "n":I
    :cond_5
    if-ltz v1, :cond_6

    .line 320
    move v0, v1

    goto :goto_0

    .line 324
    :cond_6
    if-eqz v2, :cond_8

    iget v4, p0, Lcom/trendmicro/hippo/UintMap;->occupiedCount:I

    mul-int/lit8 v5, v4, 0x4

    iget v6, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    shl-int v6, v3, v6

    mul-int/lit8 v6, v6, 0x3

    if-lt v5, v6, :cond_7

    goto :goto_1

    .line 329
    :cond_7
    add-int/2addr v4, v3

    iput v4, p0, Lcom/trendmicro/hippo/UintMap;->occupiedCount:I

    .line 331
    :goto_0
    aput p1, v2, v0

    .line 332
    iget v4, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    add-int/2addr v4, v3

    iput v4, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 333
    return v0

    .line 326
    :cond_8
    :goto_1
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/UintMap;->rehashTable(Z)V

    .line 327
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/UintMap;->insertNewKey(I)I

    move-result v3

    return v3
.end method

.method private findIndex(I)I
    .locals 9
    .param p1, "key"    # I

    .line 195
    iget-object v0, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    .line 196
    .local v0, "keys":[I
    const/4 v1, -0x1

    if-eqz v0, :cond_3

    .line 197
    const v2, -0x61c88647

    mul-int/2addr v2, p1

    .line 198
    .local v2, "fraction":I
    iget v3, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    rsub-int/lit8 v4, v3, 0x20

    ushr-int v4, v2, v4

    .line 199
    .local v4, "index":I
    aget v5, v0, v4

    .line 200
    .local v5, "entry":I
    if-ne v5, p1, :cond_0

    return v4

    .line 201
    :cond_0
    if-eq v5, v1, :cond_3

    .line 203
    const/4 v6, 0x1

    shl-int v7, v6, v3

    sub-int/2addr v7, v6

    .line 204
    .local v7, "mask":I
    invoke-static {v2, v7, v3}, Lcom/trendmicro/hippo/UintMap;->tableLookupStep(III)I

    move-result v3

    .line 205
    .local v3, "step":I
    const/4 v6, 0x0

    .line 211
    .local v6, "n":I
    :cond_1
    add-int v8, v4, v3

    and-int v4, v8, v7

    .line 212
    aget v5, v0, v4

    .line 213
    if-ne v5, p1, :cond_2

    return v4

    .line 214
    :cond_2
    if-ne v5, v1, :cond_1

    .line 217
    .end local v2    # "fraction":I
    .end local v3    # "step":I
    .end local v4    # "index":I
    .end local v5    # "entry":I
    .end local v6    # "n":I
    .end local v7    # "mask":I
    :cond_3
    return v1
.end method

.method private insertNewKey(I)I
    .locals 9
    .param p1, "key"    # I

    .line 225
    iget-object v0, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    .line 226
    .local v0, "keys":[I
    const v1, -0x61c88647

    mul-int/2addr v1, p1

    .line 227
    .local v1, "fraction":I
    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    rsub-int/lit8 v3, v2, 0x20

    ushr-int v3, v1, v3

    .line 228
    .local v3, "index":I
    aget v4, v0, v3

    const/4 v5, -0x1

    const/4 v6, 0x1

    if-eq v4, v5, :cond_1

    .line 229
    shl-int v4, v6, v2

    sub-int/2addr v4, v6

    .line 230
    .local v4, "mask":I
    invoke-static {v1, v4, v2}, Lcom/trendmicro/hippo/UintMap;->tableLookupStep(III)I

    move-result v2

    .line 231
    .local v2, "step":I
    move v7, v3

    .line 234
    .local v7, "firstIndex":I
    :cond_0
    add-int v8, v3, v2

    and-int v3, v8, v4

    .line 236
    aget v8, v0, v3

    if-ne v8, v5, :cond_0

    .line 238
    .end local v2    # "step":I
    .end local v4    # "mask":I
    .end local v7    # "firstIndex":I
    :cond_1
    aput p1, v0, v3

    .line 239
    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->occupiedCount:I

    add-int/2addr v2, v6

    iput v2, p0, Lcom/trendmicro/hippo/UintMap;->occupiedCount:I

    .line 240
    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    add-int/2addr v2, v6

    iput v2, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 241
    return v3
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 10
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 367
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 369
    iget v0, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 370
    .local v0, "writtenKeyCount":I
    if-eqz v0, :cond_5

    .line 371
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 372
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v1

    .line 373
    .local v1, "hasIntValues":Z
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v2

    .line 375
    .local v2, "hasObjectValues":Z
    iget v3, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    const/4 v4, 0x1

    shl-int v3, v4, v3

    .line 376
    .local v3, "N":I
    if-eqz v1, :cond_0

    .line 377
    mul-int/lit8 v4, v3, 0x2

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    .line 378
    iput v3, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    goto :goto_0

    .line 380
    :cond_0
    new-array v4, v3, [I

    iput-object v4, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    .line 382
    :goto_0
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-eq v4, v3, :cond_1

    .line 383
    iget-object v5, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    const/4 v6, -0x1

    aput v6, v5, v4

    .line 382
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 385
    .end local v4    # "i":I
    :cond_1
    if-eqz v2, :cond_2

    .line 386
    new-array v4, v3, [Ljava/lang/Object;

    iput-object v4, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    .line 388
    :cond_2
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_2
    if-eq v4, v0, :cond_5

    .line 389
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v5

    .line 390
    .local v5, "key":I
    invoke-direct {p0, v5}, Lcom/trendmicro/hippo/UintMap;->insertNewKey(I)I

    move-result v6

    .line 391
    .local v6, "index":I
    if-eqz v1, :cond_3

    .line 392
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v7

    .line 393
    .local v7, "ivalue":I
    iget-object v8, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    iget v9, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    add-int/2addr v9, v6

    aput v7, v8, v9

    .line 395
    .end local v7    # "ivalue":I
    :cond_3
    if-eqz v2, :cond_4

    .line 396
    iget-object v7, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v8

    aput-object v8, v7, v6

    .line 388
    .end local v5    # "key":I
    .end local v6    # "index":I
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 400
    .end local v1    # "hasIntValues":Z
    .end local v2    # "hasObjectValues":Z
    .end local v3    # "N":I
    .end local v4    # "i":I
    :cond_5
    return-void
.end method

.method private rehashTable(Z)V
    .locals 13
    .param p1, "ensureIntSpace"    # Z

    .line 245
    iget-object v0, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 247
    iget v0, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    mul-int/lit8 v0, v0, 0x2

    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->occupiedCount:I

    if-lt v0, v2, :cond_0

    .line 249
    iget v0, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    .line 252
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    shl-int v0, v1, v0

    .line 253
    .local v0, "N":I
    iget-object v1, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    .line 254
    .local v1, "old":[I
    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    .line 255
    .local v2, "oldShift":I
    if-nez v2, :cond_1

    if-nez p1, :cond_1

    .line 256
    new-array v3, v0, [I

    iput-object v3, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    goto :goto_0

    .line 259
    :cond_1
    iput v0, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    mul-int/lit8 v3, v0, 0x2

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    .line 261
    :goto_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    const/4 v4, -0x1

    if-eq v3, v0, :cond_2

    iget-object v5, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    aput v4, v5, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 263
    .end local v3    # "i":I
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    .line 264
    .local v3, "oldValues":[Ljava/lang/Object;
    if-eqz v3, :cond_3

    new-array v5, v0, [Ljava/lang/Object;

    iput-object v5, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    .line 266
    :cond_3
    iget v5, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 267
    .local v5, "oldCount":I
    const/4 v6, 0x0

    iput v6, p0, Lcom/trendmicro/hippo/UintMap;->occupiedCount:I

    .line 268
    if-eqz v5, :cond_7

    .line 269
    iput v6, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 270
    const/4 v6, 0x0

    .local v6, "i":I
    move v7, v5

    .local v7, "remaining":I
    :goto_2
    if-eqz v7, :cond_7

    .line 271
    aget v8, v1, v6

    .line 272
    .local v8, "key":I
    if-eq v8, v4, :cond_6

    const/4 v9, -0x2

    if-eq v8, v9, :cond_6

    .line 273
    invoke-direct {p0, v8}, Lcom/trendmicro/hippo/UintMap;->insertNewKey(I)I

    move-result v9

    .line 274
    .local v9, "index":I
    if-eqz v3, :cond_4

    .line 275
    iget-object v10, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    aget-object v11, v3, v6

    aput-object v11, v10, v9

    .line 277
    :cond_4
    if-eqz v2, :cond_5

    .line 278
    iget-object v10, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    iget v11, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    add-int/2addr v11, v9

    add-int v12, v2, v6

    aget v12, v1, v12

    aput v12, v10, v11

    .line 280
    :cond_5
    add-int/lit8 v7, v7, -0x1

    .line 270
    .end local v8    # "key":I
    .end local v9    # "index":I
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 284
    .end local v6    # "i":I
    .end local v7    # "remaining":I
    :cond_7
    return-void
.end method

.method private static tableLookupStep(III)I
    .locals 2
    .param p0, "fraction"    # I
    .param p1, "mask"    # I
    .param p2, "power"    # I

    .line 187
    mul-int/lit8 v0, p2, 0x2

    rsub-int/lit8 v0, v0, 0x20

    .line 188
    .local v0, "shift":I
    if-ltz v0, :cond_0

    .line 189
    ushr-int v1, p0, v0

    and-int/2addr v1, p1

    or-int/lit8 v1, v1, 0x1

    return v1

    .line 191
    :cond_0
    neg-int v1, v0

    ushr-int v1, p1, v1

    and-int/2addr v1, p0

    or-int/lit8 v1, v1, 0x1

    return v1
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 7
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 339
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 341
    iget v0, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 342
    .local v0, "count":I
    if-eqz v0, :cond_4

    .line 343
    iget v1, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    .line 344
    .local v1, "hasIntValues":Z
    :goto_0
    iget-object v4, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    if-eqz v4, :cond_1

    move v2, v3

    .line 345
    .local v2, "hasObjectValues":Z
    :cond_1
    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 346
    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 348
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-eqz v0, :cond_4

    .line 349
    iget-object v4, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    aget v4, v4, v3

    .line 350
    .local v4, "key":I
    const/4 v5, -0x1

    if-eq v4, v5, :cond_3

    const/4 v5, -0x2

    if-eq v4, v5, :cond_3

    .line 351
    add-int/lit8 v0, v0, -0x1

    .line 352
    invoke-virtual {p1, v4}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 353
    if-eqz v1, :cond_2

    .line 354
    iget-object v5, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    iget v6, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    add-int/2addr v6, v3

    aget v5, v5, v6

    invoke-virtual {p1, v5}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 356
    :cond_2
    if-eqz v2, :cond_3

    .line 357
    iget-object v5, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    aget-object v5, v5, v3

    invoke-virtual {p1, v5}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 348
    .end local v4    # "key":I
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 362
    .end local v1    # "hasIntValues":Z
    .end local v2    # "hasObjectValues":Z
    .end local v3    # "i":I
    :cond_4
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 4

    .line 156
    iget v0, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    const/4 v1, 0x1

    shl-int v0, v1, v0

    .line 157
    .local v0, "N":I
    iget-object v1, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    if-eqz v1, :cond_1

    .line 158
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 159
    iget-object v2, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    const/4 v3, -0x1

    aput v3, v2, v1

    .line 158
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 161
    .end local v1    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    if-eqz v1, :cond_1

    .line 162
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    if-eq v1, v0, :cond_1

    .line 163
    iget-object v2, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v3, v2, v1

    .line 162
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 167
    .end local v1    # "i":I
    :cond_1
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    .line 168
    iput v1, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 169
    iput v1, p0, Lcom/trendmicro/hippo/UintMap;->occupiedCount:I

    .line 170
    return-void
.end method

.method public getExistingInt(I)I
    .locals 3
    .param p1, "key"    # I

    .line 96
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 97
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/UintMap;->findIndex(I)I

    move-result v0

    .line 98
    .local v0, "index":I
    const/4 v1, 0x0

    if-ltz v0, :cond_2

    .line 99
    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    if-eqz v2, :cond_1

    .line 100
    iget-object v1, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    add-int/2addr v2, v0

    aget v1, v1, v2

    return v1

    .line 102
    :cond_1
    return v1

    .line 105
    :cond_2
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 106
    return v1
.end method

.method public getInt(II)I
    .locals 3
    .param p1, "key"    # I
    .param p2, "defaultValue"    # I

    .line 78
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 79
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/UintMap;->findIndex(I)I

    move-result v0

    .line 80
    .local v0, "index":I
    if-ltz v0, :cond_2

    .line 81
    iget v1, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    if-eqz v1, :cond_1

    .line 82
    iget-object v2, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    add-int/2addr v1, v0

    aget v1, v2, v1

    return v1

    .line 84
    :cond_1
    const/4 v1, 0x0

    return v1

    .line 86
    :cond_2
    return p2
.end method

.method public getKeys()[I
    .locals 6

    .line 174
    iget-object v0, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    .line 175
    .local v0, "keys":[I
    iget v1, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 176
    .local v1, "n":I
    new-array v2, v1, [I

    .line 177
    .local v2, "result":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-eqz v1, :cond_1

    .line 178
    aget v4, v0, v3

    .line 179
    .local v4, "entry":I
    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    const/4 v5, -0x2

    if-eq v4, v5, :cond_0

    .line 180
    add-int/lit8 v1, v1, -0x1

    aput v4, v2, v1

    .line 177
    .end local v4    # "entry":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 183
    .end local v3    # "i":I
    :cond_1
    return-object v2
.end method

.method public getObject(I)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # I

    .line 63
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 65
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/UintMap;->findIndex(I)I

    move-result v0

    .line 66
    .local v0, "index":I
    if-ltz v0, :cond_1

    .line 67
    iget-object v1, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    aget-object v1, v1, v0

    return-object v1

    .line 70
    .end local v0    # "index":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public has(I)Z
    .locals 1
    .param p1, "key"    # I

    .line 54
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 55
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/UintMap;->findIndex(I)I

    move-result v0

    if-ltz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 46
    iget v0, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(II)V
    .locals 5
    .param p1, "key"    # I
    .param p2, "value"    # I

    .line 127
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 128
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/UintMap;->ensureIndex(IZ)I

    move-result v1

    .line 129
    .local v1, "index":I
    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    if-nez v2, :cond_2

    .line 130
    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    shl-int/2addr v0, v2

    .line 132
    .local v0, "N":I
    iget-object v2, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    array-length v3, v2

    mul-int/lit8 v4, v0, 0x2

    if-eq v3, v4, :cond_1

    .line 133
    mul-int/lit8 v3, v0, 0x2

    new-array v3, v3, [I

    .line 134
    .local v3, "tmp":[I
    const/4 v4, 0x0

    invoke-static {v2, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 135
    iput-object v3, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    .line 137
    .end local v3    # "tmp":[I
    :cond_1
    iput v0, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    .line 139
    .end local v0    # "N":I
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    add-int/2addr v2, v1

    aput p2, v0, v2

    .line 140
    return-void
.end method

.method public put(ILjava/lang/Object;)V
    .locals 3
    .param p1, "key"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 114
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 115
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/UintMap;->ensureIndex(IZ)I

    move-result v0

    .line 116
    .local v0, "index":I
    iget-object v1, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    if-nez v1, :cond_1

    .line 117
    const/4 v1, 0x1

    iget v2, p0, Lcom/trendmicro/hippo/UintMap;->power:I

    shl-int/2addr v1, v2

    new-array v1, v1, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    .line 119
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    aput-object p2, v1, v0

    .line 120
    return-void
.end method

.method public remove(I)V
    .locals 4
    .param p1, "key"    # I

    .line 143
    if-gez p1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 144
    :cond_0
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/UintMap;->findIndex(I)I

    move-result v0

    .line 145
    .local v0, "index":I
    if-ltz v0, :cond_2

    .line 146
    iget-object v1, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    const/4 v2, -0x2

    aput v2, v1, v0

    .line 147
    iget v1, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    .line 150
    iget-object v1, p0, Lcom/trendmicro/hippo/UintMap;->values:[Ljava/lang/Object;

    if-eqz v1, :cond_1

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 151
    :cond_1
    iget v1, p0, Lcom/trendmicro/hippo/UintMap;->ivaluesShift:I

    if-eqz v1, :cond_2

    iget-object v2, p0, Lcom/trendmicro/hippo/UintMap;->keys:[I

    add-int/2addr v1, v0

    const/4 v3, 0x0

    aput v3, v2, v1

    .line 153
    :cond_2
    return-void
.end method

.method public size()I
    .locals 1

    .line 50
    iget v0, p0, Lcom/trendmicro/hippo/UintMap;->keyCount:I

    return v0
.end method
