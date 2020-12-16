.class final Lcom/trendmicro/hippo/Kit$ComplexKey;
.super Ljava/lang/Object;
.source "Kit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Kit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ComplexKey"
.end annotation


# instance fields
.field private hash:I

.field private key1:Ljava/lang/Object;

.field private key2:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1, "key1"    # Ljava/lang/Object;
    .param p2, "key2"    # Ljava/lang/Object;

    .line 294
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    iput-object p1, p0, Lcom/trendmicro/hippo/Kit$ComplexKey;->key1:Ljava/lang/Object;

    .line 296
    iput-object p2, p0, Lcom/trendmicro/hippo/Kit$ComplexKey;->key2:Ljava/lang/Object;

    .line 297
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "anotherObj"    # Ljava/lang/Object;

    .line 302
    instance-of v0, p1, Lcom/trendmicro/hippo/Kit$ComplexKey;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 303
    return v1

    .line 304
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/Kit$ComplexKey;

    .line 305
    .local v0, "another":Lcom/trendmicro/hippo/Kit$ComplexKey;
    iget-object v2, p0, Lcom/trendmicro/hippo/Kit$ComplexKey;->key1:Ljava/lang/Object;

    iget-object v3, v0, Lcom/trendmicro/hippo/Kit$ComplexKey;->key1:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/trendmicro/hippo/Kit$ComplexKey;->key2:Ljava/lang/Object;

    iget-object v3, v0, Lcom/trendmicro/hippo/Kit$ComplexKey;->key2:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 311
    iget v0, p0, Lcom/trendmicro/hippo/Kit$ComplexKey;->hash:I

    if-nez v0, :cond_0

    .line 312
    iget-object v0, p0, Lcom/trendmicro/hippo/Kit$ComplexKey;->key1:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/trendmicro/hippo/Kit$ComplexKey;->key2:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/Kit$ComplexKey;->hash:I

    .line 314
    :cond_0
    iget v0, p0, Lcom/trendmicro/hippo/Kit$ComplexKey;->hash:I

    return v0
.end method
