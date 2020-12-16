.class public Lcom/trendmicro/hippo/ast/PropertyGet;
.super Lcom/trendmicro/hippo/ast/InfixExpression;
.source "PropertyGet.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>()V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lcom/trendmicro/hippo/ast/PropertyGet;->type:I

    .line 21
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 24
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(I)V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lcom/trendmicro/hippo/ast/PropertyGet;->type:I

    .line 25
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(II)V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lcom/trendmicro/hippo/ast/PropertyGet;->type:I

    .line 29
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/Name;)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "target"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p4, "property"    # Lcom/trendmicro/hippo/ast/Name;

    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(IILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lcom/trendmicro/hippo/ast/PropertyGet;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/Name;)V
    .locals 1
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "property"    # Lcom/trendmicro/hippo/ast/Name;

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 17
    const/16 v0, 0x21

    iput v0, p0, Lcom/trendmicro/hippo/ast/PropertyGet;->type:I

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/Name;I)V
    .locals 1
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "property"    # Lcom/trendmicro/hippo/ast/Name;
    .param p3, "dotPosition"    # I

    .line 44
    const/16 v0, 0x21

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(ILcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;I)V

    .line 17
    iput v0, p0, Lcom/trendmicro/hippo/ast/PropertyGet;->type:I

    .line 45
    return-void
.end method


# virtual methods
.method public getProperty()Lcom/trendmicro/hippo/ast/Name;
    .locals 1

    .line 69
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/PropertyGet;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/Name;

    return-object v0
.end method

.method public getTarget()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 52
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/PropertyGet;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    return-object v0
.end method

.method public setProperty(Lcom/trendmicro/hippo/ast/Name;)V
    .locals 0
    .param p1, "property"    # Lcom/trendmicro/hippo/ast/Name;

    .line 77
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/PropertyGet;->setRight(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 78
    return-void
.end method

.method public setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 62
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/PropertyGet;->setLeft(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 63
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/PropertyGet;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/PropertyGet;->getLeft()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/PropertyGet;->getRight()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 95
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/PropertyGet;->getTarget()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 97
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/PropertyGet;->getProperty()Lcom/trendmicro/hippo/ast/Name;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Name;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 99
    :cond_0
    return-void
.end method
