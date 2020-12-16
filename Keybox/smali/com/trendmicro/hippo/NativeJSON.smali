.class public final Lcom/trendmicro/hippo/NativeJSON;
.super Lcom/trendmicro/hippo/IdScriptableObject;
.source "NativeJSON.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/NativeJSON$StringifyState;
    }
.end annotation


# static fields
.field private static final Id_parse:I = 0x2

.field private static final Id_stringify:I = 0x3

.field private static final Id_toSource:I = 0x1

.field private static final JSON_TAG:Ljava/lang/Object;

.field private static final LAST_METHOD_ID:I = 0x3

.field private static final MAX_ID:I = 0x3

.field private static final MAX_STRINGIFY_GAP_LENGTH:I = 0xa

.field private static final serialVersionUID:J = -0x3f635fb98b5ee348L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const-string v0, "JSON"

    sput-object v0, Lcom/trendmicro/hippo/NativeJSON;->JSON_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/trendmicro/hippo/IdScriptableObject;-><init>()V

    .line 44
    return-void
.end method

.method static init(Lcom/trendmicro/hippo/Scriptable;Z)V
    .locals 3
    .param p0, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "sealed"    # Z

    .line 33
    new-instance v0, Lcom/trendmicro/hippo/NativeJSON;

    invoke-direct {v0}, Lcom/trendmicro/hippo/NativeJSON;-><init>()V

    .line 34
    .local v0, "obj":Lcom/trendmicro/hippo/NativeJSON;
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeJSON;->activatePrototypeMap(I)V

    .line 35
    invoke-static {p0}, Lcom/trendmicro/hippo/NativeJSON;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/trendmicro/hippo/NativeJSON;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 36
    invoke-virtual {v0, p0}, Lcom/trendmicro/hippo/NativeJSON;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 37
    if-eqz p1, :cond_0

    invoke-virtual {v0}, Lcom/trendmicro/hippo/NativeJSON;->sealObject()V

    .line 38
    :cond_0
    const/4 v1, 0x2

    const-string v2, "JSON"

    invoke-static {p0, v2, v0, v1}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 40
    return-void
.end method

