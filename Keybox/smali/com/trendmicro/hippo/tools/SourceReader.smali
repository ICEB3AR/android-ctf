.class public Lcom/trendmicro/hippo/tools/SourceReader;
.super Ljava/lang/Object;
.source "SourceReader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readFileOrUrl(Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/Object;
    .locals 15
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "convertToString"    # Z
    .param p2, "defaultEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    invoke-static {p0}, Lcom/trendmicro/hippo/tools/SourceReader;->toUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    .line 42
    .local v1, "url":Ljava/net/URL;
    const/4 v2, 0x0

    .line 43
    .local v2, "is":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 48
    .local v3, "capacityHint":I
    const/4 v0, 0x0

    if-nez v1, :cond_0

    .line 49
    :try_start_0
    new-instance v4, Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v5, p0

    :try_start_1
    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .local v4, "file":Ljava/io/File;
    move-object v6, v0

    .line 51
    .local v0, "contentType":Ljava/lang/String;
    .local v6, "encoding":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v7

    long-to-int v3, v7

    .line 52
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v2, v7

    .line 53
    .end local v4    # "file":Ljava/io/File;
    goto :goto_1

    .line 76
    .end local v0    # "contentType":Ljava/lang/String;
    .end local v6    # "encoding":Ljava/lang/String;
    :catchall_0
    move-exception v0

    move-object v5, p0

    goto/16 :goto_4

    .line 54
    :cond_0
    move-object v5, p0

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    .line 55
    .local v4, "uc":Ljava/net/URLConnection;
    invoke-virtual {v4}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    move-object v2, v6

    .line 56
    if-eqz p1, :cond_1

    .line 57
    new-instance v0, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;

    invoke-virtual {v4}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;-><init>(Ljava/lang/String;)V

    .line 58
    .local v0, "pct":Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;->getContentType()Ljava/lang/String;

    move-result-object v6

    .line 59
    .local v6, "contentType":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;->getEncoding()Ljava/lang/String;

    move-result-object v7

    move-object v0, v7

    .line 60
    .local v0, "encoding":Ljava/lang/String;
    move-object v14, v6

    move-object v6, v0

    move-object v0, v14

    goto :goto_0

    .line 62
    .end local v0    # "encoding":Ljava/lang/String;
    .end local v6    # "contentType":Ljava/lang/String;
    :cond_1
    move-object v6, v0

    .line 64
    .local v0, "contentType":Ljava/lang/String;
    .local v6, "encoding":Ljava/lang/String;
    :goto_0
    invoke-virtual {v4}, Ljava/net/URLConnection;->getContentLength()I

    move-result v7

    move v3, v7

    .line 66
    const/high16 v7, 0x100000

    if-le v3, v7, :cond_2

    .line 67
    const/4 v3, -0x1

    .line 70
    .end local v4    # "uc":Ljava/net/URLConnection;
    :cond_2
    :goto_1
    if-gtz v3, :cond_3

    .line 71
    const/16 v3, 0x1000

    .line 74
    :cond_3
    invoke-static {v2, v3}, Lcom/trendmicro/hippo/Kit;->readStream(Ljava/io/InputStream;I)[B

    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 76
    .local v4, "data":[B
    if-eqz v2, :cond_4

    .line 77
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 82
    :cond_4
    if-nez p1, :cond_5

    .line 83
    move-object v7, v4

    .local v7, "result":Ljava/lang/Object;
    goto/16 :goto_3

    .line 85
    .end local v7    # "result":Ljava/lang/Object;
    :cond_5
    const/4 v7, 0x0

    const/4 v8, 0x1

    if-nez v6, :cond_d

    .line 88
    array-length v9, v4

    const/4 v10, -0x2

    const/4 v11, 0x2

    const/4 v12, -0x1

    const/4 v13, 0x3

    if-le v9, v13, :cond_6

    aget-byte v9, v4, v7

    if-ne v9, v12, :cond_6

    aget-byte v9, v4, v8

    if-ne v9, v10, :cond_6

    aget-byte v9, v4, v11

    if-nez v9, :cond_6

    aget-byte v9, v4, v13

    if-nez v9, :cond_6

    .line 89
    const-string v6, "UTF-32LE"

    goto/16 :goto_2

    .line 91
    :cond_6
    array-length v9, v4

    if-le v9, v13, :cond_7

    aget-byte v9, v4, v7

    if-nez v9, :cond_7

    aget-byte v9, v4, v8

    if-nez v9, :cond_7

    aget-byte v9, v4, v11

    if-ne v9, v10, :cond_7

    aget-byte v9, v4, v13

    if-ne v9, v12, :cond_7

    .line 92
    const-string v6, "UTF-32BE"

    goto :goto_2

    .line 94
    :cond_7
    array-length v9, v4

    if-le v9, v11, :cond_8

    aget-byte v9, v4, v7

    const/16 v13, -0x11

    if-ne v9, v13, :cond_8

    aget-byte v9, v4, v8

    const/16 v13, -0x45

    if-ne v9, v13, :cond_8

    aget-byte v9, v4, v11

    const/16 v11, -0x41

    if-ne v9, v11, :cond_8

    .line 95
    const-string v6, "UTF-8"

    goto :goto_2

    .line 97
    :cond_8
    array-length v9, v4

    if-le v9, v8, :cond_9

    aget-byte v9, v4, v7

    if-ne v9, v12, :cond_9

    aget-byte v9, v4, v8

    if-ne v9, v10, :cond_9

    .line 98
    const-string v6, "UTF-16LE"

    goto :goto_2

    .line 100
    :cond_9
    array-length v9, v4

    if-le v9, v8, :cond_a

    aget-byte v9, v4, v7

    if-ne v9, v10, :cond_a

    aget-byte v9, v4, v8

    if-ne v9, v12, :cond_a

    .line 101
    const-string v6, "UTF-16BE"

    goto :goto_2

    .line 105
    :cond_a
    move-object/from16 v6, p2

    .line 106
    if-nez v6, :cond_d

    .line 108
    if-nez v1, :cond_b

    .line 110
    const-string v9, "file.encoding"

    invoke-static {v9}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    .line 112
    :cond_b
    if-eqz v0, :cond_c

    const-string v9, "application/"

    invoke-virtual {v0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 114
    const-string v6, "UTF-8"

    goto :goto_2

    .line 118
    :cond_c
    const-string v6, "US-ASCII"

    .line 123
    :cond_d
    :goto_2
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v4, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 125
    .local v9, "strResult":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_e

    invoke-virtual {v9, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const v10, 0xfeff

    if-ne v7, v10, :cond_e

    .line 127
    invoke-virtual {v9, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 129
    :cond_e
    move-object v7, v9

    .line 131
    .end local v9    # "strResult":Ljava/lang/String;
    .restart local v7    # "result":Ljava/lang/Object;
    :goto_3
    return-object v7

    .line 76
    .end local v0    # "contentType":Ljava/lang/String;
    .end local v4    # "data":[B
    .end local v6    # "encoding":Ljava/lang/String;
    .end local v7    # "result":Ljava/lang/Object;
    :catchall_1
    move-exception v0

    :goto_4
    if-eqz v2, :cond_f

    .line 77
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 79
    :cond_f
    throw v0
.end method

.method public static toUrl(Ljava/lang/String;)Ljava/net/URL;
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .line 28
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 30
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 31
    :catch_0
    move-exception v0

    .line 35
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
