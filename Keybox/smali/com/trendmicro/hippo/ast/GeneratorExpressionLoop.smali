.class public Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
.super Lcom/trendmicro/hippo/ast/ForInLoop;
.source "GeneratorExpressionLoop.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/ForInLoop;-><init>()V

    .line 14
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "pos"    # I

    .line 17
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/ForInLoop;-><init>(I)V

    .line 18
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 21
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/ForInLoop;-><init>(II)V

    .line 22
    return-void
.end method


# virtual methods
.method public isForEach()Z
    .locals 1

    .line 29
    const/4 v0, 0x0

    return v0
.end method

.method public setIsForEach(Z)V
    .locals 2
    .param p1, "isForEach"    # Z

    .line 37
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "this node type does not support for each"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->isForEach()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "each "

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->iterator:Lcom/trendmicro/hippo/ast/AstNode;

    .line 46
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->isForOf()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, " of "

    goto :goto_1

    :cond_1
    const-string v1, " in "

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->iteratedObject:Lcom/trendmicro/hippo/ast/AstNode;

    .line 48
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 42
    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 58
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->iterator:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 60
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->iteratedObject:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 62
    :cond_0
    return-void
.end method
