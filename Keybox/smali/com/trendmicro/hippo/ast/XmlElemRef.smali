.class public Lcom/trendmicro/hippo/ast/XmlElemRef;
.super Lcom/trendmicro/hippo/ast/XmlRef;
.source "XmlElemRef.java"


# instance fields
.field private indexExpr:Lcom/trendmicro/hippo/ast/AstNode;

.field private lb:I

.field private rb:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/XmlRef;-><init>()V

    .line 36
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->lb:I

    .line 37
    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->rb:I

    .line 40
    const/16 v0, 0x4e

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->type:I

    .line 44
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 47
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/XmlRef;-><init>(I)V

    .line 36
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->lb:I

    .line 37
    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->rb:I

    .line 40
    const/16 v0, 0x4e

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->type:I

    .line 48
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 51
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/XmlRef;-><init>(II)V

    .line 36
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->lb:I

    .line 37
    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->rb:I

    .line 40
    const/16 v0, 0x4e

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->type:I

    .line 52
    return-void
.end method


# virtual methods
.method public getExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->indexExpr:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getLb()I
    .locals 1

    .line 76
    iget v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->lb:I

    return v0
.end method

.method public getRb()I
    .locals 1

    .line 90
    iget v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->rb:I

    return v0
.end method

.method public setBrackets(II)V
    .locals 0
    .param p1, "lb"    # I
    .param p2, "rb"    # I

    .line 104
    iput p1, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->lb:I

    .line 105
    iput p2, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->rb:I

    .line 106
    return-void
.end method

.method public setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "expr"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 67
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlElemRef;->assertNotNull(Ljava/lang/Object;)V

    .line 68
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->indexExpr:Lcom/trendmicro/hippo/ast/AstNode;

    .line 69
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 70
    return-void
.end method

.method public setLb(I)V
    .locals 0
    .param p1, "lb"    # I

    .line 83
    iput p1, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->lb:I

    .line 84
    return-void
.end method

.method public setRb(I)V
    .locals 0
    .param p1, "rb"    # I

    .line 97
    iput p1, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->rb:I

    .line 98
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlElemRef;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/XmlElemRef;->isAttributeAccess()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 113
    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->namespace:Lcom/trendmicro/hippo/ast/Name;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 116
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->namespace:Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/Name;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    const-string v1, "::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    :cond_1
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->indexExpr:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 131
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->namespace:Lcom/trendmicro/hippo/ast/Name;

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->namespace:Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Name;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 135
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlElemRef;->indexExpr:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 137
    :cond_1
    return-void
.end method
