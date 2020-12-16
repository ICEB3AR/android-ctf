.class public Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
.super Lcom/trendmicro/hippo/ast/ForInLoop;
.source "ArrayComprehensionLoop.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/ForInLoop;-><init>()V

    .line 20
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "pos"    # I

    .line 23
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/ForInLoop;-><init>(I)V

    .line 24
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/ForInLoop;-><init>(II)V

    .line 28
    return-void
.end method


# virtual methods
.method public getBody()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 36
    const/4 v0, 0x0

    return-object v0
.end method

.method public setBody(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 2
    .param p1, "body"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 46
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "this node type has no body"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->isForEach()Z

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

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->iterator:Lcom/trendmicro/hippo/ast/AstNode;

    .line 55
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->isForOf()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, " of "

    goto :goto_1

    :cond_1
    const-string v1, " in "

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->iteratedObject:Lcom/trendmicro/hippo/ast/AstNode;

    .line 57
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 51
    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 67
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->iterator:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 69
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->iteratedObject:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 71
    :cond_0
    return-void
.end method
