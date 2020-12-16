.class final Lcom/trendmicro/classfile/ConstantEntry;
.super Ljava/lang/Object;
.source "ConstantEntry.java"


# instance fields
.field private hashcode:I

.field private intval:I

.field private longval:J

.field private str1:Ljava/lang/String;

.field private str2:Ljava/lang/String;

.field private type:I


# direct methods
.method constructor <init>(IILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # I
    .param p2, "intval"    # I
    .param p3, "str1"    # Ljava/lang/String;
    .param p4, "str2"    # Ljava/lang/String;

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lcom/trendmicro/classfile/ConstantEntry;->type:I

    .line 19
    iput p2, p0, Lcom/trendmicro/classfile/ConstantEntry;->intval:I

    .line 20
    iput-object p3, p0, Lcom/trendmicro/classfile/ConstantEntry;->str1:Ljava/lang/String;

    .line 21
    iput-object p4, p0, Lcom/trendmicro/classfile/ConstantEntry;->str2:Ljava/lang/String;

    .line 22
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-virtual {p4}, Ljava/lang/String;->hashCode()I

    move-result v1

    mul-int/2addr v0, v1

    add-int/2addr v0, p2

    xor-int/2addr v0, p1

    iput v0, p0, Lcom/trendmicro/classfile/ConstantEntry;->hashcode:I

    .line 23
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;

    .line 32
    instance-of v0, p1, Lcom/trendmicro/classfile/ConstantEntry;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 33
    return v1

    .line 35
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/trendmicro/classfile/ConstantEntry;

    .line 36
    .local v0, "entry":Lcom/trendmicro/classfile/ConstantEntry;
    iget v2, p0, Lcom/trendmicro/classfile/ConstantEntry;->type:I

    iget v3, v0, Lcom/trendmicro/classfile/ConstantEntry;->type:I

    if-eq v2, v3, :cond_1

    .line 37
    return v1

    .line 39
    :cond_1
    const/4 v3, 0x3

    const/4 v4, 0x1

    if-eq v2, v3, :cond_8

    const/4 v3, 0x4

    if-eq v2, v3, :cond_8

    const/4 v3, 0x5

    if-eq v2, v3, :cond_6

    const/4 v3, 0x6

    if-eq v2, v3, :cond_6

    const/16 v3, 0xc

    if-eq v2, v3, :cond_4

    const/16 v3, 0x12

    if-ne v2, v3, :cond_3

    .line 49
    iget v2, p0, Lcom/trendmicro/classfile/ConstantEntry;->intval:I

    iget v3, v0, Lcom/trendmicro/classfile/ConstantEntry;->intval:I

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantEntry;->str1:Ljava/lang/String;

    iget-object v3, v0, Lcom/trendmicro/classfile/ConstantEntry;->str1:Ljava/lang/String;

    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantEntry;->str2:Ljava/lang/String;

    iget-object v3, v0, Lcom/trendmicro/classfile/ConstantEntry;->str2:Ljava/lang/String;

    .line 51
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    move v1, v4

    goto :goto_0

    :cond_2
    nop

    .line 49
    :goto_0
    return v1

    .line 53
    :cond_3
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "unsupported constant type"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 47
    :cond_4
    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantEntry;->str1:Ljava/lang/String;

    iget-object v3, v0, Lcom/trendmicro/classfile/ConstantEntry;->str1:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/trendmicro/classfile/ConstantEntry;->str2:Ljava/lang/String;

    iget-object v3, v0, Lcom/trendmicro/classfile/ConstantEntry;->str2:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    move v1, v4

    :cond_5
    return v1

    .line 45
    :cond_6
    iget-wide v2, p0, Lcom/trendmicro/classfile/ConstantEntry;->longval:J

    iget-wide v5, v0, Lcom/trendmicro/classfile/ConstantEntry;->longval:J

    cmp-long v2, v2, v5

    if-nez v2, :cond_7

    move v1, v4

    :cond_7
    return v1

    .line 42
    :cond_8
    iget v2, p0, Lcom/trendmicro/classfile/ConstantEntry;->intval:I

    iget v3, v0, Lcom/trendmicro/classfile/ConstantEntry;->intval:I

    if-ne v2, v3, :cond_9

    move v1, v4

    :cond_9
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 27
    iget v0, p0, Lcom/trendmicro/classfile/ConstantEntry;->hashcode:I

    return v0
.end method
