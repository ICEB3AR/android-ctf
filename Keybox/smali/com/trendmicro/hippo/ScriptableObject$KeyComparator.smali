.class public final Lcom/trendmicro/hippo/ScriptableObject$KeyComparator;
.super Ljava/lang/Object;
.source "ScriptableObject.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/ScriptableObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "KeyComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3047
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .line 3053
    instance-of v0, p1, Ljava/lang/Integer;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 3054
    instance-of v0, p2, Ljava/lang/Integer;

    const/4 v3, -0x1

    if-eqz v0, :cond_2

    .line 3055
    move-object v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 3056
    .local v0, "i1":I
    move-object v4, p2

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 3057
    .local v4, "i2":I
    if-ge v0, v4, :cond_0

    .line 3058
    return v3

    .line 3060
    :cond_0
    if-le v0, v4, :cond_1

    .line 3061
    return v1

    .line 3063
    :cond_1
    return v2

    .line 3065
    .end local v0    # "i1":I
    .end local v4    # "i2":I
    :cond_2
    return v3

    .line 3067
    :cond_3
    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_4

    .line 3068
    return v1

    .line 3070
    :cond_4
    return v2
.end method
