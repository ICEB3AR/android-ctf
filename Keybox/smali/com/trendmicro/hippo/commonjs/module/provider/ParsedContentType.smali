.class public final Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;
.super Ljava/lang/Object;
.source "ParsedContentType.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final contentType:Ljava/lang/String;

.field private final encoding:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 8
    .param p1, "mimeType"    # Ljava/lang/String;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    .line 30
    .local v0, "contentType":Ljava/lang/String;
    const/4 v1, 0x0

    .line 31
    .local v1, "encoding":Ljava/lang/String;
    if-eqz p1, :cond_2

    .line 32
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v3, ";"

    invoke-direct {v2, p1, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .local v2, "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 34
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 35
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 36
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 37
    .local v3, "param":Ljava/lang/String;
    const-string v4, "charset="

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 38
    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    .line 40
    .local v4, "l":I
    if-lez v4, :cond_2

    .line 41
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x22

    if-ne v6, v7, :cond_0

    .line 42
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 44
    :cond_0
    add-int/lit8 v6, v4, -0x1

    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v7, :cond_2

    .line 45
    add-int/lit8 v6, v4, -0x1

    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 50
    .end local v3    # "param":Ljava/lang/String;
    .end local v4    # "l":I
    :cond_1
    goto :goto_0

    .line 53
    .end local v2    # "tok":Ljava/util/StringTokenizer;
    :cond_2
    :goto_1
    iput-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;->contentType:Ljava/lang/String;

    .line 54
    iput-object v1, p0, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;->encoding:Ljava/lang/String;

    .line 55
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/trendmicro/hippo/commonjs/module/provider/ParsedContentType;->encoding:Ljava/lang/String;

    return-object v0
.end method
