.class public Lcom/trendmicro/hippo/ast/ForLoop;
.super Lcom/trendmicro/hippo/ast/Loop;
.source "ForLoop.java"


# instance fields
.field private condition:Lcom/trendmicro/hippo/ast/AstNode;

.field private increment:Lcom/trendmicro/hippo/ast/AstNode;

.field private initializer:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Loop;-><init>()V

    .line 25
    const/16 v0, 0x78

    iput v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->type:I

    .line 29
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 32
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Loop;-><init>(I)V

    .line 25
    const/16 v0, 0x78

    iput v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 36
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Loop;-><init>(II)V

    .line 25
    const/16 v0, 0x78

    iput v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->type:I

    .line 37
    return-void
.end method


# virtual methods
.method public getCondition()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getIncrement()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->increment:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getInitializer()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->initializer:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setCondition(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "condition"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 77
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ForLoop;->assertNotNull(Ljava/lang/Object;)V

    .line 78
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ForLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    .line 79
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 80
    return-void
.end method

.method public setIncrement(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "increment"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 97
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ForLoop;->assertNotNull(Ljava/lang/Object;)V

    .line 98
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ForLoop;->increment:Lcom/trendmicro/hippo/ast/AstNode;

    .line 99
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 100
    return-void
.end method

.method public setInitializer(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "initializer"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 58
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ForLoop;->assertNotNull(Ljava/lang/Object;)V

    .line 59
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ForLoop;->initializer:Lcom/trendmicro/hippo/ast/AstNode;

    .line 60
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 61
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 4
    .param p1, "depth"    # I

    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ForLoop;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    const-string v1, "for ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForLoop;->initializer:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    const-string v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    iget-object v3, p0, Lcom/trendmicro/hippo/ast/ForLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v3, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForLoop;->increment:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ForLoop;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    const-string v2, "\n"

    if-eqz v1, :cond_0

    .line 114
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ForLoop;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    :cond_0
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1}, Lcom/trendmicro/hippo/ast/AstNode;->getType()I

    move-result v1

    const/16 v3, 0x82

    if-ne v1, v3, :cond_2

    .line 117
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    .line 118
    .local v1, "bodySource":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ForLoop;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v3

    if-nez v3, :cond_1

    .line 119
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 121
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .end local v1    # "bodySource":Ljava/lang/String;
    goto :goto_0

    .line 123
    :cond_2
    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/ForLoop;->getInlineComment()Lcom/trendmicro/hippo/ast/AstNode;

    move-result-object v1

    if-nez v1, :cond_3

    .line 124
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    :cond_3
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ForLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 137
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->initializer:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 139
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->condition:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 140
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->increment:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 141
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ForLoop;->body:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 143
    :cond_0
    return-void
.end method
