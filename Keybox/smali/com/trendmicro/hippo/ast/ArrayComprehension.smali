.class public Lcom/trendmicro/hippo/ast/ArrayComprehension;
.super Lcom/trendmicro/hippo/ast/Scope;
.source "ArrayComprehension.java"


# instance fields
.field private filter:Lcom/trendmicro/hippo/ast/AstNode;

.field private ifPosition:I

.field private loops:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;",
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

    .line 32
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Scope;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->loops:Ljava/util/List;

    .line 24
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->ifPosition:I

    .line 25
    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->lp:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->rp:I

    .line 29
    const/16 v0, 0x9e

    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 36
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Scope;-><init>(I)V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->loops:Ljava/util/List;

    .line 24
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->ifPosition:I

    .line 25
    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->lp:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->rp:I

    .line 29
    const/16 v0, 0x9e

    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->type:I

    .line 37
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Scope;-><init>(II)V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->loops:Ljava/util/List;

    .line 24
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->ifPosition:I

    .line 25
    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->lp:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->rp:I

    .line 29
    const/16 v0, 0x9e

    iput v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->type:I

    .line 41
    return-void
.end method


# virtual methods
.method public addLoop(Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;)V
    .locals 1
    .param p1, "acl"    # Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;

    .line 84
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->assertNotNull(Ljava/lang/Object;)V

    .line 85
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->loops:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 87
    return-void
.end method

.method public getFilter()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getFilterLp()I
    .locals 1

    .line 124
    iget v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->lp:I

    return v0
.end method

.method public getFilterRp()I
    .locals 1

    .line 138
    iget v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->rp:I

    return v0
.end method

.method public getIfPosition()I
    .locals 1

    .line 110
    iget v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->ifPosition:I

    return v0
.end method

.method public getLoops()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;",
            ">;"
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->loops:Ljava/util/List;

    return-object v0
.end method

.method public getResult()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->result:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setFilter(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "filter"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 101
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    .line 102
    if-eqz p1, :cond_0

    .line 103
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 104
    :cond_0
    return-void
.end method

.method public setFilterLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 131
    iput p1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->lp:I

    .line 132
    return-void
.end method

.method public setFilterRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 145
    iput p1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->rp:I

    .line 146
    return-void
.end method

.method public setIfPosition(I)V
    .locals 0
    .param p1, "ifPosition"    # I

    .line 117
    iput p1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->ifPosition:I

    .line 118
    return-void
.end method

.method public setLoops(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;",
            ">;)V"
        }
    .end annotation

    .line 72
    .local p1, "loops":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->assertNotNull(Ljava/lang/Object;)V

    .line 73
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->loops:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 74
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;

    .line 75
    .local v1, "acl":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->addLoop(Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;)V

    .line 76
    .end local v1    # "acl":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    goto :goto_0

    .line 77
    :cond_0
    return-void
.end method

.method public setResult(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "result"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 55
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ArrayComprehension;->assertNotNull(Ljava/lang/Object;)V

    .line 56
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->result:Lcom/trendmicro/hippo/ast/AstNode;

    .line 57
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 58
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 5
    .param p1, "depth"    # I

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xfa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 151
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->result:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->loops:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;

    .line 154
    .local v3, "loop":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->toSource(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .end local v3    # "loop":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    goto :goto_0

    .line 156
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v1, :cond_1

    .line 157
    const-string v1, " if ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    :cond_1
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 171
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 172
    return-void

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->result:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 175
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->loops:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;

    .line 176
    .local v1, "loop":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 177
    .end local v1    # "loop":Lcom/trendmicro/hippo/ast/ArrayComprehensionLoop;
    goto :goto_0

    .line 178
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ArrayComprehension;->filter:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_2

    .line 179
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 181
    :cond_2
    return-void
.end method
