.class public Lcom/trendmicro/keybox/Oracle;
.super Ljava/lang/Object;
.source "Oracle.java"


# instance fields
.field private final S:[B

.field private final T:[B

.field private final keylen:I


# direct methods
.method public constructor <init>([B)V
    .locals 6
    .param p1, "key"    # [B

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const/16 v0, 0x100

    new-array v1, v0, [B

    iput-object v1, p0, Lcom/trendmicro/keybox/Oracle;->S:[B

    .line 5
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/trendmicro/keybox/Oracle;->T:[B

    .line 9
    array-length v1, p1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_2

    array-length v1, p1

    if-gt v1, v0, :cond_2

    .line 12
    array-length v1, p1

    iput v1, p0, Lcom/trendmicro/keybox/Oracle;->keylen:I

    .line 13
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 14
    iget-object v2, p0, Lcom/trendmicro/keybox/Oracle;->S:[B

    int-to-byte v3, v1

    aput-byte v3, v2, v1

    .line 15
    iget-object v2, p0, Lcom/trendmicro/keybox/Oracle;->T:[B

    iget v3, p0, Lcom/trendmicro/keybox/Oracle;->keylen:I

    rem-int v3, v1, v3

    aget-byte v3, p1, v3

    aput-byte v3, v2, v1

    .line 13
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 17
    .end local v1    # "i":I
    :cond_0
    const/4 v1, 0x0

    .line 19
    .local v1, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v0, :cond_1

    .line 20
    iget-object v3, p0, Lcom/trendmicro/keybox/Oracle;->S:[B

    aget-byte v4, v3, v2

    add-int/2addr v4, v1

    iget-object v5, p0, Lcom/trendmicro/keybox/Oracle;->T:[B

    aget-byte v5, v5, v2

    add-int/2addr v4, v5

    and-int/lit16 v1, v4, 0xff

    .line 21
    aget-byte v4, v3, v1

    .line 22
    .local v4, "tmp":B
    aget-byte v5, v3, v2

    aput-byte v5, v3, v1

    .line 23
    aput-byte v4, v3, v2

    .line 19
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 26
    .end local v1    # "j":I
    .end local v2    # "i":I
    .end local v4    # "tmp":B
    :cond_1
    return-void

    .line 10
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "key exception"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public process([B)[B
    .locals 8
    .param p1, "plaintext"    # [B

    .line 29
    array-length v0, p1

    new-array v0, v0, [B

    .line 30
    .local v0, "ciphertext":[B
    const/4 v1, 0x0

    .local v1, "i":I
    const/4 v2, 0x0

    .line 32
    .local v2, "j":I
    const/4 v3, 0x0

    .local v3, "counter":I
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_0

    .line 33
    add-int/lit8 v4, v1, 0x1

    and-int/lit16 v1, v4, 0xff

    .line 34
    iget-object v4, p0, Lcom/trendmicro/keybox/Oracle;->S:[B

    aget-byte v5, v4, v1

    add-int/2addr v5, v2

    and-int/lit16 v2, v5, 0xff

    .line 35
    aget-byte v5, v4, v2

    .line 36
    .local v5, "tmp":B
    aget-byte v6, v4, v1

    aput-byte v6, v4, v2

    .line 37
    aput-byte v5, v4, v1

    .line 38
    aget-byte v6, v4, v1

    aget-byte v7, v4, v2

    add-int/2addr v6, v7

    and-int/lit16 v6, v6, 0xff

    .line 39
    .local v6, "t":I
    aget-byte v4, v4, v6

    .line 40
    .local v4, "k":I
    aget-byte v7, p1, v3

    xor-int/2addr v7, v4

    int-to-byte v7, v7

    aput-byte v7, v0, v3

    .line 32
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 42
    .end local v3    # "counter":I
    .end local v4    # "k":I
    .end local v5    # "tmp":B
    .end local v6    # "t":I
    :cond_0
    return-object v0
.end method
