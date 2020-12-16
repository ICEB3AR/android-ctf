.class public Lcom/trendmicro/hippo/ast/ConditionalExpression;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "ConditionalExpression.java"


# instance fields
.field private colonPosition:I

.field private falseExpression:Lcom/trendmicro/hippo/ast/AstNode;

.field private questionMarkPosition:I

.field private testExpression:Lcom/trendmicro/hippo/ast/AstNode;

.field private trueExpression:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 30
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->questionMarkPosition:I

    .line 31
    iput v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->colonPosition:I

    .line 34
    const/16 v0, 0x67

    iput v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->type:I

    .line 38
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 41
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 30
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->questionMarkPosition:I

    .line 31
    iput v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->colonPosition:I

    .line 34
    const/16 v0, 0x67

    iput v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->type:I

    .line 42
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 45
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 30
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->questionMarkPosition:I

    .line 31
    iput v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->colonPosition:I

    .line 34
    const/16 v0, 0x67

    iput v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->type:I

    .line 46
    return-void
.end method


# virtual methods
.method public getColonPosition()I
    .locals 1

    .line 124
    iget v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->colonPosition:I

    return v0
.end method

.method public getFalseExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->falseExpression:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getQuestionMarkPosition()I
    .locals 1

    .line 109
    iget v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->questionMarkPosition:I

    return v0
.end method

.method public getTestExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->testExpression:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getTrueExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->trueExpression:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public hasSideEffects()Z
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->testExpression:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->trueExpression:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->falseExpression:Lcom/trendmicro/hippo/ast/AstNode;

    if-nez v0, :cond_1

    .line 139
    :cond_0
    invoke-static {}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->codeBug()Ljava/lang/RuntimeException;

    .line 140
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->trueExpression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->hasSideEffects()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->falseExpression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 141
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode;->hasSideEffects()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 140
    :goto_0
    return v0
.end method

.method public setColonPosition(I)V
    .locals 0
    .param p1, "colonPosition"    # I

    .line 132
    iput p1, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->colonPosition:I

    .line 133
    return-void
.end method

.method public setFalseExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "falseExpression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 100
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 101
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->falseExpression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 102
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 103
    return-void
.end method

.method public setQuestionMarkPosition(I)V
    .locals 0
    .param p1, "questionMarkPosition"    # I

    .line 117
    iput p1, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->questionMarkPosition:I

    .line 118
    return-void
.end method

.method public setTestExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "testExpression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 61
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 62
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->testExpression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 63
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 64
    return-void
.end method

.method public setTrueExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "trueExpression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 80
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 81
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->trueExpression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 82
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 83
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ConditionalExpression;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->testExpression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    const-string v1, " ? "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->trueExpression:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    const-string v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->falseExpression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 162
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->testExpression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 164
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->trueExpression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 165
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ConditionalExpression;->falseExpression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 167
    :cond_0
    return-void
.end method
