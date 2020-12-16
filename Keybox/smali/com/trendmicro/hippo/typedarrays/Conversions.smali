.class public Lcom/trendmicro/hippo/typedarrays/Conversions;
.super Ljava/lang/Object;
.source "Conversions.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toInt16(Ljava/lang/Object;)I
    .locals 1
    .param p0, "arg"    # Ljava/lang/Object;

    .line 53
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    int-to-short v0, v0

    return v0
.end method

.method public static toInt32(Ljava/lang/Object;)I
    .locals 1
    .param p0, "arg"    # Ljava/lang/Object;

    .line 63
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public static toInt8(Ljava/lang/Object;)I
    .locals 1
    .param p0, "arg"    # Ljava/lang/Object;

    .line 19
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method public static toUint16(Ljava/lang/Object;)I
    .locals 2
    .param p0, "arg"    # Ljava/lang/Object;

    .line 58
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method public static toUint32(Ljava/lang/Object;)J
    .locals 2
    .param p0, "arg"    # Ljava/lang/Object;

    .line 68
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static toUint8(Ljava/lang/Object;)I
    .locals 1
    .param p0, "arg"    # Ljava/lang/Object;

    .line 24
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public static toUint8Clamp(Ljava/lang/Object;)I
    .locals 8
    .param p0, "arg"    # Ljava/lang/Object;

    .line 29
    invoke-static {p0}, Lcom/trendmicro/hippo/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 30
    .local v0, "d":D
    const-wide/16 v2, 0x0

    cmpg-double v2, v0, v2

    if-gtz v2, :cond_0

    .line 31
    const/4 v2, 0x0

    return v2

    .line 33
    :cond_0
    const-wide v2, 0x406fe00000000000L    # 255.0

    cmpl-double v2, v0, v2

    if-ltz v2, :cond_1

    .line 34
    const/16 v2, 0xff

    return v2

    .line 38
    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    .line 39
    .local v2, "f":D
    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    add-double v6, v2, v4

    cmpg-double v6, v6, v0

    if-gez v6, :cond_2

    .line 40
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    add-double/2addr v4, v2

    double-to-int v4, v4

    return v4

    .line 42
    :cond_2
    add-double/2addr v4, v2

    cmpg-double v4, v0, v4

    if-gez v4, :cond_3

    .line 43
    double-to-int v4, v2

    return v4

    .line 45
    :cond_3
    double-to-int v4, v2

    rem-int/lit8 v4, v4, 0x2

    if-eqz v4, :cond_4

    .line 46
    double-to-int v4, v2

    add-int/lit8 v4, v4, 0x1

    return v4

    .line 48
    :cond_4
    double-to-int v4, v2

    return v4
.end method
