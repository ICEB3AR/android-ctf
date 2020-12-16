.class public Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;
.super Ljava/lang/Object;
.source "DoubleHelper.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final kDenormalExponent:I = -0x432

.field private static final kExponentBias:I = 0x433

.field static final kExponentMask:J = 0x7ff0000000000000L

.field static final kHiddenBit:J = 0x10000000000000L

.field static final kSignMask:J = -0x8000000000000000L

.field static final kSignificandMask:J = 0xfffffffffffffL

.field private static final kSignificandSize:I = 0x34


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 34
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static asDiyFp(J)Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .locals 4
    .param p0, "d64"    # J

    .line 42
    nop

    .line 43
    new-instance v0, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;->significand(J)J

    move-result-wide v1

    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;->exponent(J)I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>(JI)V

    return-object v0
.end method

.method static asNormalizedDiyFp(J)Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .locals 7
    .param p0, "d64"    # J

    .line 48
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;->significand(J)J

    move-result-wide v0

    .line 49
    .local v0, "f":J
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;->exponent(J)I

    move-result v2

    .line 51
    .local v2, "e":I
    nop

    .line 54
    :goto_0
    const-wide/high16 v3, 0x10000000000000L

    and-long/2addr v3, v0

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_0

    .line 55
    const/4 v3, 0x1

    shl-long/2addr v0, v3

    .line 56
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 59
    :cond_0
    const/16 v3, 0xb

    shl-long/2addr v0, v3

    .line 60
    add-int/lit8 v2, v2, -0xb

    .line 61
    new-instance v3, Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    invoke-direct {v3, v0, v1, v2}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;-><init>(JI)V

    return-object v3
.end method

.method static exponent(J)I
    .locals 4
    .param p0, "d64"    # J

    .line 65
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;->isDenormal(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, -0x432

    return v0

    .line 67
    :cond_0
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    and-long/2addr v0, p0

    const/16 v2, 0x34

    ushr-long/2addr v0, v2

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    long-to-int v0, v0

    .line 68
    .local v0, "biased_e":I
    add-int/lit16 v1, v0, -0x433

    return v1
.end method

.method static isDenormal(J)Z
    .locals 4
    .param p0, "d64"    # J

    .line 81
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static isInfinite(J)Z
    .locals 4
    .param p0, "d64"    # J

    .line 97
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    and-long v2, p0, v0

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    const-wide v0, 0xfffffffffffffL

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static isNan(J)Z
    .locals 4
    .param p0, "d64"    # J

    .line 91
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    and-long v2, p0, v0

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    const-wide v0, 0xfffffffffffffL

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static isSpecial(J)Z
    .locals 4
    .param p0, "d64"    # J

    .line 87
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    and-long v2, p0, v0

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static normalizedBoundaries(JLcom/trendmicro/hippo/v8dtoa/DiyFp;Lcom/trendmicro/hippo/v8dtoa/DiyFp;)V
    .locals 7
    .param p0, "d64"    # J
    .param p2, "m_minus"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    .param p3, "m_plus"    # Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    .line 111
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;->asDiyFp(J)Lcom/trendmicro/hippo/v8dtoa/DiyFp;

    move-result-object v0

    .line 112
    .local v0, "v":Lcom/trendmicro/hippo/v8dtoa/DiyFp;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v1

    const-wide/high16 v3, 0x10000000000000L

    cmp-long v1, v1, v3

    const/4 v2, 0x1

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 113
    .local v1, "significand_is_zero":Z
    :goto_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v3

    shl-long/2addr v3, v2

    const-wide/16 v5, 0x1

    add-long/2addr v3, v5

    invoke-virtual {p3, v3, v4}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setF(J)V

    .line 114
    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {p3, v3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setE(I)V

    .line 115
    invoke-virtual {p3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->normalize()V

    .line 116
    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v3

    const/16 v4, -0x432

    if-eq v3, v4, :cond_1

    .line 123
    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    const/4 v4, 0x2

    shl-long/2addr v2, v4

    sub-long/2addr v2, v5

    invoke-virtual {p2, v2, v3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setF(J)V

    .line 124
    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-virtual {p2, v2}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setE(I)V

    goto :goto_1

    .line 126
    :cond_1
    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v3

    shl-long/2addr v3, v2

    sub-long/2addr v3, v5

    invoke-virtual {p2, v3, v4}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setF(J)V

    .line 127
    invoke-virtual {v0}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {p2, v3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setE(I)V

    .line 129
    :goto_1
    invoke-virtual {p2}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->f()J

    move-result-wide v2

    invoke-virtual {p2}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v4

    invoke-virtual {p3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v5

    sub-int/2addr v4, v5

    shl-long/2addr v2, v4

    invoke-virtual {p2, v2, v3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setF(J)V

    .line 130
    invoke-virtual {p3}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->e()I

    move-result v2

    invoke-virtual {p2, v2}, Lcom/trendmicro/hippo/v8dtoa/DiyFp;->setE(I)V

    .line 131
    return-void
.end method

.method static sign(J)I
    .locals 4
    .param p0, "d64"    # J

    .line 103
    const-wide/high16 v0, -0x8000000000000000L

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method static significand(J)J
    .locals 4
    .param p0, "d64"    # J

    .line 72
    const-wide v0, 0xfffffffffffffL

    and-long/2addr v0, p0

    .line 73
    .local v0, "significand":J
    invoke-static {p0, p1}, Lcom/trendmicro/hippo/v8dtoa/DoubleHelper;->isDenormal(J)Z

    move-result v2

    if-nez v2, :cond_0

    .line 74
    const-wide/high16 v2, 0x10000000000000L

    add-long/2addr v2, v0

    return-wide v2

    .line 76
    :cond_0
    return-wide v0
.end method
