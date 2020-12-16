.class public Lcom/trendmicro/hippo/ast/ElementGet;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "ElementGet.java"


# instance fields
.field private element:Lcom/trendmicro/hippo/ast/AstNode;

.field private lb:I

.field private rb:I

.field private target:Lcom/trendmicro/hippo/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->lb:I

    .line 27
    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->rb:I

    .line 30
    const/16 v0, 0x24

    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 37
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->lb:I

    .line 27
    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->rb:I

    .line 30
    const/16 v0, 0x24

    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->type:I

    .line 38
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 41
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->lb:I

    .line 27
    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->rb:I

    .line 30
    const/16 v0, 0x24

    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->type:I

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/trendmicro/hippo/ast/AstNode;Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 1
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;
    .param p2, "element"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 44
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->lb:I

    .line 27
    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->rb:I

    .line 30
    const/16 v0, 0x24

    iput v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->type:I

    .line 45
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ElementGet;->setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 46
    invoke-virtual {p0, p2}, Lcom/trendmicro/hippo/ast/ElementGet;->setElement(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 47
    return-void
.end method


# virtual methods
.method public getElement()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->element:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public getLb()I
    .locals 1

    .line 89
    iget v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->lb:I

    return v0
.end method

.method public getRb()I
    .locals 1

    .line 103
    iget v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->rb:I

    return v0
.end method

.method public getTarget()Lcom/trendmicro/hippo/ast/AstNode;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->target:Lcom/trendmicro/hippo/ast/AstNode;

    return-object v0
.end method

.method public setElement(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "element"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 80
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ElementGet;->assertNotNull(Ljava/lang/Object;)V

    .line 81
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ElementGet;->element:Lcom/trendmicro/hippo/ast/AstNode;

    .line 82
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 83
    return-void
.end method

.method public setLb(I)V
    .locals 0
    .param p1, "lb"    # I

    .line 96
    iput p1, p0, Lcom/trendmicro/hippo/ast/ElementGet;->lb:I

    .line 97
    return-void
.end method

.method public setParens(II)V
    .locals 0
    .param p1, "lb"    # I
    .param p2, "rb"    # I

    .line 114
    iput p1, p0, Lcom/trendmicro/hippo/ast/ElementGet;->lb:I

    .line 115
    iput p2, p0, Lcom/trendmicro/hippo/ast/ElementGet;->rb:I

    .line 116
    return-void
.end method

.method public setRb(I)V
    .locals 0
    .param p1, "rb"    # I

    .line 110
    iput p1, p0, Lcom/trendmicro/hippo/ast/ElementGet;->rb:I

    .line 111
    return-void
.end method

.method public setTarget(Lcom/trendmicro/hippo/ast/AstNode;)V
    .locals 0
    .param p1, "target"    # Lcom/trendmicro/hippo/ast/AstNode;

    .line 63
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ElementGet;->assertNotNull(Ljava/lang/Object;)V

    .line 64
    iput-object p1, p0, Lcom/trendmicro/hippo/ast/ElementGet;->target:Lcom/trendmicro/hippo/ast/AstNode;

    .line 65
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/AstNode;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 66
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 3
    .param p1, "depth"    # I

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/ElementGet;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ElementGet;->target:Lcom/trendmicro/hippo/ast/AstNode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/ElementGet;->element:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v1, v2}, Lcom/trendmicro/hippo/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 1
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 134
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->target:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 136
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/ElementGet;->element:Lcom/trendmicro/hippo/ast/AstNode;

    invoke-virtual {v0, p1}, Lcom/trendmicro/hippo/ast/AstNode;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 138
    :cond_0
    return-void
.end method
