.class Lcom/trendmicro/hippo/ResolvedOverload;
.super Ljava/lang/Object;
.source "NativeJavaMethod.java"


# instance fields
.field final index:I

.field final types:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>([Ljava/lang/Object;I)V
    .locals 5
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "index"    # I

    .line 566
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 567
    iput p2, p0, Lcom/trendmicro/hippo/ResolvedOverload;->index:I

    .line 568
    array-length v0, p1

    new-array v0, v0, [Ljava/lang/Class;

    iput-object v0, p0, Lcom/trendmicro/hippo/ResolvedOverload;->types:[Ljava/lang/Class;

    .line 569
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v1, p1

    .local v1, "l":I
    :goto_0
    if-ge v0, v1, :cond_2

    .line 570
    aget-object v2, p1, v0

    .line 571
    .local v2, "arg":Ljava/lang/Object;
    instance-of v3, v2, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v3, :cond_0

    .line 572
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v3}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v2

    .line 573
    :cond_0
    iget-object v3, p0, Lcom/trendmicro/hippo/ResolvedOverload;->types:[Ljava/lang/Class;

    if-nez v2, :cond_1

    const/4 v4, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    :goto_1
    aput-object v4, v3, v0

    .line 569
    .end local v2    # "arg":Ljava/lang/Object;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 575
    .end local v0    # "i":I
    .end local v1    # "l":I
    :cond_2
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 596
    instance-of v0, p1, Lcom/trendmicro/hippo/ResolvedOverload;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 597
    return v1

    .line 599
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/ResolvedOverload;

    .line 600
    .local v0, "ovl":Lcom/trendmicro/hippo/ResolvedOverload;
    iget-object v2, p0, Lcom/trendmicro/hippo/ResolvedOverload;->types:[Ljava/lang/Class;

    iget-object v3, v0, Lcom/trendmicro/hippo/ResolvedOverload;->types:[Ljava/lang/Class;

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/trendmicro/hippo/ResolvedOverload;->index:I

    iget v3, v0, Lcom/trendmicro/hippo/ResolvedOverload;->index:I

    if-ne v2, v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 605
    iget-object v0, p0, Lcom/trendmicro/hippo/ResolvedOverload;->types:[Ljava/lang/Class;

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method matches([Ljava/lang/Object;)Z
    .locals 6
    .param p1, "args"    # [Ljava/lang/Object;

    .line 578
    array-length v0, p1

    iget-object v1, p0, Lcom/trendmicro/hippo/ResolvedOverload;->types:[Ljava/lang/Class;

    array-length v1, v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 579
    return v2

    .line 581
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v1, p1

    .local v1, "l":I
    :goto_0
    if-ge v0, v1, :cond_4

    .line 582
    aget-object v3, p1, v0

    .line 583
    .local v3, "arg":Ljava/lang/Object;
    instance-of v4, v3, Lcom/trendmicro/hippo/Wrapper;

    if-eqz v4, :cond_1

    .line 584
    move-object v4, v3

    check-cast v4, Lcom/trendmicro/hippo/Wrapper;

    invoke-interface {v4}, Lcom/trendmicro/hippo/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v3

    .line 585
    :cond_1
    if-nez v3, :cond_2

    .line 586
    iget-object v4, p0, Lcom/trendmicro/hippo/ResolvedOverload;->types:[Ljava/lang/Class;

    aget-object v4, v4, v0

    if-eqz v4, :cond_3

    return v2

    .line 587
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    iget-object v5, p0, Lcom/trendmicro/hippo/ResolvedOverload;->types:[Ljava/lang/Class;

    aget-object v5, v5, v0

    if-eq v4, v5, :cond_3

    .line 588
    return v2

    .line 581
    .end local v3    # "arg":Ljava/lang/Object;
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 591
    .end local v0    # "i":I
    .end local v1    # "l":I
    :cond_4
    const/4 v0, 0x1

    return v0
.end method
