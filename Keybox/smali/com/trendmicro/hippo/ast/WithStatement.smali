.class public Lcom/trendmicro/hippo/ast/WithStatement;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "WithStatement.java"


# instance fields
.field private expression:Lcom/trendmicro/hippo/ast/AstNode;

.field private lp:I

.field private rp:I

.field private statement:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 21
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->lp:I

    .line 22
    iput v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->rp:I

    .line 25
    const/16 v0, 0x7c

    iput v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->type:I

    .line 29
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 32
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 21
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->lp:I

    .line 22
    iput v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->rp:I

    .line 25
    const/16 v0, 0x7c

    iput v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 36
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 21
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->lp:I

    .line 22
    iput v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->rp:I

    .line 25
    const/16 v0, 0x7c

    iput v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->type:I

    .line 37
    return-void
.end method


# virtual methods
.method public getExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getLp()I
    .locals 1

    .line 77
    iget v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->lp:I

    return v0
.end method

.method public getRp()I
    .locals 1

    .line 91
    iget v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->rp:I

    return v0
.end method

.method public getStatement()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "expression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 51
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/WithStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 52
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/WithStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 53
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 54
    return-void
.end method

.method public setLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 84
    iput p1, p0, Lcom/trendmicro/hippo/ast/WithStatement;->lp:I

    .line 85
    return-void
.end method

.method public setParens(II)V
    .locals 0
    .param p1, "lp"    # I
    .param p2, "rp"    # I

    .line 105
    iput p1, p0, Lcom/trendmicro/hippo/ast/WithStatement;->lp:I

    .line 106
    iput p2, p0, Lcom/trendmicro/hippo/ast/WithStatement;->rp:I

    .line 107
    return-void
.end method

.method public setRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 98
    iput p1, p0, Lcom/trendmicro/hippo/ast/WithStatement;->rp:I

    .line 99
    return-void
.end method

.method public setStatement(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "statement"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 68
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/WithStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 69
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/WithStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    .line 70
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 71
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 4
    .param p1, "depth"    # I

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/WithStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    const-string v1, "with ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/WithStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/WithStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 117
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/WithStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/WithStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v1

    const/16 v2, 0x82

    const-string v3, "\n"

    if-ne v1, v2, :cond_2

    .line 120
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/WithStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 121
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/WithStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 126
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/WithStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 136
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 138
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/WithStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 140
    :cond_0
    return-void
.end method
