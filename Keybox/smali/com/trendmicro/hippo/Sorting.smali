.class public final Lcom/trendmicro/hippo/Sorting;
.super Ljava/lang/Object;
.source "Sorting.java"


# static fields
.field private static final SMALLSORT:I = 0x10

.field private static final sorting:Lcom/trendmicro/hippo/Sorting;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    new-instance v0, Lcom/trendmicro/hippo/Sorting;

    invoke-direct {v0}, Lcom/trendmicro/hippo/Sorting;-><init>()V

    sput-object v0, Lcom/trendmicro/hippo/Sorting;->sorting:Lcom/trendmicro/hippo/Sorting;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get()Lcom/trendmicro/hippo/Sorting;
    .locals 1

    .line 17
    sget-object v0, Lcom/trendmicro/hippo/Sorting;->sorting:Lcom/trendmicro/hippo/Sorting;

    return-object v0
.end method

.method private hybridSort([Ljava/lang/Object;IILjava/util/Comparator;I)V
    .locals 8
    .param p1, "a"    # [Ljava/lang/Object;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p5, "maxdepth"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "II",
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;I)V"
        }
    .end annotation

    .line 53
    .local p4, "cmp":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    if-ge p2, p3, :cond_2

    .line 54
    if-eqz p5, :cond_1

    sub-int v0, p3, p2

    const/16 v1, 0x10

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 57
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Sorting;->partition([Ljava/lang/Object;IILjava/util/Comparator;)I

    move-result v0

    .line 58
    .local v0, "p":I
    add-int/lit8 v7, p5, -0x1

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, v0

    move-object v6, p4

    invoke-direct/range {v2 .. v7}, Lcom/trendmicro/hippo/Sorting;->hybridSort([Ljava/lang/Object;IILjava/util/Comparator;I)V

    .line 59
    add-int/lit8 v3, v0, 0x1

    add-int/lit8 v6, p5, -0x1

    move-object v1, p0

    move-object v2, p1

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/Sorting;->hybridSort([Ljava/lang/Object;IILjava/util/Comparator;I)V

    goto :goto_1

    .line 55
    .end local v0    # "p":I
    :cond_1
    :goto_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Sorting;->insertionSort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 62
    :cond_2
    :goto_1
    return-void
.end method

.method private insertionSort([Ljava/lang/Object;IILjava/util/Comparator;)V
    .locals 5
    .param p1, "a"    # [Ljava/lang/Object;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "II",
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 27
    .local p4, "cmp":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    move v0, p2

    .line 28
    .local v0, "i":I
    :goto_0
    if-gt v0, p3, :cond_1

    .line 29
    aget-object v1, p1, v0

    .line 30
    .local v1, "x":Ljava/lang/Object;
    add-int/lit8 v2, v0, -0x1

    .line 31
    .local v2, "j":I
    :goto_1
    if-lt v2, p2, :cond_0

    aget-object v3, p1, v2

    invoke-interface {p4, v3, v1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    if-lez v3, :cond_0

    .line 32
    add-int/lit8 v3, v2, 0x1

    aget-object v4, p1, v2

    aput-object v4, p1, v3

    .line 33
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 35
    :cond_0
    add-int/lit8 v3, v2, 0x1

    aput-object v1, p1, v3

    .line 36
    nop

    .end local v1    # "x":Ljava/lang/Object;
    .end local v2    # "j":I
    add-int/lit8 v0, v0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method private log2(I)I
    .locals 4
    .param p1, "n"    # I

    .line 109
    int-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->log10(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->log10(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method private partition([Ljava/lang/Object;IILjava/util/Comparator;)I
    .locals 5
    .param p1, "a"    # [Ljava/lang/Object;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "II",
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    .line 71
    .local p4, "cmp":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/Sorting;->median([Ljava/lang/Object;IILjava/util/Comparator;)I

    move-result v0

    .line 72
    .local v0, "p":I
    aget-object v1, p1, v0

    .line 73
    .local v1, "pivot":Ljava/lang/Object;
    aget-object v2, p1, p2

    aput-object v2, p1, v0

    .line 74
    aput-object v1, p1, p2

    .line 76
    move v2, p2

    .line 77
    .local v2, "i":I
    add-int/lit8 v3, p3, 0x1

    .line 80
    .local v3, "j":I
    :cond_0
    :goto_0
    add-int/lit8 v2, v2, 0x1

    aget-object v4, p1, v2

    invoke-interface {p4, v4, v1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-gez v4, :cond_1

    .line 81
    if-ne v2, p3, :cond_0

    .line 85
    :cond_1
    add-int/lit8 v3, v3, -0x1

    aget-object v4, p1, v3

    invoke-interface {p4, v4, v1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-ltz v4, :cond_2

    .line 86
    if-ne v3, p2, :cond_1

    .line 90
    :cond_2
    if-lt v2, v3, :cond_3

    .line 91
    nop

    .line 96
    invoke-direct {p0, p1, p2, v3}, Lcom/trendmicro/hippo/Sorting;->swap([Ljava/lang/Object;II)V

    .line 97
    return v3

    .line 93
    :cond_3
    invoke-direct {p0, p1, v2, v3}, Lcom/trendmicro/hippo/Sorting;->swap([Ljava/lang/Object;II)V

    goto :goto_0
.end method

.method private swap([Ljava/lang/Object;II)V
    .locals 2
    .param p1, "a"    # [Ljava/lang/Object;
    .param p2, "l"    # I
    .param p3, "h"    # I

    .line 102
    aget-object v0, p1, p2

    .line 103
    .local v0, "tmp":Ljava/lang/Object;
    aget-object v1, p1, p3

    aput-object v1, p1, p2

    .line 104
    aput-object v0, p1, p3

    .line 105
    return-void
.end method


# virtual methods
.method public hybridSort([Ljava/lang/Object;Ljava/util/Comparator;)V
    .locals 7
    .param p1, "a"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 48
    .local p2, "cmp":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    array-length v0, p1

    add-int/lit8 v4, v0, -0x1

    array-length v0, p1

    invoke-direct {p0, v0}, Lcom/trendmicro/hippo/Sorting;->log2(I)I

    move-result v0

    mul-int/lit8 v6, v0, 0x2

    const/4 v3, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/Sorting;->hybridSort([Ljava/lang/Object;IILjava/util/Comparator;I)V

    .line 49
    return-void
.end method

.method public insertionSort([Ljava/lang/Object;Ljava/util/Comparator;)V
    .locals 2
    .param p1, "a"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 22
    .local p2, "cmp":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0, p2}, Lcom/trendmicro/hippo/Sorting;->insertionSort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 23
    return-void
.end method

.method public median([Ljava/lang/Object;IILjava/util/Comparator;)I
    .locals 4
    .param p1, "a"    # [Ljava/lang/Object;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "II",
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    .line 118
    .local p4, "cmp":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    sub-int v0, p3, p2

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p2

    .line 119
    .local v0, "m":I
    move v1, p2

    .line 121
    .local v1, "smallest":I
    aget-object v2, p1, v1

    aget-object v3, p1, v0

    invoke-interface {p4, v2, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-lez v2, :cond_0

    .line 122
    move v1, v0

    .line 124
    :cond_0
    aget-object v2, p1, v1

    aget-object v3, p1, p3

    invoke-interface {p4, v2, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-lez v2, :cond_1

    .line 125
    move v1, p3

    .line 128
    :cond_1
    if-ne v1, p2, :cond_3

    .line 129
    aget-object v2, p1, v0

    aget-object v3, p1, p3

    invoke-interface {p4, v2, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-gez v2, :cond_2

    move v2, v0

    goto :goto_0

    :cond_2
    move v2, p3

    :goto_0
    return v2

    .line 131
    :cond_3
    if-ne v1, v0, :cond_5

    .line 132
    aget-object v2, p1, p2

    aget-object v3, p1, p3

    invoke-interface {p4, v2, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-gez v2, :cond_4

    move v2, p2

    goto :goto_1

    :cond_4
    move v2, p3

    :goto_1
    return v2

    .line 134
    :cond_5
    aget-object v2, p1, p2

    aget-object v3, p1, v0

    invoke-interface {p4, v2, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-gez v2, :cond_6

    move v2, p2

    goto :goto_2

    :cond_6
    move v2, v0

    :goto_2
    return v2
.end method
