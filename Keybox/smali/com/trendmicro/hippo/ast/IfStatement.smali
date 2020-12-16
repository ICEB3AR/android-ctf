.class public Lcom/trendmicro/hippo/ast/IfStatement;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "IfStatement.java"


# instance fields
.field private condition:Lcom/trendmicro/hippo/ast/AstNode;

.field private elseKeyWordInlineComment:Lcom/trendmicro/hippo/ast/AstNode;

.field private elsePart:Lcom/trendmicro/hippo/ast/AstNode;

.field private elsePosition:I

.field private lp:I

.field private rp:I

.field private thenPart:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePosition:I

    .line 25
    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->lp:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->rp:I

    .line 29
    const/16 v0, 0x71

    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 36
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePosition:I

    .line 25
    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->lp:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->rp:I

    .line 29
    const/16 v0, 0x71

    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->type:I

    .line 37
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePosition:I

    .line 25
    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->lp:I

    .line 26
    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->rp:I

    .line 29
    const/16 v0, 0x71

    iput v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->type:I

    .line 41
    return-void
.end method


# virtual methods
.method public getCondition()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getElseKeyWordInlineComment()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 201
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elseKeyWordInlineComment:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getElsePart()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePart:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getElsePosition()I
    .locals 1

    .line 99
    iget v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePosition:I

    return v0
.end method

.method public getLp()I
    .locals 1

    .line 113
    iget v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->lp:I

    return v0
.end method

.method public getRp()I
    .locals 1

    .line 127
    iget v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->rp:I

    return v0
.end method

.method public getThenPart()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->thenPart:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setCondition(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "condition"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 55
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/IfStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 56
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/IfStatement;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    .line 57
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 58
    return-void
.end method

.method public setElseKeyWordInlineComment(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "elseKeyWordInlineComment"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 205
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elseKeyWordInlineComment:Lcom/trendmicro/hippo/ast/AstNode;

    .line 206
    return-void
.end method

.method public setElsePart(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "elsePart"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 90
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePart:Lcom/trendmicro/hippo/ast/AstNode;

    .line 91
    if-eqz p1, :cond_0

    .line 92
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 93
    :cond_0
    return-void
.end method

.method public setElsePosition(I)V
    .locals 0
    .param p1, "elsePosition"    # I

    .line 106
    iput p1, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePosition:I

    .line 107
    return-void
.end method

.method public setLp(I)V
    .locals 0
    .param p1, "lp"    # I

    .line 120
    iput p1, p0, Lcom/trendmicro/hippo/ast/IfStatement;->lp:I

    .line 121
    return-void
.end method

.method public setParens(II)V
    .locals 0
    .param p1, "lp"    # I
    .param p2, "rp"    # I

    .line 141
    iput p1, p0, Lcom/trendmicro/hippo/ast/IfStatement;->lp:I

    .line 142
    iput p2, p0, Lcom/trendmicro/hippo/ast/IfStatement;->rp:I

    .line 143
    return-void
.end method

.method public setRp(I)V
    .locals 0
    .param p1, "rp"    # I

    .line 134
    iput p1, p0, Lcom/trendmicro/hippo/ast/IfStatement;->rp:I

    .line 135
    return-void
.end method

.method public setThenPart(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "thenPart"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 72
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/IfStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 73
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/IfStatement;->thenPart:Lcom/trendmicro/hippo/ast/AstNode;

    .line 74
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 75
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 6
    .param p1, "depth"    # I

    .line 147
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/IfStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "pad":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 149
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    const-string v2, "if ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/IfStatement;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/IfStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    const-string v3, "    "

    const-string v4, "\n"

    if-eqz v2, :cond_0

    .line 154
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/IfStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    :cond_0
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/IfStatement;->thenPart:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v2

    const/16 v5, 0x82

    if-eq v2, v5, :cond_2

    .line 157
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/IfStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    if-nez v2, :cond_1

    .line 158
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    :cond_1
    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/ast/IfStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    :cond_2
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/IfStatement;->thenPart:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePart:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v2, :cond_7

    .line 164
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/IfStatement;->thenPart:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v2

    if-eq v2, v5, :cond_3

    .line 165
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "else "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 167
    :cond_3
    const-string v2, " else "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    :goto_0
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/IfStatement;->getElseKeyWordInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 170
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/IfStatement;->getElseKeyWordInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    :cond_4
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePart:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v2

    if-eq v2, v5, :cond_6

    iget-object v2, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePart:Lcom/trendmicro/hippo/ast/AstNode;

    .line 173
    invoke-virtual {v2}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v2

    const/16 v3, 0x71

    if-eq v2, v3, :cond_6

    .line 174
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/IfStatement;->getElseKeyWordInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v2

    if-nez v2, :cond_5

    .line 175
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    :cond_5
    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lcom/trendmicro/hippo/ast/IfStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    :cond_6
    iget-object v2, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePart:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    :cond_7
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 191
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 193
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->thenPart:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 194
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/IfStatement;->elsePart:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_0

    .line 195
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 198
    :cond_0
    return-void
.end method
