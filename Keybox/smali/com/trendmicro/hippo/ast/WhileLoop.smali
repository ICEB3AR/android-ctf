.class public Lcom/trendmicro/hippo/ast/WhileLoop;
.super Lcom/trendmicro/hippo/ast/Loop;
.source "WhileLoop.java"


# instance fields
.field private condition:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Loop;-><init>()V

    .line 22
    const/16 v0, 0x76

    iput v0, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->type:I

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 29
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Loop;-><init>(I)V

    .line 22
    const/16 v0, 0x76

    iput v0, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Loop;-><init>(II)V

    .line 22
    const/16 v0, 0x76

    iput v0, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->type:I

    .line 34
    return-void
.end method


# virtual methods
.method public getCondition()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setCondition(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "condition"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 48
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/WhileLoop;->assertNotNull(Ljava/lang/Object;)V

    .line 49
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    .line 50
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 51
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 4
    .param p1, "depth"    # I

    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/WhileLoop;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    const-string v1, "while ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/WhileLoop;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    const-string v2, "\n"

    if-eqz v1, :cond_0

    .line 61
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/WhileLoop;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    add-int/lit8 v3, p1, 0x1

    invoke-virtual {v1, v3}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v1

    const/16 v3, 0x82

    if-ne v1, v3, :cond_1

    .line 64
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 67
    :cond_1
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/WhileLoop;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-nez v1, :cond_2

    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    :cond_2
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 80
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 82
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/WhileLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 84
    :cond_0
    return-void
.end method