.method private static ja(Lcom/trendmicro/hippo/NativeArray;Lcom/trendmicro/hippo/NativeJSON$StringifyState;)Ljava/lang/String;
    .locals 9
    .param p0, "value"    # Lcom/trendmicro/hippo/NativeArray;
    .param p1, "state"    # Lcom/trendmicro/hippo/NativeJSON$StringifyState;

    .line 391
    iget-object v0, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->stack:Ljava/util/Stack;

    invoke-virtual {v0, p0}, Ljava/util/Stack;->search(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_5

    .line 394
    iget-object v0, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->stack:Ljava/util/Stack;

    invoke-virtual {v0, p0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    iget-object v0, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    .line 397
    .local v0, "stepback":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->gap:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    .line 398
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 400
    .local v1, "partial":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-virtual {p0}, Lcom/trendmicro/hippo/NativeArray;->getLength()J

    move-result-wide v2

    .line 401
    .local v2, "len":J
    const-wide/16 v4, 0x0

    .local v4, "index":J
    :goto_0
    cmp-long v6, v4, v2

    if-gez v6, :cond_2

    .line 403
    const-wide/32 v6, 0x7fffffff

    cmp-long v6, v4, v6

    if-lez v6, :cond_0

    .line 404
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p0, p1}, Lcom/trendmicro/hippo/NativeJSON;->str(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeJSON$StringifyState;)Ljava/lang/Object;

    move-result-object v6

    .local v6, "strP":Ljava/lang/Object;
    goto :goto_1

    .line 406
    .end local v6    # "strP":Ljava/lang/Object;
    :cond_0
    long-to-int v6, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v6, p0, p1}, Lcom/trendmicro/hippo/NativeJSON;->str(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeJSON$StringifyState;)Ljava/lang/Object;

    move-result-object v6

    .line 408
    .restart local v6    # "strP":Ljava/lang/Object;
    :goto_1
    sget-object v7, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v6, v7, :cond_1

    .line 409
    const-string v7, "null"

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 411
    :cond_1
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 401
    .end local v6    # "strP":Ljava/lang/Object;
    :goto_2
    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    goto :goto_0

    .line 417
    .end local v4    # "index":J
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 418
    const-string v4, "[]"

    .local v4, "finalValue":Ljava/lang/String;
    goto :goto_3

    .line 420
    .end local v4    # "finalValue":Ljava/lang/String;
    :cond_3
    iget-object v4, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->gap:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x5d

    if-nez v4, :cond_4

    .line 421
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v6, 0x5b

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v6, ","

    invoke-static {v1, v6}, Lcom/trendmicro/hippo/NativeJSON;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "finalValue":Ljava/lang/String;
    goto :goto_3

    .line 423
    .end local v4    # "finalValue":Ljava/lang/String;
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ",\n"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 424
    .local v4, "separator":Ljava/lang/String;
    invoke-static {v1, v4}, Lcom/trendmicro/hippo/NativeJSON;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 425
    .local v6, "properties":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v4, v5

    .line 429
    .end local v6    # "properties":Ljava/lang/String;
    .local v4, "finalValue":Ljava/lang/String;
    :goto_3
    iget-object v5, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->stack:Ljava/util/Stack;

    invoke-virtual {v5}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 430
    iput-object v0, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    .line 431
    return-object v4

    .line 392
    .end local v0    # "stepback":Ljava/lang/String;
    .end local v1    # "partial":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v2    # "len":J
    .end local v4    # "finalValue":Ljava/lang/String;
    :cond_5
    const-string v0, "msg.cyclic.value"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static jo(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeJSON$StringifyState;)Ljava/lang/String;
    .locals 10
    .param p0, "value"    # Lcom/trendmicro/hippo/Scriptable;
    .param p1, "state"    # Lcom/trendmicro/hippo/NativeJSON$StringifyState;

    .line 342
    iget-object v0, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->stack:Ljava/util/Stack;

    invoke-virtual {v0, p0}, Ljava/util/Stack;->search(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    .line 345
    iget-object v0, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->stack:Ljava/util/Stack;

    invoke-virtual {v0, p0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    iget-object v0, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    .line 348
    .local v0, "stepback":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->gap:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    .line 349
    const/4 v1, 0x0

    .line 350
    .local v1, "k":[Ljava/lang/Object;
    iget-object v2, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->propertyList:Ljava/util/List;

    if-eqz v2, :cond_0

    .line 351
    iget-object v2, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->propertyList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 353
    :cond_0
    invoke-interface {p0}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v1

    .line 356
    :goto_0
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 358
    .local v2, "partial":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    array-length v3, v1

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_3

    aget-object v5, v1, v4

    .line 359
    .local v5, "p":Ljava/lang/Object;
    invoke-static {v5, p0, p1}, Lcom/trendmicro/hippo/NativeJSON;->str(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeJSON$StringifyState;)Ljava/lang/Object;

    move-result-object v6

    .line 360
    .local v6, "strP":Ljava/lang/Object;
    sget-object v7, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-eq v6, v7, :cond_2

    .line 361
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/trendmicro/hippo/NativeJSON;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 362
    .local v7, "member":Ljava/lang/String;
    iget-object v8, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->gap:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_1

    .line 363
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 365
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 366
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 358
    .end local v5    # "p":Ljava/lang/Object;
    .end local v6    # "strP":Ljava/lang/Object;
    .end local v7    # "member":Ljava/lang/String;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 372
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 373
    const-string v3, "{}"

    .local v3, "finalValue":Ljava/lang/String;
    goto :goto_2

    .line 375
    .end local v3    # "finalValue":Ljava/lang/String;
    :cond_4
    iget-object v3, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->gap:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x7d

    if-nez v3, :cond_5

    .line 376
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v5, 0x7b

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v5, ","

    invoke-static {v2, v5}, Lcom/trendmicro/hippo/NativeJSON;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "finalValue":Ljava/lang/String;
    goto :goto_2

    .line 378
    .end local v3    # "finalValue":Ljava/lang/String;
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ",\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 379
    .local v3, "separator":Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/NativeJSON;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 380
    .local v5, "properties":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "{\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v3, v4

    .line 385
    .end local v5    # "properties":Ljava/lang/String;
    .local v3, "finalValue":Ljava/lang/String;
    :goto_2
    iget-object v4, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->stack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 386
    iput-object v0, p1, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->indent:Ljava/lang/String;

    .line 387
    return-object v3

    .line 343
    .end local v0    # "stepback":Ljava/lang/String;
    .end local v1    # "k":[Ljava/lang/Object;
    .end local v2    # "partial":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v3    # "finalValue":Ljava/lang/String;
    :cond_6
    const-string v0, "msg.cyclic.value"

    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->typeError0(Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v0

    throw v0
.end method

.method private static join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 329
    .local p0, "objs":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    const-string v0, ""

    if-eqz p0, :cond_3

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 332
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 333
    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    return-object v0

    .line 334
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 335
    .local v0, "builder":Ljava/lang/StringBuilder;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 336
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 338
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 330
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v1    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    :cond_3
    :goto_1
    return-object v0
.end method

.method private static parse(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "jtext"    # Ljava/lang/String;

    .line 109
    :try_start_0
    new-instance v0, Lcom/trendmicro/hippo/json/JsonParser;

    invoke-direct {v0, p0, p1}, Lcom/trendmicro/hippo/json/JsonParser;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;)V

    invoke-virtual {v0, p2}, Lcom/trendmicro/hippo/json/JsonParser;->parseValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Lcom/trendmicro/hippo/json/JsonParser$ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 110
    :catch_0
    move-exception v0

    .line 111
    .local v0, "ex":Lcom/trendmicro/hippo/json/JsonParser$ParseException;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/json/JsonParser$ParseException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SyntaxError"

    invoke-static {v2, v1}, Lcom/trendmicro/hippo/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lcom/trendmicro/hippo/EcmaError;

    move-result-object v1

    throw v1
.end method

.method public static parse(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Callable;)Ljava/lang/Object;
    .locals 3
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "jtext"    # Ljava/lang/String;
    .param p3, "reviver"    # Lcom/trendmicro/hippo/Callable;

    .line 118
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/NativeJSON;->parse(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 119
    .local v0, "unfiltered":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/Context;->newObject(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v1

    .line 120
    .local v1, "root":Lcom/trendmicro/hippo/Scriptable;
    const-string v2, ""

    invoke-interface {v1, v2, v1, v0}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 121
    invoke-static {p0, p1, p3, v1, v2}, Lcom/trendmicro/hippo/NativeJSON;->walk(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method private static quote(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "string"    # Ljava/lang/String;

    .line 435
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 436
    .local v0, "product":Ljava/lang/StringBuilder;
    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 437
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 438
    .local v2, "length":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_5

    .line 439
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 440
    .local v4, "c":C
    const/16 v5, 0xc

    if-eq v4, v5, :cond_4

    const/16 v5, 0xd

    if-eq v4, v5, :cond_3

    if-eq v4, v1, :cond_2

    const/16 v5, 0x5c

    if-eq v4, v5, :cond_1

    packed-switch v4, :pswitch_data_0

    .line 463
    const/16 v5, 0x20

    if-ge v4, v5, :cond_0

    .line 464
    const-string v5, "\\u"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 465
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const-string v6, "%04x"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 466
    .local v5, "hex":Ljava/lang/String;
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    .end local v5    # "hex":Ljava/lang/String;
    goto :goto_1

    .line 469
    :cond_0
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 454
    :pswitch_0
    const-string v5, "\\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    goto :goto_1

    .line 460
    :pswitch_1
    const-string v5, "\\t"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    goto :goto_1

    .line 448
    :pswitch_2
    const-string v5, "\\b"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    goto :goto_1

    .line 445
    :cond_1
    const-string v5, "\\\\"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    goto :goto_1

    .line 442
    :cond_2
    const-string v5, "\\\""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    goto :goto_1

    .line 457
    :cond_3
    const-string v5, "\\r"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    goto :goto_1

    .line 451
    :cond_4
    const-string v5, "\\f"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    nop

    .line 438
    .end local v4    # "c":C
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 474
    .end local v3    # "i":I
    :cond_5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 475
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static repeat(CI)Ljava/lang/String;
    .locals 2
    .param p0, "c"    # C
    .param p1, "count"    # I

    .line 181
    new-array v0, p1, [C

    .line 182
    .local v0, "chars":[C
    invoke-static {v0, p0}, Ljava/util/Arrays;->fill([CC)V

    .line 183
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method

.method private static str(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeJSON$StringifyState;)Ljava/lang/Object;
    .locals 8
    .param p0, "key"    # Ljava/lang/Object;
    .param p1, "holder"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "state"    # Lcom/trendmicro/hippo/NativeJSON$StringifyState;

    .line 271
    const/4 v0, 0x0

    .line 272
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 273
    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/trendmicro/hippo/NativeJSON;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 275
    :cond_0
    move-object v1, p0

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-static {p1, v1}, Lcom/trendmicro/hippo/NativeJSON;->getProperty(Lcom/trendmicro/hippo/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    .line 278
    :goto_0
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    const-string v4, "toJSON"

    invoke-static {v1, v4}, Lcom/trendmicro/hippo/NativeJSON;->hasProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 279
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, v4}, Lcom/trendmicro/hippo/NativeJSON;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 280
    .local v1, "toJSON":Ljava/lang/Object;
    instance-of v5, v1, Lcom/trendmicro/hippo/Callable;

    if-eqz v5, :cond_1

    .line 281
    iget-object v5, p2, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->cx:Lcom/trendmicro/hippo/Context;

    move-object v6, v0

    check-cast v6, Lcom/trendmicro/hippo/Scriptable;

    new-array v7, v2, [Ljava/lang/Object;

    aput-object p0, v7, v3

    invoke-static {v5, v6, v4, v7}, Lcom/trendmicro/hippo/NativeJSON;->callMethod(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 286
    .end local v1    # "toJSON":Ljava/lang/Object;
    :cond_1
    iget-object v1, p2, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->replacer:Lcom/trendmicro/hippo/Callable;

    if-eqz v1, :cond_2

    .line 287
    iget-object v1, p2, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->replacer:Lcom/trendmicro/hippo/Callable;

    iget-object v4, p2, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->cx:Lcom/trendmicro/hippo/Context;

    iget-object v5, p2, Lcom/trendmicro/hippo/NativeJSON$StringifyState;->scope:Lcom/trendmicro/hippo/Scriptable;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p0, v6, v3

    aput-object v0, v6, v2

    invoke-interface {v1, v4, v5, p1, v6}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 292
    :cond_2
    instance-of v1, v0, Lcom/trendmicro/hippo/NativeNumber;

    if-eqz v1, :cond_3

    .line 293
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_1

    .line 294
    :cond_3
    instance-of v1, v0, Lcom/trendmicro/hippo/NativeString;

    if-eqz v1, :cond_4

    .line 295
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 296
    :cond_4
    instance-of v1, v0, Lcom/trendmicro/hippo/NativeBoolean;

    if-eqz v1, :cond_5

    .line 297
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/NativeBoolean;

    sget-object v2, Lcom/trendmicro/hippo/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/NativeBoolean;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 300
    :cond_5
    :goto_1
    const-string v1, "null"

    if-nez v0, :cond_6

    return-object v1

    .line 301
    :cond_6
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const-string v1, "true"

    return-object v1

    .line 302
    :cond_7
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    const-string v1, "false"

    return-object v1

    .line 304
    :cond_8
    instance-of v2, v0, Ljava/lang/CharSequence;

    if-eqz v2, :cond_9

    .line 305
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/trendmicro/hippo/NativeJSON;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 308
    :cond_9
    instance-of v2, v0, Ljava/lang/Number;

    if-eqz v2, :cond_b

    .line 309
    move-object v2, v0

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 310
    .local v2, "d":D
    cmpl-double v4, v2, v2

    if-nez v4, :cond_a

    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v4, v2, v4

    if-eqz v4, :cond_a

    const-wide/high16 v4, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v4, v2, v4

    if-eqz v4, :cond_a

    .line 313
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 315
    :cond_a
    return-object v1

    .line 318
    .end local v2    # "d":D
    :cond_b
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v1, :cond_d

    instance-of v1, v0, Lcom/trendmicro/hippo/Callable;

    if-nez v1, :cond_d

    .line 319
    instance-of v1, v0, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v1, :cond_c

    .line 320
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/NativeArray;

    invoke-static {v1, p2}, Lcom/trendmicro/hippo/NativeJSON;->ja(Lcom/trendmicro/hippo/NativeArray;Lcom/trendmicro/hippo/NativeJSON$StringifyState;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 322
    :cond_c
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    invoke-static {v1, p2}, Lcom/trendmicro/hippo/NativeJSON;->jo(Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeJSON$StringifyState;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 325
    :cond_d
    sget-object v1, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    return-object v1
.end method

.method public static stringify(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "replacer"    # Ljava/lang/Object;
    .param p4, "space"    # Ljava/lang/Object;

    .line 215
    move-object/from16 v0, p3

    move-object/from16 v1, p4

    const-string v9, ""

    .line 216
    .local v9, "indent":Ljava/lang/String;
    const-string v2, ""

    .line 218
    .local v2, "gap":Ljava/lang/String;
    const/4 v3, 0x0

    .line 219
    .local v3, "propertyList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v4, 0x0

    .line 221
    .local v4, "replacerFunction":Lcom/trendmicro/hippo/Callable;
    instance-of v5, v0, Lcom/trendmicro/hippo/Callable;

    if-eqz v5, :cond_0

    .line 222
    move-object v4, v0

    check-cast v4, Lcom/trendmicro/hippo/Callable;

    move-object v10, v3

    move-object v11, v4

    goto :goto_3

    .line 223
    :cond_0
    instance-of v5, v0, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v5, :cond_6

    .line 224
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    move-object v3, v5

    .line 225
    move-object v5, v0

    check-cast v5, Lcom/trendmicro/hippo/NativeArray;

    .line 226
    .local v5, "replacerArray":Lcom/trendmicro/hippo/NativeArray;
    invoke-virtual {v5}, Lcom/trendmicro/hippo/NativeArray;->getIndexIds()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 227
    .local v7, "i":I
    invoke-virtual {v5, v7, v5}, Lcom/trendmicro/hippo/NativeArray;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v8

    .line 228
    .local v8, "v":Ljava/lang/Object;
    instance-of v10, v8, Ljava/lang/String;

    if-nez v10, :cond_3

    instance-of v10, v8, Ljava/lang/Number;

    if-eqz v10, :cond_1

    goto :goto_1

    .line 230
    :cond_1
    instance-of v10, v8, Lcom/trendmicro/hippo/NativeString;

    if-nez v10, :cond_2

    instance-of v10, v8, Lcom/trendmicro/hippo/NativeNumber;

    if-eqz v10, :cond_4

    .line 231
    :cond_2
    invoke-static {v8}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 229
    :cond_3
    :goto_1
    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    .end local v7    # "i":I
    .end local v8    # "v":Ljava/lang/Object;
    :cond_4
    :goto_2
    goto :goto_0

    .line 226
    :cond_5
    move-object v10, v3

    move-object v11, v4

    goto :goto_3

    .line 223
    .end local v5    # "replacerArray":Lcom/trendmicro/hippo/NativeArray;
    :cond_6
    move-object v10, v3

    move-object v11, v4

    .line 236
    .end local v3    # "propertyList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v4    # "replacerFunction":Lcom/trendmicro/hippo/Callable;
    .local v10, "propertyList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .local v11, "replacerFunction":Lcom/trendmicro/hippo/Callable;
    :goto_3
    instance-of v3, v1, Lcom/trendmicro/hippo/NativeNumber;

    if-eqz v3, :cond_7

    .line 237
    invoke-static/range {p4 .. p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .end local p4    # "space":Ljava/lang/Object;
    .local v1, "space":Ljava/lang/Object;
    goto :goto_4

    .line 238
    .end local v1    # "space":Ljava/lang/Object;
    .restart local p4    # "space":Ljava/lang/Object;
    :cond_7
    instance-of v3, v1, Lcom/trendmicro/hippo/NativeString;

    if-eqz v3, :cond_8

    .line 239
    invoke-static/range {p4 .. p4}, Lcom/trendmicro/hippo/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 242
    .end local p4    # "space":Ljava/lang/Object;
    .restart local v1    # "space":Ljava/lang/Object;
    :cond_8
    :goto_4
    instance-of v3, v1, Ljava/lang/Number;

    const/4 v12, 0x0

    const-string v13, ""

    const/16 v4, 0xa

    if-eqz v3, :cond_a

    .line 243
    invoke-static {v1}, Lcom/trendmicro/hippo/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v5

    double-to-int v3, v5

    .line 244
    .local v3, "gapLength":I
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 245
    if-lez v3, :cond_9

    const/16 v4, 0x20

    invoke-static {v4, v3}, Lcom/trendmicro/hippo/NativeJSON;->repeat(CI)Ljava/lang/String;

    move-result-object v4

    goto :goto_5

    :cond_9
    move-object v4, v13

    :goto_5
    move-object v2, v4

    .line 246
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .end local v3    # "gapLength":I
    goto :goto_6

    .line 247
    :cond_a
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_c

    .line 248
    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    .line 249
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v4, :cond_b

    .line 250
    invoke-virtual {v2, v12, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    move-object v14, v1

    move-object v15, v2

    goto :goto_7

    .line 249
    :cond_b
    move-object v14, v1

    move-object v15, v2

    goto :goto_7

    .line 247
    :cond_c
    :goto_6
    move-object v14, v1

    move-object v15, v2

    .line 254
    .end local v1    # "space":Ljava/lang/Object;
    .end local v2    # "gap":Ljava/lang/String;
    .local v14, "space":Ljava/lang/Object;
    .local v15, "gap":Ljava/lang/String;
    :goto_7
    new-instance v16, Lcom/trendmicro/hippo/NativeJSON$StringifyState;

    move-object/from16 v1, v16

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object v4, v9

    move-object v5, v15

    move-object v6, v11

    move-object v7, v10

    move-object v8, v14

    invoke-direct/range {v1 .. v8}, Lcom/trendmicro/hippo/NativeJSON$StringifyState;-><init>(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Ljava/lang/String;Lcom/trendmicro/hippo/Callable;Ljava/util/List;Ljava/lang/Object;)V

    .line 261
    .local v1, "state":Lcom/trendmicro/hippo/NativeJSON$StringifyState;
    new-instance v2, Lcom/trendmicro/hippo/NativeObject;

    invoke-direct {v2}, Lcom/trendmicro/hippo/NativeObject;-><init>()V

    .line 262
    .local v2, "wrapper":Lcom/trendmicro/hippo/ScriptableObject;
    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ScriptableObject;->setParentScope(Lcom/trendmicro/hippo/Scriptable;)V

    .line 263
    invoke-static/range {p1 .. p1}, Lcom/trendmicro/hippo/ScriptableObject;->getObjectPrototype(Lcom/trendmicro/hippo/Scriptable;)Lcom/trendmicro/hippo/Scriptable;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/trendmicro/hippo/ScriptableObject;->setPrototype(Lcom/trendmicro/hippo/Scriptable;)V

    .line 264
    move-object/from16 v4, p2

    invoke-virtual {v2, v13, v4, v12}, Lcom/trendmicro/hippo/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 265
    invoke-static {v13, v2, v1}, Lcom/trendmicro/hippo/NativeJSON;->str(Ljava/lang/Object;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/NativeJSON$StringifyState;)Ljava/lang/Object;

    move-result-object v5

    return-object v5
.end method

.method private static walk(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p0, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p1, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p2, "reviver"    # Lcom/trendmicro/hippo/Callable;
    .param p3, "holder"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "name"    # Ljava/lang/Object;

    .line 128
    instance-of v0, p4, Ljava/lang/Number;

    if-eqz v0, :cond_0

    .line 129
    move-object v0, p4

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-interface {p3, v0, p3}, Lcom/trendmicro/hippo/Scriptable;->get(ILcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .local v0, "property":Ljava/lang/Object;
    goto :goto_0

    .line 131
    .end local v0    # "property":Ljava/lang/Object;
    :cond_0
    move-object v0, p4

    check-cast v0, Ljava/lang/String;

    invoke-interface {p3, v0, p3}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 134
    .restart local v0    # "property":Ljava/lang/Object;
    :goto_0
    instance-of v1, v0, Lcom/trendmicro/hippo/Scriptable;

    const/4 v2, 0x0

    if-eqz v1, :cond_9

    .line 135
    move-object v1, v0

    check-cast v1, Lcom/trendmicro/hippo/Scriptable;

    .line 136
    .local v1, "val":Lcom/trendmicro/hippo/Scriptable;
    instance-of v3, v1, Lcom/trendmicro/hippo/NativeArray;

    if-eqz v3, :cond_5

    .line 137
    move-object v3, v1

    check-cast v3, Lcom/trendmicro/hippo/NativeArray;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/NativeArray;->getLength()J

    move-result-wide v3

    .line 138
    .local v3, "len":J
    const-wide/16 v5, 0x0

    .local v5, "i":J
    :goto_1
    cmp-long v7, v5, v3

    if-gez v7, :cond_4

    .line 140
    const-wide/32 v7, 0x7fffffff

    cmp-long v7, v5, v7

    if-lez v7, :cond_2

    .line 141
    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    .line 142
    .local v7, "id":Ljava/lang/String;
    invoke-static {p0, p1, p2, v1, v7}, Lcom/trendmicro/hippo/NativeJSON;->walk(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 143
    .local v8, "newElement":Ljava/lang/Object;
    sget-object v9, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v8, v9, :cond_1

    .line 144
    invoke-interface {v1, v7}, Lcom/trendmicro/hippo/Scriptable;->delete(Ljava/lang/String;)V

    goto :goto_2

    .line 146
    :cond_1
    invoke-interface {v1, v7, v1, v8}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 148
    .end local v7    # "id":Ljava/lang/String;
    .end local v8    # "newElement":Ljava/lang/Object;
    :goto_2
    goto :goto_3

    .line 149
    :cond_2
    long-to-int v7, v5

    .line 150
    .local v7, "idx":I
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {p0, p1, p2, v1, v8}, Lcom/trendmicro/hippo/NativeJSON;->walk(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 151
    .restart local v8    # "newElement":Ljava/lang/Object;
    sget-object v9, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v8, v9, :cond_3

    .line 152
    invoke-interface {v1, v7}, Lcom/trendmicro/hippo/Scriptable;->delete(I)V

    goto :goto_3

    .line 154
    :cond_3
    invoke-interface {v1, v7, v1, v8}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 138
    .end local v7    # "idx":I
    .end local v8    # "newElement":Ljava/lang/Object;
    :goto_3
    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    goto :goto_1

    .line 158
    .end local v3    # "len":J
    .end local v5    # "i":J
    :cond_4
    goto :goto_6

    .line 159
    :cond_5
    invoke-interface {v1}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v3

    .line 160
    .local v3, "keys":[Ljava/lang/Object;
    array-length v4, v3

    move v5, v2

    :goto_4
    if-ge v5, v4, :cond_9

    aget-object v6, v3, v5

    .line 161
    .local v6, "p":Ljava/lang/Object;
    invoke-static {p0, p1, p2, v1, v6}, Lcom/trendmicro/hippo/NativeJSON;->walk(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Callable;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 162
    .local v7, "newElement":Ljava/lang/Object;
    sget-object v8, Lcom/trendmicro/hippo/Undefined;->instance:Ljava/lang/Object;

    if-ne v7, v8, :cond_7

    .line 163
    instance-of v8, v6, Ljava/lang/Number;

    if-eqz v8, :cond_6

    .line 164
    move-object v8, v6

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    invoke-interface {v1, v8}, Lcom/trendmicro/hippo/Scriptable;->delete(I)V

    goto :goto_5

    .line 166
    :cond_6
    move-object v8, v6

    check-cast v8, Ljava/lang/String;

    invoke-interface {v1, v8}, Lcom/trendmicro/hippo/Scriptable;->delete(Ljava/lang/String;)V

    goto :goto_5

    .line 168
    :cond_7
    instance-of v8, v6, Ljava/lang/Number;

    if-eqz v8, :cond_8

    .line 169
    move-object v8, v6

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    invoke-interface {v1, v8, v1, v7}, Lcom/trendmicro/hippo/Scriptable;->put(ILcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    goto :goto_5

    .line 171
    :cond_8
    move-object v8, v6

    check-cast v8, Ljava/lang/String;

    invoke-interface {v1, v8, v1, v7}, Lcom/trendmicro/hippo/Scriptable;->put(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)V

    .line 160
    .end local v6    # "p":Ljava/lang/Object;
    .end local v7    # "newElement":Ljava/lang/Object;
    :goto_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 177
    .end local v1    # "val":Lcom/trendmicro/hippo/Scriptable;
    .end local v3    # "keys":[Ljava/lang/Object;
    :cond_9
    :goto_6
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p4, v1, v2

    const/4 v2, 0x1

    aput-object v0, v1, v2

    invoke-interface {p2, p0, p1, p3, v1}, Lcom/trendmicro/hippo/Callable;->call(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .param p1, "f"    # Lcom/trendmicro/hippo/IdFunctionObject;
    .param p2, "cx"    # Lcom/trendmicro/hippo/Context;
    .param p3, "scope"    # Lcom/trendmicro/hippo/Scriptable;
    .param p4, "thisObj"    # Lcom/trendmicro/hippo/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/trendmicro/hippo/NativeJSON;->JSON_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Lcom/trendmicro/hippo/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    invoke-super/range {p0 .. p5}, Lcom/trendmicro/hippo/IdScriptableObject;->execIdCall(Lcom/trendmicro/hippo/IdFunctionObject;Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Lcom/trendmicro/hippo/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 74
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/IdFunctionObject;->methodId()I

    move-result v0

    .line 75
    .local v0, "methodId":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_8

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-eq v0, v3, :cond_5

    const/4 v4, 0x3

    if-ne v0, v4, :cond_4

    .line 92
    const/4 v5, 0x0

    .local v5, "value":Ljava/lang/Object;
    const/4 v6, 0x0

    .local v6, "replacer":Ljava/lang/Object;
    const/4 v7, 0x0

    .line 93
    .local v7, "space":Ljava/lang/Object;
    array-length v8, p5

    if-eq v8, v1, :cond_3

    if-eq v8, v3, :cond_2

    if-eq v8, v4, :cond_1

    goto :goto_0

    .line 94
    :cond_1
    aget-object v7, p5, v3

    .line 95
    :cond_2
    aget-object v1, p5, v1

    move-object v6, v1

    .line 96
    :cond_3
    aget-object v5, p5, v2

    .line 100
    :goto_0
    invoke-static {p2, p3, v5, v6, v7}, Lcom/trendmicro/hippo/NativeJSON;->stringify(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 103
    .end local v5    # "value":Ljava/lang/Object;
    .end local v6    # "replacer":Ljava/lang/Object;
    .end local v7    # "space":Ljava/lang/Object;
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 80
    :cond_5
    invoke-static {p5, v2}, Lcom/trendmicro/hippo/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v2

    .line 81
    .local v2, "jtext":Ljava/lang/String;
    const/4 v3, 0x0

    .line 82
    .local v3, "reviver":Ljava/lang/Object;
    array-length v4, p5

    if-le v4, v1, :cond_6

    .line 83
    aget-object v3, p5, v1

    .line 85
    :cond_6
    instance-of v1, v3, Lcom/trendmicro/hippo/Callable;

    if-eqz v1, :cond_7

    .line 86
    move-object v1, v3

    check-cast v1, Lcom/trendmicro/hippo/Callable;

    invoke-static {p2, p3, v2, v1}, Lcom/trendmicro/hippo/NativeJSON;->parse(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;Lcom/trendmicro/hippo/Callable;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 88
    :cond_7
    invoke-static {p2, p3, v2}, Lcom/trendmicro/hippo/NativeJSON;->parse(Lcom/trendmicro/hippo/Context;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 77
    .end local v2    # "jtext":Ljava/lang/String;
    .end local v3    # "reviver":Ljava/lang/Object;
    :cond_8
    const-string v1, "JSON"

    return-object v1
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 485
    const/4 v0, 0x0

    .local v0, "id":I
    const/4 v1, 0x0

    .line 486
    .local v1, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x5

    if-eq v2, v3, :cond_2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_1

    const/16 v3, 0x9

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 489
    :cond_0
    const-string v1, "stringify"

    const/4 v0, 0x3

    goto :goto_0

    .line 488
    :cond_1
    const-string v1, "toSource"

    const/4 v0, 0x1

    goto :goto_0

    .line 487
    :cond_2
    const-string v1, "parse"

    const/4 v0, 0x2

    .line 491
    :goto_0
    if-eqz v1, :cond_3

    if-eq v1, p1, :cond_3

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const/4 v0, 0x0

    .line 494
    .end local v1    # "X":Ljava/lang/String;
    :cond_3
    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 47
    const-string v0, "JSON"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .locals 3
    .param p1, "id"    # I

    .line 52
    const/4 v0, 0x3

    if-gt p1, v0, :cond_3

    .line 55
    const/4 v1, 0x1

    if-eq p1, v1, :cond_2

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    if-ne p1, v0, :cond_0

    .line 58
    const/4 v0, 0x3

    .local v0, "arity":I
    const-string v1, "stringify"

    .local v1, "name":Ljava/lang/String;
    goto :goto_0

    .line 59
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_1
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "parse"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_0

    .line 56
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .line 61
    .restart local v1    # "name":Ljava/lang/String;
    :goto_0
    sget-object v2, Lcom/trendmicro/hippo/NativeJSON;->JSON_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lcom/trendmicro/hippo/NativeJSON;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)Lcom/trendmicro/hippo/IdFunctionObject;

    .line 62
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    nop

    .line 65
    return-void

    .line 63
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
