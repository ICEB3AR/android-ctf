.class public Lcom/trendmicro/hippo/ast/DoLoop;
.super Lcom/trendmicro/hippo/ast/Loop;
.source "DoLoop.java"


# instance fields
.field private condition:Lcom/trendmicro/hippo/ast/AstNode;

.field private whilePosition:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Loop;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->whilePosition:I

    .line 23
    const/16 v0, 0x77

    iput v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->type:I

    .line 27
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 30
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Loop;-><init>(I)V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->whilePosition:I

    .line 23
    const/16 v0, 0x77

    iput v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Loop;-><init>(II)V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->whilePosition:I

    .line 23
    const/16 v0, 0x77

    iput v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->type:I

    .line 35
    return-void
.end method


# virtual methods
.method public getCondition()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getWhilePosition()I
    .locals 1

    .line 58
    iget v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->whilePosition:I

    return v0
.end method

.method public setCondition(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "condition"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 49
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/DoLoop;->assertNotNull(Ljava/lang/Object;)V

    .line 50
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/DoLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    .line 51
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 52
    return-void
.end method

.method public setWhilePosition(I)V
    .locals 0
    .param p1, "whilePosition"    # I

    .line 65
    iput p1, p0, Lcom/trendmicro/hippo/ast/DoLoop;->whilePosition:I

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/DoLoop;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    const-string v1, "do "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/DoLoop;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 74
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/DoLoop;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/DoLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    const-string v1, " while ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/DoLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    const-string v1, ");\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 88
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 90
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/DoLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 92
    :cond_0
    return-void
.end method
