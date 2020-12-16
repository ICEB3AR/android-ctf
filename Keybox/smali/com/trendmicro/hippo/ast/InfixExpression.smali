.class public Lcom/trendmicro/hippo/ast/InfixExpression;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "InfixExpression.java"


# instance fields
.field protected left:Lcom/trendmicro/hippo/ast/AstNode;

.field protected operatorPosition:I

.field protected right:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->operatorPosition:I

    .line 22
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 25
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->operatorPosition:I

    .line 26
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->operatorPosition:I

    .line 30
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "left"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p4, "right"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->operatorPosition:I

    .line 36
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/InfixExpression;->setLeft(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 37
    invoke-virtual {p0, p4}, Lcom/trendmicro/hippo/ast/InfixExpression;->setRight(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 38
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V
    .locals 1
    .param p1, "operator"    # I
    .param p2, "left"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p3, "right"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p4, "operatorPos"    # I

    .line 53
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->operatorPosition:I

    .line 54
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 55
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    sub-int v0, p4, v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/InfixExpression;->setOperatorPosition(I)V

    .line 56
    invoke-virtual {p0, p2, p3}, Lcom/trendmicro/hippo/ast/InfixExpression;->setLeftAndRight(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "left"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "right"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 44
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->operatorPosition:I

    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;->setLeftAndRight(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 46
    return-void
.end method


# virtual methods
.method public getLeft()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->left:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getOperator()I
    .locals 1

    .line 76
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/InfixExpression;->getType()I

    move-result v0

    return v0
.end method

.method public getOperatorPosition()I
    .locals 1

    .line 137
    iget v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->operatorPosition:I

    return v0
.end method

.method public getRight()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->right:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public hasSideEffects()Z
    .locals 4

    .line 151
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/InfixExpression;->getType()I

    move-result v0

    const/16 v1, 0x5a

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_4

    const/16 v1, 0x69

    if-eq v0, v1, :cond_0

    const/16 v1, 0x6a

    if-eq v0, v1, :cond_0

    .line 159
    invoke-super {p0}, Lcom/trendmicro/hippo/ast/AstNode;->hasSideEffects()Z

    move-result v0

    return v0

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->left:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->hasSideEffects()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->right:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_3

    .line 157
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->hasSideEffects()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    goto :goto_0

    :cond_3
    move v2, v3

    .line 156
    :goto_0
    return v2

    .line 153
    :cond_4
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->right:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->hasSideEffects()Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_1

    :cond_5
    move v2, v3

    :goto_1
    return v2
.end method

.method public setLeft(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "left"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 105
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 106
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->left:Lcom/trendmicro/hippo/ast/AstNode;

    .line 108
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLineno()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/InfixExpression;->setLineno(I)V

    .line 109
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 110
    return-void
.end method

.method public setLeftAndRight(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 3
    .param p1, "left"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "right"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 60
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 61
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 63
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    .line 64
    .local v0, "beg":I
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v1

    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v2

    add-int/2addr v1, v2

    .line 65
    .local v1, "end":I
    invoke-virtual {p0, v0, v1}, Lcom/trendmicro/hippo/ast/InfixExpression;->setBounds(II)V

    .line 68
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->setLeft(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 69
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;->setRight(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 70
    return-void
.end method

.method public setOperator(I)V
    .locals 3
    .param p1, "operator"    # I

    .line 86
    invoke-static {p1}, Lcom/trendmicro/hippo/Token;->isValidToken(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 89
    return-void

    .line 87
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid token: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOperatorPosition(I)V
    .locals 0
    .param p1, "operatorPosition"    # I

    .line 145
    iput p1, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->operatorPosition:I

    .line 146
    return-void
.end method

.method public setRight(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "right"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 128
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 129
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->right:Lcom/trendmicro/hippo/ast/AstNode;

    .line 130
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 131
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 165
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->left:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/InfixExpression;->getType()I

    move-result v2

    invoke-static {v2}, Lcom/trendmicro/hippo/ast/InfixExpression;->operatorToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->right:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 180
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->left:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 182
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/InfixExpression;->right:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 184
    :cond_0
    return-void
.end method
