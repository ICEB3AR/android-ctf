.class public Lcom/trendmicro/hippo/ast/VariableDeclaration;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "VariableDeclaration.java"


# instance fields
.field private isStatement:Z

.field private variables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/VariableInitializer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->variables:Ljava/util/List;

    .line 33
    const/16 v0, 0x7b

    iput v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->type:I

    .line 37
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 40
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->variables:Ljava/util/List;

    .line 33
    const/16 v0, 0x7b

    iput v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->type:I

    .line 41
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->variables:Ljava/util/List;

    .line 33
    const/16 v0, 0x7b

    iput v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->type:I

    .line 45
    return-void
.end method

.method private declTypeName()Ljava/lang/String;
    .locals 1

    .line 128
    iget v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->type:I

    invoke-static {v0}, Lcom/trendmicro/hippo/Token;->typeToName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addVariable(Lcom/trendmicro/hippo/ast/VariableInitializer;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/VariableInitializer;

    .line 72
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->assertNotNull(Ljava/lang/Object;)V

    .line 73
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->variables:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/VariableInitializer;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 75
    return-void
.end method

.method public getVariables()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/VariableInitializer;",
            ">;"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->variables:Ljava/util/List;

    return-object v0
.end method

.method public isConst()Z
    .locals 2

    .line 103
    iget v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->type:I

    const/16 v1, 0x9b

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isLet()Z
    .locals 2

    .line 110
    iget v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->type:I

    const/16 v1, 0x9a

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isStatement()Z
    .locals 1

    .line 117
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->isStatement:Z

    return v0
.end method

.method public isVar()Z
    .locals 2

    .line 96
    iget v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->type:I

    const/16 v1, 0x7b

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setIsStatement(Z)V
    .locals 0
    .param p1, "isStatement"    # Z

    .line 124
    iput-boolean p1, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->isStatement:Z

    .line 125
    return-void
.end method

.method public setType(I)Lcom/trendmicro/hippo/Node;
    .locals 3
    .param p1, "type"    # I

    .line 83
    const/16 v0, 0x7b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9a

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 86
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid decl type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->setType(I)Lcom/trendmicro/hippo/Node;

    move-result-object v0

    return-object v0
.end method

.method public setVariables(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/VariableInitializer;",
            ">;)V"
        }
    .end annotation

    .line 59
    .local p1, "variables":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/VariableInitializer;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->assertNotNull(Ljava/lang/Object;)V

    .line 60
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->variables:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 61
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/VariableInitializer;

    .line 62
    .local v1, "vi":Lcom/trendmicro/hippo/ast/VariableInitializer;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->addVariable(Lcom/trendmicro/hippo/ast/VariableInitializer;)V

    .line 63
    .end local v1    # "vi":Lcom/trendmicro/hippo/ast/VariableInitializer;
    goto :goto_0

    .line 64
    :cond_0
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->declTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->variables:Ljava/util/List;

    invoke-virtual {p0, v1, v0}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 138
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->isStatement()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 139
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    :cond_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    const-string v2, "\n"

    if-eqz v1, :cond_1

    .line 142
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 143
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/VariableDeclaration;->isStatement()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 144
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    :cond_2
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 154
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/VariableDeclaration;->variables:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/AstNode;

    .line 156
    .local v1, "var":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 157
    .end local v1    # "var":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 159
    :cond_0
    return-void
.end method
