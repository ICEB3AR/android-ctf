.class public Lcom/trendmicro/hippo/ast/SwitchCase;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "SwitchCase.java"


# instance fields
.field private expression:Lcom/trendmicro/hippo/ast/AstNode;

.field private statements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 36
    const/16 v0, 0x74

    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->type:I

    .line 40
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 43
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 36
    const/16 v0, 0x74

    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->type:I

    .line 44
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 36
    const/16 v0, 0x74

    iput v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->type:I

    .line 48
    return-void
.end method


# virtual methods
.method public addStatement(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 2
    .param p1, "statement"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 108
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/SwitchCase;->assertNotNull(Ljava/lang/Object;)V

    .line 109
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->statements:Ljava/util/List;

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->statements:Ljava/util/List;

    .line 112
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getPosition()I

    move-result v0

    invoke-virtual {p1}, Lcom/trendmicro/hippo/ast/AstNode;->getLength()I

    move-result v1

    add-int/2addr v0, v1

    .line 113
    .local v0, "end":I
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/SwitchCase;->getPosition()I

    move-result v1

    sub-int v1, v0, v1

    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/SwitchCase;->setLength(I)V

    .line 114
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->statements:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 116
    return-void
.end method

.method public getExpression()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getStatements()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->statements:Ljava/util/List;

    return-object v0
.end method

.method public isDefault()Z
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setExpression(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "expression"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 65
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    .line 66
    if-eqz p1, :cond_0

    .line 67
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 68
    :cond_0
    return-void
.end method

.method public setStatements(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/AstNode;",
            ">;)V"
        }
    .end annotation

    .line 90
    .local p1, "statements":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/AstNode;>;"
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->statements:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 91
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 93
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/AstNode;

    .line 94
    .local v1, "s":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/SwitchCase;->addStatement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 95
    .end local v1    # "s":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 96
    :cond_1
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 6
    .param p1, "depth"    # I

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/SwitchCase;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    const-string v2, "\n"

    if-nez v1, :cond_0

    .line 123
    const-string v1, "default:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 125
    :cond_0
    const-string v1, "case "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/SwitchCase;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 129
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/SwitchCase;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    add-int/lit8 v3, p1, 0x1

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    :goto_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->statements:Ljava/util/List;

    if-eqz v1, :cond_3

    .line 134
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trendmicro/hippo/ast/AstNode;

    .line 135
    .local v3, "s":Lcom/trendmicro/hippo/ast/AstNode;
    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    invoke-virtual {v3}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v4

    const/16 v5, 0xa2

    if-ne v4, v5, :cond_2

    move-object v4, v3

    check-cast v4, Lcom/trendmicro/hippo/ast/Comment;

    invoke-virtual {v4}, Lcom/trendmicro/hippo/ast/Comment;->getCommentType()Lcom/trendmicro/hippo/Token$CommentType;

    move-result-object v4

    sget-object v5, Lcom/trendmicro/hippo/Token$CommentType;->LINE:Lcom/trendmicro/hippo/Token$CommentType;

    if-ne v4, v5, :cond_2

    .line 137
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .end local v3    # "s":Lcom/trendmicro/hippo/ast/AstNode;
    :cond_2
    goto :goto_1

    .line 141
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 150
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 151
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->expression:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_0

    .line 152
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/SwitchCase;->statements:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 155
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/AstNode;

    .line 156
    .local v1, "s":Lcom/trendmicro/hippo/ast/AstNode;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 157
    .end local v1    # "s":Lcom/trendmicro/hippo/ast/AstNode;
    goto :goto_0

    .line 160
    :cond_1
    return-void
.end method
