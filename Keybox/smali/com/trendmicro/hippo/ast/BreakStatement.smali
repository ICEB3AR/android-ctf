.class public Lcom/trendmicro/hippo/ast/BreakStatement;
.super Lcom/trendmicro/hippo/ast/Jump;
.source "BreakStatement.java"


# instance fields
.field private breakLabel:Lcom/trendmicro/hippo/ast/Name;

.field private target:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 23
    const/16 v0, 0x79

    iput v0, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->type:I

    .line 27
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 23
    const/16 v0, 0x79

    iput v0, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->type:I

    .line 31
    iput p1, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->position:I

    .line 32
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 34
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 23
    const/16 v0, 0x79

    iput v0, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->type:I

    .line 35
    iput p1, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->position:I

    .line 36
    iput p2, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->length:I

    .line 37
    return-void
.end method


# virtual methods
.method public getBreakLabel()Lcom/trendmicro/hippo/ast/Name;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->breakLabel:Lcom/trendmicro/hippo/ast/Name;

    return-object v0
.end method

.method public getBreakTarget()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->target:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setBreakLabel(Lcom/trendmicro/hippo/ast/Name;)V
    .locals 0
    .param p1, "label"    # Lcom/trendmicro/hippo/ast/Name;

    .line 55
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->breakLabel:Lcom/trendmicro/hippo/ast/Name;

    .line 56
    if-eqz p1, :cond_0

    .line 57
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Name;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 58
    :cond_0
    return-void
.end method

.method public setBreakTarget(Lcom/trendmicro/hippo/ast/Jump;)V
    .locals 0
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/Jump;

    .line 75
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/BreakStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 76
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->target:Lcom/trendmicro/hippo/ast/AstNode;

    .line 77
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/BreakStatement;->setJumpStatement(Lcom/trendmicro/hippo/ast/Jump;)V

    .line 78
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/BreakStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    const-string v1, "break"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->breakLabel:Lcom/trendmicro/hippo/ast/Name;

    if-eqz v1, :cond_0

    .line 86
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->breakLabel:Lcom/trendmicro/hippo/ast/Name;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/Name;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    :cond_0
    const-string v1, ";\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 98
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/BreakStatement;->breakLabel:Lcom/trendmicro/hippo/ast/Name;

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Name;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 101
    :cond_0
    return-void
.end method
