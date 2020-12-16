.class public Lcom/trendmicro/hippo/ast/Jump;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "Jump.java"


# instance fields
.field private jumpNode:Lcom/trendmicro/hippo/ast/Jump;

.field public target:Lcom/trendmicro/hippo/Node;

.field private target2:Lcom/trendmicro/hippo/Node;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    .line 27
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "nodeType"    # I

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 30
    iput p1, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "lineno"    # I

    .line 34
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Jump;-><init>(I)V

    .line 35
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/Jump;->setLineno(I)V

    .line 36
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/Node;)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;

    .line 39
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/Jump;-><init>(I)V

    .line 40
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/Jump;->addChildToBack(Lcom/trendmicro/hippo/Node;)V

    .line 41
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/Node;I)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "child"    # Lcom/trendmicro/hippo/Node;
    .param p3, "lineno"    # I

    .line 44
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/Jump;-><init>(ILcom/trendmicro/hippo/Node;)V

    .line 45
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/Jump;->setLineno(I)V

    .line 46
    return-void
.end method


# virtual methods
.method public getContinue()Lcom/trendmicro/hippo/Node;
    .locals 2

    .line 106
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x85

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->target2:Lcom/trendmicro/hippo/Node;

    return-object v0
.end method

.method public getDefault()Lcom/trendmicro/hippo/Node;
    .locals 2

    .line 64
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x73

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->target2:Lcom/trendmicro/hippo/Node;

    return-object v0
.end method

.method public getFinally()Lcom/trendmicro/hippo/Node;
    .locals 2

    .line 78
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x52

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->target2:Lcom/trendmicro/hippo/Node;

    return-object v0
.end method

.method public getJumpStatement()Lcom/trendmicro/hippo/ast/Jump;
    .locals 2

    .line 50
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x79

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x7a

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->jumpNode:Lcom/trendmicro/hippo/ast/Jump;

    return-object v0
.end method

.method public getLoop()Lcom/trendmicro/hippo/ast/Jump;
    .locals 2

    .line 92
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x83

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->jumpNode:Lcom/trendmicro/hippo/ast/Jump;

    return-object v0
.end method

.method public setContinue(Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "continueTarget"    # Lcom/trendmicro/hippo/Node;

    .line 112
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x85

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 113
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x84

    if-eq v0, v1, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 114
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->target2:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 115
    :cond_2
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Jump;->target2:Lcom/trendmicro/hippo/Node;

    .line 116
    return-void
.end method

.method public setDefault(Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "defaultTarget"    # Lcom/trendmicro/hippo/Node;

    .line 70
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x73

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 71
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x84

    if-eq v0, v1, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->target2:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 73
    :cond_2
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Jump;->target2:Lcom/trendmicro/hippo/Node;

    .line 74
    return-void
.end method

.method public setFinally(Lcom/trendmicro/hippo/Node;)V
    .locals 2
    .param p1, "finallyTarget"    # Lcom/trendmicro/hippo/Node;

    .line 84
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x52

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 85
    :cond_0
    invoke-virtual {p1}, Lcom/trendmicro/hippo/Node;->getType()I

    move-result v0

    const/16 v1, 0x84

    if-eq v0, v1, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 86
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->target2:Lcom/trendmicro/hippo/Node;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 87
    :cond_2
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Jump;->target2:Lcom/trendmicro/hippo/Node;

    .line 88
    return-void
.end method

.method public setJumpStatement(Lcom/trendmicro/hippo/ast/Jump;)V
    .locals 2
    .param p1, "jumpStatement"    # Lcom/trendmicro/hippo/ast/Jump;

    .line 56
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x79

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x7a

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 57
    :cond_0
    if-nez p1, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->jumpNode:Lcom/trendmicro/hippo/ast/Jump;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 59
    :cond_2
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Jump;->jumpNode:Lcom/trendmicro/hippo/ast/Jump;

    .line 60
    return-void
.end method

.method public setLoop(Lcom/trendmicro/hippo/ast/Jump;)V
    .locals 2
    .param p1, "loop"    # Lcom/trendmicro/hippo/ast/Jump;

    .line 98
    iget v0, p0, Lcom/trendmicro/hippo/ast/Jump;->type:I

    const/16 v1, 0x83

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 99
    :cond_0
    if-nez p1, :cond_1

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 100
    :cond_1
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/Jump;->jumpNode:Lcom/trendmicro/hippo/ast/Jump;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/trendmicro/hippo/ast/Jump;->codeBug()Ljava/lang/RuntimeException;

    .line 101
    :cond_2
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/Jump;->jumpNode:Lcom/trendmicro/hippo/ast/Jump;

    .line 102
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 2
    .param p1, "depth"    # I

    .line 130
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Jump;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "visitor"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 125
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-virtual {p0}, Lcom/trendmicro/hippo/ast/Jump;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
