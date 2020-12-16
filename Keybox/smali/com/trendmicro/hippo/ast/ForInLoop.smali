.class public Lcom/trendmicro/hippo/ast/ForInLoop;
.super Lcom/trendmicro/hippo/ast/Loop;
.source "ForInLoop.java"


# instance fields
.field protected eachPosition:I

.field protected inPosition:I

.field protected isForEach:Z

.field protected isForOf:Z

.field protected iteratedObject:Lcom/trendmicro/hippo/ast/AstNode;

.field protected iterator:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Loop;-><init>()V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->inPosition:I

    .line 24
    iput v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->eachPosition:I

    .line 29
    const/16 v0, 0x78

    iput v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 36
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Loop;-><init>(I)V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->inPosition:I

    .line 24
    iput v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->eachPosition:I

    .line 29
    const/16 v0, 0x78

    iput v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->type:I

    .line 37
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Loop;-><init>(II)V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->inPosition:I

    .line 24
    iput v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->eachPosition:I

    .line 29
    const/16 v0, 0x78

    iput v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->type:I

    .line 41
    return-void
.end method


# virtual methods
.method public getEachPosition()I
    .locals 1

    .line 126
    iget v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->eachPosition:I

    return v0
.end method

.method public getInPosition()I
    .locals 1

    .line 110
    iget v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->inPosition:I

    return v0
.end method

.method public getIteratedObject()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->iteratedObject:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getIterator()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->iterator:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public isForEach()Z
    .locals 1

    .line 82
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->isForEach:Z

    return v0
.end method

.method public isForOf()Z
    .locals 1

    .line 96
    iget-boolean v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->isForOf:Z

    return v0
.end method

.method public setEachPosition(I)V
    .locals 0
    .param p1, "eachPosition"    # I

    .line 135
    iput p1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->eachPosition:I

    .line 136
    return-void
.end method

.method public setInPosition(I)V
    .locals 0
    .param p1, "inPosition"    # I

    .line 119
    iput p1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->inPosition:I

    .line 120
    return-void
.end method

.method public setIsForEach(Z)V
    .locals 0
    .param p1, "isForEach"    # Z

    .line 89
    iput-boolean p1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->isForEach:Z

    .line 90
    return-void
.end method

.method public setIsForOf(Z)V
    .locals 0
    .param p1, "isForOf"    # Z

    .line 103
    iput-boolean p1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->isForOf:Z

    .line 104
    return-void
.end method

.method public setIteratedObject(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "object"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 73
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->assertNotNull(Ljava/lang/Object;)V

    .line 74
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->iteratedObject:Lcom/trendmicro/hippo/ast/AstNode;

    .line 75
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 76
    return-void
.end method

.method public setIterator(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "iterator"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 56
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->assertNotNull(Ljava/lang/Object;)V

    .line 57
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->iterator:Lcom/trendmicro/hippo/ast/AstNode;

    .line 58
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 59
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 4
    .param p1, "depth"    # I

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ForInLoop;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    const-string v1, "for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ForInLoop;->isForEach()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 144
    const-string v1, "each "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    :cond_0
    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->iterator:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    iget-boolean v1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->isForOf:Z

    if-eqz v1, :cond_1

    .line 149
    const-string v1, " of "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 151
    :cond_1
    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->iteratedObject:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v1

    const/16 v2, 0x82

    const-string v3, "\n"

    if-ne v1, v2, :cond_2

    .line 156
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 158
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 168
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->iterator:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 170
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->iteratedObject:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 171
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForInLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 173
    :cond_0
    return-void
.end method
