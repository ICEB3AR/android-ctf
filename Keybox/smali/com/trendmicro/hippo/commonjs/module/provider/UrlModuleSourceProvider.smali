.class public Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;
.super Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;
.source "UrlModuleSourceProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final fallbackUris:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "Ljava/net/URI;",
            ">;"
        }
    .end annotation
.end field

.field private final privilegedUris:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "Ljava/net/URI;",
            ">;"
        }
    .end annotation
.end field

.field private final urlConnectionExpiryCalculator:Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;

.field private final urlConnectionSecurityDomainProvider:Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionSecurityDomainProvider;


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;Ljava/lang/Iterable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/net/URI;",
            ">;",
            "Ljava/lang/Iterable<",
            "Ljava/net/URI;",
            ">;)V"
        }
    .end annotation

    .line 56
    .local p1, "privilegedUris":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    .local p2, "fallbackUris":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    new-instance v0, Lcom/trendmicro/hippo/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;

    invoke-direct {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/DefaultUrlConnectionExpiryCalculator;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;-><init>(Ljava/lang/Iterable;Ljava/lang/Iterable;Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionSecurityDomainProvider;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;Ljava/lang/Iterable;Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionSecurityDomainProvider;)V
    .locals 0
    .param p3, "urlConnectionExpiryCalculator"    # Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;
    .param p4, "urlConnectionSecurityDomainProvider"    # Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionSecurityDomainProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/net/URI;",
            ">;",
            "Ljava/lang/Iterable<",
            "Ljava/net/URI;",
            ">;",
            "Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;",
            "Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionSecurityDomainProvider;",
            ")V"
        }
    .end annotation

    .line 80
    .local p1, "privilegedUris":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    .local p2, "fallbackUris":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    invoke-direct {p0}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->privilegedUris:Ljava/lang/Iterable;

    .line 82
    iput-object p2, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->fallbackUris:Ljava/lang/Iterable;

    .line 83
    iput-object p3, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionExpiryCalculator:Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;

    .line 84
    iput-object p4, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionSecurityDomainProvider:Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionSecurityDomainProvider;

    .line 86
    return-void
.end method

