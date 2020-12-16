.class public final Lcom/trendmicro/hippo/UniqueTag;
.super Ljava/lang/Object;
.source "UniqueTag.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

.field private static final ID_DOUBLE_MARK:I = 0x3

.field private static final ID_NOT_FOUND:I = 0x1

.field private static final ID_NULL_VALUE:I = 0x2

.field public static final NOT_FOUND:Lcom/trendmicro/hippo/UniqueTag;

.field public static final NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

.field private static final serialVersionUID:J = -0x3bf5b38ae836196bL


# instance fields
.field private final tagId:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 32
    new-instance v0, Lcom/trendmicro/hippo/UniqueTag;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/UniqueTag;-><init>(I)V

    sput-object v0, Lcom/trendmicro/hippo/UniqueTag;->NOT_FOUND:Lcom/trendmicro/hippo/UniqueTag;

    .line 38
    new-instance v0, Lcom/trendmicro/hippo/UniqueTag;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/UniqueTag;-><init>(I)V

    sput-object v0, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    .line 45
    new-instance v0, Lcom/trendmicro/hippo/UniqueTag;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/UniqueTag;-><init>(I)V

    sput-object v0, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 0
    .param p1, "tagId"    # I

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput p1, p0, Lcom/trendmicro/hippo/UniqueTag;->tagId:I

    .line 52
    return-void
.end method


# virtual methods
.method public readResolve()Ljava/lang/Object;
    .locals 2

    .line 56
    iget v0, p0, Lcom/trendmicro/hippo/UniqueTag;->tagId:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 62
    sget-object v0, Lcom/trendmicro/hippo/UniqueTag;->DOUBLE_MARK:Lcom/trendmicro/hippo/UniqueTag;

    return-object v0

    .line 64
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    iget v1, p0, Lcom/trendmicro/hippo/UniqueTag;->tagId:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_1
    sget-object v0, Lcom/trendmicro/hippo/UniqueTag;->NULL_VALUE:Lcom/trendmicro/hippo/UniqueTag;

    return-object v0

    .line 58
    :cond_2
    sget-object v0, Lcom/trendmicro/hippo/UniqueTag;->NOT_FOUND:Lcom/trendmicro/hippo/UniqueTag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 72
    iget v0, p0, Lcom/trendmicro/hippo/UniqueTag;->tagId:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 80
    const-string v0, "DOUBLE_MARK"

    .line 81
    .local v0, "name":Ljava/lang/String;
    goto :goto_0

    .line 83
    .end local v0    # "name":Ljava/lang/String;
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 77
    :cond_1
    const-string v0, "NULL_VALUE"

    .line 78
    .restart local v0    # "name":Ljava/lang/String;
    goto :goto_0

    .line 74
    .end local v0    # "name":Ljava/lang/String;
    :cond_2
    const-string v0, "NOT_FOUND"

    .line 75
    .restart local v0    # "name":Ljava/lang/String;
    nop

    .line 85
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
