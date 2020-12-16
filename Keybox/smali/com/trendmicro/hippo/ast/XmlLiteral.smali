.class public Lcom/trendmicro/hippo/ast/XmlLiteral;
.super Lcom/trendmicro/hippo/ast/AstNode;
.source "XmlLiteral.java"


# instance fields
.field private fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/XmlFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Lcom/trendmicro/hippo/ast/AstNode;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->fragments:Ljava/util/List;

    .line 26
    const/16 v0, 0x92

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "pos"    # I

    .line 33
    invoke-direct {p0, p1}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(I)V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->fragments:Ljava/util/List;

    .line 26
    const/16 v0, 0x92

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .line 37
    invoke-direct {p0, p1, p2}, Lcom/trendmicro/hippo/ast/AstNode;-><init>(II)V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->fragments:Ljava/util/List;

    .line 26
    const/16 v0, 0x92

    iput v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->type:I

    .line 38
    return-void
.end method


# virtual methods
.method public addFragment(Lcom/trendmicro/hippo/ast/XmlFragment;)V
    .locals 1
    .param p1, "fragment"    # Lcom/trendmicro/hippo/ast/XmlFragment;

    .line 65
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 66
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    invoke-virtual {p1, p0}, Lcom/trendmicro/hippo/ast/XmlFragment;->setParent(Lcom/trendmicro/hippo/ast/AstNode;)V

    .line 68
    return-void
.end method

.method public getFragments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/XmlFragment;",
            ">;"
        }
    .end annotation

    .line 44
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->fragments:Ljava/util/List;

    return-object v0
.end method

.method public setFragments(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trendmicro/hippo/ast/XmlFragment;",
            ">;)V"
        }
    .end annotation

    .line 54
    .local p1, "fragments":Ljava/util/List;, "Ljava/util/List<Lcom/trendmicro/hippo/ast/XmlFragment;>;"
    invoke-virtual {p0, p1}, Lcom/trendmicro/hippo/ast/XmlLiteral;->assertNotNull(Ljava/lang/Object;)V

    .line 55
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 56
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/XmlFragment;

    .line 57
    .local v1, "fragment":Lcom/trendmicro/hippo/ast/XmlFragment;
    invoke-virtual {p0, v1}, Lcom/trendmicro/hippo/ast/XmlLiteral;->addFragment(Lcom/trendmicro/hippo/ast/XmlFragment;)V

    .end local v1    # "fragment":Lcom/trendmicro/hippo/ast/XmlFragment;
    goto :goto_0

    .line 58
    :cond_0
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .locals 4
    .param p1, "depth"    # I

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xfa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 73
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->fragments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trendmicro/hippo/ast/XmlFragment;

    .line 74
    .local v2, "frag":Lcom/trendmicro/hippo/ast/XmlFragment;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/trendmicro/hippo/ast/XmlFragment;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .end local v2    # "frag":Lcom/trendmicro/hippo/ast/XmlFragment;
    goto :goto_0

    .line 76
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V
    .locals 2
    .param p1, "v"    # Lcom/trendmicro/hippo/ast/NodeVisitor;

    .line 84
    invoke-interface {p1, p0}, Lcom/trendmicro/hippo/ast/NodeVisitor;->visit(Lcom/trendmicro/hippo/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/trendmicro/hippo/ast/XmlLiteral;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trendmicro/hippo/ast/XmlFragment;

    .line 86
    .local v1, "frag":Lcom/trendmicro/hippo/ast/XmlFragment;
    invoke-virtual {v1, p1}, Lcom/trendmicro/hippo/ast/XmlFragment;->visit(Lcom/trendmicro/hippo/ast/NodeVisitor;)V

    .line 87
    .end local v1    # "frag":Lcom/trendmicro/hippo/ast/XmlFragment;
    goto :goto_0

    .line 89
    :cond_0
    return-void
.end method
