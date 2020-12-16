.class public Lcom/trendmicro/hippo/typedarrays/ByteIo;
.super Ljava/lang/Object;
.source "ByteIo.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static doReadInt16([BIZ)S
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "littleEndian"    # Z

    .line 34
    if-eqz p2, :cond_0

    .line 35
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0

    .line 39
    :cond_0
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method private static doWriteInt16([BIIZ)V
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # I
    .param p3, "littleEndian"    # Z

    .line 46
    if-eqz p3, :cond_0

    .line 47
    and-int/lit16 v0, p2, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 48
    add-int/lit8 v0, p1, 0x1

    ushr-int/lit8 v1, p2, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    goto :goto_0

    .line 50
    :cond_0
    ushr-int/lit8 v0, p2, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 51
    add-int/lit8 v0, p1, 0x1

    and-int/lit16 v1, p2, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 53
    :goto_0
    return-void
.end method

.method public static readFloat32([BIZ)Ljava/lang/Object;
    .locals 3
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "littleEndian"    # Z

    .line 193
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readUint32Primitive([BIZ)J

    move-result-wide v0

    .line 194
    .local v0, "base":J
    long-to-int v2, v0

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    return-object v2
.end method

.method public static readFloat64([BIZ)Ljava/lang/Object;
    .locals 4
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "littleEndian"    # Z

    .line 205
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readUint64Primitive([BIZ)J

    move-result-wide v0

    .line 206
    .local v0, "base":J
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    return-object v2
.end method

.method public static readInt16([BIZ)Ljava/lang/Object;
    .locals 1
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "littleEndian"    # Z

    .line 57
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->doReadInt16([BIZ)S

    move-result v0

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    return-object v0
.end method

.method public static readInt32([BIZ)Ljava/lang/Object;
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "littleEndian"    # Z

    .line 77
    if-eqz p2, :cond_0

    .line 78
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    .line 79
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 78
    return-object v0

    .line 84
    :cond_0
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 85
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 84
    return-object v0
.end method

.method public static readInt8([BI)Ljava/lang/Object;
    .locals 1
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .line 13
    aget-byte v0, p0, p1

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    return-object v0
.end method

.method public static readUint16([BIZ)Ljava/lang/Object;
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "littleEndian"    # Z

    .line 67
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->doReadInt16([BIZ)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static readUint32([BIZ)Ljava/lang/Object;
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "littleEndian"    # Z

    .line 141
    invoke-static {p0, p1, p2}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->readUint32Primitive([BIZ)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public static readUint32Primitive([BIZ)J
    .locals 11
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "littleEndian"    # Z

    .line 108
    const-wide v0, 0xffffffffL

    const/16 v2, 0x8

    const/16 v3, 0x10

    const/16 v4, 0x18

    const-wide/16 v5, 0xff

    if-eqz p2, :cond_0

    .line 109
    aget-byte v7, p0, p1

    int-to-long v7, v7

    and-long/2addr v7, v5

    add-int/lit8 v9, p1, 0x1

    aget-byte v9, p0, v9

    int-to-long v9, v9

    and-long/2addr v9, v5

    shl-long/2addr v9, v2

    or-long/2addr v7, v9

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    int-to-long v9, v2

    and-long/2addr v9, v5

    shl-long v2, v9, v3

    or-long/2addr v2, v7

    add-int/lit8 v7, p1, 0x3

    aget-byte v7, p0, v7

    int-to-long v7, v7

    and-long/2addr v5, v7

    shl-long v4, v5, v4

    or-long/2addr v2, v4

    and-long/2addr v0, v2

    return-wide v0

    .line 116
    :cond_0
    aget-byte v7, p0, p1

    int-to-long v7, v7

    and-long/2addr v7, v5

    shl-long/2addr v7, v4

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    int-to-long v9, v4

    and-long/2addr v9, v5

    shl-long v3, v9, v3

    or-long/2addr v3, v7

    add-int/lit8 v7, p1, 0x2

    aget-byte v7, p0, v7

    int-to-long v7, v7

    and-long/2addr v7, v5

    shl-long/2addr v7, v2

    or-long v2, v3, v7

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    int-to-long v7, v4

    and-long v4, v7, v5

    or-long/2addr v2, v4

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public static readUint64Primitive([BIZ)J
    .locals 13
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "littleEndian"    # Z

    .line 146
    const/16 v0, 0x8

    const/16 v1, 0x10

    const/16 v2, 0x18

    const/16 v3, 0x20

    const/16 v4, 0x28

    const/16 v5, 0x30

    const/16 v6, 0x38

    const-wide/16 v7, 0xff

    if-eqz p2, :cond_0

    .line 147
    aget-byte v9, p0, p1

    int-to-long v9, v9

    and-long/2addr v9, v7

    add-int/lit8 v11, p1, 0x1

    aget-byte v11, p0, v11

    int-to-long v11, v11

    and-long/2addr v11, v7

    shl-long/2addr v11, v0

    or-long/2addr v9, v11

    add-int/lit8 v0, p1, 0x2

    aget-byte v0, p0, v0

    int-to-long v11, v0

    and-long/2addr v11, v7

    shl-long v0, v11, v1

    or-long/2addr v0, v9

    add-int/lit8 v9, p1, 0x3

    aget-byte v9, p0, v9

    int-to-long v9, v9

    and-long/2addr v9, v7

    shl-long/2addr v9, v2

    or-long/2addr v0, v9

    add-int/lit8 v2, p1, 0x4

    aget-byte v2, p0, v2

    int-to-long v9, v2

    and-long/2addr v9, v7

    shl-long v2, v9, v3

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x5

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v7

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x6

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v7

    shl-long/2addr v2, v5

    or-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x7

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v7

    shl-long/2addr v2, v6

    or-long/2addr v0, v2

    return-wide v0

    .line 157
    :cond_0
    aget-byte v9, p0, p1

    int-to-long v9, v9

    and-long/2addr v9, v7

    shl-long/2addr v9, v6

    add-int/lit8 v6, p1, 0x1

    aget-byte v6, p0, v6

    int-to-long v11, v6

    and-long/2addr v11, v7

    shl-long v5, v11, v5

    or-long/2addr v5, v9

    add-int/lit8 v9, p1, 0x2

    aget-byte v9, p0, v9

    int-to-long v9, v9

    and-long/2addr v9, v7

    shl-long/2addr v9, v4

    or-long v4, v5, v9

    add-int/lit8 v6, p1, 0x3

    aget-byte v6, p0, v6

    int-to-long v9, v6

    and-long/2addr v9, v7

    shl-long/2addr v9, v3

    or-long v3, v4, v9

    add-int/lit8 v5, p1, 0x4

    aget-byte v5, p0, v5

    int-to-long v5, v5

    and-long/2addr v5, v7

    shl-long/2addr v5, v2

    or-long v2, v3, v5

    add-int/lit8 v4, p1, 0x5

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v7

    shl-long/2addr v4, v1

    or-long v1, v2, v4

    add-int/lit8 v3, p1, 0x6

    aget-byte v3, p0, v3

    int-to-long v3, v3

    and-long/2addr v3, v7

    shl-long/2addr v3, v0

    or-long v0, v1, v3

    add-int/lit8 v2, p1, 0x7

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v7

    const/4 v4, 0x0

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static readUint8([BI)Ljava/lang/Object;
    .locals 1
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .line 23
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static writeFloat32([BIDZ)V
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # D
    .param p4, "littleEndian"    # Z

    .line 199
    double-to-float v0, p2

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    int-to-long v0, v0

    .line 200
    .local v0, "base":J
    invoke-static {p0, p1, v0, v1, p4}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeUint32([BIJZ)V

    .line 201
    return-void
.end method

.method public static writeFloat64([BIDZ)V
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # D
    .param p4, "littleEndian"    # Z

    .line 211
    invoke-static {p2, p3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 212
    .local v0, "base":J
    invoke-static {p0, p1, v0, v1, p4}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->writeUint64([BIJZ)V

    .line 213
    return-void
.end method

.method public static writeInt16([BIIZ)V
    .locals 0
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # I
    .param p3, "littleEndian"    # Z

    .line 62
    invoke-static {p0, p1, p2, p3}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->doWriteInt16([BIIZ)V

    .line 63
    return-void
.end method

.method public static writeInt32([BIIZ)V
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # I
    .param p3, "littleEndian"    # Z

    .line 93
    if-eqz p3, :cond_0

    .line 94
    and-int/lit16 v0, p2, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 95
    add-int/lit8 v0, p1, 0x1

    ushr-int/lit8 v1, p2, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 96
    add-int/lit8 v0, p1, 0x2

    ushr-int/lit8 v1, p2, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 97
    add-int/lit8 v0, p1, 0x3

    ushr-int/lit8 v1, p2, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    goto :goto_0

    .line 99
    :cond_0
    ushr-int/lit8 v0, p2, 0x18

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 100
    add-int/lit8 v0, p1, 0x1

    ushr-int/lit8 v1, p2, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 101
    add-int/lit8 v0, p1, 0x2

    ushr-int/lit8 v1, p2, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 102
    add-int/lit8 v0, p1, 0x3

    and-int/lit16 v1, p2, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 104
    :goto_0
    return-void
.end method

.method public static writeInt8([BII)V
    .locals 1
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # I

    .line 18
    int-to-byte v0, p2

    aput-byte v0, p0, p1

    .line 19
    return-void
.end method

.method public static writeUint16([BIIZ)V
    .locals 1
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # I
    .param p3, "littleEndian"    # Z

    .line 72
    const v0, 0xffff

    and-int/2addr v0, p2

    invoke-static {p0, p1, v0, p3}, Lcom/trendmicro/hippo/typedarrays/ByteIo;->doWriteInt16([BIIZ)V

    .line 73
    return-void
.end method

.method public static writeUint32([BIJZ)V
    .locals 8
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # J
    .param p4, "littleEndian"    # Z

    .line 126
    const/16 v0, 0x8

    const/16 v1, 0x10

    const/16 v2, 0x18

    const-wide/16 v3, 0xff

    if-eqz p4, :cond_0

    .line 127
    and-long v5, p2, v3

    long-to-int v5, v5

    int-to-byte v5, v5

    aput-byte v5, p0, p1

    .line 128
    add-int/lit8 v5, p1, 0x1

    ushr-long v6, p2, v0

    and-long/2addr v6, v3

    long-to-int v0, v6

    int-to-byte v0, v0

    aput-byte v0, p0, v5

    .line 129
    add-int/lit8 v0, p1, 0x2

    ushr-long v5, p2, v1

    and-long/2addr v5, v3

    long-to-int v1, v5

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 130
    add-int/lit8 v0, p1, 0x3

    ushr-long v1, p2, v2

    and-long/2addr v1, v3

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    goto :goto_0

    .line 132
    :cond_0
    ushr-long v5, p2, v2

    and-long/2addr v5, v3

    long-to-int v2, v5

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 133
    add-int/lit8 v2, p1, 0x1

    ushr-long v5, p2, v1

    and-long/2addr v5, v3

    long-to-int v1, v5

    int-to-byte v1, v1

    aput-byte v1, p0, v2

    .line 134
    add-int/lit8 v1, p1, 0x2

    ushr-long v5, p2, v0

    and-long/2addr v5, v3

    long-to-int v0, v5

    int-to-byte v0, v0

    aput-byte v0, p0, v1

    .line 135
    add-int/lit8 v0, p1, 0x3

    and-long v1, p2, v3

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 137
    :goto_0
    return-void
.end method

.method public static writeUint64([BIJZ)V
    .locals 12
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # J
    .param p4, "littleEndian"    # Z

    .line 170
    const/16 v0, 0x8

    const/16 v1, 0x10

    const/16 v2, 0x18

    const/16 v3, 0x20

    const/16 v4, 0x28

    const/16 v5, 0x30

    const/16 v6, 0x38

    const-wide/16 v7, 0xff

    if-eqz p4, :cond_0

    .line 171
    and-long v9, p2, v7

    long-to-int v9, v9

    int-to-byte v9, v9

    aput-byte v9, p0, p1

    .line 172
    add-int/lit8 v9, p1, 0x1

    ushr-long v10, p2, v0

    and-long/2addr v10, v7

    long-to-int v0, v10

    int-to-byte v0, v0

    aput-byte v0, p0, v9

    .line 173
    add-int/lit8 v0, p1, 0x2

    ushr-long v9, p2, v1

    and-long/2addr v9, v7

    long-to-int v1, v9

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 174
    add-int/lit8 v0, p1, 0x3

    ushr-long v1, p2, v2

    and-long/2addr v1, v7

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 175
    add-int/lit8 v0, p1, 0x4

    ushr-long v1, p2, v3

    and-long/2addr v1, v7

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 176
    add-int/lit8 v0, p1, 0x5

    ushr-long v1, p2, v4

    and-long/2addr v1, v7

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 177
    add-int/lit8 v0, p1, 0x6

    ushr-long v1, p2, v5

    and-long/2addr v1, v7

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 178
    add-int/lit8 v0, p1, 0x7

    ushr-long v1, p2, v6

    and-long/2addr v1, v7

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    goto :goto_0

    .line 180
    :cond_0
    ushr-long v9, p2, v6

    and-long/2addr v9, v7

    long-to-int v6, v9

    int-to-byte v6, v6

    aput-byte v6, p0, p1

    .line 181
    add-int/lit8 v6, p1, 0x1

    ushr-long v9, p2, v5

    and-long/2addr v9, v7

    long-to-int v5, v9

    int-to-byte v5, v5

    aput-byte v5, p0, v6

    .line 182
    add-int/lit8 v5, p1, 0x2

    ushr-long v9, p2, v4

    and-long/2addr v9, v7

    long-to-int v4, v9

    int-to-byte v4, v4

    aput-byte v4, p0, v5

    .line 183
    add-int/lit8 v4, p1, 0x3

    ushr-long v5, p2, v3

    and-long/2addr v5, v7

    long-to-int v3, v5

    int-to-byte v3, v3

    aput-byte v3, p0, v4

    .line 184
    add-int/lit8 v3, p1, 0x4

    ushr-long v4, p2, v2

    and-long/2addr v4, v7

    long-to-int v2, v4

    int-to-byte v2, v2

    aput-byte v2, p0, v3

    .line 185
    add-int/lit8 v2, p1, 0x5

    ushr-long v3, p2, v1

    and-long/2addr v3, v7

    long-to-int v1, v3

    int-to-byte v1, v1

    aput-byte v1, p0, v2

    .line 186
    add-int/lit8 v1, p1, 0x6

    ushr-long v2, p2, v0

    and-long/2addr v2, v7

    long-to-int v0, v2

    int-to-byte v0, v0

    aput-byte v0, p0, v1

    .line 187
    add-int/lit8 v0, p1, 0x7

    and-long v1, p2, v7

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 189
    :goto_0
    return-void
.end method

.method public static writeUint8([BII)V
    .locals 1
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "val"    # I

    .line 28
    and-int/lit16 v0, p2, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 29
    return-void
.end method
