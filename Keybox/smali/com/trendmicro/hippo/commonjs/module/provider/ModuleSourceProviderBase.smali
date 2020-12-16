.class public abstract Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;
.super Ljava/lang/Object;
.source "ModuleSourceProviderBase.java"

# interfaces
.implements Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProvider;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static ensureTrailingSlash(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .line 92
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v0, p0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private loadFromPathArray(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .locals 8
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "paths"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    nop

    .line 65
    const-string v0, "length"

    invoke-static {p2, v0}, Lcom/trendmicro/hippo/ScriptableObject;->getProperty(Lcom/trendmicro/hippo/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 64
    invoke-static {v0}, Lcom/trendmicro/hippo/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v0

    .line 67
    .local v0, "llength":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    const v2, 0x7fffffff

    goto :goto_0

    .line 68
    :cond_0
    long-to-int v2, v0

    :goto_0
    nop

    .line 70
    .local v2, "ilength":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v2, :cond_3

    .line 71
    const-class v4, Ljava/lang/String;

    .line 72
    invoke-static {p2, v3, v4}, Lcom/trendmicro/hippo/ScriptableObject;->getTypedProperty(Lcom/trendmicro/hippo/Scriptable;ILjava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 71
    invoke-static {v4}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;->ensureTrailingSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 74
    .local v4, "path":Ljava/lang/String;
    :try_start_0
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, v4}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 75
    .local v5, "uri":Ljava/net/URI;
    invoke-virtual {v5}, Ljava/net/URI;->isAbsolute()Z

    move-result v6

    if-nez v6, :cond_1

    .line 76
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v6

    move-object v5, v6

    .line 78
    :cond_1
    nop

    .line 79
    invoke-virtual {v5, p1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v6

    .line 78
    invoke-virtual {p0, v6, v5, p3}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;->loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v6
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .local v6, "moduleSource":Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    if-eqz v6, :cond_2

    .line 81
    return-object v6

    .line 86
    .end local v5    # "uri":Ljava/net/URI;
    .end local v6    # "moduleSource":Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    :cond_2
    nop

    .line 70
    .end local v4    # "path":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 84
    .restart local v4    # "path":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 85
    .local v5, "e":Ljava/net/URISyntaxException;
    new-instance v6, Ljava/net/MalformedURLException;

    invoke-virtual {v5}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 88
    .end local v3    # "i":I
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "e":Ljava/net/URISyntaxException;
    :cond_3
    const/4 v3, 0x0

    return-object v3
.end method


# virtual methods
.method protected entityNeedsRevalidation(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "validator"    # Ljava/lang/Object;

    .line 108
    const/4 v0, 0x1

    return v0
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

    .line 170
    const/4 v0, 0x0

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

    .line 149
    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation
.end method

.method public loadSource(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .locals 2
    .param p1, "moduleId"    # Ljava/lang/String;
    .param p2, "paths"    # Lcom/trendmicro/hippo/Scriptable;
    .param p3, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 38
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;->entityNeedsRevalidation(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 39
    sget-object v0, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;->NOT_MODIFIED:Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    return-object v0

    .line 42
    :cond_0
    invoke-virtual {p0, p1, p3}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;->loadFromPrivilegedLocations(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v0

    .line 43
    .local v0, "moduleSource":Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    if-eqz v0, :cond_1

    .line 44
    return-object v0

    .line 46
    :cond_1
    if-eqz p2, :cond_2

    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;->loadFromPathArray(Ljava/lang/String;Lcom/trendmicro/hippo/Scriptable;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    return-object v0

    .line 52
    :cond_2
    invoke-virtual {p0, p1, p3}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;->loadFromFallbackLocations(Ljava/lang/String;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v1

    return-object v1
.end method

.method public loadSource(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;
    .locals 1
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "base"    # Ljava/net/URI;
    .param p3, "validator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 58
    invoke-virtual {p0, p1, p2, p3}, Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSourceProviderBase;->loadFromUri(Ljava/net/URI;Ljava/net/URI;Ljava/lang/Object;)Lcom/trendmicro/hippo/commonjs/module/provider/ModuleSource;

    move-result-object v0

    return-object v0
.end method
