.class public Lcom/trendmicro/hippo/ast/ContinueStatement;
.super Lcom/trendmicro/hippo/ast/Jump;
.source "ContinueStatement.java"


# instance fields
.field private label:Lcom/trendmicro/hippo/ast/Name;

.field private target:Lcom/trendmicro/hippo/ast/Loop;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 24
    const/16 v0, 0x7a

    iput v0, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->type:I

    .line 28
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 31
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/trendmicro/hippo/ast/ContinueStatement;-><init>(II)V

    .line 32
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 34
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 24
    const/16 v0, 0x7a

    iput v0, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->type:I

    .line 36
    iput p1, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->position:I

    .line 37
    iput p2, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->length:I

    .line 38
    return-void
.end method

.method public constructor <init>(IILcom/trendmicro/hippo/ast/Name;)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "len"    # I
    .param p3, "label"    # Lcom/trendmicro/hippo/ast/Name;

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/ContinueStatement;-><init>(II)V

    .line 51
    invoke-virtual {p0, p3}, Lcom/trendmicro/hippo/ast/ContinueStatement;->setLabel(Lcom/trendmicro/hippo/ast/Name;)V

    .line 52
    return-void
.end method

.method public constructor <init>(ILcom/trendmicro/hippo/ast/Name;)V
    .locals 0
    .param p1, "pos"    # I
    .param p2, "label"    # Lcom/trendmicro/hippo/ast/Name;

    .line 45
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/ContinueStatement;-><init>(I)V

    .line 46
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/ContinueStatement;->setLabel(Lcom/trendmicro/hippo/ast/Name;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/Name;)V
    .locals 1
    .param p1, "label"    # Lcom/trendmicro/hippo/ast/Name;

    .line 40
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/Jump;-><init>()V

    .line 24
    const/16 v0, 0x7a

    iput v0, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->type:I

    .line 41
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ContinueStatement;->setLabel(Lcom/trendmicro/hippo/ast/Name;)V

    .line 42
    return-void
.end method


# virtual methods
.method public getLabel()Lcom/trendmicro/hippo/ast/Name;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->label:Lcom/trendmicro/hippo/ast/Name;

    return-object v0
.end method

.method public getTarget()Lcom/trendmicro/hippo/ast/Loop;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->target:Lcom/trendmicro/hippo/ast/Loop;

    return-object v0
.end method

.method public setLabel(Lcom/trendmicro/hippo/ast/Name;)V
    .locals 0
    .param p1, "label"    # Lcom/trendmicro/hippo/ast/Name;

    .line 88
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->label:Lcom/trendmicro/hippo/ast/Name;

    .line 89
    if-eqz p1, :cond_0

    .line 90
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/Name;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 91
    :cond_0
    return-void
.end method

.method public setTarget(Lcom/trendmicro/hippo/ast/Loop;)V
    .locals 0
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/Loop;

    .line 68
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ContinueStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 69
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->target:Lcom/trendmicro/hippo/ast/Loop;

    .line 70
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ContinueStatement;->setJumpStatement(Lcom/trendmicro/hippo/ast/Jump;)V

    .line 71
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ContinueStatement;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    const-string v1, "continue"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->label:Lcom/trendmicro/hippo/ast/Name;

    if-eqz v1, :cond_0

    .line 99
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->label:Lcom/trendmicro/hippo/ast/Name;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/Name;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    :cond_0
    const-string v1, ";\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 111
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ContinueStatement;->label:Lcom/trendmicro/hippo/ast/Name;

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/Name;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 114
    :cond_0
    return-void
.end method
