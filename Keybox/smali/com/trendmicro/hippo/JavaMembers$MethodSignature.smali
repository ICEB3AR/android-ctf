.class final Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
.super Ljava/lang/Object;
.source "JavaMembers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/JavaMembers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MethodSignature"
.end annotation


# instance fields
.field private final args:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;[Ljava/lang/Class;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 395
    .local p2, "args":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 396
    iput-object p1, p0, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;->name:Ljava/lang/String;

    .line 397
    iput-object p2, p0, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;->args:[Ljava/lang/Class;

    .line 398
    return-void
.end method

.method constructor <init>(Ljava/lang/reflect/Method;)V
    .locals 2
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .line 402
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    .line 403
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .line 408
    instance-of v0, p1, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 410
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;

    .line 411
    .local v0, "ms":Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
    iget-object v2, v0, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;->args:[Ljava/lang/Class;

    iget-object v3, v0, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;->args:[Ljava/lang/Class;

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 413
    .end local v0    # "ms":Lcom/trendmicro/hippo/JavaMembers$MethodSignature;
    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 419
    iget-object v0, p0, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/trendmicro/hippo/JavaMembers$MethodSignature;->args:[Ljava/lang/Class;

    array-length v1, v1

    xor-int/2addr v0, v1

    return v0
.end method
