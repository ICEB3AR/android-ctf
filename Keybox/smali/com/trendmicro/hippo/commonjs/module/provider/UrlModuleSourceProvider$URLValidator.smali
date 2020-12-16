.class Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
.super Ljava/lang/Object;
.source "UrlModuleSourceProvider.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "URLValidator"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final entityTags:Ljava/lang/String;

.field private expiry:J

.field private final lastModified:J

.field private final uri:Ljava/net/URI;


# direct methods
.method public constructor <init>(Ljava/net/URI;Ljava/net/URLConnection;JLcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;)V
    .locals 2
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "urlConnection"    # Ljava/net/URLConnection;
    .param p3, "request_time"    # J
    .param p5, "urlConnectionExpiryCalculator"    # Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;

    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 254
    iput-object p1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->uri:Ljava/net/URI;

    .line 255
    invoke-virtual {p2}, Ljava/net/URLConnection;->getLastModified()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->lastModified:J

    .line 256
    invoke-direct {p0, p2}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->getEntityTags(Ljava/net/URLConnection;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->entityTags:Ljava/lang/String;

    .line 257
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->calculateExpiry(Ljava/net/URLConnection;JLcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->expiry:J

    .line 259
    return-void
.end method

.method private calculateExpiry(Ljava/net/URLConnection;JLcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;)J
    .locals 20
    .param p1, "urlConnection"    # Ljava/net/URLConnection;
    .param p2, "request_time"    # J
    .param p4, "urlConnectionExpiryCalculator"    # Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;

    .line 286
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    const-string v2, "Pragma"

    invoke-virtual {v0, v2}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "no-cache"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-wide/16 v4, 0x0

    if-eqz v2, :cond_0

    .line 287
    return-wide v4

    .line 289
    :cond_0
    const-string v2, "Cache-Control"

    invoke-virtual {v0, v2}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 291
    .local v2, "cacheControl":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 292
    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v6, -0x1

    if-eq v3, v6, :cond_1

    .line 293
    return-wide v4

    .line 295
    :cond_1
    move-object/from16 v3, p0

    invoke-direct {v3, v2}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->getMaxAge(Ljava/lang/String;)I

    move-result v7

    .line 296
    .local v7, "max_age":I
    if-eq v6, v7, :cond_2

    .line 297
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 298
    .local v8, "response_time":J
    nop

    .line 299
    invoke-virtual/range {p1 .. p1}, Ljava/net/URLConnection;->getDate()J

    move-result-wide v10

    sub-long v10, v8, v10

    .line 298
    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 300
    .local v4, "apparent_age":J
    const/4 v6, 0x0

    .line 301
    const-string v10, "Age"

    invoke-virtual {v0, v10, v6}, Ljava/net/URLConnection;->getHeaderFieldInt(Ljava/lang/String;I)I

    move-result v6

    int-to-long v10, v6

    const-wide/16 v12, 0x3e8

    mul-long/2addr v10, v12

    .line 300
    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    .line 302
    .local v10, "corrected_received_age":J
    sub-long v14, v8, p2

    .line 303
    .local v14, "response_delay":J
    add-long v16, v10, v14

    .line 305
    .local v16, "corrected_initial_age":J
    sub-long v18, v8, v16

    .line 307
    .local v18, "creation_time":J
    move-object v6, v2

    .end local v2    # "cacheControl":Ljava/lang/String;
    .local v6, "cacheControl":Ljava/lang/String;
    int-to-long v2, v7

    mul-long/2addr v2, v12

    add-long v2, v2, v18

    return-wide v2

    .line 296
    .end local v4    # "apparent_age":J
    .end local v6    # "cacheControl":Ljava/lang/String;
    .end local v8    # "response_time":J
    .end local v10    # "corrected_received_age":J
    .end local v14    # "response_delay":J
    .end local v16    # "corrected_initial_age":J
    .end local v18    # "creation_time":J
    .restart local v2    # "cacheControl":Ljava/lang/String;
    :cond_2
    move-object v6, v2

    .end local v2    # "cacheControl":Ljava/lang/String;
    .restart local v6    # "cacheControl":Ljava/lang/String;
    goto :goto_0

    .line 291
    .end local v6    # "cacheControl":Ljava/lang/String;
    .end local v7    # "max_age":I
    .restart local v2    # "cacheControl":Ljava/lang/String;
    :cond_3
    move-object v6, v2

    .line 310
    .end local v2    # "cacheControl":Ljava/lang/String;
    .restart local v6    # "cacheControl":Ljava/lang/String;
    :goto_0
    const-string v2, "Expires"

    const-wide/16 v7, -0x1

    invoke-virtual {v0, v2, v7, v8}, Ljava/net/URLConnection;->getHeaderFieldDate(Ljava/lang/String;J)J

    move-result-wide v2

    .line 312
    .local v2, "explicitExpiry":J
    cmp-long v7, v2, v7

    if-eqz v7, :cond_4

    .line 313
    return-wide v2

    .line 315
    :cond_4
    if-nez v1, :cond_5

    goto :goto_1

    .line 316
    :cond_5
    invoke-interface {v1, v0}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;->calculateExpiry(Ljava/net/URLConnection;)J

    move-result-wide v4

    .line 315
    :goto_1
    return-wide v4
.end method

.method private getEntityTags(Ljava/net/URLConnection;)Ljava/lang/String;
    .locals 4
    .param p1, "urlConnection"    # Ljava/net/URLConnection;

    .line 345
    invoke-virtual {p1}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    const-string v1, "ETag"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 346
    .local v0, "etags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 349
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 350
    .local v1, "b":Ljava/lang/StringBuilder;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 351
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 353
    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 355
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 347
    .end local v1    # "b":Ljava/lang/StringBuilder;
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :goto_1
    const/4 v1, 0x0

    return-object v1
.end method

.method private getMaxAge(Ljava/lang/String;)I
    .locals 6
    .param p1, "cacheControl"    # Ljava/lang/String;

    .line 320
    const-string v0, "max-age"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 321
    .local v0, "maxAgeIndex":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 322
    return v1

    .line 324
    :cond_0
    const/16 v2, 0x3d

    add-int/lit8 v3, v0, 0x7

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 325
    .local v2, "eq":I
    if-ne v2, v1, :cond_1

    .line 326
    return v1

    .line 328
    :cond_1
    const/16 v3, 0x2c

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 330
    .local v3, "comma":I
    if-ne v3, v1, :cond_2

    .line 331
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .local v4, "strAge":Ljava/lang/String;
    goto :goto_0

    .line 334
    .end local v4    # "strAge":Ljava/lang/String;
    :cond_2
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 337
    .restart local v4    # "strAge":Ljava/lang/String;
    :goto_0
    :try_start_0
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 339
    :catch_0
    move-exception v5

    .line 340
    .local v5, "e":Ljava/lang/NumberFormatException;
    return v1
.end method

.method private isResourceChanged(Ljava/net/URLConnection;)Z
    .locals 7
    .param p1, "urlConnection"    # Ljava/net/URLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 275
    instance-of v0, p1, Ljava/net/HttpURLConnection;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 276
    move-object v0, p1

    check-cast v0, Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v3, 0x130

    if-ne v0, v3, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 279
    :cond_1
    iget-wide v3, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->lastModified:J

    invoke-virtual {p1}, Ljava/net/URLConnection;->getLastModified()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    return v1
.end method


# virtual methods
.method appliesTo(Ljava/net/URI;)Z
    .locals 1
    .param p1, "uri"    # Ljava/net/URI;

    .line 359
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->uri:Ljava/net/URI;

    invoke-virtual {v0, p1}, Ljava/net/URI;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method applyConditionals(Ljava/net/URLConnection;)V
    .locals 4
    .param p1, "urlConnection"    # Ljava/net/URLConnection;

    .line 363
    iget-wide v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->lastModified:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 364
    invoke-virtual {p1, v0, v1}, Ljava/net/URLConnection;->setIfModifiedSince(J)V

    .line 366
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->entityTags:Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 367
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->entityTags:Ljava/lang/String;

    const-string v1, "If-None-Match"

    invoke-virtual {p1, v1, v0}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    :cond_1
    return-void
.end method

.method entityNeedsRevalidation()Z
    .locals 4

    .line 372
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->expiry:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method updateValidator(Ljava/net/URLConnection;JLcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;)Z
    .locals 3
    .param p1, "urlConnection"    # Ljava/net/URLConnection;
    .param p2, "request_time"    # J
    .param p4, "urlConnectionExpiryCalculator"    # Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 265
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->isResourceChanged(Ljava/net/URLConnection;)Z

    move-result v0

    .line 266
    .local v0, "isResourceChanged":Z
    if-nez v0, :cond_0

    .line 267
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->calculateExpiry(Ljava/net/URLConnection;JLcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->expiry:J

    .line 270
    :cond_0
    return v0
.end method
