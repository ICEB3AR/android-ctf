.class public Lcom/trendmicro/hippo/ast/ThrowStatement;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "ThrowStatement.java"


# instance fields
.field private expression:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 22
    const/16 v0, 0x32

    iput v0, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->type:I

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 29
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 22
    const/16 v0, 0x32

    iput v0, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 22
    const/16 v0, 0x32

    iput v0, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 22
    const/16 v0, 0x32

    iput v0, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->type:I

    .line 47
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/ThrowStatement;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 48
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 41
    invoke-virtual {p2}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 22
    const/16 v0, 0x32

    iput v0, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->type:I

    .line 42
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/ThrowStatement;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 36
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 22
    const/16 v0, 0x32

    iput v0, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->type:I

    .line 37
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ThrowStatement;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 38
    return-void
.end method


# virtual methods
.method public getExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "expression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 63
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ThrowStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 64
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 65
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ThrowStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    const-string v1, "throw"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    const-string v1, ";\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 84
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ThrowStatement;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 87
    :cond_0
    return-void
.end method
