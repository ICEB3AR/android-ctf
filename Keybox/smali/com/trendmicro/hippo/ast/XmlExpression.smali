.class public Lcom/trendmicro/hippo/ast/XmlExpression;
.super Lcom/trendmicro/hippo/ast/XmlFragment;
.source "XmlExpression.java"


# instance fields
.field private expression:Lcom/trendmicro/hippo/ast/AstNode;

.field private isXmlAttribute:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/XmlFragment;-><init>()V

    .line 22
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "pos"    # I

    .line 25
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/XmlFragment;-><init>(I)V

    .line 26
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/XmlFragment;-><init>(II)V

    .line 30
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 33
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/XmlFragment;-><init>(I)V

    .line 34
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/XmlExpression;->setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 35
    return-void
.end method


# virtual methods
.method public getExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlExpression;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public isXmlAttribute()Z
    .locals 1

    .line 58
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/XmlExpression;->isXmlAttribute:Z

    return v0
.end method

.method public setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "expression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 49
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 50
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/XmlExpression;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 51
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 52
    return-void
.end method

.method public setIsXmlAttribute(Z)V
    .locals 0
    .param p1, "isXmlAttribute"    # Z

    .line 65
    iput-boolean p1, p0, Lcom/trendmicro/hippo/ast/XmlExpression;->isXmlAttribute:Z

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlExpression;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/XmlExpression;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 78
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlExpression;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 81
    :cond_0
    return-void
.end method
