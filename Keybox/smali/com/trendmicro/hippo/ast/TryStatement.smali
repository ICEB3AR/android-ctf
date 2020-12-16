.class public Lcom/trendmicro/hippo/ast/TryStatement;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "TryStatement.java"


# static fields
.field private static final NO_CATCHES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/CatchClause;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private catchClauses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/CatchClause;",
            ">;"
        }
    .end annotation
.end field

.field private finallyBlock:Lcom/trendmicro/hippo/ast/AstNode;

.field private finallyPosition:I

.field private tryBlock:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/trendmicro/hippo/ast/TryStatement;->NO_CATCHES:Ljava/util/List;

    .line 29
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 35
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyPosition:I

    .line 38
    const/16 v0, 0x52

    iput v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->type:I

    .line 42
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 45
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 35
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyPosition:I

    .line 38
    const/16 v0, 0x52

    iput v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->type:I

    .line 46
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 49
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 35
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyPosition:I

    .line 38
    const/16 v0, 0x52

    iput v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->type:I

    .line 50
    return-void
.end method


# virtual methods
.method public addCatchClause(Lcom/trendmicro/hippo/ast/CatchClause;)V
    .locals 1
    .param p1, "clause"    # Lcom/trendmicro/hippo/ast/CatchClause;

    .line 97
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/TryStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 98
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->catchClauses:Ljava/util/List;

    if-nez v0, :cond_0

    .line 99
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->catchClauses:Ljava/util/List;

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->catchClauses:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/CatchClause;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 103
    return-void
.end method

.method public getCatchClauses()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/CatchClause;",
            ">;"
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->catchClauses:Ljava/util/List;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/trendmicro/hippo/ast/TryStatement;->NO_CATCHES:Ljava/util/List;

    :goto_0
    return-object v0
.end method

.method public getFinallyBlock()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyBlock:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getFinallyPosition()I
    .locals 1

    .line 126
    iget v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyPosition:I

    return v0
.end method

.method public getTryBlock()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->tryBlock:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setCatchClauses(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/CatchClause;",
            ">;)V"
        }
    .end annotation

    .line 80
    .local p1, "catchClauses":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/CatchClause;>;"
    if-nez p1, :cond_0

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->catchClauses:Ljava/util/List;

    goto :goto_1

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->catchClauses:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 84
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 85
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/CatchClause;

    .line 86
    .local v1, "cc":Lcom/trendmicro/hippo/ast/CatchClause;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/TryStatement;->addCatchClause(Lcom/trendmicro/hippo/ast/CatchClause;)V

    .line 87
    .end local v1    # "cc":Lcom/trendmicro/hippo/ast/CatchClause;
    goto :goto_0

    .line 89
    :cond_2
    :goto_1
    return-void
.end method

.method public setFinallyBlock(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "finallyBlock"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 117
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyBlock:Lcom/trendmicro/hippo/ast/AstNode;

    .line 118
    if-eqz p1, :cond_0

    .line 119
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 120
    :cond_0
    return-void
.end method

.method public setFinallyPosition(I)V
    .locals 0
    .param p1, "finallyPosition"    # I

    .line 133
    iput p1, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyPosition:I

    .line 134
    return-void
.end method

.method public setTryBlock(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "tryBlock"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 61
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/TryStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 62
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/TryStatement;->tryBlock:Lcom/trendmicro/hippo/ast/AstNode;

    .line 63
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 64
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 4
    .param p1, "depth"    # I

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xfa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 139
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/TryStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    const-string v1, "try "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/TryStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 142
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/TryStatement;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/TryStatement;->tryBlock:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/TryStatement;->getCatchClauses()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ast/CatchClause;

    .line 146
    .local v2, "cc":Lcom/trendmicro/hippo/ast/CatchClause;
    invoke-virtual {v2, p1}, Lcom/trendmicro/hippo/ast/CatchClause;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .end local v2    # "cc":Lcom/trendmicro/hippo/ast/CatchClause;
    goto :goto_0

    .line 148
    :cond_1
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyBlock:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v1, :cond_2

    .line 149
    const-string v1, " finally "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyBlock:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 161
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 162
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->tryBlock:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 163
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/TryStatement;->getCatchClauses()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/CatchClause;

    .line 164
    .local v1, "cc":Lcom/trendmicro/hippo/ast/CatchClause;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/CatchClause;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 165
    .end local v1    # "cc":Lcom/trendmicro/hippo/ast/CatchClause;
    goto :goto_0

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/TryStatement;->finallyBlock:Lcom/trendmicro/hippo/ast/AstNode;

    if-eqz v0, :cond_1

    .line 167
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 170
    :cond_1
    return-void
.end method
