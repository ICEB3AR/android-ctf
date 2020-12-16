.class public Lcom/trendmicro/hippo/ast/ParenthesizedExpression;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "ParenthesizedExpression.java"


# instance fields
.field private expression:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 20
    const/16 v0, 0x58

    iput v0, p0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->type:I

    .line 24
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 27
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 20
    const/16 v0, 0x58

    iput v0, p0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->type:I

    .line 28
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 20
    const/16 v0, 0x58

    iput v0, p0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->type:I

    .line 32
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 41
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 20
    const/16 v0, 0x58

    iput v0, p0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->type:I

    .line 42
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 2
    .param p1, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 35
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 36
    :goto_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v1

    goto :goto_1

    :cond_1
    const/4 v1, 0x1

    .line 35
    :goto_1
    invoke-direct {p0, v0, v1, p1}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;)V

    .line 38
    return-void
.end method


# virtual methods
.method public getExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "expression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 59
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 60
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 61
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 62
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 74
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ParenthesizedExpression;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 77
    :cond_0
    return-void
.end method
