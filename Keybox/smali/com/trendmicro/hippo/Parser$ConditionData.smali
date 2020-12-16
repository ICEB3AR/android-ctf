.class Lcom/trendmicro/hippo/Parser$ConditionData;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConditionData"
.end annotation


# instance fields
.field condition:Lcom/trendmicro/hippo/ast/AstNode;

.field lp:I

.field rp:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1089
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1091
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/Parser$ConditionData;->lp:I

    .line 1092
    iput v0, p0, Lcom/trendmicro/hippo/Parser$ConditionData;->rp:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/Parser$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/Parser$1;

    .line 1089
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser$ConditionData;-><init>()V

    return-void
.end method
