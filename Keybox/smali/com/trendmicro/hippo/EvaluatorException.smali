.class public Lcom/trendmicro/hippo/EvaluatorException;
.super Lcom/trendmicro/hippo/HippoException;
.source "EvaluatorException.java"


# static fields
.field private static final serialVersionUID:J = -0x7955f6f40df09550L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "detail"    # Ljava/lang/String;

    .line 19
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/HippoException;-><init>(Ljava/lang/String;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .param p1, "detail"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "lineNumber"    # I

    .line 35
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/trendmicro/hippo/EvaluatorException;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 36
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 0
    .param p1, "detail"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "lineNumber"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "columnNumber"    # I

    .line 55
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/HippoException;-><init>(Ljava/lang/String;)V

    .line 56
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/trendmicro/hippo/EvaluatorException;->recordErrorOrigin(Ljava/lang/String;ILjava/lang/String;I)V

    .line 57
    return-void
.end method


# virtual methods
.method public getColumnNumber()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 83
    invoke-virtual {p0}, Lcom/trendmicro/hippo/EvaluatorException;->columnNumber()I

    move-result v0

    return v0
.end method

.method public getLineNumber()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 74
    invoke-virtual {p0}, Lcom/trendmicro/hippo/EvaluatorException;->lineNumber()I

    move-result v0

    return v0
.end method

.method public getLineSource()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 92
    invoke-virtual {p0}, Lcom/trendmicro/hippo/EvaluatorException;->lineSource()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSourceName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 65
    invoke-virtual {p0}, Lcom/trendmicro/hippo/EvaluatorException;->sourceName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method