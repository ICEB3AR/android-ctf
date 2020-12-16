.class public Lcom/trendmicro/hippo/ObjArray;
.super Ljava/lang/Object;
.source "ObjArray.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final FIELDS_STORE_SIZE:I = 0x5

.field private static final serialVersionUID:J = 0x39f02f75d6f74578L


# instance fields
.field private transient data:[Ljava/lang/Object;

.field private transient f0:Ljava/lang/Object;

.field private transient f1:Ljava/lang/Object;

.field private transient f2:Ljava/lang/Object;

.field private transient f3:Ljava/lang/Object;

.field private transient f4:Ljava/lang/Object;

.field private sealed:Z

.field private size:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private ensureCapacity(I)V
    .locals 6
    .param p1, "minimalCapacity"    # I

    .line 278
    add-int/lit8 v0, p1, -0x5

    .line 279
    .local v0, "required":I
    if-lez v0, :cond_6

    .line 280
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    if-nez v1, :cond_1

    .line 281
    const/16 v1, 0xa

    .line 282
    .local v1, "alloc":I
    if-ge v1, v0, :cond_0

    .line 283
    move v1, v0

    .line 285
    :cond_0
    new-array v2, v1, [Ljava/lang/Object;

    iput-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    .line 286
    .end local v1    # "alloc":I
    goto :goto_1

    .line 287
    :cond_1
    array-length v1, v1

    .line 288
    .restart local v1    # "alloc":I
    if-ge v1, v0, :cond_5

    .line 289
    const/4 v2, 0x5

    if-gt v1, v2, :cond_2

    .line 290
    const/16 v1, 0xa

    goto :goto_0

    .line 292
    :cond_2
    mul-int/lit8 v1, v1, 0x2

    .line 294
    :goto_0
    if-ge v1, v0, :cond_3

    .line 295
    move v1, v0

    .line 297
    :cond_3
    new-array v3, v1, [Ljava/lang/Object;

    .line 298
    .local v3, "tmp":[Ljava/lang/Object;
    iget v4, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    if-le v4, v2, :cond_4

    .line 299
    iget-object v5, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    sub-int/2addr v4, v2

    const/4 v2, 0x0

    invoke-static {v5, v2, v3, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 302
    :cond_4
    iput-object v3, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    .line 305
    .end local v1    # "alloc":I
    .end local v3    # "tmp":[Ljava/lang/Object;
    :cond_5
    :goto_1
    return-void

    .line 279
    :cond_6
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method

.method private getImpl(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I

    .line 76
    if-eqz p1, :cond_4

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v1, p1, -0x5

    aget-object v0, v0, v1

    return-object v0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    return-object v0

    .line 80
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    return-object v0

    .line 79
    :cond_2
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    return-object v0

    .line 78
    :cond_3
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    return-object v0

    .line 77
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    return-object v0
.end method

.method private static onEmptyStackTopRead()Ljava/lang/RuntimeException;
    .locals 2

    .line 316
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Empty stack"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static onInvalidIndex(II)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "index"    # I
    .param p1, "upperBound"    # I

    .line 310
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " \u2209 [0, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 311
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static onSeledMutation()Ljava/lang/RuntimeException;
    .locals 2

    .line 321
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Attempt to modify sealed array"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 3
    .param p1, "is"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 337
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 338
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 339
    .local v0, "N":I
    const/4 v1, 0x5

    if-le v0, v1, :cond_0

    .line 340
    add-int/lit8 v1, v0, -0x5

    new-array v1, v1, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    .line 342
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_1

    .line 343
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    .line 344
    .local v2, "obj":Ljava/lang/Object;
    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 342
    .end local v2    # "obj":Ljava/lang/Object;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 346
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method private setImpl(ILjava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 88
    if-eqz p1, :cond_4

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v1, p1, -0x5

    aput-object p2, v0, v1

    goto :goto_0

    .line 93
    :cond_0
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_0

    .line 92
    :cond_1
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_0

    .line 91
    :cond_2
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_0

    .line 90
    :cond_3
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_0

    .line 89
    :cond_4
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    .line 97
    :goto_0
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 3
    .param p1, "os"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 326
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 327
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 328
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 329
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v2

    .line 330
    .local v2, "obj":Ljava/lang/Object;
    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 328
    .end local v2    # "obj":Ljava/lang/Object;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 332
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public final add(ILjava/lang/Object;)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 169
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 170
    .local v0, "N":I
    if-ltz p1, :cond_c

    if-gt p1, v0, :cond_c

    .line 171
    iget-boolean v1, p0, Lcom/trendmicro/hippo/ObjArray;->sealed:Z

    if-nez v1, :cond_b

    .line 173
    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz p1, :cond_0

    if-eq p1, v4, :cond_2

    if-eq p1, v3, :cond_4

    if-eq p1, v2, :cond_6

    if-eq p1, v1, :cond_8

    goto :goto_0

    .line 175
    :cond_0
    if-nez v0, :cond_1

    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_1

    .line 176
    :cond_1
    iget-object v5, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    .local v5, "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    move-object p2, v5

    .line 178
    .end local v5    # "tmp":Ljava/lang/Object;
    :cond_2
    if-ne v0, v4, :cond_3

    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_1

    .line 179
    :cond_3
    iget-object v5, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    .restart local v5    # "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    move-object p2, v5

    .line 181
    .end local v5    # "tmp":Ljava/lang/Object;
    :cond_4
    if-ne v0, v3, :cond_5

    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_1

    .line 182
    :cond_5
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    .local v3, "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    move-object p2, v3

    .line 184
    .end local v3    # "tmp":Ljava/lang/Object;
    :cond_6
    if-ne v0, v2, :cond_7

    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_1

    .line 185
    :cond_7
    iget-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    .local v2, "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    move-object p2, v2

    .line 187
    .end local v2    # "tmp":Ljava/lang/Object;
    :cond_8
    if-ne v0, v1, :cond_9

    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_1

    .line 188
    :cond_9
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    .local v1, "tmp":Ljava/lang/Object;
    iput-object p2, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    move-object p2, v1

    .line 190
    const/4 p1, 0x5

    .line 192
    .end local v1    # "tmp":Ljava/lang/Object;
    :goto_0
    add-int/lit8 v1, v0, 0x1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/ObjArray;->ensureCapacity(I)V

    .line 193
    if-eq p1, v0, :cond_a

    .line 194
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v2, p1, -0x5

    add-int/lit8 v3, p1, -0x5

    add-int/2addr v3, v4

    sub-int v4, v0, p1

    invoke-static {v1, v2, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 198
    :cond_a
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v2, p1, -0x5

    aput-object p2, v1, v2

    .line 200
    :goto_1
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 201
    return-void

    .line 171
    :cond_b
    invoke-static {}, Lcom/trendmicro/hippo/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 170
    :cond_c
    add-int/lit8 v1, v0, 0x1

    invoke-static {p1, v1}, Lcom/trendmicro/hippo/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public final add(Ljava/lang/Object;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .line 158
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ObjArray;->sealed:Z

    if-nez v0, :cond_1

    .line 159
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 160
    .local v0, "N":I
    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    .line 161
    add-int/lit8 v1, v0, 0x1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/ObjArray;->ensureCapacity(I)V

    .line 163
    :cond_0
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 164
    invoke-direct {p0, v0, p1}, Lcom/trendmicro/hippo/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 165
    return-void

    .line 158
    .end local v0    # "N":I
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public final clear()V
    .locals 3

    .line 240
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ObjArray;->sealed:Z

    if-nez v0, :cond_1

    .line 241
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 242
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 243
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 242
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 245
    .end local v1    # "i":I
    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 246
    return-void

    .line 240
    .end local v0    # "N":I
    :cond_1
    invoke-static {}, Lcom/trendmicro/hippo/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I

    .line 63
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    if-ge p1, v0, :cond_0

    .line 64
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 63
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 101
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 102
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_2

    .line 103
    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v2

    .line 104
    .local v2, "current":Ljava/lang/Object;
    if-eq v2, p1, :cond_1

    if-eqz v2, :cond_0

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 102
    .end local v2    # "current":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 105
    .restart local v2    # "current":Ljava/lang/Object;
    :cond_1
    :goto_1
    return v1

    .line 108
    .end local v1    # "i":I
    .end local v2    # "current":Ljava/lang/Object;
    :cond_2
    const/4 v1, -0x1

    return v1
.end method

.method public final isEmpty()Z
    .locals 1

    .line 36
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final isSealed()Z
    .locals 1

    .line 26
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ObjArray;->sealed:Z

    return v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .line 113
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .local v0, "i":I
    :goto_0
    if-eqz v0, :cond_2

    .line 114
    add-int/lit8 v0, v0, -0x1

    .line 115
    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v1

    .line 116
    .local v1, "current":Ljava/lang/Object;
    if-eq v1, p1, :cond_1

    if-eqz v1, :cond_0

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 119
    .end local v1    # "current":Ljava/lang/Object;
    :cond_0
    goto :goto_0

    .line 117
    .restart local v1    # "current":Ljava/lang/Object;
    :cond_1
    :goto_1
    return v0

    .line 120
    .end local v0    # "i":I
    .end local v1    # "current":Ljava/lang/Object;
    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method public final peek()Ljava/lang/Object;
    .locals 2

    .line 125
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 126
    .local v0, "N":I
    if-eqz v0, :cond_0

    .line 127
    add-int/lit8 v1, v0, -0x1

    invoke-direct {p0, v1}, Lcom/trendmicro/hippo/ObjArray;->getImpl(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 126
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/ObjArray;->onEmptyStackTopRead()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public final pop()Ljava/lang/Object;
    .locals 5

    .line 132
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ObjArray;->sealed:Z

    if-nez v0, :cond_6

    .line 133
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 134
    .local v0, "N":I
    const/4 v1, -0x1

    add-int/2addr v0, v1

    .line 136
    if-eq v0, v1, :cond_5

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    .line 144
    iget-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v3, v0, -0x5

    aget-object v3, v2, v3

    .line 145
    .local v3, "top":Ljava/lang/Object;
    add-int/lit8 v4, v0, -0x5

    aput-object v1, v2, v4

    goto :goto_0

    .line 142
    .end local v3    # "top":Ljava/lang/Object;
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    .restart local v3    # "top":Ljava/lang/Object;
    iput-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_0

    .line 141
    .end local v3    # "top":Ljava/lang/Object;
    :cond_1
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    .restart local v3    # "top":Ljava/lang/Object;
    iput-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_0

    .line 140
    .end local v3    # "top":Ljava/lang/Object;
    :cond_2
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    .restart local v3    # "top":Ljava/lang/Object;
    iput-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_0

    .line 139
    .end local v3    # "top":Ljava/lang/Object;
    :cond_3
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    .restart local v3    # "top":Ljava/lang/Object;
    iput-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_0

    .line 138
    .end local v3    # "top":Ljava/lang/Object;
    :cond_4
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    .restart local v3    # "top":Ljava/lang/Object;
    iput-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    .line 147
    :goto_0
    iput v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 148
    return-object v3

    .line 137
    .end local v3    # "top":Ljava/lang/Object;
    :cond_5
    invoke-static {}, Lcom/trendmicro/hippo/ObjArray;->onEmptyStackTopRead()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 132
    .end local v0    # "N":I
    :cond_6
    invoke-static {}, Lcom/trendmicro/hippo/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public final push(Ljava/lang/Object;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/Object;

    .line 153
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ObjArray;->add(Ljava/lang/Object;)V

    .line 154
    return-void
.end method

.method public final remove(I)V
    .locals 7
    .param p1, "index"    # I

    .line 205
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 206
    .local v0, "N":I
    if-ltz p1, :cond_c

    if-ge p1, v0, :cond_c

    .line 207
    iget-boolean v1, p0, Lcom/trendmicro/hippo/ObjArray;->sealed:Z

    if-nez v1, :cond_b

    .line 208
    add-int/lit8 v0, v0, -0x1

    .line 209
    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz p1, :cond_0

    if-eq p1, v4, :cond_2

    if-eq p1, v3, :cond_4

    if-eq p1, v2, :cond_6

    if-eq p1, v1, :cond_8

    goto :goto_0

    .line 211
    :cond_0
    if-nez v0, :cond_1

    iput-object v5, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    goto :goto_1

    .line 212
    :cond_1
    iget-object v6, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    iput-object v6, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    .line 214
    :cond_2
    if-ne v0, v4, :cond_3

    iput-object v5, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    goto :goto_1

    .line 215
    :cond_3
    iget-object v6, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    iput-object v6, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    .line 217
    :cond_4
    if-ne v0, v3, :cond_5

    iput-object v5, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    goto :goto_1

    .line 218
    :cond_5
    iget-object v3, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    iput-object v3, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    .line 220
    :cond_6
    if-ne v0, v2, :cond_7

    iput-object v5, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    goto :goto_1

    .line 221
    :cond_7
    iget-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    iput-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    .line 223
    :cond_8
    if-ne v0, v1, :cond_9

    iput-object v5, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    goto :goto_1

    .line 224
    :cond_9
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    .line 226
    const/4 p1, 0x5

    .line 228
    :goto_0
    if-eq p1, v0, :cond_a

    .line 229
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v2, p1, -0x5

    add-int/2addr v2, v4

    add-int/lit8 v3, p1, -0x5

    sub-int v4, v0, p1

    invoke-static {v1, v2, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    :cond_a
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v2, v0, -0x5

    aput-object v5, v1, v2

    .line 235
    :goto_1
    iput v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 236
    return-void

    .line 207
    :cond_b
    invoke-static {}, Lcom/trendmicro/hippo/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 206
    :cond_c
    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public final seal()V
    .locals 1

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ObjArray;->sealed:Z

    .line 32
    return-void
.end method

.method public final set(ILjava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 69
    if-ltz p1, :cond_1

    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    if-ge p1, v0, :cond_1

    .line 70
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ObjArray;->sealed:Z

    if-nez v0, :cond_0

    .line 71
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 72
    return-void

    .line 70
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 69
    :cond_1
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    invoke-static {p1, v0}, Lcom/trendmicro/hippo/ObjArray;->onInvalidIndex(II)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public final setSize(I)V
    .locals 3
    .param p1, "newSize"    # I

    .line 46
    if-ltz p1, :cond_4

    .line 47
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ObjArray;->sealed:Z

    if-nez v0, :cond_3

    .line 48
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 49
    .local v0, "N":I
    if-ge p1, v0, :cond_1

    .line 50
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-eq v1, v0, :cond_0

    .line 51
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/trendmicro/hippo/ObjArray;->setImpl(ILjava/lang/Object;)V

    .line 50
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v1    # "i":I
    :cond_0
    goto :goto_1

    .line 53
    :cond_1
    if-le p1, v0, :cond_2

    .line 54
    const/4 v1, 0x5

    if-le p1, v1, :cond_2

    .line 55
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ObjArray;->ensureCapacity(I)V

    .line 58
    :cond_2
    :goto_1
    iput p1, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 59
    return-void

    .line 47
    .end local v0    # "N":I
    :cond_3
    invoke-static {}, Lcom/trendmicro/hippo/ObjArray;->onSeledMutation()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 46
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public final size()I
    .locals 1

    .line 41
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    return v0
.end method

.method public final toArray([Ljava/lang/Object;)V
    .locals 1
    .param p1, "array"    # [Ljava/lang/Object;

    .line 257
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/ObjArray;->toArray([Ljava/lang/Object;I)V

    .line 258
    return-void
.end method

.method public final toArray([Ljava/lang/Object;I)V
    .locals 5
    .param p1, "array"    # [Ljava/lang/Object;
    .param p2, "offset"    # I

    .line 262
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    .line 263
    .local v0, "N":I
    if-eqz v0, :cond_5

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    .line 265
    iget-object v1, p0, Lcom/trendmicro/hippo/ObjArray;->data:[Ljava/lang/Object;

    add-int/lit8 v2, p2, 0x5

    add-int/lit8 v3, v0, -0x5

    const/4 v4, 0x0

    invoke-static {v1, v4, p1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 267
    :cond_0
    add-int/lit8 v1, p2, 0x4

    iget-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->f4:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 268
    :cond_1
    add-int/lit8 v1, p2, 0x3

    iget-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->f3:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 269
    :cond_2
    add-int/lit8 v1, p2, 0x2

    iget-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->f2:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 270
    :cond_3
    add-int/lit8 v1, p2, 0x1

    iget-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->f1:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 271
    :cond_4
    add-int/lit8 v1, p2, 0x0

    iget-object v2, p0, Lcom/trendmicro/hippo/ObjArray;->f0:Ljava/lang/Object;

    aput-object v2, p1, v1

    .line 274
    :cond_5
    return-void
.end method

.method public final toArray()[Ljava/lang/Object;
    .locals 2

    .line 250
    iget v0, p0, Lcom/trendmicro/hippo/ObjArray;->size:I

    new-array v0, v0, [Ljava/lang/Object;

    .line 251
    .local v0, "array":[Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/ObjArray;->toArray([Ljava/lang/Object;I)V

    .line 252
    return-object v0
.end method