.method private close(Ljava/net/URLConnection;)V
    .locals 1
    .param p1, "urlConnection"    # Ljava/net/URLConnection;

    .line 209
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    goto :goto_0

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, p1, v0}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->onFailedClosingUrlConnection(Ljava/net/URLConnection;Ljava/io/IOException;)V

    .line 214
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method private static getCharacterEncoding(Ljava/net/URLConnection;)Ljava/lang/String;
    .locals 4
    .param p0, "urlConnection"    # Ljava/net/URLConnection;

    .line 188
    new-instance v0, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;

    .line 189
    invoke-virtual {p0}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;-><init>(Ljava/lang/String;)V

    .line 190
    .local v0, "pct":Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;
    invoke-virtual {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;->getEncoding()Ljava/lang/String;

    move-result-object v1

    .line 191
    .local v1, "encoding":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 192
    return-object v1

    .line 194
    :cond_0
    invoke-virtual {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;->getContentType()Ljava/lang/String;

    move-result-object v2

    .line 195
    .local v2, "contentType":Ljava/lang/String;
    if-eqz v2, :cond_1

    const-string v3, "text/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 196
    const-string v3, "8859_1"

    return-object v3

    .line 198
    :cond_1
    const-string v3, "utf-8"

    return-object v3
.end method

.method private static getReader(Ljava/net/URLConnection;)Ljava/io/Reader;
    .locals 3
    .param p0, "urlConnection"    # Ljava/net/URLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 184
    invoke-static {p0}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->getCharacterEncoding(Ljava/net/URLConnection;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 183
    return-object v0
.end method

.method private getSecurityDomain(Ljava/net/URLConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "urlConnection"    # Ljava/net/URLConnection;

    .line 202
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionSecurityDomainProvider:Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionSecurityDomainProvider;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 203
    :cond_0
    invoke-interface {v0, p1}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionSecurityDomainProvider;->getSecurityDomain(Ljava/net/URLConnection;)Ljava/lang/Object;

    move-result-object v0

    .line 202
    :goto_0
    return-object v0
.end method

.method private loadFromPathList(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .locals 4
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Iterable<",
            "Ljava/net/URI;",
            ">;)",
            "Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 108
    .local p3, "paths":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/net/URI;>;"
    const/4 v0, 0x0

    if-nez p3, :cond_0

    .line 109
    return-object v0

    .line 111
    :cond_0
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URI;

    .line 112
    .local v2, "path":Ljava/net/URI;
    nop

    .line 113
    invoke-virtual {v2, p1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3

    .line 112
    invoke-virtual {p0, v3, v2, p2}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v3

    .line 114
    .local v3, "moduleSource":Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    if-eqz v3, :cond_1

    .line 115
    return-object v3

    .line 117
    .end local v2    # "path":Ljava/net/URI;
    .end local v3    # "moduleSource":Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    :cond_1
    goto :goto_0

    .line 118
    :cond_2
    return-object v0
.end method


# virtual methods
.method protected entityNeedsRevalidation(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "validator"    # Ljava/lang/Object;

    .line 239
    instance-of v0, p1, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    .line 240
    invoke-virtual {v0}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->entityNeedsRevalidation()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 239
    :goto_1
    return v0
.end method

.method protected loadFromActualUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .locals 19
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "base"    # Ljava/net/URI;
    .param p3, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    move-object/from16 v1, p0

    move-object/from16 v2, p3

    new-instance v0, Ljava/net/URL;

    const/4 v3, 0x0

    if-nez p2, :cond_0

    move-object v4, v3

    goto :goto_0

    :cond_0
    invoke-virtual/range {p2 .. p2}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v4

    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    move-object v10, v0

    .line 138
    .local v10, "url":Ljava/net/URL;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 139
    .local v11, "request_time":J
    invoke-virtual {v1, v10}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->openUrlConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v13

    .line 141
    .local v13, "urlConnection":Ljava/net/URLConnection;
    instance-of v0, v2, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    if-eqz v0, :cond_2

    .line 142
    move-object v0, v2

    check-cast v0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    .line 143
    .local v0, "uriValidator":Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    move-object/from16 v14, p1

    invoke-virtual {v0, v14}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->appliesTo(Ljava/net/URI;)Z

    move-result v4

    if-eqz v4, :cond_1

    move-object v4, v0

    goto :goto_1

    .line 144
    :cond_1
    move-object v4, v3

    :goto_1
    move-object v0, v4

    .line 145
    .local v0, "applicableValidator":Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    move-object v15, v0

    goto :goto_2

    .line 147
    .end local v0    # "applicableValidator":Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    :cond_2
    move-object/from16 v14, p1

    const/4 v0, 0x0

    move-object v15, v0

    .line 149
    .local v15, "applicableValidator":Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;
    :goto_2
    if-eqz v15, :cond_3

    .line 150
    invoke-virtual {v15, v13}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->applyConditionals(Ljava/net/URLConnection;)V

    .line 153
    :cond_3
    :try_start_0
    invoke-virtual {v13}, Ljava/net/URLConnection;->connect()V

    .line 154
    if-eqz v15, :cond_4

    iget-object v0, v1, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionExpiryCalculator:Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;

    .line 155
    invoke-virtual {v15, v13, v11, v12, v0}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;->updateValidator(Ljava/net/URLConnection;JLcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 158
    invoke-direct {v1, v13}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->close(Ljava/net/URLConnection;)V

    .line 159
    sget-object v0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->NOT_MODIFIED:Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    return-object v0

    .line 162
    :cond_4
    new-instance v0, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    invoke-static {v13}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->getReader(Ljava/net/URLConnection;)Ljava/io/Reader;

    move-result-object v16

    .line 163
    invoke-direct {v1, v13}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->getSecurityDomain(Ljava/net/URLConnection;)Ljava/lang/Object;

    move-result-object v17

    new-instance v18, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;

    iget-object v9, v1, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->urlConnectionExpiryCalculator:Lcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;

    move-object/from16 v4, v18

    move-object/from16 v5, p1

    move-object v6, v13

    move-wide v7, v11

    invoke-direct/range {v4 .. v9}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider$URLValidator;-><init>(Ljava/net/URI;Ljava/net/URLConnection;JLcom/trendmicro/hippo/commonjs/module/provider/UrlConnectionExpiryCalculator;)V

    move-object v4, v0

    move-object/from16 v5, v16

    move-object/from16 v6, v17

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, v18

    invoke-direct/range {v4 .. v9}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;-><init>(Ljava/io/Reader;Ljava/lang/Object;Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    return-object v0

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "e":Ljava/io/IOException;
    invoke-direct {v1, v13}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->close(Ljava/net/URLConnection;)V

    .line 176
    throw v0

    .line 170
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 171
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-direct {v1, v13}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->close(Ljava/net/URLConnection;)V

    .line 172
    throw v0

    .line 167
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_2
    move-exception v0

    .line 168
    .local v0, "e":Ljava/io/FileNotFoundException;
    return-object v3
.end method

.method protected loadFromFallbackLocations(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .locals 1
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->fallbackUris:Ljava/lang/Iterable;

    invoke-direct {p0, p1, p2, v0}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->loadFromPathList(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v0

    return-object v0
.end method

.method protected loadFromPrivilegedLocations(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .locals 1
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->privilegedUris:Ljava/lang/Iterable;

    invoke-direct {p0, p1, p2, v0}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->loadFromPathList(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v0

    return-object v0
.end method

.method protected loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .locals 3
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "base"    # Ljava/net/URI;
    .param p3, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 126
    new-instance v0, Ljava/net/URI;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ".js"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 127
    .local v0, "fullUri":Ljava/net/URI;
    invoke-virtual {p0, v0, p2, p3}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->loadFromActualUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v1

    .line 130
    .local v1, "source":Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    if-eqz v1, :cond_0

    .line 131
    move-object v2, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/trendmicro/hippo/commonjs/module/provider/UrlModuleSourceProvider;->loadFromActualUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v2

    .line 130
    :goto_0
    return-object v2
.end method

.method protected onFailedClosingUrlConnection(Ljava/net/URLConnection;Ljava/io/IOException;)V
    .locals 0
    .param p1, "urlConnection"    # Ljava/net/URLConnection;
    .param p2, "cause"    # Ljava/io/IOException;

    .line 224
    return-void
.end method

.method protected openUrlConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    return-object v0
.end method
