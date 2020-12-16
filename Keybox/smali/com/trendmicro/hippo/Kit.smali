.class public Lcom/trendmicro/hippo/Kit;
.super Ljava/lang/Object;
.source "Kit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/Kit$ComplexKey;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addListener(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p0, "bag"    # Ljava/lang/Object;
    .param p1, "listener"    # Ljava/lang/Object;

    .line 159
    if-eqz p1, :cond_4

    .line 160
    instance-of v0, p1, [Ljava/lang/Object;

    if-nez v0, :cond_3

    .line 162
    if-nez p0, :cond_0

    .line 163
    move-object p0, p1

    goto :goto_0

    .line 164
    :cond_0
    instance-of v0, p0, [Ljava/lang/Object;

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 165
    new-array v0, v1, [Ljava/lang/Object;

    aput-object p0, v0, v2

    const/4 v1, 0x1

    aput-object p1, v0, v1

    move-object p0, v0

    goto :goto_0

    .line 167
    :cond_1
    move-object v0, p0

    check-cast v0, [Ljava/lang/Object;

    .line 168
    .local v0, "array":[Ljava/lang/Object;
    array-length v3, v0

    .line 170
    .local v3, "L":I
    if-lt v3, v1, :cond_2

    .line 171
    add-int/lit8 v1, v3, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 172
    .local v1, "tmp":[Ljava/lang/Object;
    invoke-static {v0, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 173
    aput-object p1, v1, v3

    .line 174
    move-object p0, v1

    .line 177
    .end local v0    # "array":[Ljava/lang/Object;
    .end local v1    # "tmp":[Ljava/lang/Object;
    .end local v3    # "L":I
    :goto_0
    return-object p0

    .line 170
    .restart local v0    # "array":[Ljava/lang/Object;
    .restart local v3    # "L":I
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 160
    .end local v0    # "array":[Ljava/lang/Object;
    .end local v3    # "L":I
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 159
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public static classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .param p0, "loader"    # Ljava/lang/ClassLoader;
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 41
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 45
    :catch_0
    move-exception v0

    goto :goto_1

    .line 44
    :catch_1
    move-exception v0

    goto :goto_0

    .line 43
    :catch_2
    move-exception v0

    goto :goto_0

    .line 42
    :catch_3
    move-exception v0

    .line 48
    :goto_0
    nop

    .line 49
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static classOrNull(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .param p0, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 23
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 27
    :catch_0
    move-exception v0

    goto :goto_1

    .line 26
    :catch_1
    move-exception v0

    goto :goto_0

    .line 25
    :catch_2
    move-exception v0

    goto :goto_0

    .line 24
    :catch_3
    move-exception v0

    .line 30
    :goto_0
    nop

    .line 31
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static codeBug()Ljava/lang/RuntimeException;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 379
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "FAILED ASSERTION"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 381
    .local v0, "ex":Ljava/lang/RuntimeException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 382
    throw v0
.end method

.method public static codeBug(Ljava/lang/String;)Ljava/lang/RuntimeException;
    .locals 2
    .param p0, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 394
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FAILED ASSERTION: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 395
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 397
    .local v0, "ex":Ljava/lang/RuntimeException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 398
    throw v0
.end method

.method public static getListener(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 4
    .param p0, "bag"    # Ljava/lang/Object;
    .param p1, "index"    # I

    .line 246
    const/4 v0, 0x2

    const/4 v1, 0x0

    if-nez p1, :cond_3

    .line 247
    if-nez p0, :cond_0

    .line 248
    return-object v1

    .line 249
    :cond_0
    instance-of v1, p0, [Ljava/lang/Object;

    if-nez v1, :cond_1

    .line 250
    return-object p0

    .line 251
    :cond_1
    move-object v1, p0

    check-cast v1, [Ljava/lang/Object;

    .line 253
    .local v1, "array":[Ljava/lang/Object;
    array-length v2, v1

    if-lt v2, v0, :cond_2

    .line 254
    const/4 v0, 0x0

    aget-object v0, v1, v0

    return-object v0

    .line 253
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 255
    .end local v1    # "array":[Ljava/lang/Object;
    :cond_3
    const/4 v2, 0x1

    if-ne p1, v2, :cond_6

    .line 256
    instance-of v0, p0, [Ljava/lang/Object;

    if-nez v0, :cond_5

    .line 257
    if-eqz p0, :cond_4

    .line 258
    return-object v1

    .line 257
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 260
    :cond_5
    move-object v0, p0

    check-cast v0, [Ljava/lang/Object;

    .line 262
    .local v0, "array":[Ljava/lang/Object;
    aget-object v1, v0, v2

    return-object v1

    .line 265
    .end local v0    # "array":[Ljava/lang/Object;
    :cond_6
    move-object v2, p0

    check-cast v2, [Ljava/lang/Object;

    .line 266
    .local v2, "array":[Ljava/lang/Object;
    array-length v3, v2

    .line 267
    .local v3, "L":I
    if-lt v3, v0, :cond_8

    .line 268
    if-ne p1, v3, :cond_7

    .line 269
    return-object v1

    .line 270
    :cond_7
    aget-object v0, v2, p1

    return-object v0

    .line 267
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method static initHash(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "initialValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 276
    .local p0, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    monitor-enter p0

    .line 277
    :try_start_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 278
    .local v0, "current":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 279
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 281
    :cond_0
    move-object p2, v0

    .line 283
    .end local v0    # "current":Ljava/lang/Object;
    :goto_0
    monitor-exit p0

    .line 284
    return-object p2

    .line 283
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static makeHashKeyFromPair(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "key1"    # Ljava/lang/Object;
    .param p1, "key2"    # Ljava/lang/Object;

    .line 320
    if-eqz p0, :cond_1

    .line 321
    if-eqz p1, :cond_0

    .line 322
    new-instance v0, Lcom/trendmicro/hippo/Kit$ComplexKey;

    invoke-direct {v0, p0, p1}, Lcom/trendmicro/hippo/Kit$ComplexKey;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    .line 321
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 320
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method static newInstanceOrNull(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 55
    .local p0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 59
    :catch_0
    move-exception v0

    goto :goto_1

    .line 58
    :catch_1
    move-exception v0

    goto :goto_0

    .line 57
    :catch_2
    move-exception v0

    goto :goto_0

    .line 56
    :catch_3
    move-exception v0

    .line 60
    :goto_0
    nop

    .line 61
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static readReader(Ljava/io/Reader;)Ljava/lang/String;
    .locals 5
    .param p0, "r"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 328
    const/16 v0, 0x200

    new-array v0, v0, [C

    .line 329
    .local v0, "buffer":[C
    const/4 v1, 0x0

    .line 331
    .local v1, "cursor":I
    :goto_0
    array-length v2, v0

    sub-int/2addr v2, v1

    invoke-virtual {p0, v0, v1, v2}, Ljava/io/Reader;->read([CII)I

    move-result v2

    .line 332
    .local v2, "n":I
    const/4 v3, 0x0

    if-gez v2, :cond_0

    .line 340
    .end local v2    # "n":I
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0, v3, v1}, Ljava/lang/String;-><init>([CII)V

    return-object v2

    .line 333
    .restart local v2    # "n":I
    :cond_0
    add-int/2addr v1, v2

    .line 334
    array-length v4, v0

    if-ne v1, v4, :cond_1

    .line 335
    array-length v4, v0

    mul-int/lit8 v4, v4, 0x2

    new-array v4, v4, [C

    .line 336
    .local v4, "tmp":[C
    invoke-static {v0, v3, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 337
    move-object v0, v4

    .line 339
    .end local v2    # "n":I
    .end local v4    # "tmp":[C
    :cond_1
    goto :goto_0
.end method

.method public static readStream(Ljava/io/InputStream;I)[B
    .locals 5
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "initialBufferCapacity"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 346
    if-lez p1, :cond_3

    .line 350
    new-array v0, p1, [B

    .line 351
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 353
    .local v1, "cursor":I
    :goto_0
    array-length v2, v0

    sub-int/2addr v2, v1

    invoke-virtual {p0, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 354
    .local v2, "n":I
    const/4 v3, 0x0

    if-gez v2, :cond_1

    .line 362
    .end local v2    # "n":I
    array-length v2, v0

    if-eq v1, v2, :cond_0

    .line 363
    new-array v2, v1, [B

    .line 364
    .local v2, "tmp":[B
    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 365
    move-object v0, v2

    .line 367
    .end local v2    # "tmp":[B
    :cond_0
    return-object v0

    .line 355
    .local v2, "n":I
    :cond_1
    add-int/2addr v1, v2

    .line 356
    array-length v4, v0

    if-ne v1, v4, :cond_2

    .line 357
    array-length v4, v0

    mul-int/lit8 v4, v4, 0x2

    new-array v4, v4, [B

    .line 358
    .local v4, "tmp":[B
    invoke-static {v0, v3, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 359
    move-object v0, v4

    .line 361
    .end local v2    # "n":I
    .end local v4    # "tmp":[B
    :cond_2
    goto :goto_0

    .line 347
    .end local v0    # "buffer":[B
    .end local v1    # "cursor":I
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad initialBufferCapacity: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static removeListener(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p0, "bag"    # Ljava/lang/Object;
    .param p1, "listener"    # Ljava/lang/Object;

    .line 198
    if-eqz p1, :cond_8

    .line 199
    instance-of v0, p1, [Ljava/lang/Object;

    if-nez v0, :cond_7

    .line 201
    if-ne p0, p1, :cond_0

    .line 202
    const/4 p0, 0x0

    goto :goto_0

    .line 203
    :cond_0
    instance-of v0, p0, [Ljava/lang/Object;

    if-eqz v0, :cond_6

    .line 204
    move-object v0, p0

    check-cast v0, [Ljava/lang/Object;

    .line 205
    .local v0, "array":[Ljava/lang/Object;
    array-length v1, v0

    .line 207
    .local v1, "L":I
    const/4 v2, 0x2

    if-lt v1, v2, :cond_5

    .line 208
    const/4 v3, 0x0

    if-ne v1, v2, :cond_2

    .line 209
    const/4 v2, 0x1

    aget-object v4, v0, v2

    if-ne v4, p1, :cond_1

    .line 210
    aget-object p0, v0, v3

    goto :goto_0

    .line 211
    :cond_1
    aget-object v3, v0, v3

    if-ne v3, p1, :cond_6

    .line 212
    aget-object p0, v0, v2

    goto :goto_0

    .line 215
    :cond_2
    move v2, v1

    .line 217
    .local v2, "i":I
    :cond_3
    add-int/lit8 v2, v2, -0x1

    .line 218
    aget-object v4, v0, v2

    if-ne v4, p1, :cond_4

    .line 219
    add-int/lit8 v4, v1, -0x1

    new-array v4, v4, [Ljava/lang/Object;

    .line 220
    .local v4, "tmp":[Ljava/lang/Object;
    invoke-static {v0, v3, v4, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 221
    add-int/lit8 v3, v2, 0x1

    add-int/lit8 v5, v2, 0x1

    sub-int v5, v1, v5

    invoke-static {v0, v3, v4, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 222
    move-object p0, v4

    .line 223
    goto :goto_0

    .line 225
    .end local v4    # "tmp":[Ljava/lang/Object;
    :cond_4
    if-nez v2, :cond_3

    goto :goto_0

    .line 207
    .end local v2    # "i":I
    :cond_5
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2

    .line 229
    .end local v0    # "array":[Ljava/lang/Object;
    .end local v1    # "L":I
    :cond_6
    :goto_0
    return-object p0

    .line 199
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 198
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method static testIfCanLoadHippoClasses(Ljava/lang/ClassLoader;)Z
    .locals 3
    .param p0, "loader"    # Ljava/lang/ClassLoader;

    .line 69
    sget-object v0, Lcom/trendmicro/hippo/ScriptRuntime;->ContextFactoryClass:Ljava/lang/Class;

    .line 70
    .local v0, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/trendmicro/hippo/Kit;->classOrNull(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 71
    .local v1, "x":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eq v1, v0, :cond_0

    .line 76
    const/4 v2, 0x0

    return v2

    .line 78
    :cond_0
    const/4 v2, 0x1

    return v2
.end method

.method public static xDigitToInt(II)I
    .locals 1
    .param p0, "c"    # I
    .param p1, "accumulator"    # I

    .line 90
    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    .line 91
    add-int/lit8 p0, p0, -0x30

    .line 92
    if-ltz p0, :cond_2

    goto :goto_0

    .line 93
    :cond_0
    const/16 v0, 0x46

    if-gt p0, v0, :cond_1

    .line 94
    const/16 v0, 0x41

    if-gt v0, p0, :cond_2

    .line 95
    add-int/lit8 p0, p0, -0x37

    .line 96
    goto :goto_0

    .line 98
    :cond_1
    const/16 v0, 0x66

    if-gt p0, v0, :cond_2

    .line 99
    const/16 v0, 0x61

    if-gt v0, p0, :cond_2

    .line 100
    add-int/lit8 p0, p0, -0x57

    .line 101
    nop

    .line 106
    :goto_0
    shl-int/lit8 v0, p1, 0x4

    or-int/2addr v0, p0

    return v0

    .line 104
    :cond_2
    const/4 v0, -0x1

    return v0
.end method
