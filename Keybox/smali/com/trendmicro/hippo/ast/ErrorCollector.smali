.class public Lcom/trendmicro/hippo/ast/ErrorCollector;
.super Ljava/lang/Object;
.source "ErrorCollector.java"

# interfaces
.implements Lcom/trendmicro/hippo/ast/IdeErrorReporter;


# instance fields
.field private errors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/ParseProblem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ErrorCollector;->errors:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 8
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "fileOffset"    # I
    .param p4, "length"    # I

    .line 67
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ErrorCollector;->errors:Ljava/util/List;

    new-instance v7, Lcom/trendmicro/hippo/ast/ParseProblem;

    sget-object v2, Lcom/trendmicro/hippo/ast/ParseProblem$Type;->Error:Lcom/trendmicro/hippo/ast/ParseProblem$Type;

    move-object v1, v7

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/ast/ParseProblem;-><init>(Lcom/trendmicro/hippo/ast/ParseProblem$Type;Ljava/lang/String;Ljava/lang/String;II)V

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .line 57
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getErrors()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/ParseProblem;",
            ">;"
        }
    .end annotation

    .line 87
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ErrorCollector;->errors:Ljava/util/List;

    return-object v0
.end method

.method public runtimeError(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/trendmicro/hippo/EvaluatorException;
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .line 80
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ErrorCollector;->errors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x64

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 93
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ErrorCollector;->errors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ast/ParseProblem;

    .line 94
    .local v2, "pp":Lcom/trendmicro/hippo/ast/ParseProblem;
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/ParseProblem;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .end local v2    # "pp":Lcom/trendmicro/hippo/ast/ParseProblem;
    goto :goto_0

    .line 96
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public warning(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 8
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .line 43
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ErrorCollector;->errors:Ljava/util/List;

    new-instance v7, Lcom/trendmicro/hippo/ast/ParseProblem;

    sget-object v2, Lcom/trendmicro/hippo/ast/ParseProblem$Type;->Warning:Lcom/trendmicro/hippo/ast/ParseProblem$Type;

    move-object v1, v7

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/trendmicro/hippo/ast/ParseProblem;-><init>(Lcom/trendmicro/hippo/ast/ParseProblem$Type;Ljava/lang/String;Ljava/lang/String;II)V

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    return-void
.end method

.method public warning(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "lineSource"    # Ljava/lang/String;
    .param p5, "lineOffset"    # I

    .line 34
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
