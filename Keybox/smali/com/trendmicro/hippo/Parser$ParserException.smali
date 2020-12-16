.class Lcom/trendmicro/hippo/Parser$ParserException;
.super Ljava/lang/RuntimeException;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trendmicro/hippo/Parser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ParserException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x51a321bffed3d5feL


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 162
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trendmicro/hippo/Parser$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trendmicro/hippo/Parser$1;

    .line 162
    invoke-direct {p0}, Lcom/trendmicro/hippo/Parser$ParserException;-><init>()V

    return-void
.end method
