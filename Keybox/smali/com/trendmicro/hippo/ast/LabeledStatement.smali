.class public Lcom/trendmicro/hippo/ast/LabeledStatement;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "LabeledStatement.java"


# instance fields
.field private labels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Label;",
            ">;"
        }
    .end annotation
.end field

.field private statement:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    .line 27
    const/16 v0, 0x86

    iput v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 34
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    .line 27
    const/16 v0, 0x86

    iput v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->type:I

    .line 35
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 38
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    .line 27
    const/16 v0, 0x86

    iput v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->type:I

    .line 39
    return-void
.end method


# virtual methods
.method public addLabel(Lcom/trendmicro/hippo/ast/Label;)V
    .locals 1
    .param p1, "label"    # Lcom/trendmicro/hippo/ast/Label;

    .line 67
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 68
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Label;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 70
    return-void
.end method

.method public getFirstLabel()Lcom/trendmicro/hippo/ast/Label;
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trendmicro/hippo/ast/Label;

    return-object v0
.end method

.method public getLabelByName(Ljava/lang/String;)Lcom/trendmicro/hippo/ast/Label;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 85
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/Label;

    .line 86
    .local v1, "label":Lcom/trendmicro/hippo/ast/Label;
    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/Label;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 87
    return-object v1

    .line 89
    .end local v1    # "label":Lcom/trendmicro/hippo/ast/Label;
    :cond_0
    goto :goto_0

    .line 90
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLabels()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Label;",
            ">;"
        }
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    return-object v0
.end method

.method public getStatement()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public hasSideEffects()Z
    .locals 1

    .line 110
    const/4 v0, 0x1

    return v0
.end method

.method public setLabels(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/Label;",
            ">;)V"
        }
    .end annotation

    .line 54
    .local p1, "labels":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/Label;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 55
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 56
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 57
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/Label;

    .line 58
    .local v1, "l":Lcom/trendmicro/hippo/ast/Label;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->addLabel(Lcom/trendmicro/hippo/ast/Label;)V

    .line 59
    .end local v1    # "l":Lcom/trendmicro/hippo/ast/Label;
    goto :goto_0

    .line 60
    :cond_1
    return-void
.end method

.method public setStatement(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "statement"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 98
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/LabeledStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 99
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    .line 100
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 101
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 4
    .param p1, "depth"    # I

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ast/Label;

    .line 117
    .local v2, "label":Lcom/trendmicro/hippo/ast/Label;
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/ast/Label;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .end local v2    # "label":Lcom/trendmicro/hippo/ast/Label;
    goto :goto_0

    .line 119
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 129
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 130
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->labels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/AstNode;

    .line 131
    .local v1, "label":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 132
    .end local v1    # "label":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/LabeledStatement;->statement:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 135
    :cond_1
    return-void
.end method
