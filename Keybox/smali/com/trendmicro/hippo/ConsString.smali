.class public Lcom/trendmicro/hippo/ConsString;
.super Ljava/lang/Object;
.source "ConsString.java"

# interfaces
.implements Ljava/lang/CharSequence;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x750759072398571aL


# instance fields
.field private isFlat:Z

.field private left:Ljava/lang/CharSequence;

.field private final length:I

.field private right:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "str1"    # Ljava/lang/CharSequence;
    .param p2, "str2"    # Ljava/lang/CharSequence;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/trendmicro/hippo/ConsString;->left:Ljava/lang/CharSequence;

    .line 38
    iput-object p2, p0, Lcom/trendmicro/hippo/ConsString;->right:Ljava/lang/CharSequence;

    .line 39
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    iget-object v1, p0, Lcom/trendmicro/hippo/ConsString;->right:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/trendmicro/hippo/ConsString;->length:I

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/trendmicro/hippo/ConsString;->isFlat:Z

    .line 41
    return-void
.end method

.method private declared-synchronized flatten()Ljava/lang/String;
    .locals 7

    monitor-enter p0

    .line 54
    :try_start_0
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ConsString;->isFlat:Z

    if-nez v0, :cond_4

    .line 55
    iget v0, p0, Lcom/trendmicro/hippo/ConsString;->length:I

    new-array v0, v0, [C

    .line 56
    .local v0, "chars":[C
    iget v1, p0, Lcom/trendmicro/hippo/ConsString;->length:I

    .line 58
    .local v1, "charPos":I
    new-instance v2, Ljava/util/ArrayDeque;

    invoke-direct {v2}, Ljava/util/ArrayDeque;-><init>()V

    .line 59
    .local v2, "stack":Ljava/util/ArrayDeque;, "Ljava/util/ArrayDeque<Ljava/lang/CharSequence;>;"
    iget-object v3, p0, Lcom/trendmicro/hippo/ConsString;->left:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/util/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 61
    iget-object v3, p0, Lcom/trendmicro/hippo/ConsString;->right:Ljava/lang/CharSequence;

    .line 63
    .local v3, "next":Ljava/lang/CharSequence;
    :cond_0
    instance-of v4, v3, Lcom/trendmicro/hippo/ConsString;

    if-eqz v4, :cond_2

    .line 64
    move-object v4, v3

    check-cast v4, Lcom/trendmicro/hippo/ConsString;

    .line 65
    .local v4, "casted":Lcom/trendmicro/hippo/ConsString;
    iget-boolean v5, v4, Lcom/trendmicro/hippo/ConsString;->isFlat:Z

    if-eqz v5, :cond_1

    .line 66
    iget-object v5, v4, Lcom/trendmicro/hippo/ConsString;->left:Ljava/lang/CharSequence;

    move-object v3, v5

    goto :goto_0

    .line 68
    .end local p0    # "this":Lcom/trendmicro/hippo/ConsString;
    :cond_1
    iget-object v5, v4, Lcom/trendmicro/hippo/ConsString;->left:Ljava/lang/CharSequence;

    invoke-virtual {v2, v5}, Ljava/util/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 69
    iget-object v5, v4, Lcom/trendmicro/hippo/ConsString;->right:Ljava/lang/CharSequence;

    move-object v3, v5

    .line 70
    goto :goto_2

    .line 74
    .end local v4    # "casted":Lcom/trendmicro/hippo/ConsString;
    :cond_2
    :goto_0
    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    .line 75
    .local v4, "str":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v1, v5

    .line 76
    const/4 v5, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v4, v5, v6, v0, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 77
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v5, 0x0

    goto :goto_1

    :cond_3
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    :goto_1
    move-object v3, v5

    .line 78
    .end local v4    # "str":Ljava/lang/String;
    :goto_2
    if-nez v3, :cond_0

    .line 80
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([C)V

    iput-object v4, p0, Lcom/trendmicro/hippo/ConsString;->left:Ljava/lang/CharSequence;

    .line 81
    const-string v4, ""

    iput-object v4, p0, Lcom/trendmicro/hippo/ConsString;->right:Ljava/lang/CharSequence;

    .line 82
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/trendmicro/hippo/ConsString;->isFlat:Z

    .line 84
    .end local v0    # "chars":[C
    .end local v1    # "charPos":I
    .end local v2    # "stack":Ljava/util/ArrayDeque;, "Ljava/util/ArrayDeque<Ljava/lang/CharSequence;>;"
    .end local v3    # "next":Ljava/lang/CharSequence;
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/hippo/ConsString;->left:Ljava/lang/CharSequence;

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 53
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private writeReplace()Ljava/lang/Object;
    .locals 1

    .line 45
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ConsString;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public charAt(I)C
    .locals 2
    .param p1, "index"    # I

    .line 94
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ConsString;->isFlat:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ConsString;->left:Ljava/lang/CharSequence;

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/ConsString;->flatten()Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "str":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    return v1
.end method

.method public length()I
    .locals 1

    .line 89
    iget v0, p0, Lcom/trendmicro/hippo/ConsString;->length:I

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 100
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ConsString;->isFlat:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ConsString;->left:Ljava/lang/CharSequence;

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/ConsString;->flatten()Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, "str":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 50
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ConsString;->isFlat:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ConsString;->left:Ljava/lang/CharSequence;

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/trendmicro/hippo/ConsString;->flatten()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method
