.class public Lcom/trendmicro/hippo/ast/GeneratorExpression;
.super Lcom/trendmicro/hippo/ast/Scope;
.source "GeneratorExpression.java"


# instance fields
.field private filter:Lcom/trendmicro/hippo/ast/AstNode;

.field private ifPosition:I

.field private loops:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;",
            ">;"
        }
    .end annotation
.end field

.field private lp:I

.field private result:Lcom/trendmicro/hippo/ast/AstNode;

.field private rp:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Scope;-><init>()V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->loops:Ljava/util/List;

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->ifPosition:I

    .line 23
    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->lp:I

    .line 24
    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->rp:I

    .line 27
    const/16 v0, 0xa3

    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 34
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Scope;-><init>(I)V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->loops:Ljava/util/List;

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->ifPosition:I

    .line 23
    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->lp:I

    .line 24
    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->rp:I

    .line 27
    const/16 v0, 0xa3

    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->type:I

    .line 35
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 38
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Scope;-><init>(II)V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->loops:Ljava/util/List;

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->ifPosition:I

    .line 23
    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->lp:I

    .line 24
    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->rp:I

    .line 27
    const/16 v0, 0xa3

    iput v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->type:I

    .line 39
    return-void
.end method


# virtual methods
.method public addLoop(Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;)V
    .locals 1
    .param p1, "acl"    # Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;

    .line 82
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 83
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->loops:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 85
    return-void
.end method

.method public getFilter()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getFilterLp()I
    .locals 1

    .line 122
    iget v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->lp:I

    return v0
.end method

.method public getFilterRp()I
    .locals 1

    .line 136
    iget v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->rp:I

    return v0
.end method

.method public getIfPosition()I
    .locals 1

    .line 108
    iget v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->ifPosition:I

    return v0
.end method

.method public getLoops()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;",
            ">;"
        }
    .end annotation

    .line 62
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->loops:Ljava/util/List;

    return-object v0
.end method

.method public getResult()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->result:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setFilter(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "filter"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 99
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    .line 100
    if-eqz p1, :cond_0

    .line 101
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 102
    :cond_0
    return-void
.end method

.method public setFilterLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 129
    iput p1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->lp:I

    .line 130
    return-void
.end method

.method public setFilterRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 143
    iput p1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->rp:I

    .line 144
    return-void
.end method

.method public setIfPosition(I)V
    .locals 0
    .param p1, "ifPosition"    # I

    .line 115
    iput p1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->ifPosition:I

    .line 116
    return-void
.end method

.method public setLoops(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;",
            ">;)V"
        }
    .end annotation

    .line 70
    .local p1, "loops":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 71
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->loops:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 72
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;

    .line 73
    .local v1, "acl":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->addLoop(Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;)V

    .line 74
    .end local v1    # "acl":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    goto :goto_0

    .line 75
    :cond_0
    return-void
.end method

.method public setResult(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "result"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 53
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/GeneratorExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 54
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->result:Lcom/trendmicro/hippo/ast/AstNode;

    .line 55
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 56
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 5
    .param p1, "depth"    # I

    .line 148
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xfa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 149
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->result:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->loops:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;

    .line 152
    .local v3, "loop":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->toSource(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .end local v3    # "loop":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    goto :goto_0

    .line 154
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    const-string v3, ")"

    if-eqz v1, :cond_1

    .line 155
    const-string v1, " if ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    :cond_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 169
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 170
    return-void

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->result:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 173
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->loops:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;

    .line 174
    .local v1, "loop":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 175
    .end local v1    # "loop":Lcom/trendmicro/hippo/ast/GeneratorExpressionLoop;
    goto :goto_0

    .line 176
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/GeneratorExpression;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_2

    .line 177
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 179
    :cond_2
    return-void
.end method
