.class public Lcom/trendmicro/hippo/ast/ExpressionStatement;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "ExpressionStatement.java"


# instance fields
.field private expr:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 21
    const/16 v0, 0x86

    iput v0, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 63
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 21
    const/16 v0, 0x86

    iput v0, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->type:I

    .line 64
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 74
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 21
    const/16 v0, 0x86

    iput v0, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->type:I

    .line 75
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 2
    .param p1, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 59
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v1

    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/hippo/ast/ExpressionStatement;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;Z)V
    .locals 0
    .param p1, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "hasResult"    # Z

    .line 46
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/ExpressionStatement;-><init>(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 47
    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->setHasResult()V

    .line 48
    :cond_0
    return-void
.end method


# virtual methods
.method public getExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->expr:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public hasSideEffects()Z
    .locals 2

    .line 103
    iget v0, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->type:I

    const/16 v1, 0x87

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->expr:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->hasSideEffects()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "expression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 90
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 91
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->expr:Lcom/trendmicro/hippo/ast/AstNode;

    .line 92
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 93
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLineno()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->setLineno(I)V

    .line 94
    return-void
.end method

.method public setHasResult()V
    .locals 1

    .line 29
    const/16 v0, 0x87

    iput v0, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->type:I

    .line 30
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->expr:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 112
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ExpressionStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    :cond_0
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 123
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ExpressionStatement;->expr:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 126
    :cond_0
    return-void
.end method
