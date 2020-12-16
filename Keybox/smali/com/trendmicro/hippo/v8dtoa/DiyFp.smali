.class Lcom/trendmicro/hippo/v8dtoa/DiyFp;
.super Ljava/lang/Object;
.source "DiyFp.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final kSignificandSize:I = 0x40

.field static final kUint64MSB:J = -0x8000000000000000L


# instance fields
.field private e:I

.field private f:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 38
    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    .line 50
    return-void
.end method

.method constructor <init>(JI)V
    .locals 0
    .param p1, "f"    # J
    .param p3, "e"    # I

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-wide p1, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    .line 54
    iput p3, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    .line 55
    return-void
.end method

.method static minus(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .locals 4
    .param p0, "a"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .param p1, "b"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    .line 76
    new-instance v0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    iget-wide v1, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    iget v3, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    invoke-direct {v0, v1, v2, v3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>(JI)V

    .line 77
    .local v0, "result":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->subtract(Lcom/trendmicro/hippo/v8dtoa/DiyFp;)V

    .line 78
    return-object v0
.end method

.method static normalize(Lcom/trendmicro/hippo/v8dtoa/DiyFp;)Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .locals 4
    .param p0, "a"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    .line 134
    new-instance v0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    iget-wide v1, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    iget v3, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    invoke-direct {v0, v1, v2, v3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>(JI)V

    .line 135
    .local v0, "result":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->normalize()V

    .line 136
    return-object v0
.end method

.method static times(Lcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .locals 4
    .param p0, "a"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .param p1, "b"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    .line 108
    new-instance v0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    iget-wide v1, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    iget v3, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    invoke-direct {v0, v1, v2, v3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>(JI)V

    .line 109
    .local v0, "result":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->multiply(Lcom/trendmicro/hippo/v8dtoa/DiyFp;)V

    .line 110
    return-object v0
.end method

.method private static uint64_gte(JJ)Z
    .locals 6
    .param p0, "a"    # J
    .param p2, "b"    # J

    .line 59
    cmp-long v0, p0, p2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    cmp-long v0, p0, p2

    if-lez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-wide/16 v3, 0x0

    cmp-long v5, p0, v3

    if-gez v5, :cond_1

    move v5, v2

    goto :goto_1

    :cond_1
    move v5, v1

    :goto_1
    xor-int/2addr v0, v5

    cmp-long v3, p2, v3

    if-gez v3, :cond_2

    move v3, v2

    goto :goto_2

    :cond_2
    move v3, v1

    :goto_2
    xor-int/2addr v0, v3

    if-eqz v0, :cond_4

    :cond_3
    move v1, v2

    :cond_4
    return v1
.end method


# virtual methods
.method e()I
    .locals 1

    .line 140
    iget v0, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    return v0
.end method

.method f()J
    .locals 2

    .line 139
    iget-wide v0, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    return-wide v0
.end method

.method multiply(Lcom/trendmicro/hippo/v8dtoa/DiyFp;)V
    .locals 27
    .param p1, "other"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    .line 88
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-wide v2, 0xffffffffL

    .line 89
    .local v2, "kM32":J
    iget-wide v4, v0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    const/16 v6, 0x20

    ushr-long v7, v4, v6

    .line 90
    .local v7, "a":J
    const-wide v9, 0xffffffffL

    and-long/2addr v4, v9

    .line 91
    .local v4, "b":J
    iget-wide v11, v1, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    ushr-long v13, v11, v6

    .line 92
    .local v13, "c":J
    and-long/2addr v11, v9

    .line 93
    .local v11, "d":J
    mul-long v15, v7, v13

    .line 94
    .local v15, "ac":J
    mul-long v17, v4, v13

    .line 95
    .local v17, "bc":J
    mul-long v19, v7, v11

    .line 96
    .local v19, "ad":J
    mul-long v21, v4, v11

    .line 97
    .local v21, "bd":J
    ushr-long v23, v21, v6

    and-long v25, v19, v9

    add-long v23, v23, v25

    and-long v9, v17, v9

    add-long v23, v23, v9

    .line 100
    .local v23, "tmp":J
    const-wide v9, 0x80000000L

    add-long v23, v23, v9

    .line 101
    ushr-long v9, v19, v6

    add-long/2addr v9, v15

    ushr-long v25, v17, v6

    add-long v9, v9, v25

    ushr-long v25, v23, v6

    add-long v9, v9, v25

    .line 102
    .local v9, "result_f":J
    iget v6, v0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    move-wide/from16 v25, v2

    .end local v2    # "kM32":J
    .local v25, "kM32":J
    iget v2, v1, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    add-int/lit8 v2, v2, 0x40

    add-int/2addr v6, v2

    iput v6, v0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    .line 103
    iput-wide v9, v0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    .line 104
    return-void
.end method

.method normalize()V
    .locals 9

    .line 114
    nop

    .line 115
    iget-wide v0, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    .line 116
    .local v0, "f":J
    iget v2, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    .line 120
    .local v2, "e":I
    const-wide/high16 v3, -0x40000000000000L

    .line 121
    .local v3, "k10MSBits":J
    :goto_0
    const-wide/high16 v5, -0x40000000000000L

    and-long/2addr v5, v0

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-nez v5, :cond_0

    .line 122
    const/16 v5, 0xa

    shl-long/2addr v0, v5

    .line 123
    add-int/lit8 v2, v2, -0xa

    goto :goto_0

    .line 125
    :cond_0
    :goto_1
    const-wide/high16 v5, -0x8000000000000000L

    and-long/2addr v5, v0

    cmp-long v5, v5, v7

    if-nez v5, :cond_1

    .line 126
    const/4 v5, 0x1

    shl-long/2addr v0, v5

    .line 127
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 129
    :cond_1
    iput-wide v0, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    .line 130
    iput v2, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    .line 131
    return-void
.end method

.method setE(I)V
    .locals 0
    .param p1, "new_value"    # I

    .line 143
    iput p1, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    return-void
.end method

.method setF(J)V
    .locals 0
    .param p1, "new_value"    # J

    .line 142
    iput-wide p1, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    return-void
.end method

.method subtract(Lcom/trendmicro/hippo/v8dtoa/DiyFp;)V
    .locals 4
    .param p1, "other"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    .line 67
    nop

    .line 68
    nop

    .line 69
    iget-wide v0, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    iget-wide v2, p1, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    .line 70
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[DiyFp f:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", e:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
