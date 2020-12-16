.class public final enum Lcom/trendmicro/hippo/Token$CommentType;
.super Ljava/lang/Enum;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Token;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CommentType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/trendmicro/hippo/Token$CommentType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/trendmicro/hippo/Token$CommentType;

.field public static final enum BLOCK_COMMENT:Lcom/trendmicro/hippo/Token$CommentType;

.field public static final enum HTML:Lcom/trendmicro/hippo/Token$CommentType;

.field public static final enum JSDOC:Lcom/trendmicro/hippo/Token$CommentType;

.field public static final enum LINE:Lcom/trendmicro/hippo/Token$CommentType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 24
    new-instance v0, Lcom/trendmicro/hippo/Token$CommentType;

    const-string v1, "LINE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/Token$CommentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/Token$CommentType;->LINE:Lcom/trendmicro/hippo/Token$CommentType;

    new-instance v0, Lcom/trendmicro/hippo/Token$CommentType;

    const-string v1, "BLOCK_COMMENT"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/trendmicro/hippo/Token$CommentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/Token$CommentType;->BLOCK_COMMENT:Lcom/trendmicro/hippo/Token$CommentType;

    new-instance v0, Lcom/trendmicro/hippo/Token$CommentType;

    const-string v1, "JSDOC"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/Token$CommentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/Token$CommentType;->JSDOC:Lcom/trendmicro/hippo/Token$CommentType;

    new-instance v0, Lcom/trendmicro/hippo/Token$CommentType;

    const-string v1, "HTML"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/trendmicro/hippo/Token$CommentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/Token$CommentType;->HTML:Lcom/trendmicro/hippo/Token$CommentType;

    .line 23
    const/4 v1, 0x4

    new-array v1, v1, [Lcom/trendmicro/hippo/Token$CommentType;

    sget-object v6, Lcom/trendmicro/hippo/Token$CommentType;->LINE:Lcom/trendmicro/hippo/Token$CommentType;

    aput-object v6, v1, v2

    sget-object v2, Lcom/trendmicro/hippo/Token$CommentType;->BLOCK_COMMENT:Lcom/trendmicro/hippo/Token$CommentType;

    aput-object v2, v1, v3

    sget-object v2, Lcom/trendmicro/hippo/Token$CommentType;->JSDOC:Lcom/trendmicro/hippo/Token$CommentType;

    aput-object v2, v1, v4

    aput-object v0, v1, v5

    sput-object v1, Lcom/trendmicro/hippo/Token$CommentType;->$VALUES:[Lcom/trendmicro/hippo/Token$CommentType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/trendmicro/hippo/Token$CommentType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 23
    const-class v0, Lcom/trendmicro/hippo/Token$CommentType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/Token$CommentType;

    return-object v0
.end method

.method public static values()[Lcom/trendmicro/hippo/Token$CommentType;
    .locals 1

    .line 23
    sget-object v0, Lcom/trendmicro/hippo/Token$CommentType;->$VALUES:[Lcom/trendmicro/hippo/Token$CommentType;

    invoke-virtual {v0}, [Lcom/trendmicro/hippo/Token$CommentType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trendmicro/hippo/Token$CommentType;

    return-object v0
.end method
