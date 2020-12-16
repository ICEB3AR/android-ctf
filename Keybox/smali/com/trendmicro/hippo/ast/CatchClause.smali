.class public Lcom/trendmicro/hippo/ast/CatchClause;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "CatchClause.java"


# instance fields
.field private body:Lcom/trendmicro/hippo/ast/Block;

.field private catchCondition:Lcom/trendmicro/hippo/ast/AstNode;

.field private ifPosition:I

.field private lp:I

.field private rp:I

.field private varName:Lcom/trendmicro/hippo/ast/Name;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->ifPosition:I

    .line 24
    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->lp:I

    .line 25
    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->rp:I

    .line 28
    const/16 v0, 0x7d

    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->type:I

    .line 32
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 35
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->ifPosition:I

    .line 24
    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->lp:I

    .line 25
    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->rp:I

    .line 28
    const/16 v0, 0x7d

    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->type:I

    .line 36
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->ifPosition:I

    .line 24
    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->lp:I

    .line 25
    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->rp:I

    .line 28
    const/16 v0, 0x7d

    iput v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->type:I

    .line 40
    return-void
.end method


# virtual methods
.method public getBody()Lcom/trendmicro/hippo/ast/Block;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->body:Lcom/trendmicro/hippo/ast/Block;

    return-object v0
.end method

.method public getCatchCondition()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->catchCondition:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getIfPosition()I
    .locals 1

    .line 137
    iget v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->ifPosition:I

    return v0
.end method

.method public getLp()I
    .locals 1

    .line 100
    iget v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->lp:I

    return v0
.end method

.method public getRp()I
    .locals 1

    .line 114
    iget v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->rp:I

    return v0
.end method

.method public getVarName()Lcom/trendmicro/hippo/ast/Name;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->varName:Lcom/trendmicro/hippo/ast/Name;

    return-object v0
.end method

.method public setBody(Lcom/trendmicro/hippo/ast/Block;)V
    .locals 0
    .param p1, "body"    # Lcom/trendmicro/hippo/ast/Block;

    .line 91
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/CatchClause;->assertNotNull(Ljava/lang/Object;)V

    .line 92
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->body:Lcom/trendmicro/hippo/ast/Block;

    .line 93
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Block;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 94
    return-void
.end method

.method public setCatchCondition(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "catchCondition"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 74
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->catchCondition:Lcom/trendmicro/hippo/ast/AstNode;

    .line 75
    if-eqz p1, :cond_0

    .line 76
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 77
    :cond_0
    return-void
.end method

.method public setIfPosition(I)V
    .locals 0
    .param p1, "ifPosition"    # I

    .line 145
    iput p1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->ifPosition:I

    .line 146
    return-void
.end method

.method public setLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 107
    iput p1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->lp:I

    .line 108
    return-void
.end method

.method public setParens(II)V
    .locals 0
    .param p1, "lp"    # I
    .param p2, "rp"    # I

    .line 128
    iput p1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->lp:I

    .line 129
    iput p2, p0, Lcom/trendmicro/hippo/ast/CatchClause;->rp:I

    .line 130
    return-void
.end method

.method public setRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 121
    iput p1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->rp:I

    .line 122
    return-void
.end method

.method public setVarName(Lcom/trendmicro/hippo/ast/Name;)V
    .locals 0
    .param p1, "varName"    # Lcom/trendmicro/hippo/ast/Name;

    .line 56
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/CatchClause;->assertNotNull(Ljava/lang/Object;)V

    .line 57
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->varName:Lcom/trendmicro/hippo/ast/Name;

    .line 58
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Name;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 59
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/CatchClause;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    const-string v1, "catch ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->varName:Lcom/trendmicro/hippo/ast/Name;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/Name;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->catchCondition:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v1, :cond_0

    .line 155
    const-string v1, " if "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->catchCondition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    :cond_0
    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/CatchClause;->body:Lcom/trendmicro/hippo/ast/Block;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/Block;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 169
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 170
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->varName:Lcom/trendmicro/hippo/ast/Name;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Name;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 171
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->catchCondition:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_0

    .line 172
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/CatchClause;->body:Lcom/trendmicro/hippo/ast/Block;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Block;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 176
    :cond_1
    return-void
.end method
