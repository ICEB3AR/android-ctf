.class Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;
.super Ljava/lang/Object;
.source "ShellConsole.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field private completeMethod:Ljava/lang/reflect/Method;

.field private global:Lcom/trendmicro/hippo/Scriptable;


# direct methods
.method constructor <init>(Ljava/lang/Class;Lcom/trendmicro/hippo/Scriptable;)V
    .locals 3
    .param p2, "global"    # Lcom/trendmicro/hippo/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/trendmicro/hippo/Scriptable;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 421
    .local p1, "completorClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 422
    iput-object p2, p0, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;->global:Lcom/trendmicro/hippo/Scriptable;

    .line 423
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v1

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v1, 0x2

    const-class v2, Ljava/util/List;

    aput-object v2, v0, v1

    const-string v1, "complete"

    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;->completeMethod:Ljava/lang/reflect/Method;

    .line 425
    return-void
.end method


# virtual methods
.method public complete(Ljava/lang/String;ILjava/util/List;)I
    .locals 10
    .param p1, "buffer"    # Ljava/lang/String;
    .param p2, "cursor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 445
    .local p3, "candidates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    add-int/lit8 v0, p2, -0x1

    .line 446
    .local v0, "m":I
    :goto_0
    if-ltz v0, :cond_1

    .line 447
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 448
    .local v1, "c":C
    invoke-static {v1}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v2

    if-nez v2, :cond_0

    const/16 v2, 0x2e

    if-eq v1, v2, :cond_0

    .line 449
    goto :goto_1

    .line 450
    :cond_0
    nop

    .end local v1    # "c":C
    add-int/lit8 v0, v0, -0x1

    .line 451
    goto :goto_0

    .line 452
    :cond_1
    :goto_1
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 453
    .local v1, "namesAndDots":Ljava/lang/String;
    const-string v2, "\\."

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    .line 454
    .local v2, "names":[Ljava/lang/String;
    iget-object v3, p0, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;->global:Lcom/trendmicro/hippo/Scriptable;

    .line 455
    .local v3, "obj":Lcom/trendmicro/hippo/Scriptable;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    array-length v5, v2

    add-int/lit8 v5, v5, -0x1

    if-ge v4, v5, :cond_3

    .line 456
    aget-object v5, v2, v4

    iget-object v6, p0, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;->global:Lcom/trendmicro/hippo/Scriptable;

    invoke-interface {v3, v5, v6}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    .line 457
    .local v5, "val":Ljava/lang/Object;
    instance-of v6, v5, Lcom/trendmicro/hippo/Scriptable;

    if-eqz v6, :cond_2

    .line 458
    move-object v3, v5

    check-cast v3, Lcom/trendmicro/hippo/Scriptable;

    .line 455
    .end local v5    # "val":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 460
    .restart local v5    # "val":Ljava/lang/Object;
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    return v6

    .line 463
    .end local v4    # "i":I
    .end local v5    # "val":Ljava/lang/Object;
    :cond_3
    instance-of v4, v3, Lcom/trendmicro/hippo/ScriptableObject;

    if-eqz v4, :cond_4

    .line 464
    move-object v4, v3

    check-cast v4, Lcom/trendmicro/hippo/ScriptableObject;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v4

    goto :goto_3

    .line 465
    :cond_4
    invoke-interface {v3}, Lcom/trendmicro/hippo/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v4

    :goto_3
    nop

    .line 466
    .local v4, "ids":[Ljava/lang/Object;
    array-length v5, v2

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v2, v5

    .line 467
    .local v5, "lastPart":Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_4
    array-length v7, v4

    if-ge v6, v7, :cond_8

    .line 468
    aget-object v7, v4, v6

    instance-of v7, v7, Ljava/lang/String;

    if-nez v7, :cond_5

    .line 469
    goto :goto_5

    .line 470
    :cond_5
    aget-object v7, v4, v6

    check-cast v7, Ljava/lang/String;

    .line 471
    .local v7, "id":Ljava/lang/String;
    invoke-virtual {v7, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 472
    invoke-interface {v3, v7, v3}, Lcom/trendmicro/hippo/Scriptable;->get(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;)Ljava/lang/Object;

    move-result-object v8

    instance-of v8, v8, Lcom/trendmicro/hippo/Function;

    if-eqz v8, :cond_6

    .line 473
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 474
    :cond_6
    invoke-interface {p3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 467
    .end local v7    # "id":Ljava/lang/String;
    :cond_7
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 477
    .end local v6    # "i":I
    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v6, v7

    return v6
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;

    .line 430
    iget-object v0, p0, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;->completeMethod:Ljava/lang/reflect/Method;

    invoke-virtual {p2, v0}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 431
    const/4 v0, 0x0

    aget-object v0, p3, v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x1

    aget-object v1, p3, v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x2

    aget-object v2, p3, v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {p0, v0, v1, v2}, Lcom/trendmicro/hippo/tools/shell/FlexibleCompletor;->complete(Ljava/lang/String;ILjava/util/List;)I

    move-result v0

    .line 433
    .local v0, "result":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    return-object v1

    .line 435
    .end local v0    # "result":I
    :cond_0
    new-instance v0, Ljava/lang/NoSuchMethodError;

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v0
.end method
