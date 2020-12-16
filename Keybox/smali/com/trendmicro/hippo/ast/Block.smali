.class public Lcom/trendmicro/hippo/ast/Block;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "Block.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 23
    const/16 v0, 0x82

    iput v0, p0, Lcom/trendmicro/hippo/ast/Block;->type:I

    .line 27
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 30
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 23
    const/16 v0, 0x82

    iput v0, p0, Lcom/trendmicro/hippo/ast/Block;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 23
    const/16 v0, 0x82

    iput v0, p0, Lcom/trendmicro/hippo/ast/Block;->type:I

    .line 35
    return-void
.end method


# virtual methods
.method public addStatement(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "statement"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 41
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Block;->addChild(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 42
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 7
    .param p1, "depth"    # I

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Block;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    const-string v1, "{\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Block;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "\n"

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Node;

    .line 50
    .local v2, "kid":Lcom/trendmicro/hippo/Node;
    move-object v4, v2

    check-cast v4, Lcom/trendmicro/hippo/ast/AstNode;

    .line 51
    .local v4, "astNodeKid":Lcom/trendmicro/hippo/ast/AstNode;
    add-int/lit8 v5, p1, 0x1

    invoke-virtual {v4, v5}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v5

    const/16 v6, 0xa2

    if-ne v5, v6, :cond_0

    .line 53
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .end local v2    # "kid":Lcom/trendmicro/hippo/Node;
    .end local v4    # "astNodeKid":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_0
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/Block;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Block;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 59
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Block;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 3
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 67
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Block;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/Node;

    .line 69
    .local v1, "kid":Lcom/trendmicro/hippo/Node;
    move-object v2, v1

    check-cast v2, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 70
    .end local v1    # "kid":Lcom/trendmicro/hippo/Node;
    goto :goto_0

    .line 72
    :cond_0
    return-void
.end method
