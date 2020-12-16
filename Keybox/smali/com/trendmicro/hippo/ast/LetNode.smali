.class public Lcom/trendmicro/hippo/ast/LetNode;
.super Lcom/trendmicro/hippo/ast/Scope;
.source "LetNode.java"


# instance fields
.field private body:Lcom/trendmicro/hippo/ast/AstNode;

.field private lp:I

.field private rp:I

.field private variables:Lcom/trendmicro/hippo/ast/VariableDeclaration;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Scope;-><init>()V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->lp:I

    .line 30
    iput v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->rp:I

    .line 33
    const/16 v0, 0x9f

    iput v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->type:I

    .line 37
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 40
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Scope;-><init>(I)V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->lp:I

    .line 30
    iput v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->rp:I

    .line 33
    const/16 v0, 0x9f

    iput v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->type:I

    .line 41
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Scope;-><init>(II)V

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->lp:I

    .line 30
    iput v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->rp:I

    .line 33
    const/16 v0, 0x9f

    iput v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->type:I

    .line 45
    return-void
.end method


# virtual methods
.method public getBody()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->body:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getLp()I
    .locals 1

    .line 92
    iget v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->lp:I

    return v0
.end method

.method public getRp()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->rp:I

    return v0
.end method

.method public getVariables()Lcom/trendmicro/hippo/ast/VariableDeclaration;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->variables:Lcom/trendmicro/hippo/ast/VariableDeclaration;

    return-object v0
.end method

.method public setBody(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "body"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 83
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/LetNode;->body:Lcom/trendmicro/hippo/ast/AstNode;

    .line 84
    if-eqz p1, :cond_0

    .line 85
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 86
    :cond_0
    return-void
.end method

.method public setLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 99
    iput p1, p0, Lcom/trendmicro/hippo/ast/LetNode;->lp:I

    .line 100
    return-void
.end method

.method public setParens(II)V
    .locals 0
    .param p1, "lp"    # I
    .param p2, "rp"    # I

    .line 120
    iput p1, p0, Lcom/trendmicro/hippo/ast/LetNode;->lp:I

    .line 121
    iput p2, p0, Lcom/trendmicro/hippo/ast/LetNode;->rp:I

    .line 122
    return-void
.end method

.method public setRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 113
    iput p1, p0, Lcom/trendmicro/hippo/ast/LetNode;->rp:I

    .line 114
    return-void
.end method

.method public setVariables(Lcom/trendmicro/hippo/ast/VariableDeclaration;)V
    .locals 0
    .param p1, "variables"    # Lcom/trendmicro/hippo/ast/VariableDeclaration;

    .line 59
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/LetNode;->assertNotNull(Ljava/lang/Object;)V

    .line 60
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/LetNode;->variables:Lcom/trendmicro/hippo/ast/VariableDeclaration;

    .line 61
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 62
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 126
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/LetNode;->makeIndent(I)Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "pad":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    const-string v2, "let ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/LetNode;->variables:Lcom/trendmicro/hippo/ast/VariableDeclaration;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->getVariables()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/trendmicro/hippo/ast/LetNode;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 131
    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/LetNode;->body:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v2, :cond_0

    .line 133
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 144
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->variables:Lcom/trendmicro/hippo/ast/VariableDeclaration;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 146
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LetNode;->body:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_0

    .line 147
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 150
    :cond_0
    return-void
.end method
