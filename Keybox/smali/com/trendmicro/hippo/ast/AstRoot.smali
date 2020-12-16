.class public Lcom/trendmicro/hippo/ast/AstRoot;
.super Lcom/trendmicro/hippo/ast/ScriptNode;
.source "AstRoot.java"


# instance fields
.field private comments:Ljava/util/SortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedSet<",
            "Lcom/trendmicro/hippo/ast/Comment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/ScriptNode;-><init>()V

    .line 30
    const/16 v0, 0x89

    iput v0, p0, Lcom/trendmicro/hippo/ast/AstRoot;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 37
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/ScriptNode;-><init>(I)V

    .line 30
    const/16 v0, 0x89

    iput v0, p0, Lcom/trendmicro/hippo/ast/AstRoot;->type:I

    .line 38
    return-void
.end method


# virtual methods
.method public addComment(Lcom/trendmicro/hippo/ast/Comment;)V
    .locals 2
    .param p1, "comment"    # Lcom/trendmicro/hippo/ast/Comment;

    .line 70
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/AstRoot;->assertNotNull(Ljava/lang/Object;)V

    .line 71
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstRoot;->comments:Ljava/util/SortedSet;

    if-nez v0, :cond_0

    .line 72
    new-instance v0, Ljava/util/TreeSet;

    new-instance v1, Lcom/trendmicro/hippo/ast/AstNode$PositionComparator;

    invoke-direct {v1}, Lcom/trendmicro/hippo/ast/AstNode$PositionComparator;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/AstRoot;->comments:Ljava/util/SortedSet;

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstRoot;->comments:Ljava/util/SortedSet;

    invoke-interface {v0, p1}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 75
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Comment;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 76
    return-void
.end method

.method public checkParentLinks()V
    .locals 1

    .line 133
    new-instance v0, Lcom/trendmicro/hippo/ast/AstRoot$1;

    invoke-direct {v0, p0}, Lcom/trendmicro/hippo/ast/AstRoot$1;-><init>(Lcom/trendmicro/hippo/ast/AstRoot;)V

    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/AstRoot;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 146
    return-void
.end method

.method public debugPrint()Ljava/lang/String;
    .locals 3

    .line 122
    new-instance v0, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x3e8

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-direct {v0, v1}, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;-><init>(Ljava/lang/StringBuilder;)V

    .line 123
    .local v0, "dpv":Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;
    invoke-virtual {p0, v0}, Lcom/trendmicro/hippo/ast/AstRoot;->visitAll(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 124
    invoke-virtual {v0}, Lcom/trendmicro/hippo/ast/AstNode$DebugPrintVisitor;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getComments()Ljava/util/SortedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedSet<",
            "Lcom/trendmicro/hippo/ast/Comment;",
            ">;"
        }
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstRoot;->comments:Ljava/util/SortedSet;

    return-object v0
.end method

.method public setComments(Ljava/util/SortedSet;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/SortedSet<",
            "Lcom/trendmicro/hippo/ast/Comment;",
            ">;)V"
        }
    .end annotation

    .line 54
    .local p1, "comments":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Lcom/trendmicro/hippo/ast/Comment;>;"
    if-nez p1, :cond_0

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/AstRoot;->comments:Ljava/util/SortedSet;

    goto :goto_1

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstRoot;->comments:Ljava/util/SortedSet;

    if-eqz v0, :cond_1

    .line 58
    invoke-interface {v0}, Ljava/util/SortedSet;->clear()V

    .line 59
    :cond_1
    invoke-interface {p1}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/Comment;

    .line 60
    .local v1, "c":Lcom/trendmicro/hippo/ast/Comment;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/AstRoot;->addComment(Lcom/trendmicro/hippo/ast/Comment;)V

    .end local v1    # "c":Lcom/trendmicro/hippo/ast/Comment;
    goto :goto_0

    .line 62
    :cond_2
    :goto_1
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 5
    .param p1, "depth"    # I

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/AstRoot;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/Node;

    .line 109
    .local v2, "node":Lcom/trendmicro/hippo/Node;
    move-object v3, v2

    check-cast v3, Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v3, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    invoke-virtual {v2}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v3

    const/16 v4, 0xa2

    if-ne v3, v4, :cond_0

    .line 111
    const-string v3, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .end local v2    # "node":Lcom/trendmicro/hippo/Node;
    :cond_0
    goto :goto_0

    .line 114
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visitAll(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 0
    .param p1, "visitor"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 101
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/AstRoot;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 102
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/AstRoot;->visitComments(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 103
    return-void
.end method

.method public visitComments(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "visitor"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 86
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/AstRoot;->comments:Ljava/util/SortedSet;

    if-eqz v0, :cond_0

    .line 87
    invoke-interface {v0}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/Comment;

    .line 88
    .local v1, "c":Lcom/trendmicro/hippo/ast/Comment;
    invoke-interface {p1, v1}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    .line 89
    .end local v1    # "c":Lcom/trendmicro/hippo/ast/Comment;
    goto :goto_0

    .line 91
    :cond_0
    return-void
.end method
