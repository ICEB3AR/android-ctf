.class public Lcom/trendmicro/hippo/regexp/SubString;
.super Ljava/lang/Object;
.source "SubString.java"


# instance fields
.field index:I

.field length:I

.field str:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/trendmicro/hippo/regexp/SubString;->str:Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    iput v0, p0, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    .line 22
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "len"    # I

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/trendmicro/hippo/regexp/SubString;->str:Ljava/lang/String;

    .line 28
    iput p2, p0, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    .line 29
    iput p3, p0, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    .line 30
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 34
    iget-object v0, p0, Lcom/trendmicro/hippo/regexp/SubString;->str:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 35
    const-string v0, ""

    goto :goto_0

    .line 36
    :cond_0
    iget v1, p0, Lcom/trendmicro/hippo/regexp/SubString;->index:I

    iget v2, p0, Lcom/trendmicro/hippo/regexp/SubString;->length:I

    add-int/2addr v2, v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 34
    :goto_0
    return-object v0
.end method
