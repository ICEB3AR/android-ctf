.class public Lcom/trendmicro/hippo/ast/VariableInitializer;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "VariableInitializer.java"


# instance fields
.field private initializer:Lcom/trendmicro/hippo/ast/AstNode;

.field private target:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 25
    const/16 v0, 0x7b

    iput v0, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->type:I

    .line 42
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 45
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 25
    const/16 v0, 0x7b

    iput v0, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->type:I

    .line 46
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 49
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 25
    const/16 v0, 0x7b

    iput v0, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->type:I

    .line 50
    return-void
.end method


# virtual methods
.method public getInitializer()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->initializer:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getTarget()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->target:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public isDestructuring()Z
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->target:Lcom/trendmicro/hippo/ast/AstNode;

    instance-of v0, v0, Lcom/trendmicro/hippo/ast/Name;

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public setInitializer(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "initializer"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 96
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->initializer:Lcom/trendmicro/hippo/ast/AstNode;

    .line 97
    if-eqz p1, :cond_0

    .line 98
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 99
    :cond_0
    return-void
.end method

.method public setNodeType(I)V
    .locals 2
    .param p1, "nodeType"    # I

    .line 34
    const/16 v0, 0x7b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9a

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 37
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid node type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/VariableInitializer;->setType(I)Lcom/trendmicro/hippo/Node;

    .line 39
    return-void
.end method

.method public setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 2
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 78
    if-eqz p1, :cond_0

    .line 80
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->target:Lcom/trendmicro/hippo/ast/AstNode;

    .line 81
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 82
    return-void

    .line 79
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid target arg"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/VariableInitializer;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->target:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->initializer:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v1, :cond_0

    .line 107
    const-string v1, " = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->initializer:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 119
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->target:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 121
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/VariableInitializer;->initializer:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_0

    .line 122
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 125
    :cond_0
    return-void
.end method
