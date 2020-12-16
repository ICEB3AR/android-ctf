.class public Lcom/trendmicro/hippo/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;
.super Ljava/lang/Object;
.source "DefaultUrlConnectionExpiryCalculator.java"

# interfaces
.implements Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final relativeExpiry:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 29
    const-wide/32 v0, 0xea60

    invoke-direct {p0, v0, v1}, Lcom/trendmicro/hippo/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;-><init>(J)V

    .line 30
    return-void
.end method

.method public constructor <init>(J)V
    .locals 2
    .param p1, "relativeExpiry"    # J

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 41
    iput-wide p1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;->relativeExpiry:J

    .line 42
    return-void

    .line 39
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "relativeExpiry < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public calculateExpiry(Ljava/net/URLConnection;)J
    .locals 4
    .param p1, "urlConnection"    # Ljava/net/URLConnection;

    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/trendmicro/hippo/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;->relativeExpiry:J

    add-long/2addr v0, v2

    return-wide v0
.end method
