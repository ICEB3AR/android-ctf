.class public Lcom/trendmicro/hippo/ast/ObjectProperty;
.super Lcom/trendmicro/hippo/ast/InfixExpression;
.source "ObjectProperty.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 54
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>()V

    .line 36
    const/16 v0, 0x68

    iput v0, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    .line 55
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 58
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(I)V

    .line 36
    const/16 v0, 0x68

    iput v0, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    .line 59
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 62
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/InfixExpression;-><init>(II)V

    .line 36
    const/16 v0, 0x68

    iput v0, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    .line 63
    return-void
.end method


# virtual methods
.method public isGetterMethod()Z
    .locals 2

    .line 76
    iget v0, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    const/16 v1, 0x98

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isMethod()Z
    .locals 1

    .line 102
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isGetterMethod()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isSetterMethod()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isNormalMethod()Z

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

.method public isNormalMethod()Z
    .locals 2

    .line 98
    iget v0, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    const/16 v1, 0xa4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSetterMethod()Z
    .locals 2

    .line 90
    iget v0, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    const/16 v1, 0x99

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setIsGetterMethod()V
    .locals 1

    .line 69
    const/16 v0, 0x98

    iput v0, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    .line 70
    return-void
.end method

.method public setIsNormalMethod()V
    .locals 1

    .line 94
    const/16 v0, 0xa4

    iput v0, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    .line 95
    return-void
.end method

.method public setIsSetterMethod()V
    .locals 1

    .line 83
    const/16 v0, 0x99

    iput v0, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    .line 84
    return-void
.end method

.method public setNodeType(I)V
    .locals 3
    .param p1, "nodeType"    # I

    .line 45
    const/16 v0, 0x68

    if-eq p1, v0, :cond_1

    const/16 v0, 0x98

    if-eq p1, v0, :cond_1

    const/16 v0, 0x99

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa4

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 49
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid node type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ObjectProperty;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 52
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 5
    .param p1, "depth"    # I

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/ObjectProperty;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isGetterMethod()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 111
    const-string v1, "get "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 112
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ObjectProperty;->isSetterMethod()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 113
    const-string v1, "set "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->left:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ObjectProperty;->getType()I

    move-result v2

    const/4 v3, 0x0

    const/16 v4, 0x68

    if-ne v2, v4, :cond_2

    move v2, v3

    goto :goto_1

    :cond_2
    move v2, p1

    :goto_1
    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    iget v1, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->type:I

    if-ne v1, v4, :cond_3

    .line 117
    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    :cond_3
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ObjectProperty;->right:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ObjectProperty;->getType()I

    move-result v2

    if-ne v2, v4, :cond_4

    goto :goto_2

    :cond_4
    add-int/lit8 v3, p1, 0x1

    :goto_2
    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
