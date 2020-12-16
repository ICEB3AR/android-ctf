.class Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;
.super Ljava/lang/Object;
.source "JavaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/JavaAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "JavaAdapterSignature"
.end annotation


# instance fields
.field interfaces:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field names:Lcom/trendmicro/hippo/ObjToIntMap;

.field superClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Class;[Ljava/lang/Class;Lcom/trendmicro/hippo/ObjToIntMap;)V
    .locals 0
    .param p3, "names"    # Lcom/trendmicro/hippo/ObjToIntMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/trendmicro/hippo/ObjToIntMap;",
            ")V"
        }
    .end annotation

    .line 41
    .local p1, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->superClass:Ljava/lang/Class;

    .line 43
    iput-object p2, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    .line 44
    iput-object p3, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->names:Lcom/trendmicro/hippo/ObjToIntMap;

    .line 45
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;

    .line 50
    instance-of v0, p1, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 51
    return v1

    .line 52
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;

    .line 53
    .local v0, "sig":Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;
    iget-object v2, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->superClass:Ljava/lang/Class;

    iget-object v3, v0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->superClass:Ljava/lang/Class;

    if-eq v2, v3, :cond_1

    .line 54
    return v1

    .line 55
    :cond_1
    iget-object v2, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    iget-object v3, v0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    if-eq v2, v3, :cond_4

    .line 56
    array-length v2, v2

    array-length v3, v3

    if-eq v2, v3, :cond_2

    .line 57
    return v1

    .line 58
    :cond_2
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    array-length v4, v3

    if-ge v2, v4, :cond_4

    .line 59
    aget-object v3, v3, v2

    iget-object v4, v0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    aget-object v4, v4, v2

    if-eq v3, v4, :cond_3

    .line 60
    return v1

    .line 58
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 62
    .end local v2    # "i":I
    :cond_4
    iget-object v2, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->names:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap;->size()I

    move-result v2

    iget-object v3, v0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->names:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v3}, Lcom/trendmicro/hippo/ObjToIntMap;->size()I

    move-result v3

    if-eq v2, v3, :cond_5

    .line 63
    return v1

    .line 64
    :cond_5
    new-instance v2, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;

    iget-object v3, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->names:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-direct {v2, v3}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;-><init>(Lcom/trendmicro/hippo/ObjToIntMap;)V

    .line 65
    .local v2, "iter":Lcom/trendmicro/hippo/ObjToIntMap$Iterator;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->start()V

    :goto_1
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->done()Z

    move-result v3

    if-nez v3, :cond_7

    .line 66
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 67
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->getValue()I

    move-result v4

    .line 68
    .local v4, "arity":I
    iget-object v5, v0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->names:Lcom/trendmicro/hippo/ObjToIntMap;

    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v5, v3, v6}, Lcom/trendmicro/hippo/ObjToIntMap;->get(Ljava/lang/Object;I)I

    move-result v5

    if-eq v4, v5, :cond_6

    .line 69
    return v1

    .line 65
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "arity":I
    :cond_6
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ObjToIntMap$Iterator;->next()V

    goto :goto_1

    .line 71
    :cond_7
    const/4 v1, 0x1

    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 77
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->superClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->interfaces:[Ljava/lang/Class;

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/trendmicro/hippo/JavaAdapter$JavaAdapterSignature;->names:Lcom/trendmicro/hippo/ObjToIntMap;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ObjToIntMap;->size()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
