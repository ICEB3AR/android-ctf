.class public final enum Lcom/trendmicro/hippo/StackStyle;
.super Ljava/lang/Enum;
.source "StackStyle.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/trendmicro/hippo/StackStyle;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/trendmicro/hippo/StackStyle;

.field public static final enum HIPPO:Lcom/trendmicro/hippo/StackStyle;

.field public static final enum TRENDMICRO:Lcom/trendmicro/hippo/StackStyle;

.field public static final enum V8:Lcom/trendmicro/hippo/StackStyle;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 16
    new-instance v0, Lcom/trendmicro/hippo/StackStyle;

    const-string v1, "HIPPO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trendmicro/hippo/StackStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/StackStyle;->HIPPO:Lcom/trendmicro/hippo/StackStyle;

    .line 22
    new-instance v0, Lcom/trendmicro/hippo/StackStyle;

    const-string v1, "TRENDMICRO"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/trendmicro/hippo/StackStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/StackStyle;->TRENDMICRO:Lcom/trendmicro/hippo/StackStyle;

    .line 30
    new-instance v0, Lcom/trendmicro/hippo/StackStyle;

    const-string v1, "V8"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/trendmicro/hippo/StackStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trendmicro/hippo/StackStyle;->V8:Lcom/trendmicro/hippo/StackStyle;

    .line 11
    const/4 v1, 0x3

    new-array v1, v1, [Lcom/trendmicro/hippo/StackStyle;

    sget-object v5, Lcom/trendmicro/hippo/StackStyle;->HIPPO:Lcom/trendmicro/hippo/StackStyle;

    aput-object v5, v1, v2

    sget-object v2, Lcom/trendmicro/hippo/StackStyle;->TRENDMICRO:Lcom/trendmicro/hippo/StackStyle;

    aput-object v2, v1, v3

    aput-object v0, v1, v4

    sput-object v1, Lcom/trendmicro/hippo/StackStyle;->$VALUES:[Lcom/trendmicro/hippo/StackStyle;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 11
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/trendmicro/hippo/StackStyle;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 11
    const-class v0, Lcom/trendmicro/hippo/StackStyle;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/StackStyle;

    return-object v0
.end method

.method public static values()[Lcom/trendmicro/hippo/StackStyle;
    .locals 1

    .line 11
    sget-object v0, Lcom/trendmicro/hippo/StackStyle;->$VALUES:[Lcom/trendmicro/hippo/StackStyle;

    invoke-virtual {v0}, [Lcom/trendmicro/hippo/StackStyle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trendmicro/hippo/StackStyle;

    return-object v0
.end method
