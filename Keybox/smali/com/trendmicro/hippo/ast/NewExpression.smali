.class public Lcom/trendmicro/hippo/ast/NewExpression;
.super Lcom/trendmicro/hippo/ast/FunctionCall;
.source "NewExpression.java"


# instance fields
.field private initializer:Lcom/trendmicro/hippo/ast/ObjectLiteral;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/FunctionCall;-><init>()V

    .line 27
    const/16 v0, 0x1e

    iput v0, p0, Lcom/trendmicro/hippo/ast/NewExpression;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 34
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/FunctionCall;-><init>(I)V

    .line 27
    const/16 v0, 0x1e

    iput v0, p0, Lcom/trendmicro/hippo/ast/NewExpression;->type:I

    .line 35
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 38
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/FunctionCall;-><init>(II)V

    .line 27
    const/16 v0, 0x1e

    iput v0, p0, Lcom/trendmicro/hippo/ast/NewExpression;->type:I

    .line 39
    return-void
.end method


# virtual methods
.method public getInitializer()Lcom/trendmicro/hippo/ast/ObjectLiteral;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/NewExpression;->initializer:Lcom/trendmicro/hippo/ast/ObjectLiteral;

    return-object v0
.end method

.method public setInitializer(Lcom/trendmicro/hippo/ast/ObjectLiteral;)V
    .locals 0
    .param p1, "initializer"    # Lcom/trendmicro/hippo/ast/ObjectLiteral;

    .line 60
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/NewExpression;->initializer:Lcom/trendmicro/hippo/ast/ObjectLiteral;

    .line 61
    if-eqz p1, :cond_0

    .line 62
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 63
    :cond_0
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/NewExpression;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    const-string v1, "new "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/NewExpression;->target:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/NewExpression;->arguments:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 73
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/NewExpression;->arguments:Ljava/util/List;

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/ast/NewExpression;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 75
    :cond_0
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/NewExpression;->initializer:Lcom/trendmicro/hippo/ast/ObjectLiteral;

    if-eqz v1, :cond_1

    .line 77
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/NewExpression;->initializer:Lcom/trendmicro/hippo/ast/ObjectLiteral;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 89
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 90
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/NewExpression;->target:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 91
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/NewExpression;->getArguments()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/AstNode;

    .line 92
    .local v1, "arg":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 93
    .end local v1    # "arg":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/NewExpression;->initializer:Lcom/trendmicro/hippo/ast/ObjectLiteral;

    if-eqz v0, :cond_1

    .line 95
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/ObjectLiteral;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 98
    :cond_1
    return-void
.end method
